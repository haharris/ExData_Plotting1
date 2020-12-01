## Get, load, and read the data

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt")

# Clean and subset the data

data$Date <- as.Date(data$Date, "%d/%m/%Y")
rel_dates <- subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
global_active_power <- as.numeric(as.character(rel_dates$Global_active_power))

# Create histogram and export to a png

png(filename = "plot1.png")
hist(global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts", col = "red")
dev.off()
