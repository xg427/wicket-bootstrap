#!/bin/bash 

downloadTheme() {
    theme=$1
    version=$2
    mkdir -p css

    wget "https://cdn.jsdelivr.net/npm/bootswatch@$version/dist/$theme/_variables.scss" -O css/bootstrap.$theme.variables.scss
    wget "https://cdn.jsdelivr.net/npm/bootswatch@$version/dist/$theme/_bootswatch.scss" -O css/bootstrap.$theme.scss
    wget "https://cdn.jsdelivr.net/npm/bootswatch@$version/dist/$theme/bootstrap.min.css" -O css/bootstrap.$theme.min.css
    wget "https://cdn.jsdelivr.net/npm/bootswatch@$version/dist/$theme/bootstrap.css" -O css/bootstrap.$theme.css

    echo -e "@import \"../../bootstrap/css/bootstrap.scss\";\n@import \"bootstrap.$theme.variables.scss\";\n\n" | cat - css/bootstrap.$theme.scss > tmp.$theme.out && mv tmp.$theme.out css/bootstrap.$theme.scss
}

for theme in cerulean cosmo cyborg darkly flatly journal litera lumen lux materia minty pulse sandstone simplex sketchy slate solar spacelab superhero united yeti 
do
    downloadTheme $theme 'v4.6.0' 2>&1 & >/dev/null
done

