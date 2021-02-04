Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0265D30FECB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBDUtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhBDUts (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:49:48 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBFDC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 12:49:08 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id m22so5111846ljj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 12:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSjMG7FbTcrxCgmEoKvYDCrpeSeW/Mk2gd8D+uT/01E=;
        b=fZWhUZnviySiKyEBiCe5eGEpRTCq0KA24KzEXmy/ULzqYehzqtMby8yRXsLc9bygLB
         YJvBlPUhFG767xXoYnkVLHqPo8mZJE0YU6ujIgn1di/Qgfm+irRyEpFLI6M38xxdnINU
         qWDb17QtnrCb3wAh9qwcDsoiK2h3qi/7ULRc47LNj1i1mY60I37Spzl+XoxNy5eQivOB
         PYR18S3vfEp0JsYdfLy+A8eHVJ5dHRUSE0V7GFG3XVIyn9Dl9tpSCxNYrRi6Pa4Rtq6E
         mH/hCXXa0s4mtishlwiZHseaidzNGdwNE8aPhu1kdh9ebLeeOa2c4XqM1HsU86om9XdV
         Lwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSjMG7FbTcrxCgmEoKvYDCrpeSeW/Mk2gd8D+uT/01E=;
        b=dcJ+253qYgTiAd8zP/+SHcCBdzHlPJZLPdDIxm3NyTh/9S8lQopkxcYbEnQOfxyqNN
         20w/SIrq4E0S9S6sUAH4LWvvzCF6Ns1YKoPejnEujcc8YKQlWnAQFBd62Q2p5cu77rhc
         amK8bSfxWDhPPIKmE9b5E/Ki81X8hopv6mdsR+UmAMUnnACbesgnjQvBI4w9Ev2pJOJn
         PWME4DtVbUK33/vFUf25t3nv1xqWNK+MJUNPOhrAe/rXQlBRNQHADz1Iyc8//jHm0oJQ
         bp4Gjp38TSxwmj0ZgxbnBze77AsCFCzU3WWpMptik0gIIY6484okssv50Vf/Z6gydCKl
         MbcQ==
X-Gm-Message-State: AOAM531rpt22NlPn/rdpqs3rcK5eVk7qEVdZ6hmPeRpJ07Rxg5NC6tkg
        34JeHEVNE65TIGDe8DBiQifaYEYyw0LMvqzO
X-Google-Smtp-Source: ABdhPJylcOR8qZQXFk1KpvbiDrZgJUuMrzzspPEtTT/EOmm3fhex9Z5bC0Ekp3BC8STrzhFiK7wtSA==
X-Received: by 2002:a2e:988d:: with SMTP id b13mr658077ljj.176.1612471746759;
        Thu, 04 Feb 2021 12:49:06 -0800 (PST)
Received: from eriador.lan ([188.162.64.67])
        by smtp.gmail.com with ESMTPSA id g25sm759958ljj.64.2021.02.04.12.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:49:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
Date:   Thu,  4 Feb 2021 23:49:03 +0300
Message-Id: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS")) for the details. Provide pinctrl entries for SPI
controllers using the same CS pin but in GPIO mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 380 +++++++++++++++++++++++++++
 1 file changed, 380 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 3cea28058a91..03015174ec06 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3046,6 +3046,25 @@ config {
 				};
 			};
 
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio {
+				mux {
+					pins = "gpio28", "gpio29",
+					       "gpio30";
+					function = "qup0";
+				};
+
+				cs {
+					pins = "gpio31";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio28", "gpio29", "gpio30", "gpio31";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi0_default: qup-spi0-default {
 				mux {
 					pins = "gpio28", "gpio29",
@@ -3061,6 +3080,25 @@ config {
 				};
 			};
 
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio {
+				mux {
+					pins = "gpio4", "gpio5",
+					       "gpio6";
+					function = "qup1";
+				};
+
+				cs {
+					pins = "gpio7";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio4", "gpio5", "gpio6", "gpio7";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi1_default: qup-spi1-default {
 				mux {
 					pins = "gpio4", "gpio5",
@@ -3076,6 +3114,25 @@ config {
 				};
 			};
 
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio {
+				mux {
+					pins = "gpio115", "gpio116",
+					       "gpio117";
+					function = "qup2";
+				};
+
+				cs {
+					pins = "gpio118";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio115", "gpio116", "gpio117", "gpio118";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi2_default: qup-spi2-default {
 				mux {
 					pins = "gpio115", "gpio116",
@@ -3091,6 +3148,25 @@ config {
 				};
 			};
 
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio {
+				mux {
+					pins = "gpio119", "gpio120",
+					       "gpio121";
+					function = "qup3";
+				};
+
+				cs {
+					pins = "gpio122";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio119", "gpio120", "gpio121", "gpio122";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi3_default: qup-spi3-default {
 				mux {
 					pins = "gpio119", "gpio120",
@@ -3106,6 +3182,25 @@ config {
 				};
 			};
 
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio {
+				mux {
+					pins = "gpio8", "gpio9",
+					       "gpio10";
+					function = "qup4";
+				};
+
+				cs {
+					pins = "gpio11";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio8", "gpio9", "gpio10", "gpio11";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi4_default: qup-spi4-default {
 				mux {
 					pins = "gpio8", "gpio9",
@@ -3121,6 +3216,25 @@ config {
 				};
 			};
 
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio {
+				mux {
+					pins = "gpio12", "gpio13",
+					       "gpio14";
+					function = "qup5";
+				};
+
+				cs {
+					pins = "gpio15";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio12", "gpio13", "gpio14", "gpio15";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi5_default: qup-spi5-default {
 				mux {
 					pins = "gpio12", "gpio13",
@@ -3136,6 +3250,25 @@ config {
 				};
 			};
 
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio {
+				mux {
+					pins = "gpio16", "gpio17",
+					       "gpio18";
+					function = "qup6";
+				};
+
+				cs {
+					pins = "gpio19";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio16", "gpio17", "gpio18", "gpio19";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi6_default: qup-spi6-default {
 				mux {
 					pins = "gpio16", "gpio17",
@@ -3151,6 +3284,25 @@ config {
 				};
 			};
 
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio {
+				mux {
+					pins = "gpio20", "gpio21",
+					       "gpio22";
+					function = "qup7";
+				};
+
+				cs {
+					pins = "gpio23";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio20", "gpio21", "gpio22", "gpio23";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi7_default: qup-spi7-default {
 				mux {
 					pins = "gpio20", "gpio21",
@@ -3166,6 +3318,25 @@ config {
 				};
 			};
 
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio {
+				mux {
+					pins = "gpio24", "gpio25",
+					       "gpio26";
+					function = "qup8";
+				};
+
+				cs {
+					pins = "gpio27";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio24", "gpio25", "gpio26", "gpio27";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi8_default: qup-spi8-default {
 				mux {
 					pins = "gpio24", "gpio25",
@@ -3181,6 +3352,25 @@ config {
 				};
 			};
 
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio {
+				mux {
+					pins = "gpio125", "gpio126",
+					       "gpio127";
+					function = "qup9";
+				};
+
+				cs {
+					pins = "gpio128";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio125", "gpio126", "gpio127", "gpio128";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi9_default: qup-spi9-default {
 				mux {
 					pins = "gpio125", "gpio126",
@@ -3196,6 +3386,25 @@ config {
 				};
 			};
 
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio {
+				mux {
+					pins = "gpio129", "gpio130",
+					       "gpio131";
+					function = "qup10";
+				};
+
+				cs {
+					pins = "gpio132";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio129", "gpio130", "gpio131", "gpio132";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi10_default: qup-spi10-default {
 				mux {
 					pins = "gpio129", "gpio130",
@@ -3211,6 +3420,25 @@ config {
 				};
 			};
 
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio {
+				mux {
+					pins = "gpio60", "gpio61",
+					       "gpio62";
+					function = "qup11";
+				};
+
+				cs {
+					pins = "gpio63";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio60", "gpio61", "gpio62", "gpio63";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi11_default: qup-spi11-default {
 				mux {
 					pins = "gpio60", "gpio61",
@@ -3226,6 +3454,25 @@ config {
 				};
 			};
 
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio {
+				mux {
+					pins = "gpio32", "gpio33",
+					       "gpio34";
+					function = "qup12";
+				};
+
+				cs {
+					pins = "gpio35";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio32", "gpio33", "gpio34", "gpio35";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi12_default: qup-spi12-default {
 				mux {
 					pins = "gpio32", "gpio33",
@@ -3241,6 +3488,25 @@ config {
 				};
 			};
 
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio {
+				mux {
+					pins = "gpio36", "gpio37",
+					       "gpio38";
+					function = "qup13";
+				};
+
+				cs {
+					pins = "gpio39";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio36", "gpio37", "gpio38", "gpio39";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi13_default: qup-spi13-default {
 				mux {
 					pins = "gpio36", "gpio37",
@@ -3256,6 +3522,25 @@ config {
 				};
 			};
 
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio {
+				mux {
+					pins = "gpio40", "gpio41",
+					       "gpio42";
+					function = "qup14";
+				};
+
+				cs {
+					pins = "gpio43";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio40", "gpio41", "gpio42", "gpio43";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi14_default: qup-spi14-default {
 				mux {
 					pins = "gpio40", "gpio41",
@@ -3271,6 +3556,25 @@ config {
 				};
 			};
 
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio {
+				mux {
+					pins = "gpio44", "gpio45",
+					       "gpio46";
+					function = "qup15";
+				};
+
+				cs {
+					pins = "gpio47";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio44", "gpio45", "gpio46", "gpio47";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi15_default: qup-spi15-default {
 				mux {
 					pins = "gpio44", "gpio45",
@@ -3286,6 +3590,25 @@ config {
 				};
 			};
 
+			qup_spi16_cs_gpio: qup-spi16-cs-gpio {
+				mux {
+					pins = "gpio48", "gpio49",
+					       "gpio50";
+					function = "qup16";
+				};
+
+				cs {
+					pins = "gpio51";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio48", "gpio49", "gpio50", "gpio51";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi16_default: qup-spi16-default {
 				mux {
 					pins = "gpio48", "gpio49",
@@ -3301,6 +3624,25 @@ config {
 				};
 			};
 
+			qup_spi17_cs_gpio: qup-spi17-cs-gpio {
+				mux {
+					pins = "gpio52", "gpio53",
+					       "gpio54";
+					function = "qup17";
+				};
+
+				cs {
+					pins = "gpio55";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio52", "gpio53", "gpio54", "gpio55";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi17_default: qup-spi17-default {
 				mux {
 					pins = "gpio52", "gpio53",
@@ -3316,6 +3658,25 @@ config {
 				};
 			};
 
+			qup_spi18_cs_gpio: qup-spi18-cs-gpio {
+				mux {
+					pins = "gpio56", "gpio57",
+					       "gpio58";
+					function = "qup18";
+				};
+
+				cs {
+					pins = "gpio59";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio56", "gpio57", "gpio58", "gpio59";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi18_default: qup-spi18-default {
 				mux {
 					pins = "gpio56", "gpio57",
@@ -3331,6 +3692,25 @@ config {
 				};
 			};
 
+			qup_spi19_cs_gpio: qup-spi19-cs-gpio {
+				mux {
+					pins = "gpio0", "gpio1",
+					       "gpio2";
+					function = "qup19";
+				};
+
+				cs {
+					pins = "gpio3";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio0", "gpio1", "gpio2", "gpio3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
 			qup_spi19_default: qup-spi19-default {
 				mux {
 					pins = "gpio0", "gpio1",
-- 
2.30.0

