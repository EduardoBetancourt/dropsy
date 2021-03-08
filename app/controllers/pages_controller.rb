require 'csv'

class PagesController < ApplicationController
  def index
    @workouts = Workout.all
    @wod = Workout.all[0]
  end

  def upload_csv
    CSV.foreach('db/csv/workouts.csv', headers: true) do |row|
      Workout.create(date: row[0], description: row[1])
    end
  end
end