#!/bin/bash
#
# Copyright 2019-present Open Networking Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

# Generate USIM data
conf_nvram_path=/opt/oaisim/ue/config/ue_comac_test.conf
gen_nvram_path=/etc/oaisim/ue
cd /openairinterface5g/cmake_targets
cp /opt/oaisim/ue/config/ue_comac_test.conf .
cat >> ue_comac_test.conf << EOF
    UE2: {
          USER: {
                IMEI="356113022094151";
                MANUFACTURER="OAISIM";
                MODEL="OAISIM";
                PIN="0000";
          };
          SIM: {
               MSIN={{ .Values.config.ue2.sim.msin | quote }};
               USIM_API_K={{ .Values.config.ue2.sim.api_key | quote }};
               OPC={{ .Values.config.ue2.sim.opc | quote }};
               MSISDN={{ .Values.config.ue2.sim.msisdn | quote }};
};
          HPLMN= {{ $plmn }};
          UCPLMN_LIST = ();
          OPLMN_LIST = ({{ $plmn }});
          OCPLMN_LIST = ();
          FPLMN_LIST = ();
          EHPLMN_LIST= ();
        };
EOF

./nvram --gen -c ue_comac_test.conf -o $gen_nvram_path
./usim --gen -c ue_comac_test.conf -o $gen_nvram_path
