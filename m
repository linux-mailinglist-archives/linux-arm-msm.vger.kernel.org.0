Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAF1A1845C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 12:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgCMLP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 07:15:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:56501 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726605AbgCMLP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 07:15:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584098156; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SliNNIM2Hq0YN1xUZrARYugFT51wfRKserGd09WjZ9s=; b=ursSaaCgoth2e1q16D1CqdFo4pDSWixywSF5kMsgIyRNnfRrZLBHq6YCtaqp1vtGFX1hOtRi
 yY/bHG5frncLl4Y7bmpg1xJnHhKGpfkGHIw73HX1iFiPNKIoYAtDAIv9FAJHVmBxGaC0fGqa
 9LZ9voAAbR76gJsxO+Pp5wo34Gc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b6b5c.7fd9cd9ef490-smtp-out-n01;
 Fri, 13 Mar 2020 11:15:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14E3CC433D2; Fri, 13 Mar 2020 11:15:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2403EC433CB;
        Fri, 13 Mar 2020 11:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2403EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V2 1/2] dt-bindings: spi: Convert QSPI bindings to YAML
Date:   Fri, 13 Mar 2020 16:45:20 +0530
Message-Id: <1584098121-18075-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584098121-18075-1-git-send-email-akashast@codeaurora.org>
References: <1584098121-18075-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert QSPI bindings to DT schema format using json-schema.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Stephen's comment, dropped properties "#address-cells" &
   "#size-cells" from QSPI node as it's already defined in 
   $ref: /spi/spi-controller.yaml#.
 - As per Stephen's comment, dropped description for reg property and
   answered few Nitpicks.

 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.txt | 36 ----------
 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 79 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt
deleted file mode 100644
index 1d64b61..0000000
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Qualcomm Quad Serial Peripheral Interface (QSPI)
-
-The QSPI controller allows SPI protocol communication in single, dual, or quad
-wire transmission modes for read/write access to slaves such as NOR flash.
-
-Required properties:
-- compatible:	An SoC specific identifier followed by "qcom,qspi-v1", such as
-		"qcom,sdm845-qspi", "qcom,qspi-v1"
-- reg:		Should contain the base register location and length.
-- interrupts:	Interrupt number used by the controller.
-- clocks:	Should contain the core and AHB clock.
-- clock-names:	Should be "core" for core clock and "iface" for AHB clock.
-
-SPI slave nodes must be children of the SPI master node and can contain
-properties described in Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Example:
-
-	qspi: spi@88df000 {
-		compatible = "qcom,sdm845-qspi", "qcom,qspi-v1";
-		reg = <0x88df000 0x600>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "iface", "core";
-		clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
-			 <&gcc GCC_QSPI_CORE_CLK>;
-
-		flash@0 {
-			compatible = "jedec,spi-nor";
-			reg = <0>;
-			spi-max-frequency = <25000000>;
-			spi-tx-bus-width = <2>;
-			spi-rx-bus-width = <2>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
new file mode 100644
index 0000000..9582d37
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/spi/qcom,spi-qcom-qspi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Quad Serial Peripheral Interface (QSPI)
+
+maintainers:
+ - Mukesh Savaliya <msavaliy@codeaurora.org>
+ - Akash Asthana <akashast@codeaurora.org>
+
+description:
+ The QSPI controller allows SPI protocol communication in single, dual, or quad
+ wire transmission modes for read/write access to slaves such as NOR flash.
+
+allOf:
+  - $ref: /spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-qspi
+      - const: qcom,qspi-v1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+
+  clocks:
+    items:
+      - description: AHB clock
+      - description: QSPI core clock
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc: soc@0 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qspi: spi@88df000 {
+            compatible = "qcom,sdm845-qspi", "qcom,qspi-v1";
+            reg = <0 0x88df000 0 0x600>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+            clock-names = "iface", "core";
+            clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+                         <&gcc GCC_QSPI_CORE_CLK>;
+
+            flash@0 {
+                compatible = "jedec,spi-nor";
+                reg = <0>;
+                spi-max-frequency = <25000000>;
+                spi-tx-bus-width = <2>;
+                spi-rx-bus-width = <2>;
+            };
+
+        };
+    };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
