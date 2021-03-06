class FlightsController < ApplicationController

  def index
    @departing_flights = Flight.all.map {|f| [f.departure_airport.airport_code]}.uniq
    @arriving_flights = Flight.all.map {|f| [f.arrival_airport.airport_code]}.uniq
    @year_options = Flight.all.map { |f| f.takeoff.year }.uniq
    @month_options = Flight.all.map { |f| f.takeoff.month }.uniq
    @day_options = Flight.all.map { |f| f.takeoff.day }.uniq

    if params[:departure_airport] != nil 
      @departure_airport = Airport.where("airport_code = ?", params[:departure_airport]).first.id
      @arrival_airport = Airport.where("airport_code = ?", params[:arrival_airport]).first.id
      @search_results = Flight.where("departure_airport_id = ? AND arrival_airport_id = ?", @departure_airport, @arrival_airport)
    end

  end
end