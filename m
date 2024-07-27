Return-Path: <linux-arm-msm+bounces-27133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2393E0DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 22:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99FAE1F21902
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63DB1741D1;
	Sat, 27 Jul 2024 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lax5XgDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001F37147
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 20:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722111281; cv=none; b=YQ7TbeDgQohmB14Gll1aDSM9zfRmQ6Rt5pVzyvkQY4oK+bFfyvoFZdcsfvucRhnZyYcYlmkkLqj1L6feKt2XcY5l8STuYOv/6kRT5tkeVn+rEREYW0BppYXzHmNKwkdQmoThtz6un/USObDpbu5esoquGPTuKTzWoCWXkw+kTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722111281; c=relaxed/simple;
	bh=0WyqCcZuz550BHwEaLp7GfV8RnMm8AdV6sdfP9OM00Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fps9cbN7F9bDgXTufhAxK0RCBNU2E/PhCCXAOz/ow5OUhZ13WiKj7xPg7KieExK3tX51viJ4g926hbQI+tm7+JKWxAt82SYPBQbf99LlbEGdMziyEfGjh+wDzvY9x2AtEY+80SOMb/oZEuOisjIla8JMq/0eBKCIo3uJYb7HLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lax5XgDK; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 44876240105
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 22:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1722111271; bh=0WyqCcZuz550BHwEaLp7GfV8RnMm8AdV6sdfP9OM00Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=lax5XgDKoAcCuZ7+JFkwvMwHepr8aMnMOG50CLv/5jPpfVMMBgYfqMZCH/JQjNcib
	 QfJp4RhaB8G+XhHO4ciGvgyka7zXtHI8ub7mj5Ik3DJSVn9kcEBzXeiOCowt8fxncy
	 cEAEjESpU9J4Ml9y1GbYUENmCw0SoiskQ/ZCUbyHg2dROcbHW4nbhpC5Qq3iwfrXED
	 mZFUmPAColUNxXJH3YgttvhiZbtvttiviGg+QqjSY6xU8XuS98dfgjRI3SMRRO1U0d
	 LDa51youPP9y2bK5FqGQ8ooqzTrsIlWHxa1mAXfEqZ8RX/2XTw7ohaiUU1lPsKd9y5
	 YubuB/cq9p0+Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4WWbSQ1SYfz6trs;
	Sat, 27 Jul 2024 22:14:30 +0200 (CEST)
From: Alexander Reimelt <alexander.reimelt@posteo.de>
To: andersson@kernel.org,
	petr.vorel@gmail.com,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)
Date: Sat, 27 Jul 2024 20:04:50 +0000
Message-ID: <20240727201413.114317-3-alexander.reimelt@posteo.de>
In-Reply-To: <20240727201413.114317-1-alexander.reimelt@posteo.de>
References: <20240727201413.114317-1-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make it easier for downstream projects and avoid duplication of work.
Makes the device bootable and enables all buttons, hall sensor, eMMC and SD-Card.

Signed-off-by: Alexander Reimelt <alexander.reimelt@posteo.de>
---
 arch/arm64/boot/dts/qcom/Makefile            |   1 +
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts | 231 +++++++++++++++++++
 2 files changed, 232 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0e5c810304fb..597481e3eeeb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-kugo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-suzu.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-h815.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-huawei-angler-rev-101.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
new file mode 100644
index 000000000000..38b305816d2f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * MSM8992 LG G4 (h815) device tree.
+ *
+ * Copyright (c) 2024, Alexander Reimelt <alexander.reimelt@posteo.de>
+ */
+
+/dts-v1/;
+
+#include "msm8992.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/* different mapping */
+/delete-node/ &cont_splash_mem;
+
+/* disabled downstream */
+/delete-node/ &dfps_data_mem;
+
+/ {
+	model = "LG G4 (H815)";
+	compatible = "lg,h815", "qcom,msm8992";
+	chassis-type = "handset";
+
+	qcom,msm-id = <0xfb 0x0>;
+	qcom,pmic-id = <0x10009 0x1000a 0x0 0x0>;
+	qcom,board-id = <0xb64 0x0>;
+
+	/* psci is broken */
+	/delete-node/ psci;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		spin-table@6000000 {
+			reg = <0x0 0x06000000 0x0 0x00001000>;
+			no-map;
+		};
+
+		ramoops@ff00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x0ff00000 0x0 0x00100000>;
+			console-size = <0x20000>;
+			pmsg-size = <0x20000>;
+			record-size = <0x10000>;
+			ecc-size = <0x10>;
+		};
+
+		cont_splash_mem: fb@3400000 {
+			reg = <0x0 0x03400000 0x0 0x00c00000>;
+			no-map;
+		};
+
+		crash_fb_mem: crash-fb@4000000 {
+			reg = <0x0 0x04000000 0x0 0x00c00000>;
+			no-map;
+		};
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_sensor_default>;
+		pinctrl-names = "default";
+
+		label = "Hall Effect Sensor";
+
+		event-hall-sensor {
+			gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+			label = "hall effect sensor";
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-vol-up {
+			label = "volume up";
+			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+	};
+};
+
+&CPU0 {
+	enable-method = "spin-table";
+};
+
+&CPU1 {
+	enable-method = "spin-table";
+};
+
+&CPU2 {
+	enable-method = "spin-table";
+};
+
+&CPU3 {
+	enable-method = "spin-table";
+};
+
+&CPU4 {
+	enable-method = "spin-table";
+};
+
+&CPU5 {
+	enable-method = "spin-table";
+};
+
+&pm8994_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm8994-regulators";
+
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_l1-supply = <&pmi8994_s1>;
+		vdd_l2_26_28-supply = <&pm8994_s3>;
+		vdd_l3_11-supply = <&pm8994_s3>;
+		vdd_l4_27_31-supply = <&pm8994_s3>;
+		vdd_l5_7-supply = <&pm8994_s5>;
+		vdd_l6_12_32-supply = <&pm8994_s5>;
+		vdd_l8_16_30-supply = <&vph_pwr>;
+		vdd_l9_10_18_22-supply = <&pmi8994_bby>;
+		vdd_l13_19_23_24-supply = <&pmi8994_bby>;
+		vdd_l14_15-supply = <&pm8994_s5>;
+		vdd_l17_29-supply = <&pmi8994_bby>;
+		vdd_l20_21-supply = <&pmi8994_bby>;
+		vdd_l25-supply = <&pm8994_s5>;
+		vdd_lvs1_2-supply = <&pm8994_s4>;
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		/* sdhc1 vqmmc and bcm */
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-system-load = <325000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+
+		/* sdhc2 vqmmc */
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <22000>;
+			regulator-allow-set-load;
+		};
+
+		/* sdhc1 vmmc */
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <570000>;
+			regulator-allow-set-load;
+		};
+
+		/* sdhc2 vmmc */
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <800000>;
+			regulator-allow-set-load;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,rpm-pmi8994-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		pmi8994_s1: s1 {
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+
+		/* S2 & S3 - VDD_GFX */
+
+		pmi8994_bby: boost-bypass {
+			regulator-min-microvolt = <3150000>;
+			regulator-max-microvolt = <3600000>;
+		};
+	};
+};
+
+&sdhc1 {
+	mmc-hs400-1_8v;
+	vmmc-supply = <&pm8994_l20>;
+	vqmmc-supply = <&pm8994_s4>;
+	non-removable;
+	status = "okay";
+};
+
+&sdhc2 {
+	vmmc-supply = <&pm8994_l21>;
+	vqmmc-supply = <&pm8994_l13>;
+	cd-gpios = <&pm8994_gpios 8 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&tlmm {
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
-- 
2.45.2


