Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F752E7847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 12:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgL3L5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 06:57:37 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:59964 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgL3L5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 06:57:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609329436; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=thz2IDBykwRMr66Z/OPr6wBS5lyr7FAojMi9oPY4hh8=; b=JBl/BJY4hyaHnANIvY6uBKMILGfHQNgujh02ZeRjkxW05FaUzgVFkht8FuAU+Z5jEqNScGHo
 R+AtbsD8ly7mlWDojdkX/EgEMIrHj9J6eKlgWggIoiHGgoC6u0lKnjDbepJmWlaSXfMl3DNY
 EbcE30Y7qfPjKqVA4ZTS3r+Q9FE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fec6b02c1fe9bc0e772e16e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Dec 2020 11:56:50
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4962C43464; Wed, 30 Dec 2020 11:56:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC97FC433C6;
        Wed, 30 Dec 2020 11:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC97FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     swboyd@chromium.org, lee.jones@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        mark.rutland@arm.com, linux-arm-msm-owner@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V5 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml format
Date:   Wed, 30 Dec 2020 17:26:22 +0530
Message-Id: <1609329384-15534-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
References: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the bindings from .txt to .yaml format.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 --------------
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 117 +++++++++++++++++++++
 2 files changed, 117 insertions(+), 80 deletions(-)
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
index 0000000..b753bdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMICs multi-function device bindings
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Kiran Gunda <kgunda@codeaurora.org>
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
+      "^[a-zA-Z0-9]$":
+        description:
+          Each child node of SPMI slave id represents a function of the PMIC.
+          In the example below the rtc device node represents a peripheral of
+          pm8941 SID = 0. The regulator device node represents a peripheral of
+          pm8941 SID = 1.
+        type: object
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

