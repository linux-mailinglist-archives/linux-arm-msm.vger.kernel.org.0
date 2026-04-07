Return-Path: <linux-arm-msm+bounces-102186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFkpITkh1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:22:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E08693B0E0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15F1D3054326
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC11364945;
	Tue,  7 Apr 2026 15:20:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A9E481B1;
	Tue,  7 Apr 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575229; cv=none; b=nDLY587zssj1Rk2rNp4I1Bo5rzr8M9KHm72RWHlZsjeTWGgJ5UU9+Mm18V0Kb0lI5CbO7j/+iQdHTV1BAytfdAC6FlbMFyjTfz5nuKHthVk84mnNDFgQVU1I4KK+nI4ODqOT/pt+66XVnsDPtEcHh7KhaGYtD2VU8HuoY1dPBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575229; c=relaxed/simple;
	bh=ixPJrGY1O+mE0aWnTQIzBfshjAE69bo/XerA5vDLAcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnCrM3Xu0LW8VxfwJwQW0bxfaukR+ajbu95UWuLQtHxvQP9hr4Tm7fAZQCmbhqu7FGPV2euA4uA8VcO/vk5BFqk9dYLd2v34iXTi1LBjgdwu88wG0Eoc7ZMp+f/htc+SslH7mYZ6gPmq7a7x+N+S7BO3eD/dLAc4GBrxuB18EpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575217t4daf605d
X-QQ-Originating-IP: mWhUZZhuCWLavO5C3vvO2wQbtODyPLIMTZnPjkSdL4A=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15496350578048626149
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:55 +0800
Subject: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=sophon@radxa.com;
 h=from:subject:message-id; bh=ixPJrGY1O+mE0aWnTQIzBfshjAE69bo/XerA5vDLAcc=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZaseKjllL/EJSdSN1lc7UWggNYEx8IitRDf8OfFg
 fs828I7SlkYxLgYZMUUWRTiGeayV+ZeeypWqgczh5UJZAgDF6cATCRlMiPDHwORlgs7Sy4I7ZNi
 c8qONawSXDG9XKXx6Ku9XkuUD78JZ/gr55HuHDP5S+kEnkeOC3w9zlnuuheusfaf+JZskfIg/nw
 eAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MorwW1vbY5Ciw7ZCgDZfWiXnBCvxCPavOEzWVqO4T6hG9/PcHFSHnrQG
	EY1SxvB8PsczIMkXBrfAjlrxaBzKsika9HKLVcbvKOA2DnFPLOPwgys+iSEaI8fl1pt1Q67
	lmOqQemws6N02ys/SgIACUIgfyiSJIIm5qvY2kquX8Q9+BbrTtu2POKWtNTiXvd9/iBKl76
	+XRrmWv3DrbRyyZhx5f8DrcnWEx7VBUstR1G3NQVXFBQrCZ1OkvcdOJDdcNI6NtXNrj/CbD
	m9o/wpsh9p3GguPESLqKl+JiinHlki5sonhsi5zQUewe5/Yt0ZXQhBUXHWNKABgwNLKN3fS
	Mo9ld3KkWdhwEUeElc+ZOkGfyfMjwL/Z3LpU94EM/OIMc6rxojJtHi/SghspYsS8NIMf7DS
	kEOKC0ZPUwW/ih775LtDj/F3lNG3/2kyWJXMBiTP5o+fgaio8CxKiOzqWFzSRSh98RktgHL
	Jog4HZ3PQUP125ZTw52ufEHxuQSN+doL8gnoqorRXWCwhI33f6a+/CZWzmujN2m8dhdKWVP
	etgikdBH2lta7RNfkHHDBo6YnK/NWCV3D1rU6q+/PkoR/WADlAqmNtDo5MhLnX6EhNArHO8
	lLndbEn+DZvx/7V30H4PM87n82xvqyYC8sgTnGe1+dDbRSGUsDonoQ4XA1uJPJ/CH8no0gL
	2ZxweUnuCMQWUVcBpqdh/04GaK1CGuy9bY9ZHI99mSoZLoyA4v4Mxd2lDyjJmUK7C7sjaGs
	DR9AiAR+CLc98VZokUKbxEXUkD4r41xnPzYaMuz/Hb8LlKDxNv20X33uu83Wi6R8Yp73WVo
	/CJK3z4N0snfUU8F9TClTtqbumLyS6LxP821fT1+mFtb9y2q9CFwijCtC03OTJYLL2Gq6k9
	O5e5DMjXR1+V+xVf9WLaLFiW1wZHRD8tRdFqXKZfakhrcJLENsfTS+7FGaIbVP2yeSHvHCL
	aKzwwKEma4kWuCHKW4s2Dn3d/jaoZqE1+JYC8cgwUQViCeq4gOYtv2cdqCT3DtigrBSnnW7
	drV8w040MCELn8j3yJ/R5tm+0A5afd6yM6KtHsaqsw4LQAGleAYrN2aikn4hKtCR94ERJNM
	w==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102186-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.771];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: E08693B0E0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
pair is connected to the RA620 DP-to-HDMI bridge.

Add and enable the nodes for the features to work.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index c961d3ec625f..8d649b3a1cfa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -111,6 +111,71 @@ usb2_3_connector: endpoint {
 		};
 	};
 
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
 	leds {
 		compatible = "gpio-leds";
 
@@ -521,6 +586,21 @@ &lpass_va_macro {
 	status = "okay";
 };
 
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
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
@@ -738,6 +818,22 @@ &sound {
 			"AMIC2", "MIC BIAS2",
 			"TX SWR_ADC1", "ADC2_OUTPUT";
 
+	dp0-dai-link {
+		link-name = "DP0 Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
 
@@ -982,6 +1078,58 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
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
 &usb_2 {
 	dr_mode = "host";
 
@@ -1048,6 +1196,10 @@ &venus {
 };
 
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
+&dp_hot_plug_det {
+	bias-disable;
+};
+
 &pcie0_clkreq_n {
 	bias-pull-up;
 	drive-strength = <2>;

-- 
2.53.0


