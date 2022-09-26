Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173D35E9B17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbiIZHs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbiIZHrd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:47:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77391371A2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:22 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d42so9583579lfv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vDgJO50k3XmGqltKXWLNMwhH7fSgxWnFKEXL4lxXp+o=;
        b=RTAkI98CFND0ynmiNKmhmKuco8yO84JAAMt9Mzgp+iuk11CGxA4FA+eSXlYmJR1TeV
         pW5fZMJlEl/GBJPygPwkJfp8JfritGltx8cpcKDGKO3nu8zHdAPSi929cUxZU4rgFbtX
         id0C3BLMsoPJdTgNeSN4ScdlWdOwmTKHBJBE4RM+teBy7KVD+7LQ31FoLuipynRm7Bh/
         Jb3kvYAW3Pu7q28Wa32MOWnjabLbpFtv/I+IS77O8mtW9nZJEQOHFocExDe/YS5hV8x5
         SxYVGnwYz5LkUjO+HPxXHkH9qFQIgfUarOQ2xw6h7xCoTn/cklVcGUtx9S4lN+6AW0M/
         rOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vDgJO50k3XmGqltKXWLNMwhH7fSgxWnFKEXL4lxXp+o=;
        b=35+Oi/QAKQtkNhsKAj8t9/y0aQWXAAW9okMW2ie1QzqkXAlg8DC/npvHoBio/zdRni
         nIm8h9AfMRBh4KXbC7q/u0s/vbrf37e2ur+TBoNfNsk2X6PHlDMyFMOeXxMafB8qKEhW
         j2SyO5NFUUfctGjI6lL4+0bItxCwDT790HcpjP86oq5m6H30abVo39UJbYe8xJUu899q
         6vTxxxP1x2q99G9/AvwraTCq2sTNosSLEi7cAQonYWHE4bjgAtQ7CQeDEX5UxSR9ckSD
         VroXZi4DorG2pqTHDFTHgpi/yGldx1+xq9QjpThiV17OoZgjVh9gGCDWmzYIOKwItDe1
         5f8Q==
X-Gm-Message-State: ACrzQf2xFx3dfbx88nbIPmSE0VpTBYS5Wmq3T20MYW6SLSHS0CpBbDL4
        xMWLWubYiz/PmO1pzHIy7ivSIg==
X-Google-Smtp-Source: AMsMyM5OuySD/A/fPVqJnE48IEa4ArMlpXX56AIfatdnVRrLn4mON0XcF4dYu+EYk+9MY0WJ6/3O1g==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id p36-20020a05651213a400b00477a28a2280mr7826318lfa.689.1664178321378;
        Mon, 26 Sep 2022 00:45:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:20 -0700 (PDT)
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
Subject: [PATCH v2 29/33] dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
Date:   Mon, 26 Sep 2022 09:44:11 +0200
Message-Id: <20220926074415.53100-30-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index 52b7a557f452..b861feab73dd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -142,23 +142,23 @@ additionalProperties: false
 
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

