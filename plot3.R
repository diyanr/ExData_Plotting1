## Read the data file
powCon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
powCon$Time <- strptime(paste(powCon$Date, powCon$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
powCon$Date <- as.Date(powCon$Date, "%d/%m/%Y")
powData <- subset(powCon, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot the data
png("plot3.png", width = 480, height = 480, units = "px")
plot(powData$Time, powData$Sub_metering_1, type = "l",col = "black", xlab = "", ylab = "Energy sub metering")
lines(powData$Time, powData$Sub_metering_2, col = "red")
lines(powData$Time, powData$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
