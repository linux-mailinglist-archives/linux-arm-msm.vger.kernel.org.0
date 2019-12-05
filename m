Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E5A113AEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 05:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbfLEEnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 23:43:04 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23167 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728470AbfLEEnC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 23:43:02 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Dec 2019 10:12:56 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 05 Dec 2019 10:12:37 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id EC07019B7; Thu,  5 Dec 2019 10:12:35 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom-qusb2: Convert QUSB2 phy bindings to yaml
Date:   Thu,  5 Dec 2019 10:11:20 +0530
Message-Id: <1575520881-31458-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert QUSB2 phy  bindings to DT schema format using json-schema.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 -----------
 .../devicetree/bindings/phy/qcom-qusb2-phy.yaml    | 129 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml

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
diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
new file mode 100644
index 0000000..3ef94bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom-qusb2-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QUSB2 phy controller
+
+maintainers:
+  - Manu Gautam <mgautam@codeaurora.org>
+
+description: |
+  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8996-qusb2-phy
+      - qcom,msm8998-qusb2-phy
+      - qcom,sdm845-qusb2-phy
+
+  reg:
+    description:
+        offset and length of the PHY register set.
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    maxItems: 3
+    description:
+        a list of phandles and clock-specifier pairs,
+        one for each entry in clock-names.
+
+  clock-names:
+    items:
+      - const: cfg_ahb #phy config clock
+      - const: ref #19.2 MHz ref clk
+      - const: iface #phy interface clock (Optional)
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
+    description:
+       Phandle to reset to phy block.
+
+  nvmem-cells:
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
+        This property is applicable to only QUSB2 v2 PHY (sdm845).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,hstx-trim-value:
+    description:
+        It is a 4 bit value that specifies tuning for HSTX
+        output current.
+        Possible range is - 15mA to 24mA (stepsize of 600 uA).
+        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        Default value is 22.2mA for sdm845.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,preemphasis-level:
+    description:
+        It is a 2 bit value that specifies pre-emphasis level.
+        Possible range is 0 to 15% (stepsize of 5%).
+        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        Default value is 10% for sdm845.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,preemphasis-width:
+    description:
+        It is a 1 bit value that specifies how long the HSTX
+        pre-emphasis (specified using qcom,preemphasis-level) must be in
+        effect. Duration could be half-bit of full-bit.
+        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        Default value is full-bit width for sdm845.
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    hsusb_phy: phy@7411000 {
+        compatible = "qcom,msm8996-qusb2-phy";
+        reg = <0x7411000 0x180>;
+        #phy-cells = <0>;
+
+        clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+                <&gcc GCC_RX1_USB2_CLKREF_CLK>,
+        clock-names = "cfg_ahb", "ref";
+
+        vdda-pll-supply = <&pm8994_l12>;
+        vdda-phy-dpdm-supply = <&pm8994_l24>;
+
+        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+        nvmem-cells = <&qusb2p_hstx_trim>;
+
+        };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

