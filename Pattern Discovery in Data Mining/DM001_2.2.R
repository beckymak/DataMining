###Lecture 2.2: Pattern Discovery Basic Concepts: Frequent Patterns and Association Rules

## Preparing the data
library(arules)
## Input the data
data = list(
  c("Beer", "Nuts", "Diaper"),
  c("Beer", "Coffee", "Diaper"),
  c("Beer", "Diaper", "Eggs"),
  c("Nuts", "Eggs", "Milk"),
  c("Nuts", "Coffee", "Diaper", "Eggs", "Milk")
)
## Transform data to `transactions` class
data = as(data, "transactions")

## Example: Calculating Support
## Find frequenct item sets by `eclat`
freqset <- eclat(data, parameter=list(support = .5, minlen = 1))

## Show the result
inspect(freqset)


## Example: Find association rules
rules <- apriori(data, parameter=list(support = 0.5, 
                                      confidence = 0.5, 
                                      minlen = 2)) ## If minlen = 1, {} => {X} will also count

inspect(rules)
