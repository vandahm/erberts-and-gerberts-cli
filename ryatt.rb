require 'watir-webdriver'
require 'json'

# Set up config
file = File.open("config.json", "rb")
contents = file.read
file.close
config = JSON.parse(contents)

# Open browser
@b = Watir::Browser.new :ff

# Go to Erberts and Gerberts Login page
@b.goto "https://erbertandgerberts-delivery-1088.patronpath.com/bbLogIn.php"

# Login
@b.text_field(:name => 'Email').set config['email']
@b.text_field(:name => 'Password').set config['password']
@b.button(:title => 'Login').click

# Enter the CaringBridge address
@b.text_field(:name => 'check_address').set config['address1']
@b.text_field(:name => 'check_address2').set config['address2']
@b.text_field(:name => 'check_city').set config['city']
@b.text_field(:name => 'check_zip').set config['zip']
# @b.select_list(:name => 'check_state').set 'MN'
@b.img(:title => 'Check Address').click
@b.execute_script "window.alert = function() { return true; }"

@b.button(:title => 'Continue').click
@b.button(:title => 'Continue').click

# Wyatt
@b.goto "https://erbertandgerberts-delivery-1088.patronpath.com/order.php?rid=a6f9abf5979ea03ec084f4b266e1bb6a&cmd=view&cat=c50c207dc0d9da97329a89e64a589cad&iid=64eaa19b89e0fa959d1299758e624782"
@b.select_list(:id => 'item_options[]').select_value('099a429f2f463b6a0078d6cc9c7844bd')
@b.checkbox(:id => 'box4-0').set
@b.text_field(:name => 'label').set 'Wyatt'
@b.button(:id => 'AddToPlate').click

# Ryan
@b.goto "https://erbertandgerberts-delivery-1088.patronpath.com/order.php?rid=a6f9abf5979ea03ec084f4b266e1bb6a&cmd=view&cat=c50c207dc0d9da97329a89e64a589cad&iid=976db75c0f415efba1cbae6c1f89a049"
@b.select_list(:id => 'item_options[]').select_value('099a429f2f463b6a0078d6cc9c7844bd')
@b.checkbox(:id => 'box1-0').set
@b.text_field(:name => 'label').set 'Ryan'
@b.button(:id => 'AddToPlate').click
@b.goto "https://erbertandgerberts-delivery-1088.patronpath.com/order.php?rid=a6f9abf5979ea03ec084f4b266e1bb6a&cmd=view&cat=4d8e4fae02cf0066f7a14f2951560fd2&iid=38479c92bf07cf956a955615c82b5560"
@b.select_list(:id => 'item_options[]').select_value('28e90113ff0165a922ad0a70d0b247f6')
@b.text_field(:name => 'label').set 'Ryan'
@b.button(:id => 'AddToPlate').click

@b.goto "https://erbertandgerberts-delivery-1088.patronpath.com/checkout.php"
@b.text_field(:name => 'contactname').set config['contact']
