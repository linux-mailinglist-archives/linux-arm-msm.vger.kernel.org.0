Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1756316822
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 14:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhBJNhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 08:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhBJNhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 08:37:22 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE1CC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:40 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id d24so2900925lfs.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kBup+sCMejEFRtQXZzY+a0DRzj+EnqeD9AqU4sYvF24=;
        b=JAtfdbOjBsNwvuKllkrr9IF+nl8n9ZH3RKxa6BcrNWX4Ss3QukTpXIsLYKB7PD2nDv
         Ju+c7b+CoNm9KREVzCXNOmj2VS7giij+jji7XKUvoAc+XXsWtaJxWqhsb9O4fFdmXxio
         hPdD6TL9m4whnuSbOhEk2emiQt3YPmRHi8QD6bm1Is/uvNv5YN9Ic2SHKnNg532hOMj9
         auy66VpiY3f2fc29xrGUdKgFmLaB9hOiktO3C+/LekD1kB2fZ7EJbkFgjZecFMspeHtK
         CX/5+ceg6zYifdGFMtGwEqvh1xccKOWg11lEWixsa3SvLQ5BKc31m5XIs0aoI9lwJGwZ
         N7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kBup+sCMejEFRtQXZzY+a0DRzj+EnqeD9AqU4sYvF24=;
        b=eX6G4jiNjsKjSUck/lUd1EPksB78uA4naF+7z+iqyc4osPvlCpx/gfKR1LNAQsqtHi
         oohQCNsdePlkgZSFIANcmfKRR2a+rGDVcOkmSGcXVJ+HOC3AZuAA1HJcgVH3GiyCfrtX
         9fsSO3rTGHENWYOgHWDEg4bAPKfqUZP703XZS3SsyxDvZKTLkEWKuodMvGGBODUJx3iF
         k/xiqP2qOLg7L++20ln9GI/Cl0gQEcd2VDgaAWsFqo9pnghmb2QIBOuK7c+YsFHM4mMq
         vLBOTeUvwFUNYy0xhOTkCzghfUfN1XflMdL8ieR6Zk5W0svM+IMs8OuO882VQvwNaqK3
         SZYA==
X-Gm-Message-State: AOAM533PPvMPQOIt2ArYdiAlFH8pQtO6zwDyFEVuahGOpQg4Y8g5PDi6
        Z7WtJK0y7nsCt4ebQhfz5FcOVBQ1z7/VB5fv
X-Google-Smtp-Source: ABdhPJwtAfLLqnAtpu+Uf2YO9wxcvBy4QU7oVmr4JwyvapqQSUz+lvBNHcM3n0GKV40X2iCNZRsYwA==
X-Received: by 2002:a05:6512:1094:: with SMTP id j20mr1819069lfg.442.1612964199409;
        Wed, 10 Feb 2021 05:36:39 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id c8sm332629lfb.168.2021.02.10.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:36:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/4] arm64: dts: qcom: sm8250: further split of spi pinctrl config
Date:   Wed, 10 Feb 2021 16:34:56 +0300
Message-Id: <20210210133458.1201066-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split "default" device tree nodes into common "data-clk" nodes and "cs"
nodes which might differ from board to board depending on how the slave
chips are wired.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   9 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 220 ++++++++++++++---------
 2 files changed, 148 insertions(+), 81 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 443206f64061..638231f48388 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -952,6 +952,8 @@ codec {
 /* CAN */
 &spi0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
 
 	can@0 {
 		compatible = "microchip,mcp2518fd";
@@ -1354,7 +1356,12 @@ &vamacro {
 };
 
 /* PINCTRL - additions to nodes defined in sm8250.dtsi */
-&qup_spi0_default {
+&qup_spi0_cs {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&qup_spi0_data_clk {
 	drive-strength = <6>;
 	bias-disable;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 51d103671759..5571324641f0 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -548,8 +548,6 @@ spi14: spi@880000 {
 				reg = <0 0x00880000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi14_default>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -576,8 +574,6 @@ spi15: spi@884000 {
 				reg = <0 0x00884000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi15_default>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -604,8 +600,6 @@ spi16: spi@888000 {
 				reg = <0 0x00888000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi16_default>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -632,8 +626,6 @@ spi17: spi@88c000 {
 				reg = <0 0x0088c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi17_default>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -673,8 +665,6 @@ spi18: spi@890000 {
 				reg = <0 0x00890000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi18_default>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -714,8 +704,6 @@ spi19: spi@894000 {
 				reg = <0 0x00894000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi19_default>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -755,8 +743,6 @@ spi0: spi@980000 {
 				reg = <0 0x00980000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -783,8 +769,6 @@ spi1: spi@984000 {
 				reg = <0 0x00984000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -811,8 +795,6 @@ spi2: spi@988000 {
 				reg = <0 0x00988000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -852,8 +834,6 @@ spi3: spi@98c000 {
 				reg = <0 0x0098c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -880,8 +860,6 @@ spi4: spi@990000 {
 				reg = <0 0x00990000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -908,8 +886,6 @@ spi5: spi@994000 {
 				reg = <0 0x00994000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -936,8 +912,6 @@ spi6: spi@998000 {
 				reg = <0 0x00998000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi6_default>;
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -977,8 +951,6 @@ spi7: spi@99c000 {
 				reg = <0 0x0099c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi7_default>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1018,8 +990,6 @@ spi8: spi@a80000 {
 				reg = <0 0x00a80000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi8_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1046,8 +1016,6 @@ spi9: spi@a84000 {
 				reg = <0 0x00a84000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi9_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1074,8 +1042,6 @@ spi10: spi@a88000 {
 				reg = <0 0x00a88000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi10_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1102,8 +1068,6 @@ spi11: spi@a8c000 {
 				reg = <0 0x00a8c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi11_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1130,8 +1094,6 @@ spi12: spi@a90000 {
 				reg = <0 0x00a90000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi12_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1171,8 +1133,6 @@ spi13: spi@a94000 {
 				reg = <0 0x00a94000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi13_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2983,123 +2943,223 @@ config {
 				};
 			};
 
-			qup_spi0_default: qup-spi0-default {
+			qup_spi0_cs: qup-spi0-cs {
+				pins = "gpio31";
+				function = "qup0";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk {
 				pins = "gpio28", "gpio29",
-				       "gpio30", "gpio31";
+				       "gpio30";
 				function = "qup0";
 			};
 
-			qup_spi1_default: qup-spi1-default {
+			qup_spi1_cs: qup-spi1-cs {
+				pins = "gpio7";
+				function = "qup1";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk {
 				pins = "gpio4", "gpio5",
-				       "gpio6", "gpio7";
+				       "gpio6";
 				function = "qup1";
 			};
 
-			qup_spi2_default: qup-spi2-default {
+			qup_spi2_cs: qup-spi2-cs {
+				pins = "gpio118";
+				function = "qup2";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk {
 				pins = "gpio115", "gpio116",
-				       "gpio117", "gpio118";
+				       "gpio117";
 				function = "qup2";
 			};
 
-			qup_spi3_default: qup-spi3-default {
+			qup_spi3_cs: qup-spi3-cs {
+				pins = "gpio122";
+				function = "qup3";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk {
 				pins = "gpio119", "gpio120",
-				       "gpio121", "gpio122";
+				       "gpio121";
 				function = "qup3";
 			};
 
-			qup_spi4_default: qup-spi4-default {
+			qup_spi4_cs: qup-spi4-cs {
+				pins = "gpio11";
+				function = "qup4";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk {
 				pins = "gpio8", "gpio9",
-				       "gpio10", "gpio11";
+				       "gpio10";
 				function = "qup4";
 			};
 
-			qup_spi5_default: qup-spi5-default {
+			qup_spi5_cs: qup-spi5-cs {
+				pins = "gpio15";
+				function = "qup5";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk {
 				pins = "gpio12", "gpio13",
-				       "gpio14", "gpio15";
+				       "gpio14";
 				function = "qup5";
 			};
 
-			qup_spi6_default: qup-spi6-default {
+			qup_spi6_cs: qup-spi6-cs {
+				pins = "gpio19";
+				function = "qup6";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk {
 				pins = "gpio16", "gpio17",
-				       "gpio18", "gpio19";
+				       "gpio18";
 				function = "qup6";
 			};
 
-			qup_spi7_default: qup-spi7-default {
+			qup_spi7_cs: qup-spi7-cs {
+				pins = "gpio23";
+				function = "qup7";
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk {
 				pins = "gpio20", "gpio21",
-				       "gpio22", "gpio23";
+				       "gpio22";
 				function = "qup7";
 			};
 
-			qup_spi8_default: qup-spi8-default {
+			qup_spi8_cs: qup-spi8-cs {
+				pins = "gpio27";
+				function = "qup8";
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk {
 				pins = "gpio24", "gpio25",
-				       "gpio26", "gpio27";
+				       "gpio26";
 				function = "qup8";
 			};
 
-			qup_spi9_default: qup-spi9-default {
+			qup_spi9_cs: qup-spi9-cs {
+				pins = "gpio128";
+				function = "qup9";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk {
 				pins = "gpio125", "gpio126",
-				       "gpio127", "gpio128";
+				       "gpio127";
 				function = "qup9";
 			};
 
-			qup_spi10_default: qup-spi10-default {
+			qup_spi10_cs: qup-spi10-cs {
+				pins = "gpio132";
+				function = "qup10";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk {
 				pins = "gpio129", "gpio130",
-				       "gpio131", "gpio132";
+				       "gpio131";
 				function = "qup10";
 			};
 
-			qup_spi11_default: qup-spi11-default {
+			qup_spi11_cs: qup-spi11-cs {
+				pins = "gpio63";
+				function = "qup11";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk {
 				pins = "gpio60", "gpio61",
-				       "gpio62", "gpio63";
+				       "gpio62";
 				function = "qup11";
 			};
 
-			qup_spi12_default: qup-spi12-default {
+			qup_spi12_cs: qup-spi12-cs {
+				pins = "gpio35";
+				function = "qup12";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk {
 				pins = "gpio32", "gpio33",
-				       "gpio34", "gpio35";
+				       "gpio34";
 				function = "qup12";
 			};
 
-			qup_spi13_default: qup-spi13-default {
+			qup_spi13_cs: qup-spi13-cs {
+				pins = "gpio39";
+				function = "qup13";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk {
 				pins = "gpio36", "gpio37",
-				       "gpio38", "gpio39";
+				       "gpio38";
 				function = "qup13";
 			};
 
-			qup_spi14_default: qup-spi14-default {
+			qup_spi14_cs: qup-spi14-cs {
+				pins = "gpio43";
+				function = "qup14";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk {
 				pins = "gpio40", "gpio41",
-				       "gpio42", "gpio43";
+				       "gpio42";
 				function = "qup14";
 			};
 
-			qup_spi15_default: qup-spi15-default {
+			qup_spi15_cs: qup-spi15-cs {
+				pins = "gpio47";
+				function = "qup15";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk {
 				pins = "gpio44", "gpio45",
-				       "gpio46", "gpio47";
+				       "gpio46";
 				function = "qup15";
 			};
 
-			qup_spi16_default: qup-spi16-default {
+			qup_spi16_cs: qup-spi16-cs {
+				pins = "gpio51";
+				function = "qup16";
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk {
 				pins = "gpio48", "gpio49",
-				       "gpio50", "gpio51";
+				       "gpio50";
 				function = "qup16";
 			};
 
-			qup_spi17_default: qup-spi17-default {
+			qup_spi17_cs: qup-spi17-cs {
+				pins = "gpio55";
+				function = "qup17";
+			};
+
+			qup_spi17_data_clk: qup-spi17-data-clk {
 				pins = "gpio52", "gpio53",
-				       "gpio54", "gpio55";
+				       "gpio54";
 				function = "qup17";
 			};
 
-			qup_spi18_default: qup-spi18-default {
+			qup_spi18_cs: qup-spi18-cs {
+				pins = "gpio59";
+				function = "qup18";
+			};
+
+			qup_spi18_data_clk: qup-spi18-data-clk {
 				pins = "gpio56", "gpio57",
-				       "gpio58", "gpio59";
+				       "gpio58";
 				function = "qup18";
 			};
 
-			qup_spi19_default: qup-spi19-default {
+			qup_spi19_cs: qup-spi19-cs {
+				pins = "gpio3";
+				function = "qup19";
+			};
+
+			qup_spi19_data_clk: qup-spi19-data-clk {
 				pins = "gpio0", "gpio1",
-				       "gpio2", "gpio3";
+				       "gpio2";
 				function = "qup19";
 			};
 
-- 
2.30.0

