Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E67C3157F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 21:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhBIUrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 15:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbhBIUji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:39:38 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E397C0698D0
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 12:28:59 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id d24so11139272lfs.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 12:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kzpu0GK1Q1nErhuHEFPW7whQHeBmUphuJKkwW7I1Kfs=;
        b=kHSAX8qa+4mb+N4sPokazGQV013M66SaAk7KOo5ictSIKI8/CAJ2EGpXTyvH2l2tP7
         40ZDR/4OSRNNehVvVtLCSv5TVJuejND98yk+9uIROD/EBZomTr5uTsjRZmwekLzbWcGi
         xBhagy9L5xTbMgnXECor+ySof6XeHbKa4gBonoZrTG6EM0ISo3wngHOMowkyi4sSABDk
         D1eaaIq/qQ3IN9QuLxS83HbQQM1WAj4T11wORdFdMxQA1u71m7kBQBBwr0umJr4BsPuv
         Uv+eorV/+8j+S8d4Uo3xQ3VFo7sJz+CYzjZNldLvr5/AtjqjqG4ugsHf7PUwbX35euLW
         MjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kzpu0GK1Q1nErhuHEFPW7whQHeBmUphuJKkwW7I1Kfs=;
        b=lZBm0ib2qKQtREqgCDMgQazzlGqWVXzbqALKPXWMJ3mSxufGOC4hOLrP157pwW67bD
         57LQ0IR8Vn276YlBFWxzX46pmipminqd8hvQSlpUEkqi5gzMUAs5sibfitknhc3UuHxr
         lBoxe4yYTfGGesmzV39ThV0RNXNf/sVHw8aZbdlCvpAhbJ6Svk9e7ptddh+f61+duKSb
         A40VpfhJGWIfM+V65JMuAAtt23b8kK0zg2wznu24SyuQXLYc2ADgF5Sg7Gkm5V5mvVw0
         p0Qd1UHy6MHdcJY+TRJfZjXoMMxSuiLOrvpEbz+zszv84ukgzXmSq9qYbw6k7ZIZuofU
         Gvfw==
X-Gm-Message-State: AOAM530pV4vY1/soq6RUzqhzGZvqFx0rZj2zPI0FiN/D70ipVDY8Jy5e
        Xi8sGmWJh4ku25ODA/3Klw7Jnq3+AI2HGpYj
X-Google-Smtp-Source: ABdhPJxLso9p4sIowoaULpR4tDRmwjzcb3bRQgoWx2z/yD/GeiQoez18N6j6BcGi0MsR6hicwoeTZg==
X-Received: by 2002:ac2:4ac8:: with SMTP id m8mr15268423lfp.115.1612902537721;
        Tue, 09 Feb 2021 12:28:57 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id o19sm2680449lfu.182.2021.02.09.12.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:28:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/4] arm64: dts: qcom: sm8250: further split of spi pinctrl config
Date:   Tue,  9 Feb 2021 23:28:47 +0300
Message-Id: <20210209202849.1148569-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 201 ++++++++++++++++-------
 2 files changed, 148 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 787da8ccba54..922f329d623a 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -815,7 +815,12 @@ &pm8150_rtc {
 	status = "okay";
 };
 
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
@@ -957,6 +962,8 @@ codec {
 /* CAN */
 &spi0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
 
 	can@0 {
 		compatible = "microchip,mcp2518fd";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 51d103671759..e4320629d687 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -549,7 +549,6 @@ spi14: spi@880000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi14_default>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -577,7 +576,6 @@ spi15: spi@884000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi15_default>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -605,7 +603,6 @@ spi16: spi@888000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi16_default>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -633,7 +630,6 @@ spi17: spi@88c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi17_default>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -674,7 +670,6 @@ spi18: spi@890000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi18_default>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -715,7 +710,6 @@ spi19: spi@894000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi19_default>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -755,8 +749,6 @@ spi0: spi@980000 {
 				reg = <0 0x00980000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -784,7 +776,6 @@ spi1: spi@984000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -812,7 +803,6 @@ spi2: spi@988000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -853,7 +843,6 @@ spi3: spi@98c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -881,7 +870,6 @@ spi4: spi@990000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -909,7 +897,6 @@ spi5: spi@994000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -937,7 +924,6 @@ spi6: spi@998000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi6_default>;
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -978,7 +964,6 @@ spi7: spi@99c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi7_default>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1019,7 +1004,6 @@ spi8: spi@a80000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi8_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1047,7 +1031,6 @@ spi9: spi@a84000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi9_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1075,7 +1058,6 @@ spi10: spi@a88000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi10_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1103,7 +1085,6 @@ spi11: spi@a8c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi11_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1131,7 +1112,6 @@ spi12: spi@a90000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi12_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1172,7 +1152,6 @@ spi13: spi@a94000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_spi13_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2983,123 +2962,223 @@ config {
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

