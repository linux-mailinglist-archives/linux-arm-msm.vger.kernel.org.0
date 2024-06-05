Return-Path: <linux-arm-msm+bounces-21755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5B8FCE3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2087628912F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C071BA890;
	Wed,  5 Jun 2024 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RY6y9bnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF507195B1B;
	Wed,  5 Jun 2024 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589945; cv=none; b=LTKQrIOIafJeNkjTUoxv2iWvp3wYJq3rQQnNXEkqPc6vdPODm+pkqpPZPkUxXeGuREcZkTZpHuE7jfnysdAs3kDhRo2rUHCMd8PGL0Ozz6SnbTzlkFR1htfNwLUgZaQg7y7IRArdQ5XbZO7+C/tzg2j9IbNlYrPPmOwG7tC2ua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589945; c=relaxed/simple;
	bh=I2GxTOGGDNAddHTDnWsVMvrYiRkDJ16/3v8Ih7ZBOGY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGs+3Xp1IimcwQ8W1HN52i2LAuvyZde9rj42efjWauE6VZiopdwThcNa4xZD8xarSg+jN2ipIbvX0wr/OwiipC5FbVJgDGq2wq7VgJ0yRKHa2PnWx3xOZS/afNLkrnpJn22kQ8RgE3Dw855CQHvIyozEaisbM+VlXStUDK28aSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RY6y9bnU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1YwE031013;
	Wed, 5 Jun 2024 12:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMfQOpxpc0PHRoP5T27R8PUZjKJPEZqpNjUcrimz/Gs=; b=RY6y9bnUL0u5GvJp
	4ZynOO7HvSYGEelk8Qc+LZnGwvouWs6Rs8+dnnLxz+Xv/N5nPeKdSn3MXfzuSV0+
	55QpR0X3x2SagaeATY0eM3dTuK0pD855EzZ/DYscksuWT0HCU4GNk7wrNgAP6eUX
	S0eyPNHLVn7C1x7q7BU3FsJZLzVxxlmFc1YRr+9y/B0RNSa60EkThRoaEMkS67Lr
	ZmS2em9mMBflFFM20V3o7jVjXGEn+2Z3n0knqT+N0Mv8XQDd73ylySDNbTDtqqc3
	7zKzLXrTra0N8QNEyMdB02h4+Nn1dY1KoRx6RTy7sZKP41+nAzFBx9gMEphhJyE5
	gy34gA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rhxuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 12:18:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455CIj0C023354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 12:18:45 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 05:18:40 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v11 6/6] iommu/arm-smmu: add support for PRR bit setup
Date: Wed, 5 Jun 2024 17:47:13 +0530
Message-ID: <20240605121713.3596499-7-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605121713.3596499-1-quic_bibekkum@quicinc.com>
References: <20240605121713.3596499-1-quic_bibekkum@quicinc.com>
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
X-Proofpoint-GUID: H9kiI3ojLHVoDumKSBegJeNiijsiCnmE
X-Proofpoint-ORIG-GUID: H9kiI3ojLHVoDumKSBegJeNiijsiCnmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050093

Add an adreno-smmu-priv interface for drm/msm to call
into arm-smmu-qcom and initiate the PRR bit setup or reset
sequence as per request.

This will be used by GPU side to setup the PRR bit and
related configuration registers through adreno-smmu private
interface instead of directly poking the smmu hardware.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 +++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 include/linux/adreno-smmu-priv.h           |  5 ++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 8dabc26fa10e..2f4ee22f740a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -28,6 +28,7 @@
 #define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
 #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
 #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
+#define GFX_ACTLR_PRR		(1 << 5)

 static const struct actlr_config sc7280_apps_actlr_cfg[] = {
 	{ 0x0800, 0x24e1, PREFETCH_DEFAULT | CMTLB },
@@ -212,6 +213,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
 }

+static void qcom_adreno_smmu_set_actlr_bit(const void *cookie, phys_addr_t page_addr, bool set)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	u32 reg = 0;
+
+	writel_relaxed(lower_32_bits(page_addr),
+				(void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_LADDR);
+
+	writel_relaxed(upper_32_bits(page_addr),
+				(void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_UADDR);
+
+	reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
+	reg |= FIELD_PREP(GFX_ACTLR_PRR, set ? 1 : 0);
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
+
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0

 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -384,6 +404,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	priv->set_actlr_bit = qcom_adreno_smmu_set_actlr_bit;

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
index c637e0997f6d..448e191eeb52 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -49,7 +49,9 @@ struct adreno_smmu_fault_info {
  *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
  *                 the GPU driver must call resume_translation()
  * @resume_translation: Resume translation after a fault
- *
+ * @set_actlr_bits: Extendible interface to be used  by GPU to modify the
+ *		    ACTLR bits, currently used to intitate PRR bit setup or
+ *		    reset sequence for ACTLR registers as requested.
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -67,6 +69,7 @@ struct adreno_smmu_priv {
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
     void (*resume_translation)(const void *cookie, bool terminate);
+    void (*set_actlr_bit)(const void *cookie, phys_addr_t page_addr, bool set);
 };

 #endif /* __ADRENO_SMMU_PRIV_H */
--
2.34.1


