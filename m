Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF33820491D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 07:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgFWFSd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 01:18:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40127 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730544AbgFWFSd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 01:18:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592889511; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fWOSD62PEEBNnIFjGuPL7z6OKLCNXuAB1dMfCYPmYoY=; b=D9Tv4A/VI8+g+oo4vl847TDn1K02VSjjrVqs+i95rMxGxuPp9kZxquF+FtuTw/BjP5uqgo77
 2Ffjxx+SssxBK2M4FdqM/T7WpiiwcuUczBLuW6bulatdwFfI6xDwIxZDREnRCFfUmcjSnaZx
 zLC4+Bjk3cixb+hKSbYRQRDv6ZU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ef190a74c9690533a6c329d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 05:18:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CED55C433CA; Tue, 23 Jun 2020 05:18:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1044C433A0;
        Tue, 23 Jun 2020 05:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1044C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH V2 6/6] dt-bindings: regulator: convert QCOM SMD-RPM regulator document to YAML schema
Date:   Tue, 23 Jun 2020 10:47:52 +0530
Message-Id: <1592889472-6843-7-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert qcom,smd-rpm-regulator.txt document to YAML schema

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 321 ---------------------
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
 2 files changed, 106 insertions(+), 321 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
deleted file mode 100644
index 728c001..00000000
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
+++ /dev/null
@@ -1,321 +0,0 @@
-QCOM SMD RPM REGULATOR
-
-The Qualcomm RPM over SMD regulator is modelled as a subdevice of the RPM.
-Because SMD is used as the communication transport mechanism, the RPM resides as
-a subnode of the SMD.  As such, the SMD-RPM regulator requires that the SMD and
-RPM nodes be present.
-
-Please refer to Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt for
-information pertaining to the SMD node.
-
-Please refer to Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt for
-information regarding the RPM node.
-
-== Regulator
-
-Regulator nodes are identified by their compatible:
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,rpm-mp5496-regulators"
-		    "qcom,rpm-pm8841-regulators"
-		    "qcom,rpm-pm8916-regulators"
-		    "qcom,rpm-pm8941-regulators"
-		    "qcom,rpm-pm8950-regulators"
-		    "qcom,rpm-pm8994-regulators"
-		    "qcom,rpm-pm8998-regulators"
-		    "qcom,rpm-pma8084-regulators"
-		    "qcom,rpm-pmi8994-regulators"
-		    "qcom,rpm-pmi8998-regulators"
-		    "qcom,rpm-pms405-regulators"
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_s5-supply:
-- vdd_s6-supply:
-- vdd_s7-supply:
-- vdd_s8-supply:
-	Usage: optional (pm8841 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_l1_l2_l3-supply:
-- vdd_l4_l5_l6-supply:
-- vdd_l7-supply:
-- vdd_l8_l9_l10_l11_l12_l13_l14_l15_l16_l17_l18-supply:
-	Usage: optional (pm8916 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_s4-supply:
-- vdd_s5-supply:
-- vdd_s6-supply:
-- vdd_l1_l19-supply:
-- vdd_l2_l23-supply:
-- vdd_l3-supply:
-- vdd_l4_l5_l6_l7_l16-supply:
-- vdd_l8_l11_l12_l17_l22-supply:
-- vdd_l9_l10_l13_l14_l15_l18-supply:
-- vdd_l20-supply:
-- vdd_l21-supply:
-	Usage: optional (pm8950 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_l1_l3-supply:
-- vdd_l2_lvs1_2_3-supply:
-- vdd_l4_l11-supply:
-- vdd_l5_l7-supply:
-- vdd_l6_l12_l14_l15-supply:
-- vdd_l8_l16_l18_l19-supply:
-- vdd_l9_l10_l17_l22-supply:
-- vdd_l13_l20_l23_l24-supply:
-- vdd_l21-supply:
-- vin_5vs-supply:
-	Usage: optional (pm8941 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_s5-supply:
-- vdd_s6-supply:
-- vdd_s7-supply:
-- vdd_s8-supply:
-- vdd_s9-supply:
-- vdd_s10-supply:
-- vdd_s11-supply:
-- vdd_s12-supply:
-- vdd_l1-supply:
-- vdd_l2_l26_l28-supply:
-- vdd_l3_l11-supply:
-- vdd_l4_l27_l31-supply:
-- vdd_l5_l7-supply:
-- vdd_l6_l12_l32-supply:
-- vdd_l5_l7-supply:
-- vdd_l8_l16_l30-supply:
-- vdd_l9_l10_l18_l22-supply:
-- vdd_l9_l10_l18_l22-supply:
-- vdd_l3_l11-supply:
-- vdd_l6_l12_l32-supply:
-- vdd_l13_l19_l23_l24-supply:
-- vdd_l14_l15-supply:
-- vdd_l14_l15-supply:
-- vdd_l8_l16_l30-supply:
-- vdd_l17_l29-supply:
-- vdd_l9_l10_l18_l22-supply:
-- vdd_l13_l19_l23_l24-supply:
-- vdd_l20_l21-supply:
-- vdd_l20_l21-supply:
-- vdd_l9_l10_l18_l22-supply:
-- vdd_l13_l19_l23_l24-supply:
-- vdd_l13_l19_l23_l24-supply:
-- vdd_l25-supply:
-- vdd_l2_l26_l28-supply:
-- vdd_l4_l27_l31-supply:
-- vdd_l2_l26_l28-supply:
-- vdd_l17_l29-supply:
-- vdd_l8_l16_l30-supply:
-- vdd_l4_l27_l31-supply:
-- vdd_l6_l12_l32-supply:
-- vdd_lvs1_2-supply:
-	Usage: optional (pm8994 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_bst_byp-supply:
-	Usage: optional (pmi8994 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_s5-supply:
-- vdd_s6-supply:
-- vdd_s7-supply:
-- vdd_s8-supply:
-- vdd_s9-supply:
-- vdd_s10-supply:
-- vdd_s11-supply:
-- vdd_s12-supply:
-- vdd_s13-supply:
-- vdd_l1_l27-supply:
-- vdd_l20_l24-supply:
-- vdd_l26-supply:
-- vdd_l2_l8_l17-supply:
-- vdd_l3_l11-supply:
-- vdd_l4_l5-supply:
-- vdd_l6-supply:
-- vdd_l7_l12_l14_l15-supply:
-- vdd_l9-supply:
-- vdd_l10_l23_l25-supply:
-- vdd_l13_l19_l21-supply:
-- vdd_l16_l28-supply:
-- vdd_l18_l22-supply:
-- vdd_lvs1_lvs2-supply:
-	Usage: optional (pmi8998 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_s5-supply:
-- vdd_s6-supply:
-- vdd_s7-supply:
-- vdd_s8-supply:
-- vdd_s9-supply:
-- vdd_s10-supply:
-- vdd_s11-supply:
-- vdd_s12-supply:
-- vdd_l1_l11-supply:
-- vdd_l2_l3_l4_l27-supply:
-- vdd_l5_l7-supply:
-- vdd_l6_l12_l14_l15_l26-supply:
-- vdd_l8-supply:
-- vdd_l9_l10_l13_l20_l23_l24-supply:
-- vdd_l16_l25-supply:
-- vdd_l17-supply:
-- vdd_l18-supply:
-- vdd_l19-supply:
-- vdd_l21-supply:
-- vdd_l22-supply:
-	Usage: optional (pma8084 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_bob-supply:
-	Usage: optional (pmi8998 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-- vdd_s1-supply:
-- vdd_s2-supply:
-- vdd_s3-supply:
-- vdd_s4-supply:
-- vdd_s5-supply:
-- vdd_l1_l2-supply:
-- vdd_l3_l8-supply:
-- vdd_l4-supply:
-- vdd_l5_l6-supply:
-- vdd_l7-supply:
-- vdd_l3_l8-supply:
-- vdd_l9-supply:
-- vdd_l10_l11_l12_l13-supply:
-	Usage: optional (pms405 only)
-	Value type: <phandle>
-	Definition: reference to regulator supplying the input pin, as
-		    described in the data sheet
-
-The regulator node houses sub-nodes for each regulator within the device. Each
-sub-node is identified using the node's name, with valid values listed for each
-of the pmics below.
-
-pm8841:
-	s1, s2, s3, s4, s5, s6, s7, s8
-
-pm8916:
-	s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13,
-	l14, l15, l16, l17, l18
-
-pm8941:
-	s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13,
-	l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, lvs1, lvs2,
-	lvs3, 5vs1, 5vs2
-
-pm8994:
-	s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3, l4, l5,
-	l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20,
-	l21, l22, l23, l24, l25, l26, l27, l28, l29, l30, l31, l32, lvs1, lvs2
-
-pm8998:
-	s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, l1, l2, l3, l4,
-	l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
-	l20, l21, l22, l23, l24, l25, l26, l27, l28, lvs1, lvs2
-
-pma8084:
-	s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3, l4, l5,
-	l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20,
-	l21, l22, l23, l24, l25, l26, l27, lvs1, lvs2, lvs3, lvs4, 5vs1
-
-pmi8994:
-	s1, s2, s3, boost-bypass
-
-pmi8998:
-	bob
-
-pms405:
-	s1, s2, s3, s4, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12,
-	l13
-
-The content of each sub-node is defined by the standard binding for regulators -
-see regulator.txt.
-
-= EXAMPLE
-
-	smd {
-		compatible = "qcom,smd";
-
-		rpm {
-			interrupts = <0 168 1>;
-			qcom,ipc = <&apcs 8 0>;
-			qcom,smd-edge = <15>;
-
-			rpm_requests {
-				compatible = "qcom,rpm-msm8974";
-				qcom,smd-channels = "rpm_requests";
-
-				pm8941-regulators {
-					compatible = "qcom,rpm-pm8941-regulators";
-					vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;
-
-					pm8941_s3: s3 {
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-					};
-
-					pm8941_boost: s4 {
-						regulator-min-microvolt = <5000000>;
-						regulator-max-microvolt = <5000000>;
-					};
-
-					pm8941_l20: l20 {
-						regulator-min-microvolt = <2950000>;
-						regulator-max-microvolt = <2950000>;
-					};
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
new file mode 100644
index 00000000..8d212bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,smd-rpm-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM SMD RPM REGULATOR
+
+description:
+  The Qualcomm RPM over SMD regulator is modelled as a subdevice of the RPM.
+  Because SMD is used as the communication transport mechanism, the RPM
+  resides as a subnode of the SMD.  As such, the SMD-RPM regulator requires
+  that the SMD and RPM nodes be present.
+
+  Please refer to Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt for
+  information pertaining to the SMD node.
+
+  Please refer to Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+  for information regarding the RPM node.
+
+  The regulator node houses sub-nodes for each regulator within the device.
+  Each sub-node is identified using the node's name, with valid values listed
+  for each of the pmics below.
+
+  For pm8841, s1, s2, s3, s4, s5, s6, s7, s8
+
+  For pm8916, s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
+  l12, l13, l14, l15, l16, l17, l18
+
+  For pm8941, s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
+  l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, lvs1, lvs2,
+  lvs3, 5vs1, 5vs2
+
+  For pm8994, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3,
+  l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
+  l20, l21, l22, l23, l24, l25, l26, l27, l28, l29, l30, l31, l32, lvs1, lvs2
+
+  For pm8998, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, l1, l2,
+  l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
+  l20, l21, l22, l23, l24, l25, l26, l27, l28, lvs1, lvs2
+
+  For pma8084, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3,
+  l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
+  l20, l21, l22, l23, l24, l25, l26, l27, lvs1, lvs2, lvs3, lvs4, 5vs1
+
+  For pmi8994, s1, s2, s3, boost-bypass
+
+  For pmi8998, bob
+
+  For pms405, s1, s2, s3, s4, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
+  l12, l13
+
+maintainers:
+  - Kathiravan T <kathirav@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,rpm-mp5496-regulators
+      - qcom,rpm-pm8841-regulators
+      - qcom,rpm-pm8916-regulators
+      - qcom,rpm-pm8941-regulators
+      - qcom,rpm-pm8950-regulators
+      - qcom,rpm-pm8994-regulators
+      - qcom,rpm-pm8998-regulators
+      - qcom,rpm-pma8084-regulators
+      - qcom,rpm-pmi8994-regulators
+      - qcom,rpm-pmi8998-regulators
+      - qcom,rpm-pms405-regulators
+
+patternProperties:
+  ".*-supply$":
+    description: Input supply phandle(s) for this node
+
+  "^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$":
+    description: List of regulators and its properties
+    allOf:
+     - $ref: regulator.yaml#
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    pm8941-regulators {
+        compatible = "qcom,rpm-pm8941-regulators";
+        vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;
+
+        pm8941_s3: s3 {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+        };
+
+        pm8941_boost: s4 {
+            regulator-min-microvolt = <5000000>;
+            regulator-max-microvolt = <5000000>;
+        };
+
+        pm8941_l20: l20 {
+            regulator-min-microvolt = <2950000>;
+            regulator-max-microvolt = <2950000>;
+        };
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

