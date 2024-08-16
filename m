Return-Path: <linux-arm-msm+bounces-28829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA73955033
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 19:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A2E1C2254C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ED31C37AB;
	Fri, 16 Aug 2024 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CF2OG1n5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B41C4630;
	Fri, 16 Aug 2024 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830254; cv=none; b=R414kCGyTwV+59ohumLz9hwhBdSEVNAg8cp0tRwoJFvEeRY1tEuglf0VDtQ5M4Ra5+jjFOyTdNZ1PNnob1kWgX5HDbupgoiMUipyC6GGsRFhsAz1ueH+BrRxwukgEDvOpZdt3Ks+R36XZ5R0OL8IdmfNe27sYF2AJoZdlKx+Xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830254; c=relaxed/simple;
	bh=Q34VrfGuWOEyEgQGZ89pTSn7gByo50xHoSSOmEvrPk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CT6+4aARaJfUiXydcEjpTqDpnliu+ZD4IuKjlxE6faZTRj2jsk+3scjHkJtNxXrD10DlXWnJNyiW5edly+3n2loYIkNx2woaZGr1yHFbWYg/X5WJp3EIRRJX/evJQUNftCFclDVc8rAzUdbUbXILI0HYypHOW2BuHZMKW6QWVYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CF2OG1n5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G8NEUQ020655;
	Fri, 16 Aug 2024 17:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgrActngNPtMVns1AP4MwyVoxN4UueOaGf4POtohag4=; b=CF2OG1n5xiFx6ARY
	ylVtVS1qscUGqp4EsfSt944iRit3MtVTTN1tg0Yv6zOumCqucMzDNobT5OlQ9LfK
	3pl88C0Zy+8zvOLnmU/QLjbD/fO+BIAW5w7YC08c8f+hqMuNcX9szuliMlrZN3Rl
	vUimDhDWI6X18UN7xK3gSVsmjp0/HK4hjTH2+8+dPG1ecWgcaDJ21/QVEw5OQGL0
	PDgKr5oUh3oTZ995CaRmwI73oZ6cKSadxxEUbJTWTpKV/NS+SJde1kA1DTJLb170
	k17Ll+/edpFH0yM2HWDw8d6IGo9F2FVWbk4pb18s/IAqoIk1NzHikJrIRJgP+JZ2
	HRQlSw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412373sd7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:43:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GHhvbp012785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:43:57 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 10:43:52 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v14 6/6] iommu/arm-smmu: add support for PRR bit setup
Date: Fri, 16 Aug 2024 23:12:59 +0530
Message-ID: <20240816174259.2056829-7-quic_bibekkum@quicinc.com>
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
X-Proofpoint-GUID: egz9A8xXRCxAmUlaFQJ_qTEx_u_gbgB7
X-Proofpoint-ORIG-GUID: egz9A8xXRCxAmUlaFQJ_qTEx_u_gbgB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_12,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160123

Add an adreno-smmu-priv interface for drm/msm to call
into arm-smmu-qcom and initiate the PRR bit setup or reset
sequence as per request.

This will be used by GPU to setup the PRR bit and related
configuration registers through adreno-smmu private
interface instead of directly poking the smmu hardware.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 include/linux/adreno-smmu-priv.h           | 10 +++++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a776c7906c76..f62e20d472d3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -30,6 +30,7 @@
 #define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
 #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
 #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
+#define GFX_ACTLR_PRR		(1 << 5)

 static const struct actlr_config sc7280_apps_actlr_cfg[] = {
 	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
@@ -237,6 +238,40 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
 }

+static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	const struct device_node *np = smmu->dev->of_node;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	u32 reg = 0;
+
+	if (of_device_is_compatible(np, "qcom,smmu-500") &&
+			of_device_is_compatible(np, "qcom,adreno-smmu")) {
+		reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
+		reg &= ~GFX_ACTLR_PRR;
+		if (set)
+			reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
+	}
+}
+
+static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	const struct device_node *np = smmu->dev->of_node;
+
+	if (of_device_is_compatible(np, "qcom,smmu-500") &&
+			of_device_is_compatible(np, "qcom,adreno-smmu")) {
+		writel_relaxed(lower_32_bits(page_addr),
+					(void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_LADDR);
+
+		writel_relaxed(upper_32_bits(page_addr),
+					(void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_UADDR);
+	}
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0

 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -410,6 +445,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
+	priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;

 	actlrvar = qsmmu->data->actlrvar;
 	if (!actlrvar)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 172f1b56b879..b3f5ff1ebb8d 100644
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
index c637e0997f6d..03466eb16933 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -49,7 +49,13 @@ struct adreno_smmu_fault_info {
  *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
  *                 the GPU driver must call resume_translation()
  * @resume_translation: Resume translation after a fault
- *
+ * @set_prr_bit:   Extendible interface to be used by GPU to modify the
+ *		   ACTLR register bits, currently used to configure
+ *		   Partially-Resident-Region (PRR) bit for feature's
+ *		   setup and reset sequence as requested.
+ * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
+ *		   physical address of PRR page passed from
+ *		   GPU driver.
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -67,6 +73,8 @@ struct adreno_smmu_priv {
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
     void (*resume_translation)(const void *cookie, bool terminate);
+    void (*set_prr_bit)(const void *cookie, bool set);
+    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
 };

 #endif /* __ADRENO_SMMU_PRIV_H */
--
2.34.1


