
# Loading libraries
library(dplyr)

# Loading Dictionary (previous version)
dictionary.df <- read.csv(here::here("metadata", "MAPS_Dictionary_v2.6.csv")) %>% 
  select(-starts_with("X"))

# Checking variables
names(dictionary.df)

# Adding new column
dictionary.df$scientific_name <- NA

names(dictionary.df)

# Dictionary code corrections ----

# Correcting ID_3
dictionary.df$ID_3[dictionary.df$ID_3 == "01520.01.01"] <- "1520.01.01"
dictionary.df$ID_3[dictionary.df$ID_3 == "01520.01.02"] <- "1520.01.02"
dictionary.df$ID_3[dictionary.df$ID_3 == "01520.01.03"] <- "1520.01.03"
#Typo that duplicated two contiguous food items
dictionary.df$ID_3[dictionary.df$FoodName_3 == "cake, banana"] <- "F0022.07"

# Correcting FoodName_3
dictionary.df$FoodName_3[dictionary.df$ID_3 == "23161.01.01"] <- "rice grain, imported, white, dried, raw"
dictionary.df$FoodName_3[dictionary.df$ID_3 == "23161.02.01"] <- "rice grain, local, white, dried, raw"


# Correcting fish dict codes (ID_2) (See documentation)
dictionary.df$ID_2[dictionary.df$FoodName_2 == "freshwater fish, liver oil"] <- "15100"
dictionary.df$ID_2[dictionary.df$FoodName_2 == "pelagic fish, frozen, fillet"] <- "15300"

# Correcting oil/seed (ID_0, FoodName_0) (See documentation)
dictionary.df$ID_0[dictionary.df$ID_1 %in% c("2561", "2571", "2572","2579")] <- "OT"
dictionary.df$FoodName_0[dictionary.df$ID_1 %in% c("2561", "2571",
                                                   "2572","2579")] <- "Other foods"
#sugar
dictionary.df$FoodName_0[dictionary.df$ID_3 == "23511.02.01"] <- "Other foods"
dictionary.df$ID_0[dictionary.df$ID_3 == "23511.02.01"] <- "OT"



### Cereals (CE) ----

## Wheat & products (2511) ----

## ├├  wheat (111) -----

## ├├  Wheat and meslin flour (23110) -----

food_desc <-  c("wheat flour, refined, fortified (GHA, SLE), dried, raw")

other_name <- c(rep(NA, 1))

scientific_name <- tolower(c("Triticum spp."))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23110", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  bran of wheat (39120.01) -----

food_desc <-  c("wheat, bran, dried, raw")

other_name <- c(rep(NA, 1))

scientific_name <- tolower(c("triticum spp."))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "39120.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  uncooked pasta, not stuffed or otherwise prepared (23710) -----

food_desc <-  c("macaroni, pasta, wheat, dried, raw")

other_name <- c(rep(NA, 1))

scientific_name <- tolower(c("Triticum spp."))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23710", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  bread (F0020) -----

food_desc <-  c("chapati, wheat flour, refined",
                "chapati, wheat flour, unrefined",
                "chapati, wheat flour, unrefined, with ghee",
                "chapati, wheat flour, refined, with fortified ghee",
                "bread, sweet, wheat flour, refined")

other_name <- c(rep(NA, 2),
                " \"Indian chapati\"",
                rep(NA, 2))

scientific_name <- c(rep(NA,  5))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "F0020", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  pastry (F0022) -----

food_desc <-  c("dough, fried", "cake, plain butter", "cake, fruit",
                "cake, sponge, homemade", "cake, sponge, without fat", 
                "cake, iced", "croissant, plain, unfortified",
                "biscuit, savoury")

other_name <- c("mandazi (TZ06, KE18)", "cupcake", rep(NA,5))

scientific_name <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "F0022", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  breakfast cereals (23140.03) -----

food_desc <-  c("Weet-Bix, breakfast cereal, unfortified")

other_name <- c("wheat biscuits (UK)")

scientific_name <- tolower(c(rep(NA, 1)))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23140.03", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  food preparations of flour, meal or malt extract (23999.02) -----
	
food_desc <-  c()

other_name <- c()

scientific_name <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23999.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## Rice & products (2805) ----

## ├├  husked rice (23162) -----

food_desc <-  c("rice grain, brown, dried, raw", 
                "rice grain, brown, boiled",
                "rice grain, red native, brown, dried, raw")

other_name <- c(rep(NA, 2), "African rice, hulled")

scientific_name <- c(rep("oryza sativa", 2),
                     "oryza glaberrima")

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23162", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  rice, milled (husked) (23161.01) -----

food_desc <-  c("rice, parboiled, imported, raw",
                "rice, parboiled, imported, boiled",
                "rice, white, imported, steamed")

other_name <- c(rep(NA, 3))

scientific_name <- c(rep("oryza sativa", 3))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23161.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  rice, milled (23161.02) -----

food_desc <-  c("rice grain, parboiled, local, dried, raw",
                "rice grain, parboiled, local, boiled",
                "rice grain, red native, milled, local, dried, raw", 
                "rice grain, white, local, steamed", 
                "rice grain, white, local, boiled", 
                "rice grain, white, polished, local, boiled")

other_name <- c(rep(NA, 2), "African rice, milled",
                rep(NA, 3))

scientific_name <- c(rep("oryza sativa", 2), 
                     "oryza glaberrima", 
                     rep("oryza sativa", 3))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23161.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## Barley  & products	(2513)  -----

## ├├  barley (115) -----

food_desc <-  c("barley grain, dried, unrefined, raw")

other_name <- c(rep(NA, 1))

scientific_name <- c(rep("hordeum vulgare", 1))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "115", food_desc, 
                 other_name, scientific_name, taxon, fex2_new)


## ├├  malt extract (23999.01) -----

food_desc <-  c("ovaltine, fortified, powder"
)

other_name <- c(rep(NA, 1))

scientific_name <- c(rep(NA, 1))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23999.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## Maize & products	(2514) -----

## ├├  maize (corn) (112) -----

food_desc <-  c("popcorn, air popped")

other_name <- c(rep(NA, 1))

scientific_name <- tolower(c(rep("Zea mays", 1)))

taxon <- c(NA)

fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "112", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  flour of maize (23120.03) -----
	
food_desc <-  ("maize flour, yellow, unrefined, non-fermented, raw")

other_name <- c("corn meal")

scientific_name <- c(rep("Zea mays L.", 1))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23120.03", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## Sorghum & products	(2518) -----

## ├├  sorghum (114) -----

food_desc <-  ("sorghum grain, red, dried, raw",
               "sorghum grain, white, dried, raw")

other_name <- c(rep(NA, 2))

scientific_name <- c(rep("sorghum bicolor", 2))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "114", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## ├├  flour of sorghum (23120.06) -----

food_desc <-  c("sorghum flour, red, raw",
                "sorghum flour, white, raw")

other_name <- c(rep(NA, 2))

scientific_name <- c(rep("sorghum bicolor", 2))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23120.06", food_desc, 
         other_name, scientific_name, taxon, fex2_new)

## ├├  flour of millet, pearl (23120.05) -----

food_desc <-  c("pearl millet flour, raw",
                "finger millet flour, finger, raw")

other_name <- c("bulrush millet", NA)

scientific_name <- c("pennisetum glaucum", "eleusine coracana")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23120.05", food_desc, 
                 other_name, scientific_name, taxon, fex2_new)

## Oats  & products	(2516) -----

## ├├  bran of oats (39120.06) -----

food_desc <-  c("oat, bran, dried, raw")

other_name <- c(rep(NA, 2))

scientific_name <- c("avena sativa")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "39120.06", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## Cereals, other  & products	(2520) -----

## ├├  other cereals n.e.c. (1199.9) -----

food_desc <-  c("teff grain, dried, unrefined, raw",
                "amaranth, grain, dried, raw" )

other_name <- c(rep(NA, 2))

scientific_name <- c("eragrostis tef", 
                     "amaranthus spp.")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "1199.9", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  cereal preparations (23140.08) -----

food_desc <-  

other_name <- c(NA)

scientific_name <- c(NA)

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "23140.08", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

### Animal Products (AP) ----

## BOVINE MEAT & products (2731) -----

## ├├ meat of cattle with the bone, fresh or chilled (21111.01) -----

food_desc <-  paste(tolower(c("beef, high fat", 
                "beef, moderate fat"
                )), ", with bones, fresh, raw")

other_name <- c(rep(NA, 2))

scientific_name <- c(rep("bos taurus", 2))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21111.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ meat of cattle boneless, fresh or chilled (21111.02) -----

food_desc <-  paste(tolower(c("beef, high fat", 
                              "beef, moderate fat"
)), ", without bones, fresh, raw")

other_name <- c(rep(NA, 2))

scientific_name <- c(rep("bos taurus", 2))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21111.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ bovine meat, salted, dried or smoked (21182) -----

food_desc <- tolower(c("beef meat, lean, cured, dried, raw"
))

other_name <- c(rep(NA, 1))

scientific_name <- c(rep("bos taurus", 1))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21182", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ sausages and similar products of meat, offal or blood of beef and veal (21184.01) -----

food_desc <- c("beef, sausage, raw",
               "beef, meat, ground, raw")

other_name <- c(rep(NA, 2))

scientific_name <- c(rep("bos taurus", 2))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21184.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ beef and veal preparations nes (F0875) -----

food_desc <-  tolower(c("beef, fresh, grilled", 
                        "meatballs, beef, cooked"
))

other_name <- c(rep(NA, 2))

scientific_name <- c(rep("bos taurus", 2))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "F0875", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

##  MUTTON/GOAT MEAT & products (2732) -----

## ├├ meat of sheep, fresh or chilled (21115) -----

food_desc <-  c("lamb meat, medium fat (20% fat), fresh, raw")

scientific_name <- tolower(c("Ovis aries"))

other_name <- c("sheep meat, moderately fat (20% fat) (WA19)")

fex2_new <- c(rep(NA, 1))
taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21115", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ meat of goat, fresh or chilled (21116)  -----

food_desc <- tolower(c("goat, lean, fresh, raw",
                       "goat, medium fat, fresh, raw"
))

other_name <- c(NA)

scientific_name <- c(rep("capra aegagrus hircus",2 ))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21116", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

##  Pig meat & products (2733) -----


## ├├  Meat of pig boneless, fresh or chilled (21113.02) -----

food_desc <- paste0(tolower( c("pork meat, minced", 
                "pork meat, fatty (40%)", 
                "pork meat, lean (10%)")),
", without bones, fresh, raw")

other_name <- c("pig meat, ground", 
                "pig meat, 40% fat",
                "pig meat, 20% fat")

scientific_name <- tolower(rep("sus scrofa domesticus", 3)) 

taxon <- c(NA)

fex2_new <- c(NA)


dictionary.df <- add_dict(dictionary.df, id2 = "21113.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ pig meat, cuts, salted, dried or smoked (bacon and ham) (21181)  -----

food_desc <- tolower(c("bacon rashers"
))

other_name <- c("bacon (pig meat) stripes")

scientific_name <- c("sus scrofa domesticus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21181", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ sausages and similar products of meat, offal or blood of pig (21184.02) -----

food_desc <- tolower(c("pork, sausage, raw"
))

other_name <- c(rep(NA, 1))

scientific_name <- c("sus scrofa domesticus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21184.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## POULTRY MEAT & products (2734) ----

## ├├ meat of chickens, fresh or chilled (21121) -----

food_desc <-  c("chicken, dark meat, without skin, without bones, fresh, raw", 
                "chicken, dark meat, with skin, without bones, fresh, raw", 
                "chicken, light meat, with skin, without bones, fresh, raw",
                "chicken, light meat, without skin, without bones, fresh, raw")

other_name <- c(rep(NA, 4))

scientific_name <- tolower(c(rep("Gallus gallus domesticus", 4)))

taxon <- c(NA)
fex2_new <- c(rep(NA, 4))


dictionary.df <- add_dict(dictionary.df, id2 = "21121", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ poultry meat preparations  (F1061) -----

food_desc <-  c("chicken feet, fresh, boiled"
)

other_name <- c(rep(NA, 1))

scientific_name <- tolower(c(rep("Gallus gallus domesticus", 1)))

taxon <- c(NA)
fex2_new <- c(rep(NA, 1))


dictionary.df <- add_dict(dictionary.df, id2 = "F1061", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ meat of ducks, fresh or chilled (21122) -----

food_desc <-  c("duck, meat and skin, fresh, raw"
                )

other_name <- c(rep(NA, 1))

scientific_name <- tolower(c(rep("anas platyrayncha", 1)))

taxon <- c(NA)
fex2_new <- c(rep(NA, 1))


dictionary.df <- add_dict(dictionary.df, id2 = "21122", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ Meat of turkeys, fresh or chilled (21124) -----

food_desc <-  c("turkey, meat, average, fresh, raw")

scientific_name <- tolower(c("Meleagris gallopavo"))

other_name <- c(NA)

taxon <- c(NA)

fex2_new <- c(rep(NA, 1))


dictionary.df <- add_dict(dictionary.df, id2 = "21124", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## OTHER MEAT & products (2735) ----

## ├├ Other meat and edible meat offal, salted, ... (21183) -----
## in brine, dried or smoked; edible flours and meals of meat or meat offal

food_desc <- c("game meat, dried, salted, raw",
               "termites, dried, raw", 
               "caterpillar, dried, roasted",
               "cricket, dried, raw")

other_name <- c(NA, 
                "Ngumbi (Macrotermes subhyanlinus) (MW19)", 
                "Nyamanyama zootcha (MW19)",
                NA)

scientific_name <- tolower(c(NA, 
                             "Macrotermes spp.",
                             "Usta terphrichore",
                             NA))


taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21183", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## ├├ meat of camels, fresh or chilled (21117.01) -----

food_desc <-  c("camel meat, fresh, raw")

scientific_name <- tolower(c("Camelus dromedarius"))

other_name <- c(rep(NA, 1))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21117.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## ├├ meat prepared n.e.c. (F1172) -----

food_desc <-  c("beef, corned, canned")

scientific_name <- tolower(c("Bos taurus"))

other_name <- c("corned beef, tinned")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "F1172", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ snails, fresh, chilled, frozen, dried, salted or in brine (2920) -----
# except sea snails 

food_desc <-  c("snail, fresh, raw")

scientific_name <- c("achatina spp.")

other_name <- c(rep(NA, 1))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "2920", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## ├├ other meat n.e.c., fresh, chilled or frozen (21170.92) -----

food_desc <- c( "crocodile meat", 
                "ostrich meat", 
                "springbok meat", 
                "grasshoppers, brown",
                "grasshoppers, green",
                "termites",
                "cricket", 
                "cricket, bush")

other_name <- c(rep(NA, 9), "katydid (WA19)")

scientific_name <- tolower(c("crocodylus  spp.",
                             "struthio camelus", 
                             "antidorcas marsupialis", 
                             "ruspolia baileyi",
                             "ruspolia baileyi",
                             NA, NA,
                             "Ruspolia differens"))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "21170.92", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## OFFALS & products (2736) ----

## ├├ edible offal of cattle, fresh, chilled or frozen (21151) -----

food_desc <-  c("beef kidney, fresh, raw",
                "beef tripe, fresh, raw"
                
)

scientific_name <- tolower(c(rep("bos taurus", 2)))

other_name <- c(rep(NA, 2))

taxon <-  c(rep(NA, 2))

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "21151", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## ├├ edible offal of sheep, fresh, chilled or frozen (21155) -----

food_desc <-  c("lamb liver, fresh, raw",
                "lamb brain, fresh, raw"
)

scientific_name <- tolower(c(rep("ovis aries", 2)))

other_name <- c(rep(NA, 2))

taxon <-  c(rep(NA, 2))

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "21155", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ edible offal of goat, fresh, chilled or frozen (21156) -----

food_desc <-  c("goat liver, fresh, raw"
                )

scientific_name <- tolower(c(rep("capra aegagrus hircus", 1)))

other_name <- c(rep(NA, 1))

taxon <-  c(rep(NA, 1))

fex2_new <- c(rep(NA, 1))


dictionary.df <- add_dict(dictionary.df, id2 = "21156", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ edible offals and liver of chickens and guinea fowl, fresh, chilled or frozen (21160.01) -----

food_desc <-  c("chicken giblets, fresh, raw",
                "chicken liver, fresh, raw"
)

scientific_name <- tolower(c(rep("gallus gallus domesticus", 2)))

other_name <- c(rep(NA, 2))

taxon <-  c(rep(NA, 2))

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "21160.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## FATS, ANIMAL, RAW & products (2737) -----

## ├├ fat preparations n.e.c. (F1243) -----

food_desc <-  c("animal, fat", 
                )

scientific_name <- tolower(c(rep(NA, 1)))

other_name <- c(rep(NA, 1))

taxon <-  c(rep(NA, 1))

fex2_new <- c(rep(NA, 1))


dictionary.df <- add_dict(dictionary.df, id2 = "F1243", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## BUTTER, GHEE & products (2740) -----

## ├├ butter of cow milk (22241.01) -----


food_desc <-  c("butter, cow's milk, salted", 
                "butter, cow's milk, unsalted")

scientific_name <- tolower(c(rep("Bos taurus", 2)))

other_name <- c(rep(NA, 2))

taxon <-  c(rep(NA, 2))

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "22241.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## Cream	(2743) -----

## ├├ cream, fresh (22120) -----

food_desc <-  c("cream, cow milk, 35%", 
                "cream, cow milk, reduced fat, 18%")

scientific_name <- tolower(c(rep("Bos taurus", 2)))

other_name <- c(rep(NA, 2))

taxon <-  c(rep(NA, 2))

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "22120", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## MILK & products (excl. butter)	(2848) -----

## ├├ skim milk of cows (22110.02) -----

food_desc <-  c("milk, cow, skimmed, raw")

other_name <- c("milk, cow, low fat, raw")

scientific_name <- c("bos taurus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22110.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ whole milk, condensed (22222.01) -----

food_desc <-  c("milk, cow, whole, condensed, canned, sweetened"
                )

other_name <- c("milk, cow, full fat, condensed, tinned, sweetened")

scientific_name <- c("bos taurus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22222.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  yoghurt (22230.01) -----

food_desc <-  c("yoghurt, cow milk, skimmed, plain")

other_name <- c(NA)

scientific_name <- c(NA)

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22230.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  yoghurt, with additives (22230.02) -----

food_desc <-  c("yoghurt, cow milk, skimmed, sweetened")
other_name <- c(NA)

scientific_name <- c(NA)

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22230.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ whole milk, evaporated (22221.01) -----

food_desc <-  c("milk, cow, whole, evaporated, canned")

other_name <- c("milk, cow, full fat, evaporated, tinned")

scientific_name <- c("bos taurus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22221.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ skim milk, condensed (22222.02) -----

food_desc <-  c("milk, cow, skimmed, condensed, canned, sweetened"
)

other_name <- c("milk, cow, low fat, condensed, tinned, sweetened")

scientific_name <- c("bos taurus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22222.02", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ cheese from whole cow milk (22251.01) -----

food_desc <- c("cheese, cow's milk, cheddar",
               "cheese, cow's milk, skimmed, cottage",
               "cheese, cow's milk, whole, cottage", 
               "cheese, cow's milk, fresh curd", 
               "cheese, cow's milk, gouda", 
               "cheese, cow's milk, spreadable")

other_name <- c(NA)

scientific_name <- c("bos taurus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22251.01", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)



## ├├ dairy products n.e.c. (22290) -----

food_desc <- tolower(c("milk flavoured, chocolate" ,
                       "milk flavoured, strawberry, banana",
                       "milk fermented, industrial",
                       "milk fermented, traditional",
                       "chocolate malted milk beverage, skimmed" ,          
                       "chocolate milk beverage, whole, from powder",
                       "chocolate milk beverage, whole from syrup",                      
                       "malted milk, whole, from powder", 
                       "chocolate milk and whey beverage"
                       ))

other_name <- c(rep(NA, 9))

scientific_name <- c(NA)

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22290", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ ice cream and other edible ice (22270) -----

food_desc <- tolower(c("Ice cream, caramel flavour, regular fat" ,
                   "Ice cream, chocolate flavour, regular fat" ,
                   "Ice cream, strawberry flavour, regular fat",
                   "Ice cream, vanilla flavour, regular fat" ,           
                   "Ice cream, vanilla flavour, with nuts, regular fat",
                   "ice cream, generic flavour (including lollies)"))

other_name <- c(rep(NA, 5))

scientific_name <- c(NA)

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22270", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ raw milk of sheep (2291) -----

food_desc <- tolower(c("sheep milk, fresh" 
))

other_name <- c(rep(NA, 1))

scientific_name <- c("ovis aries")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "2291", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ raw milk of goats (2292) -----

food_desc <- tolower(c("goat milk, fresh" 
))

other_name <- c(rep(NA, 1))

scientific_name <- c("capra aegagrus hircus")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "2292", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  cheese from milk of goats, fresh or processed (22254) -----

food_desc <-  c("cheese, from goat’s milk, hard type")
other_name <- c(NA)

scientific_name <- c(NA)

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "22254", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ raw milk of camel (2293) -----

food_desc <- tolower(c("camel milk, fresh" 
                       ))

other_name <- c(rep(NA, 1))

scientific_name <- c("camelus dromedarius")

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "2293", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


## EGGS & products (2744) -----


## ├├ Eggs from other birds in shell, fresh, n.e.c. (232) -----

food_desc <-  c("egg, duck, fresh, raw", 
                "egg, guinea fowl, fresh, raw" , 
                "egg, quail, fresh, fresh, raw", 
                "egg, turkey, fresh, fresh, raw")

scientific_name <- c("anas platyrhynchos", "numida meleagris",
                     "coturnix japonica", "meleagris gallopavo")

other_name <- c(rep(NA, 4))

taxon <- c(NA)
fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "232", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)
##  Fisheries -----
 
## Freshwater & diadromous fish -----

## ├├ Freshwater & diadromous fish, fresh (1501) -----

food_desc <- paste0(tolower(c("West African lungfish", "Nile perch" ,"Nile tilapia" ,        
                              "Rhinofishes nei","Naked catfishes","Upsidedown catfishes" ,
                              "North African catfish" ,"Tilapias nei", 
                              "Carp", "Mormyrid",
                              "upsidedown catfishes",
                              "indian ilisha", 
                              "mola carplet"
)),", fresh, raw")


scientific_name <-  tolower(c("Protopterus annectens", "Lates niloticus" ,
                              "Oreochromis niloticus", "Labeo spp", 
                              "Bagrus spp"  ,
                              "Synodontis spp", "Clarias gariepinus" ,
                              "Oreochromis spp", "Cyprinus carpio",
                              "Mormyrus spp.", "synodontis spp.",
                              "ilisha melastoma", 
                              "Amblypharyngodon mola"))

other_name <- c(rep(NA, 9), "elephantfish or beaked fishes",
                "catfish",
                "herring stock, raw (KE18)", NA)

isscaap <- c( "13", "13" ,"12" ,"11", "13", "13" ,"13" ,"12", "11", "13",
              "24", "13", NA)

taxon <- c("1160200202" ,"1700116707", "1705905102" ,"14002024XX", "14108111XX",
           "14132008XX","1411803003" ,"17059051XX", NA, NA, "1211200102", 
           "14132008XX", NA)

alpha <- c("PPG" ,"NIP" ,"TLN" ,"RHI" ,"CAN", "CSY", "CLZ", "TLP", "FCP",
           "MZU", "PIE", "CSY", NA)

fex2_new <- c(rep(NA, 13))

dictionary.df <- add_dict(dictionary.df, id2 = "1501", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  Freshwater & diadromous fish, fresh fillets (1503) -----

food_desc <- paste0(tolower(c("West African lungfish", "Nile perch" ,"Nile tilapia" ,        
                              "Rhinofishes nei","Naked catfishes","Upsidedown catfishes" ,
                              "North African catfish" ,"Tilapias nei", 
                              "Carp", "Mormyrid"
)),", fillet, fresh, raw")


scientific_name <-  tolower(c("Protopterus annectens", "Lates niloticus" ,
                              "Oreochromis niloticus", "Labeo spp",   "Bagrus spp"  ,
                              "Synodontis spp", "Clarias gariepinus" ,
                              "Oreochromis spp", "Cyprinus carpio",
                              "Mormyrus spp."))

other_name <- c(rep(NA, 9), "elephantfish or beaked fishes")

isscaap <- c( "13", "13" ,"12" ,"11", "13", "13" ,"13" ,"12", "11", "13")

taxon <- c("1160200202" ,"1700116707", "1705905102" ,"14002024XX", "14108111XX",
           "14132008XX","1411803003" ,"17059051XX", NA, NA)

alpha <- c("PPG" ,"NIP" ,"TLN" ,"RHI" ,"CAN", "CSY", "CLZ", "TLP", "FCP",
           "MZU")

fex2_new <- c(rep(NA, 10))

dictionary.df <- add_dict(dictionary.df, id2 = "1503", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

##├├ Freshwater & diadromous fish, cured (1505) ----


food_desc <- tolower(c("nile perc, dried, raw",
                       "cyprinid, silver, dried, raw"
             ))

scientific_name <-  tolower(c("lates niloticus", "rastrineobola argentea"))

other_name <- c(rep(NA, 1), "Lake Victoria sardine")

isscaap <- c( "13", "11")

taxon <- c("1700116707", "1400207001" )

alpha <- c("NIP", "ENA")

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "1505", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

##├├ Freshwater & diadromous fish, preparations nei (1507) ----


food_desc <- tolower(c("dagaa fish, dried, stewed",
                       "eel, fresh, steamed",
                       "eel, fresh, grilled",
                       "eel, fresh, boiled",
                       "herring stock, fresh, steamed",
                       "herring stock, fresh, grilled",
                       "herring stock, fresh, boiled",
                       "lungfish, fresh, steamed",
                       "lungfish, fresh, grilled",
                       "lungfish, fresh, boiled",
                       "north african catfish, fresh, steamed",
                       "north african catfish, fresh, grilled", 
                       "north african catfish, fresh, boiled", 
                       "north african catfish, fresh, fried", 
                       "mochokid catfish, fresh, grilled", 
                       "mola carplet"
))

scientific_name <-  tolower(c("rastrineobola argentea",
                              rep("anguilla spp.", 3)),
                            rep("ilisha melastoma", 3), 
                            rep("protopterus annectens", 3),
                            rep("clarias gariepinus", 4), 
                            "Synodontis spp.",
                            "Amblypharyngodon mola")

other_name <- c("omena", rep(NA, 7),
                rep("mudfish (kamongo) (KE18)", 3), 
                "Mlamba wokazinga (MW19)", 
                "catfish (WA19)", 
                NA)

isscaap <- c( "11", rep("22", 3), rep( "24",3), rep( "13",3),
              rep("13",5), "11")

taxon <- c(rep(NA, 16) )

alpha <- c(rep(NA, 10),
           rep("CLZ",4), "CSY", "ABO")

fex2_new <- c(rep(NA, 16))

dictionary.df <- add_dict(dictionary.df, id2 = "1507", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


##  Demersal fish -----
# Added an extra zero at the end (as ICS FAOSTAT SUA Future Code)
# to not get confused with cassava 

## ├├ Demersal fish, fresh (15140) ----


food_desc <- paste0(tolower(c("shark", "Atlantic croaker"
                       )),", fresh, raw")

other_name <- c(rep(NA, 2))


scientific_name <- tolower(c("carcharhinus spp.", "micropogonias undulatus"))


isscaap <- c( "38", NA)

taxon <- c("10802010XX", NA)

alpha <- c("CWZ", NA)

fex2_new <- c(rep(NA, 2))

dictionary.df <- add_dict(dictionary.df, id2 = "15140", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ Demersal fish, fresh fillets (15160) ----


food_desc <- paste0(tolower(c("shiny nose", "flathead grey mullet",
                              "croaker", "Atlantic cod"
)),", fillet, fresh, raw")

other_name <- c(rep(NA, 3), "Northeast Atlantic cod (WA19)")


scientific_name <- tolower(c("polydactylus spp.", "mugil cephalus",
                             "pseudotolithus spp", "gadus morhua"))


isscaap <- c(rep(NA, 3), "32")

taxon <- c(rep(NA, 4))

alpha <- c(rep(NA, 3), "COD")

fex2_new <- c(rep(NA, 4))

dictionary.df <- add_dict(dictionary.df, id2 = "15160", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ Demersal fish, preparations nei (15200) ----


food_desc <- tolower(c("Cod, fresh, steamed",
                       "Cod, fresh, grilled",
                       "Cod, fresh, boiled",
                       "shark, fresh, steamed",
                       "shark, fresh, grilled",
                       "shark, fresh, boiled",
                       "fish balls, steamed",
                       "flathead grey mullet, fillet, fresh, grilled",
                       "shiny nose, fillet, fresh, grilled",
                       "white grouper, fillet, fresh, grilled",
                       "croaker, fillet, fresh, baked"
                    ))

other_name <- c(rep(NA, 11))


scientific_name <- tolower(c(rep("gadus spp.", 3),
                             rep("carcharhinus spp.", 3),
                             NA), "mugil cephalus",
                           "polydactylus spp.",
                           "epinephelus spp."
                           "pseudotolithus spp"
                           )


isscaap <- c( rep("32", 3), rep("38", 3), rep(NA,5))

taxon <- c(rep(NA, 3), rep("10802010XX", 3), rep(NA,5))

alpha <- c(rep(NA, 3), rep("CWZ", 3), rep(NA,5))

fex2_new <- c(rep(NA, 11))

dictionary.df <- add_dict(dictionary.df, id2 = "15200", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## Pelagic fish  -----

## ├├ Pelagic fish, fresh (1527) -----

food_desc <- paste0(tolower(c("sardines", "european anchovy"
)),", fresh, raw")


scientific_name <-  tolower(c("sardinella spp.", "engraulis encrasicolus"))

other_name <- c(rep(NA, 2))

isscaap <- c( rep("35", 2))

taxon <- c("12105012XX", "1210600201" )

alpha <- c("SIX", "ANE")

fex2_new <- c(rep(NA, 2))

dictionary.df <- add_dict(dictionary.df, id2 = "1527", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  Pelagic fish, cured (1531) -----

food_desc <-  c("mackerel, fillet, salted, plain, raw",
                "herring, Pacific, smoked, raw")

scientific_name <- c(rep(NA, 2))

other_name <- c("mackerel, \"Shiosaba\" plain salted fillet (JA15)",
                NA)

taxon <- c(rep(NA, 2))

fex2_new <-  c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "1531", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├  Pelagic fish, canned (1532) -----

food_desc <-  c("tuna, canned in water, drained", 
                "tuna, canned in oil, drained")

scientific_name <- c(rep("Thunnus spp.", 2))

other_name <- c("tuna, tinned in water, drained", 
                "tuna, tinned in oil, drained")

taxon <- c(rep(NA, 2))

fex2_new <- c(rep(NA, 2))


dictionary.df <- add_dict(dictionary.df, id2 = "1532", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ Pelagic fish, preparations nei (1533) -----

food_desc <- tolower(c("sardines, fresh, grilled",
                       "seerfishes nei, fillet, fresh, grilled",
                       "sardines, fresh, steamed",
                       "sardines, fresh, boiled",
                       "tuna, fresh, steamed",
                       "tuna, fresh, grilled",
                       "tuna, fresh, boiled",
                       "atlantic horse mackerel, fillet, grilled",
                        "Barracuda, fillet, grilled",
                        "common dolphinfish, fillet, grilled"))

other_name <- c(NA, "Mackerel, fillet, fresh, grilled",
                rep(NA,2), "mahi mahi (WA19")

scientific_name <- tolower(c("sardinella spp.", "scomberomorus spp.",
                             rep("sardinella spp.", 2),
                             rep("thunnus albacares/t. thynnus", 3),
                             "trachurus trachurus",
                             "sphyraena spp.", 
                             "coryphaena hippurus"))


isscaap <- c( "35", "36", rep("35", 2), rep("36",3), rep("37",3) )

taxon <- c("12105012XX", "17501015XX", rep("12105012XX", 2),
           rep(NA, 5))

alpha <- c("SIX", "KGX", rep("SIX", 2), rep(NA, 6))

fex2_new <- c(rep(NA, 10))

dictionary.df <- add_dict(dictionary.df, id2 = "1533", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

## ├├ Demersal fish, body oil (1522) -----

food_desc <-  c("salmon, body, oil")

scientific_name <- c(NA)

other_name <- c("")

taxon <- c(rep(NA, 1))


fex2_new <- c(NA)

dictionary.df <- add_dict(dictionary.df, id2 = "1522", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)
##  Crustaceans  -----

## ├├  Crustaceans, fresh (1553) -----

food_desc <- tolower(c("freshwater prawns", "marine shrimp" ))


scientific_name <-  tolower(c("Family: Palaemonidae",
                              "Family: Penaeidae"))

other_name <- c("Shrimp, palaemonid (WA19)", 
                "Shrimp, penaeid (WA19)")

isscaap <- c(rep("45", 1))

taxon <- c(rep(NA, 2))

alpha <- c(rep("PAL", 1))

fex2_new <- c(rep(NA, 2))

dictionary.df <- add_dict(dictionary.df, id2 = "1553", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)


##├├ Crustaceans, cured (1555) ----

food_desc <- tolower(c("shrimp, whole, dried, raw"
                       ))

other_name <- c("crayfish")

scientific_name <- tolower(c("Families: Palaemonidae/Penaeidae"))


isscaap <- c( "45")

taxon <- c(NA )

alpha <- c("PAL")

fex2_new <- c(rep(NA, 1))

dictionary.df <- add_dict(dictionary.df, id2 = "1555", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

##├├ Crustaceans, preparations nei (1557) ----

food_desc <- tolower(c("prawns, fresh, steamed",
                       "prawns, fresh, boiled"
))

other_name <- c(NA)

scientific_name <- tolower(c(rep("Penaeidae", 2)))


isscaap <- c( rep("45", 2))

taxon <- c(rep(NA,2 ))

alpha <- c(rep("PAL", 2))

fex2_new <- c(rep(NA, 2))

dictionary.df <- add_dict(dictionary.df, id2 = "1557", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

##  Molluscs  -----


## ├├  Molluscs, fresh (1562) -----

food_desc <-  c("clams, venus, fresh, raw",
                "mussels, fresh, raw", 
                "cockles, fresh, raw", 
                "sea snail, fresh, raw")

scientific_name <- c("veneridae spp.", rep(NA, 2), 
                     "Buccinidae spp.")

other_name <- c(rep(NA, 3), "whelk (WA19)")

taxon <- c(rep(NA,4 ))

fex2_new <- c(rep(NA, 4))

dictionary.df <- add_dict(dictionary.df, id2 = "1562", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)

### Pulses and Beans (PB) ----

## ├├ chick peas, dry (1703) -----

food_desc <-  c("chick peas, dried, raw")

other_name <- c("garbanzo")

fex2_new <- c(rep(NA, 1))

#Fixed
id2 <- "1703"
scientific_name <- "cicer arietinum"
desc1 <-  c("Chick peas, dry This subclass is defined through the following headings/subheadings of the HS 2007: 0713.20.")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  
  
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1[i]
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name
}


## ├├ vetches (1709.01) -----

food_desc <-  c("vetch, dried, raw")

other_name <- c(NA)

fex2_new <- c(rep(NA, 1))

#Fixed
id2 <- "1709.01"
scientific_name <- "vicia sativa"
desc1 <-  c("Vetches, species of Vicia sativa (spring/common vetch), dried. Used mainly for animal feed. (Unofficial definition)")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  
  
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1[i]
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name
}


### Fruits and Vegetables (FV) ----


## ├├  other vegetables, fresh n.e.c. (1290.9) -----

food_desc <-  c(
  "malabar spinach, leaves, fresh, raw",
  "spider plant, leaves, fresh, raw",
  "black nightshade, leaves, fresh, raw", 
  "native eggplant, fresh, raw",
  "taro, leaves, fresh, raw",
  "cow pea, leaves, fresh, raw",
  "sweet potato, leaves, fresh, raw",
  "celery, fresh, raw", "radish, fresh, raw",
  "hibiscus, leaves, fresh, raw", 
  "radish, round, red skin, fresh, raw",
  "radish, long, red skin, fresh, raw", 
  "swiss chard, leaves, fresh, raw", 
  "stinging nettle, leaves, fresh, raw", 
  "jute mallow, leaves, fresh, raw", 
  "blackjack, leaves, fresh, raw",
  "baobab, leaves, fresh, raw", 
  "moringa, leaves, fresh, raw")

other_name <- c("Vine (African) spinach (KE18)",
                "cat\\'s whiskers (Luni) (MW19)",
                rep(NA, 12), 
                "bush okra, leaves, dried raw (WA19), Leaves, jews mallow, raw, Corchorus trilocularis, (Denje)",
                rep(NA, 3))

other_info <- c("https://www.fondazioneslowfood.com/en/ark-of-taste-slow-food/nderema/#:~:text=Nderema%2C%20also%20known%20as%20vine,green%20or%20brownish%2Dpurple%20stems.", 
                rep(NA, 14),
                "https://www.healthbenefitstimes.com/blackjack/, (RESEWO, 2013)",
                rep(NA, 2))

scientific_name <- c("basella alba", "gynandropsis gynandra/cleome gynandra",
                     "solanum scabrum", "solanum macrocarpon",
                     "colocasia esculenta", "vigna unguiculata",
                     NA,  "apium graveolens", NA, 
                     "hibiscus sabdariffa", 
                     "raphanus sativus", 
                     "raphanus sativus", 
                     "beta vulgaris ssp. vulgaris", 
                     "urtica dioica", 
                     "corchorus spp.", 
                     "bidens pilosa",
                     "adansonia digitata",
                     "moringa stenopetala")

fex2_new <- c(rep(NA, 14), "A00NY#F28.A07HS", rep(NA, 2))

# One input
id2 <- "1290.9"
desc1 <-  c("This subclass includes the fresh vegetables not elsewhere classified. They may not be identified separately because of their minor relevance at the international level. Because of their limited local importance, some countries report vegetables under this heading that are classified individually by FAO (Unofficial definition)")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")
taxon_ref <- c(NA)

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name[i]
  dictionary.df[n1,14] <- other_info[i]
  dictionary.df[n1,15] <- taxon_ref
}

## ├├  apple juice (21435.01)  ----

food_desc <-  c("apple juice, fresh, sweetened")
other_name <- c(NA)
scientific_name <- c(NA)

fex2_new <- c("A039M#F10.A077J")

# One input
id2 <- "21435.01"
taxon <- c(NA)
desc1 <-  c("Juice is obtained by mechanical extractors, or by pressing, and is then submitted to various processes. Unfermented, it may or may not be frozen. For direct consumption (Unofficial definition)")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")
taxon_ref <- c(NA)

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name[i]
  dictionary.df[n1,14] <- taxon
  dictionary.df[n1,15] <- taxon_ref
}


### Other foods (OT) ----

## ├├  Food preparations (incl. sauces) (F1232) -----

food_desc <-  c("mayonnaise", "soup", "potash", "chilli sauce", "maize porridge", 
                "yeast, baking", "baking powder", 
                "baking soda, powder", "groundnut sauce", 
                "soup, tomato, condensed, canned", 
                "stock cube, beef", "stock cube, chicken", 
                "stock cube, vegetables", "stock cube, low sodium", 
                "cowpea, fried cakes", "maize dough, fermened, from maize grain", 
                "maize porridge, fermented from white maize, cooked", 
                "soup, chicken, beer yeast, vegetables and fermented African locus beans", 
                "soup, cabbage and vegetables", 
                "cassava and unripe plantain, mashed, cooked",                  
                "cassava and ripe plantain, mashed, cooked", 
                "yam and cassava, mashed, cooked", 
                "baked beans", "luncheon beef",
                "couscous, wheat", "falafel", 
                "pasta, macaroni, refined, dried, boiled",
                "pasta, spaghetti, refined, dried, boiled", 
                "beans, shellie, canned", 
                "rice, egg, fried", 
                "burger, hamburger, takeaway",
                "kebab in pitta bread with salad", 
                "injera, teff grain, cooked")

scientific_name <- c(rep(NA,16), "zea mays", rep(NA, 7), "triticum durum",
                     rep(NA,11))

other_name <- c(rep(NA,7), "bicarbonate of soda", NA, NA, 
                "beef seasoning cube", "chicken seasoning cube", 
                "vegetable seasoning cube", "low Na seasoning cube" ,
                "boussan touba (Burkina Faso) (WA19), beans akara (Sierra Leone)", 
                "kenkey (WA19), agidi (stiff maize dough) (Sierra Leone)", 
                "ogi (WA19), pap (Sierra Leone)", 
                rep("recipe from Burkina Faso in WA19", 2), 
                rep("Banakou né (Burkina Faso) (WA19), Yebbe (Sierra Leone)", 3), 
                rep(NA, 5), "egg, fried rice", rep(NA, 5), 
                "Ethiopian flatbread")

fex2_new <- c(rep(NA, 5), "A049A#F02.A06CK$F01.A066J$F27.A049A", 
              "A048Q#F02.A06CG", 
              rep(NA, 29))

# Fixed input
id2 <- "F1232"
desc1 <- "Including both crop and livestock products. Inter alia: homogenized composite food preparations; soups and broths; ketchup and other sauces; mixed condiments and seasonings; vinegar and substitutes; yeast and baking powders; stuffed pasta, whether or not cooked; couscous; and protein concentrates. Include inter alia: turtle eggs and birds' nests. (Unofficial definition)"
ref1 <-  c(NA)

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  
  
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1[i]
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name[i]
}

## ├├  other oil seeds, n.e.c. (1449.9) -----

food_desc <-  c("niger seeds, dried, raw", 
                "benniseeds, dried, raw")

other_name <- c( rep(NA, 2))

scientific_name <- c("guizotia abyssinica",
                     "sesamum radiatum")

taxon <- c( rep(NA, 2))

# One input
fex2_new <- c(NA)
id2 <- "1449.9"
desc1 <-  c("This subclass covers other oilseeds, oleaginous fruits and nuts that are not identified separately because of their minor relevance at the international level. It also includes tea seeds, grape pips and tomato seeds from which oil is extracted. It includes, inter alia: - Fagus sylvatica (beech nut) - Aleurites moluccana (candlenut) - Carapa guineensis (carapa seed) - Croton tiglium (croton seed) - Bassia latifolia (illipe seed) - Guizotia abyssinica (niger seed) - Licania rigida (oiticica seed) - Perilla frutescens (perilla seed) - Jatropha curcas (physic nut) - Shorea robusta (sal tree seed) - Pongamia glabra (pongam seed) - Astrocaryum spp. (tukuma kernel) (Unofficial definition)")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")
taxon_ref <- c(NA)

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,8] <- fex2_new
  dictionary.df[n1,9] <- food_desc[i]
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name[i]
  dictionary.df[n1,14] <- taxon[i]
  dictionary.df[n1,15] <- taxon_ref
}

## ├├  other stimulant, spice and aromatic crops, n.e.c. (1699) -----

#Manual inputs:
food_desc <- c( "fenugreek, dried, raw", 
                "hops, dried, raw", 
  "curry powder", 
               "ginger, dried, powder", 
               "grains of selim, pepper, dried",
               "parsley, leaves, fresh, raw", 
               "parsley, leaves, dried, raw")

other_name <- c(rep(NA, 4), "Guinea pepper, Uda (Ethiopian pepper) (WA19), parmanji (SL)",
                rep(NA, 2))
scientific_name <- c("trigonella foenum-graecum",
                     rep(NA, 3), "xylopia aethiopica",
                     "petroselinum crispum", 
                     "petroselinum crispum")

fex2_new <- c(rep(NA, 7))


# Fixed
id2 <- "1699"
desc1 <-  c("Other stimulant, spice and aromatic crops, n.e.c. This subclass includes: - saffron, Crocus sativus - turmeric, Curcuma, Indian saffron, Curcuma longa - dill and dill seeds, Anethum graveolens - curry powders and pastes - thyme, Thymus - bay leaves, Laurus nobilis - Guinea pepper, negro pepper, seeds of Xylopia aethiopica - angelica stems This subclass does not include: - locust beans (carobs), cf. 01356 - unroasted chicory roots, varieties Cichorium intybus sativum, cf. 01691 - unroasted chicory roots, varieties other than Cichorium intybus sativum, cf. 01961 - sugar cane, cf. 01802 - sweet sorghum, Sorghum saccharatum, cf. 01809 - guarana nuts, cf. 01930 - kava, cf.01930 - basil and basil seeds, Ocinum basilicum, cf. 01930 - apricot, peach and plum stones and kernels, cf. 21499 - roasted chicory and other roasted coffee substitutes, cf. 23912")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")


# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1[i]
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name[i]
}


### Roots and Tubers (RT) ----

## ├├  flour of roots and tubers nes (23170.02) -----

food_desc <-  c("bread, ensete pulp, fermented, raw", 
                "ensete, flour, raw"
                )

other_name <- c( "kocho (ETH-ess3)", 
                 "bula (ETH-ess3)")

scientific_name <- c( rep(NA, 2))

taxon <- c( rep(NA, 2))

# One input
fex2_new <- c(NA)
id2 <- "23170.02"
desc1 <-  c("Flour and meal produced from roots and tubers o/t potatoes and cassava (Unofficial definition)")
ref1 <-  c("https://www.fao.org/faostat/en/#data/SCL")
taxon_ref <- c(NA)

# Function: 
for(i in 1:length(food_desc)){
  
  id2 <- id2
  id3 <- tail(sort(dictionary.df$ID_3[dictionary.df$ID_2 == id2]), n=1)
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
  dictionary.df[n1,8] <- fex2_new
  dictionary.df[n1,9] <- food_desc[i]
  dictionary.df[n1,10] <- desc1
  dictionary.df[n1,11] <- ref1
  dictionary.df[n1,12] <- other_name[i]
  dictionary.df[n1,13] <- scientific_name[i]
  dictionary.df[n1,14] <- taxon[i]
  dictionary.df[n1,15] <- taxon_ref
}

## ├├  Food preparations (incl. sauces) (F1232) -----

# Here we included all ready-to-eat and as consumed foods that require preparation

food_desc <-  c("mayonnaise", "soup", "potash", "chilli sauce", "maize porridge", 
                "yeast, baking", "baking powder", 
                "baking soda, powder", "groundnut sauce", 
                "soup, tomato, condensed, canned", 
                "stock cube, beef", "stock cube, chicken", 
                "stock cube, vegetables", "stock cube, low sodium", 
                "cowpea, fried cakes", "maize dough, fermened, from maize grain", 
                "maize porridge, fermented from white maize, cooked", 
                "soup, chicken, beer yeast, vegetables and fermented African locus beans", 
                "soup, cabbage and vegetables", 
                "cassava and unripe plantain, mashed, cooked",                  
                "cassava and ripe plantain, mashed, cooked", 
                "yam and cassava, mashed, cooked", 
                "baked beans", "luncheon beef",
                "couscous, wheat", "falafel", 
                "pasta, macaroni, refined, dried, boiled",
                "pasta, spaghetti, refined, dried, boiled", 
                "beans, shellie, canned", 
                "rice, egg, fried", 
                "burger, hamburger, takeaway",
                "kebab in pitta bread with salad",
                "injera, teff grain, cooked",
                "plantain chips, salted",
                "cake, rice flour, fried",
                "snacks, corn based",
                "snacks, cheese flavour", "snacks, potato based")

scientific_name <- c(rep(NA,16), "zea mays", rep(NA, 7), "triticum durum",
                     rep(NA,145)

other_name <- c(rep(NA,7), "bicarbonate of soda", NA, NA, 
                "beef seasoning cube", "chicken seasoning cube", 
                "vegetable seasoning cube", "low Na seasoning cube" ,
                "boussan touba (Burkina Faso) (WA19), beans akara (Sierra Leone)", 
                "kenkey (WA19), agidi (stiff maize dough) (Sierra Leone)", 
                "ogi (WA19), pap (Sierra Leone)", 
                rep("recipe from Burkina Faso in WA19", 2), 
                rep("Banakou né (Burkina Faso) (WA19), Yebbe (Sierra Leone)", 3), 
                rep(NA, 5), "egg, fried rice", 
                rep(NA, 6), "cheese straws/twists (UK21)",
                "pringle-type, fried potato snack (UK21)")

fex2_new <- c(rep(NA, 5), "A049A#F02.A06CK$F01.A066J$F27.A049A", 
              "A048Q#F02.A06CG", 
              rep(NA, 34))

dictionary.df <- add_dict(dictionary.df, id2 = "F1232", food_desc, 
                          other_name, scientific_name, taxon, fex2_new)