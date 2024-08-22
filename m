Return-Path: <linux-arm-msm+bounces-29237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA495AD05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 07:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0AB6281475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 05:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912AF4D8DA;
	Thu, 22 Aug 2024 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kUsu7kwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B5B23CB;
	Thu, 22 Aug 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724305539; cv=none; b=Fwp/lAgbYORDj+v4HdMoH+ulI9hHTF3Vu3pRlW3p/68AXdPtqT3VU4UjPgpdepyM44Z46Jl+iK/5ITpoRcprv7gjuCwdpNBUIsfnEOtQv4a4ygxM9ZjvSRXjqp8cICZVvpYaIPoyBopexsMDeMPge35i7ItMo5xnhw7d7FTHz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724305539; c=relaxed/simple;
	bh=mbw4YAzVjFnzGAgTXBPme5sjYYqYEkad5Ia1Ud9ihko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t2WTy2n2dNXm3ZPloqazRDt2OsYB4AgQ8t25FUGM5wGMJRbXwJZVP7zdOhwAO/R3EbMNqCYFSJCkgskiCgzbVHxvuNC6C8j1x8YeiM7xhii8HjfAqB00UexgyXPJTlZ+JnXqbHO4b8SfMyY6nLjwvZ6Ec5LT58y3dX5J86AOJoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kUsu7kwv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M12cl9002130;
	Thu, 22 Aug 2024 05:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=kpcdL7lq7iEq3+tqaYjH8jTl6UjYdvs2yWw00QhlvdU=; b=kU
	su7kwvXV3n7ZKclDe+iKrEeuqpQy594zqpv2Q2SSevm42aCD+9yY5v7vgUAfjc2l
	arknfL88oeoeCyM585lIxfeuJTqctCRDdYale27eyJRbkWCToIlNnRDEDLOUVzhY
	ggfKooznVUc+r4ipVgcDFaskZxOFGsYh51MIx1WbyxXOnmS/tPLVFlQK2j3UU005
	JtxO4e6NMVON5C+n9BKcV+/y54qN1mM1fPyygvosULy3uESbGzsu+kjZmxrODGm2
	tjFLYl0aRp4IuOQi3+vvL0DWgTi13J4+HoKndbmUxfn2lQQLJ3/eAX4gZgv0ItI7
	FsVEers9vXBudN9ww6fA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdmxx3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 05:45:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47M5jJFS010320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 05:45:19 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 Aug 2024 22:45:14 -0700
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sartgarg@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: [PATCH V2] arm64: dts: qcom: Add SD Card node for qcm6490-idp
Date: Thu, 22 Aug 2024 11:14:57 +0530
Message-ID: <20240822054457.16314-1-quic_sachgupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MisUgbL5UwD7g1gvxB8FGRsbc4KGJ0Wa
X-Proofpoint-GUID: MisUgbL5UwD7g1gvxB8FGRsbc4KGJ0Wa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_02,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=673 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220040

Add SD Card node for Qualcomm qcm6490-idp Board.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index a0668f767e4b..8cfbb42af6a3 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -641,6 +641,21 @@
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
 &sdhc_1 {
 	non-removable;
 	no-sd;
@@ -652,6 +667,18 @@
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
-- 
2.17.1


