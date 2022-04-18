#installing required packages
#install.packages("readxl")
# install.packages("tidyr")
# install.packages("dplyr")
# install.packages("ggplot2")
#install.packages("stringr")

#load packages
library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)

#for given years of data, loop thru and dynamically create dataframes
for(x in 2018:2020){
  xl<- assign(paste0("df_summary_", x), read_excel(paste0("Data/x",x,".xlsx")))
  #filtered<- assign(paste0("filtered",x), filter(xl, Include == "Y"))
  
  for (irow in 1:nrow(xl)) {
    Include<-xl[irow, "Include"]
    tableName<- xl[irow, "Tab"]
    shortName<- xl[irow, "ShortName"]
    
    if(Include =="Y")
    {
      assign(paste0("df_", x,"_", shortName), read_excel(paste0("Data/x",x,".xlsx"),   toString(tableName[1])))
    }
    
  }
}

#cleanup: delete dfs that not required anymore
selected_obs <- c("Income before taxes","Food","Housing","Transportation","Healthcare","Entertainment","Education","Personal insurance and pensions")

cols<-c("Income before taxes","Food","Housing","Transportation","Healthcare","Entertainment","Education","Personal insurance and pensions")


#########Transforming age data#########
df_2018_age<- df_2018_age %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` ) %>% rename(`25 Under`=`Under 25 years`)

df_2018_age_t <- as.data.frame( t(df_2018_age[,-1]))
colnames(df_2018_age_t)<- cols
df_2018_age_t$Item <- rownames(df_2018_age_t)
df_2018_age_t$Year <- "2018"




df_2019_age<- df_2019_age %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` ) %>% rename(`25 Under`=`Under 25 years`)

df_2019_age_t <- as.data.frame( t(df_2019_age[,-1]))
colnames(df_2019_age_t)<- cols
df_2019_age_t$Item <- rownames(df_2019_age_t)
df_2019_age_t$Year <- "2019"


df_2020_age<- df_2020_age %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` ) %>% rename(`25 Under`=`Under 25 years`)

df_2020_age_t <- as.data.frame( t(df_2020_age[,-1]))
colnames(df_2020_age_t)<- cols
df_2020_age_t$Item <- rownames(df_2020_age_t)
df_2020_age_t$Year <- "2020"


df_age<- rbind(df_2018_age_t,df_2019_age_t,df_2020_age_t)
df_age<- arrange(df_age, Item)
rownames(df_age)<- NULL

df_age  <- df_age %>% mutate_if(is.character, str_trim)

for (i in 1:8) {
  df_age$df_age[,i] <- as.numeric( df_age$df_age[,i] )
  
}




######------------------##############
#Transforming education data

df_2018_education<- df_2018_education %>% filter(Item %in% selected_obs) %>% subset(select = -c( `All consumer units`, Total, `Total College graduate` ))

df_2018_education_t <- as.data.frame( t(df_2018_education[,-1]))
colnames(df_2018_education_t)<- cols
df_2018_education_t$Item <- rownames(df_2018_education_t)
df_2018_education_t$Year <- "2018"



df_2019_education<- df_2019_education %>% filter(Item %in% selected_obs) %>% subset(select = -c( `All consumer units`, `Total...3`, `Total...8` ))

df_2019_education_t <- as.data.frame( t(df_2019_education[,-1]))
colnames(df_2019_education_t)<- cols
df_2019_education_t$Item <- rownames(df_2019_education_t)
df_2019_education_t$Year <- "2019"


df_2020_education<- df_2020_education %>% filter(Item %in% selected_obs) %>% subset(select = -c( `All consumer units`, `Total...3`, `Total...8` ))

df_2020_education_t <- as.data.frame( t(df_2020_education[,-1]))
colnames(df_2020_education_t)<- cols
df_2020_education_t$Item <- rownames(df_2020_education_t)
df_2020_education_t$Year <- "2020"

#combine all education data for all years
df_education<- rbind(df_2018_education_t,df_2019_education_t,df_2020_education_t)
df_education<- arrange(df_education, Item)
rownames(df_education)<- NULL

df_education<- df_education %>% mutate_if(is.character, str_trim)

for (i in 1:8) {
  df_education$df_education[,i] <- as.numeric( df_education$df_education[,i] )
  
}





#####---- Tranforming income data ------########
df_2018_income<- df_2018_income %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` )

df_2018_income_t <- as.data.frame( t(df_2018_income[,-1]))
colnames(df_2018_income_t)<- cols
df_2018_income_t$Item <- rownames(df_2018_income_t)
df_2018_income_t$Year <- "2018"




df_2019_income<- df_2019_income %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` )

df_2019_income_t <- as.data.frame( t(df_2019_income[,-1]))
colnames(df_2019_income_t)<- cols
df_2019_income_t$Item <- rownames(df_2019_income_t)
df_2019_income_t$Year <- "2019"


df_2020_income<- df_2020_income %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` )

df_2020_income_t <- as.data.frame( t(df_2020_income[,-1]))
colnames(df_2020_income_t)<- cols
df_2020_income_t$Item <- rownames(df_2020_income_t)
df_2020_income_t$Year <- "2020"

#combine all income data for all years
df_income<- rbind(df_2018_income_t,df_2019_income_t,df_2020_income_t)
df_income<- arrange(df_income, Item)
rownames(df_income)<- NULL

df_income <- df_income %>% mutate_if(is.character, str_trim)

for (i in 1:8) {
  df_income$df_income[,i] <- as.numeric( df_income$df_income[,i] )
  
}





#####---- Occupation ---#####



df_2018_occupation<- df_2018_occupation %>% filter(Item %in% selected_obs) %>% subset(select = - c(`All consumer units` ,`Total wage and salary earners` ) )

df_2018_occupation_t <- as.data.frame( t(df_2018_occupation[,-1]))
colnames(df_2018_occupation_t)<- cols
df_2018_occupation_t$Item <- rownames(df_2018_occupation_t)
df_2018_occupation_t$Year <- "2018"




df_2019_occupation<- df_2019_occupation %>% filter(Item %in% selected_obs) %>% subset(select = -  c(`All consumer units` ,`Total wage and salary earners` ) )

df_2019_occupation_t <- as.data.frame( t(df_2019_occupation[,-1]))
colnames(df_2019_occupation_t)<- cols
df_2019_occupation_t$Item <- rownames(df_2019_occupation_t)
df_2019_occupation_t$Year <- "2019"


df_2020_occupation<- df_2020_occupation %>% filter(Item %in% selected_obs) %>% subset(select = - c(`All consumer units` ,`Total wage and salary earners` ) )

df_2020_occupation_t <- as.data.frame( t(df_2020_occupation[,-1]))
colnames(df_2020_occupation_t)<- cols
df_2020_occupation_t$Item <- rownames(df_2020_occupation_t)
df_2020_occupation_t$Year <- "2020"

#combine all occupation data for all years
df_occupation<- rbind(df_2018_occupation_t,df_2019_occupation_t,df_2020_occupation_t)
df_occupation<- arrange(df_occupation, Item)
rownames(df_occupation)<- NULL

df_occupation<- df_occupation%>% mutate_if(is.character, str_trim)

for (i in 1:8) {
  df_occupation$df_occupation[,i] <- as.numeric( df_occupation$df_occupation[,i] )
  
}



######---- Race DATA ----#######

df_2018_race<- df_2018_race %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` )

df_2018_race_t <- as.data.frame( t(df_2018_race[,-1]))
colnames(df_2018_race_t)<- cols
df_2018_race_t$Item <- rownames(df_2018_race_t)
df_2018_race_t$Year <- "2018"




df_2019_race<- df_2019_race %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` ) 

df_2019_race_t <- as.data.frame( t(df_2019_race[,-1]))
colnames(df_2019_race_t)<- cols
df_2019_race_t$Item <- rownames(df_2019_race_t)
df_2019_race_t$Year <- "2019"


df_2020_race<- df_2020_race %>% filter(Item %in% selected_obs) %>% subset(select = - `All consumer units` )

df_2020_race_t <- as.data.frame( t(df_2020_race[,-1]))
colnames(df_2020_race_t)<- cols
df_2020_race_t$Item <- rownames(df_2020_race_t)
df_2020_race_t$Year <- "2020"

#combine all race data for all years
df_race<- rbind(df_2018_race_t,df_2019_race_t,df_2020_race_t)
df_race<- arrange(df_race, Item)
rownames(df_race)<- NULL

df_race <- df_race %>% mutate_if(is.character, str_trim)

for (i in 1:8) {
  df_race$df_race[,i] <- as.numeric( df_race$df_race[,i] )
  
}



######---AGE VISUALS-- #########

ggplot(df_age, aes( x= Item, y= Housing, fill=Year)) +
  geom_bar(stat='identity', position = 'dodge')  + 
  theme(axis.text.x = element_text(angle = 90)) +
  xlab("") +
  ylab("") + 
  geom_text(aes(label=Housing),  position = position_dodge(width=0.5), size=2, vjust=-0.5)
+scale_x_date( breaks = date_breaks("Year"))

ggplot(df_age, aes( x= Item, y= Housing, fill=Year)) +
  geom_bar(stat='identity', position = 'dodge')  + 
  theme(axis.text.x = element_text(angle = 90)) +
  xlab("") +
  ylab("") + 
  geom_text(aes(label=Housing),  position = position_dodge(width=0.5), size=2, vjust=-0.5)+
  scale_x_date( breaks = date_breaks("Year"))

ggplot(df_age, aes( x= Item, y= Transportation, fill=Year)) + geom_bar(stat='identity', position = 'dodge')  +  theme(axis.text.x = element_text(angle = 90)) +xlab("") +ylab("") + geom_text(aes(label=Transportation),  position = position_dodge(width=0.5), size=2, vjust=-0.5)

ggplot(df_age, aes( x= Item, y= Entertainment, fill=Year)) + geom_bar(stat='identity', position = 'dodge')  +  theme(axis.text.x = element_text(angle = 90)) +xlab("") +ylab("") + geom_text(aes(label=Entertainment),  position = position_dodge(width=0.5), size=2, vjust=-0.5)




######---Occupation VISUALS-- #########

df_occupation %>% ggplot(aes(y= Item, x= Food)) +
  geom_line(aes(group = Item))+
  geom_point(aes(color=Year), size=4) +
  theme(legend.position="top")


df_occupation %>% ggplot(aes(y= Item, x= Housing)) +
  geom_line(aes(group = Item))+
  geom_point(aes(color=Year), size=4) +
  theme(legend.position="top")


df_occupation %>% ggplot(aes(y= Item, x= Entertainment)) +
  geom_line(aes(group = Item))+
  geom_point(aes(color=Year), size=4) +
  theme(legend.position="top")


######---education VISUALS-- #########




#Scatter

ggplot(df_education, aes(x=Item, y=Housing)) + 
  geom_point(aes(col=Year, size=4)) + 
  #geom_smooth(method="loess") +
  theme(axis.text.x = element_text(angle = 35)) +
  scale_y_continuous(breaks = seq(0,50000, by = 1000))
#+xlab("") +ylab("")

ggplot(df_education, aes(x=Item, y=Transportation)) + 
  geom_point(aes(col=Year, size=4)) + 
  #geom_smooth(method="loess") +
  theme(axis.text.x = element_text(angle = 35)) +
  scale_y_continuous(breaks = seq(0,50000, by = 1000))
#+xlab("") +ylab("")

ggplot(df_education, aes(x=Item, y=Entertainment)) + 
  geom_point(aes(col=Year, size=4)) + 
  #geom_smooth(method="loess") +
  theme(axis.text.x = element_text(angle = 35)) +
  scale_y_continuous(breaks = seq(0,50000, by = 1000))
#+xlab("") +ylab("")



for ( i in 2018:2020){
  assign(paste0("df_income_",i  ), read_excel("Data/IncomePercentage.xlsx", toString(i)))
}

df_income_all<- rbind(df_income_2018, df_income_2019, df_income_2020)

df_income_all <- for (i in 2:8) {
  df_income_all$df_income_all[,i] <- as.numeric( df_income_all$df_income_all[,i] )
  
}


