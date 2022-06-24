# NYC Shootings : 2006 - 2021

Exploratory data analysis on shootings across NYC between 2006 and 2021. This dashboard examines incidents using various granualities giving users the ability to identify KPi and trends of which shootings occured in a given period of time.   

The motivation of this project was to fully understand the magnitute of media "hysteria" with regards to the severity of shootings in recent times. Furthermore, this analysis will also hope to identify areas where shootings are more common throughout the 5 boroughs. 

## Methodology: 
### 1. Data Source: 
* [NYC Open Data Last (updated June 9 2022)](https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8) 
* [Annual Population Estimates for New York State](https://data.ny.gov/Government-Finance/Annual-Population-Estimates-for-New-York-State-and/krt9-ym2k)
### 2. Data Cleaning
* Excel : Removed unused columns, removed duplicates, filled empty gaps 
* SQL : filter out other counties, Built relationships between population and shootings datasets
### 3. Data analysis
* SQL: Calculated shootings for 100k residents in each borough between 2006 - 2021
* Tableau: Used calculated field to calculate year over year growth 
### 4. Data visualization
* Tableau
