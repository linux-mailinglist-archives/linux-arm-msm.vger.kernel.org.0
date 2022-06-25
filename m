Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8908E55AD71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbiFYXZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbiFYXZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4591E1146E
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:21 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s14so6834515ljs.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5zNPOt/JcdN9JMf5eVP0NQVxp4pLvzusCa+B9h0pWdQ=;
        b=CYyfcHeMQgBS3vFRUB7vxXicZnEfmPGAKr0WL94ZD5Y1k36lAKCxQPn6YKEpQwnn8z
         dJivgKMns6czDmHgi43qjG/lfmRPysnwYZWA1aoKARFRlqsu8653lvT1rT8cp7kngkqi
         rj8tZLGRQcWN7lmUnQrm0I17RPQ7PSMx9JFzlx9+Xm1v2OpUyhQch6Ep5fAwJOHGsC0w
         adqspmPH74ZLzk7Q5jlzJZyVGfjWdiNXO9MWXrGrMHUJP8PWf9YIgp8WBXK6X90Nc/ww
         j8br47m1pxuaj8zB9NU+e7IVRFnDDo+sFhBgmLr4Z0sX/LDL7caH2gbRv40ZOKyXx11G
         GgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5zNPOt/JcdN9JMf5eVP0NQVxp4pLvzusCa+B9h0pWdQ=;
        b=dEzpfcz9qXaXdTWUb89UdMf9gwwJlJbXqyxgW/a6AjKhIpJ2+3OjxM0918k45n2skG
         hvQfe+Sw2ICdzNSr/TRB7j6ntiQjqrxGubSJdU6Ru5twMGK8nic/eUa+8eNLdpOBMdj6
         BJp3VAcif2zgALoEEUMOXwoQAXx5j9+RHanIwJVSjwYcxRqMcBnTFYanLJsxTPiWzU7C
         l0+6BC4nfo31c8Qil/WTaaLbf04SAnV8Fu5Mzekpp1vEgq5TvKxQ+Y82B/3c1vRW0EV9
         Ff+j1ZqP5eo3AEieo/y2/J/0eE4AqSIuU7juOXAqWiAfLysfy9ggpKBJQl6qcRliQsEA
         fZMQ==
X-Gm-Message-State: AJIora/3sEBJ0nljCEHDtOVdKFsYIkBFeMn2H6NgbHsvie/5ui9p0lQz
        mkwUmSUkMUUqnxAW1Vf4mY967g==
X-Google-Smtp-Source: AGRyM1sXczeEAxKY2w1HAdTzPkwqQCNyntvrq+TCsqF186D6+ixhdx8L22zddGImZDWEk6N3mefdHg==
X-Received: by 2002:a2e:9581:0:b0:24f:2dc9:6275 with SMTP id w1-20020a2e9581000000b0024f2dc96275mr3197547ljh.486.1656199519624;
        Sat, 25 Jun 2022 16:25:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.18
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
Subject: [PATCH 04/11] dt-bindings: display/msm: move qcom,sc7280-mdss schema to mdss.yaml
Date:   Sun, 26 Jun 2022 02:25:06 +0300
Message-Id: <20220625232513.522599-5-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sc7280-mdss from dpu-sc7280.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7280.yaml      | 148 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  25 +++
 2 files changed, 63 insertions(+), 110 deletions(-)

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
index 244ec36e74a4..6221356b3003 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -19,6 +19,7 @@ properties:
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
@@ -208,6 +210,13 @@ patternProperties:
           - qcom,sc7180-dpu
           - qcom,sdm845-dpu
 
+  "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-dpu
+
   "^displayport-controller@(0|[1-9a-f][0-9a-f]*)$":
     type: object
     properties:
@@ -243,6 +252,14 @@ patternProperties:
           - qcom,dsi-phy-28nm-lp
           - qcom,sc7280-dsi-phy-7nm
 
+  "^edp@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-edp
+          - qcom,sc8180x-edp
+
   "^hdmi-phy@(0|[1-9a-f][0-9a-f]*)$":
     type: object
     properties:
@@ -266,6 +283,14 @@ patternProperties:
           - qcom,hdmi-tx-8994
           - qcom,hdmi-tx-8996
 
+  "^phy@(0|[1-9a-f][0-9a-f]*)$":
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

