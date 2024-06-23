Return-Path: <linux-arm-msm+bounces-23748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129C913951
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 11:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96FE1F214A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF43F84A40;
	Sun, 23 Jun 2024 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="d5hAw2Fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29027442F;
	Sun, 23 Jun 2024 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719135754; cv=none; b=BEFcTr5RJVAxEhTon7RHYitixFdcO+Pfsv8dj0qccIcclJpH/DYpAw00sRijFMRxrjriOnrQsmWGiEIlq2Biulwn+gCXojRIBRTpWn+S5/oys+RbTpCreWXFOWOB8z+vrpifRjJzVjOuWfcDC3K6uLDvSbJaOuwse9cw2eUIDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719135754; c=relaxed/simple;
	bh=kaIIElErIyvMao5LsfXWTg+r3egznA0m7XqzZbuzJ/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWcV0iCHlBJsZQZtPoeM1C77rPkDIlB3+mU+nu+xTZwPLb7UPelnxVWOUWDA44whiIsCCbOpNo/dsL9lMNOCXidRFN82ZvA95DZT1EEjON9oXskMtCTdIu0eQCCJr085s7ewbpO96Gn30Gr0hJQicuYnvKiZtgMe0EHEsd59rwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=d5hAw2Fy; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id A690942237;
	Sun, 23 Jun 2024 14:27:09 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1719134830; bh=kaIIElErIyvMao5LsfXWTg+r3egznA0m7XqzZbuzJ/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d5hAw2FytQmToAUf7Q63JQ8oVUtPpOybg+7VczMXPcEcMJhv/JLphiETb62VUMyqL
	 SWZuyvO1evsUgV8D10CjdZfADjjOR+TgpiMG3Uv1H2TQWKiJwe9XMwRyWCOGFpnEBq
	 DaoMaS+xcAg1+Y1GJhE9mEMqyQ86JNlwqRp9tODFUlx5c97u9mYGMOCcwGLYqUjwqP
	 3DLe6ITkq2naxHCNTVLhZOuMea6jBMOY/pNEy5F5CV31pOor2g72/9Ral81kscQ0Kn
	 GaHJS/8vq1QMGq7/63UKP9sbqVTVMPrRkbbhd0ZDrTR3GQnL3csMf6HP0GTJUNBMSB
	 0LJfS2yOmfFaA==
From: Nikita Travkin <nikita@trvn.ru>
Date: Sun, 23 Jun 2024 14:26:31 +0500
Subject: [PATCH 2/3] arm64: dts: qcom: msm8916-lg-m216: Add initial device
 tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-msm8916-lg-initial-v1-2-6fbcf714d69b@trvn.ru>
References: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
In-Reply-To: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikita@trvn.ru>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6642; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=gCB2ewzd39u2E4FIZVdSVIr9W9ZHYMsjQEAGwlCVruU=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmd+ppPfOlfe1mJkncD8fBtZFze4jpLIBYvfmmg
 TUlnDRQ+7KJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZnfqaQAKCRBDHOzuKBm/
 dVaRD/90wvJKGPjD1pffjvHAk1bPZaErl+fayeXlkrHZ39ZHiTXxz1sStdI6QTgXn+OwuNZJQ6t
 Fiac0fMCM2kbl3BH7w+fr9f6StzEGIOckz6djHgtCJs2YfzWH815w6/Pfw1xCqm0HVcE06M9OoD
 Z0a59lAdzbvUCHkjBvu1t4HE3U3ZVIRqJqGAiMpWuURFx8MWMZ47QfE6KPrNpZ98NMgGrdz9tvB
 tJcG8rrVuJzGTVRofkpBPzilD6Tpnh3TKAHj2A2jP9oPQmjoacV/7/z05aNiGjfHfxDN9RLwKek
 AAadN1rpTb7zE1luYrP/1ONYyXhkOt0jmPHve6aePurdNxxefF0D+M/MtzmP1V6VdpNbtvrTBkK
 ccmi2sk7pSFa9LhV/vloMUhPKHOlAcwAsKQQb5qC/kaHk37Hr/kp7fqXvdqFjbQQUCwKLRalfmw
 4f3NNlTqumunHEQV4H0u24xZtsOWN8mLQubHN15+0U2vL5eURRiUcF8iZkY9PjXmLUyiWDFgvfR
 Yaiuu0d2yV2m1uqnnct9hZYxK7dzdKI0jMIwTOBkzCF0SlOu9z4LkWY9Jx3ISM5s9Rouz1Ba/qC
 cNhcwKp/OfdErnLiIddQN1iBMmkFYSAMFlSY2s7pi030aPKOOBA7amGpQNvWjtfjuCplYsN8KX+
 XQEPXUQ8vmvujUw==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

From: Cristian Cozzolino <cristian_ci@protonmail.com>

This commit adds initial support for the LG K10 smartphone.

Support for the following features is included:

- Serial
- Keys
- Battery and charger
- Accelerometer, magnetometer
- Touchscreen
- Sound and modem
- Haptic

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
[Nikita: Minor cleanup]
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile            |   1 +
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts | 251 +++++++++++++++++++++++++++
 2 files changed, 252 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5576c7d6ea06..b35e46d75a1d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-gplus-fl8005a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-huawei-g7.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-lg-m216.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-motorola-harpia.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts b/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
new file mode 100644
index 000000000000..07345e694f6f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include "msm8916-modem-qdsp6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "LG K10 (K420n)";
+	compatible = "lg,m216", "qcom,msm8916";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* eMMC */
+		mmc1 = &sdhc_2; /* SD card */
+		serial0 = &blsp_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3300000>;
+		voltage-max-design-microvolt = <4350000>;
+		energy-full-design-microwatt-hours = <8800000>;
+		charge-full-design-microamp-hours = <2300000>;
+
+		ocv-capacity-celsius = <25>;
+		ocv-capacity-table-0 = <4342000 100>, <4266000 95>, <4206000 90>,
+			<4148000 85>, <4094000 80>, <4046000 75>, <3994000 70>,
+			<3956000 65>, <3916000 60>, <3866000 55>, <3831000 50>,
+			<3808000 45>, <3789000 40>, <3776000 35>, <3769000 30>,
+			<3760000 25>, <3740000 20>, <3712000 16>, <3684000 13>,
+			<3676000 11>, <3674000 10>, <3672000 9>, <3669000 8>,
+			<3665000 7>, <3660000 6>, <3643000 5>, <3602000 4>,
+			<3542000 3>, <3458000 2>, <3326000 1>, <3000000 0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		label = "GPIO Buttons";
+
+		volume-up-button {
+			label = "Volume Up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		volume-down-button {
+			label = "Volume Down";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+};
+
+&blsp_i2c2 {
+	status = "okay";
+
+	accelerometer@11 {
+		compatible = "bosch,bmc150_accel";
+		reg = <0x11>;
+
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_RISING>;
+
+		mount-matrix =	 "0", "1", "0",
+				"-1", "0", "0",
+				 "0", "0", "1";
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		pinctrl-0 = <&accel_int_default>;
+		pinctrl-names = "default";
+	};
+
+	magnetometer@13 {
+		compatible = "bosch,bmc150_magn";
+		reg = <0x13>;
+
+		interrupts-extended = <&tlmm 69 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		pinctrl-0 = <&magn_int_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@34 {
+		compatible = "melfas,mip4_ts";
+		reg = <0x34>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		ce-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_uart2 {
+	status = "okay";
+};
+
+&mpss_mem {
+	reg = <0x0 0x86800000 0x0 0x4a00000>;
+};
+
+&pm8916_bms {
+	monitored-battery = <&battery>;
+	power-supplies = <&pm8916_charger>;
+
+	status = "okay";
+};
+
+&pm8916_charger {
+	qcom,fast-charge-safe-current = <700000>;
+	qcom,fast-charge-safe-voltage = <4300000>;
+
+	monitored-battery = <&battery>;
+	status = "okay";
+};
+
+&pm8916_codec {
+	qcom,micbias1-ext-cap;
+	qcom,micbias-lvl = <2800>;
+	qcom,mbhc-vthreshold-low = <75 100 120 180 500>;
+	qcom,mbhc-vthreshold-high = <75 100 120 180 500>;
+	qcom,hphl-jack-type-normally-open;
+};
+
+&pm8916_rpm_regulators {
+	pm8916_l17: l17 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+	};
+};
+
+&pm8916_vib {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&sound {
+	audio-routing =
+		"AMIC1", "MIC BIAS External1",
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS External1";
+};
+
+&usb {
+	dr_mode = "peripheral";
+	extcon = <&pm8916_charger>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&pm8916_charger>;
+};
+
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&tlmm {
+	accel_int_default: accel-int-default-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107", "gpio108";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	magn_int_default: magn-int-default-state {
+		pins = "gpio69";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_default: touchscreen-default-state {
+		touchscreen-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		ce-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};

-- 
2.45.2


