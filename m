Return-Path: <linux-arm-msm+bounces-71903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E64DB424D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E65161E83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E343376B2;
	Wed,  3 Sep 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjA8V13Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E83733CEB9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912474; cv=none; b=hT+ASkNA4HPXOLdGQzjBycfCNttZcQ6sJzvQgHEVGRq2W/m76LN2nO9NP19St2RnHthB6SocKj0qP1MB0fCQ7BpqKhKXOeJSrxpwcYALy9B9v3bzFMqVP62xcp+y1vIsHelYkJ714vl5B6L63c65ZXkY+Hyva3aRW4teRpxVDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912474; c=relaxed/simple;
	bh=iX/8nH2+phql33OmK8rxQAwyd1PZKL40bJzOK2j7R8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o2/VydaCa6Nz8+lvUsW0HcVzDXmGGLEeF6b3FtYRqhqNJetdHwH13I/kpcuqJ+xVM7HnZk7vFLwIt4qLpEK6FKfftT6IZZC3NNgZhH65HRL4Hqw5qtLsnY7+gAK343ImdqJFu9qewXBuefLIANXZD8T+CTkL38dbzVAMFg0Dq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjA8V13Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxA7u005586
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YA0iWazYOEd
	Fsu+gH/YyEO2WmFSs2I4hQo9Rzdo3sIk=; b=IjA8V13QKtWQDf5GI0VrLQxGNqa
	bKV40VNP2uhi8vRC3/PyoBcqY87SCrReBJcdKKX0CioB7DvMt0FKpPyXglgars6A
	Vf787uo/hYlJcid3tN11IZq/QdOcXfWIQv4kqKP51+CK12zlqsDeknfOZAIMET40
	0sXrruYu2fb7P9PxXg2gHKwxZcbtU/TNVqvgrgtiRMe9QBvHN7Nr++M2tJDEXsZU
	HC+MV7oRxyphLniotxmU/jcaduZyPL7bH6lDBfn2H+bpXPSFwbxtMQD+yjUNdaKb
	vKk8G4Ef7xF/mDZCyXzQRWTAKv9JuQHO0GHGENKQIfMF7NeVwTRJrnKs0AA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjm3b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:14:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so319645ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912470; x=1757517270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YA0iWazYOEdFsu+gH/YyEO2WmFSs2I4hQo9Rzdo3sIk=;
        b=o5hhA9kEDI956V0DSBaDAM1uhLOhpO8gjJbl5N4DMOHh0R1WMCzJ4fMXwBEFJDTpSS
         Zg66OjHG5tqTGOeXDnpu3+1gAzcVSD7LCHIIH69ZjvwZOqD9SVirWORN6+qFQ05dmXIa
         kUlTVeAvyXYz8bgB/qG74Rs5tL00rBm4RF5kBQXyyVrLiyAN/5YlC0oZqQF2lVeM0lWe
         AmX/fPhc/92k8qiQuxWUyAkmJo0pLhlFhfUTL9GDs2khNMwm39XBiJgEBKF/W94Gi2qB
         foPhGxue9pWkXpTWpZtIpqeuJXpxmfkxLUinUIHb3b1Wa42l88vsuWIXiQevYfnW3iwf
         xzBw==
X-Forwarded-Encrypted: i=1; AJvYcCXigSBFEnMsWWTwLN0tyi+12NF+7xlp0a/OvVlaJlteJZOCHDHDDuBB2ssqbjK2S/RZnkWwnzxjxUdeXaAr@vger.kernel.org
X-Gm-Message-State: AOJu0YyhuwqJCMf1DkHvyM/oJi+TK6CxNTRAsSRjGRpuTbAE7kTTwiGC
	YAHLgGROaAWgCzDUYa7+XQI4/T+hL7P+SXBz0WhqoJPUA783fKsc2WdlOkIGOCvac1GbnCiPolA
	VqqTS1mmKCKphfeeX5P/pCl+89DStdQB2f9yllmEyRjvvcPGCZcK19hdo5n45P47BtVDP
X-Gm-Gg: ASbGncs6xVj46U2TUayAQBYdWklpBfiL1Irxr16lqOgFwzvawKUo31dga5ZIhLK3gC6
	Ih0NG8tmwK4jxvITTPOiemZFw1O0/fnisTk5h4xDFqXzzigcXh1qmK28xnCfc2RuiwySVklk0Wf
	JLBbOlC7m0wAnLszRRn1j6+vv+UcLZF1GgDRinje5uApH1Vlo3pp7i1jJ4UA16ieDimSqnXJ7z1
	2RxSBFQP0DMSZdrqA69GTmA7R5lUYzlCRFXhpTN9IdR3hO4xAYmSWFKJkJyf2GBdUbzHHNzh8jP
	zdj36ocQK1m1faf96b7jb1ruOwY/UUqpfoasugz5yFbGcF/wr2c2tkOnWac8qdIjvXtCGVn7tiA
	4
X-Received: by 2002:a17:903:4b46:b0:240:48f4:40f7 with SMTP id d9443c01a7336-24944b29c03mr224481145ad.39.1756912470206;
        Wed, 03 Sep 2025 08:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgae0ZL8A9n72ma4VtWgGtsaJLgxhws/tThvtuBdoJhXaqJXZb3luw+0f7PjFMgQeOhhQvHg==
X-Received: by 2002:a17:903:4b46:b0:240:48f4:40f7 with SMTP id d9443c01a7336-24944b29c03mr224480785ad.39.1756912469761;
        Wed, 03 Sep 2025 08:14:29 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 8/8] arm64: dts: qcom: qcm6490-idp: Add sound card
Date: Wed,  3 Sep 2025 20:43:37 +0530
Message-Id: <20250903151337.1037246-9-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b85b57 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=h_l79siUWkRGThfnGhIA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3Zt7TWkT3rud2Fktrm7e3fniCEgcivCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX/v/Od3avQyaw
 GhErm8vdHQlG/pE20qyKrlmT/9Bt11MduGuD6KXKPVftnZJzXyRJ3Wt1H6mzaCydsFHvt+iwZd9
 HBdEwvfGocZdURCbQXjrW66bzuTywZI6jEpsNHcQjz2e070kGoNLMBmtrwl4tH4hFH6uNSx8PPC
 GjG1guoHTVUs2N+qWk3E+SUfPuiJHGEe7Xl0w5mi9Pj7DaKKA7skSijOe3whGmGv8dRG9/HWSbU
 sMzd6L8d/OI3pExmo1WK2xkG0SalIUN4oS56lSdAKGT2BWEbmCTfrAPWG3TQNEPmZg4C9gmoiBq
 Vm84iB3jJ5vl2gKcHzuPYpMk6f1DBLl6o399lUIfHbeu44bImJB9cOy8eH00PR8uTAwkNh0ZBw4
 PthirrAg
X-Proofpoint-ORIG-GUID: 3Zt7TWkT3rud2Fktrm7e3fniCEgcivCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Add the sound card node with tested playback over WSA8835 speakers,
digital on-board mics along with wcd9370 headset playabck and record.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 379ee346a33a..73fce639370c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -757,6 +757,90 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&sound {
+	compatible = "qcom,qcm6490-idp-sndcard";
+	model = "QCM6490-IDP";
+
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
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
2.34.1


