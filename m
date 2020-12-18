Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F0E2DDF75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 09:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732989AbgLRIQ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Dec 2020 03:16:26 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:54569 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732696AbgLRIQZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Dec 2020 03:16:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608279365; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ruXFCXiGdFcUYLLXffsQYmn6STh2yNl3AmxECua38fw=; b=oLNvEftaKaIuN3AI0Gs2VjnCOtR8adRAanqLj90DuRqdgokKVTzLLKL4xMMZVnwR1qL2ol24
 PbRexozMvBJev/sahbyFTwT5sT3/npDNgGx/JsP35xCty/9EjA9Mjv2JW0Bya+TtJlutBvoK
 uOtEjMzdi+LAjTH4Ia0vxQ9hG2E=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fdc65187549779c5bbb3201 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 08:15:20
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 053F8C43463; Fri, 18 Dec 2020 08:15:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35B47C433CA;
        Fri, 18 Dec 2020 08:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35B47C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     robh@kernel.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V4 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml format
Date:   Fri, 18 Dec 2020 13:44:51 +0530
Message-Id: <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org>
References: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the bindings from .txt to .yaml format.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 -------------
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 127 +++++++++++++++++++++
 2 files changed, 127 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
deleted file mode 100644
index 79367a4..0000000
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
-                   Documentation/devicetree/bindings/spmi/spmi.yaml
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
index 0000000..e458dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMICs multi-function device bindings
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  The Qualcomm SPMI PMICs use a QPNP scheme through SPMI interface.
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
+  spmi_bus:
+    type: object
+    description: SPMI bus node
+
+patternProperties:
+  "^pmic@[0-9]$":
+    description: Child PMIC nodes
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              # Sorted based on subtype ID the device reports
+              - qcom,pm8941
+              - qcom,pm8841
+              - qcom,pma8084
+              - qcom,pm8019
+              - qcom,pm8226
+              - qcom,pm8110
+              - qcom,pma8084
+              - qcom,pmi8962
+              - qcom,pmd9635
+              - qcom,pm8994
+              - qcom,pmi8994
+              - qcom,pm8916
+              - qcom,pm8004
+              - qcom,pm8909
+              - qcom,pm8950
+              - qcom,pmi8950
+              - qcom,pm8998
+              - qcom,pmi8998
+              - qcom,pm8005
+              - qcom,pm660l
+              - qcom,pm660
+
+          - enum:
+              - qcom,spmi-pmic
+
+      reg:
+        maxItems: 1
+        description:
+          Specifies the SPMI USID slave address for this device.
+          For more information see bindings/spmi/spmi.txt
+
+    patternProperties:
+      "@[0-9a-f]$":
+        description:
+          Each child node of SPMI slave id represents a function of the PMIC.
+          In the example below the rtc device node represents a peripheral of
+          pm8941 SID = 0. The regulator device node represents a peripheral of
+          pm8941 SID = 1.
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 4
+            description:
+              Interrupts are specified as a 4-tuple. For more information
+              see bindings/spmi/qcom,spmi-pmic-arb.txt
+
+          interrupt-names:
+            description:
+              Corresponding interrupt name to the interrupts property
+
+    required:
+      - compatible
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi_bus {
+        compatible = "qcom,spmi-pmic-arb";
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@0 {
+         compatible = "qcom,pm8941";
+         reg = <0x0 SPMI_USID>;
+
+         rtc {
+           compatible = "qcom,rtc";
+           interrupts = <0x0 0x61 0x1 0x1>;
+           interrupt-names = "alarm";
+          };
+        };
+
+        pmic@1 {
+         compatible = "qcom,pm8941";
+         reg = <0x1 SPMI_USID>;
+
+         regulator {
+           compatible = "qcom,regulator";
+           regulator-name = "8941_boost";
+           };
+          };
+        };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

