Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1959C9D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbiHVUSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236343AbiHVUSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:18:17 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC662E63
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z6so16831367lfu.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=JqM4B15m9VLyOzM9sliuAc5jaOssdDDOhkYVOsDMjkQ=;
        b=GETAl532nDkKkok4oPCcLqB5BAptgiLBrtPGHcwQPdHWDAAv3Q7lK4oA/2GEOnMA4g
         BVWgncWmDIDchscV3vRnPU/d1ZAaQM0YR9GzlUp0AizA01qIZd9A7fVAdvjkTEonBFJz
         masNSYtroQFDv4TZfkmVBggsUTdXK8SKt6NP/q+rCIC2tynOQ5dXBnPtAWZfjBuX9HKE
         VanN3giJ4ZC5wPZf9S02NfEgYsyK75K+j91/lFwj2qXf1N/2GxFY4iLU24v5AxAueOFn
         BEJNhCc3lC/wagi0ZxUebt4Kyas5EZrAcQbrmOUbOb+f1Rt1IHB3uaGU0G2POWsZI951
         uEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=JqM4B15m9VLyOzM9sliuAc5jaOssdDDOhkYVOsDMjkQ=;
        b=dvOMIi23ATpa8GhV3AEB+BF6WUlzIe9o0wAQOgcZTPqytuXozrwFyDfR/Bl047nxCI
         G9h/SY3cShccEPKOK+6Z7y8ziSr74qT38p0z920OczoKqXITnkSi8Erp+avfau0GUdAI
         Sh0CRQ6uAfoCVSgokCqDynbBqMuRDAObjFzffI6K9Ilk2CUoZLfofoQpgyRYmj6jO7sp
         PVJ/WBEK0zbUag5SvKXvUzV/qULxBKAXE/MaMQxgi6SRSqGiSzIBXd/72ywTztdjbK7z
         AeI8xln/SgJrg2rFsqfHtfe1l5a23XiTO9U16FmLiD0e+YtGRI4yrXvusoIFLy0r4Ueb
         ZXPw==
X-Gm-Message-State: ACgBeo2E+noo1irKuSZUV8l3czZVWr6UIGvrSUnACm396rCwyIBaEAWR
        //akQaf7WjDS47T6k50kV9ROOA==
X-Google-Smtp-Source: AA6agR5cXTK/MCp7gylzpX3Id61oh/CUt43svADLG8S9QzvyUE5M+gBubxDii3EjfcWfe2qIyRxVfA==
X-Received: by 2002:a05:6512:3b94:b0:492:bbe1:df3e with SMTP id g20-20020a0565123b9400b00492bbe1df3emr8237821lfv.371.1661199494024;
        Mon, 22 Aug 2022 13:18:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:18:13 -0700 (PDT)
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
Subject: [PATCH v3 4/9] dt-bindings: display/msm: move qcom,sc7280-mdss schema to mdss.yaml
Date:   Mon, 22 Aug 2022 23:18:03 +0300
Message-Id: <20220822201808.347783-5-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sc7280-mdss from dpu-sc7280.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7280.yaml      | 148 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  19 +++
 2 files changed, 57 insertions(+), 110 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index f427eec3d3a4..349a454099ad 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -10,149 +10,77 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7280.
+  Device tree bindings for the DPU display controller for SC7280 target.
 
 properties:
   compatible:
-    const: qcom,sc7280-mdss
+    const: qcom,sc7280-dpu
 
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
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: bus
+      - const: nrt_bus
       - const: iface
-      - const: ahb
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
-        const: qcom,sc7280-dpu
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
-          - description: Display sf axi clock
-          - description: Display ahb clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: nrt_bus
-          - const: iface
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
-            description: DPU_INTF1 (DSI)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF5 (EDP)
-
-        required:
-          - port@0
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF5 (EDP)
 
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
index ef1a4b1f7949..25815acd37f3 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-mdss
+      - qcom,sc7280-mdss
       - qcom,sdm845-mdss
       - qcom,mdss
 
@@ -167,6 +168,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mdss
+              - qcom,sc7280-mdss
     then:
       properties:
         clocks:
@@ -206,6 +208,7 @@ patternProperties:
   "^display-controller@[1-9a-f][0-9a-f]*$":
     oneOf:
       - $ref: dpu-sc7180.yaml
+      - $ref: dpu-sc7280.yaml
       - $ref: dpu-sdm845.yaml
 
   "^displayport-controller@[1-9a-f][0-9a-f]*$":
@@ -229,6 +232,14 @@ patternProperties:
       - $ref: dsi-phy-10nm.yaml#
       - $ref: dsi-phy-7nm.yaml#
 
+  "^edp@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-edp
+          - qcom,sc8180x-edp
+
   "^hdmi-phy@[1-9a-f][0-9a-f]*$":
     oneOf:
       - $ref: /schemas/phy/qcom,hdmi-phy-qmp.yaml#
@@ -237,6 +248,14 @@ patternProperties:
   "^hdmi-tx@[1-9a-f][0-9a-f]*$":
     $ref: hdmi.yaml#
 
+  "^phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-dsi-phy-7nm
+          - qcom,sc7280-edp-phy
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

