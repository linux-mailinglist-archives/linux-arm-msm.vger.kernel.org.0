Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4D65A8637
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbiHaS7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbiHaS7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:36 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2157AC122F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq23so21255248lfb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cjadDMsahk1nQtSBnbE1AkGGTfemSP4KJ3MywIDJPzA=;
        b=NEUv08uxU+CY0VZ5WEGjqdx7nttkPoGVs4zMtRUF2NjBlxpH/9YcLfU7GYBNfo6NVA
         wCQwNudQEyWUn3jZ7Z2JCDxWYj2ubmWW67ll4k5A8cU3wokOlTW9wQv4ATR5t5OvMXmW
         G2398jioDYzcVcGj0KU62vNQouzkbB2Mx4RyXS3U/UH7byBE2aq7hRviZaB3grzdQFGl
         ErQMNcWpnzM5L3b852nUr04vSp3Z2M9WJ7AFOa7fuN95MsepwbYh92KmLCVX7WU+B0ig
         ALxSTymvw2xUd0SSpTcT6/yoKUCWyAzTTTEP/gfS6oeDTOu8WOU8Rw0ssqJTUrBs8v8Y
         x21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cjadDMsahk1nQtSBnbE1AkGGTfemSP4KJ3MywIDJPzA=;
        b=zSf5psoacNE+Wdzr0tl3WcRTlkYoJr5AHJZukdoZk0Vn3auZ/EaSlpJ/Ltxhj/H/M5
         XV2F09Y6oHbyl7hky3K3hCA9v15eFy1YC/ckIm/K4acwaV92DqRjbXD2ptXHwQe9ImLN
         z0cCU3Jz0ItImLd/7p3AtvH2UmGRKWmeI8qsLzMgmMWOEHwlqn3YRxmFuWHrfDXDcm2T
         gTulahKBNzy1gKTEFRAGckPF1abNje6Q8N915QqayaLykLV8YITwEVizwyWdeVehKn/m
         3wrJ369mggAPRuyBxjtwA1DRrZlTSwspD21FUyKV1xMHimKVujcMLNyDD98Z1nvKasB/
         4COg==
X-Gm-Message-State: ACgBeo2FhUkzzJKGD2rUuXg7WqBWa7UrS7rsVLwTZOw/CCDstgb5dWP1
        yaUZ+1SxOnr+IMnJfuxNxJAGkQ==
X-Google-Smtp-Source: AA6agR7rZxG+U/0ViN7g/4FVMtQQcuReC9pIskrNz2ja+LHS2dXzTd004bwdaj/U7+WE9qUXdMEJ9A==
X-Received: by 2002:a05:6512:3183:b0:494:91b6:8ee3 with SMTP id i3-20020a056512318300b0049491b68ee3mr1140021lfe.288.1661972318422;
        Wed, 31 Aug 2022 11:58:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.37
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
Subject: [PATCH v5 08/12] dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
Date:   Wed, 31 Aug 2022 21:58:26 +0300
Message-Id: <20220831185830.1798676-9-dmitry.baryshkov@linaro.org>
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

In order to make the schema more readable, split dpu-sdm845 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sdm845.yaml      | 170 ++++++------------
 .../bindings/display/msm/mdss-sdm845.yaml     |  80 +++++++++
 2 files changed, 136 insertions(+), 114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 7e9d7c7f3538..4440f1987ddd 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -9,77 +9,41 @@ title: Qualcomm Display DPU dt properties for SDM845 target
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SDM845 target.
+description: Device tree bindings for the SDM845 DPU display controller.
 
 allOf:
-  - $ref: /schemas/display/msm/mdss-common.yaml#
+  - $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
     items:
-      - const: qcom,sdm845-mdss
+      - const: qcom,sdm845-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
 
   clocks:
     items:
-      - description: Display AHB clock from gcc
+      - description: Display GCC bus clock
+      - description: Display ahb clock
+      - description: Display axi clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: gcc-bus
       - const: iface
+      - const: bus
       - const: core
-
-  iommus:
-    maxItems: 2
-
-  interconnects:
-    maxItems: 2
-
-  interconnect-names:
-    maxItems: 2
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
-          - const: qcom,sdm845-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: vbif
-
-      clocks:
-        items:
-          - description: Display GCC bus clock
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: gcc-bus
-          - const: iface
-          - const: bus
-          - const: core
-          - const: vsync
+      - const: vsync
 
 unevaluatedProperties: false
 
@@ -87,65 +51,43 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    display-subsystem@ae00000 {
-          #address-cells = <1>;
-          #size-cells = <1>;
-          compatible = "qcom,sdm845-mdss";
-          reg = <0x0ae00000 0x1000>;
-          reg-names = "mdss";
-          power-domains = <&dispcc MDSS_GDSC>;
-
-          clocks = <&gcc GCC_DISP_AHB_CLK>,
-                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
-          clock-names = "iface", "core";
-
-          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-          interrupt-controller;
-          #interrupt-cells = <1>;
-
-          iommus = <&apps_smmu 0x880 0x8>,
-                   <&apps_smmu 0xc80 0x8>;
-          ranges;
-
-          display-controller@ae01000 {
-                    compatible = "qcom,sdm845-dpu";
-                    reg = <0x0ae01000 0x8f000>,
-                          <0x0aeb0000 0x2008>;
-                    reg-names = "mdp", "vbif";
-
-                    clocks = <&gcc GCC_DISP_AXI_CLK>,
-                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
-                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
-
-                    interrupt-parent = <&mdss>;
-                    interrupts = <0>;
-                    power-domains = <&rpmhpd SDM845_CX>;
-                    operating-points-v2 = <&mdp_opp_table>;
-
-                    ports {
-                           #address-cells = <1>;
-                           #size-cells = <0>;
-
-                           port@0 {
-                                   reg = <0>;
-                                   dpu_intf1_out: endpoint {
-                                                  remote-endpoint = <&dsi0_in>;
-                                   };
-                           };
-
-                           port@1 {
-                                   reg = <1>;
-                                   dpu_intf2_out: endpoint {
-                                                  remote-endpoint = <&dsi1_in>;
-                                   };
-                           };
-                    };
-          };
+    display-controller@ae01000 {
+                compatible = "qcom,sdm845-dpu";
+                reg = <0x0ae01000 0x8f000>,
+                      <0x0aeb0000 0x2008>;
+                reg-names = "mdp", "vbif";
+
+                clocks = <&gcc GCC_DISP_AXI_CLK>,
+                         <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                         <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                         <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
+
+                interrupt-parent = <&mdss>;
+                interrupts = <0>;
+                power-domains = <&rpmhpd SDM845_CX>;
+                operating-points-v2 = <&mdp_opp_table>;
+
+                ports {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+
+                       port@0 {
+                               reg = <0>;
+                               dpu_intf1_out: endpoint {
+                                              remote-endpoint = <&dsi0_in>;
+                               };
+                       };
+
+                       port@1 {
+                               reg = <1>;
+                               dpu_intf2_out: endpoint {
+                                              remote-endpoint = <&dsi1_in>;
+                               };
+                       };
+                };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
new file mode 100644
index 000000000000..0bc148f7fbd9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for SDM845 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SDM845 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sdm845-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          compatible = "qcom,sdm845-mdss";
+          reg = <0x0ae00000 0x1000>;
+          reg-names = "mdss";
+          power-domains = <&dispcc MDSS_GDSC>;
+
+          clocks = <&gcc GCC_DISP_AHB_CLK>,
+                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
+          clock-names = "iface", "core";
+
+          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          iommus = <&apps_smmu 0x880 0x8>,
+                   <&apps_smmu 0xc80 0x8>;
+          ranges;
+    };
+...
-- 
2.35.1

