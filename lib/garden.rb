require 'csv'
require "awesome_print"


# class Garden
#   def initialize(read_file)
#     @read_file =read_file
#   end
#
#   def return_hash
#
#   end
#
# end


file =[]

CSV.foreach("metrics.csv", :headers => true, :converters => :all) do |row|
  file << row[0]
end




# sorted by container number

i=0
num= file.length

arry_container1 =[]
arry_container2 =[]
arry_container3 =[]

while i < num  do
  container_num = file[i].split(/\W+/)[7]

  ph_1 = file[i].split(/\W+/)[8]
  ph_2 = file[i].split(/\W+/)[9]
  ph_complete = ph_1+ "." +ph_2

  nutrient = file[i].split(/\W+/)[10]

  temp = file[i].split(/\W+/)[11]

  water_1 = file[i].split(/\W+/)[12]
  water_2 = file[i].split(/\W+/)[13]
  water_complete = water_1+ "." +water_2



  if container_num=="container1"
  container_hash= {container_num =>[ {"ph"=>ph_complete.to_i}, {"nutrient"=>nutrient.to_i}, {"temp"=>temp.to_i}, {"water"=>water_complete.to_i}]}
  arry_container1 << container_hash

  elsif container_num=="container2"
    container_hash= {container_num =>[ {"ph"=>ph_complete.to_i}, {"nutrient"=>nutrient.to_i}, {"temp"=>temp.to_i}, {"water"=>water_complete.to_i}]}
    arry_container2 << container_hash

  elsif container_num=="container3"
    container_hash= {container_num =>[ {"ph"=>ph_complete.to_i}, {"nutrient"=>nutrient.to_i}, {"temp"=>temp.to_i}, {"water"=>water_complete.to_i}]}
    arry_container3 << container_hash

  end

  i +=1
end

# end sorted by container number


# -------------------------------------------------------------------


# average ph total for container1

num_con1=arry_container1.length
j=0
ph_arry =[]
while j < num_con1  do
  ph_arry << arry_container1[j]["container1"][0]["ph"]
  j +=1
end

puts (ph_arry.inject{|sum,x| sum + x })/num_con1


# end average ph total for container1


