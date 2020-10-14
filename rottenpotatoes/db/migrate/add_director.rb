class AddDirector < ActiveRecord::Migration
    def add
        add_colum :movies, :director, :string
    end
end