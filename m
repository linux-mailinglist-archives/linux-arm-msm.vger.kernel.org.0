Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF890316821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 14:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhBJNh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 08:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhBJNhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 08:37:17 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1593C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:35 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id c18so2825041ljd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aEjgbQ4louFcHEKPjuOPOwDLbEqUCZLI98DdvpgiOt0=;
        b=ZAPNNRkjIckBGyYA/DFh+fSTljsaVhNN0TgvkVI9WTzP8+PTJR11eGfJNnC1BgBX0d
         hK5wVMRfHi6eEhP9RncbyzA1gCx0Zmy1slL+1IUZai6qkVfkuj8FviSgUgQyPTsFQ1ii
         D2uVyMHHyfRv7fo6r0BRzO2zt2nt6Q8LlqnVPyV8f/SMThJMRHS4zt6re4uBn6wsza/d
         CzM393UNWEL/CikFVMUsCdzKaS9882E5RLw7zq0g0GaG5ufMZuZ0d/+2Cka6+4P4P2B1
         oy4CwuIhJoBWfdp2FwcrY91rYLR7/H5AAvLtx9vHTt/q1tLkw+EHx2svZ4fomL2mAe95
         34OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aEjgbQ4louFcHEKPjuOPOwDLbEqUCZLI98DdvpgiOt0=;
        b=MlW+Nf/vYXS9kx7YWL2URi995sm6962SqdVsDUMtcczj2K4nmPBr3gf7CnTpaLU0ug
         7n7vd+c9J8I+m4THkkLJ1lWxUHBDQ+qnlUSbbcqvOH6ww2jqBAzmVhnU08BIvmbcKDl/
         jOV7w1a0Uzc7SMGVhvKhvf+F14Bxx+dGET9QVke925Kl14jfXP4fF3LT+YdyE30PBrCM
         KwK9ogkmXMY5QhSmqJ505uEwRdeXz8htm8m4PkRum1vvOiYsQYSMYYsPfA3dakCLKhIM
         7S24JjBt8KcfO3xCk9AB06duGZop4SXNRDRqqV5Ep6dcz9W1mXTXo5fCl4t5JX03yESH
         /OxA==
X-Gm-Message-State: AOAM531JSK/1xoQr1gYr74153O/eldvu3hkJEBUHzsnJtN2OuBBZRhpL
        tuItJyRkOu9dqXv1hNbjBeW02g==
X-Google-Smtp-Source: ABdhPJy/tAWYBf3Tbi8LWU+VCJ1yqSO1Ggw788EIUFQkb1WE61Ol5aZnbqVutH/We7I0XGY5PTSqVw==
X-Received: by 2002:a2e:3019:: with SMTP id w25mr2019432ljw.430.1612964194425;
        Wed, 10 Feb 2021 05:36:34 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id c8sm332629lfb.168.2021.02.10.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:36:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
Date:   Wed, 10 Feb 2021 16:34:55 +0300
Message-Id: <20210210133458.1201066-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed on linux-arm-msm list, start splitting sm8250 pinctrl
settings into generic and board-specific parts. The first part to
receive such treatment is the spi, so split spi pinconf to the board
device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   6 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 300 +++++------------------
 2 files changed, 66 insertions(+), 240 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 2f0528d01299..443206f64061 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1352,3 +1352,9 @@ &vamacro {
 	vdd-micb-supply = <&vreg_s4a_1p8>;
 	qcom,dmic-sample-rate = <600000>;
 };
+
+/* PINCTRL - additions to nodes defined in sm8250.dtsi */
+&qup_spi0_default {
+	drive-strength = <6>;
+	bias-disable;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..51d103671759 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2984,303 +2984,123 @@ config {
 			};
 
 			qup_spi0_default: qup-spi0-default {
-				mux {
-					pins = "gpio28", "gpio29",
-					       "gpio30", "gpio31";
-					function = "qup0";
-				};
-
-				config {
-					pins = "gpio28", "gpio29",
-					       "gpio30", "gpio31";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio28", "gpio29",
+				       "gpio30", "gpio31";
+				function = "qup0";
 			};
 
 			qup_spi1_default: qup-spi1-default {
-				mux {
-					pins = "gpio4", "gpio5",
-					       "gpio6", "gpio7";
-					function = "qup1";
-				};
-
-				config {
-					pins = "gpio4", "gpio5",
-					       "gpio6", "gpio7";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio4", "gpio5",
+				       "gpio6", "gpio7";
+				function = "qup1";
 			};
 
 			qup_spi2_default: qup-spi2-default {
-				mux {
-					pins = "gpio115", "gpio116",
-					       "gpio117", "gpio118";
-					function = "qup2";
-				};
-
-				config {
-					pins = "gpio115", "gpio116",
-					       "gpio117", "gpio118";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio115", "gpio116",
+				       "gpio117", "gpio118";
+				function = "qup2";
 			};
 
 			qup_spi3_default: qup-spi3-default {
-				mux {
-					pins = "gpio119", "gpio120",
-					       "gpio121", "gpio122";
-					function = "qup3";
-				};
-
-				config {
-					pins = "gpio119", "gpio120",
-					       "gpio121", "gpio122";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio119", "gpio120",
+				       "gpio121", "gpio122";
+				function = "qup3";
 			};
 
 			qup_spi4_default: qup-spi4-default {
-				mux {
-					pins = "gpio8", "gpio9",
-					       "gpio10", "gpio11";
-					function = "qup4";
-				};
-
-				config {
-					pins = "gpio8", "gpio9",
-					       "gpio10", "gpio11";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio8", "gpio9",
+				       "gpio10", "gpio11";
+				function = "qup4";
 			};
 
 			qup_spi5_default: qup-spi5-default {
-				mux {
-					pins = "gpio12", "gpio13",
-					       "gpio14", "gpio15";
-					function = "qup5";
-				};
-
-				config {
-					pins = "gpio12", "gpio13",
-					       "gpio14", "gpio15";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio12", "gpio13",
+				       "gpio14", "gpio15";
+				function = "qup5";
 			};
 
 			qup_spi6_default: qup-spi6-default {
-				mux {
-					pins = "gpio16", "gpio17",
-					       "gpio18", "gpio19";
-					function = "qup6";
-				};
-
-				config {
-					pins = "gpio16", "gpio17",
-					       "gpio18", "gpio19";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio16", "gpio17",
+				       "gpio18", "gpio19";
+				function = "qup6";
 			};
 
 			qup_spi7_default: qup-spi7-default {
-				mux {
-					pins = "gpio20", "gpio21",
-					       "gpio22", "gpio23";
-					function = "qup7";
-				};
-
-				config {
-					pins = "gpio20", "gpio21",
-					       "gpio22", "gpio23";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio20", "gpio21",
+				       "gpio22", "gpio23";
+				function = "qup7";
 			};
 
 			qup_spi8_default: qup-spi8-default {
-				mux {
-					pins = "gpio24", "gpio25",
-					       "gpio26", "gpio27";
-					function = "qup8";
-				};
-
-				config {
-					pins = "gpio24", "gpio25",
-					       "gpio26", "gpio27";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio24", "gpio25",
+				       "gpio26", "gpio27";
+				function = "qup8";
 			};
 
 			qup_spi9_default: qup-spi9-default {
-				mux {
-					pins = "gpio125", "gpio126",
-					       "gpio127", "gpio128";
-					function = "qup9";
-				};
-
-				config {
-					pins = "gpio125", "gpio126",
-					       "gpio127", "gpio128";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio125", "gpio126",
+				       "gpio127", "gpio128";
+				function = "qup9";
 			};
 
 			qup_spi10_default: qup-spi10-default {
-				mux {
-					pins = "gpio129", "gpio130",
-					       "gpio131", "gpio132";
-					function = "qup10";
-				};
-
-				config {
-					pins = "gpio129", "gpio130",
-					       "gpio131", "gpio132";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio129", "gpio130",
+				       "gpio131", "gpio132";
+				function = "qup10";
 			};
 
 			qup_spi11_default: qup-spi11-default {
-				mux {
-					pins = "gpio60", "gpio61",
-					       "gpio62", "gpio63";
-					function = "qup11";
-				};
-
-				config {
-					pins = "gpio60", "gpio61",
-					       "gpio62", "gpio63";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio60", "gpio61",
+				       "gpio62", "gpio63";
+				function = "qup11";
 			};
 
 			qup_spi12_default: qup-spi12-default {
-				mux {
-					pins = "gpio32", "gpio33",
-					       "gpio34", "gpio35";
-					function = "qup12";
-				};
-
-				config {
-					pins = "gpio32", "gpio33",
-					       "gpio34", "gpio35";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio32", "gpio33",
+				       "gpio34", "gpio35";
+				function = "qup12";
 			};
 
 			qup_spi13_default: qup-spi13-default {
-				mux {
-					pins = "gpio36", "gpio37",
-					       "gpio38", "gpio39";
-					function = "qup13";
-				};
-
-				config {
-					pins = "gpio36", "gpio37",
-					       "gpio38", "gpio39";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio36", "gpio37",
+				       "gpio38", "gpio39";
+				function = "qup13";
 			};
 
 			qup_spi14_default: qup-spi14-default {
-				mux {
-					pins = "gpio40", "gpio41",
-					       "gpio42", "gpio43";
-					function = "qup14";
-				};
-
-				config {
-					pins = "gpio40", "gpio41",
-					       "gpio42", "gpio43";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio40", "gpio41",
+				       "gpio42", "gpio43";
+				function = "qup14";
 			};
 
 			qup_spi15_default: qup-spi15-default {
-				mux {
-					pins = "gpio44", "gpio45",
-					       "gpio46", "gpio47";
-					function = "qup15";
-				};
-
-				config {
-					pins = "gpio44", "gpio45",
-					       "gpio46", "gpio47";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio44", "gpio45",
+				       "gpio46", "gpio47";
+				function = "qup15";
 			};
 
 			qup_spi16_default: qup-spi16-default {
-				mux {
-					pins = "gpio48", "gpio49",
-					       "gpio50", "gpio51";
-					function = "qup16";
-				};
-
-				config {
-					pins = "gpio48", "gpio49",
-					       "gpio50", "gpio51";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio48", "gpio49",
+				       "gpio50", "gpio51";
+				function = "qup16";
 			};
 
 			qup_spi17_default: qup-spi17-default {
-				mux {
-					pins = "gpio52", "gpio53",
-					       "gpio54", "gpio55";
-					function = "qup17";
-				};
-
-				config {
-					pins = "gpio52", "gpio53",
-					       "gpio54", "gpio55";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio52", "gpio53",
+				       "gpio54", "gpio55";
+				function = "qup17";
 			};
 
 			qup_spi18_default: qup-spi18-default {
-				mux {
-					pins = "gpio56", "gpio57",
-					       "gpio58", "gpio59";
-					function = "qup18";
-				};
-
-				config {
-					pins = "gpio56", "gpio57",
-					       "gpio58", "gpio59";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio56", "gpio57",
+				       "gpio58", "gpio59";
+				function = "qup18";
 			};
 
 			qup_spi19_default: qup-spi19-default {
-				mux {
-					pins = "gpio0", "gpio1",
-					       "gpio2", "gpio3";
-					function = "qup19";
-				};
-
-				config {
-					pins = "gpio0", "gpio1",
-					       "gpio2", "gpio3";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio0", "gpio1",
+				       "gpio2", "gpio3";
+				function = "qup19";
 			};
 
 			qup_uart2_default: qup-uart2-default {
-- 
2.30.0

