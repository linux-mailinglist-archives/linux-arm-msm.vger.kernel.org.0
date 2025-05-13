Return-Path: <linux-arm-msm+bounces-57669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19EAB4E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D84E37AEB54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 08:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29860213E71;
	Tue, 13 May 2025 08:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bkveazaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B540213220;
	Tue, 13 May 2025 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125823; cv=none; b=o7k7w+5SR3bDbL/eT/SwWNYpmo+qxKToi1Df4L2gkifHfNMQVhYdIBIoOSYud1evXUJsfPy0KirRMvr2JOm9aIEVFQOgkeCD9nWWm7bMH1Cuz/drbLBcq0V+kpZhARdrta+SfKXBochXqttMzU5bQywmMlnGLvnmZ8DkwHzd05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125823; c=relaxed/simple;
	bh=4opfGDaUG9wKk9E7yJ3JMNveeIfEr6eEdxTIC8Z/xtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDs/Jz5Ti43BLnwPHa6miTDcqPBprIw69MnBbJN8Ucr+TKYV2bQS4qXpg2B2mDeb9ner04FBPKqicDUlNdOwbNLZB446o4ilwdeZfgAnPoCTw5bemV33QnNOYwH4OvG5azth8CyAN1aLawWHWYBOStllQm2OnwnZTXr33wlCDMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bkveazaT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6dMWP011853;
	Tue, 13 May 2025 08:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kPzY5qpjxYQhfz5Q0v3IolUy
	CBjuZKb7h4PWM/zLZC0=; b=bkveazaT/HXcYgX/+7yTwi2RNQJj/SQIlSZQrIdP
	MTIenD3PcE5CQSYcK8jT2C+n9QxDlgOZzMksCG/PMyRRRzYEC/lmWzb8ExkARWt7
	ob0I9XExK3JZYZ1qgFic34uPvLSsA8o7/M0vXCAyCdzILpflonb19SOv//V2A4pB
	8cMZWTv83Fnve2UyxvXaiS2SSSoWKKYEyIDjGXzWasU6r06do22CTkJBQX2cobFJ
	ZkBVap1ufEA0GGeLfmZoKA5qfZf1jNh30bDEm3CZj7o13XDARk6telAA04QeFP/J
	yY8Ee1A0HkbyiJl1qAQsY7ob4MfHEGp55KAIdmM1ByrK5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt973bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:43:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D8haQF012622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:43:37 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 01:43:34 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
Date: Tue, 13 May 2025 14:13:09 +0530
Message-ID: <20250513084309.10275-3-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513084309.10275-1-quic_sayalil@quicinc.com>
References: <20250513084309.10275-1-quic_sayalil@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA4MiBTYWx0ZWRfXwpt6Mt4GOQT6
 Fs2tVyGOm4DAk0vuSHeP/1qOXIS4/af2zvCcWG2G56Fq5nfQt2llq6dM+6IlWIL6Fb16iT0IaH/
 gRC6qSdKppBOxzx1Y4bJhAWYQLoMrMm5DwdbJNY/Vd9Jd2rzlt76zBnlkLTkv9qmfdJtUZe1V/N
 qms0QHXGfu0ntex/5rH7/KFJfBKCY75ieoNC2dKDpeUuG+5zXfzhKlfM9ZLSqttE74P9GzOh6Oa
 UtjpH7LDEx8cIo3o/dWDuqX73zvLOCSLweM971cfEMAesfAmr8Fc/DgKh7KHn9Z3HgyLn6uDT6k
 +OgNf5dcOs8yT2N3NMaMaT3hAAQi9L2yCqvRFXmdXzYF3VUGrRwe/ihNwmc+S7Mn2KGrqOcqB8P
 xSQUHnPNsFC6+1QMMMiWvV965jaTOLqq7fo3tILEbzEftilWV0sswWlh3ovwtZBXETFfVVk/
X-Proofpoint-ORIG-GUID: cy104mCSUE78wpSEfg9lzmJ0SBl9K26V
X-Proofpoint-GUID: cy104mCSUE78wpSEfg9lzmJ0SBl9K26V
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=6823063a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=2ynOvATnUjgCi_jlrisA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=882 malwarescore=0
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130082

Add UFS support for qcs9075 IQ-9075-EVK board.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 .../arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index a3ca62c7eee9..6d6d08111d37 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -276,3 +276,20 @@
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


