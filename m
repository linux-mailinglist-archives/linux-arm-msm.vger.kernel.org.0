Return-Path: <linux-arm-msm+bounces-8656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BA83F2C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 02:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987AF1F22D7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 01:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E9417F0;
	Sun, 28 Jan 2024 01:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDS5NeEf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66561392
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 01:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706405578; cv=none; b=IC1nEsFRT01C5YV7H9p+qosMA85v7KHPuhHw7xoveQBdkyXNgEQoS2Mv0zDnE4B5tQfbIkTCmColfEjXxkXnM/hP+5abb0pZtu/9SiVJ8clt1hTIM+NmtVDaXk4zvYgi3XKi9o1WVaANiZ6C8Gwhl44kjVo5jeTPkxKDD6HEYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706405578; c=relaxed/simple;
	bh=WzRV5UwguRg3yqh8XhEyWybsBQ89ZMhXxPJg2bTcmR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlOxCOyyUCv8761eHHbx6nmtQolCNjtJczjp9VSHHgZ3uYUTOD2F61be+H3sJYf7EcKytEgS23AQH73cZB8No+PX33IbZ8wMsFnqOqzxtWb5MhGzYm+P26kvv4wNXFxd8xO2GJdBRhVqJk9heOn6R0kmn6YXM9hUcN/4Rr/HB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDS5NeEf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cf1288097aso22128281fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 17:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706405574; x=1707010374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4ZziGlR1loZQXW8MveG0VqbDBWt6oy23J9j7qs10Ew=;
        b=HDS5NeEf6obStOPQkxNOJLfPnqtAnHsVNwLPHXh1MNAHLRfKFlMEz7iAfz+8ahJJJF
         SOP3A5j31yPwejBF27vEH8jLQcPJb1yOT1vrIAzRbrRkdzWkqROGBzfzlGCnRk07f4xa
         FsRBuP4TRRtuCVMTl88+FfnIB8Stijjp7VcY10Opp9ikFIMqAmA5Ca2RZOBKVATD2BKL
         5lMZParxaJBtH3Cd8SnRF5mjBffBDTbt7UmSkGVX0a0eEmgVw+oCn4oVcH8MGZSQoONK
         zk6gES5jOcsHC7AvIpw+j5H2BQHIDYVe7gexIgBjXcFf0kxwW3ARQRN5rYdHcOOWh4c2
         2uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706405574; x=1707010374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4ZziGlR1loZQXW8MveG0VqbDBWt6oy23J9j7qs10Ew=;
        b=E7kIduTVFXHBHOqPqvJLubVYT7qilqda71phPfIodfkA8I1Ag9uv7XL2IokBo0qeIM
         FMg99E3pnN+Ae5KZrmvsJP9NqDgfz1iA0l6SfzflyHqXPOvkWmQoxdOMvPL/Z8ql0EUn
         O3dUKGgszIXWhJgan26iQhYDkiQxJe4Edo4ieah7v5UvA68I8i44eKk//cEahBU3Ven3
         353Puv4dVC2nVBk/vjh9gLkrZ2rZgv7dS+Aj9LdnFSoeHAz9y7c85PRDVJ5FAHc0Suml
         VDcDeY7gc9zQ3D2KAqlnldCcueS6U7TAj48Qp4xoS8lRRB+AGTYMdDRabOoFzMsAl2Yh
         Q/uw==
X-Gm-Message-State: AOJu0YwcSYFwSvbGiJKiOZTTwmRdAYAL+xOQ7NYKvd7Axj4IdR7CftZL
	ZCvp2+mT1bazNlZKp0UtdX/pJWJm6cDJZEIM1SjKjOGSnJqBQnmInz1zYuKFgEk=
X-Google-Smtp-Source: AGHT+IGGE1L2E1TqJMhsTk56JyfTn7DXk6r0hSMOmWRnntSr7eZN2z39cO1UFocnQ7nI6stHFNV+9g==
X-Received: by 2002:a2e:9b9a:0:b0:2ce:e49:5b38 with SMTP id z26-20020a2e9b9a000000b002ce0e495b38mr1693406lji.29.1706405574495;
        Sat, 27 Jan 2024 17:32:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y14-20020a2e95ce000000b002cef959509asm662150ljh.24.2024.01.27.17.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 17:32:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 03:32:45 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: rename PM2250 to PM4125
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-pm2250-pm4125-rename-v2-2-d51987e9f83a@linaro.org>
References: <20240128-pm2250-pm4125-rename-v2-0-d51987e9f83a@linaro.org>
In-Reply-To: <20240128-pm2250-pm4125-rename-v2-0-d51987e9f83a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9063;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WzRV5UwguRg3yqh8XhEyWybsBQ89ZMhXxPJg2bTcmR8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlta7EsYYPJDxosOWIqD8YuRnqAlnjj268Phlgy
 bKea2DUDfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbWuxAAKCRCLPIo+Aiko
 1QKHB/48eT5/J/X8dd4lHU4EKXNEk5UcQAgWXmakmLuOFX9+nd7j68A5uOuSeB/Em9H3ZyG0E2s
 y7Susc2Kt7zG2o7AfUlkjDSz/qPVxBvq3V5n+qpygrmhPCNAk3MDb5JBSAmViHjliMRRD7H5IUq
 TrzQR9Vzmok4ddqMd7gM3etdfemAxsA2rjCTvB1r5gwIQKPXhyFItnsV/YOjHviUXxJvFxYOjRP
 652FupBydj1hLs6/NsmeCQMoIw/2FDSB3ROwraFZ2GO6WJtv3hcA4GoImEdsGzHN+lmZ+06iX0+
 gcspgSVl1MmIoVu3pkRRLqlISZdMfqM2/4/1CAqKYR40dexo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It seems, the only actual mentions of PM2250 can be found are related to
the Qualcomm RB1 platform. However even RB1 schematics use PM4125 as a
PMIC name. Rename PM2250 to PM4125 to follow the documentation.

Note, this doesn't change the compatible strings. There was a previous
argument regarding renaming of compat strings.

Fixes: c309b9a54039 ("arm64: dts: qcom: Add initial PM2250 device tree")
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/{pm2250.dtsi => pm4125.dtsi}     |  8 +--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 78 +++++++++++-----------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm2250.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
similarity index 91%
rename from arch/arm64/boot/dts/qcom/pm2250.dtsi
rename to arch/arm64/boot/dts/qcom/pm4125.dtsi
index 5f1d15db5c99..d886a9e4b091 100644
--- a/arch/arm64/boot/dts/qcom/pm2250.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -19,7 +19,7 @@ pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x800>;
 
-			pm2250_pwrkey: pwrkey {
+			pm4125_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
 				interrupts-extended = <&spmi_bus 0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
 				linux,code = <KEY_POWER>;
@@ -27,7 +27,7 @@ pm2250_pwrkey: pwrkey {
 				bias-pull-up;
 			};
 
-			pm2250_resin: resin {
+			pm4125_resin: resin {
 				compatible = "qcom,pm8941-resin";
 				interrupts-extended = <&spmi_bus 0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
 				debounce = <15625>;
@@ -43,11 +43,11 @@ rtc@6000 {
 			interrupts-extended = <&spmi_bus 0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pm2250_gpios: gpio@c000 {
+		pm4125_gpios: gpio@c000 {
 			compatible = "qcom,pm2250-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
-			gpio-ranges = <&pm2250_gpios 0 0 10>;
+			gpio-ranges = <&pm4125_gpios 0 0 10>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index aa53b6af6d9c..64b2ab286279 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/leds/common.h>
 #include "qcm2290.dtsi"
-#include "pm2250.dtsi"
+#include "pm4125.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Robotics RB1";
@@ -226,7 +226,7 @@ &mdss {
 };
 
 &mdss_dsi0 {
-	vdda-supply = <&pm2250_l5>;
+	vdda-supply = <&pm4125_l5>;
 	status = "okay";
 };
 
@@ -239,7 +239,7 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
-&pm2250_resin {
+&pm4125_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
 };
@@ -263,23 +263,23 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm2250_s3>;
+		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
 		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm2250_s4>;
+		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
 
 		/*
 		 * S1 - VDD_APC
 		 * S2 - VDD_CX
 		 */
 
-		pm2250_s3: s3 {
+		pm4125_s3: s3 {
 			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
 			regulator-min-microvolt = <1352000>;
 			regulator-max-microvolt = <1352000>;
 			regulator-boot-on;
 		};
 
-		pm2250_s4: s4 {
+		pm4125_s4: s4 {
 			/* 1.2V-2.35V -> 2.05V (Power tree requirements) */
 			regulator-min-microvolt = <2072000>;
 			regulator-max-microvolt = <2072000>;
@@ -288,7 +288,7 @@ pm2250_s4: s4 {
 
 		/* L1 - VDD_MX */
 
-		pm2250_l2: l2 {
+		pm4125_l2: l2 {
 			/* LPDDR4X VDD2 */
 			regulator-min-microvolt = <1136000>;
 			regulator-max-microvolt = <1136000>;
@@ -296,7 +296,7 @@ pm2250_l2: l2 {
 			regulator-boot-on;
 		};
 
-		pm2250_l3: l3 {
+		pm4125_l3: l3 {
 			/* LPDDR4X VDDQ */
 			regulator-min-microvolt = <616000>;
 			regulator-max-microvolt = <616000>;
@@ -304,14 +304,14 @@ pm2250_l3: l3 {
 			regulator-boot-on;
 		};
 
-		pm2250_l4: l4 {
+		pm4125_l4: l4 {
 			/* max = 3.05V -> max = 2.7 to disable 3V signaling (SDHCI2) */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2700000>;
 			regulator-allow-set-load;
 		};
 
-		pm2250_l5: l5 {
+		pm4125_l5: l5 {
 			/* CSI/DSI */
 			regulator-min-microvolt = <1232000>;
 			regulator-max-microvolt = <1232000>;
@@ -319,7 +319,7 @@ pm2250_l5: l5 {
 			regulator-boot-on;
 		};
 
-		pm2250_l6: l6 {
+		pm4125_l6: l6 {
 			/* DRAM PLL */
 			regulator-min-microvolt = <928000>;
 			regulator-max-microvolt = <928000>;
@@ -327,7 +327,7 @@ pm2250_l6: l6 {
 			regulator-boot-on;
 		};
 
-		pm2250_l7: l7 {
+		pm4125_l7: l7 {
 			/* Wi-Fi CX/MX */
 			regulator-min-microvolt = <664000>;
 			regulator-max-microvolt = <664000>;
@@ -338,20 +338,20 @@ pm2250_l7: l7 {
 		 * L9 - VDD_LPI_MX
 		 */
 
-		pm2250_l10: l10 {
+		pm4125_l10: l10 {
 			/* Wi-Fi RFA */
 			regulator-min-microvolt = <1304000>;
 			regulator-max-microvolt = <1304000>;
 		};
 
-		pm2250_l11: l11 {
+		pm4125_l11: l11 {
 			/* GPS RF1 */
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
 			regulator-boot-on;
 		};
 
-		pm2250_l12: l12 {
+		pm4125_l12: l12 {
 			/* USB PHYs */
 			regulator-min-microvolt = <928000>;
 			regulator-max-microvolt = <928000>;
@@ -359,7 +359,7 @@ pm2250_l12: l12 {
 			regulator-boot-on;
 		};
 
-		pm2250_l13: l13 {
+		pm4125_l13: l13 {
 			/* USB/QFPROM/PLLs */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
@@ -367,7 +367,7 @@ pm2250_l13: l13 {
 			regulator-boot-on;
 		};
 
-		pm2250_l14: l14 {
+		pm4125_l14: l14 {
 			/* SDHCI1 VQMMC */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
@@ -376,7 +376,7 @@ pm2250_l14: l14 {
 			regulator-always-on;
 		};
 
-		pm2250_l15: l15 {
+		pm4125_l15: l15 {
 			/* WCD/DSI/BT VDDIO */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
@@ -385,38 +385,38 @@ pm2250_l15: l15 {
 			regulator-boot-on;
 		};
 
-		pm2250_l16: l16 {
+		pm4125_l16: l16 {
 			/* GPS RF2 */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-boot-on;
 		};
 
-		pm2250_l17: l17 {
+		pm4125_l17: l17 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 		};
 
-		pm2250_l18: l18 {
+		pm4125_l18: l18 {
 			/* VDD_PXn */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 
-		pm2250_l19: l19 {
+		pm4125_l19: l19 {
 			/* VDD_PXn */
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 
-		pm2250_l20: l20 {
+		pm4125_l20: l20 {
 			/* SDHCI1 VMMC */
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <3600000>;
 			regulator-allow-set-load;
 		};
 
-		pm2250_l21: l21 {
+		pm4125_l21: l21 {
 			/* SDHCI2 VMMC */
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <3300000>;
@@ -424,7 +424,7 @@ pm2250_l21: l21 {
 			regulator-boot-on;
 		};
 
-		pm2250_l22: l22 {
+		pm4125_l22: l22 {
 			/* Wi-Fi */
 			regulator-min-microvolt = <3312000>;
 			regulator-max-microvolt = <3312000>;
@@ -433,8 +433,8 @@ pm2250_l22: l22 {
 };
 
 &sdhc_1 {
-	vmmc-supply = <&pm2250_l20>;
-	vqmmc-supply = <&pm2250_l14>;
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
 	pinctrl-0 = <&sdc1_state_on>;
 	pinctrl-1 = <&sdc1_state_off>;
 	pinctrl-names = "default", "sleep";
@@ -446,8 +446,8 @@ &sdhc_1 {
 };
 
 &sdhc_2 {
-	vmmc-supply = <&pm2250_l21>;
-	vqmmc-supply = <&pm2250_l4>;
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
 	cd-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&sdc2_state_on &sd_det_in_on>;
 	pinctrl-1 = <&sdc2_state_off &sd_det_in_off>;
@@ -518,8 +518,8 @@ &usb {
 };
 
 &usb_qmpphy {
-	vdda-phy-supply = <&pm2250_l12>;
-	vdda-pll-supply = <&pm2250_l13>;
+	vdda-phy-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
 	status = "okay";
 };
 
@@ -528,17 +528,17 @@ &usb_dwc3 {
 };
 
 &usb_hsphy {
-	vdd-supply = <&pm2250_l12>;
-	vdda-pll-supply = <&pm2250_l13>;
-	vdda-phy-dpdm-supply = <&pm2250_l21>;
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
 	status = "okay";
 };
 
 &wifi {
-	vdd-0.8-cx-mx-supply = <&pm2250_l7>;
-	vdd-1.8-xo-supply = <&pm2250_l13>;
-	vdd-1.3-rfa-supply = <&pm2250_l10>;
-	vdd-3.3-ch0-supply = <&pm2250_l22>;
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&pm4125_l13>;
+	vdd-1.3-rfa-supply = <&pm4125_l10>;
+	vdd-3.3-ch0-supply = <&pm4125_l22>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
 	status = "okay";
 };

-- 
2.39.2


