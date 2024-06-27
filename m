Return-Path: <linux-arm-msm+bounces-24526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C191AFB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CB51F23BB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E2550297;
	Thu, 27 Jun 2024 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="CASP4PmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A2C8F3;
	Thu, 27 Jun 2024 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516665; cv=none; b=Xkr6eUuP8S68GXMWEc1BdruE5DjvidIMccW5ric4KOZ6+4F5oPygSDJdSMZjK6mwc8UoWQTqrW1FwjGdRVx0zE8Dkqk9BZZqNg5lEJto1FnGnXNycLslvewiPzHS/Lk3LpJqaebbYYgv5IJ9oNRENCr70pYWK7aWQxesR/gxyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516665; c=relaxed/simple;
	bh=IVvcTA7MheWdX89rCjY8KJEGALKA+hIlIktLVHQhzS0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imh6kqBRaivSc6eQukOvScObIR3f3rxXBnWaM8OL6O1YbKcCEZmDBR8gpOX1OTqis1dlb8xvedhpQntwFF5EzwR2qC4/u14hL6P6YYrQyoT5FrSjmcGJ6qINMR3HHAc6uw1KJz+uWy1sh3EHt/RuEGtZkbWC9KBYilVFiymG8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=CASP4PmQ; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719516657; x=1719775857;
	bh=vrsJM6S2uN17Iy4nhbwvjqfkYKzuyI4rAmoNTP7PI00=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CASP4PmQI2Cpj2Nzjwn+pZIejuryTp9z2VSlfk3VsMsbuNeaN8n1XhIa4t9V96mPD
	 tdrTTPFedAKkzE0b64TSVnkHDmQ6BQ4n2ZH7N0AlT42HB7pMTp3lpITDtgWq/Yfugv
	 emAJ4PBHBJAzBMr0dWQUDRQ/JMgAgy48M6kNMHhQjaUDCXWDYymTqFWy04qLoAeIaO
	 tD1FRaQcz76arA0gr1OKEkDZJU2jGt+/TYg9C7SdGNTNqctQ4SkdBoA4y4gnUJpqAi
	 cNpD8zH7C9W2IL19fdcKpA9a8A0ovTDMRm5UeIf/WZWq8/dJXVt94bs0l5aam7mXAQ
	 7kp0pGde+Bv4A==
Date: Thu, 27 Jun 2024 19:30:52 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial device tree
Message-ID: <20240627193013.1800-3-raymondhackley@protonmail.com>
In-Reply-To: <20240627193013.1800-1-raymondhackley@protonmail.com>
References: <20240627193013.1800-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 79ca69deb7cccdb4b2ab998a8d7126233cbe66c8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
other Samsung devices based on MSM8226 with only a few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - UART (on USB connector via the TI TSU6721 MUIC)
 - Regulators
 - Touchscreen
 - Accelerometer

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm/boot/dts/qcom/Makefile               |   1 +
 .../dts/qcom/qcom-msm8226-samsung-ms013g.dts  | 386 ++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makef=
ile
index ccd4ce6353df..f06c6d425e91 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_QCOM) +=3D \
 =09qcom-msm8226-microsoft-dempsey.dtb \
 =09qcom-msm8226-microsoft-makepeace.dtb \
 =09qcom-msm8226-microsoft-moneypenny.dtb \
+=09qcom-msm8226-samsung-ms013g.dtb \
 =09qcom-msm8226-samsung-s3ve3g.dtb \
 =09qcom-msm8660-surf.dtb \
 =09qcom-msm8916-samsung-e5.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts b/arch/=
arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
new file mode 100644
index 000000000000..190b52fda634
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "qcom-msm8226.dtsi"
+#include "pm8226.dtsi"
+
+/delete-node/ &smem_region;
+
+/ {
+=09model =3D "Samsung Galaxy Grand 2";
+=09compatible =3D "samsung,ms013g", "qcom,msm8226";
+=09chassis-type =3D "handset";
+
+=09aliases {
+=09=09mmc0 =3D &sdhc_1; /* SDC1 eMMC slot */
+=09=09mmc1 =3D &sdhc_2; /* SDC2 SD card slot */
+=09=09serial0 =3D &blsp1_uart3;
+=09};
+
+=09chosen {
+=09=09stdout-path =3D "serial0:115200n8";
+=09};
+
+=09gpio-hall-sensor {
+=09=09compatible =3D "gpio-keys";
+
+=09=09pinctrl-0 =3D <&gpio_hall_sensor_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09label =3D "GPIO Hall Effect Sensor";
+
+=09=09event-hall-sensor {
+=09=09=09label =3D "Hall Effect Sensor";
+=09=09=09gpios =3D <&tlmm 50 GPIO_ACTIVE_LOW>;
+=09=09=09linux,input-type =3D <EV_SW>;
+=09=09=09linux,code =3D <SW_LID>;
+=09=09=09linux,can-disable;
+=09=09};
+=09};
+
+=09gpio-keys {
+=09=09compatible =3D "gpio-keys";
+
+=09=09pinctrl-0 =3D <&gpio_keys_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09label =3D "GPIO Buttons";
+
+=09=09button-volume-up {
+=09=09=09label =3D "Volume Up";
+=09=09=09gpios =3D <&tlmm 106 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09};
+
+=09=09button-volume-down {
+=09=09=09label =3D "Volume Down";
+=09=09=09gpios =3D <&tlmm 107 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09=09};
+
+=09=09button-home {
+=09=09=09label =3D "Home Key";
+=09=09=09gpios =3D <&tlmm 108 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_HOMEPAGE>;
+=09=09};
+=09};
+
+=09haptic {
+=09=09compatible =3D "regulator-haptic";
+=09=09haptic-supply =3D <&reg_motor_vdd>;
+=09=09min-microvolt =3D <3300000>;
+=09=09max-microvolt =3D <3300000>;
+=09};
+
+=09reg_motor_vdd: regulator-motor-vdd {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "motor_vdd";
+=09=09regulator-min-microvolt =3D <3300000>;
+=09=09regulator-max-microvolt =3D <3300000>;
+
+=09=09gpio =3D <&tlmm 111 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+
+=09=09pinctrl-0 =3D <&motor_en_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+
+=09reg_vdd_tsp_a: regulator-vdd-tsp-a {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "tsp_3p3v";
+=09=09regulator-min-microvolt =3D <3300000>;
+=09=09regulator-max-microvolt =3D <3300000>;
+
+=09=09gpio =3D <&tlmm 31 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+
+=09=09pinctrl-0 =3D <&tsp_en_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+
+=09reserved-memory {
+=09=09smem_region: smem@fa00000 {
+=09=09=09reg =3D <0x0fa00000 0x100000>;
+=09=09=09no-map;
+=09=09};
+=09};
+};
+
+&blsp1_i2c2 {
+=09status =3D "okay";
+
+=09accelerometer@18 {
+=09=09compatible =3D "bosch,bma255";
+=09=09reg =3D <0x18>;
+=09=09interrupts-extended =3D <&tlmm 64 IRQ_TYPE_EDGE_RISING>;
+
+=09=09vdd-supply =3D <&pm8226_l19>;
+=09=09vddio-supply =3D <&pm8226_lvs1>;
+
+=09=09pinctrl-0 =3D <&accel_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09mount-matrix =3D "0", "1", "0",
+=09=09=09       "-1", "0", "0",
+=09=09=09       "0", "0", "-1";
+=09};
+};
+
+&blsp1_i2c5 {
+=09status =3D "okay";
+
+=09touchscreen@20 {
+=09=09compatible =3D "zinitix,bt541";
+
+=09=09reg =3D <0x20>;
+=09=09interrupts-extended =3D <&tlmm 17 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09touchscreen-size-x =3D <720>;
+=09=09touchscreen-size-y =3D <1280>;
+
+=09=09vcca-supply =3D <&reg_vdd_tsp_a>;
+=09=09vdd-supply =3D <&pm8226_lvs1>;
+
+=09=09pinctrl-0 =3D <&tsp_int_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+};
+
+&blsp1_uart3 {
+=09status =3D "okay";
+};
+
+&rpm_requests {
+=09regulators {
+=09=09compatible =3D "qcom,rpm-pm8226-regulators";
+
+=09=09pm8226_s3: s3 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1300000>;
+=09=09};
+
+=09=09pm8226_s4: s4 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2200000>;
+=09=09};
+
+=09=09pm8226_s5: s5 {
+=09=09=09regulator-min-microvolt =3D <1150000>;
+=09=09=09regulator-max-microvolt =3D <1150000>;
+=09=09};
+
+=09=09pm8226_l1: l1 {
+=09=09=09regulator-min-microvolt =3D <1225000>;
+=09=09=09regulator-max-microvolt =3D <1225000>;
+=09=09};
+
+=09=09pm8226_l2: l2 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09};
+
+=09=09pm8226_l3: l3 {
+=09=09=09regulator-min-microvolt =3D <750000>;
+=09=09=09regulator-max-microvolt =3D <1337500>;
+=09=09};
+
+=09=09pm8226_l4: l4 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09};
+
+=09=09pm8226_l5: l5 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09};
+
+=09=09pm8226_l6: l6 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-allow-set-load;
+=09=09=09regulator-always-on;
+=09=09};
+
+=09=09pm8226_l7: l7 {
+=09=09=09regulator-min-microvolt =3D <1850000>;
+=09=09=09regulator-max-microvolt =3D <1850000>;
+=09=09};
+
+=09=09pm8226_l8: l8 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+
+=09=09pm8226_l9: l9 {
+=09=09=09regulator-min-microvolt =3D <2050000>;
+=09=09=09regulator-max-microvolt =3D <2050000>;
+=09=09};
+
+=09=09pm8226_l10: l10 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+
+=09=09pm8226_l12: l12 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+
+=09=09pm8226_l14: l14 {
+=09=09=09regulator-min-microvolt =3D <2750000>;
+=09=09=09regulator-max-microvolt =3D <2750000>;
+=09=09};
+
+=09=09pm8226_l15: l15 {
+=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09};
+
+=09=09pm8226_l16: l16 {
+=09=09=09regulator-min-microvolt =3D <3000000>;
+=09=09=09regulator-max-microvolt =3D <3350000>;
+=09=09};
+
+=09=09pm8226_l17: l17 {
+=09=09=09regulator-min-microvolt =3D <2950000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+
+=09=09=09regulator-system-load =3D <200000>;
+=09=09=09regulator-allow-set-load;
+=09=09=09regulator-always-on;
+=09=09};
+
+=09=09pm8226_l18: l18 {
+=09=09=09regulator-min-microvolt =3D <2950000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+=09=09};
+
+=09=09pm8226_l19: l19 {
+=09=09=09regulator-min-microvolt =3D <2850000>;
+=09=09=09regulator-max-microvolt =3D <3000000>;
+=09=09};
+
+=09=09pm8226_l20: l20 {
+=09=09=09regulator-min-microvolt =3D <3075000>;
+=09=09=09regulator-max-microvolt =3D <3075000>;
+=09=09};
+
+=09=09pm8226_l21: l21 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+=09=09=09regulator-allow-set-load;
+=09=09};
+
+=09=09pm8226_l22: l22 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+=09=09};
+
+=09=09pm8226_l23: l23 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <3300000>;
+=09=09};
+
+=09=09pm8226_l24: l24 {
+=09=09=09regulator-min-microvolt =3D <1300000>;
+=09=09=09regulator-max-microvolt =3D <1350000>;
+=09=09};
+
+=09=09pm8226_l25: l25 {
+=09=09=09regulator-min-microvolt =3D <1775000>;
+=09=09=09regulator-max-microvolt =3D <2125000>;
+=09=09};
+
+=09=09pm8226_l26: l26 {
+=09=09=09regulator-min-microvolt =3D <1225000>;
+=09=09=09regulator-max-microvolt =3D <1300000>;
+=09=09};
+
+=09=09pm8226_l27: l27 {
+=09=09=09regulator-min-microvolt =3D <2050000>;
+=09=09=09regulator-max-microvolt =3D <2050000>;
+=09=09};
+
+=09=09pm8226_l28: l28 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2950000>;
+=09=09};
+
+=09=09pm8226_lvs1: lvs1 {};
+=09};
+};
+
+&sdhc_1 {
+=09vmmc-supply =3D <&pm8226_l17>;
+=09vqmmc-supply =3D <&pm8226_l6>;
+
+=09bus-width =3D <8>;
+=09non-removable;
+
+=09status =3D "okay";
+};
+
+&sdhc_2 {
+=09vmmc-supply =3D <&pm8226_l18>;
+=09vqmmc-supply =3D <&pm8226_l21>;
+
+=09bus-width =3D <4>;
+=09cd-gpios =3D <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+=09pinctrl-0 =3D <&sdhc2_default_state &sdhc2_cd_default>;
+=09pinctrl-names =3D "default";
+
+=09status =3D "okay";
+};
+
+&tlmm {
+=09accel_int_default: accel-int-default-state {
+=09=09pins =3D "gpio64";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+=09=09pins =3D "gpio50";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09gpio_keys_default: gpio-keys-default-state {
+=09=09pins =3D "gpio106", "gpio107", "gpio108";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09motor_en_default: motor-en-default-state {
+=09=09pins =3D "gpio111";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09sdhc2_cd_default: sdhc2-cd-default-state {
+=09=09pins =3D "gpio38";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09tsp_en_default: tsp-en-default-state {
+=09=09pins =3D "gpio31";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09tsp_int_default: tsp-int-default-state {
+=09=09pins =3D "gpio17";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
--=20
2.39.2



