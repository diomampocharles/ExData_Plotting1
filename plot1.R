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

# Plot 1
png(file = "plot1.png")
hist(as.numeric(as.character(consumption$Global_active_power)), freq = TRUE,
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
     col = "red")
dev.off()