class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do 
    messages = Message.all.order(created_at: :asc)
    messages.to_json
  end 

  post '/messages' do
  new_message = Message.create(
    body: params[:body],
    username: params[:username]
  ) 
  new_message.to_json
  end 

  patch '/messages/:id' do 
    update_message = Message.find(params[:id])
    update_message.update(
      body: params[:body]
    )
    update_message.to_json
  end 

  delete '/messages/:id' do 
    delete_message = Message.find(params[:id])
    delete_message.destroy 
  end 
end
