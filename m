Return-Path: <linux-arm-msm+bounces-58602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE75ABCF3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299AC1B6749D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB32D25D208;
	Tue, 20 May 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IQEQZYlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854925D1E2;
	Tue, 20 May 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722429; cv=none; b=KZbF00pNJ7BQpkWM4PJvaBrX4pDtU5dAYSNGUFoxxk/gZNNnWA5toxjeaYWmwjWhtGIJIZOcIGHnHGvaFmIR/W4oVS2Vso5Vymk5OXVHLg8tpcGZ8Wjf8ROT6o7/Bu9PCVdRYNlfT8WoAXHPCtcOm1BLzDU6DW3f9dY1KvK8Ubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722429; c=relaxed/simple;
	bh=V4MLPqxDqf/YT2Pn1rqoogcn6roLFOh0B8Y521mEqmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r5c1DCfBJgtkqKoV3fpsFzevfq2K5J7R3kzFFCv/nq4ueNJDBR5Z+oBxv4SlFSG6cjR5oSfnMUOWaWY4oSocb5G1OOrJCOspmBs+XQScK8Pbkn9ZP829h79GMiV4c/dTLtI4HviXV0TNDqxo84JrC0SUgAKpapRbpx+AVvLBg4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IQEQZYlr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4tuiG023299;
	Tue, 20 May 2025 06:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NtaXzNAO2RW
	yWYZqTslz5e8er9NplXMmEQws7jv5ky0=; b=IQEQZYlrlFtWDuHECuzDETbvM0f
	wDxqIf2mac3p9ET7BdNAVxPUQj8yE1GyVtnFlRnsdSG1M6AfE9P6bc6WSaOcvUZP
	zLkzE2ZiMJ5Wy7QjRS8P3cxCKQRUpvFjyaqo/EEcezE4ionXiyaHWlgLhgjIKji6
	m2BFhD0B4sMlCUf5+N7sAVeVOJYDGHlWZyiZOdzIh7IryJogQw8d3B8ntT+zwEQO
	sx0Yg98SITLgwzA7yAgMuP3X0IK+0ad/GIX0PvKu51I4j1G4lFtzWCRQaUhFWj/z
	mHhlk4KaA1i/+VfkDpbMrXRONz8I3HtKAFlkwRcO/ZIVn4f/HROPKrgn3Ow==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041ub25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6R0us011137;
	Tue, 20 May 2025 06:27:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhm5t4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:00 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54K6R02P011103;
	Tue, 20 May 2025 06:27:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54K6Qx61011097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 01BCA5CA; Tue, 20 May 2025 11:56:58 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Date: Tue, 20 May 2025 11:56:16 +0530
Message-Id: <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MCBTYWx0ZWRfXzHpM2R9joZiF
 I+xtXGno3fuWTi1fNmk4HV4iy6ygTrL2O1+cT2o9ay/XKm20E0lT0pX75FXFfnpxGdOOHLa1hsX
 nxm72mOzWrdOoSTznMKERUApN9EunKL23xxcUu3ctUTPMAnLCiMGobTJIVH0DLp6LalVqj4CvyQ
 kaiTPUQzOEBcJZph+Vu+vSdefKaXdEwDUDIyFcwxMAUE+UTtlU1dNopUce01qegoL7nHx63h7Jw
 mfVq8tcHUPXw3lab96+zhZBFLujIUjUYh45vBBliA9mYs0r+YU0FjEtP7nczQ8XHDunYWFNwGid
 9RsfEixZvqxiTwGG9O1KzKB1ImgLN3N/bjjZe6Br+7jVL4joJJXyg/Kfow2medvnN4Idem94ZJ0
 jg5TksebDTFD+kpj5svGwMonozd4rU0njjg7uH6ijPcsa148ZtyB9noMdUAg8YTEXSSd9jJu
X-Proofpoint-ORIG-GUID: Sjda9awE_zOw9VfjToYZ7u9rtAt7pH_z
X-Proofpoint-GUID: Sjda9awE_zOw9VfjToYZ7u9rtAt7pH_z
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c20b7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=kdNIUUk3XZBdUdgeTlAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=895 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200050

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers
and digital on-board mics.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 21cb392c36fa..c9beeccaa019 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1048,6 +1048,51 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcs6490-rb3gen2-sndcard";
+	model = "qcs6490-rb3gen2-snd-card";
+
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb";
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>,
+				    <&swr2 0>, <&lpass_wsa_macro 0>;
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
 
-- 
2.34.1


