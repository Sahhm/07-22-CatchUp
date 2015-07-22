get "/users/new" do
  erb :"users/new"
end

get "/users/create" do
  email = params["email"]
  password = params["password"]
  
  the_password = BCrypt::Password.create(password)
  
  User.create({email: 'email', password: 'the_password'})
  
  erb :"users/success"
end