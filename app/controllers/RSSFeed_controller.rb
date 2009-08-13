require 'rss/2.0'
require 'open-uri'

class RssfeedController < ApplicationController

  def index
    feed_url = 'http://ondetrabalhar.com/vagas.rss'
    open(feed_url) do |http|
      response = http.read
      result = RSS::Parser.parse(response, false)
      output += "Feed Title: #{result.channel.title}<br />" 
      result.items.each_with_index do |item, i|
        output += "#{i+1}. #{item.title}<br />" if i &lt; 10  
      end  
    end
    render_text output
  end

end
