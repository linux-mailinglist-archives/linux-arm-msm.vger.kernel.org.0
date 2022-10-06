Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237895F6698
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiJFMsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJFMrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:37 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB63DA2AB4
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:20 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a12so2090590ljr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Oui/kDbsrv6s8BQvFzLPi94iBNYwMr5hQJ5FlH4LhEs=;
        b=fRNfrzjdYB7HdPGiZNEluYP2r2VU5zkdF9yhoxOludqZZsTQRTGu0NxlCB+ghnLCB4
         U2q/i0CJWRUbF/k90hEMJ5w63tCDb5hbIZfDd1KsKEhF4S28Rsphi87wALq4rAhcq9ID
         6nJiuuKQPOzRCGWZMj/oR5+SHbh/Vv+lf/NARTWURuKoeI7h7kB+RlvRVVx2V2T8vmhg
         yxDm8VX83akyYoxycr+uGni01JJswyd98bytmYzkoyOlrBKvj9WoHiRAeUO04uau3Pa7
         INSVMYePpAREY/AmlwyH+R3gfQ+XTDxFe/QkuwpuPJ1mBnQ193mHjlgI+bACtHz2MEwT
         26NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Oui/kDbsrv6s8BQvFzLPi94iBNYwMr5hQJ5FlH4LhEs=;
        b=FKa3Heci9Rv0pTlMZG5SGJilduU0iBpKGKAXkHIUjQYQz8onVVDRcVuHlEH6aVFeYk
         FWiK14EIkKGmdUrTP2FLxunRhCUaPDwhXKhSI53tzWp5p36WX5ahBlTTf3M451CM4W+O
         Zz4MFgk3wIZGMfBO2RLuK+bi7nSePwCf24X3t+v0cXjIw7IJfMbOeHM1V6/ccViZlmEv
         aENt3b0DaGwtLev6cpxzR3vlVcpt48pDDbMMakQWxoDmrU+JH+1qfib1hyOrAYNdM/nS
         0CCQujhRT4W31B86mFD/k9EvmMc3KSXb+wiusOd0GAd4vHDrrs9h3XxJbUNSkPaJ6fD0
         2wAA==
X-Gm-Message-State: ACrzQf2fBlsKMvkFOpaEdtDaZqaQNz/5H/acsWBXqxMvIG0DeyOyU9um
        qBfXLxJ9xxrbpHuR+ZMWONWKrqC0RBEO6Q==
X-Google-Smtp-Source: AMsMyM5rwVTEQaB5NjWeeyUtC62o/eF81O7klRi8hT82AYAUjaU9aXOdTNEYdbDb8epIvUK7xzHAHg==
X-Received: by 2002:a05:651c:98a:b0:26d:fbd0:2c43 with SMTP id b10-20020a05651c098a00b0026dfbd02c43mr1846826ljq.517.1665060440070;
        Thu, 06 Oct 2022 05:47:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:19 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 16/34] dt-bindings: pinctrl: qcom,msm8226: add functions and input-enable
Date:   Thu,  6 Oct 2022 14:46:41 +0200
Message-Id: <20221006124659.217540-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml         | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index 158c9a50101e..c6f15c8da999 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -65,9 +65,10 @@ $defs:
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
@@ -76,13 +77,10 @@ $defs:
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

