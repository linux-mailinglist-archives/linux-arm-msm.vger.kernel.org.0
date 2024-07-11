Return-Path: <linux-arm-msm+bounces-25913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEC92E068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD493B21D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 06:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8579313C68A;
	Thu, 11 Jul 2024 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iiAVYWt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A411311B6;
	Thu, 11 Jul 2024 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720681068; cv=none; b=JGplnQ49QN3JjalsVPA208zrjr+rWocNDQcs1QEYEn0JREv+qvA7ewA9mFiLu3rhCavVIYDFrCgaOxIhdIf2k3MCyZp0ANfEbhrEGQksGtJn4COJLg7G9HV8koXmoPzGxl+cVMZMvV4SAiAWLi6gDl0b7k2RQpgJgljuq0kUjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720681068; c=relaxed/simple;
	bh=uWymqDSon2CSXk55pUNRBKKppMvTwwsTROmbIcw7vjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUi4/dPmNPkV2j28THZOXKAzXlfsuhhMrHRNZRDoSMgOVtY2o98/1JoQqJdLWJN0HIEuTBUxSc2SFOJ0sObNXq5KOmC8uo0LP4qeWdYuXaz1UsAI0hHqc4UA6TjziCQgY5Md8GV6IAHPrI/smEpvTBJ+cieM4TwrL7sLtx7ip38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iiAVYWt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mmAO007428;
	Thu, 11 Jul 2024 06:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kITZnJLZKcK3CjT974AcnPC6vDsu0JNzqV7gmcgEJHk=; b=iiAVYWt/UB5PGC6/
	ALBFHyV9i249eqbid/OuKSb41r2MjCZsPj2qJ06tytOUCHmdQvlpCQPhZEVOBNqA
	vkkY0Jh3XevrHzamEmXmgcEQeJR2+AOv0sZ1BDaidiGW4FG2izOkHz5lNvmkkKhZ
	CE4g1gqYXng5AezAfPIQDAohWCfYHKk3TMtHbW2mhZDDphypgMi2gSvstivymzl0
	4UfgL1kRnq/nsMiSvDxl+qQlb4yj7pBx7LEhijwBKoh+38uyC8ENmu7cb5JLaoY7
	aogvD1ZO7avpogNTjWzqReUt8PZby12FRv69lLaW2BbpPnU8/UJBzQsYz/8BEkj8
	Y+uMLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wg43rea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 06:57:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B6vfsh029111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 06:57:41 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 10 Jul 2024 23:57:37 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <johan+linaro@kernel.org>, <quic_kriskura@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v0 2/2] arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb
Date: Thu, 11 Jul 2024 12:26:15 +0530
Message-ID: <20240711065615.2720367-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711065615.2720367-1-quic_varada@quicinc.com>
References: <20240711065615.2720367-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C8pBg98kCxrF0cgxFnN-mIZg1APYmqen
X-Proofpoint-GUID: C8pBg98kCxrF0cgxFnN-mIZg1APYmqen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_03,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=609 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110046

Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
supported for SPIs and results in probe failure with -EINVAL.

Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 7a39e66d51f1..ff8ad1036ac7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -322,8 +322,8 @@ usb: usb@8af8800 {
 			reg = <0x08af8800 0x400>;
 
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 53 IRQ_TYPE_EDGE_BOTH>,
-				     <GIC_SPI 52 IRQ_TYPE_EDGE_BOTH>;
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
-- 
2.34.1


