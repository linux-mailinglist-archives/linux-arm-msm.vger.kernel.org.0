Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87C7316823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 14:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhBJNhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 08:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhBJNh0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 08:37:26 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F11C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:45 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v24so2911214lfr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PAnChKqBV7iswTJnbJxMd5cntMXlxeAhUfbyTGkM5I0=;
        b=ZIrRU/zgDi5LcS4SecL0jyn/Vl+9SLG2o0lJZv4Pn2arA/7akLlbaqk4eraAJCf4r3
         qcJhVOzWCDGsUUgmmG1xAq6eEilbFTMCeJaL1Iy5jSDmsSdkKxgQKEolW9FQMQmXR9m/
         ethNhVgozUZ+pXXRAhiFstNcJO6knsSLehEa/ZhfPjGRMnxzJuVkF6RIHNCQ+pkn2b9M
         QiisdHRu8DK2AZtNQG2Om8zZC000+3eBgAhEQKQX1/9BxyNs19clVFTATYcW7Pfc9+PV
         1UAYZfyo4Z29hu7rQV+8hSMup8ahJAW0MZkVVI/8lJZwCjqIeEcKrJ509EC1GBDSkCKV
         JOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PAnChKqBV7iswTJnbJxMd5cntMXlxeAhUfbyTGkM5I0=;
        b=kZHtARm3d70Wrh3WYzAsk7Fy1FydQGG0iottWngoIdC/0Jtri/FATUAr5WaObIlarf
         +BPvQzljIXgpdwUTi1ccw0te+1zJkKmuFbPZccl2NWZF5LWaNooZdAFp1K8Fbki7Np6E
         BKg3Kob84yHewW64vjZx2MVmp5O2xzTbgzivGb4HmI+E2ah8q7Ucrv8z1po4ugglaN8u
         yYVfVzG6vOp6NHLh3I3/U9UfxnrDeqAl1mjy4qzCOUt5PTGHRIqwSluWjkddQTvueBWR
         EkhjeaxX70W42Ce9c4CigB3j+Mikp7RIITPS9tgd6wTzcG4mzNOxNKegbaSE7uWItEY0
         vceQ==
X-Gm-Message-State: AOAM531OGQM2dIjavNOl/IAmS7B+PXoPepmLLmhF/9WC2Gkm0L9sFbKP
        pKelMTTJDKYnjNdTt61aPeCu6Q==
X-Google-Smtp-Source: ABdhPJw6rQFgv0XVoUpZRTWHfchcY5IqSqsqdAR2jfDM40F4h0hK8nrW7/kkoPRmo9COJ+MLBJGzMA==
X-Received: by 2002:ac2:5f4d:: with SMTP id 13mr1651626lfz.462.1612964202496;
        Wed, 10 Feb 2021 05:36:42 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id c8sm332629lfb.168.2021.02.10.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:36:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
Date:   Wed, 10 Feb 2021 16:34:57 +0300
Message-Id: <20210210133458.1201066-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 5571324641f0..aa6bad0b33ab 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2948,6 +2948,11 @@ qup_spi0_cs: qup-spi0-cs {
 				function = "qup0";
 			};
 
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio {
+				pins = "gpio31";
+				function = "gpio";
+			};
+
 			qup_spi0_data_clk: qup-spi0-data-clk {
 				pins = "gpio28", "gpio29",
 				       "gpio30";
@@ -2959,6 +2964,11 @@ qup_spi1_cs: qup-spi1-cs {
 				function = "qup1";
 			};
 
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
 			qup_spi1_data_clk: qup-spi1-data-clk {
 				pins = "gpio4", "gpio5",
 				       "gpio6";
@@ -2970,6 +2980,11 @@ qup_spi2_cs: qup-spi2-cs {
 				function = "qup2";
 			};
 
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio {
+				pins = "gpio118";
+				function = "gpio";
+			};
+
 			qup_spi2_data_clk: qup-spi2-data-clk {
 				pins = "gpio115", "gpio116",
 				       "gpio117";
@@ -2981,6 +2996,11 @@ qup_spi3_cs: qup-spi3-cs {
 				function = "qup3";
 			};
 
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio {
+				pins = "gpio122";
+				function = "gpio";
+			};
+
 			qup_spi3_data_clk: qup-spi3-data-clk {
 				pins = "gpio119", "gpio120",
 				       "gpio121";
@@ -2992,6 +3012,11 @@ qup_spi4_cs: qup-spi4-cs {
 				function = "qup4";
 			};
 
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio {
+				pins = "gpio11";
+				function = "gpio";
+			};
+
 			qup_spi4_data_clk: qup-spi4-data-clk {
 				pins = "gpio8", "gpio9",
 				       "gpio10";
@@ -3003,6 +3028,11 @@ qup_spi5_cs: qup-spi5-cs {
 				function = "qup5";
 			};
 
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio {
+				pins = "gpio15";
+				function = "gpio";
+			};
+
 			qup_spi5_data_clk: qup-spi5-data-clk {
 				pins = "gpio12", "gpio13",
 				       "gpio14";
@@ -3014,6 +3044,11 @@ qup_spi6_cs: qup-spi6-cs {
 				function = "qup6";
 			};
 
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio {
+				pins = "gpio19";
+				function = "gpio";
+			};
+
 			qup_spi6_data_clk: qup-spi6-data-clk {
 				pins = "gpio16", "gpio17",
 				       "gpio18";
@@ -3025,6 +3060,11 @@ qup_spi7_cs: qup-spi7-cs {
 				function = "qup7";
 			};
 
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio {
+				pins = "gpio23";
+				function = "gpio";
+			};
+
 			qup_spi7_data_clk: qup-spi7-data-clk {
 				pins = "gpio20", "gpio21",
 				       "gpio22";
@@ -3036,6 +3076,11 @@ qup_spi8_cs: qup-spi8-cs {
 				function = "qup8";
 			};
 
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio {
+				pins = "gpio27";
+				function = "gpio";
+			};
+
 			qup_spi8_data_clk: qup-spi8-data-clk {
 				pins = "gpio24", "gpio25",
 				       "gpio26";
@@ -3047,6 +3092,11 @@ qup_spi9_cs: qup-spi9-cs {
 				function = "qup9";
 			};
 
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio {
+				pins = "gpio128";
+				function = "gpio";
+			};
+
 			qup_spi9_data_clk: qup-spi9-data-clk {
 				pins = "gpio125", "gpio126",
 				       "gpio127";
@@ -3058,6 +3108,11 @@ qup_spi10_cs: qup-spi10-cs {
 				function = "qup10";
 			};
 
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio {
+				pins = "gpio132";
+				function = "gpio";
+			};
+
 			qup_spi10_data_clk: qup-spi10-data-clk {
 				pins = "gpio129", "gpio130",
 				       "gpio131";
@@ -3069,6 +3124,11 @@ qup_spi11_cs: qup-spi11-cs {
 				function = "qup11";
 			};
 
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio {
+				pins = "gpio63";
+				function = "gpio";
+			};
+
 			qup_spi11_data_clk: qup-spi11-data-clk {
 				pins = "gpio60", "gpio61",
 				       "gpio62";
@@ -3080,6 +3140,11 @@ qup_spi12_cs: qup-spi12-cs {
 				function = "qup12";
 			};
 
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio {
+				pins = "gpio35";
+				function = "gpio";
+			};
+
 			qup_spi12_data_clk: qup-spi12-data-clk {
 				pins = "gpio32", "gpio33",
 				       "gpio34";
@@ -3091,6 +3156,11 @@ qup_spi13_cs: qup-spi13-cs {
 				function = "qup13";
 			};
 
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
 			qup_spi13_data_clk: qup-spi13-data-clk {
 				pins = "gpio36", "gpio37",
 				       "gpio38";
@@ -3102,6 +3172,11 @@ qup_spi14_cs: qup-spi14-cs {
 				function = "qup14";
 			};
 
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio {
+				pins = "gpio43";
+				function = "gpio";
+			};
+
 			qup_spi14_data_clk: qup-spi14-data-clk {
 				pins = "gpio40", "gpio41",
 				       "gpio42";
@@ -3113,6 +3188,11 @@ qup_spi15_cs: qup-spi15-cs {
 				function = "qup15";
 			};
 
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio {
+				pins = "gpio47";
+				function = "gpio";
+			};
+
 			qup_spi15_data_clk: qup-spi15-data-clk {
 				pins = "gpio44", "gpio45",
 				       "gpio46";
@@ -3124,6 +3204,11 @@ qup_spi16_cs: qup-spi16-cs {
 				function = "qup16";
 			};
 
+			qup_spi16_cs_gpio: qup-spi16-cs-gpio {
+				pins = "gpio51";
+				function = "gpio";
+			};
+
 			qup_spi16_data_clk: qup-spi16-data-clk {
 				pins = "gpio48", "gpio49",
 				       "gpio50";
@@ -3135,6 +3220,11 @@ qup_spi17_cs: qup-spi17-cs {
 				function = "qup17";
 			};
 
+			qup_spi17_cs_gpio: qup-spi17-cs-gpio {
+				pins = "gpio55";
+				function = "gpio";
+			};
+
 			qup_spi17_data_clk: qup-spi17-data-clk {
 				pins = "gpio52", "gpio53",
 				       "gpio54";
@@ -3146,6 +3236,11 @@ qup_spi18_cs: qup-spi18-cs {
 				function = "qup18";
 			};
 
+			qup_spi18_cs_gpio: qup-spi18-cs-gpio {
+				pins = "gpio59";
+				function = "gpio";
+			};
+
 			qup_spi18_data_clk: qup-spi18-data-clk {
 				pins = "gpio56", "gpio57",
 				       "gpio58";
@@ -3157,6 +3252,11 @@ qup_spi19_cs: qup-spi19-cs {
 				function = "qup19";
 			};
 
+			qup_spi19_cs_gpio: qup-spi19-cs-gpio {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
 			qup_spi19_data_clk: qup-spi19-data-clk {
 				pins = "gpio0", "gpio1",
 				       "gpio2";
-- 
2.30.0

