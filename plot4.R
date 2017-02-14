library(datasets)

## Read table

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "/Users/RyanKramer/Desktop/Coursera/hw1.zip")

unzip(zipfile = "/Users/RyanKramer/Desktop/Coursera/hw1.zip", exdir = "/Users/RyanKramer/Desktop/Coursera/hw1")

df <- read.table(file = "/Users/RyanKramer/Desktop/Coursera/hw1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


## Subset table into the two dates wanted
smallTable <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


## Convert the six variables to numeric
correctedTableFinal <- transform(smallTable, Voltage = as.numeric(Voltage), Sub_metering_1 = as.numeric(Sub_metering_1), 
                                 Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3),
                                 Global_active_power = as.numeric(Global_active_power), Global_reactive_power = as.numeric(Global_reactive_power))

## Convert time into date-time vector
date_time <- strptime(paste(correctedTableFinal$Date, correctedTableFinal$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Create png file of graphs
png("plot4.png", width=480, height=480)

## Creates 2x2 grid for graphs
par(mfrow = c(2,2))

## Creates first graph
plot(date_time, correctedTableFinal$Global_active_power, type = "l", xlab = "", ylab="Global Active Power")

## Second graph
plot(date_time, correctedTableFinal$Voltage, type = "l", xlab = "datetime", ylab="Voltage")

## Third graph
plot(date_time, correctedTableFinal$Sub_metering_1, type="l", xlab = "", ylab="Energy Submetering")
lines(date_time, correctedTableFinal$Sub_metering_2, type="l", col="red")
lines(date_time, correctedTableFinal$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Fourth Graph
plot(date_time, correctedTableFinal$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()



