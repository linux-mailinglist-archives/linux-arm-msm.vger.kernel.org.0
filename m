Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6345B4DEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiIKLNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiIKLNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:13:07 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8564F356CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q21so10450569lfo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jLZlsEJ5VG4J2SIrJhH+JChzqh+Qp8BnGJ+3NtUQBWY=;
        b=lPPmou8Plr4qIHzjUl0pjjVP5lMFawqBGTCSR8459+GKtTM/YTDxjQxD1eLfWzAbD8
         wT5YVscwIM35mO9RyS5jCtGzVP2+tvt4qOI5MLLmHMsLwBpDA6X/3SvSw+A5H5+D0Zqx
         ms2FX30RtLvGOxyZNagyKpCanr9UOeCDibOBTpn3LYEJtNxJIv6U2g4miHba+NrEZuOz
         p3Wpf9d081jRUZ1NLzS49iehhkZxgnGfp12XEvAlJrc67rkUk5ci7wjP/sgQmeerD/SL
         DJQG1cLOMIQ2zPgUWOhyCRlHYcW8RW6IkIreRTPAunUBho24utDWsLsj2F5B5kF8ABFw
         uM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jLZlsEJ5VG4J2SIrJhH+JChzqh+Qp8BnGJ+3NtUQBWY=;
        b=jdXFQ0DVOu/fKUXRohzdwKeZqSC1lPB4DcavXghHo2/bJO8VdOsjZpJOps7EcZoqQI
         yfwQKgdT6FrL06ckzrDOOlfTnRvqBo8Yh9er8/Fd4i25KOv/Fg3xboljRGWwoxTlbkDQ
         SiZZkb6rP0mL8F+VLcL47UPzYYFVGeEcQiEVFitvWS5j20sEd0dalQlVYeYebCKQLzwJ
         MrvBpqE+soC4h3ddHiICp4d67+Fv8b029k3lwPKR2BS9SW62nzn+Qm7SJzusM/WThrwc
         kCGEDNkDq0pL2+yhLdjtpJN0OHq5Z6TAsf5GBuhctoemFrHd3fk7Kd3oYs7tCEYMfwcg
         ZAsA==
X-Gm-Message-State: ACgBeo38vdycWanX6YndJrQRKOPLXZ1y3OdscP99s5cPQP3ldCNaVoMC
        M8DyIZDjdGpTxJP+q6l1IsTM0g==
X-Google-Smtp-Source: AA6agR72YO+XkKAOFG8EAWqhfJS9DgsgeqJVD0/dznf5HUHe32DG3AI0WIFn4S2T657w/aH1MH8O0Q==
X-Received: by 2002:a05:6512:3fa7:b0:497:369b:47db with SMTP id x39-20020a0565123fa700b00497369b47dbmr6947362lfa.657.1662894749731;
        Sun, 11 Sep 2022 04:12:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:29 -0700 (PDT)
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
Subject: [PATCH 20/40] dt-bindings: pinctrl: qcom,sm8450-pinctrl: fix indentation in example
Date:   Sun, 11 Sep 2022 13:11:40 +0200
Message-Id: <20220911111200.199182-21-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm8450-pinctrl.yaml | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index d1d1c1455b3c..87347e9c5f1c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -111,34 +111,34 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@f100000 {
-                compatible = "qcom,sm8450-tlmm";
-                reg = <0x0f100000 0x300000>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 211>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                    rx-pins {
-                            pins = "gpio26";
-                            function = "qup7";
-                            bias-pull-up;
-                    };
-
-                    tx-pins {
-                            pins = "gpio27";
-                            function = "qup7";
-                            bias-disable;
-                    };
-               };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@f100000 {
+        compatible = "qcom,sm8450-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 211>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-state {
+            rx-pins {
+                pins = "gpio26";
+                function = "qup7";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio27";
+                function = "qup7";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1

