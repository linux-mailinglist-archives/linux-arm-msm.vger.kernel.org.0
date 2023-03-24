Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392EB6C759A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCXCZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjCXCZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7A715546
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x17so407810lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2BpvXr+Z6dMw3AhPZYnNDNcoFi1zoA+Pe7N2yi0S64=;
        b=qM1LjGGwjTbA66bcLnkZjhNwvI7fnKuRod72WKpO/SYKqy18/h6a5Bx853rfl98oLf
         yvJMTPtwRT+J2zSG98gTUjO7Q+k8glnR/a3rSOx6SQZ4+USReWuItZH3J9t3xzNqZSpQ
         1dcvtk1RK5DRPSzJnoaadhxpc0JyXwFE6Ig7IzczDNb4vDN5zVWcoFrVInM9CaZlAA0B
         o0zY3H6Np+TgfzXfbFA16+NwDuR8HBuH1FfAbf0b7+O/0cU6wz+xgSu+EDFB3mRDVWvT
         v/L/tkOTygfupGksb7qhzugHkmRN5IM+2PIYQjKT++NZ05hr0of3lf92oJUUuXEdLpzh
         9qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2BpvXr+Z6dMw3AhPZYnNDNcoFi1zoA+Pe7N2yi0S64=;
        b=YSLpaM7Mi9NrQ9w64ujItTmGlFYFwy8udhtEdHut6szaIsgZ8pT+JBZB4bSMI5RLml
         2kGNEglSfF//oqhhsX6fTmWJnjT2Gh/k1k9fuWnG5BZf4QbRowd/NE/f1myzUjD8x7LM
         FF6QpEDb34xE7x95dMYAZhYas16x/fdvBHuWGyG8cmU3a91hmPRNQXSco/nn7+4djJfI
         XlFEQAZFexvQ6jpHy8WOfeei3TPkTuNcl5R5m6OloQgb0Z+4pIM53mgRR5hteueY9V5T
         IryjybHtNWLTa3IknJr8UbPi4eJ5mp62sMfjCealo4bTAmin2MDnsPVAk5yFUKOEy+xX
         VTJg==
X-Gm-Message-State: AAQBX9cP3VTWEhu3pNUfSAI7SjP2W7QSwY8omL3dek9QIk9QVbNfMEnl
        atDFOKjF/Ajk7y71U9CuHX7teQ==
X-Google-Smtp-Source: AKy350agS+cgFnxbfgdzsxFJcask5ehsRBlh1AYdwJNsudY5Pd7Qn6EVMYaaH7Bz3pW8qSA7VNgvkA==
X-Received: by 2002:ac2:5291:0:b0:4dd:a212:e3ca with SMTP id q17-20020ac25291000000b004dda212e3camr204343lfm.11.1679624719627;
        Thu, 23 Mar 2023 19:25:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 04/41] dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml
Date:   Fri, 24 Mar 2023 05:24:37 +0300
Message-Id: <20230324022514.1800382-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Migrate legacy bindings (described in qcom,ipq8074-qmp-pcie-phy.yaml)
to qcom,sc8280xp-qmp-pcie-phy.yaml. This removes a need to declare
the child PHY node or split resource regions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 299 ------------------
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 213 +++++++++++--
 2 files changed, 187 insertions(+), 325 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
deleted file mode 100644
index 62045dcfb20c..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ /dev/null
@@ -1,299 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/phy/qcom,ipq8074-qmp-pcie-phy.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm QMP PHY controller (PCIe, IPQ8074)
-
-maintainers:
-  - Vinod Koul <vkoul@kernel.org>
-
-description:
-  QMP PHY controller supports physical layer functionality for a number of
-  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
-
-  Note that these bindings are for SoCs up to SC8180X. For newer SoCs, see
-  qcom,sc8280xp-qmp-pcie-phy.yaml.
-
-properties:
-  compatible:
-    enum:
-      - qcom,ipq6018-qmp-pcie-phy
-      - qcom,ipq8074-qmp-gen3-pcie-phy
-      - qcom,ipq8074-qmp-pcie-phy
-      - qcom,msm8998-qmp-pcie-phy
-      - qcom,sc8180x-qmp-pcie-phy
-      - qcom,sdm845-qhp-pcie-phy
-      - qcom,sdm845-qmp-pcie-phy
-      - qcom,sdx55-qmp-pcie-phy
-      - qcom,sm8250-qmp-gen3x1-pcie-phy
-      - qcom,sm8250-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8450-qmp-gen3x1-pcie-phy
-      - qcom,sm8450-qmp-gen4x2-pcie-phy
-
-  reg:
-    items:
-      - description: serdes
-
-  "#address-cells":
-    enum: [ 1, 2 ]
-
-  "#size-cells":
-    enum: [ 1, 2 ]
-
-  ranges: true
-
-  clocks:
-    minItems: 2
-    maxItems: 4
-
-  clock-names:
-    minItems: 2
-    maxItems: 4
-
-  resets:
-    minItems: 1
-    maxItems: 2
-
-  reset-names:
-    minItems: 1
-    maxItems: 2
-
-  vdda-phy-supply: true
-
-  vdda-pll-supply: true
-
-  vddp-ref-clk-supply: true
-
-patternProperties:
-  "^phy@[0-9a-f]+$":
-    type: object
-    description: single PHY-provider child node
-    properties:
-      reg:
-        minItems: 3
-        maxItems: 6
-
-      clocks:
-        items:
-          - description: PIPE clock
-
-      clock-names:
-        deprecated: true
-        items:
-          - const: pipe0
-
-      "#clock-cells":
-        const: 0
-
-      clock-output-names:
-        maxItems: 1
-
-      "#phy-cells":
-        const: 0
-
-    required:
-      - reg
-      - clocks
-      - "#clock-cells"
-      - clock-output-names
-      - "#phy-cells"
-
-    additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - "#address-cells"
-  - "#size-cells"
-  - ranges
-  - clocks
-  - clock-names
-  - resets
-  - reset-names
-
-additionalProperties: false
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8998-qmp-pcie-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 3
-        clock-names:
-          items:
-            - const: aux
-            - const: cfg_ahb
-            - const: ref
-        resets:
-          maxItems: 2
-        reset-names:
-          items:
-            - const: phy
-            - const: common
-      required:
-        - vdda-phy-supply
-        - vdda-pll-supply
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq6018-qmp-pcie-phy
-              - qcom,ipq8074-qmp-gen3-pcie-phy
-              - qcom,ipq8074-qmp-pcie-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 2
-        clock-names:
-          items:
-            - const: aux
-            - const: cfg_ahb
-        resets:
-          maxItems: 2
-        reset-names:
-          items:
-            - const: phy
-            - const: common
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc8180x-qmp-pcie-phy
-              - qcom,sdm845-qhp-pcie-phy
-              - qcom,sdm845-qmp-pcie-phy
-              - qcom,sdx55-qmp-pcie-phy
-              - qcom,sm8250-qmp-gen3x1-pcie-phy
-              - qcom,sm8250-qmp-gen3x2-pcie-phy
-              - qcom,sm8250-qmp-modem-pcie-phy
-              - qcom,sm8450-qmp-gen3x1-pcie-phy
-              - qcom,sm8450-qmp-gen4x2-pcie-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 4
-        clock-names:
-          items:
-            - const: aux
-            - const: cfg_ahb
-            - const: ref
-            - const: refgen
-        resets:
-          maxItems: 1
-        reset-names:
-          items:
-            - const: phy
-      required:
-        - vdda-phy-supply
-        - vdda-pll-supply
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sm8250-qmp-gen3x2-pcie-phy
-              - qcom,sm8250-qmp-modem-pcie-phy
-              - qcom,sm8450-qmp-gen4x2-pcie-phy
-    then:
-      patternProperties:
-        "^phy@[0-9a-f]+$":
-          properties:
-            reg:
-              items:
-                - description: TX lane 1
-                - description: RX lane 1
-                - description: PCS
-                - description: TX lane 2
-                - description: RX lane 2
-                - description: PCS_MISC
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc8180x-qmp-pcie-phy
-              - qcom,sdm845-qmp-pcie-phy
-              - qcom,sdx55-qmp-pcie-phy
-              - qcom,sm8250-qmp-gen3x1-pcie-phy
-              - qcom,sm8450-qmp-gen3x1-pcie-phy
-    then:
-      patternProperties:
-        "^phy@[0-9a-f]+$":
-          properties:
-            reg:
-              items:
-                - description: TX
-                - description: RX
-                - description: PCS
-                - description: PCS_MISC
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq6018-qmp-pcie-phy
-              - qcom,ipq8074-qmp-pcie-phy
-              - qcom,msm8998-qmp-pcie-phy
-              - qcom,sdm845-qhp-pcie-phy
-    then:
-      patternProperties:
-        "^phy@[0-9a-f]+$":
-          properties:
-            reg:
-              items:
-                - description: TX
-                - description: RX
-                - description: PCS
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
-    phy-wrapper@1c0e000 {
-        compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
-        reg = <0x01c0e000 0x1c0>;
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges = <0x0 0x01c0e000 0x1000>;
-
-        clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
-                 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-                 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
-                 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
-        clock-names = "aux", "cfg_ahb", "ref", "refgen";
-
-        resets = <&gcc GCC_PCIE_1_PHY_BCR>;
-        reset-names = "phy";
-
-        vdda-phy-supply = <&vreg_l10c_0p88>;
-        vdda-pll-supply = <&vreg_l6b_1p2>;
-
-        phy@200 {
-            reg = <0x200 0x170>,
-                  <0x400 0x200>,
-                  <0xa00 0x1f0>,
-                  <0x600 0x170>,
-                  <0x800 0x200>,
-                  <0xe00 0xf4>;
-
-            clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
-
-            #clock-cells = <0>;
-            clock-output-names = "pcie_1_pipe_clk";
-
-            #phy-cells = <0>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index ef49efbd0a20..328588448c6b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,10 +16,23 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,ipq6018-qmp-pcie-phy
+      - qcom,ipq8074-qmp-gen3-pcie-phy
+      - qcom,ipq8074-qmp-pcie-phy
+      - qcom,msm8998-qmp-pcie-phy
+      - qcom,sc8180x-qmp-pcie-phy
       - qcom,sc8280xp-qmp-gen3x1-pcie-phy
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
       - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+      - qcom,sdm845-qhp-pcie-phy
+      - qcom,sdm845-qmp-pcie-phy
+      - qcom,sdx55-qmp-pcie-phy
+      - qcom,sm8250-qmp-gen3x1-pcie-phy
+      - qcom,sm8250-qmp-gen3x2-pcie-phy
+      - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8350-qmp-gen3x1-pcie-phy
+      - qcom,sm8450-qmp-gen3x1-pcie-phy
+      - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
 
@@ -28,18 +41,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 5
+    minItems: 3
     maxItems: 6
 
   clock-names:
-    minItems: 5
-    items:
-      - const: aux
-      - const: cfg_ahb
-      - const: ref
-      - const: rchng
-      - const: pipe
-      - const: pipediv2
+    minItems: 3
+    maxItems: 6
 
   power-domains:
     maxItems: 1
@@ -50,9 +57,7 @@ properties:
 
   reset-names:
     minItems: 1
-    items:
-      - const: phy
-      - const: phy_nocsr
+    maxItems: 2
 
   vdda-phy-supply: true
 
@@ -83,11 +88,8 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
-  - vdda-phy-supply
-  - vdda-pll-supply
   - "#clock-cells"
   - clock-output-names
   - "#phy-cells"
@@ -119,21 +121,116 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sm8350-qmp-gen3x1-pcie-phy
-              - qcom,sm8550-qmp-gen3x2-pcie-phy
-              - qcom,sm8550-qmp-gen4x2-pcie-phy
+              - qcom,msm8998-qmp-pcie-phy
     then:
       properties:
         clocks:
-          maxItems: 5
+          maxItems: 4
         clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: pipe
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: phy
+            - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq6018-qmp-pcie-phy
+              - qcom,ipq8074-qmp-gen3-pcie-phy
+              - qcom,ipq8074-qmp-pcie-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: pipe
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: phy
+            - const: common
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8180x-qmp-pcie-phy
+              - qcom,sdm845-qhp-pcie-phy
+              - qcom,sdm845-qmp-pcie-phy
+              - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8250-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-modem-pcie-phy
+              - qcom,sm8450-qmp-gen3x1-pcie-phy
+              - qcom,sm8450-qmp-gen4x2-pcie-phy
+    then:
+      properties:
+        clocks:
           maxItems: 5
-    else:
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: refgen
+            - const: pipe
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: phy
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-qmp-gen3x1-pcie-phy
+              - qcom,sm8550-qmp-gen3x2-pcie-phy
+        resets:
+          minItems: 1
+        reset-names:
+          items:
+            - const: phy
+    then:
       properties:
         clocks:
-          minItems: 6
+          maxItems: 5
         clock-names:
-          minItems: 6
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: rchng
+            - const: pipe
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: phy
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
 
   - if:
       properties:
@@ -143,16 +240,53 @@ allOf:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
     then:
       properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: rchng
+            - const: pipe
         resets:
           minItems: 2
         reset-names:
-          minItems: 2
-    else:
+          items:
+            - const: phy
+            - const: phy_nocsr
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-qmp-gen3x1-pcie-phy
+              - qcom,sc8280xp-qmp-gen3x2-pcie-phy
+              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+    then:
       properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: rchng
+            - const: pipe
+            - const: pipediv2
         resets:
-          maxItems: 1
+          minItems: 1
         reset-names:
-          maxItems: 1
+          items:
+            - const: phy
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
 
 examples:
   - |
@@ -213,3 +347,30 @@ examples:
 
       #phy-cells = <0>;
     };
+  - |
+    #define GCC_PCIE1_PHY_REFGEN_CLK   47
+    #define GCC_PCIE_PHY_AUX_CLK       71
+    #define GCC_PCIE_WIGIG_CLKREF_EN   74
+
+    phy@1c0e000 {
+        compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
+        reg = <0x01c0e000 0x1c0>;
+
+        clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+                 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+                 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
+                 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>,
+                 <&gcc GCC_PCIE_1_PIPE_CLK>;
+        clock-names = "aux", "cfg_ahb", "ref", "refgen", "pipe";
+
+        resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+        reset-names = "phy";
+
+        vdda-phy-supply = <&vreg_l10c_0p88>;
+        vdda-pll-supply = <&vreg_l6b_1p2>;
+
+        #clock-cells = <0>;
+        clock-output-names = "pcie_1_pipe_clk";
+
+        #phy-cells = <0>;
+    };
-- 
2.30.2

