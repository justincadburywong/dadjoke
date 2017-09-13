
helpers do
  def boot_twilio
    account_sid = TWILIO_SID
    auth_token = TWILIO_TOKEN
    @twilio_number = TWILIO_NUMBER
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from_number = params["From"]
  end

  def send_message
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => fetch_joke
      )
  end

  def send_joke_text
    @url = 'https://icanhazdadjoke.com/'
    boot_twilio
    send_message
  end

end
