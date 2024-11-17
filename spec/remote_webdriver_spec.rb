require 'spec_helper'
require 'selenium-webdriver'

RSpec.describe 'Remote WebDriver' do
  let(:selenium_grid_url) { "http://#{ENV['GRIDHOST']}:#{ENV['GRIDPORT']}/wd/hub" }
  let(:options) { Selenium::WebDriver::Options.chrome(args: ["window-size=1000,800"]) }
  let(:driver) { Selenium::WebDriver.for(:remote, url: selenium_grid_url, capabilities: options) }

  after(:each) do
    driver.quit
  end

  it 'navigates to Google and prints the page title' do
    driver.navigate.to "https://www.google.com"
    expect(driver.title).to eq("Google")
  end
end
