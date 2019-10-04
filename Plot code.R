#Readin file
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";")
house<-household_power_consumption
datahouse<-subset(house,house$Date=='1/2/2007' | house$Date=='2/2/2007')
#Plot1
hist(as.numeric(datahouse$Global_active_power),col = 'red', main='Global Active Power', xlab = 'Global Active Power(Kilowatts)')
dev.copy(png,file='plot1.png')
dev.off()
#Plot2
timedate <- as.Date(datahouse$Date, format="%d/%m/%Y")
timedatep<-paste(timedate,datahouse$Time)
timedatep<-as.POSIXct(timedatep)
plot(timedatep,as.numeric(datahouse$Global_active_power),type='l',ylab=('Global Active Power(Kilowatts)'),xlab = '')
#Plot3
plot(timedatep,datahouse$Sub_metering_1,type = 'l',ylab='Energy sub metering',xlab='',col='black')
lines(timedatep,datahouse$Sub_metering_2,type = 'l')
lines(timedatep,datahouse$Sub_metering_2,type = 'l',col='red')
lines(timedatep,datahouse$Sub_metering_3,type = 'l',col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,file='plot3.png')
dev.off()
#Plot4
par(mfrow=c(2,2))
plot(timedatep,as.numeric(datahouse$Global_active_power),type='l',ylab=('Global Active Power(Kilowatts)'),xlab = '')
plot(timedatep,datahouse$Voltage,, type = 'l', ylab = 'Voltage',xlab = 'datetime')
plot(timedatep,datahouse$Sub_metering_1,type = 'l',ylab='Energy sub metering',xlab='',col='black')
lines(timedatep,datahouse$Sub_metering_2,type = 'l')
lines(timedatep,datahouse$Sub_metering_2,type = 'l',col='red')
lines(timedatep,datahouse$Sub_metering_3,type = 'l',col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
plot(timedatep,as.numeric(datahouse$Global_reactive_power),type='l',ylab=('Global Reactive Power(Kilowatts)'),xlab = 'datetime')
dev.copy(png,file='plot4.png')
dev.off()
