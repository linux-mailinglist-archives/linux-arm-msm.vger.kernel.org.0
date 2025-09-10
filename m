Return-Path: <linux-arm-msm+bounces-72898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA7B50CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 06:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF4381BC7E91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 04:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E7D2820D6;
	Wed, 10 Sep 2025 04:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7P9mXOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADAD5464E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757479537; cv=none; b=VKEMvfMWdmZyceLs4zwS7w7GFe4Ror0CelNhE2/DXsxa1pPU0NHpRJyGaTls2XvGjEiGeyitk5zliAGRXHPh129HwwsvvDpxH8PU12bS+3yrozDI0b2gs29x7HkhjbD9GgF6jHbx0hrsj83vGN0E9S0WlWCj9S4wE4mK2aCeg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757479537; c=relaxed/simple;
	bh=ZuJD7JdUTwyqcePUK3u6tcyt+3y92CC37Zydf2zrHaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ReUkOl4eE3Vq45JgR36Dj+yoQplLFZRW9MKAbZb/Iol1w8CMphWwe5z6/PW+wh5AEiEB0pSfXIbA4CtB2x2tiEvaVmj98+6HMDdV/j5L3fBVb1NkdsJ6txF7BnXroTEQhGm8pF5gxYUCw2Fn64hlDVSYqQwM3xO1iY8c7ROCukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7P9mXOa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HeRQc020449
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=phs99IEbTxzLUUK84wJmfAYFpG6+OD7+fCp
	Ut6KGbd0=; b=h7P9mXOaj6tCI5bROrO0QSMsrHEUWXTfg8BRs9Lps21vq92tnBu
	gcJC5uW2k18AWQzyP8XHyn9FDzLHvMhP9GQgJJ8hfPo9a4E+UmHoBnE4OPPpYCoN
	PwGiv2hcgKOPOHb+rFXMh+yKhUP54y2RDe2WTO6Ano1eHdKMTFLGQLhnkL4Y4cDc
	O266Z9cqMzs87T04up5xxD/VfQgqtxzwtGvI6t7OiQhGrv0OLS4z6mhmPaznQdJ3
	dnBKUNMMUZ16b1O22wejkLfsmKFNjmBRjD1kXeRS3mVHNVUdjMZROuCfD8rnqVU1
	TJvgI+OeiNYLE7WO2GbOw341wrj1F0O8Bug==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc26ms3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:45:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b52435ee30cso1553795a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 21:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757479533; x=1758084333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phs99IEbTxzLUUK84wJmfAYFpG6+OD7+fCpUt6KGbd0=;
        b=hKhdH9TN4WiHC/6B5ioB7tEqV1IVXaVCAJjB7gSv6bSf777BTv9/rNv61dclUNkjWk
         P+EBoRnHaYW+otMVrlj6QymsHOqG+BccOVV3R2MiHLkhUdBISUoQtF9s4jZ/VUMaGEPd
         /jN+R0MDh1T5SHSykvA3PhdHJ8t0H7H2tCUX2zMUqMeQsJLPyz3dSfBU9yBdQ84uimbc
         CJYbhRKC0jcUZpAIxAJywqoII2iZPT+VUlz2Af7CNw004QtiGsW7OUX7bgmT0sLjxY3a
         Zjz+iXkffx1KpsYMXujLDINE/f+ykiIF6nE1jOInmOfYI4RX2L7LjsSTs6bdsH8RrlBv
         Lojw==
X-Gm-Message-State: AOJu0YwmiUZwdE2/LMcs172bqYuJx4epI7DAizWH/pp81t+aSW5rvI7j
	RLWO92GoBd67xEzvXFmRlhXSjcH7ibJWjIlcHKYA+CISPdM377JofOQer+B5CPmvXZqS7W7/gFk
	jtxk05wfbmJ0QGLMKwUcHfIxclmTaPf6ag9VmkG+SEbW4wXbKASKFrKLo2CWyouK7R80a
X-Gm-Gg: ASbGncvbl6jFMqAvV/aKEF7RFrlPaNifn+tNmJguHJO/1zW04csFcT1hqBNNw5c5jFh
	T1uT7KYvM787cYCHPeZlhHGpA4SbG1NosSo82gaYiv9pZtGkA7TESFJIwx6t8VCShHG2AGsQn8M
	vLI2sNaQXzQr6VGbSdrkKmaRgerimgv1tw6uDRyqj6A0Rv6FWaFnMoDDlcpWsBxb/MGdfPF9PuY
	GfILv/zBwiJbWZweKpHRWY1amQhsal7VdGjz9GsQOP3KMpsk9g/3qfNvgc4ZCrKrjtiab6izQLu
	cKW4nTjTyWSNj8EDDumHex62rfWpReTE2xnkqRtunx0b0SE7/TAbMNeXQBQTodCHcSOjwNb4CrN
	M
X-Received: by 2002:a05:6a21:3282:b0:251:a106:d96c with SMTP id adf61e73a8af0-2533e5725bcmr21049848637.10.1757479533191;
        Tue, 09 Sep 2025 21:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1S+sjKgyN1lKxHVmFMTXNNAC58Alg7A+2ktpMH7cl+9ZuEPxHZYkd5o0sUtN8NWcXLqsGzw==
X-Received: by 2002:a05:6a21:3282:b0:251:a106:d96c with SMTP id adf61e73a8af0-2533e5725bcmr21049815637.10.1757479532703;
        Tue, 09 Sep 2025 21:45:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a3f3facsm1308056a12.7.2025.09.09.21.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 21:45:32 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: monaco-evk: Use correct sound card compatible to match SoC
Date: Wed, 10 Sep 2025 10:15:12 +0530
Message-Id: <20250910044512.1369640-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1026e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yYq7zTALbQGsISW0NoIA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: vYg2FDsRLSk4hwmPt9khCdKJ_MPMTn7k
X-Proofpoint-GUID: vYg2FDsRLSk4hwmPt9khCdKJ_MPMTn7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX6B4P8hZ29O0N
 hGwi/WUaSjIee7mYa7G2bwekzeDdOU0qWud6xM6QhvWTRPk1EOQZcahi3FTMSdCqPDESdB9WgZE
 JYy6vc15A5zdt2oJTbsTYtr+fcII96cKJozgs9TVx1SVOZPYedYDuIqTdedUs7I222kzqhEodmC
 OFRNLO5duKQ8GkA1YoVYBjMydO2pbkQJjot3izRx6p6sYfhA1h/LNy2C7E9xJQ3HW/deoWvcfkS
 Eg1J7lFXbxamQeQtfmxtjLVjESmuYMIvboh7FLvSLyBr9wjHgOkxCeWF7EdEP0gFOTWX4jqJx4A
 rbLBzbnHCx7vUT1u0/MqJfQuVHcCgJp6K0JsxSDpZEzVeMCmzDOr4Cs0rJ6I49+41S0mKMyoeQj
 MNZugZwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

The Monaco-EVK board is based on Qualcomm's QCS8300 SoC. The DTS
previously reused the sound card compatible as "qcom,qcs8275-sndcard",
which is based on existing coverage. To maintain clarity and consistency,
the naming conventions for the compatible should reflect actual SoC
rather than the board. Therefore, update the sound card compatible as
"qcom,qcs8300-sndcard" to avoid potential confusion.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
This patch series depends on patch series:
https://lore.kernel.org/linux-sound/20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index f3c5d363921e..7187c1760ef5 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -38,7 +38,7 @@ max98357a: audio-codec-1 {
 	};
 
 	sound {
-		compatible = "qcom,qcs8275-sndcard";
+		compatible = "qcom,qcs8300-sndcard";
 		model = "MONACO-EVK";
 
 		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
-- 
2.34.1


