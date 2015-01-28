require 'sinatra'
require 'sqlite3'
require 'pry'

db = SQLite3::Database.new "sqlpets.db"

get '/pets' do
  pets = db.execute("SELECT * FROM pets")
  erb :index, locals: {pets: pets}

end

post '/pet' do
  pets = db.execute("INSERT INTO pets (name, type) VALUES (?, ?)", params["name"], params["type"])
  redirect '/pets'
end

get '/pet/:id' do
  thispet = db.execute("SELECT * FROM pets where id =?", params["id"])
  erb :show, locals: {thispet: thispet}
end

put '/pet/:id' do
  pet = db.execute("UPDATE pets SET name=? WHERE id=?", params["newname"], params["id"])

  redirect '/pets'
end

delete '/pet/:id' do
  pet = db.execute("DELETE FROM pets WHERE id=?", params["id"])
  redirect '/pets'
 end
