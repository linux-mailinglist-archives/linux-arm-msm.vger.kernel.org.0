Return-Path: <linux-arm-msm+bounces-21377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD658D6F9A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 13:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C60E1C20C93
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 11:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA4C14F9D2;
	Sat,  1 Jun 2024 11:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zIXdZFJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F05478C87;
	Sat,  1 Jun 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717242862; cv=none; b=q9DyXbeJSX6QkgRokUTLJndf2CYllh2C+ovnI3oLOnnYv6HPJFUpaS3bcEPKxtTndm2Yd5+qALIRky5SWJ5TiiJRylJ0CRsJfchSFZdK07Io36hQ9Yyg8OfPvMDbZz6AnrWHQzlMe3gbB/3uRl2sTFTaWnLHDLqsPeL8IunyaKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717242862; c=relaxed/simple;
	bh=GZgagAbl3pI1q8QmFYrh1lpNjcc3oI0x3ybJngReqGg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgT9ktljJGtI50akIA6rpoPBvHhV3JIhW4DxOoCfgL7W7T/QEgNFAB/56t9hVa0NXNtIFwpzdZfCFeBGQsBW1bUGC4F07URjPT6pmsoM49LSif34M+KsKRL9xX/kZ7GQL9KXt5rOPPB25fbWkeXkYClW7m27sQpgV8tcXobOtl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zIXdZFJe; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717242858; x=1717502058;
	bh=MtCTYw7Gn7E83PCVOAeCzKtlwojtmSJTwf2afS8Gjcw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zIXdZFJe53VPTiNzK3P19RTQ/ncQBPXTbShyWHwFH3nbpd+eTskY+rOAvjfsKEXVT
	 zRJa6AG81/WP5s+ondyQ4COKU/GF1iXpP4KbP2vM720NlqpxeOXit2IZQ/rn2kulBA
	 R4SEDcBb5WPENkkNM+PQXOXt8meD1sEVsccfLjulTNff4gO77KdC98/E9NEVxPoFiH
	 Icy7oqdwzoh6RtmAj5QK/sy/hJpUfleZODpSVo28X6UgXa/4tqH3rNGwoRLWc7PPw7
	 tdtTjYjmyiL2IBdZGKysEv0jz8m81i08ItPELOTpzr7VuvcUqRWjKWI19SH+F/6V+o
	 WjNwPhM56PgEg==
Date: Sat, 01 Jun 2024 11:54:14 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Siddharth Manthan <siddharth.manthan@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/3] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add S3FWRN5 NFC
Message-ID: <20240601115321.25314-3-raymondhackley@protonmail.com>
In-Reply-To: <20240601115321.25314-1-raymondhackley@protonmail.com>
References: <20240601115321.25314-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 12b5a1fb871df2e67b66828b7f877b4dc019f383
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some variants of Samsung Galaxy Core Prime LTE / Grand Prime LTE have a
Samsung S3FWRN5 NFC chip that works quite well with the s3fwrn5 driver
in the Linux NFC subsystem.

The clock setup for the NFC chip is a bit special (although this
seems to be a common approach used for Qualcomm devices with NFC):

The NFC chip has an output GPIO that is asserted whenever the clock
is needed to function properly. On the A3/A5 this is wired up to
PM8916 GPIO2, which is then configured with a special function
(NFC_CLK_REQ or BB_CLK2_REQ).

Enabling the rpmcc RPM_SMD_BB_CLK2_PIN clock will then instruct
PM8916 to automatically enable the clock whenever the NFC chip
requests it. The advantage is that the clock is only enabled when
needed and we don't need to manage it ourselves from the NFC driver.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 29 +++++++++++++++++++
 .../dts/qcom/msm8916-samsung-gprimeltecan.dts |  4 +++
 .../qcom/msm8916-samsung-rossa-common.dtsi    |  4 +++
 3 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 4cc83b64e256..b5b7beab2209 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -79,6 +79,35 @@ haptic {
 =09=09max-microvolt =3D <3300000>;
 =09};
=20
+=09i2c_nfc: i2c-nfc {
+=09=09compatible =3D "i2c-gpio";
+=09=09sda-gpios =3D <&tlmm 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+=09=09scl-gpios =3D <&tlmm 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+=09=09pinctrl-0 =3D <&nfc_i2c_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+
+=09=09s3fwrn5_nfc: nfc@27 {
+=09=09=09compatible =3D "samsung,s3fwrn5-i2c";
+=09=09=09reg =3D <0x27>;
+
+=09=09=09interrupts-extended =3D <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
+
+=09=09=09en-gpios =3D <&tlmm 20 GPIO_ACTIVE_HIGH>;
+=09=09=09wake-gpios =3D <&tlmm 49 GPIO_ACTIVE_HIGH>;
+
+=09=09=09clocks =3D <&rpmcc RPM_SMD_BB_CLK2_PIN>;
+
+=09=09=09pinctrl-0 =3D <&nfc_default>, <&nfc_clk_req>;
+=09=09=09pinctrl-names =3D "default";
+
+=09=09=09status =3D "disabled";
+=09=09};
+=09};
+
 =09reg_motor_vdd: regulator-motor-vdd {
 =09=09compatible =3D "regulator-fixed";
 =09=09regulator-name =3D "motor_vdd";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts b/ar=
ch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
index 7ac86fd3c703..589dd006a746 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
@@ -46,6 +46,10 @@ nfc@27 {
 =09};
 };
=20
+&i2c_nfc {
+=09/* nfc@27 is on &blsp_i2c6 */
+};
+
 &mpss_mem {
 =09/* Firmware for gprimeltecan needs more space */
 =09reg =3D <0x0 0x86800000 0x0 0x5400000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
index 13a848d97b9d..e7f265e3c2ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
@@ -33,6 +33,10 @@ &clk_pwm_backlight {
 =09status =3D "disabled";
 };
=20
+&s3fwrn5_nfc {
+=09status =3D "okay";
+};
+
 &st_accel {
 =09compatible =3D "st,lis2hh12";
 =09mount-matrix =3D "1",  "0", "0",
--=20
2.39.2



