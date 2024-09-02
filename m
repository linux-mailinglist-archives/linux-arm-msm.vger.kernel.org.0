Return-Path: <linux-arm-msm+bounces-30371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70004967EA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 07:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 918381C2164D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 05:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F5C7DA79;
	Mon,  2 Sep 2024 05:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GoMzQ/WL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379B236D;
	Mon,  2 Sep 2024 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725253500; cv=none; b=Ch1hTCxOYbsKL3JKR+8JExLgsLszP7p4j5PkjZEyFwF0Kls+OPa84zYtHqDjiraF3hyTlaHIh0FGlboVaXJO8bOUOClRjmQAgrhOuhcBL/1/dkGHoBr8RM3Sfmko8it7qGZVLJ56GShRIkcsZEx2AMcmhpIxQ2Xj2849cK+sVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725253500; c=relaxed/simple;
	bh=MVqTITvtSIgZ/UWOJ5zfAursfz09i8lWpLLFlRaWuzo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dE6pzUHy87HaMDyfD9qGGI5zPiJNLH2D1wmKEBzi8gxrIXQutt7RTlINKXEmixAeLfw0mij/sOwQm2vPQMCXPfuR0Hc3YxwxioDgKYFxJuN6Q5WhZV0wOTFEd/TnNxpoQtrj5k13Xl+msmjoBGnuD12V3GDH7fPmR4nHR0dorPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GoMzQ/WL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 481NlGjC007652;
	Mon, 2 Sep 2024 05:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n/Dbx8Wm2IvxDD6/+cbjoX
	ijw0ycUls4/9Xl54oYHUQ=; b=GoMzQ/WLfPzAVASGN1IaDMclgt7yt5F3uQfVSY
	P+oc1zYM7nm8nNUemCMAlCOOOfa4thPW+WVx8A5+74LXOpXMFGJsawmPJulob73o
	AX9vejXqLAxQR1W0/aThj+Kww569xVCWRrkN2py2iAfwWJxVfnibXtD/aTXqnTS3
	3P0jBiZLlm7eINSiCNdr6/bB7Agj55Wc+B+XEVgmxWxyx/G0Htr4hY/svvCF2eIr
	yJ91qZONV3DDj2upIzYM9JL9sOdo2D+THWLxSNFQD8WOnEpbIwfnIJIuj9AA6cZ9
	eJ5iJWi9oExyv5fGgBnHUe8hwKH4bqWE0qPPeEDC6HQGAAhw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buj6ugha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 05:04:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48254dGS012151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 05:04:39 GMT
Received: from hu-priyjain-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 1 Sep 2024 22:04:33 -0700
From: Priyansh Jain <quic_priyjain@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_manafm@quicinc.com>, <quic_priyjain@quicinc.com>,
        <kernel@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: Update tsens hysteresis for sa8775p SoC
Date: Mon, 2 Sep 2024 10:34:16 +0530
Message-ID: <20240902050416.47107-1-quic_priyjain@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _FVCTq5yZgKe5i7-qlpoAsi-wClPn4uc
X-Proofpoint-GUID: _FVCTq5yZgKe5i7-qlpoAsi-wClPn4uc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=673 impostorscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409020040

Update tsens trip hysteresis based on latest recommendation.

Signed-off-by: Priyansh Jain <quic_priyjain@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 200 +++++++++++++-------------
 1 file changed, 100 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..e8b69efa8c78 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3523,13 +3523,13 @@ aoss-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3543,13 +3543,13 @@ cpu-0-0-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3563,13 +3563,13 @@ cpu-0-1-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3583,13 +3583,13 @@ cpu-0-2-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3603,13 +3603,13 @@ cpu-0-3-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3623,13 +3623,13 @@ gpuss-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3643,13 +3643,13 @@ gpuss-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3663,13 +3663,13 @@ gpuss-2-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3681,13 +3681,13 @@ audio-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3699,13 +3699,13 @@ camss-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3717,13 +3717,13 @@ pcie-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3735,13 +3735,13 @@ cpuss-0-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3753,13 +3753,13 @@ aoss-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3773,13 +3773,13 @@ cpu-0-0-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3793,13 +3793,13 @@ cpu-0-1-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3813,13 +3813,13 @@ cpu-0-2-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3833,13 +3833,13 @@ cpu-0-3-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3853,13 +3853,13 @@ gpuss-3-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3873,13 +3873,13 @@ gpuss-4-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3893,13 +3893,13 @@ gpuss-5-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3911,13 +3911,13 @@ video-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3929,13 +3929,13 @@ camss-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3947,13 +3947,13 @@ pcie-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3965,13 +3965,13 @@ cpuss-0-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -3983,13 +3983,13 @@ aoss-2-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4003,13 +4003,13 @@ cpu-1-0-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4023,13 +4023,13 @@ cpu-1-1-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4043,13 +4043,13 @@ cpu-1-2-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4063,13 +4063,13 @@ cpu-1-3-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4083,13 +4083,13 @@ nsp-0-0-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4103,13 +4103,13 @@ nsp-0-1-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4123,13 +4123,13 @@ nsp-0-2-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4143,13 +4143,13 @@ nsp-1-0-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4163,13 +4163,13 @@ nsp-1-1-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4183,13 +4183,13 @@ nsp-1-2-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4201,13 +4201,13 @@ ddrss-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4219,13 +4219,13 @@ cpuss-1-0-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4237,13 +4237,13 @@ aoss-3-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4257,13 +4257,13 @@ cpu-1-0-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4277,13 +4277,13 @@ cpu-1-1-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4297,13 +4297,13 @@ cpu-1-2-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4317,13 +4317,13 @@ cpu-1-3-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4337,13 +4337,13 @@ nsp-0-0-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4357,13 +4357,13 @@ nsp-0-1-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4377,13 +4377,13 @@ nsp-0-2-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4397,13 +4397,13 @@ nsp-1-0-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4417,13 +4417,13 @@ nsp-1-1-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4437,13 +4437,13 @@ nsp-1-2-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4455,13 +4455,13 @@ ddrss-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
@@ -4473,13 +4473,13 @@ cpuss-1-1-thermal {
 			trips {
 				trip-point0 {
 					temperature = <105000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 
 				trip-point1 {
 					temperature = <115000>;
-					hysteresis = <5000>;
+					hysteresis = <10000>;
 					type = "passive";
 				};
 			};
-- 
2.25.1


