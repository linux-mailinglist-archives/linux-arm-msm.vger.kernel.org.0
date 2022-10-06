Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586205F6696
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbiJFMs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiJFMri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:38 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E008CA2ABA
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g1so2502721lfu.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SWt0cwlt4h3RDA4Xwfr5w6shZrJ4pZT5oO0t9NHGdv8=;
        b=IROM6J4oF7r92X+QYETJFcSEKyLSQl6z7PDYlr2S83emYneZdkuslBj95aLkDkBafE
         lYsz83BiOC0zZsuv+GnmnFkv8lMsrdM89uGUfDedpOGGYa1/FiUhfWv8KzHJAgzWzOOd
         49KiFPwR2YSnyvNWSasdjiTebFfCLImrGu2OfGQTOTFHG+i9QEy/aNZP3+y9fFYSJKQ1
         CPrbvMSs+tf5YcxS1yMeZTQdIsFNf7eQyrwhmRL8GYpyrpnVvl2RoXNawQeu++mNTk+G
         QjaxFTqWrfCNZ2m9mT9ef3yL9spG/pKIc8Or1G6+rIx2+dIZLibRR0jQNmGEa9VDdB0n
         sgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SWt0cwlt4h3RDA4Xwfr5w6shZrJ4pZT5oO0t9NHGdv8=;
        b=RoDNRiGvDdgww+6aP4XADDoksVVFLyiTV4aiSJszeCzqovJQnm8G+TCVU+lYqDnONC
         IbA/Szyd+o10OjPTWgbYQGg2Q/OFM7MT+lM45UdfIYPtuxNR6Wb2W+RoTcTU40G73HzZ
         wGvFcf3W1L7DLbIFAC0vZh5u2KGGaV8qUTmHUUbzxXPv5CWKOUtLKn/XsyomDDmJ80AO
         ZyLmFikb5lQS3+4tjpQCJUUCSp2GhjJAZOYZ+/r6HF7J+10YEm06mbUhPKvM64wL03cO
         7uuY+umrDWVLzmTOWUanYqQiihJgQ9uMIzc2a1p6cSz+N93fl9qqmT3fLd2ghc8yd26N
         2mDw==
X-Gm-Message-State: ACrzQf3WWfVDUsOJai7WbHqsJni6kFy5kh4ZkwAMqCA/aNzhrdcjntGK
        EZ4qHQOETWvddDaSSEXBewuRWg==
X-Google-Smtp-Source: AMsMyM7+nzvafoeOVAJ4qIkuiwY+S3kTl/rgc3YkgUmF367RoN1NinapHfLIZuWiO8Av4EvpyRjRsg==
X-Received: by 2002:a05:6512:208a:b0:4a2:6cc7:cee5 with SMTP id t10-20020a056512208a00b004a26cc7cee5mr1823837lfr.153.1665060441225;
        Thu, 06 Oct 2022 05:47:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:20 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 17/34] dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
Date:   Thu,  6 Oct 2022 14:46:42 +0200
Message-Id: <20221006124659.217540-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index c6f15c8da999..23868cdf4e03 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -99,22 +99,22 @@ additionalProperties: false
 
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

