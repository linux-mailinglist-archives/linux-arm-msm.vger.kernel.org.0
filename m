Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194F55E89DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbiIXIIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbiIXIHw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:07:52 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211FD154470
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id j24so2322364lja.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6+EgX4QUTZBqad+VbzdSiC8aLzAL/6GsYzQHJR1pJJ4=;
        b=h2wnBXHsAYs7WKS/KXFOg05ZsJYUONjRoyQPQnY/PDOhZEclvCv0VfY+/7fqOz8WeI
         bujzzF29RUWFcc3TvGD84JxC7bOo8BzcSF/rFaFXEMSqYqL24c8N9waA0gU/HDqMNvni
         QrvA0PNo7Wy8H7n6kpYZJBF6IpgpB+1B+r92xeyXyuQ/8EwCFpev3B3039mqFCBSbLwP
         WTGyTllTvjzmFTxEEVRHjpuiH+2fLd8T1XtQn8SdjCsI0iQ+CKMnqbH7/y0Krjpae1jU
         ob+GgmgieSPoC5IlYGZGaDS4cjLJc1y5clz59UzDHjlCOhMuzZM/WxiwbcW0XiVMfbPG
         fzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6+EgX4QUTZBqad+VbzdSiC8aLzAL/6GsYzQHJR1pJJ4=;
        b=qtrJx4WP1LiDU4bCTo1FBftj3ydHiLC21jFo9Du1SDH2+kpDMcNx78oTcaL0f3mUnw
         CQIGhT/pw5OeYHWVlx5fGD+5+vIrXoXVmbjsjiyD9yx8NuoOeDPBKWG918BcRetV9yPr
         TQ7iWm+DoJPWhYSZSuxnw4nxzbA8CvA8q99MCwwlS54Ujm7TKfUP2QN5+uamV876SJHI
         dlvDqCoBGys3viOmZIkyHEFST0UF1EGYMoPVeUEJKHsfSjFlCIdR2uHENmaw6em35j5p
         XVIgz7jXTt6HWYgmfqrjKowdPGwZTqSfRyWeIv9NqkZmK/f6cCxGFPmFvhHhaNkLjtQc
         pAUw==
X-Gm-Message-State: ACrzQf2PO9JRiIRDqPie66HmXILgx0BGROPgjV4khSRGEqRzLunka7Nd
        7H2hiPVEgBs98zJO3Ru6KpOC5g==
X-Google-Smtp-Source: AMsMyM7lmg1xzNo8qYpqlYg2XO2fMiN/E0vw+x6jpv28EdC1XKBZ2TP+nJsqLPlFmqfVQrnDx+rFPA==
X-Received: by 2002:a2e:b8ca:0:b0:26b:e846:ead9 with SMTP id s10-20020a2eb8ca000000b0026be846ead9mr4086311ljp.224.1664006744469;
        Sat, 24 Sep 2022 01:05:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:43 -0700 (PDT)
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
Subject: [PATCH 28/32] dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
Date:   Sat, 24 Sep 2022 10:04:55 +0200
Message-Id: <20220924080459.13084-29-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index 006aeec7794f..e381769e42ae 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -151,23 +151,23 @@ additionalProperties: false
 
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

