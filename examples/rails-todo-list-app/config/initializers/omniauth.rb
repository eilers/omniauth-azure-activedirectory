SETUP_PROC = lambda do |env|
    request = Rack::Request.new(env)
    #user = User.find_by_subdomain(request.subdomain)
    # TODO: find the organization by an id provided with the login path. This will give us the credentials..
    env['omniauth.strategy'].options[:client_id] = ENV['CLIENT_ID']         # if using omniauth-oauth2
    env['omniauth.strategy'].options[:tenant] = ENV['TENANT']   # if using omniauth-oauth2
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :azure_activedirectory, :setup => SETUP_PROC
end
