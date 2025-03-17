Return-Path: <linux-arm-msm+bounces-51571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0AA63FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDEA03A9DE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 05:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBAA219A9D;
	Mon, 17 Mar 2025 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X97AkVhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77074207E0A;
	Mon, 17 Mar 2025 05:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742190143; cv=none; b=hDPPGz+GMx9jLcE3nOvOH4t9KEcNe+OUbRXHxwnLlYYNVseNQIaWSwxi/P6KfzYzEOnob52JyrO6EfZj4hWCxaLH/usHUend8bKTshFrfmx5T9M1tMRYwRVsQmg0En7nu/0VRcdCpK1XdJr9aKU/nV61N0TFbBVud5NwI5bNEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742190143; c=relaxed/simple;
	bh=jVFFbOfIB+oi0FPXorWRgVDpL4TELW+MF7IJUgfIHrM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jnCMJMGcyAWpPIFBBd6BqTKmFBiI0uC2gWjafuPk5NjQaAbFOVdKTU8ScnpzV6rkt3SfYoCAldyFCT/J3jgAb1eZYdeiCetcXIWNCxyDYT+5Q8ju5hYfDjPKQC3rAFT2Zf5K2rlLmd95ThRFedjnBOmJqn+c1V58Yw+XfelwYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X97AkVhU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H0Rk36021042;
	Mon, 17 Mar 2025 05:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=uUtItdlTVhtW2ASGaqBRSDdTrBgQLBuhoa4E6HKkctQ=; b=X9
	7AkVhUvZK8jpTrwSHSm6XbBfDumyDcZu4zldSEvt0wIw3asaoPB5FVc1YpunUgaP
	7+hZ+PTV0IRtkPP6PDY179nA4bXTx7mi01A4aC2/APTNJ+07C1HgEpE821NWrgO7
	98W2WsN1IRJDwo8T3eZl70mnD/8U7JUyevVrULEjb/Q0CtcOEQpq8AMt/D0pGXSm
	WB0XMXBToo43NniAT8QjJR8/vg3KY8x88EqTG6nAvR442w4emsI5yTITX/zGjukx
	bAE0HH6O+B8h8Up1+LHpspGwJiw15kbLEZfW/cA3dlzJuulz082xIkZa+xeTXnrj
	5S7XxY1RqeD3KbkP9ueQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utugad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 05:42:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H5gEeB015812;
	Mon, 17 Mar 2025 05:42:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgm3ppr-1;
	Mon, 17 Mar 2025 05:42:14 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52H5gEaE015776;
	Mon, 17 Mar 2025 05:42:14 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52H5gDZG015772;
	Mon, 17 Mar 2025 05:42:14 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 555FD571AC5; Mon, 17 Mar 2025 11:12:13 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Date: Mon, 17 Mar 2025 11:11:48 +0530
Message-Id: <20250317054151.6095-6-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d7b639 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=4YI6pxLmpSJBQWGuOywA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 08_H9yafTnsISqQPWdPL2nzxjzRz3uyp
X-Proofpoint-ORIG-GUID: 08_H9yafTnsISqQPWdPL2nzxjzRz3uyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170039
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers
and msm mics.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a1a3df77ad57..5d4d3df6eff9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -219,6 +219,56 @@ vph_pwr: vph-pwr-regulator {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
+
+	sound: sound {
+		compatible = "qcom,qcs6490-rb3gen2-sndcard";
+		model = "qcs6490-rb3gen2-snd-card";
+
+		audio-routing =
+			"SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb";
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
 };
 
 &apps_rsc {
@@ -697,6 +747,36 @@ &lpass_wsa_macro {
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


