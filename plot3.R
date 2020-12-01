## Get, load, and read the data

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt")

# Clean and subset the data

data$Date <- as.Date(data$Date, "%d/%m/%Y")
rel_dates <- subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
dateandtime <- strptime(paste(rel_dates$Date, rel_dates$Time, sep = " "), "%Y-%m-%d %X")
rel_dates <- cbind(rel_dates, dateandtime)

# Create plot and export as png
png(filename = "plot3.png")
with(rel_dates, plot(dateandtime, rel_dates$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(rel_dates, lines(dateandtime, Sub_metering_1))
with(rel_dates, lines(dateandtime, Sub_metering_2, col = "red"))
with(rel_dates, lines(dateandtime, Sub_metering_3, col="blue"))
dev.off()