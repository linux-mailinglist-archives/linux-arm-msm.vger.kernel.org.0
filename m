Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDE0241310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 00:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgHJW1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 18:27:25 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:33822 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727014AbgHJW1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 18:27:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597098441; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tUOKbiUcS+3hxjUOj9tzpqSCBTSozznJNryL8WPj6SE=; b=ErBkxXA4C9mL9lNbT44uVkuTuzCT9tX7oqskUQqaPCUV6CuF1TM1/JYlK6FWDEklShcj2qEu
 mtPR6VMnccNv9+hOqb0u7usdiROZ6rFTH/RXE2NY/mCg2qwLJaCZupYuBhL1m4KQW8pBJ9eG
 EWOaVNG6jIIjWLE3RX6WGfHs+mw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f31c9c84c787f237b10106c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 22:27:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DDB5FC433C6; Mon, 10 Aug 2020 22:27:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A793C433A0;
        Mon, 10 Aug 2020 22:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A793C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 05/13] iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
Date:   Mon, 10 Aug 2020 16:26:49 -0600
Message-Id: <20200810222657.1841322-6-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a special implementation for the SMMU attached to most Adreno GPU
target triggered from the qcom,adreno-smmu compatible string.

The new Adreno SMMU implementation will enable split pagetables
(TTBR1) for the domain attached to the GPU device (SID 0) and
hard code it context bank 0 so the GPU hardware can implement
per-instance pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |   3 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 156 ++++++++++++++++++++-
 2 files changed, 157 insertions(+), 2 deletions(-)

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
index be4318044f96..3be10145bf57 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -12,6 +12,138 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
+#define QCOM_ADRENO_SMMU_GPU_SID 0
+
+static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	int idx, i;
+
+	/*
+	 * The GPU will always use SID 0 so that is a handy way to uniquely
+	 * identify it and configure it for per-instance pagetables
+	 */
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * Local implementation to configure TTBR0 with the specified pagetable config.
+ * The GPU driver will call this to enable TTBR0 when per-instance pagetables
+ * are active
+ */
+static int qcom_adreno_smmu_set_pgtable_cfg(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
+{
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
+	return 0;
+}
+
+static int qcom_adreno_smmu_domain_get_attr(struct arm_smmu_domain *smmu_domain,
+		enum iommu_attr attr, void *data)
+{
+	struct io_pgtable *pgtable;
+	struct io_pgtable_cfg *dest = data;
+
+	if (attr == DOMAIN_ATTR_PGTABLE_CFG) {
+
+		if (!smmu_domain->pgtbl_ops)
+			return -ENODEV;
+
+		pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
+		memcpy(dest, &pgtable->cfg, sizeof(*dest));
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+static int qcom_adreno_smmu_domain_set_attr(struct arm_smmu_domain *smmu_domain,
+		enum iommu_attr attr, void *data)
+{
+	if (attr == DOMAIN_ATTR_PGTABLE_CFG)
+		return qcom_adreno_smmu_set_pgtable_cfg(smmu_domain, data);
+
+	return -ENODEV;
+}
+
+static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
+		struct device *dev, int start, int count)
+{
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
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
+	}
+
+	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
+}
+
+static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
+{
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
+	return 0;
+}
+
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
@@ -65,7 +197,17 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.reset = qcom_smmu500_reset,
 };
 
-struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
+static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
+	.init_context = qcom_adreno_smmu_init_context,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.reset = qcom_smmu500_reset,
+	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+	.domain_set_attr = qcom_adreno_smmu_domain_set_attr,
+	.domain_get_attr = qcom_adreno_smmu_domain_get_attr,
+};
+
+static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
+		const struct arm_smmu_impl *impl)
 {
 	struct qcom_smmu *qsmmu;
 
@@ -75,8 +217,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 
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
-- 
2.25.1

