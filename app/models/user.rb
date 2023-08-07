# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :username, uniqueness: true
  scope :all_except, ->(user) { where.not(id: user) }

  after_create_commit { broadcast_append_to 'users' }
end
