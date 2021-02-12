Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F8E319CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 11:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhBLKvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 05:51:19 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36444 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhBLKvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 05:51:18 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Feb 2021 02:50:36 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Feb 2021 02:50:34 -0800
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Feb 2021 16:20:04 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 800BD2190F; Fri, 12 Feb 2021 16:20:03 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
Subject: [PATCH v12 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
Date:   Fri, 12 Feb 2021 16:19:59 +0530
Message-Id: <1613127000-3015-3-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add YAML schema for the device tree bindings for DSI PHY.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v1:
   - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
   - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
   - Add clock cells properly (Stephen Boyd)
   - Remove unnecessary decription from clock names (Stephen Boyd)
   - Add pin names for the supply entries for 10nm phy which is
     used in sc7180 and sdm845 (Stephen Boyd)
   - Remove unused header files from examples (Stephen Boyd)
   - Drop labels for display nodes and correct node name (Stephen Boyd)

Changes in v2:
   - Drop maxItems for clock (Stephen Boyd)
   - Add vdds supply pin information for sdm845 (Stephen Boyd)
   - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
   - Keep child nodes directly under soc node (Stephen Boyd)
---
 .../bindings/display/msm/dsi-phy-10nm.yaml         | 85 +++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-14nm.yaml         | 83 ++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-20nm.yaml         | 88 ++++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-28nm.yaml         | 84 +++++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
new file mode 100644
index 0000000..627de6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 10nm PHY dt properties
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 10nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-10nm
+      - const: qcom,dsi-phy-10nm-8998
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  "#clock-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  vdds-supply:
+    description: |
+      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
+      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vdds-supply
+
+additionalProperties: true
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi-phy@ae94400 {
+               compatible = "qcom,dsi-phy-10nm";
+               reg = <0 0x0ae94400 0 0x200>,
+                     <0 0x0ae94600 0 0x280>,
+                     <0 0x0ae94a00 0 0x1e0>;
+               reg-names = "dsi_phy",
+                           "dsi_phy_lane",
+                           "dsi_pll";
+
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+
+               vdds-supply = <&vdda_mipi_dsi0_pll>;
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&rpmhcc RPMH_CXO_CLK>;
+               clock-names = "iface", "ref";
+       };
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
new file mode 100644
index 0000000..d1fa6ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 14nm PHY dt properties
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 14nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-14nm
+      - const: qcom,dsi-phy-14nm-660
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  "#clock-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  vcca-supply:
+    description: Phandle to vcca regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vcca-supply
+
+additionalProperties: true
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi-phy@ae94400 {
+               compatible = "qcom,dsi-phy-14nm";
+               reg = <0 0x0ae94400 0 0x200>,
+                     <0 0x0ae94600 0 0x280>,
+                     <0 0x0ae94a00 0 0x1e0>;
+               reg-names = "dsi_phy",
+                           "dsi_phy_lane",
+                           "dsi_pll";
+
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+
+               vcca-supply = <&vcca_reg>;
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&rpmhcc RPMH_CXO_CLK>;
+               clock-names = "iface", "ref";
+       };
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
new file mode 100644
index 0000000..ea13a32
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 20nm PHY dt properties
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 20nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-20nm
+
+  reg-names:
+    items:
+      - const: dsi_pll
+      - const: dsi_phy
+      - const: dsi_phy_regulator
+
+  "#clock-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  vcca-supply:
+    description: Phandle to vcca regulator device node.
+
+  vddio-supply:
+    description: Phandle to vdd-io regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vddio-supply
+  - vcca-supply
+
+additionalProperties: true
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi-phy@fd922a00 {
+               compatible = "qcom,dsi-phy-20nm";
+               reg = <0 0xfd922a00 0 0xd4>,
+                     <0 0xfd922b00 0 0x2b0>,
+                     <0 0xfd922d80 0 0x7b>;
+               reg-names = "dsi_pll",
+                           "dsi_phy",
+                           "dsi_phy_regulator";
+
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+
+               vcca-supply = <&vcca_reg>;
+               vddio-supply = <&vddio_reg>;
+
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&rpmhcc RPMH_CXO_CLK>;
+               clock-names = "iface", "ref";
+       };
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
new file mode 100644
index 0000000..07c8294
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 28nm PHY dt properties
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 28nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-28nm-hpm
+      - const: qcom,dsi-phy-28nm-lp
+      - const: qcom,dsi-phy-28nm-8960
+
+  reg-names:
+    items:
+      - const: dsi_pll
+      - const: dsi_phy
+      - const: dsi_phy_regulator
+
+  "#clock-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  vddio-supply:
+    description: Phandle to vdd-io regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - vddio-supply
+
+additionalProperties: true
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi-phy@fd922a00 {
+               compatible = "qcom,dsi-phy-28nm";
+               reg = <0 0xfd922a00 0 0xd4>,
+                     <0 0xfd922b00 0 0x2b0>,
+                     <0 0xfd922d80 0 0x7b>;
+               reg-names = "dsi_pll",
+                           "dsi_phy",
+                           "dsi_phy_regulator";
+
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+
+               vddio-supply = <&vddio_reg>;
+
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&rpmhcc RPMH_CXO_CLK>;
+               clock-names = "iface", "ref";
+       };
+     };
+...
-- 
2.7.4

