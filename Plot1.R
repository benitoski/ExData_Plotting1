#get the data
power0<-read.table("./household_power_consumption.txt",header=TRUE,sep=";", dec=".", na.string="?")

#select dates assigned
power<-power0[with(power0, Date=="1/2/2007"|Date=="2/2/2007"), ]

#mergge Date and Time
power$DT<-paste(power$Date,power$Time,sep=" ")

#convert the string into a date time field
power$DateTime<-strptime(power$DT, "%d/%m/%Y %H:%M:%S")

#generates the png1 file
png(filename = "./plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
hist(as.numeric(as.character(power$Global_active_power)),
     xlab="Global Active Power (kilowats)",main="Global Active Power",col="red")
dev.off()
