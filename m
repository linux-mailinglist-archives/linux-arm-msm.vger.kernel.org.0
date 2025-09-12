Return-Path: <linux-arm-msm+bounces-73237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0BCB54471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EBB61C86383
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A52F2D481F;
	Fri, 12 Sep 2025 08:04:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE02D5948;
	Fri, 12 Sep 2025 08:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664282; cv=none; b=BfJK1F09OfhOAHyeuMvt5CRjU7BA6Z55BjeZ/tpndNhMA5bRJGHjG9Wqe1ySFkwwnLXSuDF+WPgpLS31U2n6OPPrJmd0DylZ+Mds9uJKO1FKFyeq926DA2K4bSUxyjgU3onHGa8HHeprILPb72S7BQcco6ldfc3J8UqI0y70eiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664282; c=relaxed/simple;
	bh=Iizr37odpaD6620ew3RHzdz+KdJhP0nVZ7QsG4FzZL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaDdYHtmAkebQGBADtuXq2W2ek5ehzM1K9g7g0dpzEStMfWdd0k7eNSZ31DbnSQN/JT7BTEiotxcT3ZKxK7lsPaJ7vgGuBgucfJ2pSvPd57HwO28D1VJA480pcN/Hs6f99a9zJmky8hfVoQC5l804ifZVA06JglNzEVIQfX85LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757664241t77c4918d
X-QQ-Originating-IP: 5faA+BLtnXQmki9Bqghx7Taoo0hgiRYSa+csZqkWMPE=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Sep 2025 16:03:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1252713514170312188
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 12 Sep 2025 16:03:30 +0800
Subject: [PATCH RFC 2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-radxa-dragon-q6a-v1-2-8ccdbf9cd19b@radxa.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
In-Reply-To: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757664226; l=28297;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=Iizr37odpaD6620ew3RHzdz+KdJhP0nVZ7QsG4FzZL4=;
 b=Ng/246dPXdoNdkIpavCIMMrU/MiQtve21MSVjxB1LaZA7E3ThWUOdrY75Y0ay+Xguv/5TolPe
 sQs5LrJCx7eBqPIzKOXPyNnLM+hbFueqjf3UIDOPArHZr7u2fc0T8C7
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NNTfO1PeAQnLNL2ILF48O9Iun6V+t0s+3KsftmguXkGKstYC1rJrairW
	Ee9MWtDI+Lb/ZoE6euEO/RVqUNemouOQneVk+VtYY5r6Ol3Bwus4iG4z7fccL0fOMRDj1SA
	76LhYOi4i1YnwJ0Z3U3V0kFsVjwbNMjhcpyo22SNKhUToeVJZhh5/P3GQMdAaNd6fD3Cse0
	Ki+MMxz/oo3uEYaD2gWSTMiqy7qIgyiXlwR57wGB6ywMeKIRDGrKS6iikZ38YF8zWcymC7x
	/Rjsh/kSDYouCtmgTl7m/tHvEaDZwwaLkAtz3o6eftfREXD0L9MMmwdWtkBJKLeXBBL9wZL
	5O/tVUhV+01IanlfF/qpQgo6bs9++PfkUHNoehROk+rd06rz7WgEohWLALtQ/ZElBcri9uZ
	elCaUpfVJMn67UaPYZl0xnDNboehL+RSOqv8Vv7tonXiAsr6SRylCv7hW2nkBOH8dZ92oZI
	wh3jcd36K/LVQmV/WvrMvrPrMlYy9WTc8SeS3PEvUAvJWTMKbe6ZTPS8+aM5vnVXg8lmOap
	vXD/68AzCsQAa1GjCSO3fYIO0B4ku9UE4zZ9bMbsUmnlhIBGscf3YrkwyawT4tK1nPtebrl
	M85MCv3ML8mkvvg4dPUj34Sp+W0LcSJT5rtgTiYgOks1kX++zlUhuK1LePLA7x+K1hRKADU
	pk0EwVkaEbl756gMdPLZZrCZtvuVH2WHPE2/+BBI5uFuFGAe2PItnTB85eVdfKjnvnoCuOX
	Y9p8DwUxM9ZQLtnS3DDZmqw4MC+bOTIzUheY3waZSilF2DzwPw2jOxNDS++ebgzGuo17VxI
	MwfMGysGQoPfUZRvtfmbJc+rrv+NHIC4y/1WbkV9Ielk8XFu3++Oi/3Gov9ePzM+KoNc10Y
	Fpqy4m30I5ep0pgVPUeWiIfpA2SAkANIKV617sEwx0h4GrX4NpmWbFVaTkrNCFy3dGW+WII
	w76AuPdFd8I2Ktg5XP/0X2OB5GhbkGLwU4i4FsYqvFkXQ4JvkkWTJXgfqoKxriZkkKGv53V
	fk8wcyYZuHjXHce5WjFJq761OCzq4=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A is a single board computer, based on the Qualcomm
QCS6490 platform.

This is currently posted as RFC. More details are in the cover letter.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1208 ++++++++++++++++++++
 2 files changed, 1209 insertions(+)

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
index 0000000000000000000000000000000000000000..ed6e2c7ab2acecce13c8bea3af6c87cf598cd00a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -0,0 +1,1208 @@
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
+	usb3_con: connector {
+		compatible = "usb-a-connector";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb3_con_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb3_con_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out_usb>;
+				};
+			};
+		};
+	};
+
+	hdmi-bridge {
+		compatible = "radxa,ra620";
+
+		pinctrl-0 = <&dp_hot_plug_det>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
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
+/* It takes a long time in ufshcd_init_crypto when enabled */
+&ice {
+	status = "disabled";
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
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp {
+	sound-name-prefix = "Display Port0";
+
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
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
+	firmware-name = "qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn";
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
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 0>, <&swr0 0>, <&lpass_rx_macro 0>;
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
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	dp0-dai-link {
+		link-name = "DP0 Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&mdss_dp>;
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
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <1300000>;
+
+	/* Gear-4 Rate-B is unstable due to board */
+	/* and UFS module design limitations */
+	limit-rate = "rate-a";
+	/delete-property/ qcom,ice;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb3_con_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p912>;
+
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			/* RX1/TX1 is statically connected to USB-A port */
+			usb_dp_qmpphy_out_usb: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <2 3>;
+				remote-endpoint = <&usb3_con_ss_in>;
+			};
+
+			/* RX0/TX0 is statically connected to RA620 bridge */
+			usb_dp_qmpphy_out_dp: endpoint@1 {
+				reg = <1>;
+
+				data-lanes = <3 2>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+		};
+	};
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
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
+&dp_hot_plug_det {
+	bias-disable;
+};
+
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


