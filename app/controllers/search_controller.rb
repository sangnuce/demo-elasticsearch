class SearchController < ApplicationController
  def index
    @posts =
      if params[:term].nil?
        Array.new
      else
        Post.search params[:term]
      end
  end
end
