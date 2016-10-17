
# read the table and limit to 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('E:/DATA SCIENCE/Coursera/Exploratory Data Analysis/Week 1/household_power_consumption.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]

power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)

# make sure the plots folder exists and create one if it doesn't
if (!file.exists('plots')) {
  dir.create('plots')
}


# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# plot data
plot(power.consumption$DateTime,power.consumption$Global_active_power,ylab='Global Active Power (kilowatts)', xlab=" ", type='l')

# close device
x<-dev.off()

