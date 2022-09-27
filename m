Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD9C5ECB22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbiI0RjO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbiI0Rij (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:38:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6E81D66F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a8so16749679lff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WqjZLYmMlQ3mNOcPU7Wva2dXZF2BgJT6gPAgFenRy9o=;
        b=Xn9G24D2MpyjgtbWFb2vEPYKG5YP/zB3jeC6RgLG2HHwEH2gpcTUp4GC//b0kaewLB
         jBEvpNXab+b5Dz+yWEpQ+b7B96KnJohA4ltxDSel6iWN2JN4TmpKBB/+XCwX8G0MYUOK
         U2+UsBKSADnVM7DfartgKdjqin4LV1Vf5OHmQnjZHQ8WIz6MW7mu0yvtsJFdI+iH/8jX
         KjScpi+3oCT0tCYPrNSIGyRr/cTPCq4oxUMHUmlNDjYYz9ZNHYw/Nelv97L605IahDzH
         OW5EID7ZmdQPoUs+yb4HQnuwqty7l3Fzk4N8EWA03Uz2IZzgL0ZCj9VfrzlSJPTIR+XR
         FGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WqjZLYmMlQ3mNOcPU7Wva2dXZF2BgJT6gPAgFenRy9o=;
        b=EygoGXYvJS4S5m8K3nCnJ6CPbCq4drbSV4UFXI79P2nXgAmoVYbPMT/I4ciR/yx0G5
         dbv1DBBucxp85n3c5GZBC8yJeJrgvhSibS4WHZgBxU26hrWnG4V4dlLjAqf+/sVMQ55e
         UvV94dYqO19RTP7Frs4rL+QAOILfeDj1pcz5SnOqhTNZDbVMQIxOwV3YHvCVNtB9rL4G
         2PTGzalY0nF41yqTArBo8sqFA01ztfzjx1J96LAKIWB2rGoVDgDNUglNTNBn5Udp60MG
         fUTyecrw65gPv8fh7dSZP1t1jk9pRKn+BjwV6EwTvKP3K9vivviT8qBCaSkRjYDG1FXZ
         G1fw==
X-Gm-Message-State: ACrzQf27BkdAdeSRglin4uQ+CEvvMP/gQhKiMyzis/0U+9K2O3YDy2en
        h8Facxijd3e72CfO5M1cv0+DBA==
X-Google-Smtp-Source: AMsMyM4UAKbPloMpGpKA1+ePFN8umxdOc6uHa8bL9IBy5F0NN1d1BVMf6OszkS1NZHnoes8RiJS7GQ==
X-Received: by 2002:a05:6512:261e:b0:4a1:8b6:86bb with SMTP id bt30-20020a056512261e00b004a108b686bbmr7348354lfb.334.1664300297959;
        Tue, 27 Sep 2022 10:38:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:15 -0700 (PDT)
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
Subject: [PATCH v3 13/34] dt-bindings: pinctrl: qcom,ipq6018: fix indentation in example
Date:   Tue, 27 Sep 2022 19:36:41 +0200
Message-Id: <20220927173702.5200-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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
---
 .../pinctrl/qcom,ipq6018-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index bc85e098b5d7..9cd3a5466eb9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -141,21 +141,21 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-              compatible = "qcom,ipq6018-pinctrl";
-              reg = <0x01000000 0x300000>;
-              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-              interrupt-controller;
-              #interrupt-cells = <2>;
-              gpio-controller;
-              #gpio-cells = <2>;
-              gpio-ranges = <&tlmm 0 0 80>;
-
-              serial3-state {
-                      pins = "gpio44", "gpio45";
-                      function = "blsp2_uart";
-                      drive-strength = <8>;
-                      bias-pull-down;
-              };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq6018-pinctrl";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 80>;
+
+        serial3-state {
+            pins = "gpio44", "gpio45";
+            function = "blsp2_uart";
+            drive-strength = <8>;
+            bias-pull-down;
         };
+    };
-- 
2.34.1

