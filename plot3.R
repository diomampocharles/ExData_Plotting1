# Setting working directory.
# Take note that this may vary from one computer to another
setwd("C:/Users/10012223/Desktop/Lectures/Coursera Videos/04 Exploratory Data Analysis/Week 1/Course Project")

# Reading and converting the data set to a data frame.
consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                          stringsAsFactors = FALSE)
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
consumption <- consumption[consumption$Date >= as.Date("2007-02-01", "%Y-%m-%d") &
                             consumption$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]
sub("?", NA, consumption)

# Plot 3
png(file = "plot3.png")
with(consumption, {
  time <- strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")
  plot(time, Sub_metering_1, type = "l", col = "black",
       ylab = "Energy sub metering", xlab = "")
  points(time, Sub_metering_2, type = "l", col = "red")
  points(time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
})
dev.off()