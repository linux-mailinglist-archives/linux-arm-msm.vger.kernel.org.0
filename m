Return-Path: <linux-arm-msm+bounces-98100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIdEF64SuWmFowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:37:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C72AB2A5C39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6C743053280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFA339D6D4;
	Tue, 17 Mar 2026 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="jS3av/tC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49226.qiye.163.com (mail-m49226.qiye.163.com [45.254.49.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E1188596;
	Tue, 17 Mar 2026 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736595; cv=none; b=OYX52/RfsRE/YPLw0H7iwTgpqWrxWDQG81/NHGG1k4hiXN2M2FssectGpc1UxID5/g5gnZIwzcHtQcSviFiy5Vu4352+U6wyosveF5KKp6JgopBQLU4ENFg2UcvTHz6kuAMafCzUN9onIhbFbygWTviu2ZX6aLvC7TwFX/N/5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736595; c=relaxed/simple;
	bh=baQNeXBE7npKcDlGStryNc13Z0dROADUrGzSelzrQT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNtOnRE18+C720SwmZqPMDeGj7ILS+0Q3xWJxU55iQi3TyWiHkVCA7GUUapYOe6rNrCYFcpz6lIqxfSTA/vQtHTa2axSdbgeX5AwdoIY0PL9aMRtZur4eLYvs9XMtKSREJo/d+zdZwY/sb4fQA+aGym3nOMAMV9/vp3B+5hm8go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=jS3av/tC; arc=none smtp.client-ip=45.254.49.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 373e3b4b7;
	Tue, 17 Mar 2026 16:36:22 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 17 Mar 2026 16:35:45 +0800
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-rubikpi-next-20260304-v2-6-5634fabe0c43@thundersoft.com>
References: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
In-Reply-To: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773736570; l=6173;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=baQNeXBE7npKcDlGStryNc13Z0dROADUrGzSelzrQT4=;
 b=IujKd+wE/AnfU/oXPX0Qb+AkRVIlAjg55tBv+clUjSX0BAKgXm9IRE5WJZu6K2R9TFTf1wc1l
 oH9os5SwZ56AcsDNXaRBhFSLeSRZsazPCPM3yO1dpYxqXd6yMJafAor
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cfaf05dcf09d5kunm8391965e39c9fd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkxIVk9MSUlJTBkfTEtJGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=jS3av/tCvh3Ssnp4GnbVhGGjCirZupfTYy+AhJdKW4xFPrrY6FDVVcqVIPtX5QlZ4/Ntoz5dm+Npb5VJozE4y0RdhUCZjU/tx6S1c7rcyFkO1SKL4MWu8M1vLNMz+/uT+u3rgZhDq6/wJJ2SMIc3gYBrcn/CWINptSfGvWXhwSU=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=KJyt/o2RLmptR4AhuSOo/qFkP0iWcCxeErwly/5Q4II=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.11:email,0.0.0.39:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C72AB2A5C39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add audio support for the Thundercomm RubikPi3 board:
- Enable AudioReach via qcs6490-audioreach.dtsi
- Add ES8316 codec on I2C0 with MCLK from LPASS PRM and jack detection
- Add fixed 3.3V regulator for ES8316 power supply
- Add MI2S playback/capture dai-links for ES8316
- Add HDMI audio via LT9611 bridge on quaternary MI2S
- Add SPDIF TX/RX on tertiary MI2S exposed at the board 40‑pin header
- Add LPASS pin configurations for quaternary MI2S and LPI I2S1

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 191 +++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0b64a0b91202..6831a576fefb 100644
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
 
@@ -364,6 +382,16 @@ usb1_sbu_mux: endpoint {
 			};
 		};
 	};
+
+	spdif_rx: spdif-rx {
+		compatible = "linux,spdif-dir";
+		#sound-dai-cells = <0>;
+	};
+
+	spdif_tx: spdif-tx {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
 };
 
 &apps_rsc {
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
 
@@ -1006,6 +1061,91 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcs6490-rb3gen2-sndcard";
+	model = "QCS6490-Thundercomm-RubikPi3";
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
@@ -1220,6 +1360,50 @@ &sdc2_data {
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
@@ -1387,6 +1571,13 @@ pcie0_wake_n: pcie0-wake-n-state {
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


