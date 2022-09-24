Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB005E8999
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbiIXIGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbiIXIFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:05:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF5F115A5D
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:26 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x29so2336604ljq.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YwJzKwBTqbPcmrZWZ8ggkR5Ai2/8yEQ4t3c6bMiRPyY=;
        b=RWa5Jg+GEcDh7LyIvwqU/Rm/aL9t3qWq2Orw8zDXmd40mXYgeyvOrqI/QRF7ttf3qr
         wvB46cd/aQVCEqkVOSFeLjSy3J9Sm3b8Ds41BzKX+KlaeXaaKp+BZNfPugXrKFMYPLCF
         c7/8OPPQpYvjj4eN33UFmqNqLf8gHfe2mqlV4o1mttyb2VLB2i9R5u13fKucHEiUQjbh
         nNaTkyMAL4Kz7Q0jGitwBfd0mFXl0qSABrGFoBy0HYLOpkUEjA+FJQZ5Gl9Mq5FTxaCo
         2+ra4IKRjb6s0j/onugDZzOQ9If+S5p2QFoQqBXRptrbGBijNg16nPvJHynAAFhRC28o
         gXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YwJzKwBTqbPcmrZWZ8ggkR5Ai2/8yEQ4t3c6bMiRPyY=;
        b=qO33smmi1ElZwKhG/OZtRPWNVMBuz98mHJAiiz+W49cicFc6LR5eCdaujXWJwlBoPL
         9P3QWbswjJtmtvwXDL0V0mCyJXjU3NccOhJCBX6dCehftGqVm+3UDrPXW0ePc4D2nfNI
         ZWwuyU4a37+SgIVGqZ5zWJvY9aVqdxxnUwaADn0kQVKcPU9WAlyMpVMVYUZvKOC0B2F/
         92qOQhcbGhm9iMg3KGJaIVogIbayY/H6dMSp87m2f5epl4SRhhk/01OgLoEZJl9L5rTU
         EYGX1pEWP8nL8Vk96a+Rs5AXQi4k3XUjmDqNbRkcL6k4Ht/so+OguwlwTyz5Ld+zIhTJ
         I2mQ==
X-Gm-Message-State: ACrzQf1qtveVOe7kPHGNzqqMfOJe71h0WaPswTEz2uY9zbS5+oMFnmhM
        wYQXTbKvHRIiwi88Kz3XKRlobg==
X-Google-Smtp-Source: AMsMyM5MCAcuuBSS8RWt01vyxMeyycHdb+c9gv9m8PJoPO8R/B/Hg6oVsGvFWynLeqRd4bKJw/UxQw==
X-Received: by 2002:a2e:894e:0:b0:26c:5434:e62b with SMTP id b14-20020a2e894e000000b0026c5434e62bmr4079035ljk.180.1664006725927;
        Sat, 24 Sep 2022 01:05:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:25 -0700 (PDT)
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
Subject: [PATCH 14/32] dt-bindings: pinctrl: qcom,msm8226: add functions and input-enable
Date:   Sat, 24 Sep 2022 10:04:41 +0200
Message-Id: <20220924080459.13084-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

The MSM8226 pinctrl driver supports input-enable, blsp_i2c4, blsp_uart4
and sdc3 functions and DTS already uses it:

  qcom-msm8226-samsung-s3ve3g.dtb: pinctrl@fd510000: 'blsp1-i2c1', 'blsp1-i2c2', 'blsp1-i2c3', 'blsp1-i2c4', 'blsp1-i2c5' ...
  qcom-apq8026-lg-lenok.dtb: pinctrl@fd510000: touch-state: 'oneOf' conditional failed, one must be fixed:
    'input-enable' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml         | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index f1d9696a1fe7..e665ae7ffe3c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -78,9 +78,10 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins. Functions are only valid for gpio pins.
         enum: [ gpio, cci_i2c0, blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim5,
-                blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c5, blsp_spi1,
+                blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5, blsp_spi1,
                 blsp_spi2, blsp_spi3, blsp_spi5, blsp_uart1, blsp_uart2,
-                blsp_uart3, blsp_uart5, cam_mclk0, cam_mclk1, wlan ]
+                blsp_uart3, blsp_uart4, blsp_uart5, cam_mclk0, cam_mclk1, sdc3,
+                wlan ]
 
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
@@ -89,13 +90,10 @@ $defs:
           Selects the drive strength for the specified pins, in mA.
 
       bias-pull-down: true
-
       bias-pull-up: true
-
       bias-disable: true
-
+      input-enable: true
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

