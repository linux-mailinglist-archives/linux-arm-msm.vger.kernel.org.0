Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BE25A0D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 11:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240729AbiHYJyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 05:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240706AbiHYJxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 05:53:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5281BAE23F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id s1so24694573lfp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Fe1PNr/dXeg4imVISsMZqCDXUMiTOmIDayYyUP6S6z0=;
        b=RoY0olgsX+pu2ZBciTar4vwnNzxq+r1zbvg/Fv6zGuHLZqidVPlrFxaryKUwL7Mxxo
         ng4vQr6RviLGchbA3bjfIFVodK0s4GLlfpAl9Q/9QVW7OR4miHAqw/+QwA+cZoZvHNey
         6q2KofiJv6V/LJmKP5r/zQgqeuH3POXqIawMG1iZlQ+c4bjdFOf5wt0AUdNIdBhElh2D
         fYbbXouAoSknwBaecN5FemuTyQWjwsIHObAkTwHZJK4IEqJFmiB5F3O7z3X31u33Th7F
         UC+6xV8e4VOIlt88uyrop4VfFR6e7zJ5KtMV1+AK5s/NwJzOf2kCGs1Z6MoZsk1I4Ybb
         zVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Fe1PNr/dXeg4imVISsMZqCDXUMiTOmIDayYyUP6S6z0=;
        b=v3LHooqasuvnE9cXjspUUz1Dhx/8XV475+opWsDi22C7m+UdUjkvMbhcxFFNNj7R5S
         cKvbg1vpUOMenqWpOa8T+MlMrGoxBIatoNYeKmh963v7Ym8MMtvzrHAxfyKe69vixpG9
         o2tlhe01vSktPhkfTdHxYI41Eyho5u52Elrg7OhH6Yq9EykCo+Sq1oOS8iQxASPRrdA0
         YgsC4jWQkZ/GhUtWfNyj/jz4tSs067NWgeCWv47f+1OQat+PhWrlI3JetFPokJ2rcWid
         E091/hS84qJnxWLiFFSBEanRt0OcOTc80w42hdPgwR2FFaPukrYndurP8G4kPCjwJDK6
         DUaA==
X-Gm-Message-State: ACgBeo0/imXzJJsz5IAQiMDpQIdxjRfWbngCOjx03mzELEB8nYfO3ki8
        +T//LOLS/8i9o8WQmAv4RuP9Ww==
X-Google-Smtp-Source: AA6agR5s/1D30sWtuboIFdVk5C3VZ2Ftr9epxmpFvBoVcc6CkV3vb6CNn2QmkjJeMVtFtyogRzaKOQ==
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id x32-20020a056512132000b004888fcce196mr879177lfu.602.1661421072566;
        Thu, 25 Aug 2022 02:51:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:51:12 -0700 (PDT)
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
Subject: [PATCH v4 08/10] dt-bindings: display/msm: move common DPU properties to dpu-common.yaml
Date:   Thu, 25 Aug 2022 12:51:01 +0300
Message-Id: <20220825095103.624891-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move properties common to all DPU DT nodes to the dpu-common.yaml.

Note, this removes description of individual DPU port@ nodes. However
such definitions add no additional value. The reg values do not
correspond to hardware INTF indices. The driver discovers and binds
these ports not paying any care for the order of these items. Thus just
leave the reference to graph.yaml#/properties/ports and the description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-common.yaml      | 42 ++++++++++++++++++
 .../bindings/display/msm/dpu-msm8998.yaml     | 43 ++-----------------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 39 ++---------------
 .../bindings/display/msm/dpu-sc7180.yaml      | 43 ++-----------------
 .../bindings/display/msm/dpu-sc7280.yaml      | 43 ++-----------------
 .../bindings/display/msm/dpu-sdm845.yaml      | 43 ++-----------------
 6 files changed, 62 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
new file mode 100644
index 000000000000..14eda883e149
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -0,0 +1,42 @@
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
+  Common properties for QCom DPU display controller.
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
+      such as DSI, DP etc.
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
index 5caf46a1dd88..158bd93a157f 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -47,45 +47,10 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF2 (DSI2)
-
-    required:
-      - port@0
-      - port@1
-
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
index 8027319b1aad..0364261bf3d2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -43,41 +43,10 @@ properties:
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
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-    required:
-      - port@0
-
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
index 9d4ec0b60c25..5df1f2d987c9 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -45,45 +45,10 @@ properties:
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
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF0 (DP)
-
-    required:
-      - port@0
-
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
index 349a454099ad..c822da588de0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -44,45 +44,10 @@ properties:
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
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI)
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF5 (EDP)
-
-    required:
-      - port@0
-
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
index 42ff85e80f45..218c9d0f3fed 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -43,45 +43,10 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF2 (DSI2)
-
-    required:
-      - port@0
-      - port@1
-
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

