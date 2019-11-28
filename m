Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E91F10C7F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 12:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfK1Ldk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 06:33:40 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:28167 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726383AbfK1Ldj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 06:33:39 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Nov 2019 17:03:32 +0530
IronPort-SDR: qaAwLWiBhTycdIgQjI1VRac2sYSm3bP8PCucdsT0URiY8D5xaa2Ar9Yder4aHsP1mARgJ42LU0
 kupfEYpqVykBQ58JOBuoTT2XAxXxkgNjc1mWGvrO/8e1+0+P/K397ZiIZvm99LubwMvGaFaKc3
 GuDVwF8ZoTmePZ6iH/bab+bc5L7ud5QWTnAUOY87x2HyAAgQDHerD70uYQThe0aavVLlGYJMgo
 yUQB9MyBi1zHFsA4Frnt2iWu3nwKTEv1ZEaoaiuZDPqJyBVkT7m4r7a8qqcRXSzLoEfcJvgajE
 ZnWAMy48QBNqpuNRFnAQlhB6
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Nov 2019 17:03:13 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 1A0FF19B8; Thu, 28 Nov 2019 17:03:12 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
Date:   Thu, 28 Nov 2019 17:03:06 +0530
Message-Id: <1574940787-1004-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert USB DWC3 bindings to DT schema format using json-schema.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 --------------
 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 155 +++++++++++++++++++++
 2 files changed, 155 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
deleted file mode 100644
index cb695aa..0000000
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ /dev/null
@@ -1,104 +0,0 @@
-Qualcomm SuperSpeed DWC3 USB SoC controller
-
-Required properties:
-- compatible:		Compatible list, contains
-			"qcom,dwc3"
-			"qcom,msm8996-dwc3" for msm8996 SOC.
-			"qcom,msm8998-dwc3" for msm8998 SOC.
-			"qcom,sdm845-dwc3" for sdm845 SOC.
-- reg:			Offset and length of register set for QSCRATCH wrapper
-- power-domains:	specifies a phandle to PM domain provider node
-- clocks:		A list of phandle + clock-specifier pairs for the
-				clocks listed in clock-names
-- clock-names:		Should contain the following:
-  "core"		Master/Core clock, have to be >= 125 MHz for SS
-				operation and >= 60MHz for HS operation
-  "mock_utmi"		Mock utmi clock needed for ITP/SOF generation in
-				host mode. Its frequency should be 19.2MHz.
-  "sleep"		Sleep clock, used for wakeup when USB3 core goes
-				into low power mode (U3).
-
-Optional clocks:
-  "iface"		System bus AXI clock.
-			Not present on "qcom,msm8996-dwc3" compatible.
-  "cfg_noc"		System Config NOC clock.
-			Not present on "qcom,msm8996-dwc3" compatible.
-- assigned-clocks:	Should be:
-				MOCK_UTMI_CLK
-				MASTER_CLK
-- assigned-clock-rates: Should be:
-                                19.2Mhz (192000000) for MOCK_UTMI_CLK
-                                >=125Mhz (125000000) for MASTER_CLK in SS mode
-                                >=60Mhz (60000000) for MASTER_CLK in HS mode
-
-Optional properties:
-- resets:		Phandle to reset control that resets core and wrapper.
-- interrupts:		specifies interrupts from controller wrapper used
-			to wakeup from low power/susepnd state.	Must contain
-			one or more entry for interrupt-names property
-- interrupt-names:	Must include the following entries:
-			- "hs_phy_irq": The interrupt that is asserted when a
-			   wakeup event is received on USB2 bus
-			- "ss_phy_irq": The interrupt that is asserted when a
-			   wakeup event is received on USB3 bus
-			- "dm_hs_phy_irq" and "dp_hs_phy_irq": Separate
-			   interrupts for any wakeup event on DM and DP lines
-- qcom,select-utmi-as-pipe-clk: if present, disable USB3 pipe_clk requirement.
-				Used when dwc3 operates without SSPHY and only
-				HS/FS/LS modes are supported.
-
-Required child node:
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-Phy documentation is provided in the following places:
-Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
-Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
-
-Example device nodes:
-
-		hs_phy: phy@100f8800 {
-			compatible = "qcom,qusb2-v2-phy";
-			...
-		};
-
-		ss_phy: phy@100f8830 {
-			compatible = "qcom,qmp-v3-usb3-phy";
-			...
-		};
-
-		usb3_0: usb30@a6f8800 {
-			compatible = "qcom,dwc3";
-			reg = <0xa6f8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-				  "dm_hs_phy_irq", "dp_hs_phy_irq";
-
-			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-				<&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-				<&gcc GCC_USB30_PRIM_SLEEP_CLK>;
-			clock-names = "core", "mock_utmi", "sleep";
-
-			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <133000000>;
-
-			resets = <&gcc GCC_USB30_PRIM_BCR>;
-			reset-names = "core_reset";
-			power-domains = <&gcc USB30_PRIM_GDSC>;
-			qcom,select-utmi-as-pipe-clk;
-
-			dwc3@10000000 {
-				compatible = "snps,dwc3";
-				reg = <0x10000000 0xcd00>;
-				interrupts = <0 205 0x4>;
-				phys = <&hs_phy>, <&ss_phy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				dr_mode = "host";
-			};
-		};
-
diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
new file mode 100644
index 0000000..48ff9c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Manu Gautam <mgautam@codeaurora.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,msm8996-dwc3
+          - qcom,msm8998-dwc3
+          - qcom,sdm845-dwc3
+      - const: qcom,dwc3
+
+  reg:
+    description: Offset and length of register set for QSCRATCH wrapper
+    maxItems: 1
+
+  power-domains:
+    description: specifies a phandle to PM domain provider node
+    maxItems: 1
+
+  clocks:
+    description:
+      A list of phandle and clock-specifier pairs for the clocks
+      listed in clock-names.
+    maxItems: 5
+
+  clock-names:
+    maxItems: 5
+    items:
+    #Master/Core clock, have to be >= 125 MHz for SS operation
+    # and >= 60MHz for HS operation
+      - const: core
+    #Mock utmi clock needed for ITP/SOF generation in host mode.
+    #Its frequency should be 19.2MHz.
+      - const: mock_utmi
+    #Sleep clock, used for wakeup when USB3 core goes into low power mode (U3).
+      - const: sleep
+    #Optional:System bus AXI clock.Not present on "qcom,msm8996-dwc3" compatible.
+      - const: iface
+    #Optional:System Config NOC clock.Not present on "qcom,msm8996-dwc3" compatible.
+      - const: cfg_noc
+
+  assigned-clocks:
+    description:
+      Should be MOCK_UTMI_CLK and MASTER_CLK
+    maxItems: 2
+
+  assigned-clock-rates:
+    description:
+      Should be 19.2Mhz (192000000) for MOCK_UTMI_CLK
+      >=125Mhz (125000000) for MASTER_CLK in SS mode
+      >=60Mhz (60000000) for MASTER_CLK in HS mode
+    maxItems: 2
+
+  resets:
+    maxItems: 1
+    description: Phandle to reset control that resets core and wrapper.
+
+  interrupts:
+    description:
+      specifies interrupts from controller wrapper used
+      to wakeup from low power/suspend state.Must contain
+      one or more entry for interrupt-names property
+
+  interrupt-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      #The interrupt that is asserted when a wakeup event
+      #is received on USB2 bus
+      - const: hs_phy_irq
+      #The interrupt that is asserted when a wakeup event
+      #is received on USB3 bus
+      - const: ss_phy_irq
+      #Separate interrupts for any wakeup event on DM and DP lines
+      - const: dm_hs_phy_irq
+      - const: dp_hs_phy_irq
+
+  qcom,select-utmi-as-pipe-clk:
+    description:
+      if present, disable USB3 pipe_clk requirement.
+      Used when dwc3 operates without SSPHY and only
+      HS/FS/LS modes are supported.
+    type: boolean
+
+#Required child node:
+#A child node must exist to represent the core DWC3 IP block. The name of
+#the node is not important. The content of the node is defined in dwc3.txt.
+
+#Phy documentation is provided in the following places:
+#Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
+#Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-rates
+
+examples:
+  - |
+    hs_phy: phy@100f8800 {
+            compatible = "qcom,qusb2-v2-phy";
+            ...
+        };
+
+        ss_phy: phy@100f8830 {
+            compatible = "qcom,qmp-v3-usb3-phy";
+            ...
+        };
+
+        usb3_0: usb30@a6f8800 {
+            compatible = "qcom,dwc3";
+            reg = <0xa6f8800 0x400>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
+            interrupt-names = "hs_phy_irq", "ss_phy_irq",
+                    "dm_hs_phy_irq", "dp_hs_phy_irq";
+
+            clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
+            clock-names = "core", "mock_utmi", "sleep";
+
+            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+                              <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+            assigned-clock-rates = <19200000>, <133000000>;
+
+            resets = <&gcc GCC_USB30_PRIM_BCR>;
+            reset-names = "core_reset";
+            power-domains = <&gcc USB30_PRIM_GDSC>;
+            qcom,select-utmi-as-pipe-clk;
+
+            dwc3@10000000 {
+                compatible = "snps,dwc3";
+                reg = <0x10000000 0xcd00>;
+                interrupts = <0 205 0x4>;
+                phys = <&hs_phy>, <&ss_phy>;
+                phy-names = "usb2-phy", "usb3-phy";
+                dr_mode = "host";
+            };
+        };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

