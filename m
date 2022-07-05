Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5EE256691B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiGEL1j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiGEL1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:27:39 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF38316584
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:27:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c15so14170501ljr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+D+YTDarzK7BrEYLxeiU5uQ8xZ8B5qdXL7zv9BsOTY=;
        b=LOfuMXhYFNPV/ywD9MsSd553vHxEJl2PBELwo5mB5LhCschnWAI2ezvCvitQ8bkGzx
         5vsWaK0RQBo8lnGITxt24nyx/05yn63MmSKzXwC+/eowWFFi5I2iez7EEfzZmUqBYuIa
         eQXapcmC/Aqo/NOihcdeTVfXC5Z5CH/FNCm4fKHRARLVPkP6tFSo8jUKAuMeGs0fxoDt
         frNbMJqOaHb3aDBdFyKEc34XzYGvm3TRA+tcWR9HPeN6VNIA5+vClV2IROTuO1baRlTA
         Zl2N2AIYPlonBaJhroWIdFTpsLN+HkjAdf0TgCQELMOeWvge8iQZ/yWSaNjwqUuBoR3e
         q1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+D+YTDarzK7BrEYLxeiU5uQ8xZ8B5qdXL7zv9BsOTY=;
        b=iK/fstX2uFQgfBhYr/3YVnoKkSL8QRohPaZLsUAUi45XH6dPiaKZl4suWvVMhIiYQv
         RWTAwwu96OUs5GJxHz+WB/4UOzwK6SY6pauVSh6Oq9xOft+BP0tpupcHvHV3aqD4g72U
         kfoCPQH5+HTE0drQ1v2oV6PPd7NQIoxIjeWnJ8rj1J2v8geKq1L2vyyy/yf3d+bX3QQI
         xvTq1LXw30GwWfez+WS8nDVGMbS65Y1KT1pdMZheiJ2SHIZf8jGX4mZ6NiKSDRdkpGpr
         IarXi5wxEgbsl9sH9c5uHiguhdqi8qQ69tPoSU7hs8o2obYmLiox8RkZK4TPG0VGAlET
         YfMQ==
X-Gm-Message-State: AJIora87f1coHu0Pg2G7Ew6ikqgiEvIgigehaj0XRKAyoj2HkhGxaFC3
        ghBESy89P7foIHysTb5RY62Q9A==
X-Google-Smtp-Source: AGRyM1vu8Vw2EJjVeBT8F0+v7efZg+czGWWIjooMsxgutHakiWFeo89UUTf9Su3s3ADYG6PyMZf6dA==
X-Received: by 2002:a05:651c:19ac:b0:25b:db26:55c3 with SMTP id bx44-20020a05651c19ac00b0025bdb2655c3mr20204329ljb.457.1657020456187;
        Tue, 05 Jul 2022 04:27:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm5525449ljn.9.2022.07.05.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:27:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
Date:   Tue,  5 Jul 2022 14:27:33 +0300
Message-Id: <20220705112734.1323355-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
References: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than defining (incorrect) global clocks and clock-names lists,
define them per platform using conditionals. Also, while we are at it,
mark these properties as required for all platforms for which DT files
contained clocks/clock-names for the MMCC nodes from the beginning (in
addition to existing MSM8998 this adds MSM8994, SDM630 and SDM660).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 149 ++++++++++++++----
 1 file changed, 117 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 32e87014bb55..6b831730a914 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -31,30 +31,12 @@ properties:
       - qcom,mmcc-sdm660
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Board sleep source
-      - description: Global PLL 0 clock
-      - description: DSI phy instance 0 dsi clock
-      - description: DSI phy instance 0 byte clock
-      - description: DSI phy instance 1 dsi clock
-      - description: DSI phy instance 1 byte clock
-      - description: HDMI phy PLL clock
-      - description: DisplayPort phy PLL vco clock
-      - description: DisplayPort phy PLL link clock
+    minItems: 9
+    maxItems: 10
 
   clock-names:
-    items:
-      - const: xo
-      - const: sleep
-      - const: gpll0
-      - const: dsi0dsi
-      - const: dsi0byte
-      - const: dsi1dsi
-      - const: dsi1byte
-      - const: hdmipll
-      - const: dpvco
-      - const: dplink
+    minItems: 9
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -85,16 +67,119 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: qcom,mmcc-msm8998
-
-then:
-  required:
-    - clocks
-    - clock-names
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-msm8994
+              - qcom,mmcc-msm8998
+              - qcom,mmcc-sdm630
+              - qcom,mmcc-sdm660
+    then:
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8994
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: MMSS NoC AHB clock
+            - description: GFX3D clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: mmssnoc_ahb
+            - const: oxili_gfx3d_clk_src
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8998
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: DisplayPort phy PLL link clock
+            - description: DisplayPort phy PLL vco clock
+            - description: Test clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: dsi0dsi
+            - const: dsi0byte
+            - const: dsi1dsi
+            - const: dsi1byte
+            - const: hdmipll
+            - const: dplink
+            - const: dpvco
+            - const: core_bi_pll_test_se
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-sdm630
+              - qcom,mmcc-sdm660
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board sleep source
+            - description: Global PLL 0 clock
+            - description: Global PLL 0 DIV clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: DisplayPort phy PLL link clock
+            - description: DisplayPort phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: sleep_clk
+            - const: gpll0
+            - const: gpll0_div
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: dp_link_2x_clk_divsel_five
+            - const: dp_vco_divided_clk_src_mux
 
 examples:
   # Example for MMCC for MSM8960:
-- 
2.35.1

