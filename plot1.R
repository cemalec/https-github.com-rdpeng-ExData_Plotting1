hpc <- read.table(file="household_power_consumption.txt",header=TRUE, sep=";")
myhpc <- hpc
myhpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
myhpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
hpc_sub <- myhpc[myhpc$Date == "2007-02-01" | myhpc$Date == "2007-02-02",]

hpc_sub$Global_active_power <- as.numeric(hpc_sub$Global_active_power)/1000
hpc_sub$Global_reactive_power <- as.numeric(hpc_sub$Global_reactive_power)/1000

hist(hpc_sub$Global_active_power,xlab = "Global Active Power (kW)", main = "Global Active Power",col="red",breaks=13)
dev.print(device=png,width=480,file="plot1.png")