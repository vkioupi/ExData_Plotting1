#Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")#global active power
#global active power
globalActivePower <- as.numeric(subSetData$Global_active_power)
#voltage
voltage<- as.numeric(subSetData$Voltage)
#energy submetering
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
#global reactive power
glreactivepower<- as.numeric(subSetData$Global_reactive_power)

#plot4
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, voltage, type="l", ylab="Voltage", xlab="datetime")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=0, col=c("black", "red", "blue"))
plot(datetime, glreactivepower, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
