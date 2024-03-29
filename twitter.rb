require 'twitter'

@client =Twitter::REST::Client.new do |config|
  puts ENV["config.consumer_key"]
  puts ENV["config.consumer_secret"]
  puts ENV["config.access_token"]
  puts ENV["config.access_token_secret"]
end

def tutorial
  puts 'Welcome to  TwitterClient'
  puts "このクライアントを起動する際、末尾にオプションをつけてください"
  puts "-t HomeTimeLine取得"
  puts "-m リプライの取得"
  puts "-l リストの取得"
  puts 'ツイートしたい内容/ツイートする'
end

def homeTimeline
  @client.home_timeline.each do |tweet|
    puts '\e[33m' +tweet.user.name + '\e[32m' + '[ID:' +tweet.user.screen_name + ']'
    puts '\e[0m' + tweet.text
  end
end

def mentionTimeline
  @client.home_timeline.each do |tweet|
    puts '\e[33m' +tweet.user.name + '\e[32m' + '[ID:' +tweet.user.screen_name + ']'
    puts '\e[0m' + tweet.text
  end
end


def listTimeline
  @client.home_timeline.each do |tweet|
    puts '\e[33m' +tweet.user.name + '\e[32m' + '[ID:' +tweet.user.screen_name + ']'
    puts '\e[0m' + tweet.text
  end
end

def tweet
  @client.update(ARGV[0])
  puts 'Tweet now'
end

option = ARGV[0].to_s

if option == "" then
  tutorial
elsif option =="-t" then
  homeTimeline
elsif option == "-m" then
  mentionTimeline
elsif option == "-l" then
  listTimeline
else
  tweet
  homeTimeline
end
