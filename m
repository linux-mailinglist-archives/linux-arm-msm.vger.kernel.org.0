Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD4A20B9B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 22:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgFZUBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 16:01:48 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:35854 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726145AbgFZUBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 16:01:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593201707; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=naAH2m3N9pLIO554OGP+dHktZaLd2az4xmsEv+R18P4=; b=GjPURwwwrEDHmWSveENlyN5wimKOoy3fWQ43+H2u8Z+lYrjCTW3IPnY+dNteLbDuBMldIAXi
 01ocU0fLR8rACR9cV+usVRS5qvzbWrg/bQoMOneDtGQ8UgO6VLwzhFIokcJujQ/zLTEOboPQ
 hojYA+AEwN5Huzan/LhmHlv3TWg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5ef653f8f3deea03f3e41065 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 20:00:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4CAE9C433AD; Fri, 26 Jun 2020 20:00:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72C2DC433C8;
        Fri, 26 Jun 2020 20:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72C2DC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/7] iommu/arm-smmu: Add implementation for the adreno GPU SMMU
Date:   Fri, 26 Jun 2020 14:00:39 -0600
Message-Id: <20200626200042.13713-6-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626200042.13713-1-jcrouse@codeaurora.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a special implementation for the SMMU attached to most Adreno GPU
target triggered from the qcom,adreno-gpu-smmu compatible string. When
selected the driver will attempt to enable split pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-impl.c |  3 +++
 drivers/iommu/arm-smmu-qcom.c | 45 +++++++++++++++++++++++++++++++++--
 drivers/iommu/arm-smmu.h      |  1 +
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index a20e426d81ac..309675cf6699 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -176,5 +176,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
 		return qcom_smmu_impl_init(smmu);
 
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
+		return qcom_adreno_smmu_impl_init(smmu);
+
 	return smmu;
 }
diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index cf01d0215a39..3248d44ec6d5 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -12,6 +12,29 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
+static bool qcom_adreno_smmu_is_gpu_device(struct arm_smmu_domain *smmu_domain)
+{
+	return of_device_is_compatible(smmu_domain->dev->of_node, "qcom,adreno");
+}
+
+static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
+{
+	/* TTBR1 is only for the GPU stream ID and not the GMU */
+	if (!qcom_adreno_smmu_is_gpu_device(smmu_domain))
+		return 0;
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
 static const struct of_device_id qcom_smmu_client_of_match[] = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
@@ -65,7 +88,15 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.reset = qcom_smmu500_reset,
 };
 
-struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
+static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
+	.init_context = qcom_adreno_smmu_init_context,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.reset = qcom_smmu500_reset,
+};
+
+
+static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
+		const struct arm_smmu_impl *impl)
 {
 	struct qcom_smmu *qsmmu;
 
@@ -75,8 +106,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 
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
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d33cfe26b2f5..c417814f1d98 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -466,6 +466,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
+struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu);
 
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
-- 
2.17.1

