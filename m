Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DA559C9D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbiHVUSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbiHVUSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:18:20 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668742BCA
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:17 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l21so11682510ljj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Vxo5yaUMYooE+1KIds1knRD16Nz+JL2plyldR5AEjpk=;
        b=jOAYtYtSN8y1o8sJL+7V4ARaZDboFbPPu6p3rSbBbOALPUB30XZBx/6PbihvpJ0A0D
         OxT4VG4hg+flgu0d/rnpp06TCkHulhlWyotLyaNf35q6wbUPhmFb7r1LpPyl3x1vmsjH
         94vS8bQzGMzrbBQ5rau+ScL+LZlgfzFSQSL4KxjJAsjpSsasm2eZW1OEtpGprHf4gvxn
         UUuRc01CaPTbeTAR4aQJotdwsAtIvx73DvJwTgFY5HOVI/gnK0ZRAnByL2pcbdSCVIIK
         vAtFis4YEjg2cu6FLp6XWvJVFCkILHCc4b5EvmyDQDTGGitsIuDKOPR340QUBHllpC4H
         Dcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Vxo5yaUMYooE+1KIds1knRD16Nz+JL2plyldR5AEjpk=;
        b=QcnlJHHu/9HQlM0TvXegqpNmUqTM9W4ux7StLOo7ZUenUk2tmv0XD9Moitww4GvaTj
         2GImdVVjEUojO+JUj+sfOHzsI81oHcEVmAGpy57ZfF3wbHalyAuAnyHwsXZmPvG7bmZ4
         OQbqJUGq+X4uCsLMkoHthDUBKt13lh5DwLEg0bQNn2sU10s8fpsVivSATbFFWmyG2odS
         zj5H036CQ+aTz2OzWUbaVEdt9IRfGuWGr5ytpYlz9uy6368pEZXGOK9U7rZiHMkuwQ6m
         u0IYhCtMJ9Ccfxy5PfnKp+LX7SDUb98SKssROTAFO9yMiQX7WdH+e6oggHrTiq5VoYIB
         nxdg==
X-Gm-Message-State: ACgBeo3chAn5IqDQVcjNy0SzHfNlk6vKFuSpLU1pzbdrnd11d5Ma5FdW
        w9LZWs1aQKnFRzgS91Il7cMUJFsY2MjB2A==
X-Google-Smtp-Source: AA6agR4WeoVuiJ/1TpmB/OZ9IDo6FoRpSF1AEatf1S8UeKerg0NOGvu5kiDvcNBptdJZLxeFQdc7HQ==
X-Received: by 2002:a2e:8e99:0:b0:261:d303:35c1 with SMTP id z25-20020a2e8e99000000b00261d30335c1mr1198501ljk.116.1661199495718;
        Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
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
Subject: [PATCH v3 6/9] dt-bindings: display/msm: move qcom,msm8998-mdss schema to mdss.yaml
Date:   Mon, 22 Aug 2022 23:18:05 +0300
Message-Id: <20220822201808.347783-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
 2 files changed, 64 insertions(+), 102 deletions(-)

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
index 8bb7525681de..1e1e4b32f29f 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,msm8998-mdss
       - qcom,qcm2290-mdss
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
@@ -143,6 +144,28 @@ allOf:
       required:
         - iommus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,msm8998-mdss
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
@@ -230,6 +253,7 @@ patternProperties:
 
   "^display-controller@[1-9a-f][0-9a-f]*$":
     oneOf:
+      - $ref: dpu-msm8998.yaml
       - $ref: dpu-qcm2290.yaml
       - $ref: dpu-sc7180.yaml
       - $ref: dpu-sc7280.yaml
-- 
2.35.1

