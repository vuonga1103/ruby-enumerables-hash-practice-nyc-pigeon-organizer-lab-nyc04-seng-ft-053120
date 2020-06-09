# def nyc_pigeon_organizer(data)
#   # Create an empty hash to add to
#   pigeon_list = {}
#
#   # Add pigeon names as keys into pigeon_list hash
#   data[:gender].each do |gender, names|
#     names.each { |name| pigeon_list[name] = {} }
#   end
#
#   # Give each pigeon hash their own attributes (color, gender, lives)
#   data.each do |attribute, info|
#     pigeon_list.each { |name, value| pigeon_list[name][attribute] = [] }
#   end
#
#   # Give each pigeon the values of their color attribute in string format
#   data[:color].each do |color, names|
#     names.each { |name| pigeon_list[name][:color] << color.to_s if pigeon_list[name] }
#   end
#
#   # Give each pigeon the their gender in string format
#   data[:gender].each do |gender, names|
#     names.each { |name| pigeon_list[name][:gender] << gender.to_s if pigeon_list[name] }
#   end
#
#   # Give each pigeon their living location
#   data[:lives].each do |lives, names|
#     names.each { |name| pigeon_list[name][:lives] << lives.to_s if pigeon_list[name] }
#   end
#
#   pigeon_list
# end
#
# pigeon_data = {
#   :color => {
#     :purple => ["Theo", "Peter Jr.", "Lucky"],
#     :grey => ["Theo", "Peter Jr.", "Ms. K"],
#     :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
#     :brown => ["Queenie", "Alex"]
#   },
#   :gender => {
#     :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
#     :female => ["Queenie", "Ms. K"]
#   },
#   :lives => {
#     "Subway" => ["Theo", "Queenie"],
#     "Central Park" => ["Alex", "Ms. K", "Lucky"],
#     "Library" => ["Peter Jr."],
#     "City Hall" => ["Andrew"]
#   }
# }

def nyc_pigeon_organizer(data)
  new_hash = {}

  data.each do |characteristic, inner_hash|
    inner_hash.each do |attribute, name_array|
      name_array.each do |name|

        if !new_hash[name]
          new_hash[name] = {}
        end
        
        if !new_hash[name][characteristic]
          new_hash[name][characteristic] = []
        end

        new_hash[name][characteristic] << attribute.to_s
        
      end
    end
  end


  new_hash
end

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

pp nyc_pigeon_organizer(pigeon_data)
