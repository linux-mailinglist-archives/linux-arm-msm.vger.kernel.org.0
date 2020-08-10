Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E1B241320
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 00:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgHJW1w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 18:27:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43034 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727794AbgHJW1v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 18:27:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597098470; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=luFjlnOjyWOq8Y2pNHotM6G2poKKOZibPxqXcVoTZhI=; b=aeIj/qT7ZwITy0qwHtnXPQOX65j+q+JQ3g/giFuGKl5KUiO/nlsC9otEsM6S3oaZWunii6H+
 xe9DGDKgSPiPfkGm0+VPjPuIjH5BHSK50guYEyqnN7gX6fOb51h5Uu8RmN8rl0af1pwIZPZX
 JTUnYSOTzN/O/4BEO2FKSNnq140=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f31c9e63f2ce110209da998 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 22:27:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B0A1C4344F; Mon, 10 Aug 2020 22:27:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38B0EC4345B;
        Mon, 10 Aug 2020 22:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38B0EC4345B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thierry Reding <treding@nvidia.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC v12 13/13] iommu/arm-smmu: Add a init_context_bank implementation hook
Date:   Mon, 10 Aug 2020 16:26:57 -0600
Message-Id: <20200810222657.1841322-14-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new implementation hook to allow the implementation specific code
to tweek the context bank configuration just before it gets written.
The first user will be the Adreno GPU implementation to turn on
SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
transactions. Doing so could hang the GPU if one of the terminated
transactions is a CP read.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 16 ++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 21 +++++++++++++--------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 3be10145bf57..baa026ddca1c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -34,6 +34,19 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	return false;
 }
 
+#define QCOM_ADRENO_SMMU_GPU 1
+
+static void qcom_adreno_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
+		struct arm_smmu_cb *cb)
+{
+	/*
+	 * On the GPU device we want to process subsequent transactions after a
+	 * fault to keep the GPU from hanging
+	 */
+	if (cb->cfg->priv == QCOM_ADRENO_SMMU_GPU)
+		cb->sctlr |= ARM_SMMU_SCTLR_HUPCF;
+}
+
 /*
  * Local implementation to configure TTBR0 with the specified pagetable config.
  * The GPU driver will call this to enable TTBR0 when per-instance pagetables
@@ -120,6 +133,7 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 		count = 1;
 	} else {
 		start = 1;
+		smmu_domain->cfg.priv = QCOM_ADRENO_SMMU_GPU;
 	}
 
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
@@ -141,6 +155,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
 		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 
+
 	return 0;
 }
 
@@ -204,6 +219,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.domain_set_attr = qcom_adreno_smmu_domain_set_attr,
 	.domain_get_attr = qcom_adreno_smmu_domain_get_attr,
+	.init_context_bank = qcom_adreno_smmu_init_context_bank,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index e0a3e0da885b..6225649bbfef 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -532,6 +532,18 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair >> 32;
 		}
 	}
+
+	cb->sctlr = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
+		ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
+
+	if (stage1)
+		cb->sctlr |= ARM_SMMU_SCTLR_S1_ASIDPNE;
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		cb->sctlr |= ARM_SMMU_SCTLR_E;
+
+	/* Give the implementation a chance to adjust the configuration */
+	if (smmu_domain->smmu->impl && smmu_domain->smmu->impl->init_context_bank)
+		smmu_domain->smmu->impl->init_context_bank(smmu_domain, cb);
 }
 
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
@@ -610,14 +622,7 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	}
 
 	/* SCTLR */
-	reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
-	      ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
-	if (stage1)
-		reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-		reg |= ARM_SMMU_SCTLR_E;
-
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, cb->sctlr);
 }
 
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 870f0fd060a5..e84b8da8b93b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -143,6 +143,7 @@ enum arm_smmu_cbar_type {
 
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
 #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
 #define ARM_SMMU_SCTLR_CFIE		BIT(6)
 #define ARM_SMMU_SCTLR_CFRE		BIT(5)
@@ -343,6 +344,7 @@ struct arm_smmu_cfg {
 	};
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
+	unsigned long			priv;
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 
@@ -350,6 +352,7 @@ struct arm_smmu_cb {
 	u64				ttbr[2];
 	u32				tcr[2];
 	u32				mair[2];
+	u32				sctlr;
 	struct arm_smmu_cfg		*cfg;
 };
 
@@ -439,6 +442,8 @@ struct arm_smmu_impl {
 			enum iommu_attr attr, void *data);
 	int (*domain_set_attr)(struct arm_smmu_domain *smmu_domain,
 			enum iommu_attr attr, void *data);
+	void (*init_context_bank)(struct arm_smmu_domain *smmu_domain,
+			struct arm_smmu_cb *cb);
 };
 
 #define INVALID_SMENDX			-1
-- 
2.25.1

