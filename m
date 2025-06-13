Return-Path: <linux-arm-msm+bounces-61259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAECAD9431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 20:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58F643B09FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 18:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341612253BC;
	Fri, 13 Jun 2025 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="JceNp00k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from olivedrab.birch.relay.mailchannels.net (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9BB2E11AE;
	Fri, 13 Jun 2025 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838134; cv=pass; b=OgaDWy0yr/YkSqak4RUawI/tZLf3asamY0tjeJG/5eMHd4YLlQrQGCOlVN7Iiau+vL1OTqk+NE1wfMQMEqQLrWTwjCXOW48dZmYJpx4c46DpyF3oZs90FEM7i7F53FxDcbA9ZCX0rJ0RDGeeC8kVPpDPs6HkUR4EyHw3Jnh+kqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838134; c=relaxed/simple;
	bh=J8kKyaakj1aYx0rm37/TO+tMsW2zUNsq8DTgJmYfnVE=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=lKR9BhMkoiBJo72yR01c7uCKgmAJ2v20+KxxyGLKg8bwkMLMoOz6tGe3z03vot1rx2VwazrKioWC4DUrm2Nh0lg9jvJ8DN1nfbnQB1D8ohmxTKZ4MuIMQ2tcbiqSDCiMAlAjiVQzuWrmNmFgmEj43xw5YiqWzWy6bS2rYjqVjNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=JceNp00k; arc=pass smtp.client-ip=23.83.209.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 054222C5C53;
	Fri, 13 Jun 2025 17:51:19 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.96.75.158])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 021AA2C4FC5;
	Fri, 13 Jun 2025 17:51:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749837076; a=rsa-sha256;
	cv=none;
	b=DCtDkgRNYob1nmrIuTuDxwgJO62lmyI0VXLhpyteLj04M7DyrSY1Jncmym66JzZh9IalMS
	Jv36CrabE9drhhLe5/BQT1dKClcDsAgFGiAUekWR8JgAWMZdQdhSRUmCi/PVQ98EqKUuPj
	liM2K1zKyNmyIVIxx9N9BnZVAJYwN4ONMXk3Uzzg8Thk8NLUi2R68j9rz42tmufzayAX1d
	W+ZDKx3cMoz6m+6G1U92Iy2upNexdowOgcmfO6xq+oahjK7L55FjtMB4bqRw4W2FSVyWyS
	PEqHqE/tyTJhUIxyPiDGKEwgCJ+3qX/kw93g9vcgOqZfxjMxNcMDNEM8+rfD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749837076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ywr5D5/TX6NEUGOjUEwyjTA/Ckv+ZE65Ks4KW4iIrX8=;
	b=tmMwonuFNdub6knG8QJqaMHxk2NUaX6Ico/v3aQ11nDFX8JINlI26h12wSymvsO/pxOiY6
	7GHzFh1nZYNu9uBfqhVC/PvcR+laBXYBPc7zAwW/foZhbubTx2SXckDgRX9VkpEwhvhwUM
	bzPAJseEKzmmKpfCkVrp6yKMPuJAsg2gL7V3gJmYlzx0m4zBl2sN5Ivo0j2kPiL3l9kDIW
	2HkXsiCCUh9yaL+uK3rxdpLJB/im8I8e+wK1daB4FvcbXqAvcfYhS1JYAMPiAgvI33OIGH
	Tg7T4JboqECgmeIK49DZKEAPHW2ClTSsgtOV6bfV6NwPhpw6Q/Msfr+4iuEpew==
ARC-Authentication-Results: i=1;
	rspamd-5859dfb5d9-lnjzv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Battle-Descriptive: 0e5a00b20322edec_1749837078694_2226515485
X-MC-Loop-Signature: 1749837078694:2937717600
X-MC-Ingress-Time: 1749837078694
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.75.158 (trex/7.0.3);
	Fri, 13 Jun 2025 17:51:18 +0000
Received: from [172.17.0.2] (unknown [36.79.97.133])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bJn4n3LjnzH9gKX;
	Fri, 13 Jun 2025 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749837068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywr5D5/TX6NEUGOjUEwyjTA/Ckv+ZE65Ks4KW4iIrX8=;
	b=JceNp00kgbv3+mzs3RPmS0Mu9vhDfJWkAUf+jnWew9OBrwqyJqGPjRKT3wOCaKk1btDT1c
	zbTKaRHwonIlRdLAw2rqgkdJ3qUVgoTOOV/vIUdkIwkMrA0sZfj/naO7xaVlFm8gkzEpNh
	kpQyn5zAdyvc197kg/Y5qjBEeT0cJe/qm++uqZDPQZgH+Uwuswk0J4OtsmGzSk57OaNDfm
	EVPWE7tZs1GMUZN5/RtuQysnWY07ahPletNRceIpc8eMCHrKbR37lS/YB8p4LTixMkCYEJ
	mYnXx0O95h+l9o0XDgSMzLmYIzlDJd/AwFB0CvbWnAzad9xhU+N8PoQDxUmo+g==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749837006; l=9928;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=J8kKyaakj1aYx0rm37/TO+tMsW2zUNsq8DTgJmYfnVE=;
 b=QJpr4VybUGg/Ex9xMz6khaGn3HDqeMI69niccYMhcnCOEqQbbZeA1ldju2DTb4zwqFuwcpHkH
 4mt4AvJdxGeBNV/kEPm440/PdWk00/vTrCtieM4OnXds/MNHEd7J+/A
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri, 13 Jun 2025 17:51:05 +0000 (UTC)
X-CM-Envelope: MS4xfG5a+boJu2i93CZIsVZh3X6/H/Fb5bihLyJ8U+xsoCbM8+HcAoN4/S0f0Bl+lbqt+oENd7cN5gsl855fSHkJ5T9CgaibSNRjk+ENGU7PCGOxA3SHJVtX a7HIWe8NgaRbeY0G52TVb1AD5EdlViE84fjeTYWwfo4575OipChVkoAclUtDKap6ebB5G/c7kTg2yC7MrBUV9iojLHpRN28WylvviSTuQeP+XiNEJ5WxFiJo 5Mi4lzpFkAn2u/6l24sBez6ukIYKtWLHeKMI9FbL3v0ahvs58+lDBN7d6l/bXNSKYliOPLFXI9zb5+9qNDtIWrTQTJQq0QslIeABJrVeQtZMEN1I6+Mrd31t jSBRVA3XhK0PoQBZUFq8mR6mgKV7u43BESkBS1bD2bfIPsO7KBpriYDrV41umaFgcgkhikccAk33b9yomB2Fs89u3rwLIsZnUS6X/rstiu+eSo15o260e4i3 kpaBs4l/MZKnl5W9jBPgucQZIW4nySkvTAa0PIIeFrzSpgt754tiyS2hflY=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=684c650c a=/sUT9SOQbq9tkq2xjVjq6Q==:117 a=/sUT9SOQbq9tkq2xjVjq6Q==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=SKXNq62mckHbbuXN77oA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
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


