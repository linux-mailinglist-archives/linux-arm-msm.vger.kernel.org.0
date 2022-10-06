Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166835F66AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiJFMtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbiJFMs2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:48:28 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5003A3455
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m14so2117460ljg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QyQLWhYmEjIHed8I1eYLXMg3PX1D3rWKc5PGKJ6Y4nA=;
        b=fxnDytM0v4Vs5H9JB3rHPatwUu+uN30DZZCtXmv6kA9C1AAPww5fdBCvC+/tL4GA50
         T85VcnXou8YyMMJwtkRUmfElinhukklwL6Q64wCvp5fPBkSkxmKQe/v409Akrtupa3Vx
         rcFB0BiVoGxY0MT6kiE6ual87bLavhvZ/vtHewDbjJHbI5wxYBzxmXsP0Lk1N3Ys4924
         nudgW2WlecmEBvsSuLtdzZxUCA7Ctl5lp3i27i+QrxnRWohOnKYMOd2fPeomMfC7FIaT
         8NUHgV8qzSmR0ExtM8BXBo991roN0mPO8h/XC+pmE8WsxPNRUbPXfiFY7hC9v21ytN/1
         Qrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QyQLWhYmEjIHed8I1eYLXMg3PX1D3rWKc5PGKJ6Y4nA=;
        b=53lgxGTFuBxfxramH20pRHszTPIV72xfcH3xv60k1ezPi7oGIiWX8BB2pox505hJsi
         SOyxYq0uGEWIUNjl4b4oHbkoGNk1fXN0tf4vrw8r7vxuK4Gnfwii8lUvnaHm46XwFfAN
         ZTbz/Mh47C4gF5xtlpZWay/M2iNk4fasKVe4GDE7bLy9KKxNjzxj33nsgli6lB0U2BqO
         RpNK1y1RzFWAks3DzvXWISI3F055JItu1X5awUplVygisQmx2hWq3GBfepCMc2aN+zAH
         Z4F698Bcnmqx/9shS/W9eASd+Tw0B4dqcCNMfcFOvi4NrHxIw3atqtTwOirSBxM7lJCN
         1Zhw==
X-Gm-Message-State: ACrzQf03v3pCU1/1pPyjrlJ9Q9gWZ+iVyw2E7fT3agc0q/5pNuKMEkhN
        yQ6odoilWNNkEr2nS5ZOYS/kHA==
X-Google-Smtp-Source: AMsMyM5Q/VnoZ2RhSQo+uit3uW8wqX9Vw/g70cvZauknvCNM7WVEhoSliDyMicrE1mvFAlb1g06ctQ==
X-Received: by 2002:a2e:bf1f:0:b0:26d:8d0f:4f9a with SMTP id c31-20020a2ebf1f000000b0026d8d0f4f9amr1779387ljr.473.1665060456908;
        Thu, 06 Oct 2022 05:47:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:36 -0700 (PDT)
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
Subject: [PATCH v4 30/34] dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
Date:   Thu,  6 Oct 2022 14:46:55 +0200
Message-Id: <20221006124659.217540-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index e02590daf7bd..2d7097edfb40 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -122,23 +122,23 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1f00000 {
-                compatible = "qcom,sdx55-pinctrl";
-                reg = <0x0f100000 0x300000>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 108>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
-
-                serial-state {
-                        pins = "gpio8", "gpio9";
-                        function = "blsp_uart3";
-                        drive-strength = <8>;
-                        bias-disable;
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1f00000 {
+        compatible = "qcom,sdx55-pinctrl";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 108>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+
+        serial-state {
+            pins = "gpio8", "gpio9";
+            function = "blsp_uart3";
+            drive-strength = <8>;
+            bias-disable;
         };
+    };
 
 ...
-- 
2.34.1

