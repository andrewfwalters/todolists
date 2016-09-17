# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Destroy existing data
User.destroy_all

#Seed the Database

#Users
my_users = []
my_users << User.create!({username:"fiorina",password_digest:"carly"})
my_users << User.create!({username:"trump",password_digest:"donald"})
my_users << User.create!({username:"carson",password_digest:"ben"})
my_users << User.create!({username:"clinton",password_digest:"hilary"})

#Profiles - one per user
Profile.create!({gender:"female",birth_year:1954,first_name:my_users[0].username,last_name:my_users[0].password_digest,user_id:my_users[0].id})
Profile.create!({gender:"male",birth_year:1946,first_name:my_users[1].username,last_name:my_users[1].password_digest,user_id:my_users[1].id})
Profile.create!({gender:"male",birth_year:1951,first_name:my_users[2].username,last_name:my_users[2].password_digest,user_id:my_users[2].id})
Profile.create!({gender:"female",birth_year:1947,first_name:my_users[3].username,last_name:my_users[3].password_digest,user_id:my_users[3].id})

#Lists - one per user
my_lists = []
my_lists << TodoList.create!({list_name:"Make HP Great Again",list_due_date:Date.today+1.year,user_id:my_users[0].id})
my_lists << TodoList.create!({list_name:"Make America Great Again",list_due_date:Date.today+1.year,user_id:my_users[1].id})
my_lists << TodoList.create!({list_name:"Just Be Insane",list_due_date:Date.today+1.year,user_id:my_users[2].id})
my_lists << TodoList.create!({list_name:"Don\'t be Trump",list_due_date:Date.today+1.year,user_id:my_users[3].id})

#List Items - 5 per list
#Create random strings for todo item titles and descriptions
alph = ('a'...'z').to_a
strings = (0...(my_lists.size*2*5)).to_a
strings = strings.map{(0...10).map{alph[rand(26)]}.to_a.join}
#Create todo items
my_lists.each do |list|
  (0..5).each do |i|
    TodoItem.create!({title:strings[i],description:strings[i+(2*my_lists.size)],todo_list_id:list.id,completed:false,due_date:list.list_due_date})
  end
end
