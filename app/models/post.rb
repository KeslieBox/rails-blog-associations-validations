class Post < ActiveRecord::Base
    has_many :tags
    belongs_to :user
    validates_presence_of :name, :content
    
end
