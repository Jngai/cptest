require 'net/http'
require 'json'

class EventsController < ApplicationController
    def index
    end

    def events
      owner = event_params["owner"]
      repo =  event_params["repo"]
      uri = URI("https://api.github.com/repos/#{owner}/#{repo}/events")
      response = JSON.parse(Net::HTTP.get(uri))
    end

    def event_params
      params.permit(:owner, :repo)
    end
end
