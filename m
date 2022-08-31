Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD15A8638
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiHaS7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbiHaS7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:37 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D676EC12C8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id k18so9189914lji.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FiKQMeF508IaIpDsyXpQQCdyRUbDPEPp+qPFL4iaJbU=;
        b=PmZL8ACii9VtvruYOZ/U96XCLY8Hgwdf2Z5t7iTms+bWnEgnuXkyNSqH0PDLkyfsur
         io9izq7C7ZO284NipGwqyJuiZgnyoJUGPPTGabfUB2fJGxyOemsbnQUdKeXDlluXnxNn
         HdJbQX3rvir6nDJ92ax0cmSmIq5UT16rfgsHMyKlDvOD9MW1591MWvxe/i25i+Wc17/w
         +UZCZEMyNoZxvuXwN/BKVGVxtDKV0k5mIRXzRMZi3oC8xvuaQRcuQA4TVxqRpgqQw5x/
         BpeT+zo9tBpkQqWkrNaA7DoIRCWKH8InsA9/DNr3msdOX1S48SOTsxmYIWCGKj/Rnlsy
         8Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FiKQMeF508IaIpDsyXpQQCdyRUbDPEPp+qPFL4iaJbU=;
        b=mIgQ4WSeemeS/32myC9xJeVxtA3D8hY0ssdXmHvK+rjvBztXKWLh9TBUaxGQZqk6vz
         h832wygNZmjcwbk8leEXTSj1uI0Y8KDXBO1dRS/X3VdXuf/Z5OnQofjZ5+uU/aC/ralS
         YXZKBu7nowaaqy6Aa1NrFEBcVYDWnAygu8oywvvU/hZUeNWwHyjwH9WdZGGIQaxCDAzv
         02aw8loP47nkFidAOXPiRdtS0PjdMw5LMAHHTnAPYSNe4SS6qRchLO3f2wv3MO7r5RxT
         xPkUw+1xIFbIEJDhIjYssPXdepoKE1hwWAKVDJy7d7GovR+VFDouA5f5Y+DBETf/bPXB
         0b/w==
X-Gm-Message-State: ACgBeo0xE6RxWxOeYlntPpp8rEJmLT1HazBTg39mSuROndIpr7sLsO0N
        At1Xv39F6/5ZP0X4w741q/a8TQ==
X-Google-Smtp-Source: AA6agR7g4La63K6kwXrXVX6znf+NflmbiGvFhBNIhfQcl1MbLrN352E/Ze/znLKy4ZexF3O4TTVqig==
X-Received: by 2002:a2e:bf07:0:b0:261:cafb:d4a8 with SMTP id c7-20020a2ebf07000000b00261cafbd4a8mr8287622ljr.268.1661972319228;
        Wed, 31 Aug 2022 11:58:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:58:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 09/12] dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
Date:   Wed, 31 Aug 2022 21:58:27 +0300
Message-Id: <20220831185830.1798676-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
References: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to make the schema more readable, split dpu-msm8998 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 161 ++++++------------
 .../bindings/display/msm/mdss-msm8998.yaml    |  76 +++++++++
 2 files changed, 129 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 1e6b7e15f1c5..a71c49ba289a 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -9,143 +9,88 @@ title: Qualcomm Display DPU dt properties for MSM8998 target
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
 
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
+description: Device tree bindings for the MSM8998 DPU display controller.
 
 allOf:
-  - $ref: /schemas/display/msm/mdss-common.yaml#
+  - $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
     items:
-      - const: qcom,msm8998-mdss
+      - const: qcom,msm8998-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for regdma register set
+      - description: Address offset and size for vbif register set
+      - description: Address offset and size for non-realtime vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: regdma
+      - const: vbif
+      - const: vbif_nrt
 
   clocks:
     items:
-      - description: Display AHB clock
-      - description: Display AXI clock
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display mem-noc clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
       - const: iface
       - const: bus
+      - const: mnoc
       - const: core
-
-  iommus:
-    maxItems: 1
-
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
-    allOf:
-      - $ref: /schemas/display/msm/dpu-common.yaml#
-
-    properties:
-      compatible:
-        items:
-          - const: qcom,msm8998-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for regdma register set
-          - description: Address offset and size for vbif register set
-          - description: Address offset and size for non-realtime vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: regdma
-          - const: vbif
-          - const: vbif_nrt
-
-      clocks:
-        items:
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display mem-noc clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: mnoc
-          - const: core
-          - const: vsync
+      - const: vsync
 
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss: display-subsystem@c900000 {
-        compatible = "qcom,msm8998-mdss";
-        reg = <0x0c900000 0x1000>;
-        reg-names = "mdss";
+    display-controller@c901000 {
+        compatible = "qcom,msm8998-dpu";
+        reg = <0x0c901000 0x8f000>,
+              <0x0c9a8e00 0xf0>,
+              <0x0c9b0000 0x2008>,
+              <0x0c9b8000 0x1040>;
+        reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
 
         clocks = <&mmcc MDSS_AHB_CLK>,
                  <&mmcc MDSS_AXI_CLK>,
-                 <&mmcc MDSS_MDP_CLK>;
-        clock-names = "iface", "bus", "core";
-
-        #address-cells = <1>;
-        #interrupt-cells = <1>;
-        #size-cells = <1>;
-
-        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-controller;
-        iommus = <&mmss_smmu 0>;
-
-        power-domains = <&mmcc MDSS_GDSC>;
-        ranges;
-
-        display-controller@c901000 {
-            compatible = "qcom,msm8998-dpu";
-            reg = <0x0c901000 0x8f000>,
-                  <0x0c9a8e00 0xf0>,
-                  <0x0c9b0000 0x2008>,
-                  <0x0c9b8000 0x1040>;
-            reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
-
-            clocks = <&mmcc MDSS_AHB_CLK>,
-                     <&mmcc MDSS_AXI_CLK>,
-                     <&mmcc MNOC_AHB_CLK>,
-                     <&mmcc MDSS_MDP_CLK>,
-                     <&mmcc MDSS_VSYNC_CLK>;
-            clock-names = "iface", "bus", "mnoc", "core", "vsync";
-
-            interrupt-parent = <&mdss>;
-            interrupts = <0>;
-            operating-points-v2 = <&mdp_opp_table>;
-            power-domains = <&rpmpd MSM8998_VDDMX>;
-
-            ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                port@0 {
-                    reg = <0>;
-                    dpu_intf1_out: endpoint {
-                        remote-endpoint = <&dsi0_in>;
-                    };
+                 <&mmcc MNOC_AHB_CLK>,
+                 <&mmcc MDSS_MDP_CLK>,
+                 <&mmcc MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "mnoc", "core", "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmpd MSM8998_VDDMX>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
                 };
+            };
 
-                port@1 {
-                    reg = <1>;
-                    dpu_intf2_out: endpoint {
-                        remote-endpoint = <&dsi1_in>;
-                    };
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&dsi1_in>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
new file mode 100644
index 000000000000..3482468fb2d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-msm8998.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for MSM8998 target
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for MSM8998 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,msm8998-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,msm8998-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@c900000 {
+        compatible = "qcom,msm8998-mdss";
+        reg = <0x0c900000 0x1000>;
+        reg-names = "mdss";
+
+        clocks = <&mmcc MDSS_AHB_CLK>,
+                 <&mmcc MDSS_AXI_CLK>,
+                 <&mmcc MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        #address-cells = <1>;
+        #interrupt-cells = <1>;
+        #size-cells = <1>;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        iommus = <&mmss_smmu 0>;
+
+        power-domains = <&mmcc MDSS_GDSC>;
+        ranges;
+    };
+...
-- 
2.35.1

