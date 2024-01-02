class AuthenticationController < ApplicationController
  def new
    # Any setup needed for the registration view
  end
  def create
    api_gateway_endpoint = "https://rytwgdtrai.execute-api.us-east-1.amazonaws.com/test/register"

    response = Faraday.post(api_gateway_endpoint) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { email: params[:email], password: params[:password] }.to_json
    end

    if response.status == 200
      redirect_to root_path
    else
      @error = "Invalid email or password"
      render :new
    end

    
  end
end