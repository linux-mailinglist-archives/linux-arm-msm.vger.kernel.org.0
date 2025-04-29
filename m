Return-Path: <linux-arm-msm+bounces-56070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4FAA0714
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E349D5A6F5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E032BE7AC;
	Tue, 29 Apr 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O3zrX0P4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD71F3B91;
	Tue, 29 Apr 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918698; cv=none; b=LNA8Q2ujyZzdYSqpc6FUIKMuYHSNiLSCkc2cfo9wXJBhjVPQEhMTL/Ki5diyEgYq4yfiEDcICgYVKNArRqd2EKNLLzJO6fRV6zydctNNDnTihBtgXc1b4NWzzf871l3D4PhqqUOagoZZYltn6khIdgaW4CajwGP+LG9Ln2r/Akk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918698; c=relaxed/simple;
	bh=W+HXCbsddWQD6Dew1KUlxrAvFtamXmJR5qf+u6j2oy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nqBmG2J6mHfERPXMPYxAhTvofvb/e3A0FJzwU6umMQFzXbkuTdH1MsyHQHt1MteC5IqCSHj5gPdv8QwYBCa+EwbKiwN8sZoiRWxnW+Jjn6Kn/t4GShlmtVyKTnlE8EmWB7wuhXs0+ANkt7Fd/FTQ7F6nI1WtM6w5PLRB4Lqh8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O3zrX0P4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq11l015281;
	Tue, 29 Apr 2025 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=u1x1ZxRLCQGVLkVAT5O5qmnRfWnUsZumfvgAO4C/jXg=; b=O3
	zrX0P4lqqgL1DqjXgm3YPXpi2GuiDzSd9cF5thBGhwxvdwUebzDFEj75yA5S+il4
	mb9MuWyXvgPlI5lHQkXNJYisOlMS8cLvtVH2XEB5QZfNjj8O8Bk0YeR0+VRmqnXQ
	R4bpf+695mI/uJ0WN2FVaG811J3nXz8rDjEDkggIrwRhyl0Z24SlYXTcZpYhyOBS
	oGORBDK0/+iMC67bmOLL0hAckcafLtqaQBYIi6W3o6PAW+69CjSXCfq6k9dEafcx
	hqTTCUUaVRXfkuwZWFnTUjZ9K+vkg6/z+gXaFJ5/SslalJc7B1gJPWtCJe/mvcHp
	5PmBExl8y6sHxFLRFKEw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwuxve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9OlAf031625;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb30-1;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9OlhS031583;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9OlED031556;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 9A388604545; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
Date: Tue, 29 Apr 2025 14:54:27 +0530
Message-Id: <20250429092430.21477-5-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KvGsoVbPLVwztJaaq9BWhr9F6vFyECRA
X-Proofpoint-GUID: KvGsoVbPLVwztJaaq9BWhr9F6vFyECRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfX3dvEf4+cU5Fa TjW2TAwPIpXHN4k+UXpmcmqf15rogqdE7YdZqP6xMzLJ/Vw4fMCKTyFVcDsyBh112Psr2Umhmv/ ZxcEK6MIshf68+cCHd7hLq6/jt3AJpX3HVjX8FGN1KEGvfXfYz7ZFgqns7rhReD5PNWm14G7erW
 HGpZvlrON+9I1laQXcmjCk+8xgccybxuSIPgQFa6Kb51Zw+/AUX9mCRZB6aaKo16H2DxXF49B/s 3OLDC9dXIHOHIDUEI+X+FEaX1GzgMdzYsdA4kZ1erYAWEXRjFGE0CuDZgNt/16E5C9IwbZrJoLT X2M9z6ESHSKmMb1kTdaS4MKWCjHege6S3ZKm5pafrwmuB19LpzQY0aDwJh1j8/r0VP5LrCi0Ay9
 sM7tT11IuJ/DFfFTSbAoPfi52PmqielC6YwwUEusGT8r2SuSkakic2KrdB3eEAZwDSgj/WZu
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=WEsQsnLxaZX5bEI0yokA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=903
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.

Enable lpass_wsa and lpass_va macros along with pinctrl settings
for audio.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 70 ++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d..43cbdbe43afd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -19,6 +19,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -765,6 +766,44 @@
 	};
 };
 
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
+&lpass_va_macro {
+	status = "okay";
+};
+
+&lpass_wsa_macro {
+	status = "okay";
+};
+
+&lpass_wsa_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_wsa_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
+};
+
 &mdss {
 	status = "okay";
 };
@@ -1039,6 +1078,31 @@
 	status = "okay";
 };
 
+&swr2 {
+	status = "okay";
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
@@ -1095,6 +1159,12 @@
 		 */
 		bias-pull-up;
 	};
+
+	sw_ctrl: sw-ctrl-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart5 {
-- 
2.17.1


