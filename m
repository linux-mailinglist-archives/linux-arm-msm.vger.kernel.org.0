Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D4859C9CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbiHVUST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236208AbiHVUSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:18:17 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A182CD2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q18so10670055ljg.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=61wAH76LQyqfxnwWFbX14ajcJtScSjYqqBeFziK711s=;
        b=zczQJCljPEcGqViF/1GxfyVOunR+cZ2xmxF4ckx9x3YdTn9P4aEq0Ci4zq5CnhBlGZ
         emOSQ7oddaQRK0lkQL7Y5kog1kufjVC1jADXKuxgv+ohLCW4hZU0CRulaxFSm8t31pEN
         rfNEf525CJZB3k17rPsa3klOj6E0yUVfD4j23GPw5aLMSDZ9mDrGNwxP/+2eQtOklGDi
         mB0LhMc2n1WyMx5UrSUzcYt7xR47yWmsemCp44aa6sImwu6uAhQp7pVjA1nsAdLYhwJx
         4WBKhcXMwlbcXzB6A33GE8i1KM8YA2euoxW5VlhT8AW1GXdh8G8boIWCRuBLDq4Oh9Ij
         e9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=61wAH76LQyqfxnwWFbX14ajcJtScSjYqqBeFziK711s=;
        b=nn8o76YHSyaGWAIxnmgWo1l4baYlIZfqMQFh5ooJmu0zk5BIXL5jZt3OD/G/947AHS
         gKh7eow3VmzXElx1FMF7D1YBiQAykXwLrLv9nXX1f7lyn/zymozKdlU9IzaSTsnld15h
         IZdDVqmMZ2VqK204yJJyD/Tddr7Ur/TPegBi4LemY5H88oQ5rfVziVYMmqb8PQTrZ/5G
         bxbyyrfsyA1JED5kFS64sJWF71uA6d0gx8HE89DOxkcPRlSG9LdvRim6GkDKY0T6TmXH
         Wl1dd43hgl3gfK7v5tBj41Rxu46i6cN7vveAvXZSxG9pA5Z5dJDHZK89I5l4ZXctTJ4f
         RQwA==
X-Gm-Message-State: ACgBeo0VTofv6HyJWtX/rOESKhm4sn2p3acef8FBN88MTsf3Z4oGIZqM
        LYW1CZBBHlf9MtzXOGkvIuCvKA==
X-Google-Smtp-Source: AA6agR4ugW1FRwLDn2iplQCB7z61uji3LHk2DcnE7RaeAzBerR+1Uiw+IhyxEFznCvf5V4G4VURGAw==
X-Received: by 2002:a2e:712:0:b0:25e:c39b:45cf with SMTP id 18-20020a2e0712000000b0025ec39b45cfmr6614190ljh.511.1661199492955;
        Mon, 22 Aug 2022 13:18:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:18:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Subject: [PATCH v3 3/9] dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
Date:   Mon, 22 Aug 2022 23:18:02 +0300
Message-Id: <20220822201808.347783-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
 2 files changed, 80 insertions(+), 114 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index d3c3e4b07897..9d4ec0b60c25 100644
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
 
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index db36c54d6106..ef1a4b1f7949 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sc7180-mdss
       - qcom,sdm845-mdss
       - qcom,mdss
 
@@ -64,20 +65,21 @@ properties:
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
@@ -129,9 +131,11 @@ allOf:
             - const: mdss
 
         interconnects:
+          minItems: 1
           maxItems: 2
 
         interconnect-names:
+          minItems: 1
           maxItems: 2
 
       required:
@@ -157,6 +161,29 @@ allOf:
         iommus:
           minItems: 2
 
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
@@ -177,7 +204,19 @@ patternProperties:
     # TODO: add reference once the mdp5 is converted
 
   "^display-controller@[1-9a-f][0-9a-f]*$":
-    $ref: dpu-sdm845.yaml
+    oneOf:
+      - $ref: dpu-sc7180.yaml
+      - $ref: dpu-sdm845.yaml
+
+  "^displayport-controller@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc8180x-dp
+          - qcom,sm8350-dp
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     $ref: dsi-controller-main.yaml#
-- 
2.35.1

