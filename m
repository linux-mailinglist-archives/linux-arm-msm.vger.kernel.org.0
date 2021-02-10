Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAF63165DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 13:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhBJL7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 06:59:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:10367 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhBJL5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 06:57:50 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 10 Feb 2021 03:52:29 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Feb 2021 03:52:27 -0800
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 10 Feb 2021 17:22:02 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 8571A218F7; Wed, 10 Feb 2021 17:22:02 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
Subject: [PATCH v11 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
Date:   Wed, 10 Feb 2021 17:21:51 +0530
Message-Id: <1612957913-23982-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612957913-23982-1-git-send-email-mkrishn@codeaurora.org>
References: <1612957913-23982-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add YAML schema for the device tree bindings for DSI
controller.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v1:
    - Separate dsi controller bindings to a separate patch (Stephen Boyd)
    - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
      a single file (Stephen Boyd)
    - Drop supply entries and definitions from properties (Stephen Boyd)
    - Modify phy-names property for dsi controller (Stephen Boyd)
    - Remove boolean from description (Stephen Boyd)
    - Drop pinctrl properties as they are standard entries (Stephen Boyd)
    - Modify the description for ports property and keep the reference
      to the generic binding where this is defined (Stephen Boyd)
    - Add description to clock names (Stephen Boyd)
    - Correct the indendation (Stephen Boyd)
    - Drop the label for display dt nodes and correct the node
      name (Stephen Boyd)

Changes in v2:
    - Drop maxItems for clock (Stephen Boyd)
    - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
      dt file (Stephen Boyd)
    - Keep child node directly under soc node (Stephen Boyd)
    - Drop qcom,sync-dual-dsi as it is not used in upstream dt
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 200 +++++++++++++++++
 .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
 2 files changed, 200 insertions(+), 249 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
new file mode 100644
index 0000000..548eb0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -0,0 +1,200 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI controller dt properties
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI controller.
+
+allOf:
+  - $ref: "../dsi-controller.yaml#"
+
+properties:
+  compatible:
+    items:
+      - const: qcom,mdss-dsi-ctrl
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: dsi_ctrl
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display byte clock
+      - description: Display byte interface clock
+      - description: Display pixel clock
+      - description: Display escape clock
+      - description: Display AHB clock
+      - description: Display AXI clock
+
+  clock-names:
+    items:
+      - const: byte
+      - const: byte_intf
+      - const: pixel
+      - const: core
+      - const: iface
+      - const: bus
+
+  phys:
+    minItems: 1
+
+  phy-names:
+    const: dsi
+
+  syscon-sfpb:
+    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  qcom,dual-dsi-mode:
+    type: boolean
+    description: |
+      Indicates if the DSI controller is driving a panel which needs
+      2 DSI links.
+
+  qcom,master-dsi:
+    type: boolean
+    description: |
+      Indicates if the DSI controller is driving the master link of
+      the 2-DSI panel.
+
+  ports:
+    type: object
+    description: |
+      Contains DSI controller input and output ports as children, each
+      containing one endpoint subnode as defined in
+      Documentation/devicetree/bindings/graph.txt and
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Input endpoints of the controller.
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+            properties:
+              remote-endpoint:
+                description: |
+                  For port@0, set to phandle of the connected panel/bridge's
+                  input endpoint. For port@1, set to the MDP interface output.
+                  See Documentation/devicetree/bindings/graph.txt for
+                  device graph info.
+
+              data-lanes:
+                description: |
+                  This describes how the physical DSI data lanes are mapped
+                  to the logical lanes on the given platform. The value contained in
+                  index n describes what physical lane is mapped to the logical lane n
+                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
+                  and can't be changed. Hence, they aren't a part of the DT bindings. See
+                  Documentation/devicetree/bindings/media/video-interfaces.txt for
+                  more info on the data-lanes property.
+
+                items:
+                  - const: 0
+                  - const: 1
+                  - const: 2
+                  - const: 3
+      port@1:
+        type: object
+        description: |
+          Output endpoints of the controller.
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+            properties:
+              remote-endpoint: true
+              data-lanes:
+                items:
+                  - const: 0
+                  - const: 1
+                  - const: 2
+                  - const: 3
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi@ae94000 {
+           compatible = "qcom,mdss-dsi-ctrl";
+           reg = <0 0x0ae94000 0 0x400>;
+           reg-names = "dsi_ctrl";
+
+           interrupt-parent = <&mdss>;
+           interrupts = <4>;
+
+           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
+           clock-names = "byte",
+                         "byte_intf",
+                         "pixel",
+                         "core",
+                         "iface",
+                         "bus";
+
+           phys = <&dsi0_phy>;
+           phy-names = "dsi";
+
+           ports {
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  port@0 {
+                          reg = <0>;
+                          dsi0_in: endpoint {
+                                   remote-endpoint = <&dpu_intf1_out>;
+                          };
+                  };
+
+                  port@1 {
+                          reg = <1>;
+                          dsi0_out: endpoint {
+                          };
+                  };
+           };
+       };
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
deleted file mode 100644
index b9a64d3..0000000
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ /dev/null
@@ -1,249 +0,0 @@
-Qualcomm Technologies Inc. adreno/snapdragon DSI output
-
-DSI Controller:
-Required properties:
-- compatible:
-  * "qcom,mdss-dsi-ctrl"
-- reg: Physical base address and length of the registers of controller
-- reg-names: The names of register regions. The following regions are required:
-  * "dsi_ctrl"
-- interrupts: The interrupt signal from the DSI block.
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: Phandles to device clocks.
-- clock-names: the following clocks are required:
-  * "mdp_core"
-  * "iface"
-  * "bus"
-  * "core_mmss"
-  * "byte"
-  * "pixel"
-  * "core"
-  For DSIv2, we need an additional clock:
-   * "src"
-  For DSI6G v2.0 onwards, we need also need the clock:
-   * "byte_intf"
-- assigned-clocks: Parents of "byte" and "pixel" for the given platform.
-- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
-  by a DSI PHY block. See [1] for details on clock bindings.
-- vdd-supply: phandle to vdd regulator device node
-- vddio-supply: phandle to vdd-io regulator device node
-- vdda-supply: phandle to vdda regulator device node
-- phys: phandle to DSI PHY device node
-- phy-names: the name of the corresponding PHY device
-- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
-- ports: Contains 2 DSI controller ports as child nodes. Each port contains
-  an endpoint subnode as defined in [2] and [3].
-
-Optional properties:
-- panel@0: Node of panel connected to this DSI controller.
-  See files in [4] for each supported panel.
-- qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
-  driving a panel which needs 2 DSI links.
-- qcom,master-dsi: Boolean value indicating if the DSI controller is driving
-  the master link of the 2-DSI panel.
-- qcom,sync-dual-dsi: Boolean value indicating if the DSI controller is
-  driving a 2-DSI panel whose 2 links need receive command simultaneously.
-- pinctrl-names: the pin control state names; should contain "default"
-- pinctrl-0: the default pinctrl state (active)
-- pinctrl-n: the "sleep" pinctrl state
-- ports: contains DSI controller input and output ports as children, each
-  containing one endpoint subnode.
-
-  DSI Endpoint properties:
-  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
-    input endpoint. For port@1, set to the MDP interface output. See [2] for
-    device graph info.
-
-  - data-lanes: this describes how the physical DSI data lanes are mapped
-    to the logical lanes on the given platform. The value contained in
-    index n describes what physical lane is mapped to the logical lane n
-    (DATAn, where n lies between 0 and 3). The clock lane position is fixed
-    and can't be changed. Hence, they aren't a part of the DT bindings. See
-    [3] for more info on the data-lanes property.
-
-    For example:
-
-    data-lanes = <3 0 1 2>;
-
-    The above mapping describes that the logical data lane DATA0 is mapped to
-    the physical data lane DATA3, logical DATA1 to physical DATA0, logic DATA2
-    to phys DATA1 and logic DATA3 to phys DATA2.
-
-    There are only a limited number of physical to logical mappings possible:
-    <0 1 2 3>
-    <1 2 3 0>
-    <2 3 0 1>
-    <3 0 1 2>
-    <0 3 2 1>
-    <1 0 3 2>
-    <2 1 0 3>
-    <3 2 1 0>
-
-DSI PHY:
-Required properties:
-- compatible: Could be the following
-  * "qcom,dsi-phy-28nm-hpm"
-  * "qcom,dsi-phy-28nm-lp"
-  * "qcom,dsi-phy-20nm"
-  * "qcom,dsi-phy-28nm-8960"
-  * "qcom,dsi-phy-14nm"
-  * "qcom,dsi-phy-14nm-660"
-  * "qcom,dsi-phy-10nm"
-  * "qcom,dsi-phy-10nm-8998"
-  * "qcom,dsi-phy-7nm"
-  * "qcom,dsi-phy-7nm-8150"
-- reg: Physical base address and length of the registers of PLL, PHY. Some
-  revisions require the PHY regulator base address, whereas others require the
-  PHY lane base address. See below for each PHY revision.
-- reg-names: The names of register regions. The following regions are required:
-  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
-  * "dsi_pll"
-  * "dsi_phy"
-  * "dsi_phy_regulator"
-  For DSI 14nm, 10nm and 7nm PHYs:
-  * "dsi_pll"
-  * "dsi_phy"
-  * "dsi_phy_lane"
-- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
-  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: Phandles to device clocks. See [1] for details on clock bindings.
-- clock-names: the following clocks are required:
-  * "iface"
-  * "ref" (only required for new DTS files/entries)
-  For 28nm HPM/LP, 28nm 8960 PHYs:
-- vddio-supply: phandle to vdd-io regulator device node
-  For 20nm PHY:
-- vddio-supply: phandle to vdd-io regulator device node
-- vcca-supply: phandle to vcca regulator device node
-  For 14nm PHY:
-- vcca-supply: phandle to vcca regulator device node
-  For 10nm and 7nm PHY:
-- vdds-supply: phandle to vdds regulator device node
-
-Optional properties:
-- qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
-  regulator is wanted.
-- qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
-					panels in microseconds. Driver uses this number to adjust
-					the clock rate according to the expected transfer time.
-					Increasing this value would slow down the mdp processing
-					and can result in slower performance.
-					Decreasing this value can speed up the mdp processing,
-					but this can also impact power consumption.
-					As a rule this time should not be higher than the time
-					that would be expected with the processing at the
-					dsi link rate since anyways this would be the maximum
-					transfer time that could be achieved.
-					If ping pong split is enabled, this time should not be higher
-					than two times the dsi link rate time.
-					If the property is not specified, then the default value is 14000 us.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/graph.txt
-[3] Documentation/devicetree/bindings/media/video-interfaces.txt
-[4] Documentation/devicetree/bindings/display/panel/
-
-Example:
-	dsi0: dsi@fd922800 {
-		compatible = "qcom,mdss-dsi-ctrl";
-		qcom,dsi-host-index = <0>;
-		interrupt-parent = <&mdp>;
-		interrupts = <4 0>;
-		reg-names = "dsi_ctrl";
-		reg = <0xfd922800 0x200>;
-		power-domains = <&mmcc MDSS_GDSC>;
-		clock-names =
-			"bus",
-			"byte",
-			"core",
-			"core_mmss",
-			"iface",
-			"mdp_core",
-			"pixel";
-		clocks =
-			<&mmcc MDSS_AXI_CLK>,
-			<&mmcc MDSS_BYTE0_CLK>,
-			<&mmcc MDSS_ESC0_CLK>,
-			<&mmcc MMSS_MISC_AHB_CLK>,
-			<&mmcc MDSS_AHB_CLK>,
-			<&mmcc MDSS_MDP_CLK>,
-			<&mmcc MDSS_PCLK0_CLK>;
-
-		assigned-clocks =
-				 <&mmcc BYTE0_CLK_SRC>,
-				 <&mmcc PCLK0_CLK_SRC>;
-		assigned-clock-parents =
-				 <&dsi_phy0 0>,
-				 <&dsi_phy0 1>;
-
-		vdda-supply = <&pma8084_l2>;
-		vdd-supply = <&pma8084_l22>;
-		vddio-supply = <&pma8084_l12>;
-
-		phys = <&dsi_phy0>;
-		phy-names ="dsi-phy";
-
-		qcom,dual-dsi-mode;
-		qcom,master-dsi;
-		qcom,sync-dual-dsi;
-
-		qcom,mdss-mdp-transfer-time-us = <12000>;
-
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&dsi_active>;
-		pinctrl-1 = <&dsi_suspend>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				dsi0_in: endpoint {
-					remote-endpoint = <&mdp_intf1_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				dsi0_out: endpoint {
-					remote-endpoint = <&panel_in>;
-					data-lanes = <0 1 2 3>;
-				};
-			};
-		};
-
-		panel: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-			link2 = <&secondary>;
-
-			power-supply = <...>;
-			backlight = <...>;
-
-			port {
-				panel_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-		};
-	};
-
-	dsi_phy0: dsi-phy@fd922a00 {
-		compatible = "qcom,dsi-phy-28nm-hpm";
-		qcom,dsi-phy-index = <0>;
-		reg-names =
-			"dsi_pll",
-			"dsi_phy",
-			"dsi_phy_regulator";
-		reg =   <0xfd922a00 0xd4>,
-			<0xfd922b00 0x2b0>,
-			<0xfd922d80 0x7b>;
-		clock-names = "iface";
-		clocks = <&mmcc MDSS_AHB_CLK>;
-		#clock-cells = <1>;
-		vddio-supply = <&pma8084_l12>;
-
-		qcom,dsi-phy-regulator-ldo-mode;
-	};
-- 
2.7.4

