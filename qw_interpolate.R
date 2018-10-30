rm(list = ls())
cat("\014")


# load the sp library
library(sp)
library(gstat)
library(readxl)

library(dismo)
library(raster)


data=read_xlsx("D:/Google_Drive/Vasant_Kunj_DWQ/Data/Chem_Project_Readings_06_05_2018 - Copy.xlsx",sheet = 1)


# remove any null data rows
data=na.omit(data)


# convert simple data frame into a spatial data frame object
coordinates(data)= ~Xcoord+Ycoord


# create a bubble plot with the random values
bubble(data, zcol= 'Mean.Total.Hardness.Tap.Water', fill=TRUE, do.sqrt=FALSE, maxsize=3)



# Pass object whose extent you plan to plot as first argument and map-type
# as second.
base.map <- gmap(data, type = "terrain")
#reprojected.data <- spTransform(data, base.map@crs)
plot(data, base.map)