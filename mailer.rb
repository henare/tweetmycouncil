require 'action_mailer'

if ENV['MAILGUN_SMTP_LOGIN'] && ENV['MAILGUN_SMTP_PASSWORD']
  ActionMailer::Base.smtp_settings = {
    :port           => ENV['MAILGUN_SMTP_PORT'],
    :address        => ENV['MAILGUN_SMTP_SERVER'],
    :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
    :password       => ENV['MAILGUN_SMTP_PASSWORD'],
    :domain         => 'tweetmycouncil.herokuapp.com',
    :authentication => :plain
  }
else
  # Send to Mailcatcher for development because it rocks!
  # gem install mailcatcher
  ActionMailer::Base.smtp_settings = {
    :address => "localhost", :port => 1025
  }
end

ActionMailer::Base.delivery_method = :smtp

class AuthorityMailer < ActionMailer::Base
  def email(to, message_text, message_url)
    mail(:to => to, :bcc => "contact@openaustralia.org", :from => "noreply@openaustraliafoundation.org.au",
      :subject => "A Citizen is contacting you via Twitter using Tweet My Council")
  end
end

# An example of how to use it
#AuthorityMailer.email("Hello Council!", "https://twitter.com/matthewlandauer/status/142786606087155712").deliver
