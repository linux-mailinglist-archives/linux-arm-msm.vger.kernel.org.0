Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5DD95F63FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 11:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiJFJ6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 05:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiJFJ6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 05:58:09 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184648994F
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 02:58:04 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l8so693504wmi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=GYdVlrgjsqJltATy6SUqdjbfxJkw6ir+IzQ1WI76DV8=;
        b=twzGrDC6kXwC4w2jz2RE6SBnWAs0jgl2tZtFpCOz+C4AkSZnmt3CibjJlh2H1yyN7x
         hoo7I029gyobrr9BrqfBzWDkvPpfRl0kaQhRXN5YxQYQEWWs/kA5ZM2q3YKAUfwUUlfg
         VZbUFRQuBz6sqvF7AwJnOmT0i0inI4onO0qeP1f1RlJ/z9IDjBaVWyC7PWWPrEjegvN+
         Cnm9LD6r/ycbXl02y+Dld/z/ORjSt0kNVDTPJ/PTCzrUIynqwz4Gs6yN0NTRbDGTMG9T
         MPKemE0i5y3TWxkOzLaPlsbmZ6A41s3G5k6vdBKuzqS3PnTg2O21S7ffFWPT/jrodMFi
         eCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GYdVlrgjsqJltATy6SUqdjbfxJkw6ir+IzQ1WI76DV8=;
        b=lXbmWM1c745WSAOOKHb1CEWuqgcCvjfvrZPODswEUkkd4jHs7ip5tI8/FP8ju0Ha8C
         8GHFhSxWwzXmcWnaIiy6N/wrVLIvf33WYMCY7yrFGdE9DKygfHORH1Xh1s/V18VuFW9N
         +jzZNwrPgxHOpwPbOa1m02CBO+OIFXGDNerOI0QwASpOA+5MISYOcmvNAuyHURCT8y3M
         OVDcNRha4RC3VkIkc45eEhXCdDTkUHPvsLQLm/XP/9j/CIhuiduJHdxyXx1f2kw/5Rz4
         kdfK8fuyOc0O/REvgA//AuA5FMGiIeF8fzkHOUb4+p0otpZbND4Iq8Q9JP1I0/bycFRr
         W92g==
X-Gm-Message-State: ACrzQf3tIbFA/yntQCX996jWprF4Y7stCJzZL8Rlm4ebr+0TSJMM6J8L
        qD9phwOGPlljg03HGGtL+p7UOg==
X-Google-Smtp-Source: AMsMyM78nfQ5I6EzvNj4exzL1MmMtvE9r8BH9WQ+xrhf3G8Jyy6AcYDdma+kGm7i2CG6jXB8k608ZA==
X-Received: by 2002:a05:600c:1552:b0:3a8:4523:d16 with SMTP id f18-20020a05600c155200b003a845230d16mr6116804wmg.200.1665050283370;
        Thu, 06 Oct 2022 02:58:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q11-20020adf9dcb000000b0022ac672654dsm17935603wre.58.2022.10.06.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 02:58:02 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 06 Oct 2022 09:58:00 +0000
Subject: [PATCH 3/6] arm: dts: qcom: mdm9615: wp8548-mangoh-green: fix sx150xq
 node names and probe-reset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mdm9615-pinctrl-yaml-v1-3-0cbc006e2a30@linaro.org>
References: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, Lee Jones <lee@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the sx150xq node names to pinctrl and use the right probe-reset property.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
index 30a110984597..a8304769b509 100644
--- a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
+++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
@@ -116,7 +116,7 @@ i2c@4 {
 			#size-cells = <0>;
 			reg = <4>;
 
-			gpioext0: gpio@3e {
+			gpioext0: pinctrl@3e {
 				/* GPIO Expander 0 Mapping :
 				 * - 0: ARDUINO_RESET_Level shift
 				 * - 1: BattChrgr_PG_N
@@ -142,7 +142,7 @@ gpioext0: gpio@3e {
 				interrupt-parent = <&gpioext1>;
 				interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
 
-				probe-reset;
+				semtech,probe-reset;
 
 				gpio-controller;
 				interrupt-controller;
@@ -154,7 +154,7 @@ i2c@5 {
 			#size-cells = <0>;
 			reg = <5>;
 
-			gpioext1: gpio@3f {
+			gpioext1: pinctrl@3f {
 				/* GPIO Expander 1 Mapping :
 				 * - 0: GPIOEXP_INT1
 				 * - 1: Battery detect
@@ -183,7 +183,7 @@ gpioext1: gpio@3f {
 				interrupt-parent = <&msmgpio>;
 				interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
 
-				probe-reset;
+				semtech,probe-reset;
 
 				gpio-controller;
 				interrupt-controller;
@@ -195,7 +195,7 @@ i2c@6 {
 			#size-cells = <0>;
 			reg = <6>;
 
-			gpioext2: gpio@70 {
+			gpioext2: pinctrl@70 {
 				/* GPIO Expander 2 Mapping :
 				 * - 0: USB_HUB_INTn
 				 * - 1: HUB_CONNECT
@@ -221,7 +221,7 @@ gpioext2: gpio@70 {
 				interrupt-parent = <&gpioext1>;
 				interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
 
-				probe-reset;
+				semtech,probe-reset;
 
 				gpio-controller;
 				interrupt-controller;

-- 
b4 0.10.1
