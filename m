Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A083968E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 21:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfHTTGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 15:06:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44874 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbfHTTGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 15:06:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 75F4D60AD1; Tue, 20 Aug 2019 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328001;
        bh=1UIZbPgFC2ctJEOWeJAbywjZiiAfr8vzXYLpIB5v7OE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hVsOsmk+iVnLpa2fRt1XlUtxHblWHSELdvSY/uM/YzqUCMKMHMX9hWy9ZZcfIZN/q
         iuwuhkrRHj+litXJXyHyoCRwGvmCxU8D1GrVcMe/6d92mLVfWHUYjNqLIZ8GfC4hjo
         nWf7YofnKhNH8jdldn3uo4NSnQ5GxosQ+mf/yPRk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B44B9609CD;
        Tue, 20 Aug 2019 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566328000;
        bh=1UIZbPgFC2ctJEOWeJAbywjZiiAfr8vzXYLpIB5v7OE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o1IAC7SyVrQogdJYk2MsetaFKxuFMBwAs2Md+k4On9ZdcXaqg0z6ld8kii6Ihg5jT
         9ruTmkT+qSduy6pO5wmGuhZ2JA1CTurehfZgSrDIRcrrk8QJGaUGPn/G1fTbEvv4dY
         Jhu1nJm71IHwvjk1BPTQUBVCmsfCimIPfx5D8kXA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B44B9609CD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] iommu/arm-smmu: Support split pagetables
Date:   Tue, 20 Aug 2019 13:06:26 -0600
Message-Id: <1566327992-362-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support a split pagetable format for SMMU models that support it. If
enabled, mirror the TTBR0 setup for TTBR1 and program the pagetable
address in TTBR1 instead of TTBR0.

For now only allow split pagetables for ARM64 stage 1 IOMMUs with 49 bit
upstream buses. This is the only real-life use case for split pagetables
on arm-smmu-v2 to date and it is the easiest configuration to support
without a bunch of extra logic.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 41 +++++++++++++++++++++++++++++++++++++----
 drivers/iommu/arm-smmu.h |  1 +
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 49c734a..39e81ef 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -461,7 +461,17 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->tcr[0] = pgtbl_cfg->arm_v7s_cfg.tcr;
 		} else {
 			cb->tcr[0] = pgtbl_cfg->arm_lpae_s1_cfg.tcr;
-			cb->tcr[0] |= TCR_EPD1;
+
+			/*
+			 * For split pagetables, duplicate the T0 configuration
+			 * for T1. Otherwise, disable walks through TTBR1
+			 */
+			if (smmu_domain->split_pagetables)
+				cb->tcr[0] |= (pgtbl_cfg->arm_lpae_s1_cfg.tcr &
+					0xffff) << 16;
+			else
+				cb->tcr[0] |= TCR_EPD1;
+
 			cb->tcr[1] = pgtbl_cfg->arm_lpae_s1_cfg.tcr >> 32;
 			cb->tcr[1] |= FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM);
 			if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
@@ -477,9 +487,16 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
 			cb->ttbr[1] = 0;
 		} else {
-			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+			if (smmu_domain->split_pagetables) {
+				cb->ttbr[0] = 0;
+				cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+			} else {
+				cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+				cb->ttbr[1] = 0;
+			}
+
 			cb->ttbr[0] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
-			cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
+			cb->ttbr[1] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
 		}
 	} else {
 		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
@@ -720,6 +737,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			goto out_unlock;
 	}
 
+	/*
+	 * For now, only support a ias of 48 and SEP_UPSTREAM for split
+	 * pagetables. This doesn't preclude using other sign extension bits but
+	 * since the group of split-pagetable users is very small we don't want
+	 * to add a lot of extra code that won't be useful
+	 */
+	WARN_ON(smmu_domain->split_pagetables && ias != 48);
+
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
 		.ias		= ias,
@@ -740,7 +765,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << ias) - 1;
+
+	if (smmu_domain->split_pagetables) {
+		domain->geometry.aperture_start = ~(1UL << ias);
+		domain->geometry.aperture_end = ~0UL;
+	} else {
+		domain->geometry.aperture_start = 0;
+		domain->geometry.aperture_end = (1UL << ias) - 1;
+	}
+
 	domain->geometry.force_aperture = true;
 
 	/* Initialise the context bank with our page table cfg */
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 7b0e4d2..91a4eb8 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -316,6 +316,7 @@ struct arm_smmu_domain {
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
+	bool				split_pagetables;
 };
 
 
-- 
2.7.4

