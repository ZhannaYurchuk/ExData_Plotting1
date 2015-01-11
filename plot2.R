plot2 <- function() {
        raw.data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings = c("?"))
        
        raw.data$Date<-strptime(raw.data$Date,format="%d/%m/%Y")
        
        data<-raw.data[raw.data$Date == "2007-02-01" | raw.data$Date == "2007-02-02",]
        data<-data[!is.na(data$Date),]
        
        data$Time<-strptime(data$Time,format="%H:%M:%S")
        data$Time<-format(data$Time, "%H:%M:%OS")
        
        data$DateTime <- paste(data$Date, data$Time)
        data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
        
        png(filename = "plot2.png",width = 480, height = 480, units = "px")

        plot(data$DateTime,data$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
        dev.off()
}