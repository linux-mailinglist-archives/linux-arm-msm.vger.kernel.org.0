Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9EA155AD83
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbiFYXZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233669AbiFYXZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DE512636
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:22 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id o23so6779726ljg.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A/reHS7fqK/aI2ElXOkuQdSpCrOHzy2CvQlkd3mnmrI=;
        b=F1RZ8wBWRsUMcbLzssvVeWYX2uuTWDsjeQajMoWnpLLyx6SYFGklZYP/fMKlBjeYKi
         isaAB612MKeTKTgvcF7uTeOSS8hMzVmxZqrLFmaf8fiuudbm6a9VixGLkx7RC+wiPaQw
         87Jp59Yk7EXt0JNFZ38CsdlCUm6V3ta9faEXo68UfWiw3A2sxCqWnqCg3NY/zjAGdMMg
         NJlvvr3m7PICIkF4HstvrZGUAH7PdlJKh3bYa0zNLaB0hLdYrHBpu8CeXN6duVtY+eZi
         qXZHnoJJDT7Sshf8n/C68K08sO5gPToiLS/qvrMNJlKd9Hn8RjYfJteE5jH+0BdKCH6s
         Ih9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A/reHS7fqK/aI2ElXOkuQdSpCrOHzy2CvQlkd3mnmrI=;
        b=TvytfFz2n8ursgBokoVlh5UoL0uwBmSWpLyLu52O7RHUVXMWkEnS7p4RJCbIxzSsog
         rYWVujroUF6grlFvBOPoJchrlC1h87/0TZDNfZAPLK/0dl97vb5mHcCPaWiuk6vkGhAE
         rDoGTFsOz6lo3MXbQzc4HQsGYdR82mlGKZYIGd0qL7as43jU8c3yq04VGrOwdobP0Ixi
         uFj4eRIHXwzHiDEVmdDAdhB546Rl1/VhWK+19JCZIzUzifxCnsJlK1R7iTS1OBH92CwI
         y8UQclu3V1TUsVbZHpIiv5fVYCStw3Xbtk4wKvJG1rkAWVagOFX8phbFcOxfQPGAvjEj
         K2Hg==
X-Gm-Message-State: AJIora/ueKH15IiayVAJTKgKiR5ap7dweWV1z+MRYRWSFwDEIe7eicos
        8kljtonrEbJKfyLiTKEVpeNTgw==
X-Google-Smtp-Source: AGRyM1sXW3OvzG7rAzgVj34Du0nhOz1Hz+g4TJOoKtfr4E7ot4XVO0t6k/G+6fHB3tv7r5VOCLLnMg==
X-Received: by 2002:a2e:a60a:0:b0:25a:7304:6879 with SMTP id v10-20020a2ea60a000000b0025a73046879mr3045773ljp.85.1656199520642;
        Sat, 25 Jun 2022 16:25:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 05/11] dt-bindings: display/msm: move qcom,qcm2290-mdss schema to mdss.yaml
Date:   Sun, 26 Jun 2022 02:25:07 +0300
Message-Id: <20220625232513.522599-6-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,qcm2290-mdss from dpu-qcm2290.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 140 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  25 ++++
 2 files changed, 58 insertions(+), 107 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 734d14de966d..8027319b1aad 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -10,146 +10,72 @@ maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  and DPU are mentioned for QCM2290 target.
+  Device tree bindings for the DPU display controller for QCM2290 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,qcm2290-mdss
+      - const: qcom,qcm2290-dpu
 
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
-      - description: Display AXI clock
-      - description: Display core clock
+      - description: Display AXI clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock from dispcc
+      - description: Display lut clock from dispcc
+      - description: Display vsync clock from dispcc
 
   clock-names:
     items:
-      - const: iface
       - const: bus
+      - const: iface
       - const: core
+      - const: lut
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
+      such as DSI. Each output port contains an endpoint that
+      describes how it is connected to an external interface.
 
     properties:
-      compatible:
-        items:
-          - const: qcom,qcm2290-dpu
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
-          - description: Display AXI clock from gcc
-          - description: Display AHB clock from dispcc
-          - description: Display core clock from dispcc
-          - description: Display lut clock from dispcc
-          - description: Display vsync clock from dispcc
-
-      clock-names:
-        items:
-          - const: bus
-          - const: iface
-          - const: core
-          - const: lut
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
-          such as DSI. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-        required:
-          - port@0
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI1)
 
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
 
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index 6221356b3003..c84e0c984e27 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcm2290-mdss
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
       - qcom,sdm845-mdss
@@ -141,6 +142,29 @@ allOf:
             - const: vsync
             - const: core
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock from gcc
+            - description: Display AXI clock
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: core
+
+        iommus:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -215,6 +239,7 @@ patternProperties:
     properties:
       compatible:
         enum:
+          - qcom,qcm2290-dpu
           - qcom,sc7280-dpu
 
   "^displayport-controller@(0|[1-9a-f][0-9a-f]*)$":
-- 
2.35.1

