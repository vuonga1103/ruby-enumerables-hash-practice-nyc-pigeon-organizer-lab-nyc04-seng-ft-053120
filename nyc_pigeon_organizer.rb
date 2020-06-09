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

def nyc_pigeon_organizer(pigeon_data)

  # Helper function that generates a list of pigeon names based on data
  def name_list(pigeon_data)
    result = []
    # Loop through pigeon's data first value, which is an inner hash
    pigeon_data.each_value do |inner_hash|
      # Loop through the inner hash's values, which are name arrays
      inner_hash.each_value do |name_array|
        # Push each name encountered into result unless result already has that name
        name_array.each { |name| result << name unless result.include?(name) }
      end
      # Break after the first loop
      break
    end

    # Return the result array
    result
  end

  # Helper function that generates a list of all characteristics present in pigeon data
  def characteristic_list(pigeon_data)
    pigeon_data.keys
  end

  #Helper function that generates an empty hash using list of names and list of characteristics
  def empty_pigeon_list(name_list, characteristic_list)
    result = {}
    name_list.each do |name|
      result[name] = {}
      characteristic_list.each do |characteristic|
        result[name][characteristic] = []
      end
    end
    result
  end

  pigeon_list = empty_pigeon_list(name_list(pigeon_data), characteristic_list(pigeon_data))
  pigeon_list
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
