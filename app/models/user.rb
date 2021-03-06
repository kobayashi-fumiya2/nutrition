class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:nickname]

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /(?=.[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  has_many :foods
  has_many :favorites
end
