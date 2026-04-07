Return-Path: <linux-arm-msm+bounces-102195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JIFCOIi1WnK1AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:29:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E53B0FFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 106E2302E700
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD123A4F2A;
	Tue,  7 Apr 2026 15:21:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920C2FFDE1;
	Tue,  7 Apr 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575288; cv=none; b=cLtH+MOlFc3G5JnER2Lqpiv0rDIykXY7KqY8yrPH5pGUY4ydPZKGr/w4/F5s/0h7MNhks/38wUwvvyRTAtoi+nfT+boakw25p4tbpjHA0qW6kPA+u8ogF5HIosnYYOjy+cjFRN5Pr/5eGyBx+mTjvsL2CoNN74G5JNm+g9N/bJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575288; c=relaxed/simple;
	bh=9QSYdks2nhxeSZpUHiGZuhuUYv+lFBDwnW8zW0/Ewz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkEt/MGjfQaaZArLhGaRY+5VsxtbBwUOTlsbRzpzqqXwhRDFcPvjeZY2Ym7iuUAb3QIxcXmWv3DC2iOFfTrMmcKCWzjujFVVr8Yf9A7qSKUICoIADL+qjHzUujUKSHm6pZUO2+YoMLF0dSrflxLJTGRs2bQhah5ZOf9+T+SN23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575240t16b60c5e
X-QQ-Originating-IP: Vyb/Mmha8lCRKCtgWx9DHHNZctVqPr0tnny8JdmREdk=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6365229028860219845
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:20:02 +0800
Subject: [PATCH 10/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: factor
 out common board dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-10-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=52707; i=sophon@radxa.com;
 h=from:subject:message-id; bh=9QSYdks2nhxeSZpUHiGZuhuUYv+lFBDwnW8zW0/Ewz0=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZa6TevJY+yY6P3eevlLrSelSnfsmVKjMiZ4zDh/2
 s+zPGF9RykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgImklDEy3HRMesr4LdLrSrni
 cR+lVx+D3tUmvonJP73d5eXHok2cExj+5z/+XrH5kuiuOQxWxqUfN7GGMiouUwiQY759Uk5f6JE
 tMwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NG5Tb6DTr4IeWLqqLUfAAyjzfKBAgcBDXEzZyNlnR4Jw05Bekx5vYV0C
	R/4sqEfd9JXqflwuvJxEH7ffmIIy7VEgHxeL7gGE0wwDrfvPO2ps9F0dg2bGEYzuO6rRbrq
	iH4H5U/ip7W/65UH3xB5sRR3xgfj7UNYI/Q8wCvy+R3C6cC3uKKkrGhWN2rU517y39Qbn4o
	GyABNMGb0Ws0Q6ItgOWu9qc3pDb+b3mszVBftvug1JsbIcaDKYhb90OuwKiG7MJmIbN3Rev
	is/Wk7tZKd9+XxGmBcTGJAAdbkhWl11/+p8bZ86VCJs6hrfEvKPsuu4SyIDnXaAkLTwfGht
	oYJDo1rzCmJN9LZGTVlig7jOoFpoFgXEqd06Mp6A9ulOEpbi4H6D4iTNdiHcC3eOkFtOPPm
	Nucbg369P/c+HrBdp+wgHR/QLwbQdc1shz2c2npZvlpbA5PS1glaWYce04JSdVX3CpbRI0z
	mU97mTlC7RrTR2WKF/1M5adZSLNY6JG+oTXNupmp4Ts3zUCzYKFUwuVPMHxvsNPT70UEybq
	KiYlbgo+ir2M0xN2DzfwsEdCOUeGdpuzVC4F0R++E2JjCrpz7cne79v5jBeY6xanWQCvUdO
	cW6IR/rnrA3NIu6nxMGFZj7rRP72nTZP4AGu4IeS3oCS9eMpNxr+bjvaOZ21ERJpWabyS/A
	A2xKa/ZoMb2NIb/TyEe8x65r/kjDyJqtmwafndqJj3c4WCWMc0G35iFzaGYuuRtKvBoZejZ
	00/BFXjUhGE/mU06L4CQnz6PMIES6TPn8S5ggziau/O/Jbh9Rm2LrDr6jFp/Qr/m6tPeKOr
	wbMNA8p0wQyIhq3it/6yFXTSjvZqJquIhYNcks9tCpBSbtqV4fbE8wOnA318f6DIZ2+Bdfh
	Iqeo9AOE1SK3p+Qcj5kNoGGQ8tbFTxqqg7JwuJ8sho9myh91wXJiwRz2Fln5aj+oDMKRGxv
	VhVvacnvjqI6LoeFzgaC1sGdi0Fudayeby2hIhH7AH0n4MA+HF8Bb+EnTkDmye8uFsfrtCy
	EKnApD6IU402uxycfFrdGTiso92m2KpCXDQmSLR/lOTyEFr3WJYl2h4h/J9uWQa1E5HU5DS
	g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102195-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.843];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC6E53B0FFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the common Radxa Dragon Q6A board description from
qcs6490-radxa-dragon-q6a.dts to a new qcs6490-radxa-dragon-q6a.dtsi so
it can be shared by multiple board variants.

Keep the existing Audioreach-based qcs6490-radxa-dragon-q6a.dts as the
default configuration by including the new common .dtsi and
qcs6490-audioreach.dtsi.

No functional change intended.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1135 +------------------
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtsi    | 1137 ++++++++++++++++++++
 2 files changed, 1139 insertions(+), 1133 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 5679f38de5b3..f52328fbaef9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1,568 +1,13 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2025 Radxa Computer (Shenzhen) Co., Ltd.
+ * Copyright (c) 2025-2026 Radxa Computer (Shenzhen) Co., Ltd.
  */
 
 /dts-v1/;
 
-/* PM7250B is configured to use SID8/9 */
-#define PM7250B_SID 8
-#define PM7250B_SID1 9
-
-#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
-#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "kodiak.dtsi"
-#include "pm7250b.dtsi"
-#include "pm7325.dtsi"
-#include "pm8350c.dtsi" /* PM7350C */
-#include "pmk8350.dtsi" /* PMK7325 */
+#include "qcs6490-radxa-dragon-q6a.dtsi"
 #include "qcs6490-audioreach.dtsi"
 
-/delete-node/ &adsp_mem;
-/delete-node/ &adsp_rpc_remote_heap_mem;
-/delete-node/ &cdsp_mem;
-/delete-node/ &gpu_zap_mem;
-/delete-node/ &ipa_fw_mem;
-/delete-node/ &mpss_mem;
-/delete-node/ &remoteproc_mpss;
-/delete-node/ &remoteproc_wpss;
-/delete-node/ &rmtfs_mem;
-/delete-node/ &video_mem;
-/delete-node/ &wifi;
-/delete-node/ &wlan_ce_mem;
-/delete-node/ &wlan_fw_mem;
-/delete-node/ &wpss_mem;
-
-/ {
-	model = "Radxa Dragon Q6A";
-	compatible = "radxa,dragon-q6a", "qcom,qcm6490";
-	chassis-type = "embedded";
-
-	aliases {
-		mmc0 = &sdhc_1;
-		mmc1 = &sdhc_2;
-		serial0 = &uart5;
-	};
-
-	wcd938x: audio-codec {
-		compatible = "qcom,wcd9380-codec";
-
-		pinctrl-0 = <&wcd_default>;
-		pinctrl-names = "default";
-
-		reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
-
-		vdd-rxtx-supply = <&vreg_l18b_1p8>;
-		vdd-io-supply = <&vreg_l18b_1p8>;
-		vdd-buck-supply = <&vreg_l17b_1p8>;
-		vdd-mic-bias-supply = <&vreg_bob_3p296>;
-
-		qcom,micbias1-microvolt = <1800000>;
-		qcom,micbias2-microvolt = <1800000>;
-		qcom,micbias3-microvolt = <1800000>;
-		qcom,micbias4-microvolt = <1800000>;
-		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
-		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
-		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
-		qcom,rx-device = <&wcd_rx>;
-		qcom,tx-device = <&wcd_tx>;
-
-		qcom,hphl-jack-type-normally-closed;
-
-		#sound-dai-cells = <1>;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	usb2_1_con: connector-0 {
-		compatible = "usb-a-connector";
-		vbus-supply = <&vcc_5v_peri>;
-
-		port {
-			usb2_1_connector: endpoint {
-				remote-endpoint = <&usb_hub_2_1>;
-			};
-		};
-	};
-
-	usb2_2_con: connector-1 {
-		compatible = "usb-a-connector";
-		vbus-supply = <&vcc_5v_peri>;
-
-		port {
-			usb2_2_connector: endpoint {
-				remote-endpoint = <&usb_hub_2_2>;
-			};
-		};
-	};
-
-	usb2_3_con: connector-2 {
-		compatible = "usb-a-connector";
-		vbus-supply = <&vcc_5v_peri>;
-
-		port {
-			usb2_3_connector: endpoint {
-				remote-endpoint = <&usb_hub_2_3>;
-			};
-		};
-	};
-
-	usb3_con: connector {
-		compatible = "usb-a-connector";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				usb3_con_hs_in: endpoint {
-					remote-endpoint = <&usb_1_dwc3_hs>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				usb3_con_ss_in: endpoint {
-					remote-endpoint = <&usb_1_qmpphy_out_usb>;
-				};
-			};
-		};
-	};
-
-	hdmi-bridge {
-		compatible = "radxa,ra620";
-
-		pinctrl-0 = <&dp_hot_plug_det>;
-		pinctrl-names = "default";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				hdmi_bridge_in: endpoint {
-					remote-endpoint = <&usb_1_qmpphy_out_dp>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				hdmi_bridge_out: endpoint {
-					remote-endpoint = <&hdmi_connector_in>;
-				};
-			};
-		};
-	};
-
-	hdmi-connector {
-		compatible = "hdmi-connector";
-		label = "hdmi";
-		type = "a";
-
-		port {
-			hdmi_connector_in: endpoint {
-				remote-endpoint = <&hdmi_bridge_out>;
-			};
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		pinctrl-0 = <&user_led>;
-		pinctrl-names = "default";
-
-		user-led {
-			color = <LED_COLOR_ID_BLUE>;
-			function = LED_FUNCTION_INDICATOR;
-			gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "none";
-			default-state = "off";
-			panic-indicator;
-		};
-	};
-
-	reserved-memory {
-		lpass_ml_mem: lpass-ml@81800000 {
-			reg = <0x0 0x81800000 0x0 0xf00000>;
-			no-map;
-		};
-
-		cdsp_secure_heap_mem: cdsp-secure-heap@82700000 {
-			reg = <0x0 0x82700000 0x0 0x10000>;
-			no-map;
-		};
-
-		adsp_mem: adsp@8b800000 {
-			reg = <0x0 0x8b800000 0x0 0x2800000>;
-			no-map;
-		};
-
-		cdsp_mem: cdsp@8e000000 {
-			reg = <0x0 0x8e000000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		video_mem: video@8fe00000 {
-			reg = <0x0 0x8fe00000 0x0 0x500000>;
-			no-map;
-		};
-
-		gpu_zap_mem: zap@90300000 {
-			reg = <0x0 0x90300000 0x0 0x5000>;
-			no-map;
-		};
-
-		tz_stat_mem: tz-stat@c0000000 {
-			reg = <0x0 0xc0000000 0x0 0x100000>;
-			no-map;
-		};
-
-		tags_mem: tags@c0100000 {
-			reg = <0x0 0xc0100000 0x0 0x1200000>;
-			no-map;
-		};
-
-		qtee_mem: qtee@c1300000 {
-			reg = <0x0 0xc1300000 0x0 0x500000>;
-			no-map;
-		};
-
-		trusted_apps_mem: trusted-apps@c1800000 {
-			reg = <0x0 0xc1800000 0x0 0x2200000>;
-			no-map;
-		};
-
-		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@c6500000 {
-			reg = <0x0 0xc6500000 0x0 0x800000>;
-			no-map;
-		};
-	};
-
-	thermal-zones {
-		msm-skin-thermal {
-			polling-delay-passive = <0>;
-			thermal-sensors = <&pmk8350_adc_tm 2>;
-		};
-
-		quiet-thermal {
-			polling-delay-passive = <0>;
-			thermal-sensors = <&pmk8350_adc_tm 1>;
-		};
-
-		ufs-thermal {
-			polling-delay-passive = <0>;
-			thermal-sensors = <&pmk8350_adc_tm 3>;
-		};
-
-		xo-thermal {
-			polling-delay-passive = <0>;
-			thermal-sensors = <&pmk8350_adc_tm 0>;
-		};
-	};
-
-	vcc_1v8: regulator-vcc-1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_1v8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_5v_peri>;
-
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	vcc_3v3: regulator-vcc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_5v_peri>;
-
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	vcc_5v_peri: regulator-vcc-5v-peri {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_5v_peri";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vph_pwr>;
-
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-boot-on;
-		regulator-always-on;
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pm7325-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-		vdd-s3-supply = <&vph_pwr>;
-		vdd-s4-supply = <&vph_pwr>;
-		vdd-s5-supply = <&vph_pwr>;
-		vdd-s6-supply = <&vph_pwr>;
-		vdd-s7-supply = <&vph_pwr>;
-		vdd-s8-supply = <&vph_pwr>;
-		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p536>;
-		vdd-l2-l7-supply = <&vreg_bob_3p296>;
-		vdd-l6-l9-l10-supply = <&vreg_s8b_1p2>;
-		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p84>;
-
-		vreg_s1b_1p84: smps1 {
-			regulator-name = "vreg_s1b_1p84";
-			regulator-min-microvolt = <1840000>;
-			regulator-max-microvolt = <2040000>;
-		};
-
-		vreg_s7b_0p536: smps7 {
-			regulator-name = "vreg_s7b_0p536";
-			regulator-min-microvolt = <536000>;
-			regulator-max-microvolt = <1120000>;
-		};
-
-		vreg_s8b_1p2: smps8 {
-			regulator-name = "vreg_s8b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1496000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
-		};
-
-		vreg_l1b_0p912: ldo1 {
-			regulator-name = "vreg_l1b_0p912";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-							RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_3p072: ldo2 {
-			regulator-name = "vreg_l2b_3p072";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <3544000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-							RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6b_1p2: ldo6 {
-			regulator-name = "vreg_l6b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1256000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-							RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b_2p96: ldo7 {
-			regulator-name = "vreg_l7b_2p96";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-							RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_1p2: ldo9 {
-			regulator-name = "vreg_l9b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_1p8: ldo17 {
-			regulator-name = "vreg_l17b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1896000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b_1p8: ldo18 {
-			regulator-name = "vreg_l18b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
-
-		vreg_l19b_1p8: ldo19 {
-			regulator-name = "vreg_l19b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pm8350c-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-		vdd-s3-supply = <&vph_pwr>;
-		vdd-s4-supply = <&vph_pwr>;
-		vdd-s5-supply = <&vph_pwr>;
-		vdd-s6-supply = <&vph_pwr>;
-		vdd-s7-supply = <&vph_pwr>;
-		vdd-s8-supply = <&vph_pwr>;
-		vdd-s9-supply = <&vph_pwr>;
-		vdd-s10-supply = <&vph_pwr>;
-		vdd-l1-l12-supply = <&vreg_s1b_1p84>;
-		vdd-l6-l9-l11-supply = <&vreg_bob_3p296>;
-		vdd-l10-supply = <&vreg_s7b_0p536>;
-		vdd-bob-supply = <&vph_pwr>;
-
-		vreg_l1c_1p8: ldo1 {
-			regulator-name = "vreg_l1c_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1976000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6c_2p96: ldo6 {
-			regulator-name = "vreg_l6c_2p96";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3544000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9c_2p96: ldo9 {
-			regulator-name = "vreg_l9c_2p96";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <3544000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10c_0p88: ldo10 {
-			regulator-name = "vreg_l10c_0p88";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <1048000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_bob_3p296: bob {
-			regulator-name = "vreg_bob_3p296";
-			regulator-min-microvolt = <3032000>;
-			regulator-max-microvolt = <3960000>;
-		};
-	};
-};
-
-&gcc {
-	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
-			   <GCC_MSS_CFG_AHB_CLK>,
-			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
-			   <GCC_MSS_OFFLINE_AXI_CLK>,
-			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
-			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
-			   <GCC_MSS_SNOC_AXI_CLK>,
-			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
-			   <GCC_QSPI_CORE_CLK>,
-			   <GCC_QSPI_CORE_CLK_SRC>,
-			   <GCC_SEC_CTRL_CLK_SRC>,
-			   <GCC_WPSS_AHB_BDG_MST_CLK>,
-			   <GCC_WPSS_AHB_CLK>,
-			   <GCC_WPSS_RSCP_CLK>;
-};
-
-&gpi_dma0 {
-	status = "okay";
-};
-
-&gpi_dma1 {
-	status = "okay";
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/qcs6490/a660_zap.mbn";
-};
-
-/* Pin 13, 15 in GPIO header */
-&i2c0 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
-/* Pin 27, 28 in GPIO header */
-&i2c2 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
-/* Pin 3, 5 in GPIO header */
-&i2c6 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
-&i2c10 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-
-	rtc: rtc@68 {
-		compatible = "st,m41t11";
-		reg = <0x68>;
-	};
-};
-
-/* External touchscreen */
-&i2c13 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
@@ -580,207 +25,6 @@ &lpass_va_macro {
 	status = "okay";
 };
 
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp {
-	sound-name-prefix = "Display Port0";
-
-	status = "okay";
-};
-
-&mdss_dp_out {
-	data-lanes = <0 1>;
-	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
-};
-
-&pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie0_phy {
-	vdda-phy-supply = <&vreg_l10c_0p88>;
-	vdda-pll-supply = <&vreg_l6b_1p2>;
-
-	status = "okay";
-};
-
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
-	pinctrl-names = "default";
-
-	/* Support for QPS615 PCIe switch */
-	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
-		    <0x100 &apps_smmu 0x1c81 0x1>,
-		    <0x208 &apps_smmu 0x1c84 0x1>,
-		    <0x210 &apps_smmu 0x1c85 0x1>,
-		    <0x218 &apps_smmu 0x1c86 0x1>,
-		    <0x300 &apps_smmu 0x1c87 0x1>,
-		    <0x400 &apps_smmu 0x1c88 0x1>,
-		    <0x500 &apps_smmu 0x1c89 0x1>,
-		    <0x501 &apps_smmu 0x1c90 0x1>;
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	vdda-phy-supply = <&vreg_l10c_0p88>;
-	vdda-pll-supply = <&vreg_l6b_1p2>;
-
-	status = "okay";
-};
-
-&pm7325_gpios {
-	pm7325_adc_default: adc-default-state {
-		pins = "gpio2";
-		function = PMIC_GPIO_FUNC_NORMAL;
-		bias-high-impedance;
-	};
-};
-
-&pm7325_temp_alarm {
-	io-channels = <&pmk8350_vadc PM7325_ADC7_DIE_TEMP>;
-	io-channel-names = "thermal";
-};
-
-&pmk8350_adc_tm {
-	status = "okay";
-
-	xo-therm@0 {
-		reg = <0>;
-		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time-us = <200>;
-	};
-
-	quiet-therm@1 {
-		reg = <1>;
-		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time-us = <200>;
-	};
-
-	msm-skin-therm@2 {
-		reg = <2>;
-		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time-us = <200>;
-	};
-
-	ufs-therm@3 {
-		reg = <3>;
-		io-channels = <&pmk8350_vadc PM7325_ADC7_GPIO1_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time-us = <200>;
-	};
-};
-
-&pmk8350_vadc {
-	pinctrl-0 = <&pm7325_adc_default>;
-	pinctrl-names = "default";
-
-	channel@3 {
-		reg = <PMK8350_ADC7_DIE_TEMP>;
-		label = "pmk7325_die_temp";
-		qcom,pre-scaling = <1 1>;
-	};
-
-	channel@44 {
-		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
-		label = "xo_therm";
-		qcom,hw-settle-time = <200>;
-		qcom,pre-scaling = <1 1>;
-		qcom,ratiometric;
-	};
-
-	channel@103 {
-		reg = <PM7325_ADC7_DIE_TEMP>;
-		label = "pm7325_die_temp";
-		qcom,pre-scaling = <1 1>;
-	};
-
-	channel@144 {
-		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time = <200>;
-		qcom,pre-scaling = <1 1>;
-		label = "quiet_therm";
-	};
-
-	channel@146 {
-		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time = <200>;
-		qcom,pre-scaling = <1 1>;
-		label = "msm_skin_therm";
-	};
-
-	channel@14a {
-		/* According to datasheet, 0x4a = AMUX1_GPIO = GPIO_02 */
-		reg = <PM7325_ADC7_GPIO1_100K_PU>;
-		qcom,ratiometric;
-		qcom,hw-settle-time = <200>;
-		qcom,pre-scaling = <1 1>;
-		label = "ufs_therm";
-	};
-};
-
-&pon_pwrkey {
-	status = "okay";
-};
-
-&qupv3_id_0 {
-	firmware-name = "qcom/qcm6490/qupv3fw.elf";
-	status = "okay";
-};
-
-&qupv3_id_1 {
-	firmware-name = "qcom/qcm6490/qupv3fw.elf";
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/qcs6490/radxa/dragon-q6a/adsp.mbn";
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn";
-	status = "okay";
-};
-
-&sdhc_1 {
-	non-removable;
-	no-sd;
-	no-sdio;
-
-	vmmc-supply = <&vreg_l7b_2p96>;
-	vqmmc-supply = <&vreg_l19b_1p8>;
-
-	status = "okay";
-};
-
-&sdhc_2 {
-	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
-	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
-
-	vmmc-supply = <&vreg_l9c_2p96>;
-	vqmmc-supply = <&vreg_l6c_2p96>;
-
-	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
 &sound {
 	compatible = "qcom,qcs6490-rb3gen2-sndcard";
 	model = "QCS6490-Radxa-Dragon-Q6A";
@@ -838,378 +82,3 @@ platform {
 		};
 	};
 };
-
-/* Pin 11, 29, 31, 32 in GPIO header */
-&spi7 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
-/* Pin 19, 21, 23, 24, 26 in GPIO header */
-&spi12 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
-/* Pin 22, 33, 36, 37 in GPIO header */
-&spi14 {
-	qcom,enable-gsi-dma;
-	status = "okay";
-};
-
-&swr0 {
-	status = "okay";
-
-	wcd_rx: codec@0,4 {
-		compatible = "sdw20217010d00";
-		reg = <0 4>;
-		qcom,rx-port-mapping = <1 2 3 4 5>;
-	};
-};
-
-&swr1 {
-	status = "okay";
-
-	wcd_tx: codec@0,3 {
-		compatible = "sdw20217010d00";
-		reg = <0 3>;
-		qcom,tx-port-mapping = <1 1 2 3>;
-	};
-};
-
-&tlmm {
-	/*
-	 * 12-17: reserved for QSPI flash
-	 */
-	gpio-reserved-ranges = <12 6>;
-	gpio-line-names =
-		/* GPIO_0 ~ GPIO_3 */
-		"PIN_13", "PIN_15", "", "",
-		/* GPIO_4 ~ GPIO_7 */
-		"", "", "", "",
-		/* GPIO_8 ~ GPIO_11 */
-		"PIN_27", "PIN_28", "", "",
-		/* GPIO_12 ~ GPIO_15 */
-		"", "", "", "",
-		/* GPIO_16 ~ GPIO_19 */
-		"", "", "", "",
-		/* GPIO_20 ~ GPIO_23 */
-		"", "", "PIN_8", "PIN_10",
-		/* GPIO_24 ~ GPIO_27 */
-		"PIN_3", "PIN_5", "PIN_16", "PIN_18",
-		/* GPIO_28 ~ GPIO_31 */
-		"PIN_31", "PIN_11", "PIN_32", "PIN_29",
-		/* GPIO_32 ~ GPIO_35 */
-		"", "", "", "",
-		/* GPIO_36 ~ GPIO_39 */
-		"", "", "", "",
-		/* GPIO_40 ~ GPIO_43 */
-		"", "", "", "",
-		/* GPIO_44 ~ GPIO_47 */
-		"", "", "", "",
-		/* GPIO_48 ~ GPIO_51 */
-		"PIN_21", "PIN_19", "PIN_23", "PIN_24",
-		/* GPIO_52 ~ GPIO_55 */
-		"", "", "", "PIN_26",
-		/* GPIO_56 ~ GPIO_59 */
-		"PIN_33", "PIN_22", "PIN_37", "PIN_36",
-		/* GPIO_60 ~ GPIO_63 */
-		"", "", "", "",
-		/* GPIO_64 ~ GPIO_67 */
-		"", "", "", "",
-		/* GPIO_68 ~ GPIO_71 */
-		"", "", "", "",
-		/* GPIO_72 ~ GPIO_75 */
-		"", "", "", "",
-		/* GPIO_76 ~ GPIO_79 */
-		"", "", "", "",
-		/* GPIO_80 ~ GPIO_83 */
-		"", "", "", "",
-		/* GPIO_84 ~ GPIO_87 */
-		"", "", "", "",
-		/* GPIO_88 ~ GPIO_91 */
-		"", "", "", "",
-		/* GPIO_92 ~ GPIO_95 */
-		"", "", "", "",
-		/* GPIO_96 ~ GPIO_99 */
-		"PIN_7", "PIN_12", "PIN_38", "PIN_40",
-		/* GPIO_100 ~ GPIO_103 */
-		"PIN_35", "", "", "",
-		/* GPIO_104 ~ GPIO_107 */
-		"", "", "", "",
-		/* GPIO_108 ~ GPIO_111 */
-		"", "", "", "",
-		/* GPIO_112 ~ GPIO_115 */
-		"", "", "", "",
-		/* GPIO_116 ~ GPIO_119 */
-		"", "", "", "",
-		/* GPIO_120 ~ GPIO_123 */
-		"", "", "", "",
-		/* GPIO_124 ~ GPIO_127 */
-		"", "", "", "",
-		/* GPIO_128 ~ GPIO_131 */
-		"", "", "", "",
-		/* GPIO_132 ~ GPIO_135 */
-		"", "", "", "",
-		/* GPIO_136 ~ GPIO_139 */
-		"", "", "", "",
-		/* GPIO_140 ~ GPIO_143 */
-		"", "", "", "",
-		/* GPIO_144 ~ GPIO_147 */
-		"", "", "", "",
-		/* GPIO_148 ~ GPIO_151 */
-		"", "", "", "",
-		/* GPIO_152 ~ GPIO_155 */
-		"", "", "", "",
-		/* GPIO_156 ~ GPIO_159 */
-		"", "", "", "",
-		/* GPIO_160 ~ GPIO_163 */
-		"", "", "", "",
-		/* GPIO_164 ~ GPIO_167 */
-		"", "", "", "",
-		/* GPIO_168 ~ GPIO_171 */
-		"", "", "", "",
-		/* GPIO_172 ~ GPIO_174 */
-		"", "", "";
-
-	pcie0_reset_n: pcie0-reset-n-state {
-		pins = "gpio87";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	pcie0_wake_n: pcie0-wake-n-state {
-		pins = "gpio89";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	pcie1_reset_n: pcie1-reset-n-state {
-		pins = "gpio2";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	pcie1_wake_n: pcie1-wake-n-state {
-		pins = "gpio3";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	sd_cd: sd-cd-state {
-		pins = "gpio91";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	user_led: user-led-state {
-		pins = "gpio42";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	wcd_default: wcd-reset-n-active-state {
-		pins = "gpio83";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&ufs_mem_hc {
-	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	vcc-supply = <&vreg_l7b_2p96>;
-	vcc-max-microamp = <800000>;
-	vccq-supply = <&vreg_l9b_1p2>;
-	vccq-max-microamp = <900000>;
-	vccq2-supply = <&vreg_l9b_1p2>;
-	vccq2-max-microamp = <1300000>;
-
-	/* Gear-4 Rate-B is unstable due to board */
-	/* and UFS module design limitations */
-	limit-gear-rate = "rate-a";
-
-	status = "okay";
-};
-
-&ufs_mem_phy {
-	vdda-phy-supply = <&vreg_l10c_0p88>;
-	vdda-pll-supply = <&vreg_l6b_1p2>;
-
-	status = "okay";
-};
-
-&usb_1 {
-	dr_mode = "host";
-
-	status = "okay";
-};
-
-&usb_1_dwc3_hs {
-	remote-endpoint = <&usb3_con_hs_in>;
-};
-
-&usb_1_hsphy {
-	vdda-pll-supply = <&vreg_l10c_0p88>;
-	vdda33-supply = <&vreg_l2b_3p072>;
-	vdda18-supply = <&vreg_l1c_1p8>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p912>;
-
-	/delete-property/ orientation-switch;
-
-	status = "okay";
-
-	ports {
-		port@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/delete-node/ endpoint;
-
-			/* RX0/TX0 is statically connected to RA620 bridge */
-			usb_1_qmpphy_out_dp: endpoint@0 {
-				reg = <0>;
-
-				data-lanes = <0 1>;
-				remote-endpoint = <&hdmi_bridge_in>;
-			};
-
-			/* RX1/TX1 is statically connected to USB-A port */
-			usb_1_qmpphy_out_usb: endpoint@1 {
-				reg = <1>;
-
-				data-lanes = <2 3>;
-				remote-endpoint = <&usb3_con_ss_in>;
-			};
-		};
-	};
-};
-
-&usb_2 {
-	dr_mode = "host";
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	status = "okay";
-
-	/* Onboard USB 2.0 hub */
-	usb_hub_2_x: hub@1 {
-		compatible = "usb1a40,0101";
-		reg = <1>;
-		vdd-supply = <&vcc_5v_peri>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-
-				usb_hub_2_1: endpoint {
-					remote-endpoint = <&usb2_1_connector>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				usb_hub_2_2: endpoint {
-					remote-endpoint = <&usb2_2_connector>;
-				};
-			};
-
-			port@3 {
-				reg = <3>;
-
-				usb_hub_2_3: endpoint {
-					remote-endpoint = <&usb2_3_connector>;
-				};
-			};
-		};
-
-		/* FCU760K Wi-Fi & Bluetooth module */
-		wifi@4 {
-			compatible = "usba69c,8d80";
-			reg = <4>;
-		};
-	};
-};
-
-&usb_2_hsphy {
-	vdda-pll-supply = <&vreg_l10c_0p88>;
-	vdda33-supply = <&vreg_l2b_3p072>;
-	vdda18-supply = <&vreg_l1c_1p8>;
-
-	status = "okay";
-};
-
-&venus {
-	status = "okay";
-};
-
-/* PINCTRL - additions to nodes defined in sc7280.dtsi */
-&dp_hot_plug_det {
-	bias-disable;
-};
-
-&pcie0_clkreq_n {
-	bias-pull-up;
-	drive-strength = <2>;
-};
-
-&pcie1_clkreq_n {
-	bias-pull-up;
-	drive-strength = <2>;
-};
-
-&sdc1_clk {
-	bias-disable;
-	drive-strength = <16>;
-};
-
-&sdc1_cmd {
-	bias-pull-up;
-	drive-strength = <10>;
-};
-
-&sdc1_data {
-	bias-pull-up;
-	drive-strength = <10>;
-};
-
-&sdc1_rclk {
-	bias-pull-down;
-};
-
-&sdc2_clk {
-	bias-disable;
-	drive-strength = <16>;
-};
-
-&sdc2_cmd {
-	bias-pull-up;
-	drive-strength = <10>;
-};
-
-&sdc2_data {
-	bias-pull-up;
-	drive-strength = <10>;
-};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtsi
new file mode 100644
index 000000000000..52c2f053c820
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtsi
@@ -0,0 +1,1137 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025-2026 Radxa Computer (Shenzhen) Co., Ltd.
+ */
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
+#include "kodiak.dtsi"
+#include "pm7250b.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi" /* PM7350C */
+#include "pmk8350.dtsi" /* PMK7325 */
+
+/delete-node/ &adsp_mem;
+/delete-node/ &adsp_rpc_remote_heap_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &gpu_zap_mem;
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
+					remote-endpoint = <&usb_1_qmpphy_out_usb>;
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
+					remote-endpoint = <&usb_1_qmpphy_out_dp>;
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
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+			panic-indicator;
+		};
+	};
+
+	reserved-memory {
+		lpass_ml_mem: lpass-ml@81800000 {
+			reg = <0x0 0x81800000 0x0 0xf00000>;
+			no-map;
+		};
+
+		cdsp_secure_heap_mem: cdsp-secure-heap@82700000 {
+			reg = <0x0 0x82700000 0x0 0x10000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@8b800000 {
+			reg = <0x0 0x8b800000 0x0 0x2800000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@8e000000 {
+			reg = <0x0 0x8e000000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		video_mem: video@8fe00000 {
+			reg = <0x0 0x8fe00000 0x0 0x500000>;
+			no-map;
+		};
+
+		gpu_zap_mem: zap@90300000 {
+			reg = <0x0 0x90300000 0x0 0x5000>;
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
+			reg = <0x0 0xc1800000 0x0 0x2200000>;
+			no-map;
+		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@c6500000 {
+			reg = <0x0 0xc6500000 0x0 0x800000>;
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
+		vdd-l6-l9-l10-supply = <&vreg_s8b_1p2>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p84>;
+
+		vreg_s1b_1p84: smps1 {
+			regulator-name = "vreg_s1b_1p84";
+			regulator-min-microvolt = <1840000>;
+			regulator-max-microvolt = <2040000>;
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
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
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
+	/*
+	 * 12-17: reserved for QSPI flash
+	 */
+	gpio-reserved-ranges = <12 6>;
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
+		"PIN_3", "PIN_5", "PIN_16", "PIN_18",
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
+	limit-gear-rate = "rate-a";
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
+			/* RX0/TX0 is statically connected to RA620 bridge */
+			usb_1_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <0 1>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+
+			/* RX1/TX1 is statically connected to USB-A port */
+			usb_1_qmpphy_out_usb: endpoint@1 {
+				reg = <1>;
+
+				data-lanes = <2 3>;
+				remote-endpoint = <&usb3_con_ss_in>;
+			};
+		};
+	};
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
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+
+	status = "okay";
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
2.53.0


