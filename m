Return-Path: <linux-arm-msm+bounces-113360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bdtnJhAdMWpAbwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:53:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD0568DBED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:53:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=FKmW9NA4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113360-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113360-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33BAD300751B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472CB3DC4DF;
	Tue, 16 Jun 2026 09:53:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731105.qiye.163.com (mail-m19731105.qiye.163.com [220.197.31.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81F3AA1B5;
	Tue, 16 Jun 2026 09:53:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603598; cv=none; b=FJPZ0grALrjirEFaDKQ0f9e4P1OOU0BFUGzyn4gsbSZrHCtIYuz333IcI92SNw8SqWIHr5Uk5U9XsojQ5ksE5CM0rAAgPdsiyj+KWjb1wGTT5GV8RX+MH8IpThJYfD/+u/qRw6ENtoc6KFgPs27G+Yrw0lm3C6bqGv0bsqQXCAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603598; c=relaxed/simple;
	bh=a+3UGF08cFL7cI1EM2tla9p6Lw3eS5Rnp+Tn1jG9eF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=owLl6JlIpevzXOH4kjRAt2c6R34yZ3j5ROKlaq9r1i9+mezXT7h9vZw9TgWpMfnYb4khelfxpx+cenNjQYux3ihH9B6pPInplWeOYcatBszIgCt9lM92hIYerXMaLBGjOzF2hkrtvf3s/JJBxlah4+grwT4ERt3NNVwMO9dd9jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=FKmW9NA4; arc=none smtp.client-ip=220.197.31.105
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 428f8c714;
	Tue, 16 Jun 2026 15:30:28 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 16 Jun 2026 15:29:58 +0800
Subject: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Enable cameras
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com>
X-B4-Tracking: v=1; b=H4sIAHX7MGoC/y2M0QpAQBAAf0X7bMtdbsmvyMNhsamjO6Qu/+6Sx
 5maiRDYCwdosgieLwmyuQQqz2BYrJsZZUwMutBUkCL0Zy/rLuj4PvC3BkvSpaqsrclYSO3ueZL
 7+7bd87yZHF8LZwAAAA==
X-Change-ID: 20260616-rubikpi-next-20260615-462417aa865a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rosh@debian.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781595028; l=7053;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=a+3UGF08cFL7cI1EM2tla9p6Lw3eS5Rnp+Tn1jG9eF0=;
 b=XVAkEi63dPBKqqa8KYLP3PPtPzTmL2iii2UcmhHuSTNIOE0hFv8uT1Xi8c+6Ix0+kt2TObpo0
 4WajQ4xmqlkCxEnqDZLjvAZTR90m5RRNz/xu1DaJeOcXpp6HN8YPd0F
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ecf56bbf309d5kunma7c9ac087e8ef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0JIVk9CThhOTUtJHkhKS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=FKmW9NA4CCNYsaemwHLO78ahYqDpJgY/oq4cFGsLurE9Y1zyTO/kskxh0YpGjMW8oWmj4yOl0p5zj+8Co7oMApFhMVVvcfhY38VaBQDIS1C3vkoyR8SNnhbULGXEiIIaB3TwT1/jYpb853ijNV09KfD904o4chq+bq3g97V+SnA=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=Lf4eElgUPOCo6NrM/vA3roTGYsMOixzoLCvI8OJThLY=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113360-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:hongyang.zhao@thundersoft.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAD0568DBED

Enable the two Raspberry Pi camera connectors on RubikPi 3 with
IMX219 sensors. CAM1 is connected to CCI1 and CSIPHY1, while CAM2
is connected to CCI0 and CSIPHY4.

Add the shared 24 MHz camera oscillator, camera power enable
regulators, CAMSS endpoints, CCI sensor nodes and privacy LED GPIOs.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Enable the two Raspberry Pi camera connectors on Thundercomm RUBIK Pi 3.
Both connectors are populated with IMX219 camera modules.

CAM1 is wired to CCI1 and CSIPHY1, while CAM2 is wired to CCI0 and
CSIPHY4. Add the fixed 24 MHz camera oscillator, camera power enable
regulators, CAMSS endpoints, CCI sensor nodes, and the privacy LED GPIOs.

The cameras were validated on RUBIK Pi 3 with two IMX219 modules. Both
sensors enumerate through CAMSS and can capture 3280x2464 RGGB frames. The
privacy LEDs are also toggled by the V4L2 subdev privacy LED support while
streaming.
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..280ce9316f50 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -47,6 +47,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	cam_osc_24m: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -61,6 +67,27 @@ key-volume-up {
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&cam1_privacy_led_state>, <&cam2_privacy_led_state>;
+		pinctrl-names = "default";
+
+		cam1_privacy_led: led-camera1 {
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		cam2_privacy_led: led-camera2 {
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			gpios = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -128,6 +155,38 @@ fan0: pwm-fan {
 		pinctrl-names = "default";
 	};
 
+	vreg_cam1_pwr: regulator-camera1-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camera1_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam1_pwr_en>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_vcc3v3_output>;
+	};
+
+	vreg_cam2_pwr: regulator-camera2-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camera2_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam2_pwr_en>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_vcc3v3_output>;
+	};
+
 	vreg_eth_1v8: regulator-eth-1v8 {
 		compatible = "regulator-fixed";
 
@@ -214,6 +273,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
 		regulator-boot-on;
 	};
 
+	vreg_vcc3v3_output: regulator-vcc3v3-output {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc3v3_output";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vcc3v3_output_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -694,6 +770,94 @@ vreg_bob_3p296: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* CAM1 is routed to CSI1 / CSIPHY1. */
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam1_imx219_ep>;
+			};
+		};
+
+		/* CAM2 is routed to CSI4 / CSIPHY4. */
+		port@4 {
+			reg = <4>;
+
+			csiphy4_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam2_imx219_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	cam2_imx219: camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&cam_osc_24m>;
+
+		VANA-supply = <&vreg_cam2_pwr>;
+		VDIG-supply = <&vreg_l18b_1p8>;
+		VDDL-supply = <&vreg_cam2_pwr>;
+
+		leds = <&cam2_privacy_led>;
+		led-names = "privacy";
+
+		port {
+			cam2_imx219_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	cam1_imx219: camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&cam_osc_24m>;
+
+		VANA-supply = <&vreg_cam1_pwr>;
+		VDIG-supply = <&vreg_l18b_1p8>;
+		VDDL-supply = <&vreg_cam1_pwr>;
+
+		leds = <&cam1_privacy_led>;
+		led-names = "privacy";
+
+		port {
+			cam1_imx219_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1243,6 +1407,14 @@ usb_eth_power: usb-eth-power-state {
 		bias-disable;
 	};
 
+	vcc3v3_output_en: vcc3v3-output-en-state {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <8>;
+		output-high;
+		bias-disable;
+	};
+
 	wifi_reset_active: wifi-reset-active-state {
 		pins = "gpio16";
 		function = "gpio";
@@ -1258,6 +1430,22 @@ bt_reset: bt-reset-state {
 		bias-disable;
 	};
 
+	cam1_privacy_led_state: cam1-privacy-led-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <8>;
+		output-low;
+		bias-disable;
+	};
+
+	cam2_privacy_led_state: cam2-privacy-led-state {
+		pins = "gpio19";
+		function = "gpio";
+		drive-strength = <8>;
+		output-low;
+		bias-disable;
+	};
+
 	lt9611_irq_pin: lt9611-irq-state {
 		pins = "gpio20";
 		function = "gpio";
@@ -1358,6 +1546,22 @@ m2_vcc_pin: m2-vcc-state {
 		input-disable;
 	};
 
+	cam1_pwr_en: cam1-pwr-en-state {
+		pins = "gpio57";
+		function = "gpio";
+		drive-strength = <8>;
+		output-low;
+		bias-disable;
+	};
+
+	cam2_pwr_en: cam2-pwr-en-state {
+		pins = "gpio58";
+		function = "gpio";
+		drive-strength = <8>;
+		output-low;
+		bias-disable;
+	};
+
 	lt9611_vcc_pin: lt9611-vcc-pin-state {
 		pins = "gpio83";
 		function = "gpio";

---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-rubikpi-next-20260615-462417aa865a

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


