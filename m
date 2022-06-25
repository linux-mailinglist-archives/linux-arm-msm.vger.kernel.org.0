Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1D255AD88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbiFYXZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbiFYXZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301EF10FC2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z21so10451485lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyRMeIbiDLnXpi/fuv89mwOxgCFmkBWYGD9DmqLcaq4=;
        b=ueSSNJxmNyxpQfZCZKa2OR1ckp9NalWJYEpppuRgAxO1H6CsUtrk5B0u5YLVfmuzcb
         brJ5ZU1lSOc3O8EfW7rCc7O6HiOfDOMh8mDZ7DiV8OvovDydxpiokRnOCfThA/KKS831
         oF5p5aRa9yLaZZrRWMXxk+kSlNcXaCecJs1gvoVKMmoxVI0r7vaGbeT6GTVFtRaV4ERW
         IZhvrisn9oZYASEI1v8cx7mS8FKnENn0XuO/Z6Gjz17RVb/07d8f6K1xzDvNOcW9BotI
         6+xVYADLflPCOe3rPjVXaAQ9PmLr+dlaeJPXwYaIlhRTjJr/nWZXn7jpMHR2Ed++2sRo
         HDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyRMeIbiDLnXpi/fuv89mwOxgCFmkBWYGD9DmqLcaq4=;
        b=i8ZXzZ4QlfrAlGbVYTPwjX9agLZv52Oa4REIAkd+OV2mOfVE/zXr86CbdtenhdRvIh
         9P4I418SDzd8Yy9spjGbRH9bUw7R2XOsN0JZdOD05xL8QSU/PgVrjb8v9dSDwC4v8zvi
         kZPWRdbW8ZJp19qNYdEzoAOFTubBSmO5g/y1p2OXe+mfmHiTFh8N88OuHnyp0R8UB6P0
         lV0UvTlbp4FNV2iTK4b52vKqTDjzUkI/Eudw1KgD1UlO5QBYWPPOU85ndS2UFCsQ/1Nj
         vEoG5sLSb5ZLPyn1/8BhmShSUjvSKCQjV1yruRiSsGAFzz1V2CWktxJCCCs6N36Z7qaX
         50qw==
X-Gm-Message-State: AJIora9NSNicWeHYuWZl985KSJIY0gZS6j+8wjrq5oHgDqG68rs9G8qA
        7WH3dD93MT+qrm1FJGvtkuCnzg==
X-Google-Smtp-Source: AGRyM1vlMRZ+TV0YJ+n68BenpUf/SxHHr2hhEv9FRw77NjpFfV0f9V3G4f3Nu1WUpnJlhDgXeRtqSg==
X-Received: by 2002:ac2:5974:0:b0:47f:92db:4480 with SMTP id h20-20020ac25974000000b0047f92db4480mr3510058lfp.685.1656199518508;
        Sat, 25 Jun 2022 16:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 03/11] dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
Date:   Sun, 26 Jun 2022 02:25:05 +0300
Message-Id: <20220625232513.522599-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

While we are at it, rename display-controller node to mdp to reflect
actual node name in the sc7180.dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7180.yaml      | 151 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
 2 files changed, 82 insertions(+), 114 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index d3c3e4b07897..f9f22ec56a21 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -10,151 +10,78 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7180 target.
+  Device tree bindings for the DPU display controller for SC7180 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,sc7180-mdss
+      - const: qcom,sc7180-dpu
 
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
-      - description: Display AHB clock from dispcc
+      - description: Display hf axi clock
+      - description: Display ahb clock
+      - description: Display rotator clock
+      - description: Display lut clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: bus
       - const: iface
-      - const: ahb
+      - const: rot
+      - const: lut
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
-
-  ranges: true
-
-  interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
-
-  interconnect-names:
-    const: mdp0-mem
+  power-domains:
+    maxItems: 1
 
-  resets:
-    items:
-      - description: MDSS_CORE reset
+  operating-points-v2: true
 
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
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
-          - const: qcom,sc7180-dpu
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
-          - description: Display hf axi clock
-          - description: Display ahb clock
-          - description: Display rotator clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: iface
-          - const: rot
-          - const: lut
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
-
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
-          port@2:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF0 (DP)
-
-        required:
-          - port@0
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI1)
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF0 (DP)
 
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
 
@@ -188,7 +115,7 @@ examples:
          iommus = <&apps_smmu 0x800 0x2>;
          ranges;
 
-         display-controller@ae01000 {
+         mdp@ae01000 {
                    compatible = "qcom,sc7180-dpu";
                    reg = <0x0ae01000 0x8f000>,
                          <0x0aeb0000 0x2008>;
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index 1cfdec9e349b..244ec36e74a4 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc7180-mdss
       - qcom,sdm845-mdss
       - qcom,mdss
 
@@ -65,20 +66,21 @@ properties:
       - description: MDSS_CORE reset
 
   interconnects:
-    minItems: 2
+    minItems: 1
     items:
       - description: MDP port 0
       - description: MDP port 1
       - description: Rotator
 
   interconnect-names:
-    minItems: 2
+    minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
       - const: rotator-mem
 
   iommus:
+    minItems: 1
     items:
       - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
       - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
@@ -108,9 +110,11 @@ allOf:
             - const: mdss
 
         interconnects:
+          minItems: 1
           maxItems: 2
 
         interconnect-names:
+          minItems: 1
           maxItems: 2
 
       required:
@@ -154,6 +158,32 @@ allOf:
             - const: iface
             - const: core
 
+        iommus:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock from gcc
+            - description: Display AHB clock from dispcc
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: ahb
+            - const: core
+
+        iommus:
+          maxItems: 1
+
 required:
   - compatible
   - reg
@@ -175,8 +205,19 @@ patternProperties:
       compatible:
         enum:
           - qcom,mdp5
+          - qcom,sc7180-dpu
           - qcom,sdm845-dpu
 
+  "^displayport-controller@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc8180x-dp
+          - qcom,sm8350-dp
+
   "^dsi@(0|[1-9a-f][0-9a-f]*)$":
     type: object
     properties:
-- 
2.35.1

