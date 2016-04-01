require 'sinatra'

userdb = {"adarsh" => 123, "ruby" => 2016}

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do    
  @user = params[:user]
  @pass = params[:pass]
  if ((userdb.keys.include? @user) and (userdb.values.include? @pass))  	
  	return erb :welcome
  else
  	return erb :fail
  end
end

get '/signup' do
  erb :signup	
end

post '/signup' do
  @user = params[:user]
  @pass = params[:pass]
  userdb.merge!({@user => @pass})
  return "Users: #{userdb.keys}", "Pass: #{userdb.values}"  
end

get '/*' do
  erb :sorry
end
