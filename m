Return-Path: <linux-arm-msm+bounces-78660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B700EC0424A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88FC41A682B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 02:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA682690D5;
	Fri, 24 Oct 2025 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGJwV7YN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F025D1E9;
	Fri, 24 Oct 2025 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273456; cv=none; b=sXHsCIC+lbzXVXpEq67OrHLz4c7t0xvI89/NQpiOM8DCOUDE2ShtY3KiyXRUXP9KjZ1H38zUy04HuflPz92G6zgm5xgMADm/G46ASs8jChhiiqtKQgWhstAXEn8TmkIP6lmcRbBo4IsiNksnK4s5r/lUqqy76XjGu2x9d5H6YTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273456; c=relaxed/simple;
	bh=LFZCU9BkLHOJ+BCkxuVftDpWPoswa9LyQWUeASsaGKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fEo8J9xsYondeHyAXK6Kum0a/PSpHRInL8GufB2ikdKhz6H2Xf3/+2b9mwxrtzLm6rAUY59r5xT13J77GtCAMRzybbcRUYz3dxAbAk6Y8iRuQQGwQqTnjdfvHV9zPkHHXubOJf5lZl684fesZWmba/2ruXeo7aTz5mSNMxD1SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGJwV7YN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O27w60014643;
	Fri, 24 Oct 2025 02:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fD9Ud4d6qiw
	5aZO9C/Qclb4eqCDZfdIJOD2gNbCWx00=; b=UGJwV7YN2ArmVcTiYSBI52NhY9J
	9pHx/r1NqtRuQPVaY1chE1no1kqsvjy7/syZaCY3aj6AMjqGn/sNx2L7idenibYC
	Ta7H9VhvxgbgvhbyGuG8SPXD+zth8v07mSC09YrgKhHhvWt1e5PKHcq8b0pPyvM8
	fLoMBN8L3B26bMT8U+YZKIaAATsocAGEkQ75rS4akBtwXOHdRtD9D/7ojFpApR8T
	eJ9I978lf/RHgg918vPiKp9UzvcTkD6kOZsr+YebnhN5r5zE72bPsy4dtKl0K3fk
	GWW2A4VeQ3uCaRxghjQvzp1GMx6mr0fl7LF6SnAjeMy2NUkpHYXRq83fgww==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0rgsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59O2bSNU000700;
	Fri, 24 Oct 2025 02:37:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49v3ymvqq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:28 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59O2bS8W000693;
	Fri, 24 Oct 2025 02:37:28 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 59O2bRTT000691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:28 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id CE9602222C; Fri, 24 Oct 2025 10:37:26 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
Date: Fri, 24 Oct 2025 10:37:20 +0800
Message-Id: <20251024023720.3928547-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
References: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX47PcIlEXfbM7
 LR8MP6u3r/fL6+FwcG4DTo/bEyVNrz1Ne8jBbhTsoB3V17AjzFkybHcQoJrbROmfjSgBWRPmkqR
 TSU3eAVj8hlffccHxe3Jt5UT9AoXOsWOUoCv9YUPpXEpmqLxEyvTfRzgwa49MRtmRzs8oHT4Hs1
 Tld4ud9ddkHH/TRP5lfdWTjDW2zTMWzibfKBgUJEV9oTlN44ZRV8AApWBvtKNpj2Qhq536KSyea
 yOH12jUPlRmuHxqfDoftsp0gdst6ZCzR9z/6Rud+G/Zkc0T5nirXjwT77A2bEjvLobVUHDVCH/y
 BlO7+RH/TEgOnF9AazMqjINpvqDEOzriGjigHlN8nfjXOX5rSKWfF4l8ay80FDZNFZuda8LEWWb
 oLhGjDUj51JiIdXvH17mqYkmNP+8qg==
X-Proofpoint-ORIG-GUID: A-gbdglKr6dreIrdUjKnjAsiYh0xJ_tA
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fae66b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=c-OUY-gO7Egmvcr4Y_wA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: A-gbdglKr6dreIrdUjKnjAsiYh0xJ_tA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Add the sound card node for QCS615 Talos EVK with DA7212 codec
connected over the Primary MI2S interface. The configuration enables
headphone playback and headset microphone capture, both of which have
been tested to work.

The sound card integrates:
 - DA7212 codec on I2C5
 - Primary MI2S playback and capture DAI links
 - Pin control for MI2S1 signals

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 78 +++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index b58cae02c9cb..523a61b5e0c8 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include "sm6150.dtsi"
 #include "pm8150.dtsi"
 / {
@@ -50,6 +51,46 @@ regulator-usb2-vbus {
 		regulator-always-on;
 	};
 
+	sound {
+		compatible = "qcom,qcs615-sndcard";
+		model = "qcs615-snd-card";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mi2s1_data0>, <&mi2s1_data1>, <&mi2s1_sck>, <&mi2s1_ws>;
+
+		pri-mi2s-playback-dai-link {
+			link-name = "Primary MI2S Playback";
+
+			codec {
+				sound-dai = <&codec_da7212>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-mi2s-capture-dai-link {
+			link-name = "Primary MI2S Capture";
+
+			codec {
+				sound-dai = <&codec_da7212>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_v3p3_can: regulator-v3p3-can {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg-v3p3-can";
@@ -231,6 +272,15 @@ vreg_l17a: ldo17 {
 &i2c5 {
 	status = "okay";
 
+	codec_da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		VDDA-supply = <&vreg_v1p8_out>;
+		VDDIO-supply = <&vreg_v1p8_out>;
+		VDDMIC-supply = <&vreg_v3p3_out>;
+	};
+
 	eeprom@57 {
 		compatible = "atmel,24c02";
 		reg = <0x57>;
@@ -360,6 +410,34 @@ mcp2515@0 {
 };
 
 &tlmm {
+	mi2s1_data0: mi2s1-data0-state {
+		pins = "gpio110";
+		function = "mi2s_1";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mi2s1_data1: mi2s1-data1-state {
+		pins = "gpio111";
+		function = "mi2s_1";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mi2s1_sck: mi2s1-sck-state {
+		pins = "gpio108";
+		function = "mi2s_1";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mi2s1_ws: mi2s1-ws-state {
+		pins = "gpio109";
+		function = "mi2s_1";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";
-- 
2.34.1


