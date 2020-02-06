Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71E1154586
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 14:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgBFN4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 08:56:12 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:63157 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726765AbgBFN4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 08:56:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580997371; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vl/gIxiBZYHP/CySTb94sGV3BKfRnMZhF+th9yYcAsI=; b=CvXrtfZiEiVim+LVfW9vr6liEDAB8RwTXayHxSVWRKje74DZyX+XF3AVLiXjVFxtgAgTZ8CJ
 nztgmXnFgJkxmSFCEH8LYWHaKV/MyD+NrIHeaAyExvoCGRMJ1ie2P60bkBUeerRZpXRMj8zU
 ncV3mFVpLKRiFt4EkspKJBl8pes=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3c1af7.7f787ad0f570-smtp-out-n03;
 Thu, 06 Feb 2020 13:56:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33219C4479C; Thu,  6 Feb 2020 13:56:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 90B36C433CB;
        Thu,  6 Feb 2020 13:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 90B36C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc:     rnayak@codeaurora.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V3 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml format
Date:   Thu,  6 Feb 2020 19:25:26 +0530
Message-Id: <1580997328-16365-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the bindings from .txt to .yaml format.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 --------------
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 115 +++++++++++++++++++++
 2 files changed, 115 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
deleted file mode 100644
index fffc8fd..0000000
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-          Qualcomm SPMI PMICs multi-function device bindings
-
-The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA8084
-PMICs.  These PMICs use a QPNP scheme through SPMI interface.
-QPNP is effectively a partitioning scheme for dividing the SPMI extended
-register space up into logical pieces, and set of fixed register
-locations/definitions within these regions, with some of these regions
-specifically used for interrupt handling.
-
-The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
-interfaced to the chip via the SPMI (System Power Management Interface) bus.
-Support for multiple independent functions are implemented by splitting the
-16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
-each. A function can consume one or more of these fixed-size register regions.
-
-Required properties:
-- compatible:      Should contain one of:
-                   "qcom,pm8941",
-                   "qcom,pm8841",
-                   "qcom,pma8084",
-                   "qcom,pm8019",
-                   "qcom,pm8226",
-                   "qcom,pm8110",
-                   "qcom,pma8084",
-                   "qcom,pmi8962",
-                   "qcom,pmd9635",
-                   "qcom,pm8994",
-                   "qcom,pmi8994",
-                   "qcom,pm8916",
-                   "qcom,pm8004",
-                   "qcom,pm8909",
-                   "qcom,pm8950",
-                   "qcom,pmi8950",
-                   "qcom,pm8998",
-                   "qcom,pmi8998",
-                   "qcom,pm8005",
-                   or generalized "qcom,spmi-pmic".
-- reg:             Specifies the SPMI USID slave address for this device.
-                   For more information see:
-                   Documentation/devicetree/bindings/spmi/spmi.txt
-
-Required properties for peripheral child nodes:
-- compatible:      Should contain "qcom,xxx", where "xxx" is a peripheral name.
-
-Optional properties for peripheral child nodes:
-- interrupts:      Interrupts are specified as a 4-tuple. For more information
-                   see:
-                   Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
-- interrupt-names: Corresponding interrupt name to the interrupts property
-
-Each child node of SPMI slave id represents a function of the PMIC. In the
-example below the rtc device node represents a peripheral of pm8941
-SID = 0. The regulator device node represents a peripheral of pm8941 SID = 1.
-
-Example:
-
-	spmi {
-		compatible = "qcom,spmi-pmic-arb";
-
-		pm8941@0 {
-			compatible = "qcom,pm8941", "qcom,spmi-pmic";
-			reg = <0x0 SPMI_USID>;
-
-			rtc {
-				compatible = "qcom,rtc";
-				interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
-				interrupt-names = "alarm";
-			};
-		};
-
-		pm8941@1 {
-			compatible = "qcom,pm8941", "qcom,spmi-pmic";
-			reg = <0x1 SPMI_USID>;
-
-			regulator {
-				compatible = "qcom,regulator";
-				regulator-name = "8941_boost";
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
new file mode 100644
index 0000000..affc169
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/mfd/qcom,spmi-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMICs multi-function device bindings
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+  - Stephen Boyd <sboyd@codeaurora.org>
+
+description: |
+  The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA8084
+  PMICs.  These PMICs use a QPNP scheme through SPMI interface.
+  QPNP is effectively a partitioning scheme for dividing the SPMI extended
+  register space up into logical pieces, and set of fixed register
+  locations/definitions within these regions, with some of these regions
+  specifically used for interrupt handling.
+
+  The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
+  interfaced to the chip via the SPMI (System Power Management Interface) bus.
+  Support for multiple independent functions are implemented by splitting the
+  16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
+  each. A function can consume one or more of these fixed-size register regions.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8941
+      - qcom,pm8841
+      - qcom,pma8084
+      - qcom,pm8019
+      - qcom,pm8226
+      - qcom,pm8110
+      - qcom,pma8084
+      - qcom,pmi8962
+      - qcom,pmd9635
+      - qcom,pm8994
+      - qcom,pmi8994
+      - qcom,pm8916
+      - qcom,pm8004
+      - qcom,pm8909
+      - qcom,pm8950
+      - qcom,pmi8950
+      - qcom,pm8998
+      - qcom,pmi8998
+      - qcom,pm8005
+      - qcom,spmi-pmic
+
+  reg:
+    maxItems: 1
+    description:
+      Specifies the SPMI USID slave address for this device.
+      For more information see Documentation/devicetree/bindings/spmi/spmi.txt
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description:
+      Each child node of SPMI slave id represents a function of the PMIC. In the
+      example below the rtc device node represents a peripheral of pm8941
+      SID = 0. The regulator device node represents a peripheral of pm8941 SID = 1.
+
+    properties:
+      compatible:
+        description:
+          Compatible of the PMIC device.
+
+      interrupts:
+        maxItems: 2
+        description:
+          Interrupts are specified as a 4-tuple. For more information
+          see Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+
+      interrupt-names:
+        description:
+          Corresponding interrupt name to the interrupts property
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spmi {
+        compatible = "qcom,spmi-pmic-arb";
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+       pm8941@0 {
+         compatible = "qcom,pm8941";
+         reg = <0x0 0x0>;
+
+         rtc {
+           compatible = "qcom,rtc";
+           interrupts = <0x0 0x61 0x1 0x1>;
+           interrupt-names = "alarm";
+         };
+       };
+
+       pm8941@1 {
+         compatible = "qcom,pm8941";
+         reg = <0x1 0x0>;
+
+         regulator {
+           compatible = "qcom,regulator";
+           regulator-name = "8941_boost";
+         };
+       };
+    };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
