my.data <- read.delim2("household_power_consumption.txt",header = TRUE, sep = ";")
feb.data <- my.data[my.data$Date == "1/2/2007" | my.data$Date == "2/2/2007",]

feb.data$Global_active_power <- as.numeric(as.character(feb.data$Global_active_power))

#plot 1 
png(file="plot1.png",width=480,height=480, units = "px")
hist(feb.data$Global_active_power, ylim= c(0,1200), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#plot 2
str(feb.data)
feb.data$date_full = paste(feb.data$Date, feb.data$Time)
feb.data$date_format = as.POSIXct(feb.data$date_full, format = '%d/%m/%Y %H:%M:%OS')
png(file="plot2.png",width=480,height=480, units = "px")
plot(feb.data$date_format, feb.data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()

#plot 3
str(feb.data)
feb.data$Sub_metering_1 = as.numeric(as.character(feb.data$Sub_metering_1))
feb.data$Sub_metering_2 = as.numeric(as.character(feb.data$Sub_metering_2))
feb.data$Sub_metering_3 = as.numeric(as.character(feb.data$Sub_metering_3))


png(file="plot3.png",width=480,height=480, units = "px")
with(feb.data, {
  plot(date_format, Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = " ")
  lines(date_format, Sub_metering_2,col = "red")
  lines(date_format, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, cex = .8, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

#plot 4
feb.data$Global_reactive_power = as.numeric(as.character(feb.data$Global_reactive_power))
feb.data$Voltage = as.numeric(as.character(feb.data$Voltage))

png(file="plot4.png",width=480,height=480, units = "px")
par(mfrow = c(2,2))
with(feb.data, {
  plot(date_format, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
  plot(date_format, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(date_format, Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = " ")
  lines(date_format, Sub_metering_2,col = "red")
  lines(date_format, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, bty = "n", cex = .8, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(date_format, Global_reactive_power, type = "l", xlab = " ", ylab = "Global_reactive_power")
})
dev.off()



