Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FE464A4F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbiLLQgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbiLLQfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:35:54 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B8913EA0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:46 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bp15so266188lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dThJf8DwFRC56Jrk9Hg3kZoCyd3VoKNACyqCMhT6bLQ=;
        b=xhvBUTW5p9kR0LVpGPaAsgEaIl4tYuv+mEF0Yiwa64945oSovIYb4+aw3h4MkYj8+h
         UGPtzKHkQqBU67kaXZMWLp1hZitqy90MdE9FW2bMByEaADxpyp7PUu7A+2JeHJ6NaCTP
         ogLYsZMWEoF/ABgV/wlWByfxhrMwcQZkoSuGuC4MJGKWRufVhaZ+Q5i5NhLjKzAtt8pm
         0UScxpmY4czQiG/ikX2jwMayoFDCAQMY8VkrVZaLhmSZEQzTzY7nsNLKBcKFgahr7aDe
         7vk0FxFzcugRpygkWCDjLwtw0PXpdEtkqHC4RVFqMP4EbqnFYutNlPQYGgS0COn5vHp6
         wuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dThJf8DwFRC56Jrk9Hg3kZoCyd3VoKNACyqCMhT6bLQ=;
        b=RwMp6Y94JTyvjlNQMvsnZXOSNkCMKGeqV2BkBrbWGrsX3fl7cxhbbPk0ZbS7keTaxN
         RSsixtsBvi4mORMCrRQzZFLUtzYAyII9zvCDQmfgdM7V5jFdDcOEV3YOKg/q8qSL4Yxz
         5XnsOjNIbruoOTskbiF8a6Zn5O44myBRZ7BqCvrf5oFcYlFmaNUK1wQ0vyHlAnmYI6XI
         O4qQWcdxUdxwGYDylQW5R9tvVdAGkx//9oTuZ1FV7oQ1qwyUYXHt1on02rpte6oRcRjo
         qNePDmDLz3rUP4H0KgkVb0JNsEfCsLc8XnS9EP7YO+L1JWDxCFvpS3RKtMAJjTlAhbdI
         79tg==
X-Gm-Message-State: ANoB5pk8klIXnDMJETH4/pfxAdLPcwUMQ5BYf6K242fClPBHDXOhbppV
        mYzc/sgprdlUuZu6U43h5cC3uQ==
X-Google-Smtp-Source: AA0mqf7EmDjqT2SjpZ1s+Aa0E+hRR8SbIN32l6r236xW+VIHf6pcfGx4LLU+n11JBseKulCguk51Cg==
X-Received: by 2002:a19:381c:0:b0:4b6:a6e4:ab7a with SMTP id f28-20020a19381c000000b004b6a6e4ab7amr2332893lfa.8.1670862945325;
        Mon, 12 Dec 2022 08:35:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] ARM: dts: qcom: reverse compatibles to match bindings
Date:   Mon, 12 Dec 2022 17:35:27 +0100
Message-Id: <20221212163532.142533-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
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

The most specific compatible should be upfront.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 4 ++--
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 4 ++--
 arch/arm/boot/dts/qcom-msm8960.dtsi | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 0da9623ea084..79575d6b3a81 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -375,8 +375,8 @@ intc: interrupt-controller@2000000 {
 		};
 
 		timer@200a000 {
-			compatible = "qcom,kpss-timer",
-				     "qcom,kpss-wdt-apq8064", "qcom,msm-timer";
+			compatible = "qcom,kpss-wdt-apq8064", "qcom,kpss-timer",
+				     "qcom,msm-timer";
 			interrupts = <1 1 0x301>,
 				     <1 2 0x301>,
 				     <1 3 0x301>;
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index acb08dcf9442..a73c3a17b6a4 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -400,7 +400,7 @@ blsp1_uart2: serial@78b0000 {
 		};
 
 		watchdog: watchdog@b017000 {
-			compatible = "qcom,kpss-wdt", "qcom,kpss-wdt-ipq4019";
+			compatible = "qcom,kpss-wdt-ipq4019", "qcom,kpss-wdt";
 			reg = <0xb017000 0x40>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <10>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 7e784b0995da..9daafe9de02a 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -549,8 +549,8 @@ intc: interrupt-controller@2000000 {
 		};
 
 		timer@200a000 {
-			compatible = "qcom,kpss-timer",
-				     "qcom,kpss-wdt-ipq8064", "qcom,msm-timer";
+			compatible = "qcom,kpss-wdt-ipq8064", "qcom,kpss-timer",
+				     "qcom,msm-timer";
 			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) |
 						 IRQ_TYPE_EDGE_RISING)>,
 				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) |
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 7debf9db7cb1..63c3c40fe9a2 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -103,8 +103,8 @@ intc: interrupt-controller@2000000 {
 		};
 
 		timer@200a000 {
-			compatible = "qcom,kpss-timer",
-				     "qcom,kpss-wdt-msm8960", "qcom,msm-timer";
+			compatible = "qcom,kpss-wdt-msm8960", "qcom,kpss-timer",
+				     "qcom,msm-timer";
 			interrupts = <GIC_PPI 1 0x301>,
 				     <GIC_PPI 2 0x301>,
 				     <GIC_PPI 3 0x301>;
-- 
2.34.1

