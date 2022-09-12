Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19B65B544E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiILGUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiILGTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:19:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D362AE14
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:40 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z20so9338605ljq.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=691KvJvip9wejzXr7qpWGsmceASveD6n9KP/WuDonD8=;
        b=d1DHQPk8TiATnt/m6mMQt61SUjKvZhpDvPIkhUG2xBhT2q7YegT1qS0K2WLyXviV7p
         MBPpZfjbJprK7gQU4RQU3ULzM+eRPx6UwyTgDDq35YgH/1oV3YmB3C+0f+h4LcvWS+yl
         kGCmB4XV1ADWqH//Z2TdMauEX01fJNC50nqadf+mOZL75OPAj1UrvrXM7jYPWJ6Q+xhK
         vqvQOg0iOoCRIsamcHzrXhT7qTVd1bvLT8fK7Mk5jPgqqfGvvyn76SgT3jBs7kGFBOVz
         tElvW2mJBXv0H98qeRcgkgvgKJWOwjRFFJSQxA1eRfOZoaqKJNYxoB0fTS1R/DmMzGoA
         ESpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=691KvJvip9wejzXr7qpWGsmceASveD6n9KP/WuDonD8=;
        b=5Ug+2XEac9r0LL2t8Yzo9tBv3VYB/bW5ib/6dDUFUYX54XmUBM9cxgE/lV9b5Dx8Rt
         jaGmgdzCZ+f5c1i6XC60wl1DliIVe5VJF0diric6QWLZHoXoTEF7p+dGqV+6T+oZ3gC4
         kEFWYy5jtz86piD3ns6SeYT44vkKohPdZ69+iPJCxkjcITQNqC5nT7fkGOPDDYumaPU4
         CB6lWzAbIIWNuHGdQBJsgRJ9U7SxdjgjM9A8v+QRhLGf48Cm86AaLAHl0V3tvA9tI3cD
         c1fuV5UGrGjIu75/ZzS3fhKB0gjoSC/b6bZXIqfuRuBzVACc4R6wm16AnRGzgHfA3OP9
         YTIA==
X-Gm-Message-State: ACgBeo0uAE8w0KPnkspEPuN0uKRcuEktWyyh8iz4moHgFNIuw7VNR3AR
        B/5dknlNyzpcs87UT+B2OZ75hw==
X-Google-Smtp-Source: AA6agR74Ig3J9SSX0nqCYqvR7QrLh5RKvXE1wOuQ5kJ/yx4ASKopm0Acvfok/VWCHRj9SPWW23EXhw==
X-Received: by 2002:a2e:9cf:0:b0:26b:e127:df1 with SMTP id 198-20020a2e09cf000000b0026be1270df1mr4921166ljj.325.1662963520191;
        Sun, 11 Sep 2022 23:18:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 33/40] dt-bindings: pinctrl: qcom,sc8280xp-pinctrl: fix indentation in example
Date:   Mon, 12 Sep 2022 08:17:39 +0200
Message-Id: <20220912061746.6311-34-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,sc8280xp-pinctrl.yaml        | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 8610f2701388..b9ab130cd558 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -127,34 +127,34 @@ patternProperties:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@f100000 {
-                compatible = "qcom,sc8280xp-tlmm";
-                reg = <0x0f100000 0x300000>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 230>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio4";
-                                function = "qup14";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio5";
-                                function = "qup14";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@f100000 {
+        compatible = "qcom,sc8280xp-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 230>;
+
+        gpio-wo-subnode-state {
+                pins = "gpio1";
+                function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio4";
+                function = "qup14";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio5";
+                function = "qup14";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1

