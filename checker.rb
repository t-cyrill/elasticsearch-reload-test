require 'rubygems'
require 'bundler/setup'
require 'elasticsearch'

client = Elasticsearch::Client.new log: true, hosts: ['127.0.0.1:19201', '127.0.0.1:19202'], reload_on_failure: true

# p client
# exit

loop do
  client.search index: 'example', body: { query: { match: { id: 1 } } }
  p client.transport.connections.size
  sleep 1
end

