Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 387B16C91E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 01:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjCZA5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 20:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjCZA5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 20:57:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7602CBB8B
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g17so6941826lfv.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679792255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBv1pWYR15qOvcAYz4zjAq269yr5hF0uWbugrVtKVm4=;
        b=W8dx0WC1Q/36S20wdXE+4B6TTxsmkeoPegGYirlmc6ePSehHhGHnnKbzNOMGbXP9i2
         +cqCRSkoYkuSMSyzwB60t8cb0DaA1nOK+VFk0oAVGepOn7CBDkLSCJsqwlUG3K0gAl//
         P9XlHjygOPf63/B29U63IuvRBW1tuZeYJwpjMjGbynLK3fZ2qCoVn13qqF1i83TKcLhN
         D780oc9QaRM68QVe5gzrZEm0dZM7avcuXVE90Y6W9WmaCmJkvKPd8Y/B24iVZ/dzPol5
         m3kM26idxlpR4SIIiyN+WySHzUetDwHrJXi0n9FvdZDXFBaSwpfttwLqaUv9W6Co0R/m
         qPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679792255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBv1pWYR15qOvcAYz4zjAq269yr5hF0uWbugrVtKVm4=;
        b=5KiBuG/oLYP+oCcRfgLThyXJJziaypmpULaSN2YSb3TDNxGGCtiXCVA7g1iclIccr1
         ojyL9Mt3L0uRngYadhOpwiXz9kfxVKqpBgl268nR5Z5xNi9PKDfklgqz1lGH0AwBIisy
         0CAWq6FlnOhQ4WsI6VslQIzAzfKCYVqC0nMmy143ddfipYrG4v6exBOH0VrNGP4LYy0e
         d+CMLb24vHGKAqVTqgKNRh4cKNiT9/ZmF2FJQFzJoqOYWOPdhHdj82fv08pfuBy+gVCO
         dG86XKhCBALlyxjEhyUX8gz+J0itu/nDuhdcr6tylz6qdR0aOkeI+2S12NZf8dGYt988
         SbLQ==
X-Gm-Message-State: AAQBX9erQqibm8o/9895y7fhzh77OedeLZK4qNinmUJO6DjplRFkgY7v
        58F9VGx21S7H2+ut/xVFRNYVMw==
X-Google-Smtp-Source: AKy350YIEUYfsbuGCudfcH+H2jClJUfhXY9E08yBAaiu7I2GiCFALFkWuzbz4dSuD5xuSxAISz9DHg==
X-Received: by 2002:ac2:5239:0:b0:4dd:afad:8afe with SMTP id i25-20020ac25239000000b004ddafad8afemr1973845lfl.27.1679792254798;
        Sat, 25 Mar 2023 17:57:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020ac242cd000000b004e7fa99f3f4sm3996858lfl.265.2023.03.25.17.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:57:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: phy: migrate combo QMP PHY bindings to qcom,sc8280xp-qmp-usb43dp-phy.yaml
Date:   Sun, 26 Mar 2023 03:57:25 +0300
Message-Id: <20230326005733.2166354-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
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

Migrate legacy bindings (described in qcom,sc7180-qmp-usb3-dp-phy.yaml)
to qcom,sc8280xp-qmp-usb43dp-phy.yaml. This removes a need to declare
the child PHY node or split resource regions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 278 ------------------
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  45 ++-
 2 files changed, 43 insertions(+), 280 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
deleted file mode 100644
index a2ddf718ba76..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ /dev/null
@@ -1,278 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm QMP USB3 DP PHY controller (SC7180)
-
-description:
-  The QMP PHY controller supports physical layer functionality for a number of
-  controllers on Qualcomm chipsets, such as, PCIe, UFS and USB.
-
-  Note that these bindings are for SoCs up to SC8180X. For newer SoCs, see
-  qcom,sc8280xp-qmp-usb43dp-phy.yaml.
-
-maintainers:
-  - Wesley Cheng <quic_wcheng@quicinc.com>
-
-properties:
-  compatible:
-    oneOf:
-      - enum:
-          - qcom,sc7180-qmp-usb3-dp-phy
-          - qcom,sc8180x-qmp-usb3-dp-phy
-          - qcom,sdm845-qmp-usb3-dp-phy
-          - qcom,sm8150-qmp-usb3-dp-phy
-          - qcom,sm8250-qmp-usb3-dp-phy
-      - items:
-          - enum:
-              - qcom,sc7280-qmp-usb3-dp-phy
-          - const: qcom,sm8250-qmp-usb3-dp-phy
-
-  reg:
-    items:
-      - description: Address and length of PHY's USB serdes block.
-      - description: Address and length of the DP_COM control block.
-      - description: Address and length of PHY's DP serdes block.
-
-  reg-names:
-    items:
-      - const: usb
-      - const: dp_com
-      - const: dp
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
-    minItems: 3
-    maxItems: 4
-
-  clock-names:
-    minItems: 3
-    maxItems: 4
-
-  power-domains:
-    maxItems: 1
-
-  resets:
-    items:
-      - description: reset of phy block.
-      - description: phy common block reset.
-
-  reset-names:
-    items:
-      - const: phy
-      - const: common
-
-  vdda-phy-supply:
-    description:
-      Phandle to a regulator supply to PHY core block.
-
-  vdda-pll-supply:
-    description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
-
-  vddp-ref-clk-supply:
-    description:
-      Phandle to a regulator supply to any specific refclk pll block.
-
-# Required nodes:
-patternProperties:
-  "^usb3-phy@[0-9a-f]+$":
-    type: object
-    additionalProperties: false
-    description:
-      The USB3 PHY.
-
-    properties:
-      reg:
-        items:
-          - description: Address and length of TX.
-          - description: Address and length of RX.
-          - description: Address and length of PCS.
-          - description: Address and length of TX2.
-          - description: Address and length of RX2.
-          - description: Address and length of pcs_misc.
-
-      clocks:
-        items:
-          - description: pipe clock
-
-      clock-names:
-        deprecated: true
-        items:
-          - const: pipe0
-
-      clock-output-names:
-        items:
-          - const: usb3_phy_pipe_clk_src
-
-      '#clock-cells':
-        const: 0
-
-      '#phy-cells':
-        const: 0
-
-    required:
-      - reg
-      - clocks
-      - '#clock-cells'
-      - '#phy-cells'
-
-  "^dp-phy@[0-9a-f]+$":
-    type: object
-    additionalProperties: false
-    description:
-      The DP PHY.
-
-    properties:
-      reg:
-        items:
-          - description: Address and length of TX.
-          - description: Address and length of RX.
-          - description: Address and length of PCS.
-          - description: Address and length of TX2.
-          - description: Address and length of RX2.
-
-      '#clock-cells':
-        const: 1
-
-      '#phy-cells':
-        const: 0
-
-    required:
-      - reg
-      - '#clock-cells'
-      - '#phy-cells'
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
-  - vdda-phy-supply
-  - vdda-pll-supply
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sc7180-qmp-usb3-dp-phy
-            - qcom,sdm845-qmp-usb3-dp-phy
-    then:
-      properties:
-        clocks:
-          items:
-            - description: Phy aux clock
-            - description: Phy config clock
-            - description: 19.2 MHz ref clk
-            - description: Phy common block aux clock
-        clock-names:
-          items:
-            - const: aux
-            - const: cfg_ahb
-            - const: ref
-            - const: com_aux
-
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sc8180x-qmp-usb3-dp-phy
-            - qcom,sm8150-qmp-usb3-dp-phy
-    then:
-      properties:
-        clocks:
-          items:
-            - description: Phy aux clock
-            - description: 19.2 MHz ref clk
-            - description: Phy common block aux clock
-        clock-names:
-          items:
-            - const: aux
-            - const: ref
-            - const: com_aux
-
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm8250-qmp-usb3-dp-phy
-    then:
-      properties:
-        clocks:
-          items:
-            - description: Phy aux clock
-            - description: Board XO source
-            - description: Phy common block aux clock
-        clock-names:
-          items:
-            - const: aux
-            - const: ref_clk_src
-            - const: com_aux
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-    usb_1_qmpphy: phy-wrapper@88e9000 {
-        compatible = "qcom,sdm845-qmp-usb3-dp-phy";
-        reg = <0x088e9000 0x18c>,
-              <0x088e8000 0x10>,
-              <0x088ea000 0x40>;
-        reg-names = "usb", "dp_com", "dp";
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges = <0x0 0x088e9000 0x2000>;
-
-        clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-                 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
-                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
-        clock-names = "aux", "cfg_ahb", "ref", "com_aux";
-
-        resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
-                 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
-        reset-names = "phy", "common";
-
-        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
-        vdda-pll-supply = <&vdda_usb2_ss_core>;
-
-        usb3-phy@200 {
-            reg = <0x200 0x128>,
-                  <0x400 0x200>,
-                  <0xc00 0x218>,
-                  <0x600 0x128>,
-                  <0x800 0x200>,
-                  <0xa00 0x100>;
-            #clock-cells = <0>;
-            #phy-cells = <0>;
-            clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-            clock-output-names = "usb3_phy_pipe_clk_src";
-        };
-
-        dp-phy@88ea200 {
-            reg = <0xa200 0x200>,
-                  <0xa400 0x200>,
-                  <0xaa00 0x200>,
-                  <0xa600 0x200>,
-                  <0xa800 0x200>;
-            #clock-cells = <1>;
-            #phy-cells = <0>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3cd5fc3e8fab..93444e96b512 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,8 +16,14 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sc7180-qmp-usb3-dp-phy
+      - qcom,sc7280-qmp-usb3-dp-phy
+      - qcom,sc8180x-qmp-usb3-dp-phy
       - qcom,sc8280xp-qmp-usb43dp-phy
+      - qcom,sdm845-qmp-usb3-dp-phy
       - qcom,sm6350-qmp-usb3-dp-phy
+      - qcom,sm8150-qmp-usb3-dp-phy
+      - qcom,sm8250-qmp-usb3-dp-phy
       - qcom,sm8350-qmp-usb3-dp-phy
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
@@ -26,14 +32,17 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 5
 
   clock-names:
+    minItems: 4
     items:
       - const: aux
       - const: ref
       - const: com_aux
       - const: usb3_pipe
+      - const: cfg_ahb
 
   power-domains:
     maxItems: 1
@@ -65,7 +74,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
   - vdda-phy-supply
@@ -73,6 +81,39 @@ required:
   - "#clock-cells"
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7180-qmp-usb3-dp-phy
+            - qcom,sdm845-qmp-usb3-dp-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc8280xp-qmp-usb43dp-phy
+            - qcom,sm6350-qmp-usb3-dp-phy
+            - qcom,sm8550-qmp-usb3-dp-phy
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.30.2

