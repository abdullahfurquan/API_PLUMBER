library(rpart)
library(jsonlite)
load("decision_Tree_model.RData")
new.data <- list(
  Status.of.existing.checking.account='A11'
  , Duration.in.month=20
  , Credit.history='A32'
  , Savings.account.bonds='A65'
)
predict(decision.tree, new.data)

#* @post /predict
#* @param Status.of.existing.checking.account text
#* @param Duration.in.month A number 
#* @param Credit.history The text 
#* @param Savings.account.bonds A text

predict.default.rate <- function(
  Status.of.existing.checking.account
  , Duration.in.month
  , Credit.history
  , Savings.account.bonds
) {
  data <- list(
    Status.of.existing.checking.account=Status.of.existing.checking.account
    , Duration.in.month=as.numeric(Duration.in.month)
    , Credit.history=Credit.history
    , Savings.account.bonds=Savings.account.bonds
  )
  prediction <- predict(decision.tree, data)
  return(list(default.probability=unbox(prediction[1, 2])))
}


