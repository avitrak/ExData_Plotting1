# Read a file into R filtering it with an sql statement.
# Code uses the "sqldf" package.
# File "household_power_consumption.txt" should be in the working directory.

library(sqldf)
File <- "household_power_consumption.txt"
Sql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
pwr_cons <- read.csv2.sql(File,Sql)

dateTime <- strptime(paste(pwr_cons$Date,pwr_cons$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width = 480, height = 480, units = "px")

with(pwr_cons, plot(dateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

dev.off()
