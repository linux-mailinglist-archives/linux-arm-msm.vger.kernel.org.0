Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5628B1C935D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 17:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgEGPCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 11:02:15 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:53250 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725948AbgEGPCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 11:02:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588863733; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4CLR+IDmzDOZvUCKFLD+YYbFAcDiqPyT8CwJxegx7B4=; b=jRRvIFqpNPQmNr50xAaTvkdnCAwEhCKKTvk/ipng5RqUH7OZMXebVV6gA5TExdOXk9shcQZK
 vOBvSiHNunsFoM5qgOilwuJTF1RTvJOJ0pNwC7XOvtszNYQmEHisomU2oNK56ntoy6FgoeZC
 DB9MpyxV57LDeoHidYB2sszlhio=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb422c0.7efc276c22d0-smtp-out-n04;
 Thu, 07 May 2020 15:01:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C1CAC38559; Thu,  7 May 2020 15:01:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC065C44795;
        Thu,  7 May 2020 15:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC065C44795
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V6 1/3] dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
Date:   Thu,  7 May 2020 20:30:45 +0530
Message-Id: <1588863647-17240-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert QUP geni-se bindings to DT schema format using json-schema.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V2:
 - As per Stephen's comment corrected defintion of interrupts for UART node.
   Any valid UART node must contain atleast 1 interrupts.

Changes in V3:
 - As per Rob's comment, added number of reg entries for reg property.
 - As per Rob's comment, corrected unit address to hex.
 - As per Rob's comment, created a pattern which matches everything common
   to geni based I2C, SPI and UART controller and then one pattern  for each.
 - As per Rob's comment, restored original example.

Changes in V4:
 - Resolve below compilation error reported from bot.

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/
qcom,geni-se.yaml: properties:clocks:minItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/
qcom,geni-se.yaml: properties:clocks:maxItems: False schema does not allow 2
Documentation/devicetree/bindings/Makefile:12: recipe for target
'Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/soc/qcom/
qcom,geni-se.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

Changes in V6:
 - Added reg entry for soc@0 example node to address below warning.

Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts:22.20-60.11
: Warning (unit_address_vs_reg): /example-0/soc@0: node has a unit name,
but no reg or ranges property

 .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ---------
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 210 +++++++++++++++++++++
 2 files changed, 210 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
deleted file mode 100644
index dab7ca9..0000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
-
-Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
-is a programmable module for supporting a wide range of serial interfaces
-like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
-Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
-Wrapper controller is modeled as a node with zero or more child nodes each
-representing a serial engine.
-
-Required properties:
-- compatible:		Must be "qcom,geni-se-qup".
-- reg:			Must contain QUP register address and length.
-- clock-names:		Must contain "m-ahb" and "s-ahb".
-- clocks:		AHB clocks needed by the device.
-
-Required properties if child node exists:
-- #address-cells: 	Must be <1> for Serial Engine Address
-- #size-cells: 		Must be <1> for Serial Engine Address Size
-- ranges: 		Must be present
-
-Properties for children:
-
-A GENI based QUP wrapper controller node can contain 0 or more child nodes
-representing serial devices.  These serial devices can be a QCOM UART, I2C
-controller, SPI controller, or some combination of aforementioned devices.
-Please refer below the child node definitions for the supported serial
-interface protocols.
-
-Qualcomm Technologies Inc. GENI Serial Engine based I2C Controller
-
-Required properties:
-- compatible:		Must be "qcom,geni-i2c".
-- reg: 			Must contain QUP register address and length.
-- interrupts: 		Must contain I2C interrupt.
-- clock-names: 		Must contain "se".
-- clocks: 		Serial engine core clock needed by the device.
-- #address-cells:	Must be <1> for I2C device address.
-- #size-cells:		Must be <0> as I2C addresses have no size component.
-
-Optional property:
-- clock-frequency:	Desired I2C bus clock frequency in Hz.
-			When missing default to 100000Hz.
-
-Child nodes should conform to I2C bus binding as described in i2c.txt.
-
-Qualcomm Technologies Inc. GENI Serial Engine based UART Controller
-
-Required properties:
-- compatible:		Must be "qcom,geni-debug-uart" or "qcom,geni-uart".
-- reg: 			Must contain UART register location and length.
-- interrupts: 		Must contain UART core interrupts.
-- clock-names:		Must contain "se".
-- clocks:		Serial engine core clock needed by the device.
-
-Qualcomm Technologies Inc. GENI Serial Engine based SPI Controller
-node binding is described in
-Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt.
-
-Example:
-	geniqup@8c0000 {
-		compatible = "qcom,geni-se-qup";
-		reg = <0x8c0000 0x6000>;
-		clock-names = "m-ahb", "s-ahb";
-		clocks = <&clock_gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
-			<&clock_gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		i2c0: i2c@a94000 {
-			compatible = "qcom,geni-i2c";
-			reg = <0xa94000 0x4000>;
-			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "se";
-			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S5_CLK>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&qup_1_i2c_5_active>;
-			pinctrl-1 = <&qup_1_i2c_5_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		uart0: serial@a88000 {
-			compatible = "qcom,geni-debug-uart";
-			reg = <0xa88000 0x7000>;
-			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "se";
-			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&qup_1_uart_3_active>;
-			pinctrl-1 = <&qup_1_uart_3_sleep>;
-		};
-
-	}
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
new file mode 100644
index 0000000..885966f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: GENI Serial Engine QUP Wrapper Controller
+
+maintainers:
+ - Mukesh Savaliya <msavaliy@codeaurora.org>
+ - Akash Asthana <akashast@codeaurora.org>
+
+description: |
+ Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
+ is a programmable module for supporting a wide range of serial interfaces
+ like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
+ Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
+ Wrapper controller is modeled as a node with zero or more child nodes each
+ representing a serial engine.
+
+properties:
+  compatible:
+    enum:
+      - qcom,geni-se-qup
+
+  reg:
+    description: QUP wrapper common register address and length.
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: m-ahb
+      - const: s-ahb
+
+  clocks:
+    items:
+      - description: Master AHB Clock
+      - description: Slave AHB Clock
+
+  "#address-cells":
+     const: 2
+
+  "#size-cells":
+     const: 2
+
+  ranges: true
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description: Common properties for GENI Serial Engine based I2C, SPI and
+                 UART controller.
+
+    properties:
+      reg:
+        description: GENI Serial Engine register address and length.
+        maxItems: 1
+
+      clock-names:
+        const: se
+
+      clocks:
+        description: Serial engine core clock needed by the device.
+        maxItems: 1
+
+    required:
+      - reg
+      - clock-names
+      - clocks
+
+  "spi@[0-9a-f]+$":
+    type: object
+    description: GENI serial engine based SPI controller. SPI in master mode
+                 supports up to 50MHz, up to four chip selects, programmable
+                 data path from 4 bits to 32 bits and numerous protocol
+                 variants.
+    allOf:
+      - $ref: /spi/spi-controller.yaml#
+
+    properties:
+      compatible:
+        enum:
+          - qcom,geni-spi
+
+      interrupts:
+        maxItems: 1
+
+      "#address-cells":
+         const: 1
+
+      "#size-cells":
+         const: 0
+
+    required:
+      - compatible
+      - interrupts
+      - "#address-cells"
+      - "#size-cells"
+
+  "i2c@[0-9a-f]+$":
+    type: object
+    description: GENI serial engine based I2C controller.
+    allOf:
+      - $ref: /schemas/i2c/i2c-controller.yaml#
+
+    properties:
+      compatible:
+        enum:
+          - qcom,geni-i2c
+
+      interrupts:
+        maxItems: 1
+
+      "#address-cells":
+         const: 1
+
+      "#size-cells":
+         const: 0
+
+      clock-frequency:
+        description: Desired I2C bus clock frequency in Hz.
+        default: 100000
+
+    required:
+      - compatible
+      - interrupts
+      - "#address-cells"
+      - "#size-cells"
+
+  "serial@[0-9a-f]+$":
+    type: object
+    description: GENI Serial Engine based UART Controller.
+    allOf:
+      - $ref: /schemas/serial.yaml#
+
+    properties:
+      compatible:
+        enum:
+          - qcom,geni-uart
+          - qcom,geni-debug-uart
+
+      interrupts:
+        minItems: 1
+        maxItems: 2
+        items:
+          - description: UART core irq
+          - description: Wakeup irq (RX GPIO)
+
+    required:
+      - compatible
+      - interrupts
+
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc: soc@0 {
+        reg = <0 0x10000000 0 0x0fffffff>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        geniqup@8c0000 {
+            compatible = "qcom,geni-se-qup";
+            reg = <0 0x008c0000 0 0x6000>;
+            clock-names = "m-ahb", "s-ahb";
+            clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+                <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            i2c0: i2c@a94000 {
+                compatible = "qcom,geni-i2c";
+                reg = <0 0xa94000 0 0x4000>;
+                interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+                clock-names = "se";
+                clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+                pinctrl-names = "default", "sleep";
+                pinctrl-0 = <&qup_1_i2c_5_active>;
+                pinctrl-1 = <&qup_1_i2c_5_sleep>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+
+            uart0: serial@a88000 {
+                compatible = "qcom,geni-uart";
+                reg = <0 0xa88000 0 0x7000>;
+                interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+                clock-names = "se";
+                clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+                pinctrl-names = "default", "sleep";
+                pinctrl-0 = <&qup_1_uart_3_active>;
+                pinctrl-1 = <&qup_1_uart_3_sleep>;
+            };
+        };
+    };
+
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
