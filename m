Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84AF45ECB31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiI0RkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiI0RjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:39:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D9D1E458C
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bu25so14897210lfb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3YnWEuMUPvAuCowPmcYb0nhKTEJ0n3SzHEzCPy2SNUM=;
        b=j/ARjmq/LYpbQnK4OtkLEsFECJhDbD+kWanOUOeGHxR60JvfhrJJftFhL3EQ/XRPgc
         Y63AyGWRsqCV++GLUVQ4Jz0Wd13WSixNByH8mHFE4dQNGw52dcxMuatnuJdULGRMEWt7
         rSfXNz77AO+SluvmmdO2BJVjYZZ66QZQF/083/JU29SnABSzITtMnb3ufyZ7rgJCuEkn
         nHxmdg5I1z3p8ajjTTKkL1y2Oyj/cA7Zzcpn5VTUd6xxJtnvPvG1twmrwnS+JbVh3tdS
         bhKBGHLq6j+hZGL4zkm/VuaeEai8dVDFPgwjMWa4bVUnoxDhDxbC1UtbbdNWf1q+SgTr
         +Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3YnWEuMUPvAuCowPmcYb0nhKTEJ0n3SzHEzCPy2SNUM=;
        b=pEkkcS8O+0EEIrRinUrb05uD6vUDVc/BU3EX8/XrTMa6YMCGlxo7MehXOCWLOABw/d
         WP++5+mRyShG+0rJKdsDCOcs8+Lybo3XoS8LI2hTJ9b9Hl1Lg0Wa8ko5idzlvxHxTRM2
         1o5AT2zSG3vRjdd6qOo+RmcrBdiTyp8gvKP72MoGxvcTwW5Y2BTH3qxTFeEP7PFbq1nh
         6h+ExUWpshfLPHPp1EnLjNKuN4H/Zo9Jl2C5ohRoUbm4MOPYlSrifVO7p2kJLQygOqh8
         CgbrjY5L1OM5YTieQk1GmaFy96wFURBaYoP80SrlaHOMHqjmKaV9TwqpU+cGbXZ0nqB7
         yRyw==
X-Gm-Message-State: ACrzQf3NdP71Jya6OuCW1AN5l9JKRG3iGJXf5tHS2iH+HELUTxE74/wG
        hD8WJtd1N731QSijmZVcKUca2A==
X-Google-Smtp-Source: AMsMyM74SfcxFyAYkTALHgnhAOCUH5Tlq2QeczDacfoODPxp6erWyQgb76ixtli7UhnLttW5SKgEUg==
X-Received: by 2002:a05:6512:2987:b0:496:ae22:9147 with SMTP id du7-20020a056512298700b00496ae229147mr11237203lfb.97.1664300314203;
        Tue, 27 Sep 2022 10:38:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 17/34] dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
Date:   Tue, 27 Sep 2022 19:36:45 +0200
Message-Id: <20220927173702.5200-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index 9c2dbc1e31fe..ecee354715f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -119,22 +119,22 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        msmgpio: pinctrl@fd510000 {
-                compatible = "qcom,msm8226-pinctrl";
-                reg = <0xfd510000 0x4000>;
-
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&msmgpio 0 0 117>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-
-                serial-state {
-                        pins = "gpio8", "gpio9";
-                        function = "blsp_uart3";
-                        drive-strength = <8>;
-                        bias-disable;
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    msmgpio: pinctrl@fd510000 {
+        compatible = "qcom,msm8226-pinctrl";
+        reg = <0xfd510000 0x4000>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&msmgpio 0 0 117>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        serial-state {
+            pins = "gpio8", "gpio9";
+            function = "blsp_uart3";
+            drive-strength = <8>;
+            bias-disable;
         };
+    };
-- 
2.34.1

