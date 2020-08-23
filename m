Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C333224F06A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 01:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHWXFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Aug 2020 19:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgHWXFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Aug 2020 19:05:49 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E01C061573;
        Sun, 23 Aug 2020 16:05:49 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d19so3657622pgl.10;
        Sun, 23 Aug 2020 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rXg5ASTJKuS2X6twhw4KiiTJ11cb3nEvoe/6O1rzpFA=;
        b=TsXvoWqU84vmi9BoaUbGwBu0FapYlXJXX/AAIBvYoJuj01qPejSnDkFHpmgu5hFyBR
         v/8EnTWuOcu9kayTHFrbtnRsfVWfrvwa+FUoU1AjQ9heIhjTC0J3LJv/GFGISYKkEG4e
         LkGd32MHVU6nP/z5Rq6++B1/c+Mzj0qlPhqjMjo97MnMT8JY0dlLjANmm8qDaesTc5uF
         A3WZXlgcUGBugnJNmOCIgtyLqktpYiH7I8Ox4lchKO8tMcmyBnCeDTrOq1VMCLWWp6t5
         AXZVc4aFAFLQzJeFTEG2NskFitLMQWBneex1agMFvl57FU7qbyWkCKhoKEtL4r8XNubQ
         l/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rXg5ASTJKuS2X6twhw4KiiTJ11cb3nEvoe/6O1rzpFA=;
        b=DwX7qw+DVlMVlIOxR0978kyAp2jsq+XrBjwTpnz0d3gGpVQvoCtNym7KQyaajp6uUx
         XaW5bFbV4ZZE7TZT9io6nrsTNAowCfqv2feg6QYMMnCsL2Ntur+9BNkh1dV1DLsU9dgg
         cSro51j/Ig5/VOJrmklMmOKjikVnPhubxZHp0F/YHhdF1NvsXWnxmLg0CClPmF38ZSsm
         VTQ+7NFfoUdpTrLZ8OrXh5IIKZ52Z2nEiffdHeqm9LtqDo6iFLUa/2Q4rD1/lRyK+t2z
         ZOaKFOai7v/swPCcW9yUIkA+cpDrcaJHtUN33AbcVVh4w688vBKH7YEf/zP7iiWn94XP
         NGjA==
X-Gm-Message-State: AOAM530FphqCMe6bMpKMB6eImwF8c/yDaaQf03atLuY6dOorzjpXCpk9
        f3EXujeHAaOTWwIDxaX7E/k=
X-Google-Smtp-Source: ABdhPJwfvPy+sDses+GtoesDUewMlb1JaroSst40hW/p6qpgdSpWzbIrAHIwiqfhj0Iikn7Qc0J4Nw==
X-Received: by 2002:a65:4502:: with SMTP id n2mr1758109pgq.132.1598223948586;
        Sun, 23 Aug 2020 16:05:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b24sm7562652pjp.22.2020.08.23.16.05.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Aug 2020 16:05:48 -0700 (PDT)
Date:   Sun, 23 Aug 2020 16:05:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 09/13] drm/msm: Add support to create a local
 pagetable
Message-ID: <20200823230546.GA189660@roeck-us.net>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-10-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810222657.1841322-10-jcrouse@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 04:26:53PM -0600, Jordan Crouse wrote:
> Add support to create a io-pgtable for use by targets that support
> per-instance pagetables. In order to support per-instance pagetables the
> GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
> split pagetables enabled.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

This patch adds a hard dependency on IOMMU_IO_PGTABLE (for
alloc_io_pgtable_ops and free_io_pgtable_ops).

Guenter

> ---
> 
>  drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
>  drivers/gpu/drm/msm/msm_iommu.c  | 190 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
>  3 files changed, 205 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 310a31b05faa..aab121f4beb7 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
>  	}
>  
>  	gpummu->gpu = gpu;
> -	msm_mmu_init(&gpummu->base, dev, &funcs);
> +	msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
>  
>  	return &gpummu->base;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 1b6635504069..bc04dda8a198 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -4,15 +4,201 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <linux/io-pgtable.h>
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
>  
>  struct msm_iommu {
>  	struct msm_mmu base;
>  	struct iommu_domain *domain;
> +	atomic_t pagetables;
>  };
> +
>  #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
>  
> +struct msm_iommu_pagetable {
> +	struct msm_mmu base;
> +	struct msm_mmu *parent;
> +	struct io_pgtable_ops *pgtbl_ops;
> +	phys_addr_t ttbr;
> +	u32 asid;
> +};
> +static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> +{
> +	return container_of(mmu, struct msm_iommu_pagetable, base);
> +}
> +
> +static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> +		size_t size)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +	size_t unmapped = 0;
> +
> +	/* Unmap the block one page at a time */
> +	while (size) {
> +		unmapped += ops->unmap(ops, iova, 4096, NULL);
> +		iova += 4096;
> +		size -= 4096;
> +	}
> +
> +	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> +
> +	return (unmapped == size) ? 0 : -EINVAL;
> +}
> +
> +static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> +		struct sg_table *sgt, size_t len, int prot)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +	struct scatterlist *sg;
> +	size_t mapped = 0;
> +	u64 addr = iova;
> +	unsigned int i;
> +
> +	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +		size_t size = sg->length;
> +		phys_addr_t phys = sg_phys(sg);
> +
> +		/* Map the block one page at a time */
> +		while (size) {
> +			if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
> +				msm_iommu_pagetable_unmap(mmu, iova, mapped);
> +				return -EINVAL;
> +			}
> +
> +			phys += 4096;
> +			addr += 4096;
> +			size -= 4096;
> +			mapped += 4096;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
> +
> +	/*
> +	 * If this is the last attached pagetable for the parent,
> +	 * disable TTBR0 in the arm-smmu driver
> +	 */
> +	if (atomic_dec_return(&iommu->pagetables) == 0)
> +		iommu_domain_set_attr(iommu->domain,
> +			DOMAIN_ATTR_PGTABLE_CFG, NULL);
> +
> +	free_io_pgtable_ops(pagetable->pgtbl_ops);
> +	kfree(pagetable);
> +}
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu,
> +		phys_addr_t *ttbr, int *asid)
> +{
> +	struct msm_iommu_pagetable *pagetable;
> +
> +	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> +		return -EINVAL;
> +
> +	pagetable = to_pagetable(mmu);
> +
> +	if (ttbr)
> +		*ttbr = pagetable->ttbr;
> +
> +	if (asid)
> +		*asid = pagetable->asid;
> +
> +	return 0;
> +}
> +
> +static const struct msm_mmu_funcs pagetable_funcs = {
> +		.map = msm_iommu_pagetable_map,
> +		.unmap = msm_iommu_pagetable_unmap,
> +		.destroy = msm_iommu_pagetable_destroy,
> +};
> +
> +static void msm_iommu_tlb_flush_all(void *cookie)
> +{
> +}
> +
> +static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
> +		size_t granule, void *cookie)
> +{
> +}
> +
> +static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
> +		unsigned long iova, size_t granule, void *cookie)
> +{
> +}
> +
> +static const struct iommu_flush_ops null_tlb_ops = {
> +	.tlb_flush_all = msm_iommu_tlb_flush_all,
> +	.tlb_flush_walk = msm_iommu_tlb_flush_walk,
> +	.tlb_flush_leaf = msm_iommu_tlb_flush_walk,
> +	.tlb_add_page = msm_iommu_tlb_add_page,
> +};
> +
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> +{
> +	struct msm_iommu *iommu = to_msm_iommu(parent);
> +	static int next_asid = 16;
> +	struct msm_iommu_pagetable *pagetable;
> +	struct io_pgtable_cfg cfg;
> +	int ret;
> +
> +	/* Get the pagetable configuration from the domain */
> +	ret = iommu_domain_get_attr(iommu->domain,
> +		DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
> +	if (!pagetable)
> +		return ERR_PTR(-ENOMEM);
> +
> +	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
> +		MSM_MMU_IOMMU_PAGETABLE);
> +
> +	/* The incoming cfg will have the TTBR1 quirk enabled */
> +	cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
> +	cfg.tlb = &null_tlb_ops;
> +
> +	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
> +		&cfg, iommu->domain);
> +
> +	if (!pagetable->pgtbl_ops) {
> +		kfree(pagetable);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/*
> +	 * If this is the first pagetable that we've allocated, send it back to
> +	 * the arm-smmu driver as a trigger to set up TTBR0
> +	 */
> +	if (atomic_inc_return(&iommu->pagetables) == 1) {
> +		ret = iommu_domain_set_attr(iommu->domain,
> +			DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> +		if (ret) {
> +			free_io_pgtable_ops(pagetable->pgtbl_ops);
> +			kfree(pagetable);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	/* Needed later for TLB flush */
> +	pagetable->parent = parent;
> +	pagetable->ttbr = cfg.arm_lpae_s1_cfg.ttbr;
> +
> +	pagetable->asid = next_asid;
> +	next_asid = (next_asid + 1) % 255;
> +	next_asid = min(16, next_asid);
> +
> +	return &pagetable->base;
> +}
> +
>  static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  		unsigned long iova, int flags, void *arg)
>  {
> @@ -85,9 +271,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>  		return ERR_PTR(-ENOMEM);
>  
>  	iommu->domain = domain;
> -	msm_mmu_init(&iommu->base, dev, &funcs);
> +	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
>  	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>  
> +	atomic_set(&iommu->pagetables, 0);
> +
>  	ret = iommu_attach_device(iommu->domain, dev);
>  	if (ret) {
>  		kfree(iommu);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 3a534ee59bf6..61ade89d9e48 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -17,18 +17,26 @@ struct msm_mmu_funcs {
>  	void (*destroy)(struct msm_mmu *mmu);
>  };
>  
> +enum msm_mmu_type {
> +	MSM_MMU_GPUMMU,
> +	MSM_MMU_IOMMU,
> +	MSM_MMU_IOMMU_PAGETABLE,
> +};
> +
>  struct msm_mmu {
>  	const struct msm_mmu_funcs *funcs;
>  	struct device *dev;
>  	int (*handler)(void *arg, unsigned long iova, int flags);
>  	void *arg;
> +	enum msm_mmu_type type;
>  };
>  
>  static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> -		const struct msm_mmu_funcs *funcs)
> +		const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
>  {
>  	mmu->dev = dev;
>  	mmu->funcs = funcs;
> +	mmu->type = type;
>  }
>  
>  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> @@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  	mmu->handler = handler;
>  }
>  
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> +
>  void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>  		dma_addr_t *tran_error);
>  
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> +		int *asid);
> +
>  #endif /* __MSM_MMU_H__ */
