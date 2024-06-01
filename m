Return-Path: <linux-arm-msm+bounces-21378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F628D6F9E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 13:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAA6DB22398
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 11:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBBB14F9E7;
	Sat,  1 Jun 2024 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="h42B65Ct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87674418;
	Sat,  1 Jun 2024 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717242879; cv=none; b=Qyi/GkHo1+uPDyqeXaVe0aZgqJ0Atc4K2C26LQY2FWYOdNxSXGKeFWmVQac3KcRqq6OmgG4gPqtu89EZJvI0R2YfqjV4vUMc8pWDvVVJmGygeomtTLbnZu+iEYhp8uKpRlKfRIf3/fhLDKplwPpS60lX1CDPRdbsO+yxPV6D53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717242879; c=relaxed/simple;
	bh=2Kcxwb2F9CVt435hR4lFrcovKuZoNWLP/iWamePe9uw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwNeXx4AQPA++rcIuDIcZxPx/5gZb9KFHtNfUZ0X/zLsxFgr67B2/mIdkuA1wQg6DImV0hRuJ2FSkFcwZiidF62Rs+n+k9I2qqp4ybz15DV6k/BPSL+Qx0fxlqc988FzV1PsDgRj7oV5Xkaz5gDCgjpnExa3RN/TgKwFZQp4KXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=h42B65Ct; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717242875; x=1717502075;
	bh=AZP4En4IzH8eijQiKVXJZFEEvxHYp9iC45HR+AG84b8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h42B65Ct4GWnaU7nGC+gQrjnQd8H6gKGlMQVQ8xFWeRy8X+6m/xruVYdJSyd5KJUF
	 /nD3SUJAnnIg8mVbPMZbOzm3Ah3kO+upg2FSZSiyUtMC1S/Wu7Gknn3PCEbvR7Vdbq
	 w920QQ+cz2vy/9ahaYa90nAZGDxAl8nFNA6wuUphDpzpPd3bvsOPNuiTmtOn+0Dhal
	 VCMgdSXowHK84hHNct7NAbmW7caNB1NbGD78xen7RpS3PmKwXj2ukWcjSfY/MlL1ea
	 0zZzEf0j5OM/5B4oUi3jSWv/QrC0OqcGhx8j1G9Z1JewyBK9tNpMRhk5a+76ehpZWx
	 OaAMrkr++fVrA==
Date: Sat, 01 Jun 2024 11:54:32 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Siddharth Manthan <siddharth.manthan@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add PMIC and charger
Message-ID: <20240601115321.25314-4-raymondhackley@protonmail.com>
In-Reply-To: <20240601115321.25314-1-raymondhackley@protonmail.com>
References: <20240601115321.25314-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 1ff21548d92eca535490bc8b4cfbabd5bea5f223
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The phones listed below have Richtek RT5033 PMIC and charger.
Add them to the device trees.
- Samsung Galaxy Core Prime LTE
- Samsung Galaxy Grand Prime

Cc: Jakob Hauser <jahau@rocketmail.com>
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../dts/qcom/msm8216-samsung-fortuna3g.dts    |  6 +++
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 47 +++++++++++++++++++
 .../dts/qcom/msm8916-samsung-gprimeltecan.dts | 41 ++++++++++++++++
 .../qcom/msm8916-samsung-grandprimelte.dts    |  6 +++
 .../boot/dts/qcom/msm8916-samsung-rossa.dts   |  6 +++
 5 files changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts b/arch/=
arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
index e7f6df229f9a..fba68bf8bf79 100644
--- a/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
+++ b/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
@@ -10,6 +10,12 @@ / {
 =09chassis-type =3D "handset";
 };
=20
+&battery {
+=09charge-term-current-microamp =3D <200000>;
+=09constant-charge-current-max-microamp =3D <1000000>;
+=09constant-charge-voltage-max-microvolt =3D <4350000>;
+};
+
 &st_accel {
 =09status =3D "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index b5b7beab2209..81b3e0760154 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -27,6 +27,12 @@ tz-apps@85a00000 {
 =09=09};
 =09};
=20
+=09battery: battery {
+=09=09compatible =3D "simple-battery";
+=09=09precharge-current-microamp =3D <450000>;
+=09=09precharge-upper-limit-microvolt =3D <3500000>;
+=09};
+
 =09clk_pwm_backlight: backlight {
 =09=09compatible =3D "pwm-backlight";
 =09=09pwms =3D <&clk_pwm 0 100000>;
@@ -234,6 +240,8 @@ fuel-gauge@35 {
=20
 =09=09pinctrl-0 =3D <&fg_alert_default>;
 =09=09pinctrl-names =3D "default";
+
+=09=09power-supplies =3D <&charger>;
 =09};
 };
=20
@@ -259,6 +267,38 @@ touchscreen: touchscreen@20 {
=20
 &blsp_i2c6 {
 =09status =3D "okay";
+
+=09pmic@34 {
+=09=09compatible =3D "richtek,rt5033";
+=09=09reg =3D <0x34>;
+
+=09=09interrupts-extended =3D <&tlmm 62 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09pinctrl-0 =3D <&pmic_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09regulators {
+=09=09=09rt5033_reg_safe_ldo: SAFE_LDO {
+=09=09=09=09regulator-min-microvolt =3D <4900000>;
+=09=09=09=09regulator-max-microvolt =3D <4900000>;
+=09=09=09=09regulator-always-on;
+=09=09=09};
+
+=09=09=09/*
+=09=09=09 * Needed for camera, but not used yet.
+=09=09=09 * Define empty nodes to allow disabling the unused
+=09=09=09 * regulators.
+=09=09=09 */
+=09=09=09LDO {};
+=09=09=09BUCK {};
+=09=09};
+
+=09=09charger: charger {
+=09=09=09compatible =3D "richtek,rt5033-charger";
+=09=09=09monitored-battery =3D <&battery>;
+=09=09=09richtek,usb-connector =3D <&usb_con>;
+=09=09};
+=09};
 };
=20
 &blsp_uart2 {
@@ -403,6 +443,13 @@ nfc_i2c_default: nfc-i2c-default-state {
 =09=09bias-disable;
 =09};
=20
+=09pmic_int_default: pmic-int-default-state {
+=09=09pins =3D "gpio62";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
 =09sdc2_cd_default: sdc2-cd-default-state {
 =09=09pins =3D "gpio38";
 =09=09function =3D "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts b/ar=
ch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
index 589dd006a746..677e4e286ac0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
@@ -21,6 +21,12 @@ tz-apps@85500000 {
 =09};
 };
=20
+&battery {
+=09charge-term-current-microamp =3D <200000>;
+=09constant-charge-current-max-microamp =3D <1000000>;
+=09constant-charge-voltage-max-microvolt =3D <4350000>;
+};
+
 &bosch_accel {
 =09status =3D "okay";
 };
@@ -30,6 +36,9 @@ &bosch_magn {
 };
=20
 &blsp_i2c6 {
+=09/* pmic@34 is on i2c_nfc instead */
+=09/delete-node/ pmic@34;
+
 =09nfc@27 {
 =09=09compatible =3D "samsung,s3fwrn5-i2c";
 =09=09reg =3D <0x27>;
@@ -48,6 +57,38 @@ nfc@27 {
=20
 &i2c_nfc {
 =09/* nfc@27 is on &blsp_i2c6 */
+
+=09pmic@34 {
+=09=09compatible =3D "richtek,rt5033";
+=09=09reg =3D <0x34>;
+
+=09=09interrupts-extended =3D <&tlmm 62 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09pinctrl-0 =3D <&pmic_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09regulators {
+=09=09=09rt5033_reg_safe_ldo: SAFE_LDO {
+=09=09=09=09regulator-min-microvolt =3D <4900000>;
+=09=09=09=09regulator-max-microvolt =3D <4900000>;
+=09=09=09=09regulator-always-on;
+=09=09=09};
+
+=09=09=09/*
+=09=09=09 * Needed for camera, but not used yet.
+=09=09=09 * Define empty nodes to allow disabling the unused
+=09=09=09 * regulators.
+=09=09=09 */
+=09=09=09LDO {};
+=09=09=09BUCK {};
+=09=09};
+
+=09=09charger: charger {
+=09=09=09compatible =3D "richtek,rt5033-charger";
+=09=09=09monitored-battery =3D <&battery>;
+=09=09=09richtek,usb-connector =3D <&usb_con>;
+=09=09};
+=09};
 };
=20
 &mpss_mem {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
index cffad734c4df..582bfcb09684 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
@@ -10,6 +10,12 @@ / {
 =09chassis-type =3D "handset";
 };
=20
+&battery {
+=09charge-term-current-microamp =3D <200000>;
+=09constant-charge-current-max-microamp =3D <1000000>;
+=09constant-charge-voltage-max-microvolt =3D <4350000>;
+};
+
 &bosch_accel {
 =09status =3D "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts b/arch/arm6=
4/boot/dts/qcom/msm8916-samsung-rossa.dts
index ebaa13c6b016..1981bb71f6a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
@@ -10,6 +10,12 @@ / {
 =09chassis-type =3D "handset";
 };
=20
+&battery {
+=09charge-term-current-microamp =3D <150000>;
+=09constant-charge-current-max-microamp =3D <700000>;
+=09constant-charge-voltage-max-microvolt =3D <4400000>;
+};
+
 &mpss_mem {
 =09/* Firmware for rossa needs more space */
 =09reg =3D <0x0 0x86800000 0x0 0x5800000>;
--=20
2.39.2



