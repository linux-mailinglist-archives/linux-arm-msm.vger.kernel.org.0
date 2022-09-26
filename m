Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8395E9B15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbiIZHsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbiIZHr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:47:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF18937184
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:20 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so9475395lfo.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XXCcp5droa0HphHOkokyNKo7w1sCva1zL4UfLVgXhqg=;
        b=XXXxFvStDGy7K+7P6j9zfsxasjvKfQv+3bUxU3visUwhhGZytFbqevDvTsBfp9XkST
         PUWyXFYr5eYL8w/d5R54a9vHrD2RFaC9U9suTIFGmuArvIzpyJZskbuPzQILxs93lw7E
         LBy15csSSDw0L5liXDjPNXUTC5woVH2XyvVlCqfs7vDaQKKT0+439uBKi7WQAbfYvykK
         jM9es8tkYfo+h+m736CuNg/ilgGHEziHUoXq0EQe4sgAShwAcVW38F6FwEeUYvLFBDWp
         peLSC+otJ3eYFN9lKq/r+SByaneFgNeRAoAoCVpYG9csBiCHrEVQgnIvGKMUrv+QtGJe
         fwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XXCcp5droa0HphHOkokyNKo7w1sCva1zL4UfLVgXhqg=;
        b=BdQtR6xhmJhLEb4LGZLgG4axw1aS4K0s5nvcAdD0EVZD4z3+J6cwQe7JmvRMrZgVi0
         nimcwdKcmhQJB4uAPnYwpwDbT8+Sc2kAoHuWQBzysgu8kGtnU4Tlz5i8ntFtQ7nqI2yS
         AMjGjajJ7Ism1Noeq9Y5zppqRs4EEHWwmFNhTtWN6rqgMK+D9IuvfHVq6AmR0sgH1YI5
         QDomx9Z2i1jqf0ObTYbHCxECBys43RM3UPa54csNFKGphWh3zdUaXQiV8Cq3f5jM0m1r
         8a4KwuZFWozsepqEAwFJbtFNqG7OCkc7mjp20wB7VF/rkZMMKCzNnvPhhPM5mMrv7gwC
         Iweg==
X-Gm-Message-State: ACrzQf1POf4fHpU8F5ZwBKD6gEbT6gXLmP6RC2xRMq0atFxqSiX5kP4L
        +cy7mzeuw/9HKgdOqJnJ+wtrEg==
X-Google-Smtp-Source: AMsMyM7/zbPrg0k86ZHnZczxCq9yEnMHzziy1sGne185wK6F9N4fHYCYXXkGiu3X4TFRnrjIeK1s0A==
X-Received: by 2002:a05:6512:3ba:b0:497:a116:3f86 with SMTP id v26-20020a05651203ba00b00497a1163f86mr7904751lfp.142.1664178306842;
        Mon, 26 Sep 2022 00:45:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:06 -0700 (PDT)
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
Subject: [PATCH v2 22/33] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Mon, 26 Sep 2022 09:44:04 +0200
Message-Id: <20220926074415.53100-23-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index c4ab54c9d5e8..48676393352e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -159,21 +159,21 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-              compatible = "qcom,msm8953-pinctrl";
-              reg = <0x01000000 0x300000>;
-              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-              interrupt-controller;
-              #interrupt-cells = <2>;
-              gpio-controller;
-              #gpio-cells = <2>;
-              gpio-ranges = <&tlmm 0 0 142>;
-
-              serial_default: serial-state {
-                    pins = "gpio4", "gpio5";
-                    function = "blsp_uart2";
-                    drive-strength = <2>;
-                    bias-disable;
-              };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,msm8953-pinctrl";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 142>;
+
+        serial_default: serial-state {
+            pins = "gpio4", "gpio5";
+            function = "blsp_uart2";
+            drive-strength = <2>;
+            bias-disable;
         };
+    };
-- 
2.34.1

