Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1431E5E8C6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiIXMgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiIXMgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:36:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A03EE66B
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so4119233lfo.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=198jb4xM44w3x/aStuoERhFUDyt8T+gTuCMV2uiCuVU=;
        b=MDFVSwtcqJN9lUcKaBtUBy+7zvepj+jYA1vzu7CFdD4nIJeAqJWOxtTJNzwQxB3CR9
         ip9c2r4Yixo79zSQqwkws14K9HbVqKzxeFm55GgGA5c7G/YbLzeisLpkHRmBdXhc4XUA
         ZUON7FWGsmwkhHFeOiuLDcNy2tb9C70DXCYFscewTCsD/7P+cTKNRIBoekz3eGgZjum8
         PMbtiSZEZ3DJz/M13j+4tzgLb5Ww3hOYjYyrF3ZDoao+DEuSw7UpdQ+fI2yNs8MHfFfs
         TOods0VFNGSMff5rnko6TwJS1vMTlDKLvzHEf0jdYpaq7rx5X9ZYBSt18QkcKbp6HTs2
         P1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=198jb4xM44w3x/aStuoERhFUDyt8T+gTuCMV2uiCuVU=;
        b=Ob2PacYvWS6WqXR3eL/x2Qlj7Tj7BkA1gAkITWXCbWneqooZXgDoV9fzk7Oghx6tM8
         tqG7azzuzflPbN1m8RR5h0ap8wHJrh3DVScC542cOqzejTN8KXwTstySi7RGS9tm2eNO
         B10H4McYD3WoEwdcdVAtwocF85VXVA7yuqgHk3roWCAwqmWA3c59BCt33KQ+ACJrJvR+
         KgN3Rnn/ZDSs7ymzw+bOFtUK6zrYNFTkoGSHFBepREmWNhPoctxD7X7s5er7hVSvU17U
         sG30EwSaZGoBcdAHgNu/vB4KVtcpsqS5XAFf2K1p0jK2lylcdUVGKJgex0qyZ9tVmfBl
         Ai0g==
X-Gm-Message-State: ACrzQf2QEScRz1yLRPTMBvbqMWRM12XFfLSlUZUdarFBfRbm5U09TS2H
        qwjHfSwwkQ9XRghb0iIojDG8pg==
X-Google-Smtp-Source: AMsMyM52VeZp+RNqxQsS3358PN3Z2QFWY2wmpJha99pVCYMIvTmVX3DYQtwV40GvpkzAbZh2qi5XNg==
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id d24-20020a0565123d1800b00498fafb229fmr5697466lfv.356.1664022973717;
        Sat, 24 Sep 2022 05:36:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:36:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 01/12] dt-bindings: display/msm: split qcom,mdss bindings
Date:   Sat, 24 Sep 2022 15:36:00 +0300
Message-Id: <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split Mobile Display SubSystem (MDSS) root node bindings to the separate
yaml file. Changes to the existing (txt) schema:
 - Added optional "vbif_nrt_phys" region used by msm8996
 - Made "bus" and "vsync" clocks optional (they are not used by some
   platforms)
 - Added optional resets property referencing MDSS reset
 - Defined child nodes pointing to corresponding reference schema.
 - Dropped the "lut" clock. It was added to the schema by mistake (it is
   a part of mdp4 schema, not the mdss).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
 2 files changed, 265 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..65d03c58dee6 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
 
 Description:
 
-This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
-encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
+This is the bindings documentation for the MDP5 display
 controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
 
-MDSS:
-Required properties:
-- compatible:
-  * "qcom,mdss" - MDSS
-- reg: Physical base address and length of the controller's registers.
-- reg-names: The names of register regions. The following regions are required:
-  * "mdss_phys"
-  * "vbif_phys"
-- interrupts: The interrupt signal from MDSS.
-- interrupt-controller: identifies the node as an interrupt controller.
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
-- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
-  * "iface"
-  * "bus"
-  * "vsync"
-- #address-cells: number of address cells for the MDSS children. Should be 1.
-- #size-cells: Should be 1.
-- ranges: parent bus address space is the same as the child bus address space.
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut"
-
 MDP5:
 Required properties:
 - compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
new file mode 100644
index 000000000000..92a1cbae6d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -0,0 +1,264 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mobile Display SubSystem (MDSS)
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
+
+properties:
+  compatible:
+    enum:
+      - qcom,mdss
+
+  reg:
+    minItems: 2
+    maxItems: 3
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: mdss_phys
+      - const: vbif_phys
+      - const: vbif_nrt_phys
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+    description: |
+      The MDSS power domain provided by GCC
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Display abh clock
+      - description: Display axi clock
+      - description: Display vsync clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: iface
+      - const: bus
+      - const: vsync
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - power-domains
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "^mdp@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdp5
+
+  "^dsi@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,dsi-phy-14nm
+          - qcom,dsi-phy-14nm-660
+          - qcom,dsi-phy-14nm-8953
+          - qcom,dsi-phy-20nm
+          - qcom,dsi-phy-28nm-hpm
+          - qcom,dsi-phy-28nm-lp
+
+  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,hdmi-phy-8084
+          - qcom,hdmi-phy-8660
+          - qcom,hdmi-phy-8960
+          - qcom,hdmi-phy-8974
+          - qcom,hdmi-phy-8996
+
+  "^hdmi-tx@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,hdmi-tx-8084
+          - qcom,hdmi-tx-8660
+          - qcom,hdmi-tx-8960
+          - qcom,hdmi-tx-8974
+          - qcom,hdmi-tx-8994
+          - qcom,hdmi-tx-8996
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdss@1a00000 {
+        compatible = "qcom,mdss";
+        reg = <0x1a00000 0x1000>,
+              <0x1ac8000 0x3000>;
+        reg-names = "mdss_phys", "vbif_phys";
+
+        power-domains = <&gcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                 <&gcc GCC_MDSS_AXI_CLK>,
+                 <&gcc GCC_MDSS_VSYNC_CLK>;
+        clock-names = "iface",
+                      "bus",
+                      "vsync";
+
+        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        mdp@1a01000 {
+            compatible = "qcom,mdp5";
+            reg = <0x01a01000 0x89000>;
+            reg-names = "mdp_phys";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                     <&gcc GCC_MDSS_AXI_CLK>,
+                     <&gcc GCC_MDSS_MDP_CLK>,
+                     <&gcc GCC_MDSS_VSYNC_CLK>;
+            clock-names = "iface",
+                      "bus",
+                      "core",
+                      "vsync";
+
+            iommus = <&apps_iommu 4>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdp5_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+            };
+        };
+
+        dsi@1a98000 {
+            compatible = "qcom,mdss-dsi-ctrl";
+            reg = <0x01a98000 0x25c>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            assigned-clocks = <&gcc BYTE0_CLK_SRC>,
+                              <&gcc PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi_phy0 0>,
+                                     <&dsi_phy0 1>;
+
+            clocks = <&gcc GCC_MDSS_MDP_CLK>,
+                     <&gcc GCC_MDSS_AHB_CLK>,
+                     <&gcc GCC_MDSS_AXI_CLK>,
+                     <&gcc GCC_MDSS_BYTE0_CLK>,
+                     <&gcc GCC_MDSS_PCLK0_CLK>,
+                     <&gcc GCC_MDSS_ESC0_CLK>;
+            clock-names = "mdp_core",
+                          "iface",
+                          "bus",
+                          "byte",
+                          "pixel",
+                          "core";
+            phys = <&dsi_phy0>;
+            phy-names = "dsi-phy";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dsi0_in: endpoint {
+                        remote-endpoint = <&mdp5_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi0_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        dsi_phy0: phy@1a98300 {
+            compatible = "qcom,dsi-phy-28nm-lp";
+            reg = <0x01a98300 0xd4>,
+                  <0x01a98500 0x280>,
+                  <0x01a98780 0x30>;
+            reg-names = "dsi_pll",
+                        "dsi_phy",
+                        "dsi_phy_regulator";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                     <&xo_board>;
+            clock-names = "iface", "ref";
+            vddio-supply = <&vreg_dsi_phy>;
+        };
+    };
+...
-- 
2.35.1

