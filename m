Return-Path: <linux-arm-msm+bounces-24295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A962C91843F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBF41C2306D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CA0187337;
	Wed, 26 Jun 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FZVoa6Ke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55111186292;
	Wed, 26 Jun 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412284; cv=none; b=Vkgu6CXqrFa8+wg+bu6I82xuAHh2wAfGhqswmm75EITNGM0d21R2h8upVjgu/CSDrDsLOnumZz0xQXZCjR+u98jj4QoD34ubx1XMeilypkxYB1P4XQo9vHf/PYcNzr1j+WdRzs/ePDZr68GWWY6HdcKDont5ntESGcdaBkxFjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412284; c=relaxed/simple;
	bh=it19IheeE2hCORAR1MAcTTypTSRLVKmc9hMQIuAmbL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZHOPZHYZ335knj6mRD+pZpSnANm0ddE6CkcWf38JNcmDOMOUH9qTjsGuBPjrjAesdMtuliLCyUY4bxgGSulpfgOUIAz5+L5yDfjc8r/dyQhe/z0azXk8ryVLfeIK7Au1J2mNvABbpo2d0SXHGhAvspplgHPWQAozElFp2zYsg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FZVoa6Ke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfQbn023284;
	Wed, 26 Jun 2024 14:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ePgUfKZIPR/DG4FR3Sxet8R775qj3y3ubRTBsl+A2w=; b=FZVoa6KeNZRtRgT1
	oKSmHSpQbMDpKVzTXmX1/RrtZpgXeO77VpwpKyHXlVPaHVXX9Z9OfqIdMd3qJThj
	tO1kUFI0Q9d1TjO9hkkBxrc+fPruRRoFnBVZP+WLj83wTVrcdMYGwqRSjZZ82RCT
	bm9NRMfb+zmzmHlMjf2/MJ7qUWTNsOI41O1xmRDIXvrdZkAkKtFa/pN9Mk1eiY7h
	k11xYffYXTWKR8Yg+HjkXd+1Z+9ze6X2c2jM0BGGDA/Q5aPViLsvVNaA842dZmXw
	D8ChL1YmFfz4X/lkreCWnCxAnYeN6vnubMxEF74EEqn7weys8Sd1eM1Taf/SeNrG
	v3l2Dg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu19c44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:31:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QEV7Va021551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:31:07 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 07:31:02 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v12 5/6] iommu/arm-smmu: add ACTLR data and support for SC7280
Date: Wed, 26 Jun 2024 20:00:19 +0530
Message-ID: <20240626143020.3682243-6-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626143020.3682243-1-quic_bibekkum@quicinc.com>
References: <20240626143020.3682243-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: stVHse33-NhFiiEb_0S4KNK-WTAP6sqN
X-Proofpoint-ORIG-GUID: stVHse33-NhFiiEb_0S4KNK-WTAP6sqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260107

Add ACTLR data table for SC7280 along with support for
same including SC7280 specific implementation operations.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b4521471ffe9..bd101a161d04 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -29,6 +29,55 @@
 #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
 #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)

+static const struct actlr_config sc7280_apps_actlr_cfg[] = {
+	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
+	{ 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
+	{ 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+};
+
+static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
+	{ 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
+};
+
+static const struct actlr_variant sc7280_actlr[] = {
+	{
+		.io_start = 0x15000000,
+		.actlrcfg = sc7280_apps_actlr_cfg,
+		.num_actlrcfg = ARRAY_SIZE(sc7280_apps_actlr_cfg)
+	}, {
+		.io_start = 0x03da0000,
+		.actlrcfg = sc7280_gfx_actlr_cfg,
+		.num_actlrcfg = ARRAY_SIZE(sc7280_gfx_actlr_cfg)
+	},
+};
+
 static const struct actlr_config sm8550_apps_actlr_cfg[] = {
 	{ 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
 	{ 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
@@ -685,6 +734,13 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
 	/* Also no debug configuration. */
 };

+static const struct qcom_smmu_match_data sc7280_smmu_500_impl0_data = {
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
+	.cfg = &qcom_smmu_impl0_cfg,
+	.actlrvar = sc7280_actlr,
+	.num_smmu = ARRAY_SIZE(sc7280_actlr),
+};

 static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
 	.impl = &qcom_smmu_500_impl,
@@ -711,7 +767,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7180-smmu-v2", .data = &qcom_smmu_v2_data },
-	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &sc7280_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
--
2.34.1


