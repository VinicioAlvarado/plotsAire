library(magrittr)
library(ggplot2)
library(tidyverse)
library(readxl)
library(openair)

getwd()

MP <- read_excel("GrupoMP.xlsx")

ggplot(data=MP, mapping= aes(x= date, y=MP$`PM2,5`)) +
  geom_line(stat = "identity" ) + facet_wrap(~Sector) +
  geom_point()+
  labs(title= 'PM 2,5 registrado en los Sectores de Estudio',
       y= "Concentración PM 2,5  (ug/m3)", x= "Fecha")



ggplot(data=MP, mapping= aes(x= date, y=MP$`PM2,5`, colour=Sector)) +
  geom_line(stat = "identity" ) + facet_wrap(~Sector) +
  geom_point()+
  labs(title= 'PM 2,5 registrado en los Sectores de Estudio',
       y= "Concentración PM 2,5  (ug/m3)", x= "Fecha")



ggplot(data=MP, mapping= aes(x= date, y=`PM2,5`, group= Sector, colour=Sector)) +
  geom_line(stat = "identity" ) +
  labs(title= 'PM 2,5 registrado en los Sectores de Estudio',
       y= "Concentración PM 2,5  (ug/m3)", x= "Fecha")

######## “season”, “year”, “weekday” type = c("season", "weekday")  "month"

windRose(MP, type = "season", breaks = 4)

pollutionRose(MP, pollutant = "PM2,5")

