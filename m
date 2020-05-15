Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF74F1D439C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 04:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgEOCkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 22:40:01 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:31867 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728149AbgEOCkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 22:40:01 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 May 2020 08:09:52 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 May 2020 08:09:32 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 817CC29A7; Fri, 15 May 2020 08:09:31 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v7 2/4] dt-bindings: phy: qcom,qmp-usb3-dp: Add dt bindings for USB3 DP PHY
Date:   Fri, 15 May 2020 08:09:16 +0530
Message-Id: <1589510358-3865-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589510358-3865-1-git-send-email-sanm@codeaurora.org>
References: <1589510358-3865-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split out the dt bindings for USB3 DP PHY from qcom,qmp bindings
for modularity.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      |  51 +++-----
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         | 135 +++++++++++++++++++++
 2 files changed, 150 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index dcdb014..973b2d1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -27,21 +27,13 @@ properties:
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
-      - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8250-qmp-ufs-phy
 
   reg:
-    minItems: 1
     items:
       - description: Address and length of PHY's common serdes block.
-      - description: Address and length of the DP_COM control block.
-
-  reg-names:
-    items:
-      - const: reg-base
-      - const: dp_com
 
   "#clock-cells":
      enum: [ 1, 2 ]
@@ -110,7 +102,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sdm845-qmp-usb3-phy
               - qcom,sdm845-qmp-usb3-uni-phy
     then:
       properties:
@@ -284,51 +275,39 @@ allOf:
         reset-names:
           items:
             - const: phy
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: qcom,sdm845-qmp-usb3-phy
-    then:
-      required:
-        - reg-names
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-    usb_1_qmpphy: phy-wrapper@88e9000 {
-        compatible = "qcom,sdm845-qmp-usb3-phy";
-        reg = <0 0x088e9000 0 0x18c>,
-              <0 0x088e8000 0 0x10>;
-        reg-names = "reg-base", "dp_com";
+    usb_2_qmpphy: phy-wrapper@88eb000 {
+        compatible = "qcom,sdm845-qmp-usb3-uni-phy";
+        reg = <0 0x088eb000 0 0x18c>;
         #clock-cells = <1>;
         #address-cells = <2>;
         #size-cells = <2>;
 
-        clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+        clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK >,
                  <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-                 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
-                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
+                 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+                 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
         clock-names = "aux", "cfg_ahb", "ref", "com_aux";
 
-        resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
-                 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+        resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+                 <&gcc GCC_USB3_PHY_SEC_BCR>;
         reset-names = "phy", "common";
 
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
-        usb_1_ssphy: phy@88e9200 {
-                reg = <0 0x088e9200 0 0x128>,
-                      <0 0x088e9400 0 0x200>,
-                      <0 0x088e9c00 0 0x218>,
-                      <0 0x088e9600 0 0x128>,
-                      <0 0x088e9800 0 0x200>,
-                      <0 0x088e9a00 0 0x100>;
+        usb_2_ssphy: phy@88eb200 {
+                reg = <0 0x088eb200 0 0x128>,
+                      <0 0x088eb400 0 0x1fc>,
+                      <0 0x088eb800 0 0x218>,
+                      <0 0x088eb600 0 0x70>;
                 #clock-cells = <0>;
                 #phy-cells = <0>;
-                clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+                clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
                 clock-names = "pipe0";
-                clock-output-names = "usb3_phy_pipe_clk_src";
+                clock-output-names = "usb3_uni_phy_pipe_clk_src";
             };
         };
diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
new file mode 100644
index 0000000..6055786
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,qmp-usb3-dp-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QMP USB3 DP PHY controller
+
+maintainers:
+  - Manu Gautam <mgautam@codeaurora.org>
+
+properties:
+  compatible:
+    const:
+      qcom,sdm845-qmp-usb3-phy
+  reg:
+    items:
+      - description: Address and length of PHY's common serdes block.
+      - description: Address and length of the DP_COM control block.
+
+  reg-names:
+    items:
+      - const: reg-base
+      - const: dp_com
+
+  "#clock-cells":
+     enum: [ 1, 2 ]
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  clocks:
+    items:
+      - description: Phy aux clock.
+      - description: Phy config clock.
+      - description: 19.2 MHz ref clk.
+      - description: Phy common block aux clock.
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg_ahb
+      - const: ref
+      - const: com_aux
+
+  resets:
+    items:
+      - description: reset of phy block.
+      - description: phy common block reset.
+
+  reset-names:
+    items:
+      - const: phy
+      - const: common
+
+  vdda-phy-supply:
+    description:
+        Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+        Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+  vddp-ref-clk-supply:
+    description:
+        Phandle to a regulator supply to any specific refclk
+        pll block.
+
+#Required nodes:
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    type: object
+    description:
+      Each device node of QMP phy is required to have as many child nodes as
+      the number of lanes the PHY has.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#clock-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    usb_1_qmpphy: phy-wrapper@88e9000 {
+        compatible = "qcom,sdm845-qmp-usb3-phy";
+        reg = <0 0x088e9000 0 0x18c>,
+              <0 0x088e8000 0 0x10>;
+        reg-names = "reg-base", "dp_com";
+        #clock-cells = <1>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+                 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
+        clock-names = "aux", "cfg_ahb", "ref", "com_aux";
+
+        resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+                 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+        reset-names = "phy", "common";
+
+        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
+        vdda-pll-supply = <&vdda_usb2_ss_core>;
+
+        usb_1_ssphy: phy@88e9200 {
+                reg = <0 0x088e9200 0 0x128>,
+                      <0 0x088e9400 0 0x200>,
+                      <0 0x088e9c00 0 0x218>,
+                      <0 0x088e9600 0 0x128>,
+                      <0 0x088e9800 0 0x200>,
+                      <0 0x088e9a00 0 0x100>;
+                #clock-cells = <0>;
+                #phy-cells = <0>;
+                clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+                clock-names = "pipe0";
+                clock-output-names = "usb3_phy_pipe_clk_src";
+            };
+        };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

