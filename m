Return-Path: <linux-arm-msm+bounces-28827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B295502F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 19:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B5E2B25CFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027C81C3784;
	Fri, 16 Aug 2024 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lP+JMUiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732661C3F27;
	Fri, 16 Aug 2024 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830243; cv=none; b=BGmYTdxPLB1YdPDSNFLtkug0b1q2/z9tPyujeVfGFr0PiFpz3ZL1glQcJhcAsH81hShgaFc6iNzR238khZR5nyjuiYuS+OHLAjUuBbhbFg3JgS1XnU4qNPG+5Lcse1ePzHVVCoxZoMBdzUFgDsdO7WoW0DaFWvmhn7NEmxAsdCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830243; c=relaxed/simple;
	bh=HP8aI1tGtkxMJ3jlSHcdiS0jOm6Uj0/sYwsh+lRKfEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cQQQHt9UFP6bPtD3lWrDuYyvdMPBRqkfXXcaotla/5NlqHVqnbWEqzCsaBvQAd/A4HVkitZjM1l02pZU1axiRzRwCCeZC0tte+qp1L1UD3QHeDOQ/8SX973DE7DFhnIzZUKy0p/7xDy3W9szHv4U8oMEx/Ol8TIIAGfGxIwc2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lP+JMUiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GHFuS7021402;
	Fri, 16 Aug 2024 17:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u690h3SAj34XK9osz+QP5K8z17v0Iyc39Mvc/9yF0nc=; b=lP+JMUiZHz3Upvfr
	emAWRhvgeAehj3Q7hAzHjcCgvpA489ezR4P12b1q8icVcxSnrwEQp+zhPp5Xadmg
	6aFjdwBPok9TlZ3yVtahiD37EjliTHDffSnpIXDqrMkp78TjATSGJYg8VSeqZDyJ
	jqX9XY5Lalh/kzokaEnkXipZHx9Cr9YjAEVffLaDw8tYFfvWMDEyQaNs3pDZrgQx
	n6wu+Lb2LYz94u7HjUCvDh+d/Mr6hZK+v2y+54zg38biQZLugZkl98ugZowzNJwC
	aXvbwK7KLZPbvWajsZti1K/FVwL2VgBw32FOenmYJgL3NSbyKQX+aBFqRLokJuHc
	tKPoYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m29895a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:43:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GHhknM001165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:43:46 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 10:43:41 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v14 4/6] iommu/arm-smmu: add ACTLR data and support for SM8550
Date: Fri, 16 Aug 2024 23:12:57 +0530
Message-ID: <20240816174259.2056829-5-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K6hMzUJS4fFng1EAC0eqTM6bnM8YlRO4
X-Proofpoint-ORIG-GUID: K6hMzUJS4fFng1EAC0eqTM6bnM8YlRO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_12,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160124

Add ACTLR data table for SM8550 along with support for
same including SM8550 specific implementation operations.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ebbbbfe4e0bd..dc143b250704 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -25,6 +25,85 @@

 #define CPRE			(1 << 1)
 #define CMTLB			(1 << 0)
+#define PREFETCH_SHIFT		8
+#define PREFETCH_DEFAULT	0
+#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
+#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
+#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
+
+static const struct actlr_config sm8550_apps_actlr_cfg[] = {
+	{ 0x0800, 0x0020, PREFETCH_DEFAULT | CMTLB },
+	{ 0x1800, 0x00c0, PREFETCH_DEFAULT | CMTLB },
+	{ 0x1820, 0x0000, PREFETCH_DEFAULT | CMTLB },
+	{ 0x1860, 0x0000, PREFETCH_DEFAULT | CMTLB },
+	{ 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x0c01, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c02, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c03, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c04, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c05, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c06, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c07, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c08, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c09, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c0c, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c0d, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c0e, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x0c0f, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1920, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1923, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1924, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1940, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1941, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1943, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1944, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1947, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1961, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1962, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1963, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1964, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1965, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1966, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1967, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1968, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1969, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x196c, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x196d, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x196e, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x196f, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c1, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c2, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c3, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c4, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c5, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c6, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c7, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c8, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19c9, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19cc, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19cd, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19ce, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x19cf, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
+	{ 0x1c00, 0x0002, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1c01, 0x0000, PREFETCH_DEFAULT | CMTLB },
+};
+
+static const struct actlr_config sm8550_gfx_actlr_cfg[] = {
+	{ 0x0000, 0x03ff, PREFETCH_DEEP | CPRE | CMTLB },
+};
+
+static const struct actlr_variant sm8550_actlr[] = {
+	{
+		.io_start = 0x15000000,
+		.actlrcfg = sm8550_apps_actlr_cfg,
+		.num_actlrcfg = ARRAY_SIZE(sm8550_apps_actlr_cfg)
+	}, {
+		.io_start = 0x03da0000,
+		.actlrcfg = sm8550_gfx_actlr_cfg,
+		.num_actlrcfg = ARRAY_SIZE(sm8550_gfx_actlr_cfg)
+	},
+};

 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
@@ -610,6 +689,15 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
 	/* Also no debug configuration. */
 };

+
+static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
+	.cfg = &qcom_smmu_impl0_cfg,
+	.actlrvar = sm8550_actlr,
+	.num_smmu = ARRAY_SIZE(sm8550_actlr),
+};
+
 static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.impl = &qcom_smmu_500_impl,
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
@@ -644,6 +732,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
 	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
--
2.34.1


