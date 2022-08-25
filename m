Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A645A0D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 11:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240786AbiHYJxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 05:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238515AbiHYJx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 05:53:26 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65936AE200
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bx38so18866543ljb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Kz2AwCWKHDmjf3qjuApf6Od5DsDm3lcQBH2jB3nDWqc=;
        b=m9amoWcPhoABRfbNSRcFUFWFxgoOkWsmnSP5pVm3UN88pqL4i0dlR9iyRsTleR5d+n
         1hL+5u9adxScxN9saRx6gJfeExoUQ8N+Bi+/n5WzEL2qGKyk+9fFkFYhCAe+xEjC3XNm
         KHiIZ05vH8cOHycLPUdYsIsL4a5NTNDYw7rVH8KUG65WYaLzuI6Bc5DwQZKuQQUl0dVD
         QryzXSKh8LlLW2Fln1udfba/z32UDcquLA0pb6sN0hmlDp5Dq4AlJtjDkoul0H/zH8v7
         Pc7BRNZzKsx08uml+zaHb2oBCxFmm5rNvTefd1U+tdXt2W2Wmk28FZVm7oIesgJjXqdO
         xS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Kz2AwCWKHDmjf3qjuApf6Od5DsDm3lcQBH2jB3nDWqc=;
        b=nnymWgGBibzR9OVgpiSgGoKPAD/GAeBz8DL57eYJ+dV7hclINpKdBUXuikwxinNOIb
         vBbIQGSu93Bq8JT2j0GM0TgTN4Px51b1fGxxwOP49Yqq8dnOUVq2XdEZ7EV0MaJSy+pT
         yCNnXEdZX+pgn/qUywqDkC0B4JvMfz7g25TFJ71Ppl1oQzTn3Nk93UGRiuq8RhraEPpp
         H3dKtKAr72QNqnZp2L3wUZrzt2NNewi/Ywl0dkQJaEiTNsWc2fYvtQ/vjTN5mjut7Fdl
         C6v09YdjyASVhKWiMLjbVD7fbT4BpWmRsVNPC6wPJjl7cBWpRt1eLOWFWdjL+cdRl25s
         3JsQ==
X-Gm-Message-State: ACgBeo2Zvm3Vc/FPgpw1h+hGfWOjTjt+Fm4+1on+1eL19k7KKEOfdXan
        AvF1wexafTfNWO1D7/mW45x9VtdAxyH5iA==
X-Google-Smtp-Source: AA6agR5/HR7SgnXsWjGLQxR5fWGG9CWvTAE9qjeoJ2IgDhpGdy+oEnDD2VtFHaKI00T9sfmrmZ2TuA==
X-Received: by 2002:a2e:a913:0:b0:25d:3128:21af with SMTP id j19-20020a2ea913000000b0025d312821afmr857081ljq.58.1661421066885;
        Thu, 25 Aug 2022 02:51:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:51:06 -0700 (PDT)
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
Subject: [PATCH v4 02/10] dt-bindings: display/msm: move qcom,sdm845-mdss schema to mdss.yaml
Date:   Thu, 25 Aug 2022 12:50:55 +0300
Message-Id: <20220825095103.624891-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sdm845.yaml      | 135 +++------
 .../devicetree/bindings/display/msm/mdss.yaml | 265 ++++++++++++++----
 2 files changed, 239 insertions(+), 161 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 2bb8896beffc..2074e954372f 100644
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
 
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index afc48d2b02f1..ef4709d87004 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,17 +18,15 @@ properties:
   compatible:
     enum:
       - qcom,mdss
+      - qcom,sdm845-mdss
 
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
@@ -53,10 +51,10 @@ properties:
     maxItems: 4
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   ranges:
     true
@@ -65,29 +63,178 @@ properties:
     items:
       - description: MDSS_CORE reset
 
-oneOf:
-  - properties:
-      clocks:
-        minItems: 3
-        maxItems: 4
-
-      clock-names:
-        minItems: 3
-        items:
-          - const: iface
-          - const: bus
-          - const: vsync
-          - const: core
-  - properties:
-      clocks:
-        minItems: 1
-        maxItems: 2
-
-      clock-names:
-        minItems: 1
-        items:
-          - const: iface
-          - const: core
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
+            const: qcom,mdss
+    then:
+      properties:
+        reg-names:
+          minItems: 2
+          items:
+            - const: mdss_phys
+            - const: vbif_phys
+            - const: vbif_nrt_phys
+      oneOf:
+        - properties:
+            clocks:
+              minItems: 3
+              maxItems: 4
+
+            clock-names:
+              minItems: 3
+              items:
+                - const: iface
+                - const: bus
+                - const: vsync
+                - const: core
+        - properties:
+            clocks:
+              minItems: 1
+              maxItems: 2
+
+            clock-names:
+              minItems: 1
+              items:
+                - const: iface
+                - const: core
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
+            const: qcom,sdm845-mdss
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
+        iommus:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mdss
+    then:
+      patternProperties:
+        "^mdp@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,mdp5
+
+        "^dsi@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,mdss-dsi-ctrl
+
+        "^dsi-phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,dsi-phy-14nm
+                - qcom,dsi-phy-14nm-660
+                - qcom,dsi-phy-20nm
+                - qcom,dsi-phy-28nm-hpm
+                - qcom,dsi-phy-28nm-lp
+
+        "^hdmi-phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,hdmi-phy-8084
+                - qcom,hdmi-phy-8660
+                - qcom,hdmi-phy-8960
+                - qcom,hdmi-phy-8974
+                - qcom,hdmi-phy-8996
+
+        "^hdmi-tx@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,hdmi-tx-8084
+                - qcom,hdmi-tx-8660
+                - qcom,hdmi-tx-8960
+                - qcom,hdmi-tx-8974
+                - qcom,hdmi-tx-8994
+                - qcom,hdmi-tx-8996
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sdm845-mdss
+    then:
+      patternProperties:
+        "^display-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sdm845-dpu
+
+        "^dsi@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,mdss-dsi-ctrl
+
+        "^dsi-phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,dsi-phy-10nm
 
 required:
   - compatible
@@ -106,48 +253,21 @@ required:
 patternProperties:
   "^mdp@[1-9a-f][0-9a-f]*$":
     type: object
-    properties:
-      compatible:
-        const: qcom,mdp5
+
+  "^display-controller@[1-9a-f][0-9a-f]*$":
+    type: object
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
-    properties:
-      compatible:
-        const: qcom,mdss-dsi-ctrl
 
   "^dsi-phy@[1-9a-f][0-9a-f]*$":
     type: object
-    properties:
-      compatible:
-        enum:
-          - qcom,dsi-phy-14nm
-          - qcom,dsi-phy-20nm
-          - qcom,dsi-phy-28nm-hpm
-          - qcom,dsi-phy-28nm-lp
 
   "^hdmi-phy@[1-9a-f][0-9a-f]*$":
     type: object
-    properties:
-      compatible:
-        enum:
-          - qcom,hdmi-phy-8084
-          - qcom,hdmi-phy-8660
-          - qcom,hdmi-phy-8960
-          - qcom,hdmi-phy-8974
-          - qcom,hdmi-phy-8996
 
   "^hdmi-tx@[1-9a-f][0-9a-f]*$":
     type: object
-    properties:
-      compatible:
-        enum:
-          - qcom,hdmi-tx-8084
-          - qcom,hdmi-tx-8660
-          - qcom,hdmi-tx-8960
-          - qcom,hdmi-tx-8974
-          - qcom,hdmi-tx-8994
-          - qcom,hdmi-tx-8996
 
 additionalProperties: false
 
@@ -180,4 +300,27 @@ examples:
       ranges;
 
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    display-subsystem@ae00000 {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          compatible = "qcom,sdm845-mdss";
+          reg = <0x0ae00000 0x1000>;
+          reg-names = "mdss";
+          power-domains = <&dispcc MDSS_GDSC>;
+
+          clocks = <&gcc 19>,
+                   <&dispcc 12>;
+          clock-names = "iface", "core";
+
+          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          iommus = <&apps_smmu 0x880 0x8>,
+                   <&apps_smmu 0xc80 0x8>;
+          ranges;
+        };
 ...
-- 
2.35.1

