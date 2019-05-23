Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A785E28B2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387820AbfEWUAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:00:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52662 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387469AbfEWUAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:00:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A672161194; Thu, 23 May 2019 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558641646;
        bh=Z5AcrjFvDwrNkhjxHTpfdZspY00IxihlRtFxpIOo+/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N1f2Y5j7Hd9X/RRuAZY5fTcT2PicJ/d105KEGndy/QAkTnhJiU9VjHX9oZvBurcbQ
         cG5SAhdIrabPWKijjc+sskhY9Z9VEaScZe8gVho9V2ImxZrNmV+MdJ4Pkdaox+jCBY
         +fExgQh9dIZoybrhvbYxel1uabnsXU45QeLkGbZQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83E7860E3E;
        Thu, 23 May 2019 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558641643;
        bh=Z5AcrjFvDwrNkhjxHTpfdZspY00IxihlRtFxpIOo+/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bX2rnrsQ37owVAjPQKqBc5/stuIp4p8eYRSNVAM/2An6D6HFHp4/+F6pchZe722Fg
         10QwE/eRPrVGOfHrQOLPooUPtadMF3+8BT/uoajBbfGDcWNcuBDBkTPcJ5auITBMRj
         yUH2jgT3JbizdNr9VKhAqy/5YP1ayaRlzwdjLRPk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83E7860E3E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:00:40 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     freedreno@lists.freedesktop.org, jean-philippe.brucker@arm.com,
        linux-arm-msm@vger.kernel.org, hoegsberg@google.com,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/15] iommu/arm-smmu: Add split pagetable support for
 arm-smmu-v2
Message-ID: <20190523200040.GA18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, jean-philippe.brucker@arm.com,
        linux-arm-msm@vger.kernel.org, hoegsberg@google.com,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
 <1558455243-32746-4-git-send-email-jcrouse@codeaurora.org>
 <f2b2f524-cd63-7153-c454-0210410d1116@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b2f524-cd63-7153-c454-0210410d1116@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 21, 2019 at 07:18:32PM +0100, Robin Murphy wrote:
> On 21/05/2019 17:13, Jordan Crouse wrote:
> >Add support for a split pagetable (TTBR0/TTBR1) scheme for arm-smmu-v2.
> >If split pagetables are enabled, create a pagetable for TTBR1 and set
> >up the sign extension bit so that all IOVAs with that bit set are mapped
> >and translated from the TTBR1 pagetable.
> >
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> >  drivers/iommu/arm-smmu-regs.h  |  19 +++++
> >  drivers/iommu/arm-smmu.c       | 179 ++++++++++++++++++++++++++++++++++++++---
> >  drivers/iommu/io-pgtable-arm.c |   3 +-
> >  3 files changed, 186 insertions(+), 15 deletions(-)
> >
> >diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu-regs.h
> >index e9132a9..23f27c2 100644
> >--- a/drivers/iommu/arm-smmu-regs.h
> >+++ b/drivers/iommu/arm-smmu-regs.h
> >@@ -195,7 +195,26 @@ enum arm_smmu_s2cr_privcfg {
> >  #define RESUME_RETRY			(0 << 0)
> >  #define RESUME_TERMINATE		(1 << 0)
> >+#define TTBCR_EPD1			(1 << 23)
> >+#define TTBCR_T0SZ_SHIFT		0
> >+#define TTBCR_T1SZ_SHIFT		16
> >+#define TTBCR_IRGN1_SHIFT		24
> >+#define TTBCR_ORGN1_SHIFT		26
> >+#define TTBCR_RGN_WBWA			1
> >+#define TTBCR_SH1_SHIFT			28
> >+#define TTBCR_SH_IS			3
> >+
> >+#define TTBCR_TG1_16K			(1 << 30)
> >+#define TTBCR_TG1_4K			(2 << 30)
> >+#define TTBCR_TG1_64K			(3 << 30)
> >+
> >  #define TTBCR2_SEP_SHIFT		15
> >+#define TTBCR2_SEP_31			(0x0 << TTBCR2_SEP_SHIFT)
> >+#define TTBCR2_SEP_35			(0x1 << TTBCR2_SEP_SHIFT)
> >+#define TTBCR2_SEP_39			(0x2 << TTBCR2_SEP_SHIFT)
> >+#define TTBCR2_SEP_41			(0x3 << TTBCR2_SEP_SHIFT)
> >+#define TTBCR2_SEP_43			(0x4 << TTBCR2_SEP_SHIFT)
> >+#define TTBCR2_SEP_47			(0x5 << TTBCR2_SEP_SHIFT)
> >  #define TTBCR2_SEP_UPSTREAM		(0x7 << TTBCR2_SEP_SHIFT)
> >  #define TTBCR2_AS			(1 << 4)
> >diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> >index a795ada..e09c0e6 100644
> >--- a/drivers/iommu/arm-smmu.c
> >+++ b/drivers/iommu/arm-smmu.c
> >@@ -152,6 +152,7 @@ struct arm_smmu_cb {
> >  	u32				tcr[2];
> >  	u32				mair[2];
> >  	struct arm_smmu_cfg		*cfg;
> >+	unsigned long			split_table_mask;
> >  };
> >  struct arm_smmu_master_cfg {
> >@@ -253,13 +254,14 @@ enum arm_smmu_domain_stage {
> >  struct arm_smmu_domain {
> >  	struct arm_smmu_device		*smmu;
> >-	struct io_pgtable_ops		*pgtbl_ops;
> >+	struct io_pgtable_ops		*pgtbl_ops[2];
> 
> This seems a bit off - surely the primary domain and aux domain only ever
> need one set of tables each, but either way there's definitely unnecessary
> redundancy in having four sets of io_pgtable_ops between them.
> 
> >  	const struct iommu_gather_ops	*tlb_ops;
> >  	struct arm_smmu_cfg		cfg;
> >  	enum arm_smmu_domain_stage	stage;
> >  	bool				non_strict;
> >  	struct mutex			init_mutex; /* Protects smmu pointer */
> >  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> >+	u32 attributes;
> >  	struct iommu_domain		domain;
> >  };
> >@@ -621,6 +623,85 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
> >  	return IRQ_HANDLED;
> >  }
> >+/* Adjust the context bank settings to support TTBR1 */
> >+static void arm_smmu_init_ttbr1(struct arm_smmu_domain *smmu_domain,
> >+		struct io_pgtable_cfg *pgtbl_cfg)
> >+{
> >+	struct arm_smmu_device *smmu = smmu_domain->smmu;
> >+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> >+	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> >+	int pgsize = 1 << __ffs(pgtbl_cfg->pgsize_bitmap);
> >+
> >+	/* Enable speculative walks through the TTBR1 */
> >+	cb->tcr[0] &= ~TTBCR_EPD1;
> >+
> >+	cb->tcr[0] |= TTBCR_SH_IS << TTBCR_SH1_SHIFT;
> >+	cb->tcr[0] |= TTBCR_RGN_WBWA << TTBCR_IRGN1_SHIFT;
> >+	cb->tcr[0] |= TTBCR_RGN_WBWA << TTBCR_ORGN1_SHIFT;
> >+
> >+	switch (pgsize) {
> >+	case SZ_4K:
> >+		cb->tcr[0] |= TTBCR_TG1_4K;
> >+		break;
> >+	case SZ_16K:
> >+		cb->tcr[0] |= TTBCR_TG1_16K;
> >+		break;
> >+	case SZ_64K:
> >+		cb->tcr[0] |= TTBCR_TG1_64K;
> >+		break;
> >+	}
> >+
> >+	/*
> >+	 * Outside of the special 49 bit UBS case that has a dedicated sign
> >+	 * extension bit, setting the SEP for any other va_size will force us to
> >+	 * shrink the size of the T0/T1 regions by one bit to accommodate the
> >+	 * SEP
> >+	 */
> >+	if (smmu->va_size != 48) {
> >+		/* Replace the T0 size */
> >+		cb->tcr[0] &= ~(0x3f << TTBCR_T0SZ_SHIFT);
> >+		cb->tcr[0] |= (64ULL - smmu->va_size - 1) << TTBCR_T0SZ_SHIFT;
> >+		/* Set the T1 size */
> >+		cb->tcr[0] |= (64ULL - smmu->va_size - 1) << TTBCR_T1SZ_SHIFT;
> >+	} else {
> >+		/* Set the T1 size to the full available UBS */
> >+		cb->tcr[0] |= (64ULL - smmu->va_size) << TTBCR_T1SZ_SHIFT;
> >+	}
> >+
> >+	/* Clear the existing SEP configuration */
> >+	cb->tcr[1] &= ~TTBCR2_SEP_UPSTREAM;
> >+
> >+	/* Set up the sign extend bit */
> >+	switch (smmu->va_size) {
> >+	case 32:
> >+		cb->tcr[1] |= TTBCR2_SEP_31;
> >+		cb->split_table_mask = (1UL << 31);
> >+		break;
> >+	case 36:
> >+		cb->tcr[1] |= TTBCR2_SEP_35;
> >+		cb->split_table_mask = (1UL << 35);
> >+		break;
> >+	case 40:
> >+		cb->tcr[1] |= TTBCR2_SEP_39;
> >+		cb->split_table_mask = (1UL << 39);
> >+		break;
> >+	case 42:
> >+		cb->tcr[1] |= TTBCR2_SEP_41;
> >+		cb->split_table_mask = (1UL << 41);
> >+		break;
> >+	case 44:
> >+		cb->tcr[1] |= TTBCR2_SEP_43;
> >+		cb->split_table_mask = (1UL << 43);
> >+		break;
> >+	case 48:
> >+		cb->tcr[1] |= TTBCR2_SEP_UPSTREAM;
> >+		cb->split_table_mask = (1UL << 48);
> >+	}
> >+
> >+	cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
> 
> Assigning a "TTBR0" to a "TTBR1" is the point at which it becomes clear that
> we need to take a step back and reconsider. I think there was originally a
> half-formed idea that pagetables might go around in pairs, but things really
> aren't working out that way in practice, so it's almost certainly time to
> rework the io_pgatble_alloc() interface. We probably want to make "TTBR1" an
> up-front option for the appropriate formats, such that either way they
> return a single TTBR value plus a TCR with the appropriate half configured
> (hopefully in such a way that the caller can simply allocate one of each and
> merge the two TCRs together, so maybe responsibility for EPD* needs to
> move). That way we can also make *better* use of the IOVA sanity-checking in
> io-pgtable-arm, rather than just removing it (especially since this will
> open up a whole new class of "unmapping a TTBR0 address from the TTBR1
> domain" type bugs).

I'm kind of having trouble wrapping my brain around what an API like this would
look like, so please bear with me.

The current patch does three things in the arm-smmu driver: it creates a
secondary pagetable in the same manner as the first one (with the same
parameters), updates the context bank registers and makes a decision at
map/unmap time as to which pagetable ops pointer to use.

If I understand you correctly I think you are saying that we would like to move
the register specific details into the io_pgtable code and get rid of the
function quoted above. It also sounds like you may want to use separate
pagetable ops for mapping ttbr0 and ttbr1 to allow for better sanity checking.

I'm still not quite sure how the pagetable allocation will work in this case.
The biggest downside is that we need to possibly adjust T0SZ in a split table
situation to account for the SEP and both T0SZ and T1SZ live in tcr[0] so if we
stick with individual allocation functions struct io_pgtable_cfg would have to
be an accumulator of sorts, passed first for TTBR0 and the again for TTBR1 which
may modify the value of tcr[0] (or OR the two values together and hope
they don't conflict).

To me this kind of defeats the purpose of calling the allocator twice. It feels
cleaner if we called it once with the advanced knowledge that we are going to
use TTBR1 and then return the pagetable addresses in .ttbr[0] and .ttbr[1] as
above. We could make a new format type that incorporates TTBR1 and then we
wouldn't have to change struct io_ptgable_cfg or the API call.

This could also have the advantage of moving the mask check out of the arm-smmu
map/unmap functions and moving it to special TTBR1 ops in the io pgtable that
could find the right pagetable  to write to as well as do the appropriate sanity
checks.

I'm kind of shooting from the hip here so feel free to let me know I'm being
silly. I really want to get this moving forward so any reasonable ideas will be
welcome.

> Robin.

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
