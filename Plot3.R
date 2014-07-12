#get the data
power0<-read.table("./household_power_consumption.txt",header=TRUE,sep=";", dec=".", na.string="?")

#select dates assigned
power<-power0[with(power0, Date=="1/2/2007"|Date=="2/2/2007"), ]

#mergge Date and Time
power$DT<-paste(power$Date,power$Time,sep=" ")

#convert the string into a date time field
power$DateTime<-strptime(power$DT, "%d/%m/%Y %H:%M:%S")

#generates the png3 file
png(filename = "./plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(power$DateTime,as.numeric(as.character(power$Sub_metering_1)),type = "l",xlab = "",
     ylab = "Energy sub metering",col="black")
lines(power$DateTime,as.numeric(as.character(power$Sub_metering_2)),type="l",col="red")
lines(power$DateTime,as.numeric(as.character(power$Sub_metering_3)),type="l",col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()