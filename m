Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE38E55AD7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbiFYXZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbiFYXZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:25 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BB612629
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a11so6820376ljb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kRBb/OPDanlwMZRINz4uPKCzFdB2XPw4fim210cBGNk=;
        b=qP++GEa1Mjp/ayyGwFnm4D8Bq4bhE7hTG93h3+Y7jkbZJs5fT9PL8GLGZG5/ifquZc
         OG5VDPXBOSETxQ8Z395FAmrNkLnv5daXFai0AuvbPKKUMzLHPfH83E/aqOH/sCtvuWFD
         yiQwZd6EQrXnVoyfpq941Bi0qcwNhVjPb1zO/l6nArBHDtzqZRyAXyoqqod53AUpXxYY
         M2lIDP0Zw8MfZbElzFEsjwyEO0vFSk3E/16vWVF/e/PPy95fpF4qr8xlAatE/7oaGMVA
         FSD67l9tW5dzJYY8rhAUg2EjDehE2W9WcEooUuDfHVWGwnM5L05eRIRFkzZ4s3hDzKop
         b1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRBb/OPDanlwMZRINz4uPKCzFdB2XPw4fim210cBGNk=;
        b=xGpKD0Eb1nr11rkt0m6HkkKk7A4UeMcR6gX+sxAQLAaEhHBk2QTC+Skyf+q9JXFSIB
         K57jda3mUv8fbehzLIWXA863XY4w3bOyyzY1Nb3kBf86HOl7QczFRkjVpLr8eNpBwfTa
         +CwFCEvAuveka+LLqo1jZa2PrqQmmykQgHNDteCLB2OFTY27Dq4AYG93PbVX3C4Rk+Mk
         sI3Pbwv3r2WLxIu9T7Bj0OR8bR5S+EpWE/P3sE9d9sUuZ0IQoUn0fRgsk06nfqWZ3j1f
         99vRYC4e6Nx1E5mvRTkR5Vrf0WVshaUdXwmNSsPvtSbuy+WWRaKebs74o6KFrhdiEw15
         jq5g==
X-Gm-Message-State: AJIora8jTlZcxeoOPRqEUxi8PaDZe9optVLIIRlGeqrf/srIGBPcXJAP
        X+O0ujWmHhy69vLfthkasHzuZQ==
X-Google-Smtp-Source: AGRyM1tnIfwTfxwZ8KJIKQ51+tI7H7FHiA48PNlpFjCzMQ+CnwdXVfvMXIlvN2YTfZ3hgIrhUsM6vw==
X-Received: by 2002:a2e:94cc:0:b0:24f:81d:15f3 with SMTP id r12-20020a2e94cc000000b0024f081d15f3mr3132509ljh.407.1656199521654;
        Sat, 25 Jun 2022 16:25:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 06/11] dt-bindings: display/msm: move qcom,msm8998-mdss schema to mdss.yaml
Date:   Sun, 26 Jun 2022 02:25:08 +0300
Message-Id: <20220625232513.522599-7-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,msm8998-mdss from dpu-msm8998.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  25 +++
 2 files changed, 65 insertions(+), 102 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 2df64afb76e6..5caf46a1dd88 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -10,142 +10,80 @@ maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
+  Device tree bindings for the DPU display controller for MSM8998 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,msm8998-mdss
+      - const: qcom,msm8998-dpu
 
   reg:
-    maxItems: 1
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for regdma register set
+      - description: Address offset and size for vbif register set
+      - description: Address offset and size for non-realtime vbif register set
 
   reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
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
 
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index c84e0c984e27..cce60d100bb1 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,msm8998-mdss
       - qcom,qcm2290-mdss
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
@@ -142,6 +143,29 @@ allOf:
             - const: vsync
             - const: core
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock
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
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -239,6 +263,7 @@ patternProperties:
     properties:
       compatible:
         enum:
+          - qcom,msm8998-dpu
           - qcom,qcm2290-dpu
           - qcom,sc7280-dpu
 
-- 
2.35.1

