Return-Path: <linux-arm-msm+bounces-56072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3ECAA071A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 975D748271E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608D42BEC36;
	Tue, 29 Apr 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jFyddsU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17397279338;
	Tue, 29 Apr 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918700; cv=none; b=D7kAdc/IOc/jrzfc9k/08mhiKP2tYVDX+uvB37hnyMlXKsU9djO6x/djn8Nt8J+xunwrpkSgMh5ezht6Zzq8GyLNVrNOxN7WgNMUuOepKlIxyuReP/gCO1vcSfBKYaRYFzDdFI8cn+5BKYcY4yRlTpzFC906Tm8CcGxoIXU2nRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918700; c=relaxed/simple;
	bh=9q263ivkuqryr1cVq+/JdlL7NEFdiOrXd+wNryP4BAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=L4EyMGLAiZsppRxUlC6/7H6L51SdCr6/10aYPdNy/D9TEsWqZeElV1j9eW6jROlwRywZNT0NQo1Nw3fgbHe+wq+8yyKqCA0rkQjIafkBo8jO9PBwbAhCS3kH2m1Jz9XFFpTN0TCsu7JjXI9l9NiaYfvwF/djtFmKLB1DTUnvL18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jFyddsU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq66p011895;
	Tue, 29 Apr 2025 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=iYnqUGOuE5ecB95qJ22K4FevBfb65lOVWRBY4zUgZIY=; b=jF
	yddsU5Tdjd+RVBV/6fl+StmbAq51PjXj2ian1CUQ7+Gaj84YMq1PG9ZfgymZYKrU
	pp6LeaSWoLDQJM6amPHS122fNBHJGwKgquwZcoKPl1EVvtANT9w9y7IcdS7zFyrH
	QRR596tyQvoMNtvcux//bo1g8yom0tUk5kjpu0il8xQZjjqgtQ1ASS5/yJD6K7iE
	GHf2PnmLbcP0f2GyHqcW9IqXhZkUVCAsGdzwfCRJrwB0ESJ5GSf3MKO2DerMZuLU
	nwdac9D5HUri9HI03uQ6+9xKvodhh6ET/MRsxwjJ5U77x5QaH4+R9mufZzBxH4Lc
	LSCoPxgRINZOehZNR2oQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323x87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9Omrp031632;
	Tue, 29 Apr 2025 09:24:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb3u-1;
	Tue, 29 Apr 2025 09:24:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9Om96031675;
	Tue, 29 Apr 2025 09:24:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9OmwC031658;
	Tue, 29 Apr 2025 09:24:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id A39E2604548; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 7/7] arm64: dts: qcom: qcm6490-idp: Add sound card
Date: Tue, 29 Apr 2025 14:54:30 +0530
Message-Id: <20250429092430.21477-8-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=h_l79siUWkRGThfnGhIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cB6N2JfV9KGpkcIzqmdfI9uXROKW0LbP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfX8MiRNcR3nyOZ DR5zK16XEAq/HXLg0DnadaMWg7sZzZnRQwgMHeOdlLP5Bi+nqNyCKPF6xhtAfeH+LSRTeaTKdks v4v4B043YDAxBcnXN991B1mDCa1sLbSCrT47JvGxvzy6vtsVa2gscacVJCCj4iQ/0WhXhPOP/2I
 756dkvEsqYjN6UmTTLP3ubza7cz9SjAbOCUC1XYvfvzwZ2z2MUOAQ7IiQEzGGYQolGQE4LuX7M2 6K9c7UoaOcat2NyceryLT8q6UE02baYk6NS3MUiMqkAKu/hCtfQytdO0D8sm4FilX01KEtAGlal 9zzy4ZQF3cYiFfJqGvyInBh8hVuosKcEACGXIaLA3N6ecEHDBaERm4vx15u0m7wkSNzeSH2FemJ
 otcxtKOF+50nFGeKJWlGWRgaqUDdvXFue2IHymbY/gaA+RGLV4PhGQCmut4MeREGO/VpRQ9G
X-Proofpoint-ORIG-GUID: cB6N2JfV9KGpkcIzqmdfI9uXROKW0LbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=984 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers,
digital on-board mics along with wcd9370 headset playabck and record.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 1a59080cbfaf..a83044020ead 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -811,6 +811,94 @@
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&sound {
+	compatible = "qcom,qcm6490-idp-sndcard";
+	model = "qcm6490-idp-snd-card";
+
+	audio-routing =
+		"SpkrLeft IN", "WSA_SPK1 OUT",
+		"SpkrRight IN", "WSA_SPK2 OUT",
+		"IN1_HPHL", "HPHL_OUT",
+		"IN2_HPHR", "HPHR_OUT",
+		"AMIC2", "MIC BIAS2",
+		"TX DMIC0", "MIC BIAS1",
+		"TX DMIC1", "MIC BIAS2",
+		"TX DMIC2", "MIC BIAS3",
+		"TX SWR_ADC1", "ADC2_OUTPUT",
+		"VA DMIC0", "VA MIC BIAS3",
+		"VA DMIC1", "VA MIC BIAS3",
+		"VA DMIC2", "VA MIC BIAS1",
+		"VA DMIC3", "VA MIC BIAS1";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
+					<&lpass_wsa_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+
+		codec {
+			sound-dai = <&wcd9370 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-capture-dai-link {
+		link-name = "WCD Capture";
+
+		codec {
+			sound-dai = <&wcd9370 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	va-dai-link {
+		link-name = "VA Capture";
+
+		codec {
+			sound-dai = <&lpass_va_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
 &swr0 {
 	status = "okay";
 
-- 
2.17.1


