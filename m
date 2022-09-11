Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC72B5B4DDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiIKLNK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiIKLMw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:12:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A181133425
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f11so10349087lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BzxKI895lpDHkY+H8tKxOiDzUL4EnCHd/mNz95fFCeE=;
        b=y4vPVjYXVGihY9jOAnssEJR0Pr8jmuplVjE0qhtCRzZcz5n6eychsgTMYEAOtOPLet
         0cPwB7ldGNthyDD8lM/zfAvlgmvv/2IrNBBF1AEM8s0NaGXwcaIE1PTuQa013YcVa+sj
         6OuvRF6GCzAQstfai1DWgSpEUUHiGmmqBcaJcvcqWnwWSfBGUP1dVgkgn/PiZn/+let6
         hkK7L00kPj3TpP5bY8mghJjaY0qyESaMX623fogNk8EzDpj2Bqbf2lPkJHQlzM2DUidc
         k5Hf+wEIzuJ6dbDyuv1U4sq8HR0XBZejuup3fdzvd8HhbTnUCdRY34Am83bJrPVXegTe
         BB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BzxKI895lpDHkY+H8tKxOiDzUL4EnCHd/mNz95fFCeE=;
        b=fNu7Ne7M648/fH1HRXF+kLVghbqisSdwNCTitsOsdopX+pwzULGNTGxmpRLgO1KWNP
         Yrfyrbl+DQCKAIKFJFGTmtUsfRvfUecp+0XshL6Mdu72Hl3wXX4D69nKqpujvUpwvL6D
         zrthsn5YyqWZPrFVxzATlww/4OuBrsc8XKQoIdJrkDUbj9OvZpUo6mUVNKJt5T/La9bF
         tHDHq2vMa8RTswol8qxKIgcowq+4w+dRITEepgT79PvD+OkE4bafzPiUTF8KsQDduH1k
         3kcBLbwMaFwCTOihvCquZh/E4QWEB0lswqVhXJmbPVctPKpgUAajz7yEx5QtO37juTPo
         NNyw==
X-Gm-Message-State: ACgBeo3Yz/ZNtQ4j2JCHqbTarWInB93BzZr23IEdDtWbORDjAfaHN5uu
        4N/Orw/A7clhCUkYCdePOmCNjg==
X-Google-Smtp-Source: AA6agR5JjGDgdu4McNBE7qGn+b8q77xSBjub9bkSNoXAx0gj8ZE477KyuwN+Vy0iDurh8E/tsO1VQw==
X-Received: by 2002:a19:f246:0:b0:493:50d:6bb with SMTP id d6-20020a19f246000000b00493050d06bbmr6865471lfk.461.1662894739265;
        Sun, 11 Sep 2022 04:12:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/40] dt-bindings: pinctrl: qcom,sm6375-pinctrl: fix indentation in example
Date:   Sun, 11 Sep 2022 13:11:32 +0200
Message-Id: <20220911111200.199182-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6375-tlmm.yaml    | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index dbd91d6b63b3..025faf87d147 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -134,34 +134,34 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@500000 {
-                compatible = "qcom,sm6375-tlmm";
-                reg = <0x00500000 0x800000>;
-                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 157>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio18";
-                                function = "qup13_f2";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio19";
-                                function = "qup13_f2";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@500000 {
+        compatible = "qcom,sm6375-tlmm";
+        reg = <0x00500000 0x800000>;
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 157>;
+
+        gpio-wo-subnode-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio18";
+                function = "qup13_f2";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio19";
+                function = "qup13_f2";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1

