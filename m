Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7331956CE2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiGJJAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiGJJAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A023B13F69
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e28so678368lfj.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HqBMcyYNcqc5sX+puEFHuYG1D/6vwjms6TARbdoLJvU=;
        b=Gcx5hr7pNb+AX5i99tB06u2L1At9SuzY4qeTrvpgkVV6wd9QBgCLvm0wYznlFf+sjB
         AxUv4wo2CqBskYBlGvLkgSU8/vnbYod+hOw1HUv3f8zvr0Ey71Bo9QR5V3OzuN0pXC96
         hUjcHabuaGF1a8V0MUFwcX4yGKsIK9BMob1aOU1aUCZdAM2+nmhNZBLObEx29NWT4J9F
         SCvHFmWzbtFz52xkgORNqdMmvYNIihHunhXNi0D8kK5xB3ms3ClXJqRuW7ZHwzkCb3oW
         CFONxMCiNGX2PzXJ4VNIrFdGEvgSUup2TS/CMQSqI+4o/vnyfCIx8DMf14ekkSc0khGo
         5d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HqBMcyYNcqc5sX+puEFHuYG1D/6vwjms6TARbdoLJvU=;
        b=BQXt8Y1RBOFMnkD1HlKhe8pa8wM9K4ckhC1f4RTRDwIGK6bXXHkgEmYjdt13sIp+7p
         e46LF35a0LO590YzWpE6bsy5p4P/ZPjdscO4JLso9pm78zAplK6KGAIupj9o5D9RsWhv
         REh3G9T1WutS1GH90urTZru5vDqftUYzO6ORn+FzzSstp7etmYhj2u59Zg/PBGCkNELe
         FKpYbjmUGmxPEKyq5X4UAgtI8pTY6Fb5OptbNV2d4UJ30fZN4hZ6kCP6/FU3FX+e3wmM
         /y+Ve/SF9nwjeOn+S7trhIz3BU2j983hXMAniHy7eMwzqTcJwDFcVENBc9VceGqX291y
         KTDw==
X-Gm-Message-State: AJIora/zwo/uK1eZXrYLeOO86lbLvkabHE/FQAFOuYx/vOPIgDekb6pj
        tnBYB5yhq6IdGDaLcni57QPnGQ==
X-Google-Smtp-Source: AGRyM1vrOH1vGu0rjVk5plgy7K1hGMoJ/Ipoav14HpsVxpWOycVznx9d2Hw8MRa15xrCCKs3BajBpQ==
X-Received: by 2002:a05:6512:1104:b0:487:34de:5f9d with SMTP id l4-20020a056512110400b0048734de5f9dmr8489956lfg.162.1657443646105;
        Sun, 10 Jul 2022 02:00:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:45 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 06/11] dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
Date:   Sun, 10 Jul 2022 12:00:35 +0300
Message-Id: <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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
index 7d4ab3d71d2d..98f1f2501291 100644
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
 
   "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
-    $ref: dpu-sdm845.yaml
+    oneOf:
+      - $ref: dpu-sc7180.yaml
+      - $ref: dpu-sdm845.yaml
+
+  "^displayport-controller@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc8180x-dp
+          - qcom,sm8350-dp
 
   "^dsi@(0|[1-9a-f][0-9a-f]*)$":
     $ref: dsi-controller-main.yaml#
-- 
2.35.1

