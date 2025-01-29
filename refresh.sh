#!/bin/bash

# This script will trigger rollout restarts for WMS and WFS test and prod deployments so that related pods can refresh
# themselves with the latest data from Geoserver's S3 store.
#
# Run this script for the target environment sometime after Geoserver's S3 push occurs. Here:  
# https://cis.apps.gov.bc.ca/int/job/waops/job/geoserver_s3_push_prod/?
# https://cis.apps.gov.bc.ca/int/job/waops/job/geoserver_s3_push_test/?

echo "Ensure you have logged into the target OpenShift environment (Gold) using the OC developer credential string."
echo ""

read -p "Select Dev (d), Test (t) or Prod (p) to refresh data: " refreshEnv

if [ "$refreshEnv" = "d" ]; then
    echo "Restarting rollout for DEVELOPMENT environment\n"

    oc project ec38a0-dev
    oc rollout restart deployment/gscloud-dev-wfs
    oc rollout restart deployment/gscloud-dev-wms

    echo "Check wfs restart at: https://console.apps.gold.devops.gov.bc.ca/k8s/ns/ec38a0-dev/deployments/gscloud-dev-wfs/pods"
    echo "Check wms restart at: https://console.apps.gold.devops.gov.bc.ca/k8s/ns/ec38a0-dev/deployments/gscloud-dev-wms/pods"

elif [ "$refreshEnv" = "t" ]; then
    echo "Restarting rollout for TEST environment\n"

    oc project ec38a0-test
    oc rollout restart deployment/gscloud-test-wfs
    oc rollout restart deployment/gscloud-test-wms

    echo "Check wfs restart at: https://console.apps.gold.devops.gov.bc.ca/k8s/ns/ec38a0-test/deployments/gscloud-test-wfs/pods"
    echo "Check wms restart at: https://console.apps.gold.devops.gov.bc.ca/k8s/ns/ec38a0-test/deployments/gscloud-test-wms/pods"

elif [ "$refreshEnv" = "p" ]; then
    echo "Restarting rollout for PRODUCTION environment\n"

    oc project ec38a0-prod
    oc rollout restart deployment/gscloud-prod-wfs
    oc rollout restart deployment/gscloud-prod-wms

    echo "Check wfs restart at: https://console.apps.gold.devops.gov.bc.ca/k8s/ns/ec38a0-prod/deployments/gscloud-prod-wfs/pods"
    echo "Check wms restart at: https://console.apps.gold.devops.gov.bc.ca/k8s/ns/ec38a0-prod/deployments/gscloud-prod-wms/pods"
else 
    echo ""
    exit 0
fi

exit 0
