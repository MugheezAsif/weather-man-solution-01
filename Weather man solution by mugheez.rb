#############
def get_from_file(data, start, comma, placeHolder)
    i = start
    arr = []
    while i < data.length - 1
        i += 1
        j = 0 
        count = 0
        size2 = data[i].length()
        while j < size2
            if data[i][j] == ","
                count += 1
            end
            j += 1
            if count == comma
                temp = ""
                if data[i][j] == "," && data[i][j + 1] == ","
                    arr << placeHolder
                elsif
                    k = j
                    while data[i][k] != ","
                        temp.concat(data[i][k])
                        k += 1
                    end
                    arr << temp
                    break
                    
                end
            end
        end
    end
    return arr
end
def maximum(arr)
    temps = arr
    max = 0
    i = 0
    while i < temps.length()
        if max < temps[i]
            max = temps[i]
            index = i
        end
        i += 1
    end
    return index, max
end
def minimum(arr)
    temps = arr
    min = 99
    i = 0
    while i < temps.length()
        if min > temps[i]
            min = temps[i]
            index2 = i
        end
        i += 1
    end
    return index2, min
end
def get_dates(data)
    i = 1
    dates = []
    while i < data.length() - 2
        i += 1
        j = 0
        temp = ""
        while data[i][j] != ","
            temp.concat(data[i][j])
            j += 1
        end
        dates << temp
    end
    return dates
end
def check_month(i)
    file_name = ""
    if (i == 1)
        file_name.concat("_Jan.txt")
        return file_name
    elsif(i == 2)
        file_name.concat("_Feb.txt")
        return file_name
    elsif(i == 3)
        file_name.concat("_Mar.txt")
        return file_name
    elsif(i == 4)
        file_name.concat("_Apr.txt")
        return file_name
    elsif(i == 5)
        file_name.concat("_May.txt")
        return file_name
    elsif(i == 6)
        file_name.concat("_Jun.txt")
        return file_name
    elsif(i == 7)
        file_name.concat("_Jul.txt")
        return file_name
    elsif(i == 8)
        file_name.concat("_Aug.txt")
        return file_name
    elsif(i == 9)
        file_name.concat("_Sep.txt")
        return file_name
    elsif(i == 10)
        file_name.concat("_Oct.txt")
        return file_name
    elsif(i == 11)
        file_name.concat("_Nov.txt")
        return file_name
    elsif(i == 12)
        file_name.concat("_Dec.txt")
        return file_name
    end
end



year = 1997                  ############## change the year to get the specific year data


final_humidity = []
final_min_temp = []
final_max_temp = []
final_date_max_temp = []
final_date_min_temp = []
final_date_humidity = []

i = 1
while i < 13

    name = "lahore_weather_" << year.to_s
    name << check_month(i)
    
    data = File.readlines(name)

    maxtemps = get_from_file(data, 1, 1, -99)
    mintemps = get_from_file(data, 1, 3, 99)
    humidity = get_from_file(data, 1, 8, -99)
    maxtemps = maxtemps.map(&:to_i)
    mintemps = mintemps.map(&:to_i)
    humidity = humidity.map(&:to_i)

    index_max_temp, max_temp = maximum(maxtemps)

    index_min_temp, min_temp = minimum(mintemps)

    index_max_humidity, max_humidity = maximum(humidity)

    dates = get_dates(data)

    final_humidity << max_humidity
    final_date_humidity << dates[index_max_humidity]
    
    final_max_temp << max_temp
    final_date_max_temp << dates[index_max_temp]

    final_min_temp << min_temp
    final_date_min_temp << dates[index_min_temp]

    i += 1
end


# Task 1

index , max = maximum(final_max_temp)
p "Max Temp #{max} on date : #{final_date_max_temp[index]}"

index , max = minimum(final_min_temp)
p "Min Temp #{max}   on date : #{final_date_min_temp[index]}"

index , max = maximum(final_humidity)

p "Most humid day #{max} on date : #{final_date_humidity[index]}"



# Task 2

year = 2005                 ############ Enter year number
i = 6                       ############ Enter month number to check

name = "lahore_weather_" << year.to_s
name << check_month(i)

data = File.readlines(name)
maxtemps = get_from_file(data, 1, 1, -99)
mintemps = get_from_file(data, 1, 3, 99)
humidity = get_from_file(data, 1, 8, -99)
maxtemps = maxtemps.map(&:to_i)
mintemps = mintemps.map(&:to_i)
humidity = humidity.map(&:to_i)

average_max_temp = maxtemps.sum(0.0) / maxtemps.length()
average_min_temp = mintemps.sum(0.0) / mintemps.length()
average_humidity = humidity.sum(0.0) / humidity.length()

p average_humidity
p average_max_temp
p average_min_temp


# Task 3

year = 2005                 ############ Enter year number
i = 6                       ############ Enter month number to check

name = "lahore_weather_" << year.to_s
name << check_month(i)

data = File.readlines(name)
maxtemps = get_from_file(data, 1, 1, -99)
mintemps = get_from_file(data, 1, 3, 99)
humidity = get_from_file(data, 1, 8, -99)
maxtemps = maxtemps.map(&:to_i)
mintemps = mintemps.map(&:to_i)
humidity = humidity.map(&:to_i)

i = 0
while i < maxtemps.length()
    j = 0
    print i + 1
    while j < maxtemps[i]
        print "+"
        j += 1
    end
    puts maxtemps[i]
    print i + 1
    j = 0
    while j < mintemps[i]
        print "+"
        j += 1
    end
    puts mintemps[i]
    i += 1
ends
###
