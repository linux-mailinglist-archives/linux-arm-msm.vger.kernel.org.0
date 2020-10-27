Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E363829CC02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 23:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1832452AbgJ0WeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 18:34:24 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:14979 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1832446AbgJ0WeY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 18:34:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603838062; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ACXlUBv3MYxWJzcS0H+Piwy+CuE5+ohSeW8DwDiXv7A=; b=pt/uGLiZjOa7KPm75pV+6h/ZIkLKWVN/Y/ljWRFzO3AaXx89Y1WNSMKuJanohErELOh3t4EG
 TUuf662Cha2O0XscnPTFWmLXeXFibEZzErMuP9CI586aChcKwSgHMXcUYPFXGqX7mchY7ZiG
 jR5IhsAC0btlLsNdLBLwI0C05Cg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f98a06eda4f4647733e0f54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 22:34:22
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43164C4339C; Tue, 27 Oct 2020 22:34:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61E49C433FE;
        Tue, 27 Oct 2020 22:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61E49C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v18 1/4] iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
Date:   Tue, 27 Oct 2020 16:34:05 -0600
Message-Id: <20201027223408.469893-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027223408.469893-1-jcrouse@codeaurora.org>
References: <20201027223408.469893-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a special implementation for the SMMU attached to most Adreno GPU
target triggered from the qcom,adreno-smmu compatible string.

The new Adreno SMMU implementation will enable split pagetables
(TTBR1) for the domain attached to the GPU device (SID 0) and
hard code it context bank 0 so the GPU hardware can implement
per-instance pagetables.

Co-developed-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |   3 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 151 ++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |   1 +
 3 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 88f17cc33023..d199b4bff15d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -223,6 +223,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
 		return qcom_smmu_impl_init(smmu);
 
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
+		return qcom_adreno_smmu_impl_init(smmu);
+
 	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
 		smmu->impl = &mrvl_mmu500_impl;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index be4318044f96..1e942eed2dfc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/adreno-smmu-priv.h>
 #include <linux/of_device.h>
 #include <linux/qcom_scm.h>
 
@@ -12,6 +13,134 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
+#define QCOM_ADRENO_SMMU_GPU_SID 0
+
+static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * The GPU will always use SID 0 so that is a handy way to uniquely
+	 * identify it and configure it for per-instance pagetables
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+			return true;
+	}
+
+	return false;
+}
+
+static const struct io_pgtable_cfg *qcom_adreno_smmu_get_ttbr1_cfg(
+		const void *cookie)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct io_pgtable *pgtable =
+		io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
+	return &pgtable->cfg;
+}
+
+/*
+ * Local implementation to configure TTBR0 with the specified pagetable config.
+ * The GPU driver will call this to enable TTBR0 when per-instance pagetables
+ * are active
+ */
+
+static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
+		const struct io_pgtable_cfg *pgtbl_cfg)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+
+	/* The domain must have split pagetables already enabled */
+	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
+		return -EINVAL;
+
+	/* If the pagetable config is NULL, disable TTBR0 */
+	if (!pgtbl_cfg) {
+		/* Do nothing if it is already disabled */
+		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0))
+			return -EINVAL;
+
+		/* Set TCR to the original configuration */
+		cb->tcr[0] = arm_smmu_lpae_tcr(&pgtable->cfg);
+		cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
+	} else {
+		u32 tcr = cb->tcr[0];
+
+		/* Don't call this again if TTBR0 is already enabled */
+		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
+			return -EINVAL;
+
+		tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
+		tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
+
+		cb->tcr[0] = tcr;
+		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
+	}
+
+	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
+
+	return 0;
+}
+
+static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
+					       struct arm_smmu_device *smmu,
+					       struct device *dev, int start)
+{
+	int count;
+
+	/*
+	 * Assign context bank 0 to the GPU device so the GPU hardware can
+	 * switch pagetables
+	 */
+	if (qcom_adreno_smmu_is_gpu_device(dev)) {
+		start = 0;
+		count = 1;
+	} else {
+		start = 1;
+		count = smmu->num_context_banks;
+	}
+
+	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
+}
+
+static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
+{
+	struct adreno_smmu_priv *priv;
+
+	/* Only enable split pagetables for the GPU device (SID 0) */
+	if (!qcom_adreno_smmu_is_gpu_device(dev))
+		return 0;
+
+	/*
+	 * All targets that use the qcom,adreno-smmu compatible string *should*
+	 * be AARCH64 stage 1 but double check because the arm-smmu code assumes
+	 * that is the case when the TTBR1 quirk is enabled
+	 */
+	if ((smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
+	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
+		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
+
+	/*
+	 * Initialize private interface with GPU:
+	 */
+
+	priv = dev_get_drvdata(dev);
+	priv->cookie = smmu_domain;
+	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
+	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
+
+	return 0;
+}
+
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
@@ -65,7 +194,15 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.reset = qcom_smmu500_reset,
 };
 
-struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
+static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
+	.init_context = qcom_adreno_smmu_init_context,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.reset = qcom_smmu500_reset,
+	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+};
+
+static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
+		const struct arm_smmu_impl *impl)
 {
 	struct qcom_smmu *qsmmu;
 
@@ -75,8 +212,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	qsmmu->smmu = *smmu;
 
-	qsmmu->smmu.impl = &qcom_smmu_impl;
+	qsmmu->smmu.impl = impl;
 	devm_kfree(smmu->dev, smmu);
 
 	return &qsmmu->smmu;
 }
+
+struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
+{
+	return qcom_smmu_create(smmu, &qcom_smmu_impl);
+}
+
+struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu)
+{
+	return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
+}
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 1a746476927c..6c5ff9999eae 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -520,6 +520,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
+struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu);
 
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
-- 
2.25.1

