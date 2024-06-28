Return-Path: <linux-arm-msm+bounces-24639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D849391C063
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 958C0282936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49821C230F;
	Fri, 28 Jun 2024 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n1bL4UoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FC1BF312;
	Fri, 28 Jun 2024 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583569; cv=none; b=RnymFcmZitI+F13sGgiwG6t3hVTfgOLKCdOR69Uxsv8RDq9lshh8WkRpc1OP5T3rItWnSPbixWz/qqem8/1kw4g6lulZP5GL8A2UpJw4mgS64CZLwIfPxQyS6sSnl8F+gTYxETe238cJvmenmgCTUUzEaG33/rJEkfYVzMAjUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583569; c=relaxed/simple;
	bh=J8qAGZaHOczFLyiYdia9CLKukd5J5Xa7FPU6syB1708=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3EcI0dPttvSX4wCb9bLBw2UF8ETM29QJe7bAgcFY15Gyq9eWk489o6L6GQMD8Rm+QjqE0GBWufLN0frxKVF+N1c4/g1tsgxviRBX/8YfqyFGNCatwir9nsJf+58x/x3n7XBizlesFK5tQ8PGoWxcWONwgNGy2h/+P0h91u+V9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n1bL4UoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8NH2P023279;
	Fri, 28 Jun 2024 14:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlmkfC4rnhhezJJAtSvHpydbUZRTp6XYV4iTSs3AJKU=; b=n1bL4UoDpXx3qzga
	L1hKvWVJ6hZv7hYqWjjzHqIlkCYFoU7MOyk0PzYS0dPC2z1dScm6/cRWLv/OqUcC
	rOy7LA83xZxZmyL6EBDnTLY0I4JRNXykemcDk9WqEOU00s+C4ElEYnB10Z9+5Psg
	CTlplUdfGTU1Oagyd2CqN9BBWJv2koj3z5rvWUChcqyViwe2DZXbMDjnumcB2yNh
	h3OwHEowf29C1cpjyfXuKif2nRS5pzPkB/pUyI64fH2Ux98XQsuTO6Qy43ukvluA
	cNAZvKvD06HVrCg5hTIZQvbwYWJ3WhlgAJfeT7AI636Gqr1ZwjGqIsAZTDLKseje
	5TxlgQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu1ffvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:05:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SE5qad003020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:05:52 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 07:05:47 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
Date: Fri, 28 Jun 2024 19:34:35 +0530
Message-ID: <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
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
X-Proofpoint-GUID: QjbKQ69G6sy1ly6-uBpEbPIs9qNd7pTF
X-Proofpoint-ORIG-GUID: QjbKQ69G6sy1ly6-uBpEbPIs9qNd7pTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_10,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280105

Add an adreno-smmu-priv interface for drm/msm to call
into arm-smmu-qcom and initiate the PRR bit setup or reset
sequence as per request.

This will be used by GPU to setup the PRR bit and related
configuration registers through adreno-smmu private
interface instead of directly poking the smmu hardware.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 include/linux/adreno-smmu-priv.h           |  6 +++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index bd101a161d04..64571a1c47b8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -28,6 +28,7 @@
 #define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
 #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
 #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
+#define GFX_ACTLR_PRR		(1 << 5)

 static const struct actlr_config sc7280_apps_actlr_cfg[] = {
 	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
@@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
 }

+static void qcom_adreno_smmu_set_prr(const void *cookie, phys_addr_t page_addr, bool set)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	u32 reg = 0;
+
+	writel_relaxed(lower_32_bits(page_addr),
+				smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
+
+	writel_relaxed(upper_32_bits(page_addr),
+				smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
+
+	reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
+	reg &= ~GFX_ACTLR_PRR;
+	if (set)
+		reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
+
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0

 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	priv->set_prr = qcom_adreno_smmu_set_prr;

 	actlrvar = qsmmu->data->actlrvar;
 	if (!actlrvar)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d9c2ef8c1653..3076bef49e20 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_SCTLR_M		BIT(0)

 #define ARM_SMMU_CB_ACTLR		0x4
+#define ARM_SMMU_GFX_PRR_CFG_LADDR	0x6008
+#define ARM_SMMU_GFX_PRR_CFG_UADDR	0x600C

 #define ARM_SMMU_CB_RESUME		0x8
 #define ARM_SMMU_RESUME_TERMINATE	BIT(0)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index c637e0997f6d..d6e2ca9f8d8c 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
  *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
  *                 the GPU driver must call resume_translation()
  * @resume_translation: Resume translation after a fault
- *
+ * @set_prr:	   Extendible interface to be used by GPU to modify the
+ *		    ACTLR register bits, currently used to configure
+ *		    Partially-Resident-Region (PRR) feature's
+ *		    setup and reset sequence as requested.
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -67,6 +70,7 @@ struct adreno_smmu_priv {
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
     void (*resume_translation)(const void *cookie, bool terminate);
+    void (*set_prr)(const void *cookie, phys_addr_t page_addr, bool set);
 };

 #endif /* __ADRENO_SMMU_PRIV_H */
--
2.34.1


