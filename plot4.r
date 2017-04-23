#plot4.r
#Author: Jennifer Campbell
#eda week 1 project
#draw 4 line charts in single 2x2 panel: upper left = Global active power over time,
#          upper right = Voltage over time, lower left = Engergy sub metering over time,
#          and lower right = Global reactive power over time

##Instructions:
#Construct the plot and save it to a PNG file with a width of 480 pixels and 
#a height of 480 pixels
#Your code file should include code for reading the data so that the plot can 
#be fully reproduced. You must also include the code that creates the PNG file

####

#Step 1: Read in data
hpcdat <- read.table("ExData_Plot_Project1/household_power_consumption.txt", sep=";", 
                     dec=".", na = "?", header = TRUE) 

#Step 2: Subset data for desired date range
datesub <- hpcdat[hpcdat$Date %in% c("1/2/2007","2/2/2007"), ]

#Step 3: Convert date and time variables to a Date/Time using strptime() 
datetime <- paste(datesub$Date, datesub$Time)
datesub$DateTime  <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Step 4: Open graphics device
png(filename="ExData_Plot_Project1/plot4.png", width=480, height=480, 
    units="px", bg="white")

#Step 5: Set up plot space
par(mfrow=c(2,2))
with(datesub, {

    #Step 6: Create plot 1 (upper left)
    plot(DateTime, Global_active_power, type = "n", xlab=" ", ylab = "Global Active Power")
    lines(DateTime, Global_active_power, col="black")

    #Step 7: Create plot 2 (upper right)
    plot(DateTime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
    lines(DateTime, Voltage, col="black")

    #Step 7: Create plot 3 (lower left)
    plot(DateTime, Sub_metering_1, type = "n", xlab=" ", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_1, col="black")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", lty="solid", col=c("black","red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

    #Step 8: Create plot 4 (lower right)
    plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime", 
         ylab = "Global_reactive_power")
    lines(DateTime, Global_reactive_power, col="black")
})

#Step 9: Close graphics device
dev.off()