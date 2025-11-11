setwd("C:/Users/Ayoola_John/OneDrive/Desktop/R4GIS")

library(sf)           #vector data package
library(terra)        #raster data package
library(dplyr)        #Dataframe manipulation
library(tmap)         #Making map 
library(ggplot2)      #data visualization
library(leaflet)      #Interactive visualization
library(extrafont)

#####________________ Read Data __________________________#####

Africa <-st_read("wk2data/africa.shp")
Africa_Elephant <- st_read("wk2data/africa_elephant.shp")

names(Africa)
names(Africa_Elephant)
Africa_Elephant$geometry

head(Africa_Elephant)

Africa_Elephant_Range <- tm_shape(Africa) +
  tm_fill(fill = "#c3C5B9") +
  tm_shape(Africa_Elephant) +
  tm_fill(fill = "#F2D685") +
  tm_shape(Africa) +
  tm_borders(col = "purple") +
  tm_text("NAME", size = 0.5) + 
  tm_title("Known and Possible\nRange of African\nElephant", 
           color = "#000000",
           position =c(0.1, 0.4), 
           fontfamily = "Roboto", 
           fontface = "bold", size = 0.9) +
  tm_title("Botswana has the\nhighest African Eephant\npopulation of 130,000", 
           position =c(0.1, 0.3), 
           fontfamily ="Roboto", size = 0.7)+
  tm_credits("Data Source: Ayoola John Oluwafemi\nDate: 5 November, 2025",
             position = c("left", "bottom"),
             size = 0.6, color ="#000000") + 
  tm_credits("#R4GIS&RsMentorshipProgram\nThank you Dickson Mbeya",
             fontface = "italic",
             position = c("right", "bottom"),
             size = 0.6, color ="#000000") +
  tm_logo("wk2data/r.png", 
          position = c("right", "top"),
          height=1) +
  tm_logo("wk2data/elephant.png", 
          position = c("left", "top"),
          height=4) + 
  tm_layout(outer.margins = c(0,0,0,0), 
            asp = 1)
Africa_Elephant_Range

tmap_save(Africa_Elephant_Range, "African Elephant range.png")




