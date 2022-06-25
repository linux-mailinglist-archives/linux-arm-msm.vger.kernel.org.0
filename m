Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A01855AD81
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbiFYXZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbiFYXZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:29 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F94310551
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:27 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id o23so6779726ljg.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GtR9Oh52X/bgTP8VZdLkGe+JVhZ2QZlEpAdaPA1dRmE=;
        b=dThMxlVT6Gssn2GFrZRU1o4HwygU8lPEgtiwc7CaCEZnxz0u/GYQimCl3+1VWCZWQ+
         lTWwzXZo2Op2nz0LV3PvMXx+lekIc1RzPGdgV6HbQaVgA8Bgs9woHRCqBZfOBhTMM9Jh
         QrYJBNYW37zEyMq5pC4LWgqSvaMvxIeaB0nhSPcB4JBtwjZV8bf7wUgtRFFTvgTO9Z2H
         e3Q6VicrL8u4HH0hdTP1k38r+GhfXixTHSS6nwQNxbQoM1/I1P17psDu+v5DEiUJJvkf
         eS/yqGiAlSMrNUnN3yBKyZavmG71N0HffuufTFxJU7mYQhJOIZ07PrFOOCqoNqIyOUqB
         hiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GtR9Oh52X/bgTP8VZdLkGe+JVhZ2QZlEpAdaPA1dRmE=;
        b=r5gUwYcAsFnY/gcAN3vC+c0rQLrP4ZzebL6jh4v7v1mIcdXpgqB/+ZyWPEh3loJuBm
         iJkMMHQ26xvZ3a3aezBRyrNEe1ZPcvq8Oj0ROEk5B0JjnbAIVgr6gBAM0EQdVuELPhoa
         Yjnwoky8HLovETN4EmerygI8VnNrMqf65m+pEKfAdf7GvMJCSHEgTke4T4AoT5XXkES8
         xcVFACxsBSH/VGIqn40d2iNq4aFOnGK+nysREB5PrFyp18h6BNOZH2HRAPzbDVaQXE8I
         dF3fILtX0yLxKvHQnP2D4+/FfROeTukECn2yUfzRyzc1Ln5DoBhDCrJumlWH+Ietx/FI
         WY9g==
X-Gm-Message-State: AJIora8Go8Sn/UP65v6bkMIYCJ/UeHvCAA1jT16H6P+m+APSHx17+O+i
        fPD0ihw+vy9hpgQgkiDdSmw4Aw==
X-Google-Smtp-Source: AGRyM1tnwBMoNMWjSHU6ZdtjU/uQTZx05ZkGCw8CKVkVN+jFupDGowR20u+K5GxPJhcm6Z5KhZtAlQ==
X-Received: by 2002:a2e:b888:0:b0:25a:9a7b:6967 with SMTP id r8-20020a2eb888000000b0025a9a7b6967mr3021528ljp.205.1656199526845;
        Sat, 25 Jun 2022 16:25:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 11/11] dt-bindings: display/msm: move common DPU properties to dpu-common.yaml
Date:   Sun, 26 Jun 2022 02:25:13 +0300
Message-Id: <20220625232513.522599-12-dmitry.baryshkov@linaro.org>
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

Move properties common to all DPU DT nodes to the dpu-common.yaml

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-common.yaml      | 47 +++++++++++++++++++
 .../bindings/display/msm/dpu-msm8998.yaml     | 28 ++---------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 29 ++----------
 .../bindings/display/msm/dpu-sc7180.yaml      | 32 ++-----------
 .../bindings/display/msm/dpu-sc7280.yaml      | 32 ++-----------
 .../bindings/display/msm/dpu-sdm845.yaml      | 32 ++-----------
 6 files changed, 67 insertions(+), 133 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
new file mode 100644
index 000000000000..f3465ee3a4ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -0,0 +1,47 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties (common properties)
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+  - Rob Clark <robdclark@gmail.com>
+
+description: |
+  Device tree bindings for the DPU display controller, common properties.
+
+properties:
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc. Each output port contains an endpoint that
+      describes how it is connected to an external interface.
+
+patternProperties:
+  (mdp-)?opp-table:
+    $ref: /schemas/opp/opp-v2.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - power-domains
+  - operating-points-v2
+  - ports
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 5caf46a1dd88..2207601c83df 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -47,21 +47,8 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
@@ -75,17 +62,10 @@ properties:
       - port@0
       - port@1
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8027319b1aad..8a0d6eda6e7c 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -43,22 +43,8 @@ properties:
       - const: lut
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
@@ -67,17 +53,10 @@ properties:
     required:
       - port@0
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 42921f25baa4..1047192b5b36 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -45,25 +45,8 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
-  mdp-opp-table:
-    $ref: /schemas/opp/opp-v2.yaml#
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
@@ -76,17 +59,10 @@ properties:
     required:
       - port@0
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 49c4a055d20f..543d90a84853 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -44,25 +44,8 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
-  opp-table:
-    $ref: /schemas/opp/opp-v2.yaml#
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
@@ -75,17 +58,10 @@ properties:
     required:
       - port@0
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index cc95adcf8f11..796c13d73ea3 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -43,25 +43,8 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
-  mdp-opp-table:
-    $ref: /schemas/opp/opp-v2.yaml#
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
@@ -75,17 +58,10 @@ properties:
       - port@0
       - port@1
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.35.1

