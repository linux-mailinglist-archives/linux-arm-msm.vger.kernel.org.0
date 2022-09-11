Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7175B4E15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiIKLOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiIKLNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:13:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D674C3D5B9
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f11so10349328lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZQ3YhRzsCIvzwIGS4j9FwdZrsy4eOBBU0P2zsVYlRwE=;
        b=W4/6KU6ZUrKCN0WQFUgo0TlWmpJJrB8H0uKo0z0DL9g3XTEqN0y6Oq8xoX5k5APwHn
         FvfyoBzf6psGe+Ds5jGa/XKt1eQjLa70Yqtn0MSbgHtB/wYTWO1jcqXYGz56MD1x6O3b
         I8RdXwIhgS6/c6FE/7/OomwuwyKVNMC7dsUr0rRQJc0EeXgCk7mQdQqWUIsQIjDKIsLM
         h4WPPNTdSpYTaSLTM0qWe8MihDuI7bU/SzDcGXeeOnnp1q7JVcpLVB/17Vk6wKp95SWE
         30gsUcz7++OIWmAM7KWlB0Zsj5i3OYmCiIU0IpGqhhMk43cS58bpbaXjHseTDHwJGSKF
         r+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZQ3YhRzsCIvzwIGS4j9FwdZrsy4eOBBU0P2zsVYlRwE=;
        b=l9qq3HeInSIfbG7iiG6xv//H9RK32UPqspeDnyLAudo8ox9Sjq5EhS8jlVqTeU0Pcv
         cTCiboJ0rlGwVjTBB/WouxRA3ij0leEHqIzOZ9zr7SFw/xQbQR0XaVVblgC8LkZ1nctb
         WrOoopICWQ+rVzIoTE/NJf1eQzsHJfiD5Hp0FEM+KxAtBe5bt/ID/8tPVcB2c3yYoifV
         O1cWMDv1IYEKqQ7Y0DshzthsQswHK8/+wIE+oFc2VWDPnX9ejWG4rURzfUfhtAMrbi64
         UMnEPuLEAg7tQBcILi7GufIyHtcsKIBclj9yliA0XydZa+mtwHU1TSZnZnHuV+b4gQn+
         OT9A==
X-Gm-Message-State: ACgBeo3D5WPPHFWpAlfiRAGojfd/9kfdTzoRhOzV0TPumaV+6ugUgxih
        CXjvcZGm3vN3Cd0yzLlRkP3vmg==
X-Google-Smtp-Source: AA6agR6ZNdnhdZ/hIUFuUULBqH5iiPIwd/niiKFSI3FzwD2uGfxJYsj0ont6BmsaHYsqFFxPuoH/cA==
X-Received: by 2002:a05:6512:2381:b0:492:afa4:6b67 with SMTP id c1-20020a056512238100b00492afa46b67mr6806512lfv.621.1662894746041;
        Sun, 11 Sep 2022 04:12:26 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:25 -0700 (PDT)
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
Subject: [PATCH 17/40] dt-bindings: pinctrl: qcom,sm8350-pinctrl: fix indentation in example
Date:   Sun, 11 Sep 2022 13:11:37 +0200
Message-Id: <20220911111200.199182-18-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 211cca11f94f..f3106d25adcf 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -114,34 +114,34 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@f100000 {
-                compatible = "qcom,sm8350-tlmm";
-                reg = <0x0f100000 0x300000>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 203>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio18";
-                                function = "qup3";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio19";
-                                function = "qup3";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@f100000 {
+        compatible = "qcom,sm8350-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 203>;
+
+        gpio-wo-subnode-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio18";
+                function = "qup3";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio19";
+                function = "qup3";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1

