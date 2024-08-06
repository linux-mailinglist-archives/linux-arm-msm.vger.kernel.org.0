Return-Path: <linux-arm-msm+bounces-27975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF67948846
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 06:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC8E3B22C13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 04:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1AD1BB6A6;
	Tue,  6 Aug 2024 04:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OM71CJbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0557A1BB69E;
	Tue,  6 Aug 2024 04:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918012; cv=none; b=UgTm5NsMdezhSE5ODd7K1E90gdhTpavOLteA3z+dJDiSZ3NDW197UB8i711td0xl4XvXnvIZWSftM5dhYm3p2VxNvTFBpaQT+9HPrEX383tPMDWpZiVtzDKNf0T6NjUfeI0C9aD0HEGmqkfGwzOCcMR/WefmEbohxrynyxnssHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918012; c=relaxed/simple;
	bh=J5tdLIt3xF8ghmxcP6qpo3rSMVwyQoiEiaJAVJ6Ev4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qq6HDLdAI36cWFGVrqA/ZZEcH3ZKgJFTAaKGDt1lkZdD57JyvdJPjySEk5+ZrV1de0tK6skmNoI76Av5sttJSX18GtQVCnII5pkfJ8fJHEYRsfFPosJC5X0WgEbkWrr3/JeK6GWHIkGcQX9j4oMzQuAXDa0ByAmS/1VTXPjECWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OM71CJbN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4762pmPo028269;
	Tue, 6 Aug 2024 04:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IjjdgfaWmaPaxw2SAF7b9w2/Pejfse/vfPZ2yaHdJXw=; b=OM71CJbNDOHBsa6W
	oRUtYYJeqKdKaM2+W5Q2VzpzEEbmFAlj3KCwUitCqUihQ0w/FH3dV08C2w3J5Avd
	pyBRdcNOBnk8ts1vBEfecM3h3mLYbShz59Y99y7m/1e3mGVzTty+ksT0LokXbeHp
	GMEIdEOn+1xEIZuTvKNg2CmrKOM9Mv7HEV99nksVpcQ8Kh/fxlxLQDrD8eWaoX+l
	m0Y3vI4ISGNwLd3lqJUW0PDpwyP5j38/rrt1rkEvFBKXz/zAal44T7LO5AmXO5ID
	4ZsPBC7jQChUh1b6P1C3DH55yKXLFZTbR+xRR7I573Ml+CaqLipzHV0jEjB4g7oo
	q8etMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdae5wr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 04:20:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4764K6BN021111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 04:20:06 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 21:20:02 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 6 Aug 2024 12:19:30 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: sa8775p-ride: Add QCS9100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240806-add_qcs9100_soc_id-v1-4-04d14081f304@quicinc.com>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
In-Reply-To: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722917991; l=1297;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=J5tdLIt3xF8ghmxcP6qpo3rSMVwyQoiEiaJAVJ6Ev4E=;
 b=Glz34zRkOcXpEHv81jL3Wdq5VK7v3iRcOt+RkWpPw8Xl+HANOv5sbHD1pLBAftNtGm3ClsgNY
 rU8+iHtypjiDD5GF8M5keSg0rz7WJhX+CFQ1UWfyWHz3fQEOXsbJmMk
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i3eZF9uWxo0Or3-nj-TNoy9iDUNnJEqv
X-Proofpoint-GUID: i3eZF9uWxo0Or3-nj-TNoy9iDUNnJEqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=513
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060029

Add QCS9100 compatible in sa8775p ride and sa8775p ride r3 board DTS.
QCS9100 references SA8775p, they share the same SoC DTSI and board DTS.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index ae065ae92478..14f0cf2f2350 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Qualcomm SA8775P Ride Rev3";
-	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
+	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p", "qcom,qcs9100";
 };
 
 &ethernet0 {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 2e87fd760dbd..8fdfc3abd51f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Qualcomm SA8775P Ride";
-	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
+	compatible = "qcom,sa8775p-ride", "qcom,sa8775p", "qcom,qcs9100";
 };
 
 &ethernet0 {

-- 
2.25.1


