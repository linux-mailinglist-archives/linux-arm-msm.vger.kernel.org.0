Return-Path: <linux-arm-msm+bounces-27769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F398945992
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 10:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7035E1C20BB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 08:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17581C2311;
	Fri,  2 Aug 2024 08:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ar5Y7CgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931471C0DF2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722586076; cv=none; b=eDh6+oWFnE8o/UACe7QZ3x/2iElv+Fx0N/gbhhimS6xYEXe29K7JtLwRLgBsK6WHSf9Gfxv/RypgJ58iUczQmZkh5PDNEMfV00Zy+MwGSIMJjACYw0SsUxIYQlVzBYXYN0rj6N3CQTtWvQMnS9c1bBmAnLr+KIJ0mXllC+0XxyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722586076; c=relaxed/simple;
	bh=41pfhpflsg7DV1+KUJw1txSwyG5YdldhU2NtRf9DNb8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVvp4D+n9EppUviYgBifnqwLf07GHztDuYzj8iifxxnGBfhYqG4FpULBHFXM8hlV+wL7G8atoEQEDZu8pqaE369W2c2TQ0rk6+F0Vde2P5wGeUs1g+33v0E7Blk9/L7Gg/Du6U4GvbwV2R3TGchp2umDi91lR/BZ83tSa1N48SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ar5Y7CgL; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722586064; x=1722845264;
	bh=NxfY5VIYEw47GQ6HQQDXvjOHUAitAdjIAcHz6X21/e4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ar5Y7CgLNThf/Z8fc+5ZrLEoOV4shfMG2ScuO2Ruh9BJnvKPjzKIgSOwhIWGFGkeZ
	 H2wiEsHE/jhCp5IinDwjC8Hgdbq7d080Psf2icb/p426DxNFE8HJ2wV4VXFgL3DyeK
	 2+1c6x+X+79n2oxR9Sz0PwV9cZRTptpNUTZTMnAp5kF+21CjNvBQcOlrVE7KVqJHBL
	 u6v17fY6V77oWImJuCYuqXw4mTzUQAFe+3oiVJx+Y1tINh4u9v4nLxTD/4RqjLMhQ7
	 wv0+1a6hkw9wwwHIJqgVGha82q9a/WBynCqWtdGXiZRlq0SynJa8jNTici5ishRShh
	 +xFMF8JO+yv4Q==
Date: Fri, 02 Aug 2024 08:07:39 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree
Message-ID: <20240802080701.3643-3-linmengbo06890@proton.me>
In-Reply-To: <20240802080701.3643-1-linmengbo06890@proton.me>
References: <20240802080701.3643-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 17725581a6c2c34a83eb2b6c798b2202465d0f00
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The dts and dtsi add support for msm8916 variant of Samsung Galaxy J3
SM-J320YZ smartphone released in 2016.

Add a device tree for SM-J320YZ with initial support for:

- GPIO keys
- SDHCI (internal and external storage)
- USB Device Mode
- UART (on USB connector via the SM5703 MUIC)
- WCNSS (WiFi/BT)
- Regulators
- QDSP6 audio
- Speaker/earpiece/headphones/microphones via digital/analog codec in
  MSM8916/PM8916
- WWAN Internet via BAM-DMUX
- Touchscreen

There are different variants of J3, with some differences in MUIC, sensor,
NFC and touch key I2C buses.

The common parts are shared in msm8916-samsung-j3-common.dtsi to reduce
duplication.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/msm8916-samsung-j3-common.dtsi   | 53 +++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-j3ltetw.dts | 20 +++++++
 3 files changed, 74 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j3-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index e534442620a1..197ab325c0b9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-grandmax.d=
tb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-grandprimelte.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-gt510.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-gt58.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-j3ltetw.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-j5.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-j5x.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-rossa.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j3-common.dtsi b/arch=
/arm64/boot/dts/qcom/msm8916-samsung-j3-common.dtsi
new file mode 100644
index 000000000000..ce5c1ee450f1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j3-common.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8916-samsung-j5-common.dtsi"
+
+/ {
+=09reserved-memory {
+=09=09/delete-node/ tz-apps@85500000;
+
+=09=09/* Additional memory used by Samsung firmware modifications */
+=09=09tz-apps@85800000 {
+=09=09=09reg =3D <0x0 0x85800000 0x0 0x800000>;
+=09=09=09no-map;
+=09=09};
+=09};
+
+=09reg_vdd_tsp_a: regulator-vdd-tsp-a {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vdd_tsp_a";
+=09=09regulator-min-microvolt =3D <3000000>;
+=09=09regulator-max-microvolt =3D <3000000>;
+
+=09=09gpio =3D <&tlmm 16 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+
+=09=09pinctrl-0 =3D <&tsp_ldo_en_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+};
+
+&gpio_hall_sensor {
+=09status =3D "disabled";
+};
+
+&i2c_muic {
+=09/* GPIO pins vary depending on model variant */
+};
+
+&i2c_sensors {
+=09/* GPIO pins vary depending on model variant */
+};
+
+&touchscreen {
+=09vdd-supply =3D <&reg_vdd_tsp_a>;
+};
+
+&tlmm {
+=09tsp_ldo_en_default: tsp-ldo-en-default-state {
+=09=09pins =3D "gpio16";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dts b/arch/ar=
m64/boot/dts/qcom/msm8916-samsung-j3ltetw.dts
new file mode 100644
index 000000000000..344e63588531
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-samsung-j3-common.dtsi"
+
+/ {
+=09model =3D "Samsung Galaxy J3 (2016) (SM-J320YZ)";
+=09compatible =3D "samsung,j3ltetw", "qcom,msm8916";
+=09chassis-type =3D "handset";
+};
+
+&i2c_muic {
+=09sda-gpios =3D <&tlmm 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+=09scl-gpios =3D <&tlmm 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+};
+
+&muic_i2c_default {
+=09pins =3D "gpio0", "gpio1";
+};
--=20
2.39.2



