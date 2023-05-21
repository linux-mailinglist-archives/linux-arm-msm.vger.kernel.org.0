Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF68670B027
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjEUUX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjEUUX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:23:27 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD695E1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:23:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af29b37bd7so25621911fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684700603; x=1687292603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpxIO3LEnA2dKJM9TAmE7Pv5F0RgxMrFnaQ9csvV+pE=;
        b=NSuwOnXQQnYC01xhR8jV6s4CMNkGvDDAOlud3xG5WCYRJF4mgDEqYZNDRBuKKHR5s2
         PpTDhfmQBw2b/B5fvLsUgXOeGSuoDX/BDwPcEFvULS4roVjm3Xp5g/3BuSaP1sjHGwiL
         D+B8nU+h8spf22qFFDhIvjVxZfB5Hr/ODddNHdNPrZj4wVwk3cEN/iuuRhC1MuItXbVh
         FvGMINSoZpPIkQb7T3hLDV+Y63/Aj0I9b17DaZfWCUWg4qFEA5BbEzf/k7+/yCZpRxre
         IiLWzzs/y4CFmazj8PpqWzx5amI/THtBoGHiwbRJHmJk3RPxQwxQN7dOP1FghA+hBQz8
         t+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684700603; x=1687292603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpxIO3LEnA2dKJM9TAmE7Pv5F0RgxMrFnaQ9csvV+pE=;
        b=Hs8FfPclNMCuhL/CBo0bTDaIpWDBUxzLu7mpAShT88GvTFio8Gj5EUGyhAn6T1MtjH
         go2ZCfmbCErKvslRub8G8iQXsL/sJqdUgUHvZ5RkYlIgQ7HS70uGOKwrV8zUrnqQSmS+
         P47bWkwy1PlGmF7v0tNE6LoV4covdTBdV0eGvhxkGD0pM55wCQMfO5QP29OgDxWo4JOg
         JP5fzWPntEKqyPovBaNiOazaXT99c85t5/+JBbiBIrEJBQAesLljwnInZghIELRA/quF
         5O/Yl0ul+66WUMCulwbtZYZr+vSsQAit21qI/6HurbgmuajEhR8nMvDIcJVwnMmSq5px
         QLtg==
X-Gm-Message-State: AC+VfDxSmian2Z8iQeGQfoVyq+G+xU3FOvx4Pqys0OMjP9jJr7EwVvNm
        Q5BT/iCBPIf9rUnkJ5pWXlnpcw==
X-Google-Smtp-Source: ACHHUZ5oFnPnJjB94H7AzZxcL1V7Mgff/2zS1JGjLvB2WGLKXxn2YjXXhb4zRazKXFpx55KZlGaELg==
X-Received: by 2002:a05:651c:1027:b0:2af:2786:2712 with SMTP id w7-20020a05651c102700b002af27862712mr3112211ljm.25.1684700603102;
        Sun, 21 May 2023 13:23:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e91d7000000b002adb566dc10sm835589ljg.129.2023.05.21.13.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:23:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/10] dt-bindings: phy: migrate combo QMP PHY bindings to qcom,sc8280xp-qmp-usb43dp-phy.yaml
Date:   Sun, 21 May 2023 23:23:12 +0300
Message-Id: <20230521202321.19778-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
References: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
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

Migrate legacy bindings (described in qcom,sc7180-qmp-usb3-dp-phy.yaml)
to qcom,sc8280xp-qmp-usb43dp-phy.yaml. This removes a need to declare
the child PHY node or split resource regions.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 278 ------------------
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  46 ++-
 2 files changed, 44 insertions(+), 280 deletions(-)
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
index ef1c02d8ac88..9af203dc8793 100644
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
@@ -85,7 +94,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
   - vdda-phy-supply
@@ -93,6 +101,40 @@ required:
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
+
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
2.39.2

