require "elasticsearch/model"

class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  class << self
    def search query
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ['title', 'content']
            }
          },
          highlight: {
            pre_tags: ['<span class="highlight">'],
            post_tags: ['</span>'],
            fields: {
              title: {},
              content: {}
            }
          }
        }
      )
    end
  end
end