Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B6E5B4E0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiIKLO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbiIKLNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:13:32 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8921C3CBE3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s10so6772717ljp.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qxAFFeV9Jghea1krVGY5BQK+UR1GkKeREC8WB6H5B2c=;
        b=vjDiFJjLjvVI78IsYrKcOiG51LrE9dKnNKMIGWEpkis5uGIWdl4xLXgYFt1lZVWh3G
         ehSGvB4AUACWBv+SnQ1vIvsHIRoJWndg9K9qu0EWroN7X08gd4uBqsIkfNLIPAcBFbDx
         wm7sZVt0Kzbr3mM7FQ0vzvBf9qu/y5JNF0vPOJtjM/k9UGY4RBqx5FZtB1mILwacSDEG
         CErzrlLMVABD2WtJYl0AbAOc6vvxFOqlUcrqk4EasADkyrXzW7q/o4BYQo3q1S0cTO86
         q7NLV3osWIx1v4TFZK7HsN4tIXeL3gn0EdJtZhl8IOlelgXeVloyjLgJx5D0CZ4ypibr
         neJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qxAFFeV9Jghea1krVGY5BQK+UR1GkKeREC8WB6H5B2c=;
        b=iADRlKJ9W4Mp5hQYAnjaJTKSrr0tOgBJPxswHjh1R6DeW6dUvSYOWQ6SnslwWK/tVG
         RU7FkrnC5BoILQhEI7r1LPqJLrmptgrewri26K2dDd1NjaP29Ugjrkf5a1W4iKja/pUM
         7hmGsohOR8RHu6EXG8qRX7uoWQz16VTUCc3CDoDIQNKHy+jobYAz2POXvGh3r+cC9Ge/
         jDtRT1kVCe/ltaV/dKD8Xt80nCeLpo47SEbpvQ8YanYCsT7MLG9Dg3hyGEFaoDi8/i5g
         LPtLr1M//dHBp9FyzRHoNN1OuZnUVjDQP1kUe03zDiteQ0/gFDJLOIbHmXRZmgKjg/Dg
         EO+A==
X-Gm-Message-State: ACgBeo0G3mVHIYKipQefcLPBMLoJ+sPKUcDy6xG1eHhh4Y1eO6blXRbe
        ke7qLf5mq2z6jvq04ro1GAxv6w==
X-Google-Smtp-Source: AA6agR446cy+OdRmEkwDeI+yVptxip8u3RlG0YbI8CjPb6fQZmEJOF+4at5PXvMi1L8IqnkPHn7Efg==
X-Received: by 2002:a2e:2d09:0:b0:25a:816a:2e62 with SMTP id t9-20020a2e2d09000000b0025a816a2e62mr6039682ljt.147.1662894743551;
        Sun, 11 Sep 2022 04:12:23 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:23 -0700 (PDT)
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
Subject: [PATCH 15/40] dt-bindings: pinctrl: qcom,sm8250-pinctrl: fix indentation in example
Date:   Sun, 11 Sep 2022 13:11:35 +0200
Message-Id: <20220911111200.199182-16-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index bccc83f22aae..c44d02d28bc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -141,18 +141,18 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@1f00000 {
-                compatible = "qcom,sm8250-pinctrl";
-                reg = <0x0f100000 0x300000>,
-                      <0x0f500000 0x300000>,
-                      <0x0f900000 0x300000>;
-                reg-names = "west", "south", "north";
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 180>;
-                wakeup-parent = <&pdc>;
-        };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@1f00000 {
+            compatible = "qcom,sm8250-pinctrl";
+            reg = <0x0f100000 0x300000>,
+                  <0x0f500000 0x300000>,
+                  <0x0f900000 0x300000>;
+            reg-names = "west", "south", "north";
+            interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-ranges = <&tlmm 0 0 180>;
+            wakeup-parent = <&pdc>;
+    };
-- 
2.34.1

