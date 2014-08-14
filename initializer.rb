require 'rubygems'
require 'bundler/setup'
require 'elasticsearch'
require 'faker'

client = Elasticsearch::Client.new log: true, hosts: ['127.0.0.1:19201', '127.0.0.1:19202'], retry_on_failure: 2, reload_connections: 5

20.times do |i|
  client.index index: 'example', type: 'test', body: {
    id: i+1,
    user: Faker::Name.name,
    post_date: Time.now.utc.iso8601,
    message: Faker::Lorem.paragraph(2)
  }
end
