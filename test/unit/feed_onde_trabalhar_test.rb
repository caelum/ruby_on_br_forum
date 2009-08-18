require File.dirname(__FILE__) + '/../test_helper'

class FeedOndeTrabalharTest < Test::Unit::TestCase
   include ApplicationHelper
   
  def test_should_show_error_message_when_url_is_invalid
    assert read_rss_feed('http://ondetrabalharrrrrr.com').include? "id='feedIndsp'" 
  end
  
  def test_should_show_feeds
    assert read_rss_feed.include? "id='feedOk'" 
  end
  
end
