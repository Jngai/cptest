require 'net/http'
require 'json'

class EventsController < ApplicationController
    def index
    end

    def events
      owner = event_params["owner"]
      repo =  event_params["repo"]
      event_type = event_params["event_type"]
      uri = URI("https://api.github.com/repos/#{owner}/#{repo}/events")
      response = JSON.parse(Net::HTTP.get(uri))
      response = response.select{|item| item["type"] == event_type }
      render json: response, status: 200
    end

    def event_params
      params.permit(:owner, :repo, :event_type)
    end
end
