Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1A4136CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 13:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgAJMTP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 07:19:15 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23802 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727753AbgAJMTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 07:19:15 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Jan 2020 17:49:06 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2020 17:48:55 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 8453C22B4; Fri, 10 Jan 2020 17:48:54 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
Date:   Fri, 10 Jan 2020 17:48:16 +0530
Message-Id: <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert QUSB2 phy  bindings to DT schema format using json-schema.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 152 +++++++++++++++++++++
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 ---------
 2 files changed, 152 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
new file mode 100644
index 0000000..83cd01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QUSB2 phy controller
+
+maintainers:
+  - Manu Gautam <mgautam@codeaurora.org>
+
+description:
+  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+
+properties:
+  compatible:
+    anyOf:
+      - items:
+        - const: qcom,msm8996-qusb2-phy
+      - items:
+        - const: qcom,msm8998-qusb2-phy
+      - items:
+        - const: qcom,sc7180-qusb2-phy
+      - items:
+        - const: qcom,sdm845-qusb2-phy
+      - items:
+        - enum:
+          - qcom,sc7180-qusb2-phy
+          - qcom,sdm845-qusb2-phy
+        - const: qcom,qusb2-v2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    items:
+      - description: phy config clock
+      - description: 19.2 MHz ref clk
+      - description: phy interface clock (Optional)
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: cfg_ahb
+      - const: ref
+      - const: iface
+
+  vdda-pll-supply:
+     description:
+       Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+  vdda-phy-dpdm-supply:
+     description:
+       Phandle to 3.1V regulator supply to Dp/Dm port signals.
+
+  resets:
+    maxItems: 1
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+        Phandle to nvmem cell that contains 'HS Tx trim'
+        tuning parameter value for qusb2 phy.
+
+  qcom,tcsr-syscon:
+    description:
+        Phandle to TCSR syscon register region.
+    $ref: /schemas/types.yaml#/definitions/cell
+
+  qcom,imp-res-offset-value:
+    description:
+        It is a 6 bit value that specifies offset to be
+        added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
+        tuning parameter that may vary for different boards of same SOC.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 63
+        default: 0
+
+  qcom,hstx-trim-value:
+    description:
+        It is a 4 bit value that specifies tuning for HSTX
+        output current.
+        Possible range is - 15mA to 24mA (stepsize of 600 uA).
+        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 15
+        default: 3
+
+  qcom,preemphasis-level:
+    description:
+        It is a 2 bit value that specifies pre-emphasis level.
+        Possible range is 0 to 15% (stepsize of 5%).
+        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 3
+        default: 2
+
+  qcom,preemphasis-width:
+    description:
+        It is a 1 bit value that specifies how long the HSTX
+        pre-emphasis (specified using qcom,preemphasis-level) must be in
+        effect. Duration could be half-bit of full-bit.
+        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 1
+        default: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdda-pll-supply
+  - vdda-phy-dpdm-supply
+  - resets
+
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    usb_1_hsphy: phy@88e2000 {
+        compatible = "qcom,sdm845-qusb2-phy";
+        reg = <0 0x088e2000 0 0x400>;
+        #phy-cells = <0>;
+
+        clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "cfg_ahb", "ref";
+
+        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+        nvmem-cells = <&qusb2p_hstx_trim>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
deleted file mode 100644
index fe29f9e..0000000
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-Qualcomm QUSB2 phy controller
-=============================
-
-QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
-
-Required properties:
- - compatible: compatible list, contains
-	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
-	       "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8998,
-	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
-
- - reg: offset and length of the PHY register set.
- - #phy-cells: must be 0.
-
- - clocks: a list of phandles and clock-specifier pairs,
-	   one for each entry in clock-names.
- - clock-names: must be "cfg_ahb" for phy config clock,
-			"ref" for 19.2 MHz ref clk,
-			"iface" for phy interface clock (Optional).
-
- - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
- - vdda-phy-dpdm-supply: Phandle to 3.1V regulator supply to Dp/Dm port signals.
-
- - resets: Phandle to reset to phy block.
-
-Optional properties:
- - nvmem-cells: Phandle to nvmem cell that contains 'HS Tx trim'
-		tuning parameter value for qusb2 phy.
-
- - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
- - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
-		added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
-		tuning parameter that may vary for different boards of same SOC.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
- - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
-		output current.
-		Possible range is - 15mA to 24mA (stepsize of 600 uA).
-		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
-		Default value is 22.2mA for sdm845.
- - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
-		Possible range is 0 to 15% (stepsize of 5%).
-		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
-		Default value is 10% for sdm845.
-- qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
-		pre-emphasis (specified using qcom,preemphasis-level) must be in
-		effect. Duration could be half-bit of full-bit.
-		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
-		Default value is full-bit width for sdm845.
-
-Example:
-	hsusb_phy: phy@7411000 {
-		compatible = "qcom,msm8996-qusb2-phy";
-		reg = <0x7411000 0x180>;
-		#phy-cells = <0>;
-
-		clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-			<&gcc GCC_RX1_USB2_CLKREF_CLK>,
-		clock-names = "cfg_ahb", "ref";
-
-		vdda-pll-supply = <&pm8994_l12>;
-		vdda-phy-dpdm-supply = <&pm8994_l24>;
-
-		resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-		nvmem-cells = <&qusb2p_hstx_trim>;
-        };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

