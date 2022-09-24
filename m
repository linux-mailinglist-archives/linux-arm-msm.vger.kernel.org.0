Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14DEF5E8980
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiIXIGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbiIXIGB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:06:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23252124145
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z25so3552645lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2ZOAScRGs8H4Skqtdv8bR90lbkI6ciAoFEEK65l9ndU=;
        b=ZvhT9gNGcaJEZJVoBbcwYgj47LQayW17GGYraWCGkGD+AkYvYb3yrNROSbxBikCSgw
         sQWQ0S1PAcOxqAicqc3pHcPtOcbaMK+bxn/bJ5T/Cp9sH144/AqzArtfLyNmVFLXn7Kq
         flt9rd3B0cJ8/GbVdq2J/TGLmrUFi74hB7DZfgX20jvOznmbhvTAp6I8oOqAi6zEPA1J
         q/7kFwPGxlyMPl+FdHI8H0u/VCZctB2axxaSKfEMVsqQPN75wUcujayGwKZUTPplB+qS
         fzyLP6bwD+uYVR8wiz931Erxp0CrfoQ2JDQB6KKnFgO5xVVL/kWcM09qhi1+Kh1+keVO
         Hmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2ZOAScRGs8H4Skqtdv8bR90lbkI6ciAoFEEK65l9ndU=;
        b=zr1a/Ea2q9/zfSA1RQvlNrEluXqgCVy7JpJ76mo4OQa0EnGFy5K66oJJHIakCKHQDn
         2yB+Ow89kqLhL3S8U0aILPT4EM+7QebNgK/G9YylePNsqU+173Cbh0ZO/hQ62X5OG8fB
         uYvPyBIhKCNHp6EIKVCKNbWwFiTWpSW+luSv5RJ/cHxvx8y0pgwoLrB3gbL3gL8GCvg3
         zZhOP5iJ6XQObgTPMjZXHlGrCAGGN3S5PMIpaafm7EzWWg4mB5tAYuQo3B1/81ueXVt8
         RouHpYTVTg/D8RZYOhOzJ38RL3fXyJ3ctb1DJECnQcJn0evZY0kqnhtDP0bA1DyUrtAV
         W8xg==
X-Gm-Message-State: ACrzQf3yhxGMOZjQmMw0iYp5lGFFgP6DhX0UlSUsbfAdZAl+hIZhZqci
        jf9YfXHLOEsFwVxF1bglQftPXA==
X-Google-Smtp-Source: AMsMyM78F5Im26vGOFszmeaQHuEieX5lRowpZ493fB1/I2ih3jESZ+tyqDqxRBm6uGTqHjcMMDVXoQ==
X-Received: by 2002:a05:6512:3da1:b0:49f:1b3d:88b9 with SMTP id k33-20020a0565123da100b0049f1b3d88b9mr4535243lfv.67.1664006730777;
        Sat, 24 Sep 2022 01:05:30 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 18/32] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix indentation in example
Date:   Sat, 24 Sep 2022 10:04:45 +0200
Message-Id: <20220924080459.13084-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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
index e4332e628698..a49e91c6e31e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -127,35 +127,35 @@ $defs:
 
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

