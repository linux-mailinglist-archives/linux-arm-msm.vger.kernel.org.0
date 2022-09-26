Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085465E9AE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbiIZHqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbiIZHpu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:45:50 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764362C133
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q17so6413450lji.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WEk43uqJcxXRamS6VCcaS3s1vK1XqF/9se3cKycCS1M=;
        b=yOQeePVnusINYAtij7nbFEw7gSBC/z5kdUxD9I05eysAfCXX/S44K6L0zMvnIl8JmH
         TrpAQfgIYynRivmFQcLvoJSvdujV7lzG7i4G1Q868azClsMTDmFEevF9GxuKIpvuB74W
         X5CS4XveK6hEcWhkPuPeqBiSp5gZkte33Q2kmRleaCyjplm8Xe93YTzfxmicRYjJjfLg
         cx4wbS3dMxfi2c3jbKB1/GxVcvLKTZ0P17tHsfFckCVT2ZBhJ9YCKk2ZmHLmoAGs9Rwk
         Lq9x0M/ebsTk4lqVK10uOuENreepFuz+CmLSpxVQPZmU2GJlL59lPULViZiB4AzJ+27Z
         LCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WEk43uqJcxXRamS6VCcaS3s1vK1XqF/9se3cKycCS1M=;
        b=61k5srO3nrFFBnVRk104NDXaRIiBL6Jrm9/pNJo5HBC2+/OHe8A7iTwk5Wi+2D1+n8
         nVUYUHE9glDDNwEzjn3FXHZ2w7Vk7Pl5Jm59Sxb+RqKBXc5cd4gWKr8d5k2N5LlLuxGJ
         ftZmS9AmSaot8r92x/RFETkNSZtbweIVuEdrWDv02KHv1Ulqd5JxKfX82EvgfJ4UZoo6
         /EsW9Tc0lDrO7oizVjiz/mdFLyZ/FYIAmkH2lYsUaIKP1HuuYHeR6O80gjVNEP0snza3
         ylJD3tvFe1gEU9xwwpGuBn3U16GwUUzrgYL4YY5Z+jK6CCB3kHoWnP7ESji7UTjoNeDA
         fWWg==
X-Gm-Message-State: ACrzQf3ISNeQocVDH0TeM7uauVQPebB0l5tEKAyWrEF3IIKZWxIgz6MA
        NjhwAAW6At9eHto8Q55G1x8T5Q==
X-Google-Smtp-Source: AMsMyM5x1cdiQ6nBtUBKDuJ2EYjNW9ZqNEVxUHdCE2sJuEYhvSs+xkFgpyhjqwKDPjucufbqmB9cPQ==
X-Received: by 2002:a2e:a4cd:0:b0:26d:8a9c:9c02 with SMTP id p13-20020a2ea4cd000000b0026d8a9c9c02mr3225218ljm.210.1664178293171;
        Mon, 26 Sep 2022 00:44:53 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:52 -0700 (PDT)
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
Subject: [PATCH v2 15/33] dt-bindings: pinctrl: qcom,msm8226: add functions and input-enable
Date:   Mon, 26 Sep 2022 09:43:57 +0200
Message-Id: <20220926074415.53100-16-krzysztof.kozlowski@linaro.org>
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
index 4420bb23c9dc..8c5c85807882 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -79,9 +79,10 @@ $defs:
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
@@ -90,13 +91,10 @@ $defs:
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

