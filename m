Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063D647F01C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Dec 2021 17:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353236AbhLXQZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Dec 2021 11:25:02 -0500
Received: from ixit.cz ([94.230.151.217]:49652 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhLXQZC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Dec 2021 11:25:02 -0500
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id CC0212243C;
        Fri, 24 Dec 2021 17:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1640363100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mHd2CxMR+HnIXXIZa7KYRkERL/UJNHDhP9rrug/0fKE=;
        b=sba+sCjjphpt07NyZudQVm0w1RL6FEEi0bXX2nuuKT7lImtq0LRE2SprToqueQwapYCfcj
        PzdPkjx7Ae975xLlQ5OwOcRxleT5csJ7NbiM0ojzj9J2MXYrAU/jA+/3UFD61o633l1pnH
        4DWND88smhhicFiZvA/MFcezdgOzwso=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display/msm: hdmi: split and convert to yaml
Date:   Fri, 24 Dec 2021 17:24:57 +0100
Message-Id: <20211224162458.52493-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.

Other changes:
 - fixed reg-names numbering to match 0..3 instead 0,1,3,4

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/msm/hdmi.txt  |  99 ---------
 .../bindings/display/msm/qcom,hdmi-phy.yaml   | 119 +++++++++++
 .../bindings/display/msm/qcom,hdmi.yaml       | 201 ++++++++++++++++++
 3 files changed, 320 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
deleted file mode 100644
index 5f90a40da51b..000000000000
--- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-Qualcomm adreno/snapdragon hdmi output
-
-Required properties:
-- compatible: one of the following
-   * "qcom,hdmi-tx-8996"
-   * "qcom,hdmi-tx-8994"
-   * "qcom,hdmi-tx-8084"
-   * "qcom,hdmi-tx-8974"
-   * "qcom,hdmi-tx-8660"
-   * "qcom,hdmi-tx-8960"
-- reg: Physical base address and length of the controller's registers
-- reg-names: "core_physical"
-- interrupts: The interrupt signal from the hdmi block.
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See ../clocks/clock-bindings.txt for details.
-- core-vdda-supply: phandle to supply regulator
-- hdmi-mux-supply: phandle to mux regulator
-- phys: the phandle for the HDMI PHY device
-- phy-names: the name of the corresponding PHY device
-
-Optional properties:
-- hpd-gpios: hpd pin
-- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
-- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
-- qcom,hdmi-tx-mux-lpm-gpios: hdmi mux lpm pin
-- power-domains: reference to the power domain(s), if available.
-- pinctrl-names: the pin control state names; should contain "default"
-- pinctrl-0: the default pinctrl state (active)
-- pinctrl-1: the "sleep" pinctrl state
-
-HDMI PHY:
-Required properties:
-- compatible: Could be the following
-  * "qcom,hdmi-phy-8660"
-  * "qcom,hdmi-phy-8960"
-  * "qcom,hdmi-phy-8974"
-  * "qcom,hdmi-phy-8084"
-  * "qcom,hdmi-phy-8996"
-- #phy-cells: Number of cells in a PHY specifier; Should be 0.
-- reg: Physical base address and length of the registers of the PHY sub blocks.
-- reg-names: The names of register regions. The following regions are required:
-  * "hdmi_phy"
-  * "hdmi_pll"
-  For HDMI PHY on msm8996, these additional register regions are required:
-    * "hdmi_tx_l0"
-    * "hdmi_tx_l1"
-    * "hdmi_tx_l3"
-    * "hdmi_tx_l4"
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- core-vdda-supply: phandle to vdda regulator device node
-
-Example:
-
-/ {
-	...
-
-	hdmi: hdmi@4a00000 {
-		compatible = "qcom,hdmi-tx-8960";
-		reg-names = "core_physical";
-		reg = <0x04a00000 0x2f0>;
-		interrupts = <GIC_SPI 79 0>;
-		power-domains = <&mmcc MDSS_GDSC>;
-		clock-names =
-		    "core",
-		    "master_iface",
-		    "slave_iface";
-		clocks =
-		    <&mmcc HDMI_APP_CLK>,
-		    <&mmcc HDMI_M_AHB_CLK>,
-		    <&mmcc HDMI_S_AHB_CLK>;
-		qcom,hdmi-tx-ddc-clk = <&msmgpio 70 GPIO_ACTIVE_HIGH>;
-		qcom,hdmi-tx-ddc-data = <&msmgpio 71 GPIO_ACTIVE_HIGH>;
-		qcom,hdmi-tx-hpd = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
-		core-vdda-supply = <&pm8921_hdmi_mvs>;
-		hdmi-mux-supply = <&ext_3p3v>;
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
-		pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
-
-		phys = <&hdmi_phy>;
-		phy-names = "hdmi_phy";
-	};
-
-	hdmi_phy: phy@4a00400 {
-		compatible = "qcom,hdmi-phy-8960";
-		reg-names = "hdmi_phy",
-			    "hdmi_pll";
-		reg = <0x4a00400 0x60>,
-		      <0x4a00500 0x100>;
-		#phy-cells = <0>;
-		power-domains = <&mmcc MDSS_GDSC>;
-		clock-names = "slave_iface";
-		clocks = <&mmcc HDMI_S_AHB_CLK>;
-		core-vdda-supply = <&pm8921_hdmi_mvs>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi-phy.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi-phy.yaml
new file mode 100644
index 000000000000..be08fc767435
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi-phy.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/display/msm/qcom,hdmi-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Adreno/Snapdragon HDMI phy
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hdmi-phy-8996
+    then:
+      properties:
+        reg:
+          minItems: 6
+          maxItems: 6
+
+        reg-names:
+          items:
+            - const: hdmi_pll
+            - const: hdmi_tx_l0
+            - const: hdmi_tx_l1
+            - const: hdmi_tx_l2
+            - const: hdmi_tx_l3
+            - const: hdmi_phy
+
+    else:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: hdmi_phy
+            - const: hdmi_pll
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hdmi-phy-8960
+    then:
+      properties:
+        clock-names:
+          const: slave_iface
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hdmi-phy-8996
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: iface
+            - const: ref
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - qcom,hdmi-phy-8084
+        - qcom,hdmi-phy-8660
+        - qcom,hdmi-phy-8960
+        - qcom,hdmi-phy-8974
+        - qcom,hdmi-phy-8994
+        - qcom,hdmi-phy-8996
+
+  reg: true
+
+  reg-names: true
+
+  clocks: true
+
+  clock-names: true
+
+  power-domains:
+    maxItems: 1
+
+  core-vdda-supply: true
+
+  vcca-supply: true
+
+  vddio-supply: true
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reg-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi_phy: phy@4a00400 {
+      compatible = "qcom,hdmi-phy-8960";
+      reg-names = "hdmi_phy",
+                  "hdmi_pll";
+      reg = <0x4a00400 0x60>,
+            <0x4a00500 0x100>;
+      #phy-cells = <0>;
+      power-domains = <&mmcc 1>;
+      clock-names = "slave_iface";
+      clocks = <&clk 21>;
+      core-vdda-supply = <&pm8921_hdmi_mvs>;
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
new file mode 100644
index 000000000000..72f7a58c078a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/display/msm/qcom,hdmi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Adreno/Snapdragon HDMI output
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hdmi-tx-8996
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: core
+            - const: alt_iface
+            - const: extp
+    else:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 5
+
+        clock-names:
+          minItems: 1
+          maxItems: 5
+
+
+properties:
+  compatible:
+    enum:
+      - qcom,hdmi-tx-8996
+      - qcom,hdmi-tx-8994
+      - qcom,hdmi-tx-8084
+      - qcom,hdmi-tx-8974
+      - qcom,hdmi-tx-8660
+      - qcom,hdmi-tx-8960
+
+  clocks: true
+
+  clock-names: true
+
+  reg:
+    minItems: 1
+    maxItems: 3
+    description: Physical base address and length of the controller's registers
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: core_physical
+      - const: qfprom_physical
+      - const: hdcp_physical
+
+  interrupts:
+    description: The interrupt signal from the hdmi block.
+
+  power-domains:
+    description: should be <&mmcc MDSS_GDSC>
+
+  core-vdda-supply: true
+
+  core-vcc-supply: true
+
+  hdmi-mux-supply:
+    description: phandle to mux regulator
+
+  phys:
+    description: the phandle for the HDMI PHY device
+
+  phy-names:
+    description: the name of the corresponding PHY device
+
+  hpd-gpios:
+    description: hpd pin
+
+  qcom,hdmi-tx-ddc-clk-gpios:
+    description: HDMI DDC clock
+
+  qcom,hdmi-tx-ddc-data-gpios:
+    description: HDMI DDC data
+
+  qcom,hdmi-tx-mux-en-gpios:
+    description: HDMI mux enable pin
+
+  qcom,hdmi-tx-mux-sel-gpios:
+    description: HDMI mux select pin
+
+  qcom,hdmi-tx-mux-lpm-gpios:
+    description: HDMI mux lpm pin
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    anyOf:
+      - items:
+          - const: default
+      - items:
+          - const: default
+          - const: sleep
+
+  '#phy-cells':
+    const: 0
+
+  '#sound-dai-cells':
+    const: 1
+
+  ports:
+    type: object
+    $ref: "/schemas/graph.yaml#/properties/ports"
+    properties:
+      port@0:
+        $ref: "/schemas/graph.yaml#/$defs/port-base"
+        unevaluatedProperties: false
+        description: |
+          Input endpoints of the controller.
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                maxItems: 4
+                minItems: 4
+                items:
+                  enum: [0, 1, 2, 3]
+
+      port@1:
+        $ref: "/schemas/graph.yaml#/$defs/port-base"
+        unevaluatedProperties: false
+        description: |
+          Output endpoints of the controller.
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                maxItems: 4
+                minItems: 4
+                items:
+                  enum: [0, 1, 2, 3]
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - reg-names
+  - interrupts
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi: hdmi@4a00000 {
+      compatible = "qcom,hdmi-tx-8960";
+      reg-names = "core_physical";
+      reg = <0x04a00000 0x2f0>;
+      interrupts = <0 79 0>;
+      power-domains = <&mmcc 1>;
+      clock-names =
+          "core",
+          "master_iface",
+          "slave_iface";
+      clocks =
+          <&clk 61>,
+          <&clk 72>,
+          <&clk 98>;
+      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
+      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
+      hpd-gpios = <&msmgpio 72 0>;
+      core-vdda-supply = <&pm8921_hdmi_mvs>;
+      hdmi-mux-supply = <&ext_3p3v>;
+      pinctrl-names = "default", "sleep";
+      pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
+      pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
+
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi_phy";
+    };
-- 
2.34.1

