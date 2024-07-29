#!/usr/bin/env bash

DEPENDENCY_LOCATIONS=("./drush/Commands/contrib")
DEPENDENCY_LOCATIONS+=("./vendor")
DEPENDENCY_LOCATIONS+=("./docroot/libraries")
DEPENDENCY_LOCATIONS+=("./docroot/modules/contrib")
DEPENDENCY_LOCATIONS+=("./docroot/profiles/contrib")
DEPENDENCY_LOCATIONS+=("./docroot/themes/contrib")

for DEPENDENCY_LOCATION in "${DEPENDENCY_LOCATIONS[@]}"
do
  if [[ -d $DEPENDENCY_LOCATION ]]
  then
    echo "Removing git repository files from dependencies in ${DEPENDENCY_LOCATION}."
    find ${DEPENDENCY_LOCATION} -name .git | xargs rm -rf
    find ${DEPENDENCY_LOCATION} -name .gitignore | xargs rm -rf
  else
    echo "The file ${DEPENDENCY_LOCATION} does not exist."
  fi
done