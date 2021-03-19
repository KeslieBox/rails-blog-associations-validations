class Post < ActiveRecord::Base
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :user
    validates_presence_of :name, :content 

    def tags_attributes=(tags_attributes)
        binding.pry

        tags_attributes.values.each do |tags_attribute|
            tag = Tag.find_or_create_by(:name, tags_attribute[:name])
            self.post_tags.build(tag: tag)
        end
    end
end
