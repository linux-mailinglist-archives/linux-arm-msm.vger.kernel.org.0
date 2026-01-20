Return-Path: <linux-arm-msm+bounces-89871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFcqOFjWb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:24:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E94A43D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E9E17E5B55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D674418F2;
	Tue, 20 Jan 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PStsfgj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158234418C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932072; cv=none; b=qaRw7ocrgioMOMQZqPYPF2qR/kL268KLZuEs+ctilZGAcPRHN+XsGujg7Z6A8XW3DBC2/NfMpZK8Vif1zfZxf53vx//3B8hwsL8J02tQJQkzujU1lFMAD/79NPw80aH6pZFpdFGrdCjWkuwmF7YyZZdO40WREmR2v+CsO0QBnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932072; c=relaxed/simple;
	bh=H0r1XhTSYeujT5OkF0NqoAORNYd+BlQHapkH2n3cQzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8nFdKhbxNhlxOMLSwIuijYM5dfv4ZLbgAwJkxKCZMvsjX3pVcXZGCbYN/+o9Ug0TNXSUVY5wXiRuBFvh8WBAkExPL3u/gjFlerHJ0nVvKKJjRKvd1smqAHB7+7RJB6//Q4aaEthZRAeIhEv0tDffdMO0vsbVfU+0vCgKFqbZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PStsfgj6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801bc32725so28109215e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932069; x=1769536869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pU2QhlhL7N/9Y4yWJDtY0VNKSwgyki0STxJ6xsRTMoc=;
        b=PStsfgj696rUqtAKenQi9zknxRclabR/6RBxi8AxqnhYZsCl3A9wLsoC7iDKToAhrG
         YJHl4VPgFJpEIcZSdj12IS/EpHRwzRjzKPgsUj9ss+vtoy69MHRpOIvODmbHtXxd9MsI
         6daB2Savc36zUO1LYLKF/bbijf90rFMhyLQSpnt6V8CYJVzEKHc56Za7qTdJN3wZTwtP
         OIanPXprs882hXOlBdDgmrBjZjaS08sk0pWob2kPUeCZTRh0LsRpVu4w21R0FXTBNogX
         FZC8QaIyatKCLA4evvkenJScfiThh6qZNQeZwPnYUDKp8Tru/oTPqdHxx8+wnHl4+T68
         YBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932069; x=1769536869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pU2QhlhL7N/9Y4yWJDtY0VNKSwgyki0STxJ6xsRTMoc=;
        b=R4+CdXGC6x75cdIztzozgaGewd+5FlLw+/Bq0L2xv+6ZMerShcER6OtVtCz1aeP9gN
         RxmE1h/O9r2A75zJ9PDLS+ZaBELZlN0hGBCP779SIynSXDVHVTz+YI8h010LwmKliOCU
         7lnmMe6BWM38BxqWVZ3Q8dyTryx3MaCqBdNMlGiotln9GdsSdq8gKzBh6n36CSelKxMq
         zgv1DiKQ26JinH5zMPeMvf+92I/4NzvQI1NJOoLr1/zfJjCdLZfq/gZiwl/6QyzUleU1
         rINiiJHXXFrJTvrr7dMW4FgoHpqUB1XnEfho6ahbOxsq/d2lowf8v9tzWz7W4qgXxjXP
         rgXg==
X-Gm-Message-State: AOJu0Ywpr09JORwfxKRsDowi0I0XCx5pL2MjDXZaDCcguhGEKI2nIGd+
	+5aZiZXG/uT8yvXXrJqG0qwXhLpf4EdsuNYd3o39tdgyYxDQ01m3WJljJwnW3dMb
X-Gm-Gg: AY/fxX4cEWt2KQe4i08rUXdrwqWdyPTPQrXHoXYd5U5yzA7sR0uwDdwTAgnQRsVAXHU
	2kl5PVqFbjsTjWCuPhrx0YhyonEN5oyTRceEKEMHnGRvi5m+sPF/r3rtOLVpOm2qwzDCTa/vF7o
	Td30sGbP43cp9SOaOo6giKKuYn6RtwRHNPLqlYLvZiL4Mai+BFois37x4QRIr3BvNd2qOZuvT3P
	uqO06h4HwQI1S8Npyu9Inc45pwvd2pBqcAcko0VHk5qMFZj7CmwgBO03M0pBJSR8zqS0juGqBBn
	JVpX3eGvExxH/r8ZcXgzVt9I19uibbQsc60NkMDnFPfe6IbJ0hOxbBlTNE86gBy0JRVHeUmDPsn
	bZW//BF1BHrP2eesC2QZh/hTaekrIOLXV98uDyamWKR9cz0TGY6XOx2x86rnnb6vTIgxU/RteyW
	g6dbsgBC7VyVO8+0mbGwcc
X-Received: by 2002:a05:600c:4587:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-4801ea340d1mr186623115e9.0.1768932068649;
        Tue, 20 Jan 2026 10:01:08 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm312013015e9.11.2026.01.20.10.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:01:08 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	david@ixit.cz,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 2/7] arm64: dts: qcom: sdm660: add common Xiaomi SDM636/SDM660 include file
Date: Tue, 20 Jan 2026 19:00:47 +0100
Message-ID: <20260120180052.1031231-3-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120180052.1031231-1-morf3089@gmail.com>
References: <20260120180052.1031231-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89871-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A62E94A43D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create a shared device tree include file for Xiaomi smartphones and tablets
based on Qualcomm SDM636/SDM660 SoCs. This reduces code duplication when
adding new Xiaomi devices and ensures consistent configuration across the
family.

The common dtsi includes:
- PM660/PM660L PMIC configuration with volume/power buttons
- Serial console (blsp1_uart2, blsp2_uart1)
- Hall effect sensor (disabled by default)
- USB (qusb2phy0, usb3) in peripheral mode
- SD card (sdhc_2) pinctrl and supplies
- eMMC (sdhc_1) with HS400 support
- Backlight (pm660l_wled)
- Framebuffer memory reservation
- WiFi (wcn3990)
- Bluetooth (wcn3990)

Also refactor sdm660-xiaomi-lavender.dts to use the new common include,
removing duplicated code.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 .../boot/dts/qcom/sdm660-xiaomi-common.dtsi   | 214 ++++++++++++++++++
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 144 +-----------
 2 files changed, 219 insertions(+), 139 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi
new file mode 100644
index 000000000000..37ce675089fb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Common devicetree for Xiaomi SDM636/SDM660 devices
+ *
+ * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
+ * Copyright (c) 2022, Gianluca Boiano <morf3089@gmail.com>
+ */
+
+#include "pm660.dtsi"
+#include "pm660l.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	aliases {
+		serial0 = &blsp1_uart2;
+		serial1 = &blsp2_uart1;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		framebuffer0: framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_mem>;
+			/*
+			 * width/height/stride to be overridden
+			 * by individual device dts
+			 */
+			format = "a8r8g8b8";
+
+			status = "disabled";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volup {
+			label = "Volume Up";
+			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
+	gpio_hall_sensor: gpio-hall-sensor {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_hall_sensor_default>;
+		pinctrl-names = "default";
+
+		status = "disabled";
+
+		event-hall {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer_mem: memory@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&blsp2_uart1 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+		vddxo-supply = <&vreg_l9a_1p8>;
+		vddrf-supply = <&vreg_l6a_1p3>;
+		vddch0-supply = <&vreg_l19a_3p3>;
+		vddio-supply = <&vreg_l13a_1p8>;
+		max-speed = <3200000>;
+	};
+};
+
+&pm660l_gpios {
+	vol_up_default: vol-up-default-state {
+		pins = "gpio7";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-pull-up;
+		input-enable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm660l_wled {
+	qcom,switching-freq = <800>;
+	qcom,current-limit-microamp = <20000>;
+	qcom,num-strings = <2>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qusb2phy0 {
+	vdd-supply = <&vreg_l1b_0p925>;
+	vdda-pll-supply = <&vreg_l10a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
+
+	status = "okay";
+};
+
+&sdc2_state_off {
+	sd-cd-pins {
+		pins = "gpio54";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
+
+&sdc2_state_on {
+	sd-cd-pins {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};
+
+&sdhc_1 {
+	supports-cqe;
+
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+
+	vmmc-supply = <&vreg_l4b_2p95>;
+	vqmmc-supply = <&vreg_l8a_1p8>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+
+	vmmc-supply = <&vreg_l5b_2p95>;
+	vqmmc-supply = <&vreg_l2b_2p95>;
+};
+
+&tlmm {
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+};
+
+&usb3 {
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	maximum-speed = "high-speed";
+	phys = <&qusb2phy0>;
+	phy-names = "usb2-phy";
+	dr_mode = "peripheral";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p848>;
+	vdd-1.8-xo-supply = <&vreg_l9a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l6a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l19a_3p3>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index a9926ad6c6f9..6467cb4dfd16 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -7,58 +7,13 @@
 /dts-v1/;
 
 #include "sdm660.dtsi"
-#include "pm660.dtsi"
-#include "pm660l.dtsi"
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/input/gpio-keys.h>
+#include "sdm660-xiaomi-common.dtsi"
 
 / {
 	model = "Xiaomi Redmi Note 7";
 	compatible = "xiaomi,lavender", "qcom,sdm660";
 	chassis-type = "handset";
 
-	aliases {
-		serial0 = &blsp1_uart2;
-	};
-
-	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		stdout-path = "serial0:115200n8";
-
-		framebuffer0: framebuffer@9d400000 {
-			compatible = "simple-framebuffer";
-			reg = <0 0x9d400000 0 (1080 * 2340 * 4)>;
-			width = <1080>;
-			height = <2340>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
-	};
-
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		key-volup {
-			label = "Volume Up";
-			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEUP>;
-			debounce-interval = <15>;
-		};
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -78,37 +33,14 @@ framebuffer_mem: memory@9d400000 {
 			no-map;
 		};
 	};
-
-	/*
-	 * Until we hook up type-c detection, we
-	 * have to stick with this. But it works.
-	 */
-	extcon_usb: extcon-usb {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-&blsp1_uart2 {
-	status = "okay";
 };
 
-&pon_pwrkey {
-	status = "okay";
-};
+&framebuffer0 {
+	width = <1080>;
+	height = <2340>;
+	stride = <(1080 * 4)>;
 
-&pon_resin {
 	status = "okay";
-
-	linux,code = <KEY_VOLUMEDOWN>;
-};
-
-&qusb2phy0 {
-	status = "okay";
-
-	vdd-supply = <&vreg_l1b_0p925>;
-	vdda-pll-supply = <&vreg_l10a_1p8>;
-	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
 };
 
 &rpm_requests {
@@ -363,69 +295,3 @@ vreg_l19a_3p3: l19 {
 		};
 	};
 };
-
-&pm660l_wled {
-	status = "okay";
-
-	qcom,switching-freq = <800>;
-	qcom,current-limit-microamp = <20000>;
-	qcom,num-strings = <2>;
-};
-
-&sdc2_state_on {
-	sd-cd-pins {
-		pins = "gpio54";
-		function = "gpio";
-		bias-pull-up;
-		drive-strength = <2>;
-	};
-};
-
-&sdc2_state_off {
-	sd-cd-pins {
-		pins = "gpio54";
-		function = "gpio";
-		bias-disable;
-		drive-strength = <2>;
-	};
-};
-
-&sdhc_1 {
-	status = "okay";
-	supports-cqe;
-
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-
-	vmmc-supply = <&vreg_l4b_2p95>;
-	vqmmc-supply = <&vreg_l8a_1p8>;
-};
-
-&sdhc_2 {
-	status = "okay";
-
-	cd-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
-
-	vmmc-supply = <&vreg_l5b_2p95>;
-	vqmmc-supply = <&vreg_l2b_2p95>;
-};
-
-&tlmm {
-	gpio-reserved-ranges = <8 4>;
-};
-
-&usb3 {
-	qcom,select-utmi-as-pipe-clk;
-
-	status = "okay";
-};
-
-&usb3_dwc3 {
-	maximum-speed = "high-speed";
-	phys = <&qusb2phy0>;
-	phy-names = "usb2-phy";
-
-	dr_mode = "peripheral";
-	extcon = <&extcon_usb>;
-};
-- 
2.52.0


