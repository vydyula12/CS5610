# CS5610: Academic course Project 

### Motivation and Overview
Personal consumption responsible for almost 70% of economic output. It’s the main workhorse that drives economic growth, making it a key component of GDP. Investors, businesses, and policymakers closely follow published statistics and reports on consumer spending in order to help forecast and plan investment and policy decisions.
During the first quarter of 2020, the US, along with most of the other parts of the world, were severely affected by the Covid19 pandemic and the economy took a huge hit. Travel restrictions went in place, curfews and lockdowns closed most businesses and even shut some of them down for good. The year 2020 demanded a huge adjustment from every level of the economy. Businesses laid off workers to reduce costs, leading to high unemployment rates; and most individuals who remained employed transitioned into remote work to reduce exposure to the virus. 
This project in intended to explore the spending habits of US consumers before the pandemic and during the pandemic to identify how consumers adjusted their spending, if at all. It provides us an opportunity to understand how consumer spending responded to the associated fear, anxiety and economic instability of Covid-19.


###	Related Work
Considering the past decade for the US unemployment rate, It hit the lowest in 2019 and highest increase rate in 2020. Many businesses were closed, lost jobs, talks about inflation have impacted the way consumer spend money. In this project we analyse consumer data to understand how it changed from 2018 to 2020. 



### Initial Questions:
The overall expenditure figures indicate that consumption decreased during the year 2020. Which income group, ethnic group, age group, or occupation group were mostly responsible for this decline?

What type of goods or services saw a rise or decline in consumption? 

Is there any expenditure group that is correlated with income or any of the other expenditure groups? E.g. Does Healthcare expenditure decrease as Personal Insurance increase? Does the consumption in Transportation decrease as the Housing expenditure increase?

###	Data
**What is the data source? Document the data import, wrangling, etc.**

Data sources include the U.S Bureau of Labor Statistics and the U.S Bureau of Economic Analysis. More specifically, we looked at the real personal consumption expenditure tables for 2018, 2019, and 2020. 

We imported these tables and filtered them to include the six demographics of U.S consumers we wanted to explore; Income, Race, Age, Education, Occupation, and Generation. We later excluded generation as it was highly correlated with Age. 

2021 data is not publicly available at the time of this presentation.


###	Exploratory Data Analysis
The data we had is summary of consumer expenditure from 2018:2020. The goal is to see how it changed over the period of time. 
For spending based on age group we used Grouped *bar plot.*
For spending based on Occupation we used dumbbell plot
for sending based on educational level scatter plot was used. 
Finally we use **GGally ** package to find the correalation with each observation



###	Data Analysis

In order to identify relationships within the expenditure groups and Income we created scatterplots to determine which expenditure groups should we include in a multiple regression analysis. With the scatterplot visual, we determined that Transportation, Healthcare, and Education did not show signs of any relationship with Income so we excluded them from the regression model and used Housing, Food, Entertainment, and Personal Insurance and Pensions.



### Narrative and Summary 
In 2019 the unemployment rate fell to 3.5% which is the lowest average rate over the past decade. In 2020 the same has increased to 8.1% making it the highest rate in the past decade. 

The observed consumer expenditure data for various categories shows very strong relation with consumer’s income. During the positive job market, the consumer’s spending on various categories like entertainment, personal insurance etc. has increased. At the beginning of pandemic, many businesses were shutdown making a negative impact on job market. Small and medium business are the one to take this huge loss. Due to job uncertainty, the consumers have spent very less comparing with previous even on basic needs. 

The correlation plot with income and other observations like Food, Education, Transportation, Housing, Healthcare, Entertainment and Personal Insurance and pension supports this observation. 

From the plot, income is **strongly positively** correlated with expenditure on education, Entertainment, personal insurance and pensions. Income is **strongly negatively** correlated with expenditure on Food, housing, Healthcare. Transportation is *negatively* correlated.
