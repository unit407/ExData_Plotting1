library(datasets)

## Read table

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "/Users/RyanKramer/Desktop/Coursera/hw1.zip")

unzip(zipfile = "/Users/RyanKramer/Desktop/Coursera/hw1.zip", exdir = "/Users/RyanKramer/Desktop/Coursera/hw1")

df <- read.table(file = "/Users/RyanKramer/Desktop/Coursera/hw1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


## Subset table into the two dates wanted
smallTable <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


## Creates numeric vector of global active power values
GlobalActivePower <- as.numeric(smallTable$Global_active_power)

## Create histogram
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()


