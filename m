Return-Path: <linux-arm-msm+bounces-56068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2330AA070B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AEA3189947B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6E62BE105;
	Tue, 29 Apr 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+dVV2iW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E92BCF47;
	Tue, 29 Apr 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918698; cv=none; b=dNSvt9hdiFBe4QWsSt/ioKjHt33uAIfl3zCwMfpfIaHlvfNAi0waVHat+XnfeM7i+i6bsnc5ktKVmwpBaZDTiV0ylCv5Sy/jHFZxFABTKJ4w1YGjNPErhC78DpqrVQjShZaGOOgbQURCBkCZXjeYEDdijc0YphKbsa+X/UbidEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918698; c=relaxed/simple;
	bh=q6Pjq/Ybh6Wqd6JtevO0ByH/ewdEIb7koaePTcQn3oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qd6OZTxTpDYJXSi7P9UypJUNtoRosSPoQGLg0xuq4Pr/k+O1hKLKdy/pG63r8XUEBIhJtRBV7nh5Zwtg2UPqmtlF6e+LScMdPMT9/Dwl5PNn74oIG1d39bl3MSYq+5Ae8LN9YaH2mgGF/ToXhkPMafROC3y/kXGVOu1DWsYQrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+dVV2iW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqDuK004051;
	Tue, 29 Apr 2025 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=Y5mHMTQ3vZAEVXAoMqDSAShE3ZG6B10VfCfdQFYocKY=; b=Q+
	dVV2iW39GTXkoA0qxMlRMb5qThZbJKlHjLZJN162aTDex5YUPeyX30MwAPOk/Ys6
	7rEsPo0dfF37rK/Dh1yDYY7xkHJcApIjg9HYtXsHfVL31pNt9RCTjzRc4wpSWMyI
	FBUh/GrbczLAXkIGO2wcYSVUJi3hHdh8fR0TS9lzrNedH83Iqh1RkOJe5imMXILs
	hkqbZVaf1cC1uv2uEiHTnOTNRDLHeYBXQTfC8j2xVoPhZ96YZUMOAY2p3raiLYZd
	X2csxOZTPq4GysEys/Mnp+SJXcq+nTDSOF5wvzt6xXPNq9T6OSEDsNxCVH0L/+il
	7fK0EVpsSqOYGaTVGlwg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbaykr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9OmaV031631;
	Tue, 29 Apr 2025 09:24:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb3x-1;
	Tue, 29 Apr 2025 09:24:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9OlML031587;
	Tue, 29 Apr 2025 09:24:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9OmDu031660;
	Tue, 29 Apr 2025 09:24:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 9D23F604546; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Date: Tue, 29 Apr 2025 14:54:28 +0530
Message-Id: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfX6r4ajk3VF5F3 yWopUaYLdnMCDjr4W7SisO3LvJd5gzaSxBCqS3jhKHFp97DPs39sDcTHrzTfX4kHOW2+9Rn/RWu zHVXkpkCZ73Tr0AH9eZ/NMJgwJx3552F2uexuc5NRm5dPuWCCeQXwJREz5WbmtmFO03fy+snpf2
 LpFg3h/iZfjcrZ5ZIFo8HI5uZhE4VCsqmShBozlqgxBISGj+aQ9WTV1WywaZlbDrGeSDttFirKC ykXggj/FfErbWpMUI1Si7tf7D69iziU2xOpdHaT/ANNM0qiFxK36bve9xrCrxU4acZzlyKCS452 V1IjliN1/FSn8AO+Zq27NzNdZZIHCBcXv4wK42O6CsxUtD9ibTl+7tnXDLtsnBYt4go5pywHQUd
 VQSxALouHYbprG8ufLzGyPE1DPOMK+LOaoVuVsSfHYdsgwMW1+UODaXn68ZegvSTDjLQ6e40
X-Proofpoint-GUID: X7VGzbz4HEg1tbvJC-XM407nZXAMM3JY
X-Proofpoint-ORIG-GUID: X7VGzbz4HEg1tbvJC-XM407nZXAMM3JY
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=kdNIUUk3XZBdUdgeTlAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=922 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers
and digital on-board mics.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 43cbdbe43afd..9cfe648e29bb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1078,6 +1078,55 @@
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcs6490-rb3gen2-sndcard";
+	model = "qcs6490-rb3gen2-snd-card";
+
+	audio-routing =
+		"SpkrLeft IN", "WSA_SPK1 OUT",
+		"SpkrRight IN", "WSA_SPK2 OUT",
+		"VA DMIC0", "vdd-micb",
+		"VA DMIC1", "vdd-micb",
+		"VA DMIC2", "vdd-micb",
+		"VA DMIC3", "vdd-micb";
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
 &swr2 {
 	status = "okay";
 	left_spkr: speaker@0,1 {
-- 
2.17.1


