Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3EF54E0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 13:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731299AbfFYL4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 07:56:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfFYL4x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 07:56:53 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46EE3214DA;
        Tue, 25 Jun 2019 11:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561463811;
        bh=4pgnpx/fvE/UxGAd4e8raS3xLty+N/evA6nbzvo1QPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iqPdjIMfWjlQAMU8mSxYeyshLvYtLohzT6HDUE2plVElRE3/d9bc7VtGaZfiqWJqP
         VfFhcK7Zxn4BhEybY0uglGZi8TdjwyWlbxU9GxIz0B9Tcym+YxS6UBh6iiAsM6st9o
         ibAjtXouS/WAzFt9sRpwtLGGxft/WLJNWk4ssEHk=
Date:   Tue, 25 Jun 2019 12:56:47 +0100
From:   Will Deacon <will@kernel.org>
To:     Will Deacon <will.deacon@arm.com>, bjorn.andersson@linaro.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Vivek Gautam <vgautam@qti.qualcomm.com>
Subject: Re: [PATCH] iommu: io-pgtable: Support non-coherent page tables
Message-ID: <20190625115646.pgsuhz6dza5bsa6q@willie-the-truck>
References: <20190515233234.22990-1-bjorn.andersson@linaro.org>
 <20190618173929.GG4270@fuggles.cambridge.arm.com>
 <20190624115349.f62uqypyt7l73skf@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624115349.f62uqypyt7l73skf@willie-the-truck>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 24, 2019 at 12:53:49PM +0100, Will Deacon wrote:
> On Tue, Jun 18, 2019 at 06:39:33PM +0100, Will Deacon wrote:
> > On Wed, May 15, 2019 at 04:32:34PM -0700, Bjorn Andersson wrote:
> > > Describe the memory related to page table walks as non-cachable for iommu
> > > instances that are not DMA coherent.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/iommu/io-pgtable-arm.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > > index 4e21efbc4459..68ff22ffd2cb 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -803,9 +803,15 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
> > >  		return NULL;
> > >  
> > >  	/* TCR */
> > > -	reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> > > -	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> > > -	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> > > +	if (cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA) {
> > > +		reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> > > +		      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> > > +		      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> > > +	} else {
> > > +		reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> > 
> > Nit: this should be outer-shareable (ARM_LPAE_TCR_SH_OS).
> > 
> > > +		      (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_IRGN0_SHIFT) |
> > > +		      (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_ORGN0_SHIFT);
> > > +	}
> > 
> > Should we also be doing something similar for the short-descriptor code
> > in io-pgtable-arm-v7s.c? Looks like you just need to use ARM_V7S_RGN_NC
> > instead of ARM_V7S_RGN_WBWA when initialising ttbr0 for non-coherent
> > SMMUs.
> 
> Do you plan to respin this? I'll need it this week if you're shooting for
> 5.3.

I started having a crack at this myself, but in doing so I realised that
using IO_PGTABLE_QUIRK_NO_DMA for this isn't quite right based on its
current description. When that flag is set, we can rely on the page-table walker
being coherent, but I don't think it works the other way around: you can't
rely on the flag being clear meaning that the page-table walker is not
coherent.

Ideally, we'd use something like is_device_dma_coherent, but that's a Xen
thing and it doesn't look reliable for the IOMMU.

Looking at the users of io-pgtable, we have:

panfrost_mmu.c	- I can't see where the page-table even gets installed...
arm-smmu.c	- IO_PGTABLE_QUIRK_NO_DMA is reliable
arm-smmu-v3.c	- IO_PGTABLE_QUIRK_NO_DMA is reliable
ipmmu-vmsa.c	- Always sets TTBCR as cacheable (ignores tcr)
msm_iommu.c	- Always non-coherent
mtk_iommu.c	- Ignores tcr
qcom_iommu.c	- Always non-coherent

so we could go ahead and change IO_PGTABLE_QUIRK_NO_DMA to do what you want
without breaking any drivers. In any case, the driver is free to override
the control register if it knows better, as seems to be the case for some
of these already.

See patch below. I'll rework your patch on top.

Will

--->8

From 4f41845b340783eaec9cc2840fe3cb9a00574054 Mon Sep 17 00:00:00 2001
From: Will Deacon <will@kernel.org>
Date: Tue, 25 Jun 2019 12:51:25 +0100
Subject: [PATCH] iommu/io-pgtable: Replace IO_PGTABLE_QUIRK_NO_DMA with
 specific flag

IO_PGTABLE_QUIRK_NO_DMA is a bit of a misnomer, since it's really just
an indication of whether or not the page-table walker for the IOMMU is
coherent with the CPU caches. Since cache coherency is more than just a
quirk, replace the flag with its own field in the io_pgtable_cfg
structure.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm-smmu-v3.c        |  4 +---
 drivers/iommu/arm-smmu.c           |  4 +---
 drivers/iommu/io-pgtable-arm-v7s.c | 10 +++++-----
 drivers/iommu/io-pgtable-arm.c     | 19 ++++++++-----------
 drivers/iommu/ipmmu-vmsa.c         |  1 +
 include/linux/io-pgtable.h         | 11 ++++-------
 6 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 65de2458999f..8ff8f61d9e1c 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1789,13 +1789,11 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain)
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
 		.ias		= ias,
 		.oas		= oas,
+		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
 		.tlb		= &arm_smmu_gather_ops,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (smmu->features & ARM_SMMU_FEAT_COHERENCY)
-		pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_NO_DMA;
-
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5e54cc0a28b3..009156bb6d42 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -895,13 +895,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
 		.ias		= ias,
 		.oas		= oas,
+		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
 		.tlb		= smmu_domain->tlb_ops,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
-		pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_NO_DMA;
-
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 9a8a8870e267..8454de93e356 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -215,7 +215,7 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 		dev_err(dev, "Page table does not fit in PTE: %pa", &phys);
 		goto out_free;
 	}
-	if (table && !(cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA)) {
+	if (table && !cfg->coherent_walk) {
 		dma = dma_map_single(dev, table, size, DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, dma))
 			goto out_free;
@@ -249,7 +249,7 @@ static void __arm_v7s_free_table(void *table, int lvl,
 	struct device *dev = cfg->iommu_dev;
 	size_t size = ARM_V7S_TABLE_SIZE(lvl);
 
-	if (!(cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA))
+	if (!cfg->coherent_walk)
 		dma_unmap_single(dev, __arm_v7s_dma_addr(table), size,
 				 DMA_TO_DEVICE);
 	if (lvl == 1)
@@ -261,7 +261,7 @@ static void __arm_v7s_free_table(void *table, int lvl,
 static void __arm_v7s_pte_sync(arm_v7s_iopte *ptep, int num_entries,
 			       struct io_pgtable_cfg *cfg)
 {
-	if (cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA)
+	if (cfg->coherent_walk)
 		return;
 
 	dma_sync_single_for_device(cfg->iommu_dev, __arm_v7s_dma_addr(ptep),
@@ -727,7 +727,6 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 			    IO_PGTABLE_QUIRK_NO_PERMS |
 			    IO_PGTABLE_QUIRK_TLBI_ON_MAP |
 			    IO_PGTABLE_QUIRK_ARM_MTK_4GB |
-			    IO_PGTABLE_QUIRK_NO_DMA |
 			    IO_PGTABLE_QUIRK_NON_STRICT))
 		return NULL;
 
@@ -846,7 +845,8 @@ static int __init arm_v7s_do_selftests(void)
 		.tlb = &dummy_tlb_ops,
 		.oas = 32,
 		.ias = 32,
-		.quirks = IO_PGTABLE_QUIRK_ARM_NS | IO_PGTABLE_QUIRK_NO_DMA,
+		.coherent_walk = true,
+		.quirks = IO_PGTABLE_QUIRK_ARM_NS,
 		.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	};
 	unsigned int iova, size, iova_start;
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 2454ac11aa97..91d0a4228b58 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -252,7 +252,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 		return NULL;
 
 	pages = page_address(p);
-	if (!(cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA)) {
+	if (!cfg->coherent_walk) {
 		dma = dma_map_single(dev, pages, size, DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, dma))
 			goto out_free;
@@ -278,7 +278,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 static void __arm_lpae_free_pages(void *pages, size_t size,
 				  struct io_pgtable_cfg *cfg)
 {
-	if (!(cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA))
+	if (!cfg->coherent_walk)
 		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
 				 size, DMA_TO_DEVICE);
 	free_pages((unsigned long)pages, get_order(size));
@@ -296,7 +296,7 @@ static void __arm_lpae_set_pte(arm_lpae_iopte *ptep, arm_lpae_iopte pte,
 {
 	*ptep = pte;
 
-	if (!(cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA))
+	if (!cfg->coherent_walk)
 		__arm_lpae_sync_pte(ptep, cfg);
 }
 
@@ -374,8 +374,7 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
 
 	old = cmpxchg64_relaxed(ptep, curr, new);
 
-	if ((cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA) ||
-	    (old & ARM_LPAE_PTE_SW_SYNC))
+	if (cfg->coherent_walk || (old & ARM_LPAE_PTE_SW_SYNC))
 		return old;
 
 	/* Even if it's not ours, there's no point waiting; just kick it */
@@ -416,8 +415,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		pte = arm_lpae_install_table(cptep, ptep, 0, cfg);
 		if (pte)
 			__arm_lpae_free_pages(cptep, tblsz, cfg);
-	} else if (!(cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA) &&
-		   !(pte & ARM_LPAE_PTE_SW_SYNC)) {
+	} else if (!cfg->coherent_walk && !(pte & ARM_LPAE_PTE_SW_SYNC)) {
 		__arm_lpae_sync_pte(ptep, cfg);
 	}
 
@@ -799,7 +797,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	u64 reg;
 	struct arm_lpae_io_pgtable *data;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS | IO_PGTABLE_QUIRK_NO_DMA |
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NON_STRICT))
 		return NULL;
 
@@ -894,8 +892,7 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 
 	/* The NS quirk doesn't apply at stage 2 */
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_NO_DMA |
-			    IO_PGTABLE_QUIRK_NON_STRICT))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_NON_STRICT))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1230,7 +1227,7 @@ static int __init arm_lpae_do_selftests(void)
 	struct io_pgtable_cfg cfg = {
 		.tlb = &dummy_tlb_ops,
 		.oas = 48,
-		.quirks = IO_PGTABLE_QUIRK_NO_DMA,
+		.coherent_walk = true,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9a380c10655e..12bcb95bdaa8 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -431,6 +431,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 	 * TODO: Add support for coherent walk through CCI with DVM and remove
 	 * cache handling. For now, delegate it to the io-pgtable code.
 	 */
+	domain->cfg.coherent_walk = false;
 	domain->cfg.iommu_dev = domain->mmu->root->dev;
 
 	/*
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 76969a564831..b5a450a3bb47 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -44,6 +44,8 @@ struct iommu_gather_ops {
  *                 tables.
  * @ias:           Input address (iova) size, in bits.
  * @oas:           Output address (paddr) size, in bits.
+ * @coherent_walk  A flag to indicate whether or not page table walks made
+ *                 by the IOMMU are coherent with the CPU caches.
  * @tlb:           TLB management callbacks for this set of tables.
  * @iommu_dev:     The device representing the DMA configuration for the
  *                 page table walker.
@@ -68,11 +70,6 @@ struct io_pgtable_cfg {
 	 *	when the SoC is in "4GB mode" and they can only access the high
 	 *	remap of DRAM (0x1_00000000 to 0x1_ffffffff).
 	 *
-	 * IO_PGTABLE_QUIRK_NO_DMA: Guarantees that the tables will only ever
-	 *	be accessed by a fully cache-coherent IOMMU or CPU (e.g. for a
-	 *	software-emulated IOMMU), such that pagetable updates need not
-	 *	be treated as explicit DMA data.
-	 *
 	 * IO_PGTABLE_QUIRK_NON_STRICT: Skip issuing synchronous leaf TLBIs
 	 *	on unmap, for DMA domains using the flush queue mechanism for
 	 *	delayed invalidation.
@@ -81,12 +78,12 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
 	#define IO_PGTABLE_QUIRK_TLBI_ON_MAP	BIT(2)
 	#define IO_PGTABLE_QUIRK_ARM_MTK_4GB	BIT(3)
-	#define IO_PGTABLE_QUIRK_NO_DMA		BIT(4)
-	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(5)
+	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
 	unsigned int			oas;
+	bool				coherent_walk;
 	const struct iommu_gather_ops	*tlb;
 	struct device			*iommu_dev;
 
-- 
2.11.0

