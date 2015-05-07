class User < ActiveRecord::Base
  has_secure_password
  has_many :notes
  validates :password, length: { minimum: 8 }
  validate :require_password_confirmation

  private
    def require_password_confirmation
      if password.present? && password != password_confirmation
        errors.add :password_confirmation, 'is required when setting your password'
      end
  end
end
