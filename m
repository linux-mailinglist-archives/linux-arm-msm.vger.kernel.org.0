Return-Path: <linux-arm-msm+bounces-37928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025A9C8F57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 17:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5671F22462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F17416EB4C;
	Thu, 14 Nov 2024 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KPTaZ21q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB518C326;
	Thu, 14 Nov 2024 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600623; cv=none; b=kRiRJ+MxoRA3s2ezAfT5iAGPuDu7Ua84yEr9sCctvpxkdIxSaVD/cvtdMACNs6XYL4O+KrAwq1WP7QVek5+hS/FS00j0WVV8tkVw/EjuJLK3FcIhPj4+r8izDmkdqcG3EftWhEx/9KDmc9eOeqSCCIPWkqU6zp3/3F8WJmCaw5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600623; c=relaxed/simple;
	bh=tASBFVxte4jEeogh15aOK8X6fcTnpTqFcvGjwQ8/BbY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIGFVU739wnHPcVynPUM3lalb7otjeCtTpjkVe+t78mSAiyttmpGba8q6a58l0APjRAeSw7bPYsvYqg55w7VvRJAOKExQ1OGhvQt+unLPx/x/1IBnOthmB1NAM3XGpJ5KnfyaaMoPItQsNnNfTt3EG/JBk2Cw46rN1ebN6ioFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KPTaZ21q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEAPvdJ031268;
	Thu, 14 Nov 2024 16:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d8lH+LvVClXz36Mw/guiwdLgrwKANSS/DsNzWrGd9Q=; b=KPTaZ21qXAW0gQc+
	Xd/9monuKIiczx6ORPV69hBYzKaJEFY7lb6RFG+2PuDKFeTW2/WGmvdokDCXTMIJ
	gVFjqAPx6D0jOHdIVoMoTnScBfZRZjMipMWA7hUDAY1QqfUd+gpuebhA4X6onyaU
	IOiVZogv3i++uMWL+C6tnMvTzKFKCF5kHJSghgBchbTF8FFhp0zorE+GYFdboKmK
	RbdIXBpCs87iCeT/Pg5juac6dU7PEeNqkiLYqRm4Ke4WJq6J6+bzGZj3P6jpLcXt
	lgdTfNSt0ueR+5meFsLDktKs3WVYFHMsfLI7oNMJGeXFyd1cQCY3bV4ZVMbky5Ea
	7IvuIw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gucpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 16:10:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AEGA7JI019116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 16:10:07 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 08:10:02 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH RESEND v17 5/5] iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
Date: Thu, 14 Nov 2024 21:37:21 +0530
Message-ID: <20241114160721.1527934-6-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q47SVlZGnUZsOv5plWKerGt4nUpGic5e
X-Proofpoint-ORIG-GUID: q47SVlZGnUZsOv5plWKerGt4nUpGic5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140126

Add ACTLR data table for qcom_smmu_500 including
corresponding data entry and set prefetch value by
way of a list of compatible strings.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b595fee23836..5106103574ab 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -16,8 +16,40 @@

 #define QCOM_DUMMY_VAL	-1

+/*
+ * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
+ * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
+ * buffer). The remaining bits are implementation defined and vary across
+ * SoCs.
+ */
+
+#define CPRE			(1 << 1)
+#define CMTLB			(1 << 0)
+#define PREFETCH_SHIFT		8
+#define PREFETCH_DEFAULT	0
+#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
+#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
+#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
 #define GFX_ACTLR_PRR          (1 << 5)

+static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
+	{ .compatible = "qcom,adreno",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,adreno-gmu",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,adreno-smmu",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,fastrpc",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc7280-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc7280-venus",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8550-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ }
+};
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -620,6 +652,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.impl = &qcom_smmu_500_impl,
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
+	.client_match = qcom_smmu_actlr_client_of_match,
 };

 /*
--
2.34.1


