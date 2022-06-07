Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5645418F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376309AbiFGVSd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380976AbiFGVRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40BD1105E4
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y32so29728855lfa.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SW3uTnCI0m++1ZDWVuzx/aiaV+RkUBOb3ippKLfWJEQ=;
        b=RlaJCxPAMBMhzuJbHWnOcGHU938hTjhGo64PGI8AFFRRvnEeNMTFblPQCXERNu8xJE
         DBoU28nYpDsG5eapauaFVL4TtlPBhHkIBy3aNev2tegQjj1DCGAEhfHdem22R5iEcNvb
         HepraBMGr1E52sxVLrsHHmyxO81uyqRJ1bucUfyrDq04P1G14FtRcg2ogSkOne5+oYCD
         BFevL7yWjBHlhbhKI4Dtn7yZ+71lMcjyVcwAI9exWbr4ekezO+oLKpTisqqdMcA7xN81
         8O9qKFsx0PQJki10Cg8DWvI0+n9dJ6T1munTw65PePfWuxIz+VWz+HgbR01oZf9eHeQY
         a6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SW3uTnCI0m++1ZDWVuzx/aiaV+RkUBOb3ippKLfWJEQ=;
        b=ZKeIL1JPEAM8dcWD/m8upb7fXpJ3Q880lXGa9FHL+mrNsVCcCbGHWNOcIzwtq9Mptv
         3I+MNv5WvgxHhJOJb5jvzvoa90kcfA3YESoXkw7NluslUTKy9TpHwnLFHgfcqpwkaLti
         ahHBHbvaqGfQRWmTMt30xKj2xVc0bA05yKbzZIxTpqUunMQCxOmWfZiOCkdouJO1t+xZ
         raOx8ZXgGFx3BcsjceHEm1jXBU6SrJ5rgLUvMZz1b7LCJCzPIzGiEcG8wqvid/fhgpQC
         xbZ5cpclphtEgee0MuWmawkt83w/gg8OsmzGAVKsRG6QAoOXPXBjZOGcZHGxdmcreF5h
         bFtg==
X-Gm-Message-State: AOAM531RO7wihVqfJn8CSZpfeQYMD5J5tOtanafKNRem6KKau2nxR5I0
        c2ZFFCR7qhlUEOP3ZzLPv0+l2A==
X-Google-Smtp-Source: ABdhPJwdCs5iGfl1tpN1AhkJPBCcLbEKhSFw11CVJ8adBLNwenzSxSTUTe0XyWgN/UXAP3I1KJNU4g==
X-Received: by 2002:a05:6512:3b26:b0:479:5610:5672 with SMTP id f38-20020a0565123b2600b0047956105672mr5667750lfv.464.1654628288534;
        Tue, 07 Jun 2022 11:58:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 1/7] dt-bindings: display/msm: hdmi: split and convert to yaml
Date:   Tue,  7 Jun 2022 21:58:00 +0300
Message-Id: <20220607185806.2771739-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.

Changes to schema:
HDMI:
 - fixed reg-names numbering to match 0..3 instead 0,1,3,4

PHY:
 - moved into phy/ directory
 - split into QMP and non-QMP PHY schemas

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../bindings/display/msm/qcom,hdmi.yaml       | 237 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  84 +++++++
 4 files changed, 424 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml

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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
new file mode 100644
index 000000000000..2f485b5d1c5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
@@ -0,0 +1,237 @@
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
+properties:
+  compatible:
+    enum:
+      - qcom,hdmi-tx-8660
+      - qcom,hdmi-tx-8960
+      - qcom,hdmi-tx-8974
+      - qcom,hdmi-tx-8084
+      - qcom,hdmi-tx-8994
+      - qcom,hdmi-tx-8996
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
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
+    maxItems: 1
+    description: The interrupt signal from the hdmi block.
+
+  phys:
+    description: the phandle for the HDMI PHY device
+    maxItems: 1
+
+  phy-names:
+    enum:
+      - hdmi_phy
+      - hdmi-phy
+
+  hpd-gpios:
+    maxItems: 1
+    description: hpd pin
+
+  qcom,hdmi-tx-ddc-clk-gpios:
+    maxItems: 1
+    description: HDMI DDC clock
+
+  qcom,hdmi-tx-ddc-data-gpios:
+    maxItems: 1
+    description: HDMI DDC data
+
+  qcom,hdmi-tx-mux-en-gpios:
+    maxItems: 1
+    description: HDMI mux enable pin
+
+  qcom,hdmi-tx-mux-sel-gpios:
+    maxItems: 1
+    description: HDMI mux select pin
+
+  qcom,hdmi-tx-mux-lpm-gpios:
+    maxItems: 1
+    description: HDMI mux lpm pin
+
+  '#sound-dai-cells':
+    const: 1
+
+  ports:
+    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: |
+          Input endpoints of the controller.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: |
+          Output endpoints of the controller.
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8960
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+            - const: master_iface
+            - const: slave_iface
+        core-vdda-supply:
+          description: phandle to VDDA supply regulator
+        hdmi-mux-supply:
+          description: phandle to mux regulator
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8974
+              - qcom,hdmi-tx-8084
+              - qcom,hdmi-tx-8994
+              - qcom,hdmi-tx-8996
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: core
+            - const: alt_iface
+            - const: extp
+        core-vdda-supply:
+          description: phandle to VDDA supply regulator
+        core-vcc-supply:
+          description: phandle to VCC supply regulator
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    hdmi: hdmi@4a00000 {
+      compatible = "qcom,hdmi-tx-8960";
+      reg-names = "core_physical";
+      reg = <0x04a00000 0x2f0>;
+      interrupts = <0 79 0>;
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
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    hdmi-tx@9a0000 {
+      compatible = "qcom,hdmi-tx-8996";
+      reg = <0x009a0000 0x50c>,
+            <0x00070000 0x6158>,
+            <0x009e0000 0xfff>;
+      reg-names = "core_physical",
+                  "qfprom_physical",
+                  "hdcp_physical";
+
+      interrupt-parent = <&mdss>;
+      interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&mmcc MDSS_MDP_CLK>,
+               <&mmcc MDSS_AHB_CLK>,
+               <&mmcc MDSS_HDMI_CLK>,
+               <&mmcc MDSS_HDMI_AHB_CLK>,
+               <&mmcc MDSS_EXTPCLK_CLK>;
+      clock-names = "mdp_core",
+                    "iface",
+                    "core",
+                    "alt_iface",
+                    "extp";
+
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi_phy";
+      #sound-dai-cells = <1>;
+
+      pinctrl-names = "default", "sleep";
+      pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+      pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
+
+      core-vdda-supply = <&vreg_l12a_1p8>;
+      core-vcc-supply = <&vreg_s4a_1p8>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          endpoint {
+            remote-endpoint = <&mdp5_intf3_out>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
new file mode 100644
index 000000000000..79193cf71828
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/phy/qcom,hdmi-phy-other.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Adreno/Snapdragon HDMI phy
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - qcom,hdmi-phy-8660
+        - qcom,hdmi-phy-8960
+        - qcom,hdmi-phy-8974
+        - qcom,hdmi-phy-8084
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: hdmi_phy
+      - const: hdmi_pll
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8960
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: slave_iface
+        core-vdda-supply:
+          description: phandle to VDDA supply regulator
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8974
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: iface
+            - const: alt_iface
+        core-vdda-supply:
+          description: phandle to VDDA supply regulator
+        vddio-supply:
+          description: phandle to VDD I/O supply regulator
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reg-names
+  - '#phy-cells'
+
+unevaluatedProperties: false
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
diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
new file mode 100644
index 000000000000..2b36a4c3d4c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Adreno/Snapdragon QMP HDMI phy
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - qcom,hdmi-phy-8996
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: hdmi_pll
+      - const: hdmi_tx_l0
+      - const: hdmi_tx_l1
+      - const: hdmi_tx_l2
+      - const: hdmi_tx_l3
+      - const: hdmi_phy
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  power-domains:
+    maxItems: 1
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
+  - clock-names
+  - reg
+  - reg-names
+  - '#phy-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    hdmi-phy@9a0600 {
+      compatible = "qcom,hdmi-phy-8996";
+      reg = <0x009a0600 0x1c4>,
+            <0x009a0a00 0x124>,
+            <0x009a0c00 0x124>,
+            <0x009a0e00 0x124>,
+            <0x009a1000 0x124>,
+            <0x009a1200 0x0c8>;
+      reg-names = "hdmi_pll",
+                  "hdmi_tx_l0",
+                  "hdmi_tx_l1",
+                  "hdmi_tx_l2",
+                  "hdmi_tx_l3",
+                  "hdmi_phy";
+
+      clocks = <&mmcc 116>,
+               <&gcc 214>;
+      clock-names = "iface",
+                    "ref";
+      #phy-cells = <0>;
+
+      vddio-supply = <&vreg_l12a_1p8>;
+      vcca-supply = <&vreg_l28a_0p925>;
+    };
-- 
2.35.1

