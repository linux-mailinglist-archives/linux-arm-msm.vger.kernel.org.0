Return-Path: <linux-arm-msm+bounces-74610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BFB9A7B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C553B0C55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8A62DC773;
	Wed, 24 Sep 2025 15:07:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58321257E;
	Wed, 24 Sep 2025 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726471; cv=none; b=GTS1kZN/xSbnTDBLUsBt5QmCtGCvW2oIqZIU9lCjUMQX+Eo9DNt1N7P3/2KbCIJ3OmyVyEuzqC2Fnq4ISzPXAKHcJx7R76JRLKI1BZslOjMVAoR8Q8xIPNpbqFMqfQ9v/dsvTAoJQk+2qrTmbk1bDQZWdiv5zm9jL4bGrjR3NYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726471; c=relaxed/simple;
	bh=GgvTbTqMCn9rVDF5mTVKrR7igJAP8foQIkAdxmicIYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZT9GDt6L7uq/VZTWCjktjmjDtLH9hqmK3M1X8KxrHtSy0CsuP4Wf0mRIO+4bEx6jTfuYUC6/89yQafUx8svKTaUbAuCIk5kqqI60+g1ehJv5AvTV8k2vCmpRzpuYftOZK/DJamInFhypYaOxPeROACDoMiiQmTp3jYE4TFny0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1758726444t598c95d2
X-QQ-Originating-IP: KOQMvFdmlC/zMmrSXnb0MUQjJ7yaULVnZPjOjcrENhg=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Sep 2025 23:07:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1977020174641950097
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 24 Sep 2025 23:07:10 +0800
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-radxa-dragon-q6a-v4-2-10d584f2c806@radxa.com>
References: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
In-Reply-To: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726438; l=26874;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=GgvTbTqMCn9rVDF5mTVKrR7igJAP8foQIkAdxmicIYY=;
 b=v+robtWzkjIHNyodEq5YS/+iJ8/UykW9cHGzSQMNtXzHuVUGIlkvXeClV7CBau3a6nwKdJ4bx
 FJm91IT8P7yCiQvJ/VIeH7LL425EPQiN1S1KVmrvTMQm5eg1mYMm9/C
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NDtUtlvFer7vTlCzCChD1k8AtH7otx2+8E03iJDZBDWg+NqJMFbWxXAu
	NmNDIBxaoiVbMvd3+ymb+1neso3wlPaL2nMzNy2T5qa1GgUxa3qcOTnUyDjVP1gEG/uPXS6
	bBgyV67Paik3CDOU9NqOUoU1sbH4xsoX5UgSqyr0EaBFXJQh4ECwTLBlEYpdpdMzUkLFVQD
	7stLTwkfvrQrTcBT/QgkkjKwQqhRMp2BPmgvcBnc18k+7yVe0wQ3QgJ5lXQ+eZdji7/3bU+
	e/xmka+QM8/BlID1dZAy4QJp+KcaDE/WGX3USnPePUY4LnombJLqOFImfDtMILJlkQ8XMF6
	R+DW+YwMD4zH9R0prf8QNMYVy5Z8kCyo+ozbGSGvh07Y1k8+1ij2AI8y4YwCopgY0kQseRr
	oE7E/SiDa4o82ndajHBBoxvDVv7QUg3wO+h4TfkrjBWqDbsk9Vv4bxWTISLniQ8lRh72WlO
	kBC4ld+FOUd5CDLRBeEBQ9Mjp6+qGKWP4I3NrTWjY22V1mh8xvk0C9MiQ6dkCDDATZBtmRM
	u4NRLYdOiByPru7Jih2T5lCGNzHKlz54v2odm758sLgGs+JwXumtO1C+Sx9DqGXjFahrmFH
	QsYHCVwWzoGszw6mWjXtmz4/vUqgGgjtqRvaz9QSYh1hshJte4p/4UOXXP9c48BUn8072hh
	a7Y6mrNxbrRkX1Ycy4t2WSOS/G8GNy7fO64EHY1fE3kvrqPLyLplf0qgrCSZ3LrJ2G0CNWD
	NQhX/83KZ2OsD7nphUu1S4TWuGMdLNY0fVAkfUH52QzFVK36NkBMkhq6b/HZQJPYHZYgbBG
	IKGlGS3ReURH9NItgrFXZrFyslDVvnAqkaIVrLfrdwip/bTg9x/0ciSyHF8wsfM3PgYWP/b
	D9fbqJigEkN4hyL756Oaex6W0B7lYJy7ssKq95+hnXKJf6ZMxJ/fC17YptJ14FNzS/sAshu
	8r2ykYjjngYijUBemEEpKdq5Cl8d9lG7FwHp63Sp2rGaf4sj/gBixwBvrmPlbdlEKg3vzpz
	zzmOsQzw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A is a single board computer, based on the Qualcomm
QCS6490 platform.

Features enabled and working:

- Configurable I2C/SPI/UART from 40-Pin GPIO
- Three USB-A 2.0 ports
- RTL8111K Ethernet connected to PCIe0
- eMMC module
- SD card
- M.2 M-Key 2230 PCIe 3.0 x2
- Headphone jack
- Onboard thermal sensors
- QSPI controller for updating boot firmware
- ADSP remoteproc (Type-C and charging features disabled in firmware)
- CDSP remoteproc (for AI applications using QNN)
- Venus video encode and decode accelerator

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1107 ++++++++++++++++++++
 2 files changed, 1108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5b52f9e4e5f31ac5a398d0762337a0a31af1f4dd..3a246adb0c435d7b08dda404ed2bcb2a9c8c48b0 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -120,6 +120,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
new file mode 100644
index 0000000000000000000000000000000000000000..3f2ed563abba97c0dec0681b87b172b3fc916d88
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -0,0 +1,1107 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Radxa Computer (Shenzhen) Co., Ltd.
+ */
+
+/dts-v1/;
+
+/* PM7250B is configured to use SID8/9 */
+#define PM7250B_SID 8
+#define PM7250B_SID1 9
+
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sc7280.dtsi"
+#include "pm7250b.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi" /* PM7350C */
+#include "pmk8350.dtsi" /* PMK7325 */
+#include "qcs6490-audioreach.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &mpss_mem;
+/delete-node/ &remoteproc_mpss;
+/delete-node/ &remoteproc_wpss;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &video_mem;
+/delete-node/ &wifi;
+/delete-node/ &wlan_ce_mem;
+/delete-node/ &wlan_fw_mem;
+/delete-node/ &wpss_mem;
+/delete-node/ &xbl_mem;
+
+/ {
+	model = "Radxa Dragon Q6A";
+	compatible = "radxa,dragon-q6a", "qcom,qcm6490";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		serial0 = &uart5;
+	};
+
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9380-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
+
+		vdd-rxtx-supply = <&vreg_l18b_1p8>;
+		vdd-io-supply = <&vreg_l18b_1p8>;
+		vdd-buck-supply = <&vreg_l17b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob_3p296>;
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		qcom,hphl-jack-type-normally-closed;
+
+		#sound-dai-cells = <1>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	usb2_1_con: connector-0 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc_5v_peri>;
+
+		port {
+			usb2_1_connector: endpoint {
+				remote-endpoint = <&usb_hub_2_1>;
+			};
+		};
+	};
+
+	usb2_2_con: connector-1 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc_5v_peri>;
+
+		port {
+			usb2_2_connector: endpoint {
+				remote-endpoint = <&usb_hub_2_2>;
+			};
+		};
+	};
+
+	usb2_3_con: connector-2 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc_5v_peri>;
+
+		port {
+			usb2_3_connector: endpoint {
+				remote-endpoint = <&usb_hub_2_3>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&user_led>;
+		pinctrl-names = "default";
+
+		user-led {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reserved-memory {
+		xbl_mem: xbl@80700000 {
+			reg = <0x0 0x80700000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
+			reg = <0x0 0x81800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		camera_mem: camera@84300000 {
+			reg = <0x0 0x84300000 0x0 0x500000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@84800000 {
+			reg = <0x0 0x84800000 0x0 0x2800000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@87000000 {
+			reg = <0x0 0x87000000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		video_mem: video@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x700000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@89500000 {
+			reg = <0x0 0x89500000 0x0 0x500000>;
+			no-map;
+		};
+
+		gpu_microcode_mem: gpu-microcode@89a00000 {
+			reg = <0x0 0x89a00000 0x0 0x2000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x100000>;
+			no-map;
+		};
+
+		tags_mem: tags@c0100000 {
+			reg = <0x0 0xc0100000 0x0 0x1200000>;
+			no-map;
+		};
+
+		qtee_mem: qtee@c1300000 {
+			reg = <0x0 0xc1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@c1800000 {
+			reg = <0x0 0xc1800000 0x0 0x1c00000>;
+			no-map;
+		};
+
+		debug_vm_mem: debug-vm@d0600000 {
+			reg = <0x0 0xd0600000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	thermal-zones {
+		msm-skin-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 2>;
+		};
+
+		quiet-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 1>;
+		};
+
+		ufs-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 3>;
+		};
+
+		xo-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+		};
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_5v_peri>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v_peri>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_5v_peri: regulator-vcc-5v-peri {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v_peri";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vph_pwr>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p536>;
+		vdd-l2-l7-supply = <&vreg_bob_3p296>;
+		vdd-l3-supply = <&vreg_s2b_0p572>;
+		vdd-l5-supply = <&vreg_s2b_0p572>;
+		vdd-l6-l9-l10-supply = <&vreg_s8b_1p2>;
+		vdd-l8-supply = <&vreg_s7b_0p536>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p84>;
+		vdd-l13-supply = <&vreg_s7b_0p536>;
+		vdd-l14-l16-supply = <&vreg_s8b_1p2>;
+
+		vreg_s1b_1p84: smps1 {
+			regulator-name = "vreg_s1b_1p84";
+			regulator-min-microvolt = <1840000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s2b_0p572: smps2 {
+			regulator-name = "vreg_s2b_0p572";
+			regulator-min-microvolt = <572000>;
+			regulator-max-microvolt = <1048000>;
+		};
+
+		vreg_s7b_0p536: smps7 {
+			regulator-name = "vreg_s7b_0p536";
+			regulator-min-microvolt = <536000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s8b_1p2: smps8 {
+			regulator-name = "vreg_s8b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1496000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
+		};
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+							RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p072: ldo2 {
+			regulator-name = "vreg_l2b_3p072";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+							RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+							RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p96: ldo7 {
+			regulator-name = "vreg_l7b_2p96";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+							RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_1p8: ldo17 {
+			regulator-name = "vreg_l17b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1896000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p8: ldo18 {
+			regulator-name = "vreg_l18b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l19b_1p8: ldo19 {
+			regulator-name = "vreg_l19b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l1-l12-supply = <&vreg_s1b_1p84>;
+		vdd-l2-l8-supply = <&vreg_s1b_1p84>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob_3p296>;
+		vdd-l6-l9-l11-supply = <&vreg_bob_3p296>;
+		vdd-l10-supply = <&vreg_s7b_0p536>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1976000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p96: ldo6 {
+			regulator-name = "vreg_l6c_2p96";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_0p88: ldo10 {
+			regulator-name = "vreg_l10c_0p88";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <1048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob_3p296: bob {
+			regulator-name = "vreg_bob_3p296";
+			regulator-min-microvolt = <3032000>;
+			regulator-max-microvolt = <3960000>;
+		};
+	};
+};
+
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs6490/a660_zap.mbn";
+};
+
+/* Pin 13, 15 in GPIO header */
+&i2c0 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 27, 28 in GPIO header */
+&i2c2 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 3, 5 in GPIO header */
+&i2c6 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+&i2c10 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+
+	rtc: rtc@68 {
+		compatible = "st,m41t11";
+		reg = <0x68>;
+	};
+};
+
+/* External touchscreen */
+&i2c13 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_va_macro {
+	status = "okay";
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
+	pinctrl-names = "default";
+
+	/* Support for QPS615 PCIe switch */
+	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
+		    <0x100 &apps_smmu 0x1c81 0x1>,
+		    <0x208 &apps_smmu 0x1c84 0x1>,
+		    <0x210 &apps_smmu 0x1c85 0x1>,
+		    <0x218 &apps_smmu 0x1c86 0x1>,
+		    <0x300 &apps_smmu 0x1c87 0x1>,
+		    <0x400 &apps_smmu 0x1c88 0x1>,
+		    <0x500 &apps_smmu 0x1c89 0x1>,
+		    <0x501 &apps_smmu 0x1c90 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pm7325_gpios {
+	pm7325_adc_default: adc-default-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+};
+
+&pm7325_temp_alarm {
+	io-channels = <&pmk8350_vadc PM7325_ADC7_DIE_TEMP>;
+	io-channel-names = "thermal";
+};
+
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-skin-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	ufs-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_GPIO1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pmk8350_vadc {
+	pinctrl-0 = <&pm7325_adc_default>;
+	pinctrl-names = "default";
+
+	channel@3 {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		label = "pmk7325_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		label = "xo_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@103 {
+		reg = <PM7325_ADC7_DIE_TEMP>;
+		label = "pm7325_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@144 {
+		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "quiet_therm";
+	};
+
+	channel@146 {
+		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "msm_skin_therm";
+	};
+
+	channel@14a {
+		/* According to datasheet, 0x4a = AMUX1_GPIO = GPIO_02 */
+		reg = <PM7325_ADC7_GPIO1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "ufs_therm";
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&qspi {
+	/* It's not possible to use QSPI with iommu */
+	/* due to an error in qcom_smmu_write_s2cr */
+	/delete-property/ iommus;
+
+	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0>,
+				<&qspi_data1>, <&qspi_data23>;
+	pinctrl-1 = <&qspi_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	spi_flash: flash@0 {
+		compatible = "winbond,w25q256", "jedec,spi-nor";
+		reg = <0>;
+
+		spi-max-frequency = <104000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/qcm6490/qupv3fw.elf";
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcm6490/qupv3fw.elf";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs6490/radxa/dragon-q6a/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs6490/cdsp.mbn";
+	status = "okay";
+};
+
+&sdhc_1 {
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	vmmc-supply = <&vreg_l7b_2p96>;
+	vqmmc-supply = <&vreg_l19b_1p8>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&sound {
+	compatible = "qcom,qcs6490-rb3gen2-sndcard";
+	model = "QCS6490-Radxa-Dragon-Q6A";
+
+	audio-routing =
+		"IN1_HPHL", "HPHL_OUT",
+		"IN2_HPHR", "HPHR_OUT",
+		"AMIC2", "MIC BIAS2",
+		"TX SWR_ADC1", "ADC2_OUTPUT";
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+
+		codec {
+			sound-dai = <&wcd938x 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-capture-dai-link {
+		link-name = "WCD Capture";
+
+		codec {
+			sound-dai = <&wcd938x 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
+/* Pin 11, 29, 31, 32 in GPIO header */
+&spi7 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 19, 21, 23, 24, 26 in GPIO header */
+&spi12 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 22, 33, 36, 37 in GPIO header */
+&spi14 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&tlmm {
+	gpio-line-names =
+		/* GPIO_0 ~ GPIO_3 */
+		"PIN_13", "PIN_15", "", "",
+		/* GPIO_4 ~ GPIO_7 */
+		"", "", "", "",
+		/* GPIO_8 ~ GPIO_11 */
+		"PIN_27", "PIN_28", "", "",
+		/* GPIO_12 ~ GPIO_15 */
+		"", "", "", "",
+		/* GPIO_16 ~ GPIO_19 */
+		"", "", "", "",
+		/* GPIO_20 ~ GPIO_23 */
+		"", "", "PIN_8", "PIN_10",
+		/* GPIO_24 ~ GPIO_27 */
+		"PIN_3", "PIN_5", "PIN_16", "PIN_27",
+		/* GPIO_28 ~ GPIO_31 */
+		"PIN_31", "PIN_11", "PIN_32", "PIN_29",
+		/* GPIO_32 ~ GPIO_35 */
+		"", "", "", "",
+		/* GPIO_36 ~ GPIO_39 */
+		"", "", "", "",
+		/* GPIO_40 ~ GPIO_43 */
+		"", "", "", "",
+		/* GPIO_44 ~ GPIO_47 */
+		"", "", "", "",
+		/* GPIO_48 ~ GPIO_51 */
+		"PIN_21", "PIN_19", "PIN_23", "PIN_24",
+		/* GPIO_52 ~ GPIO_55 */
+		"", "", "", "PIN_26",
+		/* GPIO_56 ~ GPIO_59 */
+		"PIN_33", "PIN_22", "PIN_37", "PIN_36",
+		/* GPIO_60 ~ GPIO_63 */
+		"", "", "", "",
+		/* GPIO_64 ~ GPIO_67 */
+		"", "", "", "",
+		/* GPIO_68 ~ GPIO_71 */
+		"", "", "", "",
+		/* GPIO_72 ~ GPIO_75 */
+		"", "", "", "",
+		/* GPIO_76 ~ GPIO_79 */
+		"", "", "", "",
+		/* GPIO_80 ~ GPIO_83 */
+		"", "", "", "",
+		/* GPIO_84 ~ GPIO_87 */
+		"", "", "", "",
+		/* GPIO_88 ~ GPIO_91 */
+		"", "", "", "",
+		/* GPIO_92 ~ GPIO_95 */
+		"", "", "", "",
+		/* GPIO_96 ~ GPIO_99 */
+		"PIN_7", "PIN_12", "PIN_38", "PIN_40",
+		/* GPIO_100 ~ GPIO_103 */
+		"PIN_35", "", "", "",
+		/* GPIO_104 ~ GPIO_107 */
+		"", "", "", "",
+		/* GPIO_108 ~ GPIO_111 */
+		"", "", "", "",
+		/* GPIO_112 ~ GPIO_115 */
+		"", "", "", "",
+		/* GPIO_116 ~ GPIO_119 */
+		"", "", "", "",
+		/* GPIO_120 ~ GPIO_123 */
+		"", "", "", "",
+		/* GPIO_124 ~ GPIO_127 */
+		"", "", "", "",
+		/* GPIO_128 ~ GPIO_131 */
+		"", "", "", "",
+		/* GPIO_132 ~ GPIO_135 */
+		"", "", "", "",
+		/* GPIO_136 ~ GPIO_139 */
+		"", "", "", "",
+		/* GPIO_140 ~ GPIO_143 */
+		"", "", "", "",
+		/* GPIO_144 ~ GPIO_147 */
+		"", "", "", "",
+		/* GPIO_148 ~ GPIO_151 */
+		"", "", "", "",
+		/* GPIO_152 ~ GPIO_155 */
+		"", "", "", "",
+		/* GPIO_156 ~ GPIO_159 */
+		"", "", "", "",
+		/* GPIO_160 ~ GPIO_163 */
+		"", "", "", "",
+		/* GPIO_164 ~ GPIO_167 */
+		"", "", "", "",
+		/* GPIO_168 ~ GPIO_171 */
+		"", "", "", "",
+		/* GPIO_172 ~ GPIO_174 */
+		"", "", "";
+
+	pcie0_reset_n: pcie0-reset-n-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_wake_n: pcie0-wake-n-state {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie1_reset_n: pcie1-reset-n-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_wake_n: pcie1-wake-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qspi_sleep: qspi-sleep-state {
+		pins = "gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17";
+		function = "gpio";
+		output-disable;
+	};
+
+	sd_cd: sd-cd-state {
+		pins = "gpio91";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	user_led: user-led-state {
+		pins = "gpio42";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	/* Onboard USB 2.0 hub */
+	usb_hub_2_x: hub@1 {
+		compatible = "usb1a40,0101";
+		reg = <1>;
+		vdd-supply = <&vcc_5v_peri>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&usb2_1_connector>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_2_2: endpoint {
+					remote-endpoint = <&usb2_2_connector>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_2_3: endpoint {
+					remote-endpoint = <&usb2_3_connector>;
+				};
+			};
+		};
+
+		/* FCU760K Wi-Fi & Bluetooth module */
+		wifi@4 {
+			compatible = "usba69c,8d80";
+			reg = <4>;
+		};
+	};
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
+&venus {
+	status = "okay";
+};
+
+/* PINCTRL - additions to nodes defined in sc7280.dtsi */
+&pcie0_clkreq_n {
+	bias-pull-up;
+	drive-strength = <2>;
+};
+
+&pcie1_clkreq_n {
+	bias-pull-up;
+	drive-strength = <2>;
+};
+
+&qspi_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&qspi_cs0 {
+	bias-disable;
+	drive-strength = <8>;
+};
+
+&qspi_data0 {
+	bias-disable;
+	drive-strength = <8>;
+};
+
+&qspi_data1 {
+	bias-disable;
+	drive-strength = <8>;
+};
+
+&qspi_data23 {
+	bias-disable;
+	drive-strength = <8>;
+};
+
+&sdc1_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc1_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc1_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc1_rclk {
+	bias-pull-down;
+};
+
+&sdc2_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc2_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc2_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};

-- 
2.51.0


