require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @hero_name = []
      @hero_power = []
      @hero_biography = []
      @team_heros = params[:team][:heros]
      @team_heros.each do |hero, skill|
        @hero_name << skill[:name]
        @hero_power << skill[:power]
        @hero_biography << skill[:biography]
        end

      erb :teams
    end
end
