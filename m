Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2474B7693DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjGaK6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjGaK6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:35 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD061735
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:03 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f954d7309fso5403291e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801082; x=1691405882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wULRwpAxU3U7giaQfcAakpif5xyYnV0aX4xD6FbXu+4=;
        b=Yq4DmWPvbUoxP6gXv2c9bb23Ok/scjrMnK0wlUQw5HSsOVuEozvq/47KuuYP9ymBn2
         ZCDW8tybhRytDhzpbdW7FU+ISs34WHtO6ZP2sVsOAZR16nsoWRton78ocZsQhMXJakVV
         00AQcKuSRpY752xU4L58z0bxJ8LGTzqAYA2lux/g42gC+AHFN/ZRIHyOXCQGYcVbCdUZ
         TdH9q2+hhNwj31qYAbq8ZymXGgooeZYQIvDcHZBh8GjhPHEGP2S1B9ITQ8eE0xMDS+Ig
         N+AZltOx35sfldt3ropmmV2J6923YHA0Sc0rjnizAYPxEOYFJengZDT4ZMk5hyI4F3eE
         w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801082; x=1691405882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wULRwpAxU3U7giaQfcAakpif5xyYnV0aX4xD6FbXu+4=;
        b=AyinanGqh8AO5WYMQcm4dxuVcPz98okpkWr88cOxbbYJO8RiIGwO2Lo5+k6CzxaYTi
         CFbwYPfDOguECxVIfR08/aM6hJKPqC5tXkh59ajxxjIG+9I0PQenqh8dYgu1wAx+i+Ze
         RlnqnncrHwEOd3+WY5rREYpDFR8s+ZccYHOQz3ECAWXZvWh+M9F+38RIO52+/d4z42pl
         fq+QnCDq6ZKNo9ktNiNG0eV3nxOA4d5IfHieHFD98NCcmPj4wFkFuEykRhawLPIDSFQC
         +4mlw918OjCer70H+N4Y4U1sHIyLUUtt0YmR6PmRvgNURiB+d+6Hn286EYpinKNWDsww
         qSXA==
X-Gm-Message-State: ABy/qLZSqu7ynJdNxC4h4nN0fxYMhtCGf25oNziMoBvN8uoG6sYYduO4
        KXzm1n6h9qHleu6Avq4Lyo1gSw==
X-Google-Smtp-Source: APBJJlENzXUf2/jahJ8muGuIEqlRMrLwYb2rc9i5rUDAA4jugvP2M1QvBj1/1nr3WM6/XDQopxz+nA==
X-Received: by 2002:a05:6512:b97:b0:4fe:32cd:481f with SMTP id b23-20020a0565120b9700b004fe32cd481fmr1328540lfv.1.1690801081687;
        Mon, 31 Jul 2023 03:58:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:01 -0700 (PDT)
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
Subject: [PATCH v2 01/13] dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml
Date:   Mon, 31 Jul 2023 13:57:47 +0300
Message-Id: <20230731105759.3997549-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  34 ++-
 3 files changed, 163 insertions(+), 246 deletions(-)
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
index ca55ed9d74ac..a2c894a33c1c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,11 +18,21 @@ properties:
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
+      - qcom,sm8150-qmp-gen3x1-pcie-phy
+      - qcom,sm8250-qmp-gen3x1-pcie-phy
+      - qcom,sm8250-qmp-gen3x2-pcie-phy
+      - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8350-qmp-gen3x1-pcie-phy
+      - qcom,sm8450-qmp-gen3x1-pcie-phy
+      - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
 
@@ -40,7 +50,7 @@ properties:
       - const: aux
       - const: cfg_ahb
       - const: ref
-      - const: rchng
+      - enum: [rchng, refgen]
       - const: pipe
       - const: pipediv2
       - const: phy_aux
@@ -87,7 +97,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
   - vdda-phy-supply
@@ -123,7 +132,17 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc8180x-qmp-pcie-phy
+              - qcom,sdm845-qhp-pcie-phy
+              - qcom,sdm845-qmp-pcie-phy
+              - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8150-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-modem-pcie-phy
               - qcom,sm8350-qmp-gen3x1-pcie-phy
+              - qcom,sm8450-qmp-gen3x1-pcie-phy
+              - qcom,sm8450-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
     then:
@@ -132,7 +151,16 @@ allOf:
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

