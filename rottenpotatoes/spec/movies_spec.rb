require 'simplecov'
SimpleCov.start 'rails'
require 'rails_helper'

describe MoviesController, type: :controller do
  describe "#new" do
    context "When create a movie" do
      it "should create it to database" do
        movie_new = Hash.new
        movie_new["title"] = "test_movie"
        movie_new["rating"] = "R"
        movie_new["release_date"] = Date.new(1892, 5, 11)
        movie_new["director"] = "test_director"

        post :create, movie: movie_new
        expect(response).to redirect_to("/movies")
      end
    end
  end
  
  describe "#sort"do
    context "When sort by title" do
      it "should sort all movies by title" do
        get :index, :sort => :title, :ratings => ["G","PG", "PG-13", "R"]
      end
    end
    
    context "When sort by release_date" do
      it "should sort all movies by release_date" do
        get :index, :sort => :release_date, :ratings => ["G","PG", "PG-13", "R"]
      end
    end
    
    context "When sort by director" do
      it "should sort all movies by director's name" do
        get :index, :sort => :director, :ratings => ["G","PG", "PG-13", "R"]
      end
    end
    
  end
end