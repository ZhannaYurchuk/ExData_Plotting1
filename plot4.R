plot4 <- function() {
        raw.data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings = c("?"))
        
        raw.data$Date<-strptime(raw.data$Date,format="%d/%m/%Y")
        
        data<-raw.data[raw.data$Date == "2007-02-01" | raw.data$Date == "2007-02-02",]
        data<-data[!is.na(data$Date),]
        
        data$Time<-strptime(data$Time,format="%H:%M:%S")
        data$Time<-format(data$Time, "%H:%M:%OS")
        
        png(filename = "plot4.png",width = 480, height = 480, units = "px")
        par(mfrow=c(2,2))

        plot(data$DateTime,data$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")

        plot(data$DateTime,data$Voltage,type="l", ylab="Voltage", xlab= "datetime")

        plot(data$DateTime,data$Sub_metering_1,type="l", ylab="Energy sub metering", xlab= "")
        lines(data$DateTime,data$Sub_metering_2,col="Red")
        lines(data$DateTime,data$Sub_metering_3,col="Blue")
        legend("topright",box.lty=0,lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), inset=.01)

        plot(data$DateTime,data$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab= "datetime")
        dev.off()
}
