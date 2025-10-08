Return-Path: <linux-arm-msm+bounces-76472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D6BC6456
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B944061DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897802C0F93;
	Wed,  8 Oct 2025 18:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdDpnFOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5292C0F96
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947683; cv=none; b=M0oA6ebkAIeSTBnkG2ATvTjHSvKF+RdQi2pYETwkLfpRAPKOldhlaQPduo+8YzKZyQJiozKK/wjGTGm1WRaqq/KRnWTjf7x0fd4ziki7EZVBmZdIt+6Bg5gut4+C4Kbphqp9kklZjtL3L9k1fdBdIrtBI7fwY+OoOUCKYEsMris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947683; c=relaxed/simple;
	bh=Kl4q/D7nfppLjlQrmRLj7XfvEwj3MSpqoJDjNllE58E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWx5zIQXcSW3UAzocVaxdo7NMlpVKUk+e+M2o2iG0WZ3P+8QvWeHTOZs8ItWcNAAhibLKEjRNpG+naiCgdvBLrG2m4mL7fF3pbmQQnmuGYy9AebpzWDgFDwQqgyqW35DjNMozCC4I1mWeWTrlKKrljr6nCv72eWIql/Eq8yinQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdDpnFOW; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57db15eeb11so179374e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759947680; x=1760552480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQLKb9Rkh1oQUK1I7BmlhT3z4f6StPjvIila7EBGntI=;
        b=jdDpnFOWG+/CyLYmq0o0zFrYQLnqRa/6OHDFajG6xASUENWqcfZ91VbZjv9Hr2O7Db
         5detF7cneX6Vw6dj30zIu5Ie4IwiqJz3gqAyBu1WnzijRYD0KpNlYMDvHLWmA2BMmWPp
         VwPUBKnbeYXHMT0a01gy0TvaprHIDp0brddI63vHeQsy/uMT0znj8mePd/nQ0aJEKh5I
         KDZVSAS7MtKjp+HGp2S+8rD48zefCs0ARQrOGI/VDYCu4rsL5WgoDw3JtmgZvlEBiT4O
         mejwC9RSWvECmz02DbOzgQnuv9rA2VcuowsLkh48eQmMgq21R3ZMrC6xEUQogLZdNebK
         PcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759947680; x=1760552480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQLKb9Rkh1oQUK1I7BmlhT3z4f6StPjvIila7EBGntI=;
        b=jqyL9Sa5VK18LJojwi3R31VnBzLl/HTeDYlHp44F8oDAQJIdQnwrIOWWyMDiVw+bvo
         fZnnl7+A1qe7rIQA0cbFDB/Uc8jfs52zEoSEeRpG2K4O/N/Turpz6OG4a0scB9PAFx5B
         IS+pV+fCLBWfc9dOIuGVfkAYuagQdTJNBE1cN+ZJzU4fG/pwCDJ6ThTSnUJToHaig2OI
         gcdvPNB3TICkhQQtaRkLLXJHdhdGpz4iKgV3D3VoRK6t+BAReB8T+4feFe248sR08JU7
         VemfHiHveBIUKk+6UU9mBToY3lFua+FKaNw6gW0tQ+BMZkwgj0wPt7QJ/mo5GMKH6QpF
         sSzw==
X-Forwarded-Encrypted: i=1; AJvYcCUs7VtSdqXIh+E5M03s9aQnxp426kx/ydnLP02PmNsh8aeltpThLlTEnF75oIffdirlAjfL+ZxUdUiWTHi8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36kbarY3v+rLERahnPmxE++ekOu/RX0jprL8zqRGM78v13hIz
	JgMDJ2itGoZ0hXF4C43v/jwXY2BEZA9kqiHLbn9I2VjhKdsYrfAdNiCw
X-Gm-Gg: ASbGncumYk9S42LMhxmFlEr8kr05MKk4unyr2m5E2n1XdIFaKiLAa0ojJHpr+hKZzN5
	3VVjKqsTv6JXMtsXA7pLujui0HTx3KZvcdVJDg28pBf6XXi98j5qnv+vaXDIJ9UJ/oSwsyWD7oC
	se1a4AZYwL2MnycbF03OulIj+rsNY6CwVMYuT/aluQbnoT9FLP5p5kdtbGcGMysi/1GnXVDyOxI
	fowHna758ZG5itqvcoug6b83ck2OksU+qMhw2L4Awev12ReMzqO2UcVBkzLplcDtGf4KFSYVQEz
	XjQT+OGIwruNOnH21dFEFq0yNOGoHI6UbKyoZM0AaAqgjJySU3wNI35c1I7ZuhXSIAiKn2cq9Qp
	dLKDwZXS2Q662rVparhvIaWZrJVaaH6DLr3/mb9BXOPBm
X-Google-Smtp-Source: AGHT+IEfKH/JfDemgTpsqSa+H3Z/Hc8hNRwaIMuAtNW9nJ/1vTUKfusljb2l85OO0h19Tn1iszjpRQ==
X-Received: by 2002:a05:6512:3da8:b0:560:8b86:75ba with SMTP id 2adb3069b0e04-5906dafc8a7mr1328825e87.52.1759947679418;
        Wed, 08 Oct 2025 11:21:19 -0700 (PDT)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm223930e87.90.2025.10.08.11.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:21:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
Date: Wed,  8 Oct 2025 21:20:20 +0300
Message-ID: <20251008182106.217340-3-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008182106.217340-1-xerikasxx@gmail.com>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
includes support for:
- UART
- USB
- Internal storage
- MicroSD
- Volume keys
- Touchscreen: Focaltech FT5306
- Accelerometer: Invensense MPU6515
- Magnetometer: Asahi Kasei AK09911
- Vibrator
- Audio input and output
- Modem

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>

---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 256 ++++++++++++++++++
 2 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..35f3ff0d6f18 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
new file mode 100644
index 000000000000..ebb548e62e02
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-pm8916.dtsi"
+#include "msm8916-modem-qdsp6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Asus ZenFone 2 Laser/Selfie (1080p)";
+	compatible = "asus,z00t", "qcom,msm8939";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		serial0 = &blsp_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		button-volume-down {
+			label = "Volume Down";
+			gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reg_sd_vmmc: regulator-sdcard-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "sdcard-vmmc";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		startup-delay-us = <200>;
+
+		pinctrl-0 = <&sd_vmmc_en_default>;
+		pinctrl-names = "default";
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
+	magnetometer@c {
+		compatible = "asahi-kasei,ak09911";
+		reg = <0x0c>;
+
+		vdd-supply = <&pm8916_l8>;
+		vid-supply = <&pm8916_l6>;
+
+		reset-gpios = <&tlmm 112 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mag_reset_default>;
+		pinctrl-names = "default";
+	};
+
+	imu@68 {
+		compatible = "invensense,mpu6515";
+		reg = <0x68>;
+
+		interrupts-extended = <&tlmm 36 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8916_l8>;
+		vddio-supply = <&pm8916_l6>;
+
+		pinctrl-0 = <&imu_default>;
+		pinctrl-names = "default";
+
+		mount-matrix = "0",  "1", "0",
+			       "-1", "0", "0",
+			       "0",  "0", "1";
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&pm8916_l8>;
+		iovcc-supply = <&pm8916_l6>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_uart2 {
+	pinctrl-0 = <&blsp_uart2_console_default>;
+	pinctrl-1 = <&blsp_uart2_console_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&mpss_mem {
+	reg = <0x0 0x86800000 0x0 0x5500000>;
+};
+
+&pm8916_codec {
+	qcom,micbias-lvl = <2800>;
+	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
+	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
+	qcom,micbias1-ext-cap;
+	qcom,hphl-jack-type-normally-open;
+
+	status = "okay";
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
+	vmmc-supply = <&reg_sd_vmmc>;
+
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&sound {
+	audio-routing =
+		"AMIC1", "MIC BIAS External1",
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS External1";
+
+	status = "okay";
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+
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
+	compatible = "qcom,wcn3660b";
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&tlmm {
+	touchscreen_default: touchscreen-default-state {
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		touch-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	imu_default: imu-default-state {
+		pins = "gpio36";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sd_vmmc_en_default: sd-vmmc-en-default-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	mag_reset_default: mag-reset-default-state {
+		pins = "gpio112";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.51.0


