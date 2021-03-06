# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  userPhoto       :text
#  name            :text
#  email           :text
#  joinedDate      :date
#  dob             :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  location        :text
#  admin           :boolean
#

class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 3}

  has_many :posts
  has_many :photos
  # has_many :likes
  has_many :comments
  has_many :relationships
  # has_many :active_relationships,  class_name:  "Relationship",
  #                                  foreign_key: "follower_id",
  #                                  dependent: :destroy
  # has_many :passive_relationships, class_name:  "Relationship",
  #                                  foreign_key: "followed_id",
  #                                  dependent: :destroy
  # has_many :following, through: :active_relationships,  source: :followed
  # has_many :followers, through: :passive_relationships, source: :follower

  # Follows a user.
  # def follow(other_user)
  #   following << other_user
  # end
  #
  # # Unfollows a user.
  # def unfollow(other_user)
  #   following.delete(other_user)
  # end
  #
  # # Returns true if the current user is following the other user.
  # def following?(other_user)
  #   following.include?(other_user)
  # end

end
