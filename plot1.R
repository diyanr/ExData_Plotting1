## Read the data file
powCon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
powCon$Time <- strptime(paste(powCon$Date, powCon$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
powCon$Date <- as.Date(powCon$Date, "%d/%m/%Y")
powData <- subset(powCon, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot the data
png("plot1.png", width = 480, height = 480, units = "px")
hist(powData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
