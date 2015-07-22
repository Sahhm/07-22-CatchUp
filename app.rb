require "pry"

require "sinatra"
require "sinatra/reloader"

require "sqlite3"
require "bcrypt"

require "active_record"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'database.db')
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)


unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.text :password
   
  end  
end

require_relative "models/user.rb"

require_relative "controllers/users_controller.rb"
