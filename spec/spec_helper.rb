# frozen_string_literal: true

ENV["RACK_ENV"] = "test"

require "rack/test"
require "webmock/rspec"
require File.expand_path "../app.rb", __dir__

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include RSpecMixin

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

# Specifying seed to control randomness in the tests
srand 51_885
