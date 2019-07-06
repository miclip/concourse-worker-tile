ver="$(cat version)"
ver=$((ver+1))
VERSTR="0.0.1-build.${ver}"
export PRODUCT_NAME="concourse-worker-${VERSTR}.pivotal"
echo "Baking Version ${VERSTR}"
echo "${ver}" > version

kiln bake \
  --version $VERSTR \
  --metadata base.yml \
  --forms-directory forms \
  --properties-directory properties \
  --releases-directory releases \
  --instance-groups-directory instance_groups \
  --jobs-directory jobs \
  --stemcells-directory stemcell \
  --icon icon.png \
  --output-file "${PRODUCT_NAME}"

#om -k upload-product -p "${PRODUCT_NAME}"
#om -k stage-product -p control-plane -v "${VERSTR}"