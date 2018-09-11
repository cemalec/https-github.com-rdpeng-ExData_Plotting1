hpc <- read.table(file="household_power_consumption.txt",header=TRUE, sep=";")
myhpc <- hpc
myhpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
myhpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
hpc_sub <- myhpc[myhpc$Date == "2007-02-01" | myhpc$Date == "2007-02-02",]

hpc_sub$Global_active_power <- as.numeric(hpc_sub$Global_active_power)/1000
hpc_sub$Global_reactive_power <- as.numeric(hpc_sub$Global_reactive_power)/1000

par(mfrow=c(2,2))
plot(hpc_sub$Time,hpc_sub$Global_active_power,type="l",ylab = "Global Active Power (kW)",xlab = " ")
plot(hpc_sub$Time,hpc_sub$Voltage,type="l",ylab = "Voltage",xlab = "datetime")
plot(hpc_sub$Time,hpc_sub$Sub_metering_1,type="l",col="black", ylab="Energy sub metering",xlab=" ")
lines(hpc_sub$Time,hpc_sub$Sub_metering_2,type="l",col="red")
lines(hpc_sub$Time,hpc_sub$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Submetering 1", "Submetering 2","Submetering 3"),lwd=c(1,1,1),col=c("black","red","blue"))
plot(hpc_sub$Time,hpc_sub$Global_reactive_power,type="l",xlab="datetime",ylab="Gloabal Reactive Power (kW)")
dev.print(device=png, width=480,file="plot4.png")