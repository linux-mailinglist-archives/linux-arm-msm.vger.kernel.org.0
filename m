Return-Path: <linux-arm-msm+bounces-66179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B8B0EA70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81BEC16B62F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 06:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D657D262FE2;
	Wed, 23 Jul 2025 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="di3HiSrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8F2620D2;
	Wed, 23 Jul 2025 06:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753251331; cv=none; b=C3ACZPy8q6iarYvdGRDo5mRCysEl6fPvguPlmkeFm4mB9Wmwbo8em2/m/eZf+I4gO5pIfvMxrRBf0R839kV2EMG1B41A3csFV/E5HaGSjF87sKCpjSKCxWI6SWOcPsnHctvxkTv/NSSxZGZm4bARFyYqNEcq02MS3DloiNPKXBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753251331; c=relaxed/simple;
	bh=N43cuG+pOVZm2ZWrnVJ4hATknbK5R9DIZewNsfCzvxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UYOQZppY7y8MwzR2hQVJOLaO6p0vv+EVTsbgEbmccgYhSOGmmBw10LUP2bOeMrJm5xYmJSv2dL4kAQtAy8jfQAjg7EAujPvST/30nJS6kX7ljWhMJHSTlf7BImr3C5HPFGO8+BiuBQIVAITtXCqFTbhJljJerw5BlLx7OR7utOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=di3HiSrc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOBak030875;
	Wed, 23 Jul 2025 06:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IFkELXFUB9NvN6iEc0gNji
	OsBXFmLuigfQwdoPldwz8=; b=di3HiSrcI6q+ZcuwhWao0ZE7zcmiXAYPazFKQh
	MoPZvOLUb16pOieu6dzEMa+1Mq1yp9GSuIT4k9f6NiI43NQuoqX1cH5K6c4yEl4R
	CF93+qgynGBqGWrkIVNeXtcZDU7BpX6Vv4/TXt0TohIUCEUTyhZFaPfeYs2HyvGY
	mGR7GOuDMOBT2XaLdN3701k1wJUr0j1u3aSfgb97wti4XLxZ7mZCpaF9olN7IUqO
	VAsXjqOrvaviG1z6cXGF95p0LKHYWFjmGA9NL3kDZfyjvrVnFCFKqKMsh+SSM5ZP
	wNq9VuM2bt76NHxSLjHZGrK/gp/cT0LVEavYSW1yp0HA0sNg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w2cyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 06:15:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56N6FQBg020134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 06:15:26 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 23:15:23 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 23 Jul 2025 14:14:55 +0800
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOF9gGgC/22Py2rDMBBFf8Vo3QkayZYflJL/KKHoMapFYyuxH
 JMS/O+V7W03A3dgzpz7YommQIl1xYtNtIQU4pgDvhXM9nr8JgguZya4qHgtEJ5IQMsPuBtgicS
 dr6pWOpYPbhP58Nxhn5cjT3R/ZOZ8LNlAKemd2RXvBxIV9HqI+iuMYQ76CgsCB6985bhvNSp5j
 imd7g99tXEYTnl8bM+MTgTbJsxdwQ0J2SAnKUg5rrF2vracjHZNWxktrEDubck2rT6kOU6/e+U
 Fd6//2mUPBONQ+rZUUpnmnKvYMNpNgV3Wdf0DBIjS9T0BAAA=
X-Change-ID: 20250721-x1e-evk-dp-141e0df5593d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753251323; l=5750;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=N43cuG+pOVZm2ZWrnVJ4hATknbK5R9DIZewNsfCzvxQ=;
 b=BIHmQvD11heOY1w/Ayue2uG9a2oAdsKNf2dIws3gwjjnG31rHNwQI7iIV/t6VmuUhYAhm++6c
 ukz47R2GSmCAYWoFZDxDjBPoiskEeDNd2ZHFHViUXUM7KkIifw/p1Mi
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=68807dfe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=zAb8Bd7FbwY5RvWIoh4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eQYtpGGk5R-7V113rRgmn2d48J8vHPl2
X-Proofpoint-ORIG-GUID: eQYtpGGk5R-7V113rRgmn2d48J8vHPl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA1MCBTYWx0ZWRfX6/DCITRFyYn+
 fVqoMtEh0ogxQWj4+pivW1zlXLGo2e4R4xjVb4rXtrz2uF6fG5vAbrNiYUap1+mQdFSYu2kBdk8
 wXiL5hceBoepFxJOswMUe4d1jxXHar9RkvU6g6U60xP4I2K1WiqYWQjtX5bW1RxdapyYtl3HReV
 bbLME2MLlAoIpMkLM0NbL8L3UVKkUODTWgE+SIqH3/GoBgA1kPPuX/wsbiiVvYap0EdhCf3SE4q
 ghn0Xt2kcpxzlaS+rJX3oopaXjEW+SIISVFC0ZR9NRN6LdgfVNG+ddTBCeLVigTwmSPS0Dv0A7z
 o9nYHYHGP4cjdFPiWk6dcfXhZfGh1DoHR+QZsO2qy5PmSP9AN1DIsNMSZ+cLS4bZ1tQwjJXTNrV
 bHEND8T03tB4jkpuXU2FV0X+L8DhOjoSs7hImN3k2bifMC6NSkF7ob6apOPb8/G8zX+IRtf/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230050

Enable DisplayPort support on all three USB-C ports of the
hamoa-iot-evk platform.

Unlike most X1E-based boards, this platform uses FSUSB42 USB
switches for the USB0 Type-C port, while USB1 and USB2 rely on
Parade PS8830 retimers for Alt Mode switching.

Support for the PS8830 retimers was already included in the
initial DTS, so this change adds support for the FSUSB42 switches.

Due to limitations in the USB/DP combo PHY driver, DisplayPort
functionality is limited to 2 lanes instead of the maximum 4,
consistent with other X1E-based platforms.

The platform also supports embedded DisplayPort (eDP) by default.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This change made top of initial DTS:
https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 156 +++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 843f39c9d59286a9303a545411b2518d7649a059..f32e03f15ae702ba457cf3de35b779c9c267d3b6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -48,6 +48,22 @@ pmic_glink_ss0_hs_in: endpoint {
 						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
 					};
 				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					};
+				};
 			};
 		};
 
@@ -135,6 +151,23 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -353,6 +386,25 @@ vreg_wwan: regulator-wwan {
 		regulator-boot-on;
 	};
 
+	usb-1-ss0-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss0_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss0_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss0_sbu>;
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -572,6 +624,76 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <1620000000 2700000000
+							      5400000000 8100000000>;
+
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
 &pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 };
@@ -646,6 +768,13 @@ &smb2360_2_eusb2_repeater {
 };
 
 &tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";
@@ -733,6 +862,29 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
+	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+		mode-pins {
+			pins = "gpio166";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio168";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio167";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
 
 	wcn_bt_en: wcn-bt-en-state {
 		pins = "gpio116";
@@ -795,6 +947,10 @@ &usb_1_ss0_hsphy {
 	phys = <&smb2360_0_eusb2_repeater>;
 };
 
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
+
 &usb_1_ss1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
 };

---
base-commit: 0be23810e32e6d0a17df7c0ebad895ba2c210fc4
change-id: 20250721-x1e-evk-dp-141e0df5593d
prerequisite-message-id: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
prerequisite-patch-id: 3c553b55d143eafc1036ce2e88df558ec61c4e83
prerequisite-patch-id: a4b2dabd376d32ecb159141c17113a8f3fc4ddfa
prerequisite-patch-id: 24bf2ada12dc10f9980ed2c56347e5b6f7964ebd
prerequisite-patch-id: c764e86c94055e56aaf9e701341bba52a54a998b

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


