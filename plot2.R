library(datasets)

## Read table

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "/Users/RyanKramer/Desktop/Coursera/hw1.zip")

unzip(zipfile = "/Users/RyanKramer/Desktop/Coursera/hw1.zip", exdir = "/Users/RyanKramer/Desktop/Coursera/hw1")

df <- read.table(file = "/Users/RyanKramer/Desktop/Coursera/hw1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


## Subset table into the two dates wanted
smallTable <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


## Convert Global_active_power to numeric
correctedTable <- transform(smallTable, Global_active_power = as.numeric(Global_active_power))

## Convert time into date-time format
date_time <- strptime(paste(correctedTable$Date, correctedTable$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Create png file of graph
png("plot2.png", width = 480, height = 480)
plot(date_time, correctedTable$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()



