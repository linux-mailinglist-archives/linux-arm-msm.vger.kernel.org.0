Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC7434FFF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 14:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbhCaMHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 08:07:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:3910 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235386AbhCaMGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 08:06:34 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 31 Mar 2021 05:06:33 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Mar 2021 05:06:31 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 Mar 2021 17:35:59 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id EA35849FA; Wed, 31 Mar 2021 17:35:57 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 4/5] dt-bindings: regulator: Convert RPMh regulator bindings to YAML
Date:   Wed, 31 Mar 2021 17:35:38 +0530
Message-Id: <1617192339-3760-5-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert RPMh regulator bindings from .txt to .yaml format.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - As per Mark's comment moved this patch to the end of series.
 - As per Rob's comments,  added flash and rgb bindings, dropped allOf and
   unused labels and fixed few other things.

Changes in V3:
 - Fixed bot errors and also changed commit text to specify RPMh regulator
   bindings.

 .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 ---------------------
 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 158 ++++++++++++++++++
 2 files changed, 158 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
deleted file mode 100644
index ce1e043..0000000
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ /dev/null
@@ -1,180 +0,0 @@
-Qualcomm Technologies, Inc. RPMh Regulators
-
-rpmh-regulator devices support PMIC regulator management via the Voltage
-Regulator Manager (VRM) and Oscillator Buffer (XOB) RPMh accelerators.  The APPS
-processor communicates with these hardware blocks via a Resource State
-Coordinator (RSC) using command packets.  The VRM allows changing three
-parameters for a given regulator: enable state, output voltage, and operating
-mode.  The XOB allows changing only a single parameter for a given regulator:
-its enable state.  Despite its name, the XOB is capable of controlling the
-enable state of any PMIC peripheral.  It is used for clock buffers, low-voltage
-switches, and LDO/SMPS regulators which have a fixed voltage and mode.
-
-=======================
-Required Node Structure
-=======================
-
-RPMh regulators must be described in two levels of device nodes.  The first
-level describes the PMIC containing the regulators and must reside within an
-RPMh device node.  The second level describes each regulator within the PMIC
-which is to be used on the board.  Each of these regulators maps to a single
-RPMh resource.
-
-The names used for regulator nodes must match those supported by a given PMIC.
-Supported regulator node names:
-	PM8005:		smps1 - smps4
-	PM8009:		smps1 - smps2, ldo1 - ldo7
-	PM8150:		smps1 - smps10, ldo1 - ldo18
-	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
-	PM8350:		smps1 - smps12, ldo1 - ldo10,
-	PM8350C:	smps1 - smps10, ldo1 - ldo13, bob
-	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
-	PMI8998:	bob
-	PM6150:         smps1 - smps5, ldo1 - ldo19
-	PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
-	PMX55:		smps1 - smps7, ldo1 - ldo16
-
-========================
-First Level Nodes - PMIC
-========================
-
-- compatible
-	Usage:      required
-	Value type: <string>
-	Definition: Must be one of below:
-		    "qcom,pm8005-rpmh-regulators"
-		    "qcom,pm8009-rpmh-regulators"
-		    "qcom,pm8009-1-rpmh-regulators"
-		    "qcom,pm8150-rpmh-regulators"
-		    "qcom,pm8150l-rpmh-regulators"
-		    "qcom,pm8350-rpmh-regulators"
-		    "qcom,pm8350c-rpmh-regulators"
-		    "qcom,pm8998-rpmh-regulators"
-		    "qcom,pmc8180-rpmh-regulators"
-		    "qcom,pmc8180c-rpmh-regulators"
-		    "qcom,pmi8998-rpmh-regulators"
-		    "qcom,pm6150-rpmh-regulators"
-		    "qcom,pm6150l-rpmh-regulators"
-		    "qcom,pmx55-rpmh-regulators"
-
-- qcom,pmic-id
-	Usage:      required
-	Value type: <string>
-	Definition: RPMh resource name suffix used for the regulators found on
-		    this PMIC.  Typical values: "a", "b", "c", "d", "e", "f".
-
-- vdd-s1-supply
-- vdd-s2-supply
-- vdd-s3-supply
-- vdd-s4-supply
-	Usage:      optional (PM8998 and PM8005 only)
-	Value type: <phandle>
-	Definition: phandle of the parent supply regulator of one or more of the
-		    regulators for this PMIC.
-
-- vdd-s5-supply
-- vdd-s6-supply
-- vdd-s7-supply
-- vdd-s8-supply
-- vdd-s9-supply
-- vdd-s10-supply
-- vdd-s11-supply
-- vdd-s12-supply
-- vdd-s13-supply
-- vdd-l1-l27-supply
-- vdd-l2-l8-l17-supply
-- vdd-l3-l11-supply
-- vdd-l4-l5-supply
-- vdd-l6-supply
-- vdd-l7-l12-l14-l15-supply
-- vdd-l9-supply
-- vdd-l10-l23-l25-supply
-- vdd-l13-l19-l21-supply
-- vdd-l16-l28-supply
-- vdd-l18-l22-supply
-- vdd-l20-l24-supply
-- vdd-l26-supply
-- vin-lvs-1-2-supply
-	Usage:      optional (PM8998 only)
-	Value type: <phandle>
-	Definition: phandle of the parent supply regulator of one or more of the
-		    regulators for this PMIC.
-
-- vdd-bob-supply
-	Usage:      optional (PMI8998 only)
-	Value type: <phandle>
-	Definition: BOB regulator parent supply phandle
-
-===============================
-Second Level Nodes - Regulators
-===============================
-
-- qcom,always-wait-for-ack
-	Usage:      optional
-	Value type: <empty>
-	Definition: Boolean flag which indicates that the application processor
-		    must wait for an ACK or a NACK from RPMh for every request
-		    sent for this regulator including those which are for a
-		    strictly lower power state.
-
-Other properties defined in Documentation/devicetree/bindings/regulator/regulator.txt
-may also be used.  regulator-initial-mode and regulator-allowed-modes may be
-specified for VRM regulators using mode values from
-include/dt-bindings/regulator/qcom,rpmh-regulator.h.  regulator-allow-bypass
-may be specified for BOB type regulators managed via VRM.
-regulator-allow-set-load may be specified for LDO type regulators managed via
-VRM.
-
-========
-Examples
-========
-
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-&apps_rsc {
-	pm8998-rpmh-regulators {
-		compatible = "qcom,pm8998-rpmh-regulators";
-		qcom,pmic-id = "a";
-
-		vdd-l7-l12-l14-l15-supply = <&pm8998_s5>;
-
-		smps2 {
-			regulator-min-microvolt = <1100000>;
-			regulator-max-microvolt = <1100000>;
-		};
-
-		pm8998_s5: smps5 {
-			regulator-min-microvolt = <1904000>;
-			regulator-max-microvolt = <2040000>;
-		};
-
-		ldo7 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allowed-modes =
-				<RPMH_REGULATOR_MODE_LPM
-				 RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-		};
-
-		lvs1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-	};
-
-	pmi8998-rpmh-regulators {
-		compatible = "qcom,pmi8998-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		bob {
-			regulator-min-microvolt = <3312000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-allowed-modes =
-				<RPMH_REGULATOR_MODE_AUTO
-				 RPMH_REGULATOR_MODE_HPM>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
new file mode 100644
index 0000000..ac13c3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. RPMh Regulators
+
+maintainers:
+  - David Collins <collinsd@codeaurora.org>
+
+description: |
+    rpmh-regulator devices support PMIC regulator management via the Voltage
+    Regulator Manager (VRM) and Oscillator Buffer (XOB) RPMh accelerators.
+    The APPS processor communicates with these hardware blocks via a
+    Resource State Coordinator (RSC) using command packets.  The VRM allows
+    changing three parameters for a given regulator, enable state, output
+    voltage, and operating mode.  The XOB allows changing only a single
+    parameter for a given regulator, its enable state.  Despite its name,
+    the XOB is capable of controlling the enable state of any PMIC peripheral.
+    It is used for clock buffers, low-voltage switches, and LDO/SMPS regulators
+    which have a fixed voltage and mode.
+
+    =======================
+    Required Node Structure
+    =======================
+
+    RPMh regulators must be described in two levels of device nodes.  The first
+    level describes the PMIC containing the regulators and must reside within an
+    RPMh device node.  The second level describes each regulator within the PMIC
+    which is to be used on the board.  Each of these regulators maps to a single
+    RPMh resource.
+
+    The names used for regulator nodes must match those supported by a given
+    PMIC. Supported regulator node names are
+      For PM8005, smps1 - smps4
+      For PM8009, smps1 - smps2, ldo1 - ldo7
+      For PM8150, smps1 - smps10, ldo1 - ldo18
+      For PM8150L, smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
+      For PM8350, smps1 - smps12, ldo1 - ldo10
+      For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
+      For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+      For PMI8998, bob
+      For PM6150, smps1 - smps5, ldo1 - ldo19
+      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
+      For PMX55, smps1 - smps7, ldo1 - ldo16
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8005-rpmh-regulators
+      - qcom,pm8009-rpmh-regulators
+      - qcom,pm8009-1-rpmh-regulators
+      - qcom,pm8150-rpmh-regulators
+      - qcom,pm8150l-rpmh-regulators
+      - qcom,pm8350-rpmh-regulators
+      - qcom,pm8350c-rpmh-regulators
+      - qcom,pm8998-rpmh-regulators
+      - qcom,pmi8998-rpmh-regulators
+      - qcom,pm6150-rpmh-regulators
+      - qcom,pm6150l-rpmh-regulators
+      - qcom,pmx55-rpmh-regulators
+
+  qcom,pmic-id:
+    description: |
+        RPMh resource name suffix used for the regulators found
+        on this PMIC.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [a, b, c, d, e, f]
+
+  qcom,always-wait-for-ack:
+    description: |
+        Boolean flag which indicates that the application processor
+        must wait for an ACK or a NACK from RPMh for every request
+        sent for this regulator including those which are for a
+        strictly lower power state.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  vdd-flash-supply:
+    description: Input supply phandle of flash.
+
+  vdd-rgb-supply:
+    description: Input supply phandle of rgb.
+
+  vin-lvs-1-2-supply:
+    description: Input supply phandle of one or more regulators.
+
+  vdd-bob-supply:
+    description: BOB regulator parent supply phandle.
+
+  bob:
+    type: object
+    $ref: "regulator.yaml#"
+    description: BOB regulator node.
+
+patternProperties:
+  "^vdd-s([0-9]+)-supply$":
+    description: Input supply phandle(s) of one or more regulators.
+
+  "^vdd-(l[0-9]+[-]){1,5}supply$":
+    description: Input supply phandle(s) of one or more regulators.
+
+  "^(smps|ldo|lvs)[0-9]+$":
+    type: object
+    $ref: "regulator.yaml#"
+    description: smps/ldo regulator nodes(s).
+
+additionalProperties: false
+
+required:
+  - compatible
+  - qcom,pmic-id
+
+examples:
+  - |
+    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+    pm8998-rpmh-regulators {
+        compatible = "qcom,pm8998-rpmh-regulators";
+        qcom,pmic-id = "a";
+
+        vdd-l7-l12-l14-l15-supply = <&pm8998_s5>;
+
+        smps2 {
+            regulator-min-microvolt = <1100000>;
+            regulator-max-microvolt = <1100000>;
+        };
+
+        ldo7 {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+            regulator-allowed-modes =
+                <RPMH_REGULATOR_MODE_LPM
+                 RPMH_REGULATOR_MODE_HPM>;
+            regulator-allow-set-load;
+        };
+
+        lvs1 {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+        };
+    };
+
+    pmi8998-rpmh-regulators {
+        compatible = "qcom,pmi8998-rpmh-regulators";
+        qcom,pmic-id = "b";
+
+        bob {
+            regulator-min-microvolt = <3312000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-allowed-modes =
+                <RPMH_REGULATOR_MODE_AUTO
+                 RPMH_REGULATOR_MODE_HPM>;
+            regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+        };
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

