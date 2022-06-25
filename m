Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69C955AD79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbiFYXZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiFYXZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:21 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758C71262B
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:19 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b23so6809606ljh.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCzLYJUgko2agguJXgeqDQx6zKpjLh6bhFersLxvz8Q=;
        b=xPidH9RaL2zHFbG8W/L0nUKBp3YtEikdJvZNiyxgeJz6raz2JT4z+u2XZhKN237JiZ
         p9yffQxaZTHWyhUINKt4pIaYvRI8LT8FoJEzGrEQpSxjBA7KfPQBQcCrRRP/PWLnJeSx
         3jCtWuL+btkD4JlyGj7NQ0B746ybLuE16NtqW6pGDln+SEhXKjkft/H01SwTGR+PqFWI
         O4pUotFRPjxvaZUnmj+JC5w0CTgp/QfvNNMkW0Cg04i195NvauaV3PeI+Z2FWHLFIjuF
         glfN/IlvuHSaYcN8Xy7Bbu+qsn4okoETTcbz0mc+5bobpPVPeYpVnvF7xTRP4bUY34pN
         9jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCzLYJUgko2agguJXgeqDQx6zKpjLh6bhFersLxvz8Q=;
        b=uAmBgEm4togtrHkAn6YTdNAVJLsPn2SrI6zNWM7E+YeVovSRcsAYGbqCfEdQUlOLn0
         2MuiBmxJtsa7uFeDn/5O+XAp6+GTLtaAIzRmwX+jjo+cq+8RTim3zlFNb95oR6Qsw+wX
         Gvt2L4GbET/Hl/Js0HLH/pQmyNzeGcQiC5EOpTkoTm5enGUa2qTVzNv5uKsccnhZHkIT
         UzsI8Q5Bjs7EKOrurI5VqGYPmsY8ll5tDAlO31w0zxNT75pJl8tCIBMsY/qgjJf1p7te
         +CHlE1aHA3rE2mZYt3IracOQmzh2eTTnTdBZT1BOgEFzeynkQVU143Z56QuYVh/Gwv6l
         18Cg==
X-Gm-Message-State: AJIora8otlWuoFi955UvfF0q9Dq8AYl8Uzem4o08L28vrna6QzG2hLdE
        2HFb1XKqVAqTeXbXh0S38nmrGA==
X-Google-Smtp-Source: AGRyM1uH+Surv5r/P3W/k7ZKCG32PDyayLEnN88CWBJVcq15AyW/mZICh6c7o69fMBIpwRttCncD/Q==
X-Received: by 2002:a05:651c:1994:b0:255:aaa3:d02 with SMTP id bx20-20020a05651c199400b00255aaa30d02mr2959470ljb.410.1656199517645;
        Sat, 25 Jun 2022 16:25:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 02/11] dt-bindings: display/msm: move qcom,sdm845-mdss schema to mdss.yaml
Date:   Sun, 26 Jun 2022 02:25:04 +0300
Message-Id: <20220625232513.522599-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

While we are at it, rename display-controller node to mdp to reflect
actual node name in the sdm845.dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sdm845.yaml      | 137 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml | 112 ++++++++++++--
 2 files changed, 135 insertions(+), 114 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 2bb8896beffc..9253e0ca9fca 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -10,139 +10,74 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SDM845 target.
+  Device tree bindings for the DPU display controller for SDM845 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,sdm845-mdss
+      - const: qcom,sdm845-dpu
 
   reg:
-    maxItems: 1
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
 
   reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
+    items:
+      - const: mdp
+      - const: vbif
 
   clocks:
     items:
-      - description: Display AHB clock from gcc
+      - description: Display ahb clock
+      - description: Display axi clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
       - const: iface
+      - const: bus
       - const: core
+      - const: vsync
 
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
-  iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+  power-domains:
+    maxItems: 1
 
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
+  operating-points-v2: true
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc. Each output port contains an endpoint that
+      describes how it is connected to an external interface.
 
     properties:
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
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: core
-          - const: vsync
-
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI, DP etc. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF2 (DSI2)
-
-        required:
-          - port@0
-          - port@1
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI1)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF2 (DSI2)
 
     required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
+      - port@0
+      - port@1
 
 required:
   - compatible
   - reg
   - reg-names
-  - power-domains
   - clocks
   - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
+  - power-domains
+  - operating-points-v2
+  - ports
 
 additionalProperties: false
 
@@ -173,7 +108,7 @@ examples:
                    <&apps_smmu 0xc80 0x8>;
           ranges;
 
-          display-controller@ae01000 {
+          mdp@ae01000 {
                     compatible = "qcom,sdm845-dpu";
                     reg = <0x0ae01000 0x8f000>,
                           <0x0aeb0000 0x2008>;
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index 55c70922361d..1cfdec9e349b 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Mobile Display SubSystem (MDSS) dt properties
 
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
   - Rob Clark <robdclark@gmail.com>
 
 description: |
@@ -17,18 +18,16 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sdm845-mdss
       - qcom,mdss
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
-    items:
-      - const: mdss_phys
-      - const: vbif_phys
-      - const: vbif_nrt_phys
+    minItems: 1
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -50,17 +49,13 @@ properties:
 
   clock-names:
     minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
-      - const: core
+    maxItems: 4
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   ranges:
     true
@@ -69,6 +64,96 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  interconnects:
+    minItems: 2
+    items:
+      - description: MDP port 0
+      - description: MDP port 1
+      - description: Rotator
+
+  interconnect-names:
+    minItems: 2
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+      - const: rotator-mem
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss
+    then:
+      properties:
+        reg-names:
+          minItems: 2
+          items:
+            - const: mdss_phys
+            - const: vbif_phys
+            - const: vbif_nrt_phys
+    else:
+      properties:
+        regs:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: mdss
+
+        interconnects:
+          maxItems: 2
+
+        interconnect-names:
+          maxItems: 2
+
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 4
+
+        clock-names:
+          minItems: 1
+          items:
+            - const: iface
+            - const: bus
+            - const: vsync
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock from gcc
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: core
+
 required:
   - compatible
   - reg
@@ -90,6 +175,7 @@ patternProperties:
       compatible:
         enum:
           - qcom,mdp5
+          - qcom,sdm845-dpu
 
   "^dsi@(0|[1-9a-f][0-9a-f]*)$":
     type: object
-- 
2.35.1

