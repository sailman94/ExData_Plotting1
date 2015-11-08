df <- read.table("C:/Users/cramer/Desktop/Coursera/Assignment1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
dfsubset <- rbind(subset(df, df$Date == "1/2/2007"), subset(df, df$Date == "2/2/2007"))
DateTime <- paste(dfsubset$Date, dfsubset$Time, sep = " ")
workingdata <- cbind(DateTime, dfsubset[,3:9])
workingdata$DateTime <- strptime(workingdata$DateTime, format="%d/%m/%Y %H:%M:%S")
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2),  mar = c(4, 4, 4, 2), oma = c(1, 0, 0, 0))
with(workingdata, {
  ##plot 1:
  plot(DateTime, Global_active_power, type="n", xlab = NA, ylab = "Global Active Power")
  lines(workingdata$DateTime, workingdata$Global_active_power)
  ##plot 2:
  plot(DateTime, Voltage, type="n", xlab = "datetime", ylab = "Voltage")
  lines(workingdata$DateTime, workingdata$Voltage)
  ##plot 3:
  plot(workingdata$DateTime, workingdata$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
  lines(workingdata$DateTime, workingdata$Sub_metering_1)
  lines(workingdata$DateTime, workingdata$Sub_metering_2, col = "red")
  lines(workingdata$DateTime, workingdata$Sub_metering_3, col = "blue")
  legend("topright", lty=c(1,1), col= c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.9)
  ##plot 4:
  plot(DateTime, Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(workingdata$DateTime, workingdata$Global_reactive_power)
})
dev.off()