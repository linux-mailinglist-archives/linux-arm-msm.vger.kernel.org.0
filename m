Return-Path: <linux-arm-msm+bounces-94766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC31LwG+pGkAqgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:30:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF271D1DDA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8F53300F140
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 22:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2C4375ADC;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSJjPhwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE5375AD4;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404211; cv=none; b=p9+jGdsaBln+lnWypenEttSMjM3Wk8WgzQclqjhkxSs0QyBcVNam1JpV3sO+AZp7J7NPGgX1xJVb8Lla/Ls71Fw1l+sUStBxaa8mQNgGepgoQohnCbN2qGN3mzXPMtm6SmNT2ommlWDralywKeo02ugCF3FuZs3P5cyq8JU6Hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404211; c=relaxed/simple;
	bh=J5aCXb4NEpdqQhIhazfnVjdiOLwnVxPAxuTOnDhYYVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wa7J77FtpHZ0n7Pcfupn3zH8CzaUHMFoz+Q/daTW3+TA1duz7R83MB3ZqzqYhjHWJM/rvrttHG7w/UnLhyGxlN+cRnVwyIlx3oammlkKssROzosI1Jz51cTIkqPDSSVtsXKlfHQyH/evTUXH1tKLBmJjy8LiYsNOeGr0XvPY3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSJjPhwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E588C4AF0B;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772404211;
	bh=J5aCXb4NEpdqQhIhazfnVjdiOLwnVxPAxuTOnDhYYVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZSJjPhwrrQyOdZ0L28F4/R0ugj1uN8UAhD8gGqZ65mA5R3PEK3Y6PRJ6HqrTadx3R
	 Tfgd5jnwBgPkYV1oaNH8bTJGCdbCR+Do1o6u0ApD/Q2d4Ur/YIUzY2oBXzODv0lf9x
	 RVBnXWZLQzBowtccFNKgFS+J+/eBV9hbnDieTMucz0L1OvDFyABYpW8yNLTjfuWdaV
	 Uj1XkIkoG3KkB/XTv266n70I66TokjyJrqNZX2fOoAoin0AbtHywggwywZAuJDg9gf
	 qLUNEDp3SA1Ivki7oAllMaXTshEmHhYSQo+JZlEZNszkW7maMPMakzvvpamqO+xBN8
	 mIF3pnmaF+gpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C10FD007D;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sun, 01 Mar 2026 23:29:19 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
In-Reply-To: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772404208; l=8860;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=MgE5NLXqI2cJWDmTleXIv4skNnJUubtBBECh7G4sx44=;
 b=PQfHf7fgISE5+ThmLeiY0sKNNumoJNNVuME8s/yFdhJEw+y6ibFGAKH/rAh+hP1FRMw7OgyDz
 SNR4QCrK9v0BZ2zX4WySBPz1wx0qqFzJf0aApVxoDWuRvj39OPEYPxb
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94766-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.39:email,0.0.0.11:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,c:email,0.0.0.68:email,0.0.0.1:email,0.0.0.48:email]
X-Rspamd-Queue-Id: 3CF271D1DDA
X-Rspamd-Action: no action

From: Paul Adam <adamp@posteo.de>

Add an initial device tree for Wiko PULP 4G.
Includes support for:
- UART
- USB (no OTG)
- Internal storage
- MicroSD
- Volume keys + Power button
- Touchscreen
- Backlight
- Accelerometer: Invensense MPU6880
- Magnetometer: Asahi Kasei AK09911
- Hall sensor: Rohm BU52021HFV
- Proximity sensor
- Vibrator
- Earpiece
- Microphone 1
- Headphones
- Wifi
- Bluetooth
- GPU

Signed-off-by: Paul Adam <adamp@posteo.de>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 356 +++++++++++++++++++++
 2 files changed, 357 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..5a3a9a823503 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -75,6 +75,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-rossa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-uf896.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wiko-chuppito.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
new file mode 100644
index 000000000000..dd56e1baeb4b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include "msm8916-modem-qdsp6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+
+/ {
+	model = "Wiko Pulp 4G";
+	compatible = "wiko,chuppito", "qcom,msm8916";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* eMMC */
+		mmc1 = &sdhc_2; /* SD card */
+		serial0 = &blsp_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8916_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <255>;
+		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&button_backlight_default>;
+		pinctrl-names = "default";
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_hall_sensor_default>;
+		pinctrl-names = "default";
+		label = "Hall Effect Sensor";
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+		label = "Buttons";
+
+		button-volume-up {
+			label = "Volume up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
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
+		vdd-supply = <&pm8916_l17>;
+		vid-supply = <&pm8916_l6>;
+		reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mag_reset_default>;
+		pinctrl-1 = <&mag_reset_suspend>;
+		pinctrl-names = "default", "suspend";
+		mount-matrix = "1",  "0", "0",
+			       "0", "1", "0",
+			       "0",  "0", "1";
+	};
+
+	proximity@48 {
+		compatible = "sensortek,stk3310";
+		reg = <0x48>;
+		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&proximity_int_default>;
+		pinctrl-1 = <&proximity_int_suspend>;
+		pinctrl-names = "default", "suspend";
+	};
+
+	imu@68 {
+		compatible = "invensense,mpu6880";
+		reg = <0x68>;
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+		pinctrl-0 = <&imu_int_default>;
+		pinctrl-1 = <&imu_int_suspend>;
+		pinctrl-names = "default", "suspend";
+		mount-matrix = "0",  "-1", "0",
+			       "-1", "0", "0",
+			       "0",  "0", "-1";
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@39 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x39>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8916_l17>;
+		vio-supply = <&pm8916_l6>;
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-1 = <&touchscreen_suspend>;
+		pinctrl-names = "default", "suspend";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		syna,startup-delay-ms = <100>;
+		syna,reset-delay-ms = <160>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&blsp_uart2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mpss_mem {
+	reg = <0x0 0x86800000 0x0 0x5600000>;
+};
+
+&pm8916_codec {
+	qcom,hphl-jack-type-normally-open;
+};
+
+&pm8916_mpps {
+	pwm_out: mpp4-state {
+		pins = "mpp4";
+		function = "digital";
+		power-source = <PM8916_MPP_VPH>;
+		output-low;
+		qcom,dtest = <1>;
+	};
+};
+
+&pm8916_pwm {
+	pinctrl-0 = <&pwm_out>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pm8916_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8916_rpm_regulators {
+	pm8916_l17: l17 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+		regulator-always-on;
+	};
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
+	pinctrl-0 = <&sdc2_default>, <&sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep>, <&sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+
+	status = "okay";
+};
+
+&sound {
+	audio-routing = "AMIC1", "MIC BIAS Internal1",
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS Internal1";
+};
+
+&tlmm {
+	button_backlight_default: button-backlight-default-state {
+		pins = "gpio119";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	imu_int_default: imu-int-default-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	imu_int_suspend: imu-int-suspend-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <2>;
+	};
+
+	mag_reset_default: mag-reset-default-state {
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	mag_reset_suspend: mag-reset-suspend-state {
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	proximity_int_default: proximity-int-default-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	proximity_int_suspend: proximity-int-suspend-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
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
+		touchscreen-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	touchscreen_suspend: touchscreen-suspend-state {
+		touchscreen-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
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
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
+&wcnss_mem {
+	status = "okay";
+};

-- 
2.53.0



