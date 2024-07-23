Return-Path: <linux-arm-msm+bounces-26847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C0939C26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6F91F22AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 08:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E96D14B964;
	Tue, 23 Jul 2024 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UpaNtI6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827910979;
	Tue, 23 Jul 2024 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721721700; cv=none; b=OJccnGC8DuiWCRm5b751mvmMWpXurQeB2jPzoFtxpTdP85xDetogP6bTCwwHhVcvuQoMsfL+MU6rgLAhnEi/VBgyZiC6eZiBEYTeU6l9ba6repqtf9t4FjXvySj//JprnmeaSyOnu9aC0HTvsUlknVBOOL/keR3heOrC0CLVQa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721721700; c=relaxed/simple;
	bh=6pC2CGMi7y+367UwIGfE1eM5H+1abrAobyq5FKNJArA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NkUkh9TmpqhoG6yNU3FED6OI1M0voW8zaWiwKJSqZJR7hYYRQeV5ZXi3SbMqVkWPpQWdaLVskTnF9RPgWRjKzQn6R7Ron/S4hW+cSVSmgbp9HV5d67mGzqwXmBwE81GWisGIWY7uhtVC0iGU6KkFgsID2lL44HzSHuhPIg86XVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UpaNtI6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MMrIB5025831;
	Tue, 23 Jul 2024 08:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=7lpUyfM1QRYB3NgtgCJcU7ncD7VavjZxyTa6XjbYDH0=; b=Up
	aNtI6KmG4TDZtYx5C79kDqGTxa22qq3UuxWNpHrDBNOptAaN8toDFeSlhOq6R1nt
	UdnX1JZiL4SkorymmazQZ1qzyplCLL6toa+cLy2zU1HwOGVwvN2tEjCZ6GvwoJoE
	hPKzu7Wn2nFBXIo05hEDSTfUTNiWRFDgpYRj7Yj664QlyGsjcdW85vnjyVapW5mT
	OcWFH9n27XqOtedHw4wBdAAPzrKJR9JnBRy3/HsRNNdFDC/5qiknSEdu82lk1HHn
	rtU/aoEDFzTm66rYZzox6ANlU9HtxbN3WFJx2hwEBQkXc/1MobRpprIsxsTqoyIi
	RqFyVLstRbaQZC6tbnKQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g60jwuna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 08:01:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N81S0O012311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 08:01:28 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 01:01:25 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ahalaney@redhat.com>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent
Date: Tue, 23 Jul 2024 13:29:48 +0530
Message-ID: <20240723075948.9545-1-quic_qqzhou@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0XTLzj6SSnCR63HGHrND1hgXHa-GCfYh
X-Proofpoint-GUID: 0XTLzj6SSnCR63HGHrND1hgXHa-GCfYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=794
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230058

The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
mark the APPS and PCIe ones as well.

Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
Changes in v2:
  - Add the Fixes tags.
  - Update the commit message.
  - Link to v1: https://lore.kernel.org/lkml/20240715071649.25738-1-quic_qqzhou@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..95691ab58a23 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3070,6 +3070,7 @@
 			reg = <0x0 0x15000000 0x0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
+			dma-coherent;
 
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
@@ -3208,6 +3209,7 @@
 			reg = <0x0 0x15200000 0x0 0x80000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
+			dma-coherent;
 
 			interrupts = <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1


