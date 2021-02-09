Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A1C3157EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 21:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhBIUqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 15:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbhBIUhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:37:00 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B907C0698D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 12:29:00 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id c18so24132055ljd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 12:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OMd59Irm/owovVce7ql4HUYwGx76nu+YdPgHJrTkxEU=;
        b=c9FpwP0h6Puee48FCmuQnXRl4ps8cXa4xi4T9Tiha+N/fJJw8cCTrX26gHQJOLlC1E
         9C+gVou9DtpWvKWKDOFccrqbe42VE2TQjOWbSNdSDyAOQmXl6MvMLrOJ4O0sjqRzLNt+
         AG8zbSAi6aePwf+wsMqtsFscOxPR5bBFD/cMedOF/awTm/xyXpPaZx3PV8nH0Jk9p3ai
         a5G0i1iVAUgAFrx7CQXBjJzn1R/T59xnlyIm0vxXJ/MZq1P/PRaBSxXiS1T6ywRXwPj1
         X8MF/hdM0sJXy5xbVHqXT7HyoB4/KkSbTLq2qIKWregbdKfFBOBVKg13ggiW8Y8pOmBb
         kr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OMd59Irm/owovVce7ql4HUYwGx76nu+YdPgHJrTkxEU=;
        b=Igrwk4D2zQSzZkyzKW/dRA81VDUM7+M5xlsImu9isqkgNBudNEJS51hatPYY0QweF7
         /FI6kHfxVJP6vrxBPwwFt+WOHaouoNiC/aM4nvSoQT6mg3CqGOEyBHv482Yp4WXexD6S
         PPP3uupa3okjkQE3+l/YelBLi3jECokdlz4sOzn31IfJuXSb+FRvU8cb7E9Fg0muk4+B
         kuZgCdD1IQIKio6ItMVrHVH0tbUxreuJhvmpi1ROzm/XH9v2I8HIG00R+k9tjSU/uP7H
         BclSOAUWw861sqeyGLAbjpVCS0UgoYypiaKAISwxb6rAuKIPbRYpdPStbxBMiCAF1rbL
         bPkw==
X-Gm-Message-State: AOAM531lLk1wAEX1VxJy4OpQiY5nKvAENE+f5wHRhl1afjGVaxSyGBak
        7TXGs60RsJ8ZKJx99kfcHCgBZw==
X-Google-Smtp-Source: ABdhPJwGmmWoEcIw1EAKUecYOc5e1qgJWBFJh77colSd8zlfxnDP6c6xZJF310VSfuWX2xkMVKOQIQ==
X-Received: by 2002:a2e:9692:: with SMTP id q18mr15594083lji.69.1612902539030;
        Tue, 09 Feb 2021 12:28:59 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id o19sm2680449lfu.182.2021.02.09.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:28:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
Date:   Tue,  9 Feb 2021 23:28:48 +0300
Message-Id: <20210209202849.1148569-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e4320629d687..0874350f66fe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2967,6 +2967,11 @@ qup_spi0_cs: qup-spi0-cs {
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
@@ -2978,6 +2983,11 @@ qup_spi1_cs: qup-spi1-cs {
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
@@ -2989,6 +2999,11 @@ qup_spi2_cs: qup-spi2-cs {
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
@@ -3000,6 +3015,11 @@ qup_spi3_cs: qup-spi3-cs {
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
@@ -3011,6 +3031,11 @@ qup_spi4_cs: qup-spi4-cs {
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
@@ -3022,6 +3047,11 @@ qup_spi5_cs: qup-spi5-cs {
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
@@ -3033,6 +3063,11 @@ qup_spi6_cs: qup-spi6-cs {
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
@@ -3044,6 +3079,11 @@ qup_spi7_cs: qup-spi7-cs {
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
@@ -3055,6 +3095,11 @@ qup_spi8_cs: qup-spi8-cs {
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
@@ -3066,6 +3111,11 @@ qup_spi9_cs: qup-spi9-cs {
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
@@ -3077,6 +3127,11 @@ qup_spi10_cs: qup-spi10-cs {
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
@@ -3088,6 +3143,11 @@ qup_spi11_cs: qup-spi11-cs {
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
@@ -3099,6 +3159,11 @@ qup_spi12_cs: qup-spi12-cs {
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
@@ -3110,6 +3175,11 @@ qup_spi13_cs: qup-spi13-cs {
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
@@ -3121,6 +3191,11 @@ qup_spi14_cs: qup-spi14-cs {
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
@@ -3132,6 +3207,11 @@ qup_spi15_cs: qup-spi15-cs {
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
@@ -3143,6 +3223,11 @@ qup_spi16_cs: qup-spi16-cs {
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
@@ -3154,6 +3239,11 @@ qup_spi17_cs: qup-spi17-cs {
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
@@ -3165,6 +3255,11 @@ qup_spi18_cs: qup-spi18-cs {
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
@@ -3176,6 +3271,11 @@ qup_spi19_cs: qup-spi19-cs {
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

