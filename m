Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1312A25769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 20:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfEUSSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 14:18:36 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:39782 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728114AbfEUSSg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 14:18:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3D0280D;
        Tue, 21 May 2019 11:18:35 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A97D23F5AF;
        Tue, 21 May 2019 11:18:33 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] iommu/arm-smmu: Add split pagetable support for
 arm-smmu-v2
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
 <1558455243-32746-4-git-send-email-jcrouse@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <f2b2f524-cd63-7153-c454-0210410d1116@arm.com>
Date:   Tue, 21 May 2019 19:18:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558455243-32746-4-git-send-email-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2019 17:13, Jordan Crouse wrote:
> Add support for a split pagetable (TTBR0/TTBR1) scheme for arm-smmu-v2.
> If split pagetables are enabled, create a pagetable for TTBR1 and set
> up the sign extension bit so that all IOVAs with that bit set are mapped
> and translated from the TTBR1 pagetable.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/iommu/arm-smmu-regs.h  |  19 +++++
>   drivers/iommu/arm-smmu.c       | 179 ++++++++++++++++++++++++++++++++++++++---
>   drivers/iommu/io-pgtable-arm.c |   3 +-
>   3 files changed, 186 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu-regs.h
> index e9132a9..23f27c2 100644
> --- a/drivers/iommu/arm-smmu-regs.h
> +++ b/drivers/iommu/arm-smmu-regs.h
> @@ -195,7 +195,26 @@ enum arm_smmu_s2cr_privcfg {
>   #define RESUME_RETRY			(0 << 0)
>   #define RESUME_TERMINATE		(1 << 0)
>   
> +#define TTBCR_EPD1			(1 << 23)
> +#define TTBCR_T0SZ_SHIFT		0
> +#define TTBCR_T1SZ_SHIFT		16
> +#define TTBCR_IRGN1_SHIFT		24
> +#define TTBCR_ORGN1_SHIFT		26
> +#define TTBCR_RGN_WBWA			1
> +#define TTBCR_SH1_SHIFT			28
> +#define TTBCR_SH_IS			3
> +
> +#define TTBCR_TG1_16K			(1 << 30)
> +#define TTBCR_TG1_4K			(2 << 30)
> +#define TTBCR_TG1_64K			(3 << 30)
> +
>   #define TTBCR2_SEP_SHIFT		15
> +#define TTBCR2_SEP_31			(0x0 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_SEP_35			(0x1 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_SEP_39			(0x2 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_SEP_41			(0x3 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_SEP_43			(0x4 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_SEP_47			(0x5 << TTBCR2_SEP_SHIFT)
>   #define TTBCR2_SEP_UPSTREAM		(0x7 << TTBCR2_SEP_SHIFT)
>   #define TTBCR2_AS			(1 << 4)
>   
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index a795ada..e09c0e6 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -152,6 +152,7 @@ struct arm_smmu_cb {
>   	u32				tcr[2];
>   	u32				mair[2];
>   	struct arm_smmu_cfg		*cfg;
> +	unsigned long			split_table_mask;
>   };
>   
>   struct arm_smmu_master_cfg {
> @@ -253,13 +254,14 @@ enum arm_smmu_domain_stage {
>   
>   struct arm_smmu_domain {
>   	struct arm_smmu_device		*smmu;
> -	struct io_pgtable_ops		*pgtbl_ops;
> +	struct io_pgtable_ops		*pgtbl_ops[2];

This seems a bit off - surely the primary domain and aux domain only 
ever need one set of tables each, but either way there's definitely 
unnecessary redundancy in having four sets of io_pgtable_ops between them.

>   	const struct iommu_gather_ops	*tlb_ops;
>   	struct arm_smmu_cfg		cfg;
>   	enum arm_smmu_domain_stage	stage;
>   	bool				non_strict;
>   	struct mutex			init_mutex; /* Protects smmu pointer */
>   	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> +	u32 attributes;
>   	struct iommu_domain		domain;
>   };
>   
> @@ -621,6 +623,85 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +/* Adjust the context bank settings to support TTBR1 */
> +static void arm_smmu_init_ttbr1(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg)
> +{
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +	int pgsize = 1 << __ffs(pgtbl_cfg->pgsize_bitmap);
> +
> +	/* Enable speculative walks through the TTBR1 */
> +	cb->tcr[0] &= ~TTBCR_EPD1;
> +
> +	cb->tcr[0] |= TTBCR_SH_IS << TTBCR_SH1_SHIFT;
> +	cb->tcr[0] |= TTBCR_RGN_WBWA << TTBCR_IRGN1_SHIFT;
> +	cb->tcr[0] |= TTBCR_RGN_WBWA << TTBCR_ORGN1_SHIFT;
> +
> +	switch (pgsize) {
> +	case SZ_4K:
> +		cb->tcr[0] |= TTBCR_TG1_4K;
> +		break;
> +	case SZ_16K:
> +		cb->tcr[0] |= TTBCR_TG1_16K;
> +		break;
> +	case SZ_64K:
> +		cb->tcr[0] |= TTBCR_TG1_64K;
> +		break;
> +	}
> +
> +	/*
> +	 * Outside of the special 49 bit UBS case that has a dedicated sign
> +	 * extension bit, setting the SEP for any other va_size will force us to
> +	 * shrink the size of the T0/T1 regions by one bit to accommodate the
> +	 * SEP
> +	 */
> +	if (smmu->va_size != 48) {
> +		/* Replace the T0 size */
> +		cb->tcr[0] &= ~(0x3f << TTBCR_T0SZ_SHIFT);
> +		cb->tcr[0] |= (64ULL - smmu->va_size - 1) << TTBCR_T0SZ_SHIFT;
> +		/* Set the T1 size */
> +		cb->tcr[0] |= (64ULL - smmu->va_size - 1) << TTBCR_T1SZ_SHIFT;
> +	} else {
> +		/* Set the T1 size to the full available UBS */
> +		cb->tcr[0] |= (64ULL - smmu->va_size) << TTBCR_T1SZ_SHIFT;
> +	}
> +
> +	/* Clear the existing SEP configuration */
> +	cb->tcr[1] &= ~TTBCR2_SEP_UPSTREAM;
> +
> +	/* Set up the sign extend bit */
> +	switch (smmu->va_size) {
> +	case 32:
> +		cb->tcr[1] |= TTBCR2_SEP_31;
> +		cb->split_table_mask = (1UL << 31);
> +		break;
> +	case 36:
> +		cb->tcr[1] |= TTBCR2_SEP_35;
> +		cb->split_table_mask = (1UL << 35);
> +		break;
> +	case 40:
> +		cb->tcr[1] |= TTBCR2_SEP_39;
> +		cb->split_table_mask = (1UL << 39);
> +		break;
> +	case 42:
> +		cb->tcr[1] |= TTBCR2_SEP_41;
> +		cb->split_table_mask = (1UL << 41);
> +		break;
> +	case 44:
> +		cb->tcr[1] |= TTBCR2_SEP_43;
> +		cb->split_table_mask = (1UL << 43);
> +		break;
> +	case 48:
> +		cb->tcr[1] |= TTBCR2_SEP_UPSTREAM;
> +		cb->split_table_mask = (1UL << 48);
> +	}
> +
> +	cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];

Assigning a "TTBR0" to a "TTBR1" is the point at which it becomes clear 
that we need to take a step back and reconsider. I think there was 
originally a half-formed idea that pagetables might go around in pairs, 
but things really aren't working out that way in practice, so it's 
almost certainly time to rework the io_pgatble_alloc() interface. We 
probably want to make "TTBR1" an up-front option for the appropriate 
formats, such that either way they return a single TTBR value plus a TCR 
with the appropriate half configured (hopefully in such a way that the 
caller can simply allocate one of each and merge the two TCRs together, 
so maybe responsibility for EPD* needs to move). That way we can also 
make *better* use of the IOVA sanity-checking in io-pgtable-arm, rather 
than just removing it (especially since this will open up a whole new 
class of "unmapping a TTBR0 address from the TTBR1 domain" type bugs).

Robin.

> +	cb->ttbr[1] |= (u64)cfg->asid << TTBRn_ASID_SHIFT;
> +}
> +
>   static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>   				       struct io_pgtable_cfg *pgtbl_cfg)
>   {
> @@ -763,11 +844,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   {
>   	int irq, start, ret = 0;
>   	unsigned long ias, oas;
> -	struct io_pgtable_ops *pgtbl_ops;
> +	struct io_pgtable_ops *pgtbl_ops[2] = { NULL, NULL };
>   	struct io_pgtable_cfg pgtbl_cfg;
>   	enum io_pgtable_fmt fmt;
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	bool split_tables =
> +		(smmu_domain->attributes & (1 << DOMAIN_ATTR_SPLIT_TABLES));
>   
>   	mutex_lock(&smmu_domain->init_mutex);
>   	if (smmu_domain->smmu)
> @@ -797,8 +880,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   	 *
>   	 * Note that you can't actually request stage-2 mappings.
>   	 */
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
> +	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1)) {
>   		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> +
> +		/* Only allow split pagetables on stage 1 tables */
> +		if (split_tables) {
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +	}
>   	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
>   		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>   
> @@ -817,6 +907,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
>   	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1))
>   		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
> +
>   	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt == ARM_SMMU_CTX_FMT_NONE) &&
>   	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
>   			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
> @@ -828,6 +919,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   		goto out_unlock;
>   	}
>   
> +	/* For now, only allow split tables for AARCH64 formats */
> +	if (split_tables && cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
>   	switch (smmu_domain->stage) {
>   	case ARM_SMMU_DOMAIN_S1:
>   		cfg->cbar = CBAR_TYPE_S1_TRANS_S2_BYPASS;
> @@ -906,8 +1003,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>   
>   	smmu_domain->smmu = smmu;
> -	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
> -	if (!pgtbl_ops) {
> +	pgtbl_ops[0] = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
> +	if (!pgtbl_ops[0]) {
>   		ret = -ENOMEM;
>   		goto out_clear_smmu;
>   	}
> @@ -919,6 +1016,20 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   
>   	/* Initialise the context bank with our page table cfg */
>   	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
> +
> +	if (split_tables) {
> +		/* It is safe to reuse pgtbl_cfg here */
> +		pgtbl_ops[1] = alloc_io_pgtable_ops(fmt, &pgtbl_cfg,
> +			smmu_domain);
> +		if (!pgtbl_ops[1]) {
> +			free_io_pgtable_ops(pgtbl_ops[0]);
> +			ret = -ENOMEM;
> +			goto out_clear_smmu;
> +		}
> +
> +		arm_smmu_init_ttbr1(smmu_domain, &pgtbl_cfg);
> +	}
> +
>   	arm_smmu_write_context_bank(smmu, cfg->cbndx);
>   
>   	/*
> @@ -937,7 +1048,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   	mutex_unlock(&smmu_domain->init_mutex);
>   
>   	/* Publish page table ops for map/unmap */
> -	smmu_domain->pgtbl_ops = pgtbl_ops;
> +	smmu_domain->pgtbl_ops[0] = pgtbl_ops[0];
> +	smmu_domain->pgtbl_ops[1] = pgtbl_ops[1];
> +
>   	return 0;
>   
>   out_clear_smmu:
> @@ -973,7 +1086,9 @@ static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
>   		devm_free_irq(smmu->dev, irq, domain);
>   	}
>   
> -	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
> +	free_io_pgtable_ops(smmu_domain->pgtbl_ops[0]);
> +	free_io_pgtable_ops(smmu_domain->pgtbl_ops[1]);
> +
>   	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
>   
>   	arm_smmu_rpm_put(smmu);
> @@ -1317,10 +1432,37 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   	return ret;
>   }
>   
> +static struct io_pgtable_ops *
> +arm_smmu_get_pgtbl_ops(struct iommu_domain *domain, unsigned long iova)
> +{
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +
> +	if (iova & cb->split_table_mask)
> +		return smmu_domain->pgtbl_ops[1];
> +
> +	return smmu_domain->pgtbl_ops[0];
> +}
> +
> +/*
> + * If split pagetables are enabled adjust the iova so that it
> + * matches the T0SZ/T1SZ that has been programmed
> + */
> +unsigned long arm_smmu_adjust_iova(struct iommu_domain *domain,
> +		unsigned long iova)
> +{
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +
> +	return cb->split_table_mask ? iova & (cb->split_table_mask - 1) : iova;
> +}
> +
>   static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
>   			phys_addr_t paddr, size_t size, int prot)
>   {
> -	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
> +	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
>   	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
>   	int ret;
>   
> @@ -1328,7 +1470,8 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
>   		return -ENODEV;
>   
>   	arm_smmu_rpm_get(smmu);
> -	ret = ops->map(ops, iova, paddr, size, prot);
> +	ret = ops->map(ops, arm_smmu_adjust_iova(domain, iova),
> +		paddr, size, prot);
>   	arm_smmu_rpm_put(smmu);
>   
>   	return ret;
> @@ -1337,7 +1480,7 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
>   static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
>   			     size_t size)
>   {
> -	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
> +	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
>   	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
>   	size_t ret;
>   
> @@ -1345,7 +1488,7 @@ static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
>   		return 0;
>   
>   	arm_smmu_rpm_get(smmu);
> -	ret = ops->unmap(ops, iova, size);
> +	ret = ops->unmap(ops, arm_smmu_adjust_iova(domain, iova), size);
>   	arm_smmu_rpm_put(smmu);
>   
>   	return ret;
> @@ -1381,7 +1524,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> -	struct io_pgtable_ops *ops= smmu_domain->pgtbl_ops;
> +	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
>   	struct device *dev = smmu->dev;
>   	void __iomem *cb_base;
>   	u32 tmp;
> @@ -1429,7 +1572,7 @@ static phys_addr_t arm_smmu_iova_to_phys(struct iommu_domain *domain,
>   					dma_addr_t iova)
>   {
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
> +	struct io_pgtable_ops *ops = arm_smmu_get_pgtbl_ops(domain, iova);
>   
>   	if (domain->type == IOMMU_DOMAIN_IDENTITY)
>   		return iova;
> @@ -1629,6 +1772,11 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>   		case DOMAIN_ATTR_NESTING:
>   			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>   			return 0;
> +		case DOMAIN_ATTR_SPLIT_TABLES:
> +			*((int *)data) =
> +				!!(smmu_domain->attributes &
> +				   (1 << DOMAIN_ATTR_SPLIT_TABLES));
> +			return 0;
>   		default:
>   			return -ENODEV;
>   		}
> @@ -1669,6 +1817,11 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>   			else
>   				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>   			break;
> +		case DOMAIN_ATTR_SPLIT_TABLES:
> +			if (*((int *)data))
> +				smmu_domain->attributes |=
> +					(1 << DOMAIN_ATTR_SPLIT_TABLES);
> +			break;
>   		default:
>   			ret = -ENODEV;
>   		}
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 4e21efb..71ecb08 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -490,8 +490,7 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>   	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
>   		return 0;
>   
> -	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> -		    paddr >= (1ULL << data->iop.cfg.oas)))
> +	if (WARN_ON(paddr >= (1ULL << data->iop.cfg.oas)))
>   		return -ERANGE;
>   
>   	prot = arm_lpae_prot_to_pte(data, iommu_prot);
> 
