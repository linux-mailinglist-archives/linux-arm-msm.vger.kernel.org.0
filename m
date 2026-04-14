Return-Path: <linux-arm-msm+bounces-103213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICUlNkKL3mnZFgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:45:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C522B3FDC47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 121883020D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563943242A4;
	Tue, 14 Apr 2026 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="iukSMsVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02BD31F992
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192304; cv=none; b=o5YYsCjyzgjlxAAJvSNa7WVBPJgNbWSA0uKE54fvACYb/jsORU9IJJyqdiCzV0TrMyltHwJGiEzejYmVf53nqqwEdQfFDFzSTrMRDXvKwh5d16qIruuUDEqj5KFwplNdw9LjKFKXdrGJABoFRRHxTV8XhSOGyjV/HhAcCR3b5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192304; c=relaxed/simple;
	bh=0CF4/Bk0Wq2cuRuYQJOqFwMzntOOt7x4YDP7XlM1I9k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQ95sqX/xS64yh2p7csPYi7nMkgTgOrve92BmsxTIeh4S+P37UsDoJrc4GIqrSYJnIBNH5scFifLUEvnGT4LMBNil86EM1XW+9rNT5G+wdOOzG+7iekk5ziVKLb9HaycQvqVwRV5zmRgppFuMj+JvdcjW3vmJ/BEdWI0z7hEe54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=iukSMsVU; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776192297; x=1776451497;
	bh=wF7XGc8CIQcRmH2ZlRKGhnkkkCJEh4IZ11LTi6Y90gQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iukSMsVU7cAAVfZSIAaRZ2y6CMjBJrTWR8y2hF49xTYgpql1pyQj/ZBGVQGRkUXEP
	 EAiAsEWYucs2XT+SUJhlWvRczbsWhzbjF1TQgev7KGn0io69jZdrMRCtRNBfdXXR53
	 +cLW2F1+lzJakIknPW+y1Ugsz77BTe81VprWRO8w6aLhGtFTVTl8sdevGY9esPWSKK
	 DTUzlZhMDJLhy6YSz7FW1glEs4Y0v/SscWCGbmPrF/QBM8rdXaHmOBOVJRPbv3688+
	 ZKX1WGIkWm/sXEpmd9rK0Dk1yuQJHZM7dwFIQY0HIvIcs7rVHvc0sA6V4L5H5Ol3YM
	 /XJLw5Zec9BCw==
Date: Tue, 14 Apr 2026 18:44:55 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Lin, Meng-Bo" <linmengbo06890@proton.me>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916-panasonic-eluga-u2: add initial device tree
Message-ID: <20260414184429.168612-3-linmengbo06890@proton.me>
In-Reply-To: <20260414184429.168612-1-linmengbo06890@proton.me>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 7f4e5896de6de4358243d6ac5b38867072e8c426
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103213-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmengbo06890@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,proton.me:email,proton.me:dkim,proton.me:mid]
X-Rspamd-Queue-Id: C522B3FDC47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Panasonic ELUGA U2 is a phone using the MSM8916 SoC released in 2015.

Add a device tree for with initial support for:

- GPIO keys
- GPIO LEDs
- pm8916-vibrator
- SDHCI (internal and external storage)
- USB Device Mode
- UART
- Regulators

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8916-panasonic-eluga-u2.dts   | 149 ++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-panasonic-eluga-u2.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index 4ba8e7306419..4cbb4a079420 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-motorola-harpia.dt=
b
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-motorola-osprey.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-motorola-surnia.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-panasonic-eluga-u2.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-samsung-coreprimeltevzw.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-panasonic-eluga-u2.dts b/arch=
/arm64/boot/dts/qcom/msm8916-panasonic-eluga-u2.dts
new file mode 100644
index 000000000000..8eff59119760
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-panasonic-eluga-u2.dts
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+=09model =3D "Panasonic ELUGA U2";
+=09compatible =3D "panasonic,eluga-u2", "qcom,msm8916";
+=09chassis-type =3D "handset";
+
+=09aliases {
+=09=09mmc0 =3D &sdhc_1; /* eMMC */
+=09=09mmc1 =3D &sdhc_2; /* SD card */
+=09=09serial0 =3D &blsp_uart2;
+=09};
+
+=09chosen {
+=09=09stdout-path =3D "serial0";
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
+=09=09=09gpios =3D <&tlmm 107 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09};
+=09};
+
+=09gpio-leds {
+=09=09compatible =3D "gpio-leds";
+=09=09pinctrl-0 =3D <&pm8916_mpps_leds_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09led-green {
+=09=09=09function =3D LED_FUNCTION_STATUS;
+=09=09=09color =3D <LED_COLOR_ID_GREEN>;
+=09=09=09gpios =3D <&pm8916_mpps 2 GPIO_ACTIVE_LOW>;
+=09=09=09default-state =3D "off";
+=09=09};
+
+=09=09led-blue {
+=09=09=09function =3D LED_FUNCTION_STATUS;
+=09=09=09color =3D <LED_COLOR_ID_BLUE>;
+=09=09=09gpios =3D <&pm8916_mpps 4 GPIO_ACTIVE_LOW>;
+=09=09=09default-state =3D "off";
+=09=09};
+=09};
+
+=09usb_id: usb-id {
+=09=09compatible =3D "linux,extcon-usb-gpio";
+=09=09id-gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
+=09=09pinctrl-0 =3D <&usb_id_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+};
+
+&blsp_uart2 {
+=09status =3D "okay";
+};
+
+&pm8916_mpps {
+=09pm8916_mpps_leds_default: pm8916-mpps-state {
+=09=09pins =3D "mpp2", "mpp4";
+=09=09function =3D "digital";
+=09=09output-low;
+=09};
+};
+
+&pm8916_resin {
+=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09status =3D "okay";
+};
+
+&pm8916_rpm_regulators {
+=09pm8916_l17: l17 {
+=09=09regulator-min-microvolt =3D <2850000>;
+=09=09regulator-max-microvolt =3D <2850000>;
+=09};
+};
+
+&pm8916_vib {
+=09status =3D "okay";
+};
+
+&sdhc_1 {
+=09status =3D "okay";
+};
+
+&sdhc_2 {
+=09pinctrl-0 =3D <&sdc2_default &sdc2_cd_default>;
+=09pinctrl-1 =3D <&sdc2_sleep &sdc2_cd_default>;
+=09pinctrl-names =3D "default", "sleep";
+
+=09cd-gpios =3D <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+=09status =3D "okay";
+};
+
+&usb {
+=09extcon =3D <&usb_id>, <&usb_id>;
+=09status =3D "okay";
+};
+
+&usb_hs_phy {
+=09extcon =3D <&usb_id>;
+};
+
+&tlmm {
+=09gpio_keys_default: gpio-keys-default-state {
+=09=09pins =3D "gpio107";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09sdc2_cd_default: sdc2-cd-default-state {
+=09=09pins =3D "gpio38";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09usb_id_default: usb-id-default-state {
+=09=09pins =3D "gpio110";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <8>;
+=09=09bias-pull-up;
+=09};
+};
+
+&venus {
+=09status =3D "okay";
+};
+
+&venus_mem {
+=09status =3D "okay";
+};
--=20
2.47.3



