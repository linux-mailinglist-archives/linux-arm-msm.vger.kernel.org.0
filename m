Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930F756CE38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiGJJAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGJJAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7D912097
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so4274237lfg.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKPLzcLCnVt5d9BV+HTHGXAGRfU803LtHdkNeW57BKA=;
        b=mhZuhioPs/xJBAAt7SiW3JYPKxd4OC9J//9TDeWnFEAnUaHtCUFsMqF+4U86yAGdV2
         R83k2tEDkMJASu7UAF+1Y2U1IfXPfTLvyjOZMJHGNsJZqaUYjsxaGtdFqSIhusv/aKa6
         T6+HFbgncVGrnAr3t6Jw58navdw4kifU4Dp/RKGEvcbchG0vmxFmsdJkzTLQ3n6feHNo
         K1D734YrCLnbGYLsbCX0uU3so+BoAnmfotWxdWdczh+buc5eg48g8p5H42MMoPRVX4y+
         kmom+YFf7ZhwBnt2qjmrM6XcaDQ2gTZFRF01/z+p4H0R8v2ouSXl5/c89bU2FUuPU0zK
         Si3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKPLzcLCnVt5d9BV+HTHGXAGRfU803LtHdkNeW57BKA=;
        b=pEcLNtSNOPhEEB3D0RE5IXAH8DW8cHxy/HSDHP7FQLVZki5HW69v8lxUTRF85rewCc
         1f2VtpHXVzbQIS5cHWB2KAoxw8+UhEfA0HCYHGWpvWUneBXNLrEbD3dLRM1kdJdpV2IP
         eQDvhtHNozHHYCh9TsV26Bfc3PldVwUQ1PAX4eiAJstDk3VOoMeEo6iZOKTehO38T3is
         gR7iPJI+m4/+nFlPf/kL/7HJRuCoswAzuNgTToD2c2DvVJlP8/+S4Uk0xjXiX/xBe+U/
         rD7RnoGyH3Lqx9BIOQ3uvxIdbV6JPzHeq03jM/Uu75Xobq/22ifk9/0146ww1J5zXqEk
         Kr4g==
X-Gm-Message-State: AJIora9GysdXVV0JNt8r7O1FY+ynSce8RIj+jhUkMMttHvNeqPmWtYlO
        XIes6dMrTEg6hqgqAuSo29jmrw==
X-Google-Smtp-Source: AGRyM1toGG+Xak6dPl4GT94gmwO9qkHMJvne1cv+sCD8rUg+eLqdPcm+Mthip2GC52KAiuuUEUcl2Q==
X-Received: by 2002:a05:6512:e90:b0:489:cd56:4610 with SMTP id bi16-20020a0565120e9000b00489cd564610mr4650254lfb.483.1657443647728;
        Sun, 10 Jul 2022 02:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:47 -0700 (PDT)
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
Subject: [PATCH v2 08/11] dt-bindings: display/msm: move qcom,qcm2290-mdss schema to mdss.yaml
Date:   Sun, 10 Jul 2022 12:00:37 +0300
Message-Id: <20220710090040.35193-9-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,qcm2290-mdss from dpu-qcm2290.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 140 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
 2 files changed, 57 insertions(+), 107 deletions(-)

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
index b1c7193417be..7359b233f3eb 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcm2290-mdss
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
       - qcom,sdm845-mdss
@@ -142,6 +143,28 @@ allOf:
       required:
         - iommus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-mdss
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
@@ -207,6 +230,7 @@ patternProperties:
 
   "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
     oneOf:
+      - $ref: dpu-qcm2290.yaml
       - $ref: dpu-sc7180.yaml
       - $ref: dpu-sc7280.yaml
       - $ref: dpu-sdm845.yaml
-- 
2.35.1

