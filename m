Return-Path: <linux-arm-msm+bounces-58601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D1ABCF38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74648A2E57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2411625D1F5;
	Tue, 20 May 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ThqhZQRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22425CC70;
	Tue, 20 May 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722428; cv=none; b=spWYZWs+yFG6oNCBSTcKeYJzc2cmuzHaEbwr8FpTSdNLqkZ3JY0U2HeCm4WagTUHAgOClJHaj3ZRAMsr3yVWi/CVv93ItGgDltD3hcx0XgrSF8ngCte8L1d9HBqZ1ZZKT8um2Fo2czNvjKN9Qej8evCPAIgs7k1gBSmHbQadJ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722428; c=relaxed/simple;
	bh=u5PtJ2j08bhHpToksBkcRqjVcwYYLM2L6z1QuUF4xJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tuSTS3uL0hUROl7IfB8XvMpybJgTTPM/yjO0AKgir3JD/AlPlXKt0WvXEkDCVSzx38ECh2ze1c8ziXtawQNcNi5U6rErkFcA2r0XnCc1rSZYL7tooBwQnGT/GQYj2H7CBK5AQ5QiGzGUXJFbGbvD6cYFHTpGoM+JVJ1SyuwniE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ThqhZQRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JImVTs021887;
	Tue, 20 May 2025 06:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r1Qgkte7jpT
	KyeslESvZmQwxfDZgRLGvMac5jXyD1QA=; b=ThqhZQRddWcn6z6dIuPnfr3gecl
	Jzvp2iozec+A8szrbx3SKbLllUE14HVvzx2t4Uu+Lv851PD1A+rPy1ahoQKPSoVc
	c7xPXj/QeNsZ+VRr17oxXpgsEcUjkE9jPck7feppzkgxszuWxoJCuGkWZqXtxNZ1
	BidtBuqX4RtGhtP4ypArfcStaBk9lbCBqfjBLF1nPqXPi0wic/R7gJzWUIXN13v9
	dqsiGwS7y9ggRfHEs/Hk12ZhIVsA3PtUH8F+Ns/W5BpFzrF5+wfK6XRN2dCWBYG7
	BonPoqBkTRl22gzazrXS5Tjv2J1SocychAYZCONg0xq0dOb7RqCj16PZVaA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkypu8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6R0LX011142;
	Tue, 20 May 2025 06:27:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhm5t4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:00 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54K6R0kC011105;
	Tue, 20 May 2025 06:27:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54K6Qxkx011094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id F1EB35C9; Tue, 20 May 2025 11:56:58 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 4/7] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
Date: Tue, 20 May 2025 11:56:15 +0530
Message-Id: <20250520062618.2765109-5-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: JaGekLKTCC3CrxFUEr4p8TkOLWZovYsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MSBTYWx0ZWRfXwL6/LSCDrFEH
 NIWn4cshuLLM51XFqUD+OiVC4KcaZlvc5yx3Gix/uzvAXRbE5Uh2DyMLoLJgOV7L4IgzECquEJW
 ZNO5I9DPpkINNSiFqpRXkhtvdiHUUdn1rYkXSn5qqpOXuKlEy6HXrPXnnlpmmNvj1OG1fgNduny
 ClNUb6RketcR67UXGtoRSymFoL/qHSME/trnIkDGGpm07HC9QuZIJ9JoLPU100GlrMcMxh52Tiv
 UIfZ0SKSILfm66telqdq5TemASjkuPda6nE6396cluBpNHqc5ws4VpiFdXbtPXhLIAr7K6wBni3
 ZlrNYjuvHVN0xdXafylXEmIJtkezjEHws7TZ6DcvEePa+a3AhTcqCpw1WxmLp7+j4fxmB6l8wpa
 8L+X0TJ+1F4qMiLSBAfDspuGGLGTbt7UkVAR/sVvdJ0Y6x4JZmQB2vqmcFrEi5lnpNRQBGb9
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682c20b8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=WEsQsnLxaZX5bEI0yokA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JaGekLKTCC3CrxFUEr4p8TkOLWZovYsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=964 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200051

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.

Enable lpass_wsa and lpass_va macros along with pinctrl settings
for audio.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 18 ++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index 4111091f77b2..542a39ca72bb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -11,6 +11,24 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
+&lpass_dmic01_clk {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&lpass_dmic01_data {
+	bias-pull-down;
+};
+
+&lpass_dmic23_clk {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&lpass_dmic23_data {
+	bias-pull-down;
+};
+
 &lpass_rx_macro {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d..21cb392c36fa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -19,6 +19,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -765,6 +766,14 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&lpass_va_macro {
+	status = "okay";
+};
+
+&lpass_wsa_macro {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -1039,6 +1048,32 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr2 {
+	status = "okay";
+
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <1 2 3 7>;
+	};
+
+	right_spkr: speaker@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <4 5 6 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
-- 
2.34.1


