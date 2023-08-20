Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A5F781E1C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjHTOZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjHTOZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:20 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6212D4A
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:39 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so40395901fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541238; x=1693146038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+ZcuDGBYzU7OP/R0qO1xpCr9jruPT3u5h7KEGUoF+4=;
        b=mYfmRQVAhBqk7C6wsXALH7wTQjSnoDRyDMhvQllLA1qckaX5De7aR4k/9IoBp7e2EB
         XwieDvp7qPVyCSR38Run6qN0yPwadRKZzbocdldmLodoza8BLoVwIjmxmoaahUD5tHCw
         tEB7EikLOWbDc9c4+k8P+W3DMTfpE2pXcR6PMPH9Hw+DwYmTMnERe/RS5VzophXaUEID
         lJnT43kTy/0Ly0P55m6QYvjJbj11hRSquRJNIZiCrMleG+Ev6E/AI8DaxoliFa43Gls8
         y2YNBIbSQCBEqxJr+Z+KAvqS1UsayUoam759kAYBZL9PG2P2uzrrYCXax15lX10MW0lF
         E4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541238; x=1693146038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+ZcuDGBYzU7OP/R0qO1xpCr9jruPT3u5h7KEGUoF+4=;
        b=GMucVrsesPH3mhsNzapCSh10t7c2HdLs+APxXVXPy8u66XRU++jJPvdKhq5NQ+zXXk
         qwGIkyOo6odA3q/f3HN47MiiZUC0hW2PiyLclW3aO21wNhcGnFXass4/RReNgiR1ybdl
         EKxc4mHuFLNa4ImBRRhP5EZ0u5J6ufjqZjWS87u3wzR1ftPi8SGMVkJDLEFqEBz5Yi/E
         j9R5ev28qlnznFw0wHC5VgorVy/DmqX6WZtuxZnRmwrFdUvPXOS687xL1I9wLcTHoUMN
         GDN0ugrn7jBp3UPYCAxOrdmGR2fi+s9JhS/92ZTl+jkNO5dZ5yoKmM185W1wlBJaFjd3
         B6sw==
X-Gm-Message-State: AOJu0YyELjodVazpFtl5tOyKt0r//3B3X4fR4SrPeYrSleoxHRlWK1X1
        RI0bJNWxyvdQ5lvNAk+oVQcjx23iwa4m0H25PpQ=
X-Google-Smtp-Source: AGHT+IGMpE9KkmlcwhlQMI1C7AiOnXKQflfR0GS54YZdmADMDLeW1Bxy2cXMVZ80F0M08aqe8AkA8g==
X-Received: by 2002:a2e:6a05:0:b0:2b9:cf47:ce69 with SMTP id f5-20020a2e6a05000000b002b9cf47ce69mr2900203ljc.48.1692541238028;
        Sun, 20 Aug 2023 07:20:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 01/18] dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml
Date:   Sun, 20 Aug 2023 17:20:18 +0300
Message-Id: <20230820142035.89903-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 278 +++---------------
 .../phy/qcom,msm8998-qmp-pcie-phy.yaml        |  97 ++++++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  32 +-
 3 files changed, 161 insertions(+), 246 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index 3d42ee3901a1..5073007267ad 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -13,287 +13,79 @@ description:
   QMP PHY controller supports physical layer functionality for a number of
   controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
 
-  Note that these bindings are for SoCs up to SC8180X. For newer SoCs, see
-  qcom,sc8280xp-qmp-pcie-phy.yaml.
-
 properties:
   compatible:
     enum:
       - qcom,ipq6018-qmp-pcie-phy
       - qcom,ipq8074-qmp-gen3-pcie-phy
       - qcom,ipq8074-qmp-pcie-phy
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
 
   reg:
     items:
       - description: serdes
 
-  "#address-cells":
-    enum: [ 1, 2 ]
-
-  "#size-cells":
-    enum: [ 1, 2 ]
-
-  ranges: true
-
   clocks:
-    minItems: 2
-    maxItems: 4
+    maxItems: 3
 
   clock-names:
-    minItems: 2
-    maxItems: 4
+    items:
+      - const: aux
+      - const: cfg_ahb
+      - const: pipe
 
   resets:
-    minItems: 1
     maxItems: 2
 
   reset-names:
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
+    items:
+      - const: phy
+      - const: common
 
-      "#phy-cells":
-        const: 0
+  "#clock-cells":
+    const: 0
 
-    required:
-      - reg
-      - clocks
-      - "#clock-cells"
-      - clock-output-names
-      - "#phy-cells"
+  clock-output-names:
+    maxItems: 1
 
-    additionalProperties: false
+  "#phy-cells":
+    const: 0
 
 required:
   - compatible
   - reg
-  - "#address-cells"
-  - "#size-cells"
-  - ranges
   - clocks
   - clock-names
   - resets
   - reset-names
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
 
 additionalProperties: false
 
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
-              - qcom,sc8180x-qmp-pcie-phy
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
 examples:
   - |
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
+    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
+    #include <dt-bindings/reset/qcom,gcc-ipq6018.h>
 
-        vdda-phy-supply = <&vreg_l10c_0p88>;
-        vdda-pll-supply = <&vreg_l6b_1p2>;
+    phy@84000 {
+        compatible = "qcom,ipq6018-qmp-pcie-phy";
+        reg = <0x0 0x00084000 0x0 0x1000>;
 
-        phy@200 {
-            reg = <0x200 0x170>,
-                  <0x400 0x200>,
-                  <0xa00 0x1f0>,
-                  <0x600 0x170>,
-                  <0x800 0x200>,
-                  <0xe00 0xf4>;
+        clocks = <&gcc GCC_PCIE0_AUX_CLK>,
+                 <&gcc GCC_PCIE0_AHB_CLK>,
+                 <&gcc GCC_PCIE0_PIPE_CLK>;
+        clock-names = "aux",
+                      "cfg_ahb",
+                      "pipe";
 
-            clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
+        clock-output-names = "gcc_pcie0_pipe_clk_src";
+        #clock-cells = <0>;
 
-            #clock-cells = <0>;
-            clock-output-names = "pcie_1_pipe_clk";
+        #phy-cells = <0>;
 
-            #phy-cells = <0>;
-        };
+        resets = <&gcc GCC_PCIE0_PHY_BCR>,
+                 <&gcc GCC_PCIE0PHY_PHY_BCR>;
+        reset-names = "phy",
+                      "common";
     };
diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml
new file mode 100644
index 000000000000..d05eef0e1ccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,msm8998-qmp-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PHY controller (PCIe, MSM8998)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP PHY controller supports physical layer functionality for a number of
+  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
+
+properties:
+  compatible:
+    const: qcom,msm8998-qmp-pcie-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg_ahb
+      - const: ref
+      - const: pipe
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy
+      - const: common
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+
+    phy@1c18000 {
+        compatible = "qcom,msm8998-qmp-pcie-phy";
+        reg = <0x01c06000 0x1000>;
+
+        clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+                 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+                 <&gcc GCC_PCIE_CLKREF_CLK>,
+                 <&gcc GCC_PCIE_0_PIPE_CLK>;
+        clock-names = "aux",
+                      "cfg_ahb",
+                      "ref",
+                      "pipe";
+
+        clock-output-names = "pcie_0_pipe_clk_src";
+        #clock-cells = <0>;
+
+        #phy-cells = <0>;
+
+        resets = <&gcc GCC_PCIE_0_PHY_BCR>, <&gcc GCC_PCIE_PHY_BCR>;
+        reset-names = "phy", "common";
+
+        vdda-phy-supply = <&vreg_l1a_0p875>;
+        vdda-pll-supply = <&vreg_l2a_1p2>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index ca55ed9d74ac..82e30e75a2ee 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,11 +18,20 @@ properties:
     enum:
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x4-pcie-phy
+      - qcom,sc8180x-qmp-pcie-phy
       - qcom,sc8280xp-qmp-gen3x1-pcie-phy
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
       - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+      - qcom,sdm845-qhp-pcie-phy
+      - qcom,sdm845-qmp-pcie-phy
+      - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx65-qmp-gen4x2-pcie-phy
+      - qcom,sm8250-qmp-gen3x1-pcie-phy
+      - qcom,sm8250-qmp-gen3x2-pcie-phy
+      - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8350-qmp-gen3x1-pcie-phy
+      - qcom,sm8450-qmp-gen3x1-pcie-phy
+      - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
 
@@ -40,7 +49,7 @@ properties:
       - const: aux
       - const: cfg_ahb
       - const: ref
-      - const: rchng
+      - enum: [rchng, refgen]
       - const: pipe
       - const: pipediv2
       - const: phy_aux
@@ -87,7 +96,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
   - vdda-phy-supply
@@ -123,7 +131,16 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc8180x-qmp-pcie-phy
+              - qcom,sdm845-qhp-pcie-phy
+              - qcom,sdm845-qmp-pcie-phy
+              - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8250-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-modem-pcie-phy
               - qcom,sm8350-qmp-gen3x1-pcie-phy
+              - qcom,sm8450-qmp-gen3x1-pcie-phy
+              - qcom,sm8450-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
     then:
@@ -132,7 +149,16 @@ allOf:
           maxItems: 5
         clock-names:
           maxItems: 5
-    else:
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
         clocks:
           minItems: 6
-- 
2.39.2

