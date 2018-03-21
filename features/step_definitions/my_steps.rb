

Given(/^that the browser is started$/) do
  @browser = Watir::Browser.new :firefox
end

And(/^user goes to tcc website$/) do
  @browser.goto 'http://www.taxcreditco.com'
end

And(/^wait until services tab is present$/) do
  @browser.a(:text => 'Services').wait_until_present
  @browser.a(:text => 'Services').click!
end

And(/^wait until Discover our Services div is present$/) do
  @div = @browser.div(:class => 'progress-bars').wait_until_present
end

Then(/^get http status code for each link$/) do
  urls = @div.links.map(&:href)

  urls.each_with_index do |link, index|
    @browser.goto link
    puts  " ================== Page #{index} ================== "
    puts 'Title: ' + @browser.title
    status_code = Net::HTTP.get_response(URI(link))
    puts 'Status code: '+ status_code.code
  end
end

Then(/^quit browser$/) do
  sleep 5
  @browser.quit
end

