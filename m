Return-Path: <linux-arm-msm+bounces-31894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2397AD8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430E8282DE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 09:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1185614D452;
	Tue, 17 Sep 2024 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SsKuW7Wx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA841BF24;
	Tue, 17 Sep 2024 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726564067; cv=none; b=ppfNcUXiZWI7P3aJqIlG+ys/wFAoZo3oBEZ/qPPwCoxkPiA3Ifz6NZSpcivkSqnkhZoFOPoC+LrcRpeUktKUWhxQTBkf8uUMexSkGaBLl0nNXc4vQoCdAAI7MOMQDtx1fSmZZH/9YCWW+UU7zSQzxk3CQlwcLaJlB3xXcKCdVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726564067; c=relaxed/simple;
	bh=nCYNkoT4zRwAUv0gz5sUkyV3PRGCDV6DNj//vtt2KMQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i+4tet9fiTh2zHouwD/hUpbMy4qZPhqALZl1pRHdY56FNBwSsOE3JTOQaWSfOyKI1FeGSLjurLk6EKOzkMLRMfC6tpZkqTuO30hTH7f8lUnhmSGrletXt27TuIYEHAW1N0mjItYv5zTSsNjWCH5f/gzqVbfzxd7GLbbjMFYoYbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SsKuW7Wx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H50lRu011687;
	Tue, 17 Sep 2024 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ow0WdeNBw2TCaIQEYuxzSw1d1oinzb3nLjwG8RgGakE=; b=Ss
	KuW7Wxg8ZF08Ko3bvf4Yya503IOcsZfYW+u8KLIaeJUPFdBU+v8gmzS/DDh+EcYH
	7SO6Zz46RBPjlya3z48SjiCiI//eGJik3y7cFoaqKoVN6cjI1G57USwENBQWhGx6
	Ocsl2P+WMALVtXSFHFOvzTXKikirB58YUxJFaSqAVP7oFcNFs48Xl0tNkYfpJnPV
	cDuwmkUMVDarifnKp0fK9hOU7R6j6tuTjWzo/TUERaNBTurFiBk2GgefDB9VwxS4
	lBhdPU0SysBOBxjQaGrjEMfkC9ltXRCQ74P/gXBG+UqGOMgLlYcVDdZIowT0Lp6C
	KX0fYviG4TAky8+WCs4g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4k0p9xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 09:07:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H97e3t024455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 09:07:40 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Sep 2024 02:07:35 -0700
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH 1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Date: Tue, 17 Sep 2024 14:36:30 +0530
Message-ID: <20240917090630.1025-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YkzJhxzZoHX0n__KAdHMpe24HeOb5YmT
X-Proofpoint-GUID: YkzJhxzZoHX0n__KAdHMpe24HeOb5YmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=768 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170066

Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..5df3167651ca 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -716,9 +716,42 @@
 	status = "okay";
 };
 
+&sdc2_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc2_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc2_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
+
+	sd_cd: sd-cd-state {
+		pins = "gpio91";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart5 {
-- 
2.17.1


