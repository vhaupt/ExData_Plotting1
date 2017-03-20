############################################################################################
## Plot2.R
############################################################################################

getwd()
setwd("/Users/vincenthaupt/Desktop/Coursera/Data Science - R/4. Exploratory Data Analysis/Week 1")

dat<-read.table("household_power_consumption.txt",header = T,sep = ";")
dat$date_create<- as.Date(dat$Date,"%d/%m/%Y")
dat$datetime_create <-strptime(paste(dat$Date[],dat$Time[],sep = " "),format ="%d/%m/%Y %H:%M:%S" )
dat$Global_active_power_create <- as.numeric(as.character(dat$Global_active_power))
dat$subset <- (dat$date_create == "2007-02-01" | dat$date_create == "2007-02-02")

dat_sub<- dat[dat$subset == TRUE,]
dat_sub$sub1<- as.numeric(as.character(dat_sub$Sub_metering_1))
dat_sub$sub2<- as.numeric(as.character(dat_sub$Sub_metering_2))
dat_sub$sub3<- as.numeric(as.character(dat_sub$Sub_metering_3))
dat_sub$reactive <- as.numeric(as.character(dat_sub$Global_reactive_power))
dat_sub$volt <- as.numeric(as.character(dat_sub$Voltage))


#########
#Plot 2
#########
png("plot2.png", width = 480, height = 480)
plot(x = dat_sub$datetime_create, y = dat_sub$Global_active_power_create, 
     ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
lines(x = dat_sub$datetime_create, y = dat_sub$Global_active_power_create)
dev.off()

