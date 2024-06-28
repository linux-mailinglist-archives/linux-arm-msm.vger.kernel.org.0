Return-Path: <linux-arm-msm+bounces-24636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3836691C05B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AFA5B22697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69F41C0DD0;
	Fri, 28 Jun 2024 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cbN6NvOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B111C0DCE;
	Fri, 28 Jun 2024 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583553; cv=none; b=RXPWh8/Uxb3aI35NcjB78mlWMzIs09neMcF3s+CWnetJy77g/ik6E7WVrHlA471bsPpIOiuXslXM0WkDSMXBVXwPcQ1gzj0JiRx9VrgK2JIPF2oJ+swgak0Bzl48fq/LAVYeLQEcXD1YTvFj90QtiIwwcnuliru5354jDWygobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583553; c=relaxed/simple;
	bh=QGSH8V4RvJlCy3w6Zuc/aUasGLXwb8JkGHWdq4QFWx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USUIPfNtHdamKDzOqG7qvmvqPAsXvBe/4FRIcG5BVDhDACxkTDf2BWfQd7AzsvmsOEb9AKRZBh0Q1YJCqcg2B7EdukP7NzdSWVnSl1WRW9pKfcmCc1h1i3mAFIJtKKZaxQjmM0AbyodYwKQJnD/GS2Hz4QJZnn1pc3V7kvyxBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cbN6NvOf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8tKe8018792;
	Fri, 28 Jun 2024 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpydeMZELdyr8PpODF/A+z0fJv3G/zqKi8bM1SNf3Fg=; b=cbN6NvOfBg/4gaXT
	J7KpwEeUodWMcFuMWvqPZfSeSX85iX/p4GgxTiMrtRsO+CuHhvwcecu/rZyBsVCz
	o0l8N9WLwBIr1dDW22ajIdgdvlAgHirWArvODdaPoP6eUK0xLr7/AWToWI/4XYmM
	zlP2mkb2GRS1VDB7ou3rqsrr3P/wt38FqryaZTUuPx/DVgxrO4co/0LIYj1hsG6Q
	ZyxCPOpBFE5RMNme0QXC29BPvzknZVW/x0EZPq5oK+FKOQeAqKz5gk5v/kZOtgys
	x8WZn/3ybd89KxBt+6q76QV7rXUtN7Rfqj1iJ886GqI11SZJCM46xAd16CpxJlm2
	3kztHQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90q4jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:05:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SE5afD017187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:05:36 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 07:05:31 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v13 3/6] iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
Date: Fri, 28 Jun 2024 19:34:32 +0530
Message-ID: <20240628140435.1652374-4-quic_bibekkum@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YsiCyxZUfX4MGhqliuX8HCljvd7eJfB9
X-Proofpoint-GUID: YsiCyxZUfX4MGhqliuX8HCljvd7eJfB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_10,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280105

Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
the TLB to fetch just the next page table. MMU-500 features ACTLR
register which is implementation defined and is used for Qualcomm SoCs
to have a custom prefetch setting enabling TLB to prefetch the next set
of page tables accordingly allowing for faster translations.

ACTLR value is unique for each SMR (Stream matching register) and stored
in a pre-populated table. This value is set to the register during
context bank initialisation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 61 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h | 16 +++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 ++
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573c4c9886f1..77c9abffe07d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -215,10 +215,42 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
 	return true;
 }

+static void qcom_smmu_set_actlr(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
+		const struct actlr_config *actlrcfg, const size_t num_actlrcfg)
+{
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_smr *smr;
+	u16 mask;
+	int idx;
+	u16 id;
+	int i;
+	int j;
+
+	for (i = 0; i < num_actlrcfg; i++) {
+		id = actlrcfg[i].sid;
+		mask = actlrcfg[i].mask;
+
+		for_each_cfg_sme(cfg, fwspec, j, idx) {
+			smr = &smmu->smrs[idx];
+			if (smr_is_subset(smr, id, mask)) {
+				arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
+						actlrcfg[i].actlr);
+				break;
+			}
+		}
+	}
+}
+
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	const struct actlr_variant *actlrvar;
+	int cbndx = smmu_domain->cfg.cbndx;
 	struct adreno_smmu_priv *priv;
+	int i;

 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;

@@ -248,6 +280,18 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->resume_translation = qcom_adreno_smmu_resume_translation;

+	actlrvar = qsmmu->data->actlrvar;
+	if (!actlrvar)
+		return 0;
+
+	for (i = 0; i < qsmmu->data->num_smmu ; i++) {
+		if (actlrvar[i].io_start == smmu->ioaddr) {
+			qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar[i].actlrcfg,
+				       actlrvar[i].num_actlrcfg);
+			break;
+		}
+	}
+
 	return 0;
 }

@@ -277,7 +321,24 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	const struct actlr_variant *actlrvar;
+	int cbndx = smmu_domain->cfg.cbndx;
+	int i;
+
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
+	actlrvar = qsmmu->data->actlrvar;
+	if (!actlrvar)
+		return 0;
+
+	for (i = 0; i < qsmmu->data->num_smmu ; i++) {
+		if (actlrvar[i].io_start == smmu->ioaddr) {
+			qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar[i].actlrcfg,
+				       actlrvar[i].num_actlrcfg);
+			break;
+		}
+	}

 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index addc07623c0b..c51817ff4674 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  */

 #ifndef _ARM_SMMU_QCOM_H
@@ -24,8 +24,22 @@ struct qcom_smmu_config {
 	const u32 *reg_offset;
 };

+struct actlr_config {
+	u16 sid;
+	u16 mask;
+	u32 actlr;
+};
+
+struct actlr_variant {
+	const resource_size_t io_start;
+	const struct actlr_config * const actlrcfg;
+	const size_t num_actlrcfg;
+};
+
 struct qcom_smmu_match_data {
+	const struct actlr_variant * const actlrvar;
 	const struct qcom_smmu_config *cfg;
+	const size_t num_smmu;
 	const struct arm_smmu_impl *impl;
 	const struct arm_smmu_impl *adreno_impl;
 };
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 87c81f75cf84..f43d417bf7f6 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1003,9 +1003,10 @@ static int arm_smmu_find_sme(struct arm_smmu_device *smmu, u16 id, u16 mask)
 		 * expect simply identical entries for this case, but there's
 		 * no harm in accommodating the generalisation.
 		 */
-		if ((mask & smrs[i].mask) == mask &&
-		    !((id ^ smrs[i].id) & ~smrs[i].mask))
+
+		if (smr_is_subset(&smrs[i], id, mask))
 			return i;
+
 		/*
 		 * If the new entry has any other overlap with an existing one,
 		 * though, then there always exists at least one stream ID
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 4765c6945c34..d9c2ef8c1653 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -503,6 +503,11 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 		writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
 }

+static inline bool smr_is_subset(struct arm_smmu_smr *smrs, u16 id, u16 mask)
+{
+	return (mask & smrs->mask) == mask && !((id ^ smrs->id) & ~smrs->mask);
+}
+
 #define ARM_SMMU_GR0		0
 #define ARM_SMMU_GR1		1
 #define ARM_SMMU_CB(s, n)	((s)->numpage + (n))
--
2.34.1


