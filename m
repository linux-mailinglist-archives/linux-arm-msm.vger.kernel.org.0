Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9940A6C7595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjCXCZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjCXCZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:21 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CF7212BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so427868lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cnrr5zqCv5eNRyEtsp8XvgTJ6tJmLPZH0nSjHdTUy1Y=;
        b=mKkmOmLtP/iVDNz/DbOzOhthSDyej+LqmmyEu7kEQs66gmloGhjSYT0JK7aK1LuF4O
         gxm67X2wkm1jRMr/S/SzNU4UmJ4viqVQW+MG0mFy1HQyPDkzvB9Zjz65Eq429YDe2TPs
         5YjrfcpKGdZJPUABoq/GtnQWv8Eizfam5fw+2HoyNNGNzpzy0ghwQ2cuQHSxBGGqGQ+Q
         R7v4UcjoCHCaTS/B7t5dB5EWWioOl7HDLtLUSfJMRUU4FypCk61vqbmfn/CVHJ+OeifD
         VNl8KO2n5isTPDFlHNJr7p93KWUidtAtRxZpFyhkGrK0zzGC3hKrB+HSz0dBYckpsrDN
         d3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cnrr5zqCv5eNRyEtsp8XvgTJ6tJmLPZH0nSjHdTUy1Y=;
        b=GlBZWZDZokm/TgeWADRcqUSHKYdIQfZWJ3EQuC4lIWLyekm/cz2TSdaK9+TsKimRLI
         ax611Zfh9YDNE7mi+ob42epv7H0yFqmJJrdeBlkhQgivjvr4V016u+CA17XuwTJR8vzz
         DKUjfnhd7TnIDjW1BWKCbR2AyrcxEiowXWpeLY2DkRcYM/hGgnXPwrP8As7xio4UvaK1
         4tr47fQBXXcYgNy1uZGfBbiYMNaOEQOLJlPyyTQMoaF2+z7g5QIzHx/W8d9rdpGnSNs0
         QRJxxYTXzq5uKz61yGjsdmV0q9ZkCwKNtnEEwDj1gO9deLmoSmjYatN2ulqjYAsjLznw
         kfjw==
X-Gm-Message-State: AAQBX9e/8Rjnh0gbYIQnajGNUe5BufQDuhyPYcE3RJ6zTIGF3SIQXFkC
        36niGovlqd76/69OEpaRbvX1FQ==
X-Google-Smtp-Source: AKy350a3vCIQUCLZGlM8jQ+MTzUrPRsGUrT4bawtjGU3iiMFqbR0vl44txWVcMSKmLuA2KuUhriidA==
X-Received: by 2002:ac2:510c:0:b0:4e7:4a3c:695 with SMTP id q12-20020ac2510c000000b004e74a3c0695mr174279lfb.65.1679624717599;
        Thu, 23 Mar 2023 19:25:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 02/41] dt-bindings: phy: migrate combo QMP PHY bindings to qcom,sc8280xp-qmp-usb43dp-phy.yaml
Date:   Fri, 24 Mar 2023 05:24:35 +0300
Message-Id: <20230324022514.1800382-3-dmitry.baryshkov@linaro.org>
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

Migrate legacy bindings (described in qcom,sc7180-qmp-usb3-dp-phy.yaml)
to qcom,sc8280xp-qmp-usb43dp-phy.yaml. This removes a need to declare
the child PHY node or split resource regions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 276 ------------------
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 124 +++++++-
 2 files changed, 111 insertions(+), 289 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
deleted file mode 100644
index 0ef2c9b9d466..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ /dev/null
@@ -1,276 +0,0 @@
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
index 3cd5fc3e8fab..484f321aefce 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,25 +15,32 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc8280xp-qmp-usb43dp-phy
-      - qcom,sm6350-qmp-usb3-dp-phy
-      - qcom,sm8350-qmp-usb3-dp-phy
-      - qcom,sm8450-qmp-usb3-dp-phy
-      - qcom,sm8550-qmp-usb3-dp-phy
+    oneOf:
+      - enum:
+          - qcom,sc7180-qmp-usb3-dp-phy
+          - qcom,sc8180x-qmp-usb3-dp-phy
+          - qcom,sc8280xp-qmp-usb43dp-phy
+          - qcom,sdm845-qmp-usb3-dp-phy
+          - qcom,sm6350-qmp-usb3-dp-phy
+          - qcom,sm8250-qmp-usb3-dp-phy
+          - qcom,sm8350-qmp-usb3-dp-phy
+          - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8550-qmp-usb3-dp-phy
+      - items:
+          - enum:
+              - qcom,sc7280-qmp-usb3-dp-phy
+          - const: qcom,sm8250-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 3
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: aux
-      - const: ref
-      - const: com_aux
-      - const: usb3_pipe
+    minItems: 3
+    maxItems: 5
 
   power-domains:
     maxItems: 1
@@ -50,6 +57,8 @@ properties:
 
   vdda-pll-supply: true
 
+  vddp-ref-clk-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -65,7 +74,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
   - vdda-phy-supply
@@ -73,6 +81,71 @@ required:
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
+          items:
+            - description: Phy aux clock
+            - description: Phy config clock
+            - description: 19.2 MHz ref clk
+            - description: Phy common block aux clock
+            - description: USB3 PIPE clock
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc8180x-qmp-usb3-dp-phy
+            - qcom,sc8280xp-qmp-usb3-dp-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Phy aux clock
+            - description: 19.2 MHz ref clk
+            - description: Phy common block aux clock
+            - description: USB3 PIPE clock
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8250-qmp-usb3-dp-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Phy aux clock
+            - description: Board XO source
+            - description: Phy common block aux clock
+            - description: USB3 PIPE clock
+        clock-names:
+          items:
+            - const: aux
+            - const: ref_clk_src
+            - const: com_aux
+            - const: usb3_pipe
+
 additionalProperties: false
 
 examples:
@@ -101,3 +174,28 @@ examples:
       #clock-cells = <1>;
       #phy-cells = <1>;
     };
+  - |
+    #define GCC_USB3_PRIM_CLKREF_CLK     151
+    #define GCC_USB_PHY_CFG_AHB2PHY_CLK  161
+
+    phy@88e8000 {
+        compatible = "qcom,sdm845-qmp-usb3-dp-phy";
+        reg = <0x088e8000 0x3000>;
+
+        clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+                 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+                 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+        clock-names = "aux", "cfg_ahb", "ref", "com_aux", "usb3_pipe";
+
+        resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+                 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+        reset-names = "phy", "common";
+
+        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
+        vdda-pll-supply = <&vdda_usb2_ss_core>;
+
+        #clock-cells = <1>;
+        #phy-cells = <1>;
+    };
-- 
2.30.2

