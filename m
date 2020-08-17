Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D2B247988
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgHQWCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729272AbgHQWCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B6CC061389;
        Mon, 17 Aug 2020 15:02:24 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t10so8219396plz.10;
        Mon, 17 Aug 2020 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJBCzjdmyb2nZnzBMd/gov55QLqdNUOfxSOvqrduYU8=;
        b=oBqugco8fIoE4idSbUpFj+/z0IdBYlqYQcw83uXRLy20u+V+tLjSyzE8nOJx4oDpA8
         7AisDZRTvFmjR5lBtgaBHcxhSqGM5IesS2muP8UEUXc5s2xMwiM6InZr6Epkc1GjcywO
         cA5Ko3FS3tSu4dsBDPgWnX6Nz4bNzbk7A3uGaW++vDiIdFXIx71Je9rH3Jv/15UF/pvp
         nUluwDLXoP7oRGg78gR4VmKbLmXQXzuSGoFxB3pV7YC/NQKiv3lnVQHETNtlWGhUebkf
         bmwFSk4Mnj8zAvmnM0cjUhCBZd1w2wOR1J5yZnIgQrHycCND66pntt4b4M7Xs091PcuD
         veUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJBCzjdmyb2nZnzBMd/gov55QLqdNUOfxSOvqrduYU8=;
        b=PXIMoWcjMjtx8qz/zu/uC6hGRPm7nxoybJLln41EfcS+uKK9ESyHnP9Q5amfkOYLvN
         JpWKKNc7QZtWgRtnSPj9frt35GLNn9GwxZXN4eHF7SK6YjLIgu46ioe3z5u2hwRJ0eX1
         5wT7jRMuppnujPvsdMB5SePBU3YRvvcaVlqn+XAvOVfr3iSrTmI+suJc6EiqCP8AwGiG
         LmkkdpF3FgLhRLyQMiaWXwOTQ07X9xpBnx3S2x1GH1kl0VqSKFrdbuGzNUh6BKksBUa9
         H3jeR0YSYoxgbom5l46cGkwQUE0tLjGvHTrmQ69i1k5wUjIJavkJ0EeYFPLf8jQp4HVp
         E+DA==
X-Gm-Message-State: AOAM530f/Opt1R7wh4J4KJujfnRoIqAthmMjWxzSG1fc6dk0tjwXvtYt
        Ds/5fuo4VMG9gl8S6OH6Bf4=
X-Google-Smtp-Source: ABdhPJzUgyCDBEcH5iOeJ+682kObQuqHsBDamrPnOCed/eZJGbsrEmsCvcprPUlWRlzUJI1Ppq/FFA==
X-Received: by 2002:a17:902:a617:: with SMTP id u23mr12152932plq.188.1597701743512;
        Mon, 17 Aug 2020 15:02:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x7sm21657493pfc.209.2020.08.17.15.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:02:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hanna Hawa <hannah@marvell.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/20] iommu/arm-smmu: Prepare for the adreno-smmu implementation
Date:   Mon, 17 Aug 2020 15:01:29 -0700
Message-Id: <20200817220238.603465-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Do a bit of prep work to add the upcoming adreno-smmu implementation.

Add an hook to allow the implementation to choose which context banks
to allocate.

Move some of the common structs to arm-smmu.h in anticipation of them
being used by the implementations and update some of the existing hooks
to pass more information that the implementation will need.

These modifications will be used by the upcoming Adreno SMMU
implementation to identify the GPU device and properly configure it
for pagetable switching.

Co-developed-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 69 ++++++----------------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 51 +++++++++++++++-
 3 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index a9861dcd0884..88f17cc33023 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -69,7 +69,7 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
 }
 
 static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
-		struct io_pgtable_cfg *pgtbl_cfg)
+		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
 	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
 					      struct cavium_smmu, smmu);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 976d43a7f2ff..e63a480d7f71 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -65,41 +65,10 @@ module_param(disable_bypass, bool, S_IRUGO);
 MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
-struct arm_smmu_s2cr {
-	struct iommu_group		*group;
-	int				count;
-	enum arm_smmu_s2cr_type		type;
-	enum arm_smmu_s2cr_privcfg	privcfg;
-	u8				cbndx;
-};
-
 #define s2cr_init_val (struct arm_smmu_s2cr){				\
 	.type = disable_bypass ? S2CR_TYPE_FAULT : S2CR_TYPE_BYPASS,	\
 }
 
-struct arm_smmu_smr {
-	u16				mask;
-	u16				id;
-	bool				valid;
-};
-
-struct arm_smmu_cb {
-	u64				ttbr[2];
-	u32				tcr[2];
-	u32				mair[2];
-	struct arm_smmu_cfg		*cfg;
-};
-
-struct arm_smmu_master_cfg {
-	struct arm_smmu_device		*smmu;
-	s16				smendx[];
-};
-#define INVALID_SMENDX			-1
-#define cfg_smendx(cfg, fw, i) \
-	(i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
-#define for_each_cfg_sme(cfg, fw, i, idx) \
-	for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)
-
 static bool using_legacy_binding, using_generic_binding;
 
 static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
@@ -234,19 +203,6 @@ static int arm_smmu_register_legacy_master(struct device *dev,
 }
 #endif /* CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS */
 
-static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
-{
-	int idx;
-
-	do {
-		idx = find_next_zero_bit(map, end, start);
-		if (idx == end)
-			return -ENOSPC;
-	} while (test_and_set_bit(idx, map));
-
-	return idx;
-}
-
 static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
 {
 	clear_bit(idx, map);
@@ -578,7 +534,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 	}
 }
 
-static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
+void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 {
 	u32 reg;
 	bool stage1;
@@ -665,7 +621,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 }
 
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
-					struct arm_smmu_device *smmu)
+					struct arm_smmu_device *smmu,
+					struct device *dev)
 {
 	int irq, start, ret = 0;
 	unsigned long ias, oas;
@@ -780,10 +737,20 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
+
+	smmu_domain->smmu = smmu;
+
+	if (smmu->impl && smmu->impl->alloc_context_bank)
+		ret = smmu->impl->alloc_context_bank(smmu_domain, dev,
+				start, smmu->num_context_banks);
+	else
+		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
 				      smmu->num_context_banks);
-	if (ret < 0)
+
+	if (ret < 0) {
+		smmu_domain->smmu = NULL;
 		goto out_unlock;
+	}
 
 	cfg->cbndx = ret;
 	if (smmu->version < ARM_SMMU_V2) {
@@ -798,8 +765,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	else
 		cfg->asid = cfg->cbndx;
 
-	smmu_domain->smmu = smmu;
-
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
 		.ias		= ias,
@@ -810,7 +775,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	};
 
 	if (smmu->impl && smmu->impl->init_context) {
-		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
+		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg, dev);
 		if (ret)
 			goto out_clear_smmu;
 	}
@@ -1194,7 +1159,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		return ret;
 
 	/* Ensure that the domain is finalised */
-	ret = arm_smmu_init_domain_context(domain, smmu);
+	ret = arm_smmu_init_domain_context(domain, smmu, dev);
 	if (ret < 0)
 		goto rpm_put;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index f3e456893f28..59ff3fc5c6c8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -256,6 +256,21 @@ enum arm_smmu_implementation {
 	QCOM_SMMUV2,
 };
 
+struct arm_smmu_s2cr {
+	struct iommu_group		*group;
+	int				count;
+	enum arm_smmu_s2cr_type		type;
+	enum arm_smmu_s2cr_privcfg	privcfg;
+	u8				cbndx;
+};
+
+struct arm_smmu_smr {
+	u16				mask;
+	u16				id;
+	bool				valid;
+	bool				pinned;
+};
+
 struct arm_smmu_device {
 	struct device			*dev;
 
@@ -331,6 +346,13 @@ struct arm_smmu_cfg {
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 
+struct arm_smmu_cb {
+	u64				ttbr[2];
+	u32				tcr[2];
+	u32				mair[2];
+	struct arm_smmu_cfg		*cfg;
+};
+
 enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S1 = 0,
 	ARM_SMMU_DOMAIN_S2,
@@ -350,6 +372,11 @@ struct arm_smmu_domain {
 	struct iommu_domain		domain;
 };
 
+struct arm_smmu_master_cfg {
+	struct arm_smmu_device		*smmu;
+	s16				smendx[];
+};
+
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 {
 	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
@@ -400,14 +427,35 @@ struct arm_smmu_impl {
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
 	int (*init_context)(struct arm_smmu_domain *smmu_domain,
-			struct io_pgtable_cfg *cfg);
+			struct io_pgtable_cfg *cfg, struct device *dev);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
 	irqreturn_t (*global_fault)(int irq, void *dev);
 	irqreturn_t (*context_fault)(int irq, void *dev);
+	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
+			struct device *dev, int start, int max);
 };
 
+#define INVALID_SMENDX			-1
+#define cfg_smendx(cfg, fw, i) \
+	(i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
+#define for_each_cfg_sme(cfg, fw, i, idx) \
+	for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)
+
+static inline int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
+{
+	int idx;
+
+	do {
+		idx = find_next_zero_bit(map, end, start);
+		if (idx == end)
+			return -ENOSPC;
+	} while (test_and_set_bit(idx, map));
+
+	return idx;
+}
+
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
 {
 	return smmu->base + (n << smmu->pgshift);
@@ -472,6 +520,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
 
+void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
 #endif /* _ARM_SMMU_H */
-- 
2.26.2

