Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3AA75E9B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbiIZHr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbiIZHrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:47:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DFB36877
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w8so9451016lft.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=H5NELxqjbYOo95DLAW5sr17iK87/ChScxq1oIjsMtQY=;
        b=hBw+UsCQ/XT9/6Nuzz/NLlHUhLkH8LBurfdYv8xpqVF2f8h3FbPoQhUAqqoJj4B1+V
         e76bnfPhgV+r7vJONZOCLiFhEnluNuIteT0hecngcJ0TiL+53x95DoVL/J8hvi4FEvzt
         vwcvU9XzSkTrok3vOjjrKhnqbBVBZ/zyW9gr0y56ul+ZbY1OBjIdh+nilp564+0kM4Cr
         BXv7+jq19htEV+N866V1cn2lrQ7o50aqLnBAVzwLr9qWg3YRqvWvzYAhk72b3IlPd1Sp
         2G/xqRboKVZrwmhIA60CQjDvgtdJ4mlYDzgzebcRZ68aJOVE6b4ydgDpm4sEyXs8UNG1
         qKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=H5NELxqjbYOo95DLAW5sr17iK87/ChScxq1oIjsMtQY=;
        b=6BML0DTQTjVVQuSwVFmITXXE7dx25RggbzkE/6qevhmVqe5bj8+7EsXYKlSfmhr/MA
         5t5Gc9DX140i5P5WQYHrmqkGfFiHcINCqVHnc0ZPcIWkqUiQAQbWdRXP3G6/F95W6p3T
         7RRLwXY/Lk6wxbsQkG4RJuHf4G1QCJbN6vvIfmxST5/qxTxpaaWE1vdZwyUN5AsMcJ1f
         8gp5lnNJo6SAxhgRqGUG92Cu9Ko13wLIkjQT8NnqCdR6tUK3UgkGmwyM3hWhk2ZXFL6A
         KCf69Lh5blQl9GkyYKQRdNlaxqWMy16e4A9DnrjP2vXkgC8Em/ojYGh7jQ2/jibsuDBj
         QvwA==
X-Gm-Message-State: ACrzQf3o9fDm75z52odn56BpqTuB8gKZG4TmjqR1gyZ5LLaZTe9m5hLO
        RN8rQcvpAVhTogGjvWncU5nDFg==
X-Google-Smtp-Source: AMsMyM7uJRGVts6c0tEaVPRErfpJzpc4XcWAYVIQUcY+tdfJMkIW1Js4z+vx3QKDfExyOwtpQN/4Ng==
X-Received: by 2002:a05:6512:3da1:b0:49f:1b3d:88b9 with SMTP id k33-20020a0565123da100b0049f1b3d88b9mr7848542lfv.67.1664178299393;
        Mon, 26 Sep 2022 00:44:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:58 -0700 (PDT)
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
Subject: [PATCH v2 19/33] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix indentation in example
Date:   Mon, 26 Sep 2022 09:44:01 +0200
Message-Id: <20220926074415.53100-20-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index 08e2dd5cbebe..9c647e24fa9a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -118,35 +118,35 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-        pinctrl@1000000 {
-                compatible = "qcom,msm8909-tlmm";
-                reg = <0x1000000 0x300000>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 117>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio4";
-                                function = "blsp_uart1";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio5";
-                                function = "blsp_uart1";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl@1000000 {
+        compatible = "qcom,msm8909-tlmm";
+        reg = <0x1000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 117>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-wo-subnode-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio4";
+                function = "blsp_uart1";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio5";
+                function = "blsp_uart1";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1

