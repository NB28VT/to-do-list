require 'sinatra'


set :public_folder, File.dirname(__FILE__) + '/public'
# Default, not neccesary but just to look at
set :views, File.dirname(__FILE__) + '/views'


get '/' do
  @tasks = File.readlines('tasks')
  erb :index
end


post '/tasks' do
  # read the input from the form the user filled out
  task = params['task_name']

  # Open the "tasks" file and append the task
  File.open('tasks', 'a') do |file|
    file.puts(task)
  end
  redirect '/'
end
