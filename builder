#!/bin/bash

# Lemon basic project builder

YELLOW='\033[0;33m'
RED='\033[0;31m'
END='\033[0m'

echo -e "${YELLOW}
  _                                
 | |                               
 | |     ___ _ __ ___   ___  _ __  
 | |    / _ \ '_ \` _ \ / _ \| '_ \ 
 | |___|  __/ | | | | | (_) | | | |
 |______\___|_| |_| |_|\___/|_| |_|
                                   
${END}                                   
"

echo "Building files..."

mkdir public
touch public/index.php
touch public/.htaccess
touch lemonade

# Htaccess
echo -e "
RewriteEngine On
RewriteBase /
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.+)$ index.php [QSA,L]
" > public/.htaccess

# Index
echo -e "<?php

require \"../vendor/autoload.php\";
" > public/index.php

# Lemonade
echo -e "#!/usr/bin/php
<?php

// Including whole Kernel
require \"vendor/autoload.php\";
use Lemon\Kernel\Kernel;

// Making Kernel instance
\$kernel = new Kernel($argv);

// Executing whole system
\$kernel->execute();

/*
    When life gives you lemons you make lemonade
    ~ Built with <3 by TEN MAJKL

 */
?>

" > lemonade

chmod u+x lemonade

echo -e "${YELLOW}DONE! ${END}"
echo "Now make some cool stuff"
