Return-Path: <linux-arm-msm+bounces-61982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA8AE318C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 20:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F1B16EBC1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 18:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5272625;
	Sun, 22 Jun 2025 18:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Zi9hxzdA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from heron.birch.relay.mailchannels.net (heron.birch.relay.mailchannels.net [23.83.209.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C5A23BE;
	Sun, 22 Jun 2025 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617936; cv=pass; b=sAF2yIfJSr8Vp+lsi+5zvHjxKwvYDN99vMPzPC+pFOLjSWhNdi6uTmfun7OMpeWcV0+LYnlurHn70QrjeWShc7S50kHK7/0qbqXH6WnK9+zJRuVT6uemH9jZI+c+R/v01ruqjOLnWqo2grwZhLO3HEZv8DS99L3U6/FeNzHTCHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617936; c=relaxed/simple;
	bh=5o4Xx0YIjmi3whMUIkGlW/bBDikQANX27oJSF1yyv+k=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=kAUckPQYwtymDA1jCrSd8D8BjFfk5EWTld0Lbq3LazBrNpJvOdXYmUkhcdpWC1wFckVzOvN1ve0HGzraMAa3ZRrPl/ONccLynXUqfQoU7vHR41pyQM6d8comb3RLAkyt5z9xEHp7g8kzC4kmOIvSWj/P31gvx5Fo9xBsmHl2D+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Zi9hxzdA; arc=pass smtp.client-ip=23.83.209.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 714F72C43A9;
	Sun, 22 Jun 2025 18:26:56 +0000 (UTC)
Received: from fr-int-smtpout7.hostinger.io (100-108-116-219.trex-nlb.outbound.svc.cluster.local [100.108.116.219])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7A8922C4757;
	Sun, 22 Jun 2025 18:26:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750616816; a=rsa-sha256;
	cv=none;
	b=Y/cT2nqiOJLDwzo10sRVEqlkMM8SCylCfqdZ03rf4JcVzH++mALhlCF48mfMqe/Cfqck1t
	zX1dJ6latSqMx4cMEtPL2xakIM0ISiZn5PR5f+vA32T2T89DzfkoJB9RfOj1nRz9tD0e6K
	fA6/QsalQrXez8rW55wZSCxHVIjFnsTuqRilwYqPakaNjsiryZnkeRhmUI44Aso4ZQ5QKf
	Xjf33D3kqwP9PxIVm/voctE93VswRaJ9YDD6r+iB3B9VJg9i4b6MvJUy1FuEpkcoOpYVk/
	jqddctujpdm9FmS1j5sDCS+C2CURob2e/cMB/nwAc8bO9pGpIb10+EAAqDoFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750616816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=2LOSh8A1Hd1NEb8rcPJW7INfwH0iCGSOmcirzCKGYf8=;
	b=iyJMkJxEgxhK3OjlMJyiIC3/oNzQPZpPTwU4w30iHHh3nUTuIMLGGb785OsxpDFqOacrk+
	B38vwCp/VnXjNqqZzS8QRwlsdmrdeh1oFhRZlD1M+OFkd/1nK2v1RbTxi3/cz6hc2ueIfw
	YNphTpIW479ZsBkfYgMKsHgsIoUw4w24lqq/fcVqNIPpMFhSrIQWfCVL2bCU2gJ7jCJIVf
	Tejc2kRbzTAEbKX80xx3akEBcqlZhaHyot8cTbV5oZT8vDgg3/KNPwfWWU3FQeW9rfCAqT
	C1WaGFZm8PQvuQ2L6QiDqPImmEW5ZNBdeWud0rG/n8q29WtAhdr74W+L45MuoA==
ARC-Authentication-Results: i=1;
	rspamd-6597f9cdc7-nwjs9;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Arch-Imminent: 7c8ac1895105cc15_1750616816406_1981708902
X-MC-Loop-Signature: 1750616816406:1949200895
X-MC-Ingress-Time: 1750616816406
Received: from fr-int-smtpout7.hostinger.io (fr-int-smtpout7.hostinger.io
 [89.116.146.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.116.219 (trex/7.0.3);
	Sun, 22 Jun 2025 18:26:56 +0000
Received: from [172.17.0.2] (unknown [36.79.123.39])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bQKRt1fdTzKLLHh;
	Sun, 22 Jun 2025 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1750616812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LOSh8A1Hd1NEb8rcPJW7INfwH0iCGSOmcirzCKGYf8=;
	b=Zi9hxzdAJ4sMLAuc0t1IMO3J27n5HJeMTwEg9aENFW3xsJkfpAfqOnNrsTfuGP6teYg6om
	zZQ2lodd+BmL1SxgqKlH9GQuKUPLVIlE1sCREA9Yxs31v33kI8Ne7I5ZtHDhYo4c6aprSO
	WYxVsDPyDeEkREZyOPU5S9uXWvqHNcIzCC9t/AlXzhySJa4aB0GVZ670hY8OH6BWGt3HDq
	vp2/gsZTHbRnBJ0POfjWaT1t+f1b3GC7JXZpHqAIH7sc9WzMIhhLkshTmDBIUq65TY01p5
	8T3brEB2rKfiy0aZorq3cvIkJBSktxNWf8gGqsjoXGfHTy4GmQXUMtjVmuwHNg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-msm8960-sdcard-v2-5-340a5e8f7df0@smankusors.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750616796; l=10478;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=5o4Xx0YIjmi3whMUIkGlW/bBDikQANX27oJSF1yyv+k=;
 b=zl/wibUr0UGKb0ufHWrmlhurKPZgUK8glXsspNMT8PVeO4q9JOK4kTToHMc0YnWq3KTHgVTKA
 PtxKpp8H6jmBN9a9e4QZBRe9SqTIEiEaiFVP4qpFtWu0gQfTdv2aU8z
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 22 Jun 2025 18:26:50 +0000 (UTC)
X-CM-Envelope: MS4xfPuxofgR9IDPy49uyTJC+Y8spseeNr67E+6+r1bbKHDtPFtXmpejJhUgze2BhrvT9UzJvDgup4gmLw6Aefh20GP/MryJgDmwfsTWPhsh6lUOVIAgu3pp eXuHiFsO4v6nBUYe7vBSSVCsCtf3Trlf0eWvK+NrHpvzMLPTFgc+1z8yhYgAPGJgkV0SRVm1Dx46/VHe8LYSLPyNIE6SEy2gNoYktN1hxyq6+5Ch/u68xZI+ pb7kxxY57HWbmKdl9OeU+eQEDm5aSbK9S3rBPeHT+iB9zOWWmfbo9UKvB1M2wkw+qqEhaLPnMMqba8OwTu5Lq1qbHP7dlg79gLoZSeeg9yJXwk/847pi3NlC XNcKJ3kzKZU5VSxQw2X8HW0jI1SJhFuhbbX9hbDYJXSmjS4+70pt+cYcldi+qJphwmcVnkXTUxEz965SfARjPFK9Yh+1TjvL740TNgh9+w7hLh3if5YoD0l4 Cew2SeN0urNC5w5dkU5sxd6VBZJk8sOOWIDOlmcHIKy8NrQGi/fdYh+eSes=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68584aec a=vFgqIyFt8cetXi1S0ACNwg==:117 a=vFgqIyFt8cetXi1S0ACNwg==:17 a=IkcTkHD0fZMA:10 a=Gbw9aFdXAAAA:8 a=wxLWbCv9AAAA:8 a=qEgME6jAp7zO1P8wChAA:9 a=QEXdDO2ut3YA:10 a=9vIz8raoGPyDa4jBFAYH:22 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Add initial device tree support for the Sony Xperia SP (codename:
sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC.

There are two variants of the Xperia SP, one without LTE and one with
LTE. This device tree should work for both variants, though it has only
been tested on the non-LTE variant.

The following are currently supported:
- Serial console support via gsbi8
- GPIO keys for volume up/down buttons
- PM8921 keypad with camera focus/capture keys
- eMMC (sdcc1) and micro SD card (sdcc3) support
- USB OTG support

Other hardware features are not yet implemented.

Booting notes:
Booting a kernel requires using the Sony ELF boot image format, which
embeds the kernel, ramdisk, RPM firmware, and cmdline. This can be
created using the `mkelf` tool. For example:

  python2 mkelf.py -o boot.img \
    kernel+dtb@0x80208000 \
    ramdisk.img@0x81900000 \
    RPM.bin@0x00020000,rpm \
    cmdline.txt@cmdline

The resulting `boot.img` can then be flashed via fastboot. A detailed
guide, including an alternative method, is available at:
https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 2 files changed, 362 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 0c1d116f6e84f76994aa8c8286350bdcd1657a42..220ee204c8569e7039edae090bf1d0db379ba54e 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8926-samsung-matisselte.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8960-samsung-expressatt.dtb \
+	qcom-msm8960-sony-huashan.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
 	qcom-msm8974-samsung-hlte.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f2f59fc8b9b61e18b0ec4ed1fc2d813585a75f15
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Antony Kurniawan Soemardi <linux@smankusors.com>
+ */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
+
+#include "qcom-msm8960.dtsi"
+#include "pm8921.dtsi"
+
+/ {
+	model = "Sony Xperia SP";
+	compatible = "sony,huashan", "qcom,msm8960t", "qcom,msm8960";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &gsbi8_serial;
+		mmc0 = &sdcc1; /* SDCC1 eMMC slot */
+		mmc1 = &sdcc3; /* SDCC3 SD card slot */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8921_gpio 21 GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&pm8921_gpio 20 GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+};
+
+&gsbi8 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
+
+&gsbi8_serial {
+	status = "okay";
+};
+
+&pm8921 {
+	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921_gpio {
+	keypad_default_state: keypad-default-state {
+		keypad-sense-pins {
+			pins = "gpio1", "gpio2", "gpio3", "gpio4", "gpio5";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			bias-pull-up;
+			input-enable;
+			power-source = <PM8921_GPIO_S4>;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			qcom,pull-up-strength = <PMIC_GPIO_PULL_UP_31P5>;
+		};
+
+		keypad-drive-pins {
+			pins = "gpio9", "gpio10";
+			function = PMIC_GPIO_FUNC_FUNC1;
+			bias-disable;
+			drive-open-drain;
+			output-low;
+			power-source = <PM8921_GPIO_S4>;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		};
+	};
+};
+
+&pm8921_keypad {
+	linux,keymap = <
+		MATRIX_KEY(1, 0, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(1, 1, KEY_CAMERA)
+	>;
+	keypad,num-rows = <2>;
+	keypad,num-columns = <5>;
+
+	pinctrl-0 = <&keypad_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&rpm {
+	regulators {
+		compatible = "qcom,rpm-pm8921-regulators";
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s4>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+		vdd_ncp-supply = <&pm8921_l6>;
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vdd_l21_l23_l29-supply = <&pm8921_s8>;
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+		vdd_l26-supply = <&pm8921_s7>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
+		vdd_l29-supply = <&pm8921_s8>;
+
+		/* Buck SMPS */
+		pm8921_s1: s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		pm8921_s2: s2 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		pm8921_s3: s3 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <4800000>;
+			bias-pull-down;
+		};
+
+		pm8921_s4: s4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+		};
+
+		pm8921_s7: s7 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		pm8921_s8: s8 {
+			regulator-always-on;
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		/* PMOS LDO */
+		pm8921_l1: l1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		pm8921_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		pm8921_l3: l3 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+			bias-pull-down;
+		};
+
+		pm8921_l4: l4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8921_l5: l5 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l6: l6 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l7: l7 {
+			regulator-always-on;
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l8: l8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l9: l9 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		pm8921_l10: l10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l11: l11 {
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l12: l12 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		pm8921_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8921_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l16: l16 {
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l17: l17 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l18: l18 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		pm8921_l21: l21 {
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <1900000>;
+			bias-pull-down;
+		};
+
+		pm8921_l22: l22 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+			bias-pull-down;
+		};
+
+		pm8921_l23: l23 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
+		pm8921_l25: l25 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			bias-pull-down;
+		};
+
+		/* Low Voltage Switch */
+		pm8921_lvs1: lvs1 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs2: lvs2 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs3: lvs3 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs4: lvs4 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs5: lvs5 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs6: lvs6 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs7: lvs7 {
+			bias-pull-down;
+		};
+
+		pm8921_ncp: ncp {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+	};
+};
+
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	status = "okay";
+};
+
+&sdcc3 {
+	vmmc-supply = <&pm8921_l6>;
+	vqmmc-supply = <&pm8921_l7>;
+
+	pinctrl-0 = <&sdcc3_default_state>;
+	pinctrl-1 = <&sdcc3_sleep_state>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+};
+
+&usb1 {
+	dr_mode = "otg";
+	status = "okay";
+};

-- 
2.34.1


