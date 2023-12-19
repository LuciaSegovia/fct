## Function to add new dictionary entry

add_dict <- function(dictionary.df, id2, food_desc, 
                     other_name, scientific_name, taxon, fex2_new){
  
  # library dependency
  library(stringr)
  
  # One input
 # id2 <- "115"
#  desc1 <-  c("Barley")
 # ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")
#  taxon_ref <- c(NA)
  
  # Loop to add the items: 
  for(i in 1:length(food_desc)){
    
  #  id2 <- id2
    id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
    # Checks: Wrong id2
    # ifelse(identical(id3, character(0))){}
    
    id3_new <-ifelse(is.na(id3)|id3 == "", paste0(id2, ".01"),
                     str_replace(id3, "[[:alnum:]]{1,3}$",
                                 formatC(seq(from = str_extract(id3, "[[:digit:]]{1,3}$"), 99),
                                         width=2, flag=0)[2]))
    
    n1 <- dim(dictionary.df)[1]+1
    
    n2 <- ifelse(is.na(id3)|id3 == "", which(dictionary.df$ID_2 %in% id2),
                 which(dictionary.df$ID_3 %in% id3))
    
    #New entry - generation:
    dictionary.df[n1,] <- dictionary.df[n2,]
    #New entry - population:
    dictionary.df[n1,7] <- id3_new
    dictionary.df[n1,8] <- fex2_new[i]
    dictionary.df[n1,9] <- food_desc[i]
#    dictionary.df[n1,10] <- desc1
 #   dictionary.df[n1,11] <- ref1
    dictionary.df[n1,12] <- other_name[i]
    dictionary.df[n1,13] <- scientific_name[i]
    dictionary.df[n1,14] <- taxon[i]
  #  dictionary.df[n1,15] <- taxon_ref
  }
  
  return(dictionary.df)
  
}
