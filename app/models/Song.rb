class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods

  belongs_to :genre
  belongs_to :artist 
end