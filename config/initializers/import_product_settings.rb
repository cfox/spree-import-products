# This file is the thing you have to config to match your application

class ImportProductSettings

    #Take a look at the data you need to be importing, and then change this hash accordingly
    #The first column is 0, etc etc.
    #This is accessed in the import method using COLUMN_MAPPINGS['field'] for niceness and readability
    #TODO this could probably be marked up in YML
    COLUMN_MAPPINGS = {
      'SKU' => 1,
      'Description' => 8,
      'Name' => 2,
      'Master Price' => 12,
      #'Cost Price' => 12,
      'Brand' => 0,
      'Size' => 6,
      'Type' => 3,
      'Finish Group' => 4,
      'Color Group' => 5,
      'Finish' => 10,
      'Collection' => 11,
      'Image Main' => 15
      #'Weight' => 4,
      #'Height' => 5,
      #'Width' => 6,
      #'Depth' => 7,
      #'Image 2' => 9,
      #'Image 3' => 10,
      #'Image 4' => 11,
      
    }

    #Where are you keeping your master images?
    #This path is the path that the import code will search for filenames matching those in your CSV file
    #As each product is saved, Spree (Well, paperclip) grabs it, transforms it into a range of sizes and
    #saves the resulting files somewhere else - this is just a repository of originals.
    PRODUCT_IMAGE_PATH = "#{Rails.root}/lib/etc/product_data/product-images/"
    
    #From experience, CSV files from clients tend to have a few 'header' rows - count them up if you have them,
    #and enter this number in here - the import script will skip these rows.
    INITIAL_ROWS_TO_SKIP = 2

    #I would just leave this as is - Logging is useful for a batch job like this - so
    # useful in fact, that I have put it in a separate log file.
    LOGFILE = File.join(Rails.root, '/log/', "import_products_#{Rails.env}.log")
    
    #Set this to true if you want to destroy your existing products after you have finished importing products
    DESTROY_ORIGINAL_PRODUCTS_AFTER_IMPORT = true
end
