Return-Path: <linux-arm-msm+bounces-27851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19A946CE8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 09:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76EFAB21773
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 06:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA1D17C64;
	Sun,  4 Aug 2024 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TtOH3wAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69436134A0;
	Sun,  4 Aug 2024 06:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722754786; cv=none; b=ReW8KxeCY60u6DJYqDVbHtMtLpRL2va71ux5abJqrCzixK63NW8OE2mNjo6Yp0XB5uUQpyp0dCKMjYm/VapmhUL7x2x4LXCI1RZpYKZjpaUdIJ00qFn94qIffnjPvybzKNXQMQXRPAIAlVYw3J0XM+tJSjm0BPq4zpI9ihkm/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722754786; c=relaxed/simple;
	bh=nsRQ1etX1+W7HruMiV9my+fjXwFdsLYCejqobYmOaCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CVnRnsQd4cugZr6eTKK3KRWjqwhmhTdgeomhREl4aLKO54pC7Mm2+TB4TZZJmQhqFjxMLa6WzgAdO8dcGLNzc/asABGUmhOcNWvSRiI24EEbORyU9Su4FhS4P5KWQOgApQpIgYfzg2Rt6bbo0ZCUhFnA5o6gRPBjc6O+xzr+RPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TtOH3wAX; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722754775; x=1723013975;
	bh=jV/a7Anm1CtcuENFnTfCvdUEKmbYAc87EIA67wPbdHo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TtOH3wAXkbTscKMDulThBPrAnuzTXPTCoWCpvV6X7bkgpWOuJD9QsNTNQZrg8cJp/
	 FatXS7/Bxg5RBkxSI0G3wWVm5QF7LEeVG/Y9VrjPRAWnv++mTYzUUq89m57xMaDA0l
	 Qlj+LIJmj8uK7O2GJZTQouDzV07J059ax+D8hJrPgfOjZlBXnLzMv9hqlmfzUJB2BZ
	 MLGaTSVshNMmvXAtrs7giAwQJPD2UO6DIfKPG4g1wPeYN0h9JBm7u5k6hV3f4ZTsRh
	 yRNutdUedN90DLzxBsYW8aO1DFNg7tb8RSiRZRcu/r7kgUUH+Dwz1uLXi3c0YfY4Kp
	 W0K6uatZjmSBw==
Date: Sun, 04 Aug 2024 06:59:32 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree
Message-ID: <20240804065854.42437-3-linmengbo06890@proton.me>
In-Reply-To: <20240804065854.42437-1-linmengbo06890@proton.me>
References: <20240804065854.42437-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 3366380bf8c6aefc5f8e47f76d81c88753b23dd6
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
- Accelerometer

There are different variants of J3, with some differences in MUIC, sensor,
NFC and touch key I2C buses.

The common parts are shared in msm8916-samsung-j3-common.dtsi to reduce
duplication.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/msm8916-samsung-j3-common.dtsi   | 62 +++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-j3ltetw.dts | 31 ++++++++++
 3 files changed, 94 insertions(+)
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
index 000000000000..1d74cccc438a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j3-common.dtsi
@@ -0,0 +1,62 @@
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
+&accelerometer {
+=09vdd-supply =3D <&pm8916_l5>;
+=09vddio-supply =3D <&pm8916_l5>;
+
+=09mount-matrix =3D "0", "-1", "0",
+=09=09       "1", "0", "0",
+=09=09       "0", "0", "-1";
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
index 000000000000..a26d2fd13c94
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dts
@@ -0,0 +1,31 @@
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
+&i2c_sensors {
+=09/* I2C2 */
+=09sda-gpios =3D <&tlmm 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+=09scl-gpios =3D <&tlmm 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+};
+
+&muic_i2c_default {
+=09pins =3D "gpio0", "gpio1";
+};
+
+&sensors_i2c_default {
+=09/* I2C2 */
+=09pins =3D "gpio6", "gpio7";
+};
--=20
2.39.2



