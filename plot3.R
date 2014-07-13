# Read a file into R filtering it with an sql statement.
# Code uses the "sqldf" package.
# File "household_power_consumption.txt" should be in the working directory.

library(sqldf)
File <- "household_power_consumption.txt"
Sql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
pwr_cons <- read.csv2.sql(File,Sql)

dateTime <- strptime(paste(pwr_cons$Date,pwr_cons$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width = 480, height = 480, units = "px")

with(pwr_cons,{ plot(dateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
                lines(dateTime, pwr_cons$Sub_metering_2, type="l", col="red")
                lines(dateTime, pwr_cons$Sub_metering_3, type="l", col="blue")
                legend("topright", col=c("black", "red", "blue"), lty="solid", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            })

dev.off()
