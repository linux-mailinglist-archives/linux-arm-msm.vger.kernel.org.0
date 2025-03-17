Return-Path: <linux-arm-msm+bounces-51573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2022A63FFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E56B516E9F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 05:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACA421ABA4;
	Mon, 17 Mar 2025 05:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pZ5go8sj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD721A42C;
	Mon, 17 Mar 2025 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742190145; cv=none; b=d7/RcX68wiUFTOsPbcSevFyvVpb3cwVAQdLZKUm/uMFaW2bsQYu/UKqU7kH5+q1qqOAtfd4/RNgM020DG0wfBvKpi/Ix/D8WO5+3a+RZTsgUSM8X61GXrw+k92yZlJkJaurQZWWt6++mZ66TtdEUEyE9HJH+qFbJZFFr2hW57Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742190145; c=relaxed/simple;
	bh=gC/jdjytpMOrMOqQPj+3eH5q7hgzShiE4rufIT9xZ5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=OH+o3NX9YmU8dAdLFp8m1s3A08NUBfg3dBoYB+ZFSAFneSCx60fcG6ImySeN1gVqQdKB9oQ46rDqScy88EQ4Z1CddUKavlyw41fWtd3DyHn9WWxm1Rc0RypClbaGPp/ZgMqoFriAacneNoTsEAlJffXJXl64C+o0uZ0FHw2rw5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pZ5go8sj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GNuV86004602;
	Mon, 17 Mar 2025 05:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=Vku9mpgGHtmGx9nj8sSHQiz43kDbWdnsVCHcqVZp0Ks=; b=pZ
	5go8sj33MSbWfPEJT5kdLRqYw12dypZiLMdr/q1l0Urn4NMKBU/6vMTZ8aGXt43B
	D7+ah5/rVd6qA85N8uySKFqlv5eO6dRQFdu7OMSsftTP4SidcbmqgNxbAZkqSMW7
	dB6CUENTjOVZb2vQxPU1NdLrUlBp5pJ6j5abAlYDyGgUAMjRE+B/e6Jvubs0h6YB
	ScShDe/YUg8lXtLxm9tcyU+ZDIteO2zo5YaffsQ+1ZwEV9t6WJo1OizvfoTPvFEN
	fGxRVFaMDZQjhVNwriIrLAFkpXFutQJE1IX/7+bN2mHtbmRuteElTVcFWBENavlH
	Md40VQuIB3kWN1j8a8Ww==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1u8bhb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 05:42:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H5fFa8014943;
	Mon, 17 Mar 2025 05:42:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgm3pqh-1;
	Mon, 17 Mar 2025 05:42:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52H5gFlM015874;
	Mon, 17 Mar 2025 05:42:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52H5gFCf015860;
	Mon, 17 Mar 2025 05:42:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 5DC8D571AC9; Mon, 17 Mar 2025 11:12:13 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 8/8] arm64: dts: qcom: qcm6490-idp: Add sound card
Date: Mon, 17 Mar 2025 11:11:51 +0530
Message-Id: <20250317054151.6095-9-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hJ8lJEW_UqXxPbZO4iCiF108eg8en4nG
X-Authority-Analysis: v=2.4 cv=c42rQQ9l c=1 sm=1 tr=0 ts=67d7b63b cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=bhuhincv1Fux4aa-ECcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hJ8lJEW_UqXxPbZO4iCiF108eg8en4nG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170039
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers,
msm mic along with wcd9370 headset playabck and record.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 142 +++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index cbe11c6b6672..1c8b82bf6c1a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -164,6 +164,94 @@ debug_vm_mem: debug-vm@d0600000 {
 		};
 	};
 
+	sound: sound {
+		compatible = "qcom,qcm6490-idp-sndcard";
+		model = "qcm6490-idp-snd-card";
+
+		audio-routing =
+			"SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC2", "MIC BIAS2",
+			"TX DMIC0", "MIC BIAS1",
+			"TX DMIC1", "MIC BIAS2",
+			"TX DMIC2", "MIC BIAS3",
+			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"VA DMIC0", "VA MIC BIAS3",
+			"VA DMIC1", "VA MIC BIAS3",
+			"VA DMIC2", "VA MIC BIAS1",
+			"VA DMIC3", "VA MIC BIAS1";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+		wsa-dai-link {
+			link-name = "CODEC_DMA-LPAIF_WSA-RX-0";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
+					    <&lpass_wsa_macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-playback-dai-link {
+			link-name = "CODEC_DMA-LPAIF_RXTX-RX-0";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9370 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "CODEC_DMA-LPAIF_RXTX-TX-3";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9370 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "CODEC_DMA-LPAIF_VA-TX-0";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_va_macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -596,6 +684,60 @@ &lpass_wsa_macro {
 	status = "okay";
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
+&lpass_rx_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_rx_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
+};
+
+&lpass_tx_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_tx_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
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
-- 
2.34.1


