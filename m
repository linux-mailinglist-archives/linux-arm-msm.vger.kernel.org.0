Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C486D5E9AF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbiIZHrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbiIZHqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:46:47 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0573432BA5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:03 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g20so6434598ljg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hZoihGN9LuXNpIDqL0PGpHJiu0KXNyNZnYTwNgQ/WZc=;
        b=cx/UCT70z6xOXrjxd93Rtp13G4cH6/nJXPIV/FexBtOxXenC/tPlYJdxi1u6Cvogid
         1T8OK9efopfAAdarmdFQVoW56yNsX1EzegDb5C+M07k5ltSBjfANDTr3BIb0RxdhMPRg
         TNs55ZM3w8sLN/F4GmJjt30fHnCLXe3vjdKtSYxreZaecxD90bRoER7OXDxcOEf08eB8
         MQaFVZXa2gEWVYrhRoNWRMTIL5z/RPq5XoZH/oojHnZL7h2WlTa9MZwqinLsVkYsy7+r
         7Zg9o9AtJfaiNQlMajfExgmegFkFloFQL/l4Q9yTfg+QT22TPH3+5rLjsXIp9nGagdUN
         D3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hZoihGN9LuXNpIDqL0PGpHJiu0KXNyNZnYTwNgQ/WZc=;
        b=5fBysKxQ7rsxTjyljCX6HA6hgfFIm7duiRnvijRAgfwG8/orL8YppiN5Z+A2qm7cxm
         uJdOQabLMzL5KxKVTz+OM/Ww9xbwyANoZRkeaCdgSfMid3r9msO7KQ2Gy1o1OKFajm+w
         +Y4GVO0tvcdYJ6jw26Yng9TMPBXiG4Uv/q7JMivfmFrRKRnOsX0ElfPTTWsfXIyrVVM8
         qBIA2i5TIIqF+pWBsNPoL2XEgEHC+MeOgvi9S7MZCq5ysr50BtUV5B68NkJRBBliZ9d7
         yh0hXa14lrE3dZ+h63wF5ApyBXdzxBKAc5/I7+5aKvNlv3o7yFNTBTplpqPNqLPvJ97b
         fzNg==
X-Gm-Message-State: ACrzQf1stBeKg+PesAuvu5D42OioFF+ujSkCwb9xCB29nVDsDSnp3igD
        DGle0JQUYQFPjiScm2YMEfqegA==
X-Google-Smtp-Source: AMsMyM6jF7+qumxyG9NzmJTakUXhNSEVe1cBsUWmkuLdU9rjfd2evPzc4kf+2Tpdm1650AfZijaVKw==
X-Received: by 2002:a2e:a7cc:0:b0:26c:ea51:1448 with SMTP id x12-20020a2ea7cc000000b0026cea511448mr3832951ljp.47.1664178294683;
        Mon, 26 Sep 2022 00:44:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:53 -0700 (PDT)
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
Subject: [PATCH v2 16/33] dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
Date:   Mon, 26 Sep 2022 09:43:58 +0200
Message-Id: <20220926074415.53100-17-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index 8c5c85807882..b466d2ffc437 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -119,22 +119,22 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        msmgpio: pinctrl@fd510000 {
-                compatible = "qcom,msm8226-pinctrl";
-                reg = <0xfd510000 0x4000>;
-
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&msmgpio 0 0 117>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-
-                serial-state {
-                        pins = "gpio8", "gpio9";
-                        function = "blsp_uart3";
-                        drive-strength = <8>;
-                        bias-disable;
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    msmgpio: pinctrl@fd510000 {
+        compatible = "qcom,msm8226-pinctrl";
+        reg = <0xfd510000 0x4000>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&msmgpio 0 0 117>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        serial-state {
+            pins = "gpio8", "gpio9";
+            function = "blsp_uart3";
+            drive-strength = <8>;
+            bias-disable;
         };
+    };
-- 
2.34.1

