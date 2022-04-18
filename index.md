# Exploratory Analysis of U.S Consumer Expenditure


## Data Collection

* The data available at https://www.bls.gov/cex/ are in PDF files and in unreadable format. The primary challenge was to get this data into excel spreadsheets. 
* Once the data is copied over to excel speadsheet we observed most of the columns were merged and not properly readable by R
* We did preliminary cleanup to get the data to what we have today by unmerging the columns, removing row headers. etc. But the data format(text, number, etc.) was kept as is since we can change this during data transformation using R. 
* We could find the data for the years 2018,2019 and 2020. 
* 2021 data is not publicly available at the time of this report. 



## Coding Approach

The data is in several different sheets (excel tabs) for each year. We needed to dynamically read the date based on the information available in "Summary" table. This decision was made to answer "What if we decided to consider another dataset?". Rather than having them mentioned in the R code, the Summary table helps the R to instruct what tables to pull from excel spreadsheets. 


![Code](https://github.com/vydyula12/CS5610/blob/aa87826e0699e087be226496489916c28fddcfca/plots/Code.png?raw=true)


This way we can add or remove additional tables into consideration.


## Observations


Below observations were provided as an example. We discuss more categories and plots in .rmd file and in the shiny app created for this project. 

#### Consumer Expenditure on Entertainment by Age Groups

![](https://github.com/vydyula12/CS5610/blob/main/plots/byage-Entertainment.png?raw=true)

Spending on Entertainment for most of the app groups changed in 2020. Except for the age group 35-44 years, we can observe all other groups have reduced their spending in this category.


#### Consumer Expenditure on Food by occupation

![](https://github.com/vydyula12/CS5610/blob/main/plots/byOccupation-Food.png?raw=true)

Spending on food has significantly increased under the Manager and professionals category. Construction workers and mechanics and retired consumers have reduced their spending on Food. We can see a decrease in a few other categories as well. 



#### Consumer Expenditure on Entertainment by education level
![](https://github.com/vydyula12/CS5610/blob/main/plots/byeducation-Entertainment.png?raw=true)

Similar to age group data, we can spot a decline in spending on Entertainment. Consumers with Master's, professional and doctoral degree has reduced spending on Entertainment during 2020. We can spot more spending during 2019 for the same category.


#### Correlation Consumer Expenditure and income 

![](https://github.com/vydyula12/CS5610/blob/main/plots/CorrelationWithIncome.png?raw=true)

After evaluating or analyzing several different categories, this plot is to show the correlation between income and other categories we have selected for this project. 
From the plot, income is strongly positively correlated with expenditure on education, Entertainment, personal insurance, and pensions. Income is strongly negatively correlated with expenditure on food, housing, and Healthcare. Transportation is negatively correlated.
