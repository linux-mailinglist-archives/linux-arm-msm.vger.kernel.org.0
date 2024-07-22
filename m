Return-Path: <linux-arm-msm+bounces-26805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C11938F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 342E3281CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62ED16D4F1;
	Mon, 22 Jul 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="yft16Iec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5216B399;
	Mon, 22 Jul 2024 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721652451; cv=none; b=LMn1qQo0xUkSkDoA5L63Oo+Hfy811WA1RVrmZWWRFC354gTDG37oSKHdF3vrb086qa5LE7WCkTFR/OtWHX5S9+vijKi3v6PIWi5WTV+5Tst3aXQnaco9GpN4ItDYiR8daFgrBmio66Hs0ICOa/Onp+TWev1mUWfBAjWy8WPL5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721652451; c=relaxed/simple;
	bh=KgpD4djcJkVLBZxuo39QF5wHw/ewcB6wWjwEeF3HeRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSF3ak+pju2GXUm7oOg2CK4rxBCYlScWTsMRzhKljPi/zJdcn92v5LkSniGabnWgxS8rDZpyBnzaV8XdCtDTjkZUOrJE+1Yl9HpQsyi3GihbMSHIJCiHzVDwi2DI1d8YT9dUdkv3OGPoxGM+Hm2b910UdBOJlO9Fr06Q4sHYBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=yft16Iec; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id A8EB542694;
	Mon, 22 Jul 2024 17:47:21 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721652442; bh=KgpD4djcJkVLBZxuo39QF5wHw/ewcB6wWjwEeF3HeRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=yft16Iecx6PRaKqyH0RuOJQS2fm7km140ki1kTV+863wXQjrFG3f1EFThJZqShfMZ
	 TA5O81N1HWPIAeWzagp50xeMe8k5LBltME4cXmGBo6kwLvrrM0I1MkCag8gzxmtmj+
	 c7G/duYXEAQqEvlEOIQwwABP6nLsIGZ6+tQH+ifkhpUFBmqEQhhYgPW6xWuh0Hqm3f
	 vrgMuAllkCzImuZSVeiyj160TzHnzSnHWi15c5px6x+vZMsMCc/rjQUeEgypYHv5vh
	 r8/AvRBxz/lCQ6EIsyQMod318HWFxpsV9GpPpguoxQb3v9MID83JBBs/cALnIUo76I
	 LU8894uWwMr1A==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 22 Jul 2024 17:47:14 +0500
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240722-msm89xx-wingtech-init-v2-3-0c981bbc5238@trvn.ru>
References: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
In-Reply-To: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=14205; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=+hm61tXguqoYLuXRRZvDkGq+7Thgh2O0FVJL2S7g2yw=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmnlTWtSMD6bFAxsAvr9b9aLBvO0Vq6IFyVkl/k
 UU3qbLKFHGJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZp5U1gAKCRBDHOzuKBm/
 dSJQEACHiaV0u/zieQu2n3TT6MsXuM9G6uq0fK/hJzu73WzKEHiGaZSPrUJOc277wirqtdVQqGU
 +qV55jnrtD8W/BJuFmeEcYb5LcutKgBcQFFG4G5UlxOklsvTO7KHw23VMqhZglmqPRjjNkM1hnz
 +g1m23GMgHZMi6XQI2yJLlYEbKII4vdGcFeiOlc32JWS8u+ELpT3WcvwYpI3ZZ+gWQXF37h/t22
 j312lVwl6oCqKEg8uCtOgu81j+WzgzMePH1i3XMxSulBpwShHOrkBfjHjyvWxLmX6ETvv59ttHp
 tjxVIzOe0c1N2fY2HNto5L64mkDyyq8kY+BcO+TobhJXybxou2dxPuxOJ63ZH2IAJce228PsaJA
 sNvDWeYitd2FTW+Ayakr6AsaIKOiZEW5su4xWUSCtM3B2NeHPYWDb+kRm0XQ6fr1JSjU56oKtIN
 Pj/X0t5bEPEP8wSWtZaZM3zG9Lj/oqxTBD1vK3LaL0oculvezdpBbP6dxxwxHiil4yDCtBsGYPX
 9TCU+AiybdGyk/KEQ9G3yf3K7O91fMnqkQ3HIm3JqVyCXq78L4Dj2S1XWg9ZPIoFbLLdvNv2cPD
 lcB0eKiEjhRGAvzFBcUDPixQkrKZEO46k8UN9wJ5qZsncXF4EwQJBVSFGBJyUCdGYAn56K7R0KT
 pPUvKX9xnFkqxaA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

From: Adam Słaboń <asaillen@protonmail.com>

This commit introduces multiple hardware variants of Lenovo Vibe K5.

- A6020a40 (msm8929-wingtech-wt82918hd)
- A6020a46/A6020l36 (msm8939-wingtech-wt82918)
- A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)

These devices are added with support for many features, notably:

- Basic features like USB, mmc/sd storage, wifi, buttons, leds;
- Accelerometer;
- Touchscreen;
- Sound and modem.

Note that "HD" variant of K5 is based on msm8929 which is a lower bin
of msm8939 SoC. A simple dtsi is added for this soc along with the new
devices.

Unfortunately, despite the heavy similarities, the combination of minor
differences between variants make them incompatible between each other.

Signed-off-by: Adam Słaboń <asaillen@protonmail.com>
[Nikita: Minor cleanup, commit message]
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi       | 162 +++++++++++++
 .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
 arch/arm64/boot/dts/qcom/msm8929.dtsi              |   7 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  17 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 252 +++++++++++++++++++++
 .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  17 ++
 7 files changed, 475 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fd4c7c41ddc4..48ec781fa1d8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -58,10 +58,13 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi
new file mode 100644
index 000000000000..c2bf25997e9b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * msm8929-pm8916.dtsi describes common properties (e.g. regulator connections)
+ * that apply to most devices that make use of the MSM8929 SoC and PM8916 PMIC.
+ * Many regulators have a fixed purpose in the original reference design and
+ * were rarely re-used for different purposes. Devices that deviate from the
+ * typical reference design should not make use of this include and instead add
+ * the necessary properties in the board-specific device tree.
+ */
+
+#include "msm8929.dtsi"
+#include "pm8916.dtsi"
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l6>;
+};
+
+&mdss_dsi0_phy {
+	vddio-supply = <&pm8916_l6>;
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l6>;
+};
+
+&mdss_dsi1_phy {
+	vddio-supply = <&pm8916_l6>;
+};
+
+&mpss {
+	pll-supply = <&pm8916_l7>;
+};
+
+&pm8916_codec {
+	vdd-cdc-io-supply = <&pm8916_l5>;
+	vdd-cdc-tx-rx-cx-supply = <&pm8916_l5>;
+	vdd-micbias-supply = <&pm8916_l13>;
+};
+
+&rpm_requests {
+	pm8916_rpm_regulators: regulators {
+		compatible = "qcom,rpm-pm8916-regulators";
+		vdd_l1_l2_l3-supply = <&pm8916_s3>;
+		vdd_l4_l5_l6-supply = <&pm8916_s4>;
+		vdd_l7-supply = <&pm8916_s4>;
+
+		/* pm8916_s1 is managed by rpmpd (MSM8939_VDDMDCX) */
+		/* pm8916_s2 is managed by rpmpd (MSM8939_VDDCX) */
+		pm8916_s3: s3 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-always-on; /* Needed for L2 */
+		};
+		pm8916_s4: s4 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2150000>;
+			regulator-always-on; /* Needed for L5/L7 */
+		};
+
+		/*
+		 * Some of the regulators are unused or managed by another
+		 * processor (e.g. the modem). We should still define nodes for
+		 * them to ensure the vote from the application processor can be
+		 * dropped in case the regulators are already on during boot.
+		 *
+		 * The labels for these nodes are omitted on purpose because
+		 * boards should configure a proper voltage before using them.
+		 */
+		l1 {};
+
+		pm8916_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-always-on; /* Needed for LPDDR RAM */
+		};
+
+		/* pm8916_l3 is managed by rpmpd (MSM8939_VDDMX) */
+
+		l4 {};
+
+		pm8916_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on; /* Needed for most digital I/O */
+		};
+
+		pm8916_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8916_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on; /* Needed for CPU PLL */
+		};
+
+		pm8916_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8916_l9: l9 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		l10 {};
+
+		pm8916_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+
+		pm8916_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8916_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		l14 {};
+		l15 {};
+		l16 {};
+		l17 {};
+		l18 {};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8916_l8>;
+	vqmmc-supply = <&pm8916_l5>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8916_l11>;
+	vqmmc-supply = <&pm8916_l12>;
+};
+
+&usb_hs_phy {
+	v1p8-supply = <&pm8916_l7>;
+	v3p3-supply = <&pm8916_l13>;
+};
+
+&wcnss {
+	vddpx-supply = <&pm8916_l7>;
+};
+
+&wcnss_iris {
+	vddxo-supply = <&pm8916_l7>;
+	vddrfa-supply = <&pm8916_s3>;
+	vddpa-supply = <&pm8916_l9>;
+	vdddig-supply = <&pm8916_l5>;
+};
+
diff --git a/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
new file mode 100644
index 000000000000..8feecffb16bf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8929-pm8916.dtsi"
+#include "msm8939-wingtech-wt82918.dtsi"
+
+/ {
+	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
+	compatible = "wingtech,wt82918hd", "qcom,msm8929";
+	chassis-type = "handset";
+};
+
+&touchscreen {
+	touchscreen-size-x = <720>;
+	touchscreen-size-y = <1280>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
new file mode 100644
index 000000000000..ef7bb1ced954
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8939.dtsi"
+
+&opp_table {
+	/delete-node/ opp-550000000;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts
new file mode 100644
index 000000000000..aa6b699aa2a1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-pm8916.dtsi"
+#include "msm8939-wingtech-wt82918.dtsi"
+
+/ {
+	model = "Lenovo Vibe K5 (Wingtech WT82918)";
+	compatible = "wingtech,wt82918", "qcom,msm8939";
+	chassis-type = "handset";
+};
+
+&touchscreen {
+	touchscreen-size-x = <1080>;
+	touchscreen-size-y = <1920>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
new file mode 100644
index 000000000000..800e0747a2f7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8916-modem-qdsp6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+
+/ {
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8916_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	flash-led-controller {
+		compatible = "sgmicro,sgm3140";
+		enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		flash-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&camera_front_flash_default>;
+		pinctrl-names = "default";
+
+		flash_led: led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+		};
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
+		button-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&gpio_leds_default>;
+		pinctrl-names = "default";
+
+		led-0 {
+			gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_CHARGING;
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			retain-state-suspended;
+		};
+
+		led-1 {
+			gpios = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			retain-state-suspended;
+		};
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_i2c2 {
+	status = "okay";
+
+	accelerometer@68 {
+		compatible = "invensense,icm20608";
+		reg = <0x68>;
+
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&accelerometer_default>;
+		pinctrl-names = "default";
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		mount-matrix = "-1", "0", "0",
+				"0", "1", "0",
+				"0", "0", "1";
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		vcc-supply = <&pm8916_l17>;
+		iovcc-supply = <&pm8916_l6>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&blsp_uart2 {
+	status = "okay";
+};
+
+&mpss_mem {
+	reg = <0x0 0x86800000 0x0 0x5500000>;
+};
+
+&pm8916_pwm {
+	pinctrl-0 = <&pwm_out>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pm8916_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
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
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+	non-removable;
+	status = "okay";
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
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
+	accelerometer_default: accelerometer-default-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	camera_front_flash_default: camera-front-flash-default-state {
+		pins = "gpio31", "gpio32";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	gpio_leds_default: gpio-leds-default-state {
+		pins = "gpio36", "gpio69";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_default: touchscreen-default-state {
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		touchscreen-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&pm8916_mpps {
+	pwm_out: mpp4-state {
+		pins = "mpp4";
+		function = "digital";
+		power-source = <PM8916_MPP_VPH>;
+		output-low;
+		qcom,dtest = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts
new file mode 100644
index 000000000000..59414db42508
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-pm8916.dtsi"
+#include "msm8939-wingtech-wt82918.dtsi"
+
+/ {
+	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
+	compatible = "wingtech,wt82918hdhw39", "qcom,msm8939";
+	chassis-type = "handset";
+};
+
+&touchscreen {
+	touchscreen-size-x = <720>;
+	touchscreen-size-y = <1280>;
+};

-- 
2.45.2


