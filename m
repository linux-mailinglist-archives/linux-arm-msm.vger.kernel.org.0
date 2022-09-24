Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49475E8C75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbiIXMgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbiIXMgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:36:19 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F835EEE80
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so4119382lfo.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SCI6D5X4mRTpkQ1oFKXi2cH6JHc9Zl+mWS9mB2dRkfM=;
        b=ljlTEHZjav/IhcGTWQ50M9eF1Hv2xeOVwl2imgFKQLc+s3JdvwdIeqceJo8YSujHTJ
         gmXR0KhKJWJPkwnAcTqR51taKpCKsRO+J16I2PfkcHmJMKb5JOG1jKqwcbKayD/AqYig
         YPtHSol3v+8/uNji+EyOUClX3u0A32ta9EQv98sTkEeT5A89Hz82LDixzEm1m7wfjHNl
         0EfK7FeEtI0TC0Pvv6D9Xl0fljZW7sItxFpBwar28I45srRLvChqS2bY/oFFxlSSWHQX
         79El2rtgXFgIS/D4TT/4rU6DCRo7MLvjNeg4Il5FqQxv3m8OFBHyYyvhr0YWTWYjmJP+
         FDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SCI6D5X4mRTpkQ1oFKXi2cH6JHc9Zl+mWS9mB2dRkfM=;
        b=oMDQGxdPjGmC8TqiV/2Zf+94lr7m6VktJkAM0JYbhnUUhPnZqT7FqMQEMG2z1sdnWm
         bp+pW50wEyPME7dA5EN6oehYQTjKiSppOGJ5lWiaGZAi+enfltPSvxcxwOQeUqh2GU84
         1FemPS7n4HGvmHTsEtD05cNsC8/8jbj7z1lzwoGT1Exl9bhF7bQOnHAKhqWjKBd8uTs5
         imgTKPCDQX5X+8WApjX/PJK7FTtFGEqX6wfEbNqlWlUnqwjf8QgI4fkU4W+nYyPmlS6a
         fxDhGX+E4LNKqgqxigZdJpvGQ86gWHAI+CzBShF/KYafS3z1lmcXPsDz0qAOJpSwBz5r
         x8OA==
X-Gm-Message-State: ACrzQf22+CTEjuqj+yCK8mR8GvMWTJj06v/M4CdMO6isczwhkb6odf2X
        Di606wyg+Y9SgFsVe1v0AtvpfA==
X-Google-Smtp-Source: AMsMyM4T3Trfiwozdu2uGcZP8hKUe2xVLCclcCpTWu7Xe6ZpvVCNoXs4N1rZxVVvNjtwuihPkqQuaw==
X-Received: by 2002:a05:6512:3b07:b0:49f:4443:d047 with SMTP id f7-20020a0565123b0700b0049f4443d047mr4912602lfv.63.1664022976999;
        Sat, 24 Sep 2022 05:36:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:36:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH v8 05/12] dt-bindings: display/msm: move common MDSS properties to mdss-common.yaml
Date:   Sat, 24 Sep 2022 15:36:04 +0300
Message-Id: <20220924123611.225520-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move properties common to all MDSS DT nodes to the mdss-common.yaml.

This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
will be added later, once msm8998 gains interconnect support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
 .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
 .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
 .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
 .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
 6 files changed, 111 insertions(+), 218 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 200eeace1c71..67791dbc3b5d 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for MSM8998 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,msm8998-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock
@@ -40,23 +33,8 @@ properties:
       - const: bus
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-
-  ranges: true
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -100,18 +78,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index d5f1d16b13d3..42e676bdda4e 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
   and DPU are mentioned for QCM2290 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,qcm2290-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -40,35 +33,14 @@ properties:
       - const: bus
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
+    maxItems: 2
 
   interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
+    maxItems: 1
 
   interconnect-names:
-    const: mdp0-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -108,18 +80,7 @@ patternProperties:
           - const: lut
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 2ac10664d79a..99d6bbd45faf 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SC7180 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,sc7180-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -40,34 +33,14 @@ properties:
       - const: ahb
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-
-  ranges: true
+    maxItems: 1
 
   interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
+    maxItems: 1
 
   interconnect-names:
-    const: mdp0-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -109,18 +82,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 4ca7bc7f0185..01ff88c06c51 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -14,19 +14,12 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SC7280.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     const: qcom,sc7280-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -39,34 +32,14 @@ properties:
       - const: ahb
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-
-  ranges: true
+    maxItems: 1
 
   interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
+    maxItems: 1
 
   interconnect-names:
-    const: mdp0-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -107,18 +80,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index de193ca11265..ae649bb6aa81 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SDM845 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,sdm845-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -38,38 +31,14 @@ properties:
       - const: iface
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
+    maxItems: 2
 
   interconnects:
-    items:
-      - description: Interconnect path from mdp0 port to the data bus
-      - description: Interconnect path from mdp1 port to the data bus
+    maxItems: 2
 
   interconnect-names:
-    items:
-      - const: mdp0-mem
-      - const: mdp1-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 2
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -109,18 +78,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
new file mode 100644
index 000000000000..2a476bd0215e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS common properties
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc.
+
+properties:
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    minItems: 1
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+  ranges: true
+
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: true
-- 
2.35.1

