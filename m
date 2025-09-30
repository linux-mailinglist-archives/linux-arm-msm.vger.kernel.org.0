Return-Path: <linux-arm-msm+bounces-75588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C49BAD0E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8AE3B7595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF22254B18;
	Tue, 30 Sep 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4AOmVS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1DD1DFD8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238907; cv=none; b=qbJvsZbapPvedzl0TEO0/LpyEq4ckVJeZwEkoWS7AccqV7LkdyXYJcffNn4pOhB2KXaUEuUF19EI0OIpKA8+0otQ+JhXQNXKH3/zLJ39KRt1SjcvC8ceIXHc8oQyPslcU98kEmmUqZUAWYJFI3TBpXo5pQImZRmXMZp5KcUzsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238907; c=relaxed/simple;
	bh=aQCtEDogYo5K+HhgSRY3Q/D4yqHNS/3tcEzXSuSbqQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7VH/VzatxTpFgvIOnDE06ajacSfwSOqqgZjvq9AljG4aPug4fnp7zgxENdZpnVVXa0HiLgdatbI26dZOBJtOrDm+O0+axErQAMNLnWxTqcXJxNxa3QJk7r33kKMUy2FkdEnzTj1AjDATyyajcGZaX5JSGkDl7TfW4flLsvwU0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4AOmVS9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3d5088259eso410620666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759238904; x=1759843704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixK1ETMduGm99BlTcoFj/aPFW7iMIuM7nmIo04sLrUc=;
        b=B4AOmVS97VrWljsnLDSotLlBE4oWv+/Vx6gD0m/mXC2KP00SyX7buc1bK3laznEJgn
         OChqwB6DdysnPbR/hZbgbfjdpU3DB6O78XQAlo7ke/GTBhlwL/BTIPWBGqg3EDAB2LU/
         +LtWWdigbNoXwUqJoefygUKU0peJlGyjGt2WAr8/HyP97RzKC0uecNIRCTE6mxAIN8Rv
         h92q9ilaDFzKh/SkLEO9TA41JbirKVxEI5nklqRgVt/gdzju0dANVifsUDUtKRDypFuR
         5NGlSWrjok6UJX5RwSzkiSU1gSd9WWJK0f/xoCf18U+qZiw+leYdHW+lWVb/bMj7muP6
         +9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238904; x=1759843704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixK1ETMduGm99BlTcoFj/aPFW7iMIuM7nmIo04sLrUc=;
        b=C+115Vt/LqiecXBQT1YWqFbm2CeNKDxR5CVGxwWsd2sjyerTArdxjUcimduBPXIkxs
         nSSmhJ6vLM3y2GXOAT3HO5BoiJVOPDBShquZcrAcL5z2P0imQhej+gdGWKr756C4WE6X
         AodvXnRkCZroq8qPB59Z4YQ0jikDkJbV2aqbeJzVxsbVc5cEYrQFujrValAY2hGBDkq3
         QQvp0YdhM1plH5bNHno1d/dk9aRKRwT6YHdoVeZIUUiL2d+uXsYJGP4QD9Y/vRNwXW77
         5Y5zYuS7koCesvrD/LkTDH9yjOCimJuOMfvFEDvuHQCXpLORFSwymiydRJz5BVI7xCpe
         OxMA==
X-Forwarded-Encrypted: i=1; AJvYcCVsIyAKH0kUQSMmFaahK+NYclRosWC6babpXVNw1sOWfBYyCdBTLySESc/sBEgwS0P00ieTTq0XKNDeirQS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wrtPnN137u8DEWMrZF6wLMUcUoUV+YoDa4zvMrjYYWqc5X+S
	rkV0x50aY3Zv+pWG4cJp87WZkLXneEBwgDFBPQNJ5BJf0TS3PhMFFgHG
X-Gm-Gg: ASbGncvsTWxISNQGxAHkJ3TxNk2oo3fE1dD+1RBt6xU238Q3X2W1Yl2AhrCg2z/LPCn
	hn4EQLlBUjbUUeQMAabHMuW63G16LmDr9W+VHyfUI7XW7f7vLQXR4LcXKpukt6raH2iC3zw0ur+
	oViLFkZFlFcnXvN4YAclZTwwwx5LTcm29y0FU6k7y5gSZkS8ueqz4h3dSz14gIuMl2GSzWMHbDy
	hMZjniCMdLagmtNY0D8EncHI2BJG98g2boszEilsLoE+u1t032KOh7PoP8Hivsxf0XTnjDcXWcn
	PW8OkCALFXdSKFSJJapt4Wc7cZkVtR8w9OLxaPFGZlr4ypoptfrfAa4chu2jA3Ew2VR8Gb4h7T5
	0DAIh1PKiZlztFsCtXJWqsYBrvOC6Vy1bIQEcZbUPJjHshY6WNrWHl1k=
X-Google-Smtp-Source: AGHT+IGLnx7R2B80B9d9tAufNTvF/3v0WxPgD8/yTRQ1sR+rOyEoiQbgk51XpXcC1IGp95/m0ONvpg==
X-Received: by 2002:a17:907:3c8c:b0:b09:c230:12dc with SMTP id a640c23a62f3a-b34b7209e46mr2179868866b.8.1759238904061;
        Tue, 30 Sep 2025 06:28:24 -0700 (PDT)
Received: from crusty-box ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1143934766b.24.2025.09.30.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:28:23 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
Date: Tue, 30 Sep 2025 16:20:10 +0300
Message-ID: <20250930132556.266434-3-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930132556.266434-1-xerikasxx@gmail.com>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
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
 .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 255 ++++++++++++++++++
 2 files changed, 256 insertions(+)
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
index 000000000000..687ba02a8139
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -0,0 +1,255 @@
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
+	status = "okay";
+};
+
+&sound {
+	audio-routing =
+		"AMIC1", "MIC BIAS External1",
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS External1";
+	status = "okay";
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
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
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	imu_default: imu-default-state {
+		pins = "gpio36";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	mag_reset_default: mag-reset-default-state {
+		pins = "gpio112";
+		function = "gpio";
+
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
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_default: touchscreen-default-state {
+		touch-pins {
+			pins = "gpio13";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
-- 
2.51.0


