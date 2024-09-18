Return-Path: <linux-arm-msm+bounces-31954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8697BAD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 12:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111172830C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7747717CA02;
	Wed, 18 Sep 2024 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gbf1E5bc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1DE1741C3;
	Wed, 18 Sep 2024 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655401; cv=none; b=njYeVBr7jFKeaubhsLFEPZl7ms/FPtdAYTfmsQaS/eiJNEyn3B5AXtUGnWjGZ+da2KLUQrWmCFbg9vPzCQIYrnZ9Yclh53yUMqe7ZmaYkQk+dmb+UgSRbMpe90awPDaZ0Wh3A95RW37j70uEhK/54If6AyTDKWyhzv6rLdcfw2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655401; c=relaxed/simple;
	bh=tUuALn5ehxlNDWSv25T4l7vlKGj0FmVP4lN29YTyaTo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I6hV3gR0D++rWyG0JuCD+uQuKWl4qP9pYa8JkBwdBzTbcBxSooIlQUE4torOvN5ngVn9H+PtP2h2U8XDtPPj5SW1F9HpdFGjoyg9vX6mfg8d7An2Azt2DUgMaVZLGPoGekMkAYwEshxB3+hWWN6UFTd4+mUx/9yK4AYEX+B4c64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gbf1E5bc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I8iIId012612;
	Wed, 18 Sep 2024 10:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ifynQdRVvINRhkbByRD63oWSvNW1uNbqnQlGfESNpBI=; b=gb
	f1E5bcIM8gAMxgjcQzYJofjl0WCfaIvrYV0CqrsoWweu6GmTRWwnWAol5oWzU8+s
	AB2DZLIkwWCumk+MRtsTAvqeLiO+xYouWwbtoo7D46I3m5l0LFbtLAytQkT+M1a8
	n2/guXIdbvuv41esKtMVHESaTGXQ+UyBHTID6xkooWy942mPtSV3898uEDs7rOsK
	nX6KIM95V8aVzaGYiPmIkW5L9oYioXqyNoC8l+i5Jt36B1ZBVsqypo4ES2e2TOXT
	jMhEzwxkj+hJ0eckBnhnDG+D/1SYon1JKGVTYXj36ASCPViAWStyHEWstxMlO/Iw
	cz0jEOKoLPBWNIb5Bf1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gd1m7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 10:29:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48IATgpl006216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 10:29:42 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Sep 2024 03:29:36 -0700
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
Subject: [PATCH V2] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Date: Wed, 18 Sep 2024 15:59:21 +0530
Message-ID: <20240918102921.23334-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RGMIyHjOYGp_a9o2goip3HVQMttdPDvR
X-Proofpoint-GUID: RGMIyHjOYGp_a9o2goip3HVQMttdPDvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=790 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409180066

Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---

Changes from v1:
 - Addressed Dmitry's comment.
 - moved pinctrl-related nodes below the PINCTRL comment.
 - moved sd-cd node in PINCRTL_related TLMM.
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..c9f4c6812b71 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -716,6 +716,18 @@
 	status = "okay";
 };
 
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
@@ -812,6 +824,21 @@
 	};
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
 &tlmm {
 	lt9611_irq_pin: lt9611-irq-state {
 		pins = "gpio24";
@@ -819,4 +846,10 @@
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	sd_cd: sd-cd-state {
+		pins = "gpio91";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
-- 
2.17.1


