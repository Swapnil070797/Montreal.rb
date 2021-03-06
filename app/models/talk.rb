# frozen_string_literal: true

class Talk < ActiveRecord::Base
  extend Enumerize
  STATES  = %i(proposed scheduled presented).freeze
  FORMATS = %i(full half lightning).freeze
  LEVELS  = %i(beginner intermediate advanced).freeze

  translates :title, :description
  # Someday, we should be able to remove those lines
  attribute :title
  attribute :description

  belongs_to :event, counter_cache: true, inverse_of: :talks
  belongs_to :member

  validates :title,  presence: true
  validates :member, presence: true

  enumerize :state,  in: STATES
  enumerize :format, in: FORMATS
  enumerize :level,  in: LEVELS
end
