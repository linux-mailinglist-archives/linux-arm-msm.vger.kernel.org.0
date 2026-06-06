Return-Path: <linux-arm-msm+bounces-111526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 98tgD+ZvJGrq6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1964E164
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:07:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=bD1MJLPe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111526-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111526-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22B783018BC4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 19:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538C331196F;
	Sat,  6 Jun 2026 19:04:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m12782.qiye.163.com (mail-m12782.qiye.163.com [115.236.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2022D8DD0;
	Sat,  6 Jun 2026 19:04:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780772653; cv=none; b=AxQxT0kyLCHN/zrBDEIsm+KR39xVsIbt4y8diIgg3G+CinDNijv1pU+r1WcpPLCjuFbTbQJfp/xQIRZW2UrDRUlH+NDAWSPR5bVyUPH9Dc2emF0ua3OGrLkjOYK6JeT9uR3o7KWVWNudNsHUkp0M4qVg6MAW5h8fX0rxL3xf4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780772653; c=relaxed/simple;
	bh=xhGx9btUBJ7PbSENKiLTzAu2Pwgm8GyTghkEQBUGyqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAhb1p2XcDDvtislk5G+E+Kqkt2PUyzHwC6EZIdOzRheS9rCyRDba+cHIwBiwqhS3BB4Wea9h04X3TF77pUBkhtwQHvGYRYmQ0gAPza7fX/txKw56cD0s49wyqsKylNdMEWG0oaTXn48JwMS9+U6H7LZjN4gngr5QsrHDp+Bk/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=bD1MJLPe; arc=none smtp.client-ip=115.236.127.82
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a25048;
	Sun, 7 Jun 2026 02:58:49 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 02:58:21 +0800
Subject: [PATCH 5/5] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=6149;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=xhGx9btUBJ7PbSENKiLTzAu2Pwgm8GyTghkEQBUGyqg=;
 b=Mn66vPLzlmABgaAUUrZHmG14UEMVyB3JmaGGiItMcwXP5ZTDvZJ35XA4cDV70j+YXTjuCDXD9
 Kg2Y3s34YNsCpONU6F0YCHxS2DzDiEbs3rlIn2FDSl6QhokimEk791W
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d59c609d5kunm343af971138b07
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGh9IVkkaS0hLH05MH0geSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=bD1MJLPe6WiIC1Tw1WWbTRLJaPKkjJi3D5HA/IhsJFvulrcuWATzkH391PJVO72xvO3sv2eZHpieFCvqWOqq3JYTCBqsHg/JahDQluUKPr+Ixu9+rgUBbaA/QCtR5HxPw0r++Ga24OeeMLRYNagEKN+dNZ3dLSewUDuRpFhCxsg=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=Fhw4hjclec77QznNiSsI18O2qX1bXG4rCI/YfxKzWfs=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111526-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AB1964E164

Add audio support for the Thundercomm RubikPi3 board.

Enable AudioReach and describe the ES8316 headset codec, the LT9611
HDMI codec endpoint and the SPDIF TX/RX endpoints exposed on the
40-pin header. Add the sound card DAI links, LPASS pin configuration
and ES8316 fixed 3.3V supply.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 196 +++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..3249176b4c77 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -19,6 +19,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
 #include "pmk8350.dtsi" /* PMK7325 */
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
@@ -128,6 +129,23 @@ fan0: pwm-fan {
 		pinctrl-names = "default";
 	};
 
+	vreg_es8316_3v3: vreg-es8316-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_es8316_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&es8316_power_on>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_eth_1v8: regulator-eth-1v8 {
 		compatible = "regulator-fixed";
 
@@ -346,6 +364,16 @@ active-config0 {
 		};
 	};
 
+	spdif_rx: spdif-rx {
+		compatible = "linux,spdif-dir";
+		#sound-dai-cells = <0>;
+	};
+
+	spdif_tx: spdif-tx {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
 	usb1-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
@@ -727,6 +755,23 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs6490/a660_zap.mbn";
 };
 
+&i2c0 {
+	status = "okay";
+
+	es8316: audio-codec@11 {
+		compatible = "everest,es8316";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_BOTH>;
+
+		everest,jack-detect-inverted;
+	};
+};
+
 /* Pin 3, 5 in 40-pin connector */
 &i2c1 {
 	status = "okay";
@@ -740,6 +785,7 @@ &i2c9 {
 	lt9611_codec: hdmi-bridge@39 {
 		compatible = "lontium,lt9611";
 		reg = <0x39>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -970,6 +1016,15 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
+		    <&mi2s0_sclk>, <&mi2s0_ws>,
+		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>, <&lpass_qua_mi2s_data>,
+		    <&lpass_lpi_i2s1_clk>, <&lpass_lpi_i2s1_ws>,
+		    <&lpass_lpi_i2s1_data0>, <&lpass_lpi_i2s1_data1>;
+	pinctrl-names = "default";
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcm6490/qupv3fw.elf";
 
@@ -1006,6 +1061,96 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
+	model = "QCS6490-Thundercomm-RubikPi3";
+
+	audio-routing =
+		"Headphone Jack", "HPOL",
+		"Headphone Jack", "HPOR",
+		"MIC2", "Mic Jack";
+
+	mi2s-playback-dai-link {
+		link-name = "MI2S-LPAIF-RX-PRIMARY";
+
+		codec {
+			sound-dai = <&es8316>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	mi2s-capture-dai-link {
+		link-name = "MI2S-LPAIF-TX-PRIMARY";
+
+		codec {
+			sound-dai = <&es8316>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	quaternary-mi2s-playback-dai-link {
+		link-name = "MI2S-LPAIF_RXTX-RX-PRIMARY";
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	tert-mi2s-playback-dai-link {
+		link-name = "MI2S-LPAIF-RX-TERTIARY";
+
+		codec {
+			sound-dai = <&spdif_tx>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TERTIARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	tert-mi2s-capture-dai-link {
+		link-name = "MI2S-LPAIF-TX-TERTIARY";
+
+		codec {
+			sound-dai = <&spdif_rx>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
 /* Pin 19, 21, 23, 24 in 40-pin connector */
 &spi12 {
 	status = "okay";
@@ -1220,6 +1365,50 @@ &sdc2_data {
 	drive-strength = <10>;
 };
 
+&lpass_tlmm {
+	lpass_qua_mi2s_sclk: qua-mi2s-sclk-state {
+		pins = "gpio0";
+		function = "qua_mi2s_sclk";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	lpass_qua_mi2s_ws: qua-mi2s-ws-state {
+		pins = "gpio1";
+		function = "qua_mi2s_ws";
+		drive-strength = <8>;
+		output-high;
+	};
+
+	lpass_qua_mi2s_data: qua-mi2s-data-state {
+		pins = "gpio2", "gpio3", "gpio4";
+		function = "qua_mi2s_data";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	lpass_lpi_i2s1_clk: lpi-i2s1-clk-state {
+		pins = "gpio6";
+		function = "i2s1_clk";
+	};
+
+	lpass_lpi_i2s1_ws: lpi-i2s1-ws-state {
+		pins = "gpio7";
+		function = "i2s1_ws";
+	};
+
+	lpass_lpi_i2s1_data0: lpi-i2s1-data0-state {
+		pins = "gpio8";
+		function = "i2s1_data";
+	};
+
+	lpass_lpi_i2s1_data1: lpi-i2s1-data1-state {
+		pins = "gpio9";
+		function = "i2s1_data";
+	};
+};
+
 &tlmm {
 	pcie1_reset_n: pcie1-reset-n-state {
 		pins = "gpio2";
@@ -1387,6 +1576,13 @@ pcie0_wake_n: pcie0-wake-n-state {
 		bias-pull-up;
 	};
 
+	es8316_power_on: es8316-power-on-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wifi_power_on: wifi-power-on-state {
 		pins = "gpio125";
 		function = "gpio";

-- 
2.43.0


