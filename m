Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B1F23F373
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 22:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHGT74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 15:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgHGT7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 15:59:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F8FC061756;
        Fri,  7 Aug 2020 12:59:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id p14so2706698wmg.1;
        Fri, 07 Aug 2020 12:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=syZktjcepY0vNc63q2VaOQLWA1fKYYMREF207iDmj8M=;
        b=PG4AtesEbVmdpNxayBlppShCjBdDC2bnYjhPF+wa3V0YTXmVsV+LXB1rZq6D56XHXd
         Ljtxvsyn7xdzl9zcM0kLHY7xV0mqM0unWx8Z9WfzYXMJOMnltLUAVnNkdr7DIoVp38cL
         VR6W/n6O8gZ/Zm8jaWup2PqlZZwEI6sGvuAnv7Q3pCVK69HpN00G3wf6wIMAyeFWhyBr
         ReVfh8HxCzZHBlIdr+0+FXgM7rzoqOsOWI5ur4pRwvbvEKGr9HbV+0HrugInX/IkMtRf
         nqvlfrJxJMfL+FhqlNs7Y9/UQKKu60CzDU0SVmKjUbK3xmzte/uHbD565BI7QSPTcXSU
         J3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=syZktjcepY0vNc63q2VaOQLWA1fKYYMREF207iDmj8M=;
        b=cvbOC11WJBv254EhYpdJSsG3lzLGEBJZirKIwX7ipq97CW4varCHwl1/9bIKFNevns
         AxqfWygyaofqm0K4hpAEst1j+eMom/pmaqOIzy7HucbFVpUVEKMC+jcVxuK0+4ztDuw7
         DYpJ2DSThkatUj5nJYP6ZydG5nnR+m+JlPxQkVJn4iZDa8SU3zxU2+M7jkaxBms0vFmg
         vDmi8wu0iz1wAUIE6B+4mEh3wB62+AJohoTycP4ih9EoNgfhtAHG7Zsi8wAkuTaHzDUd
         npFDyED/IGPqTBUIx03F75n8g/eSBaVYqH+6yzFvwXjRwdcRI8slHuZiUp9ywU+lIcH8
         Wslg==
X-Gm-Message-State: AOAM532b6NrWuTriK5Y37aA2wT3tJ6adAuhoIjGl8V05D9HLs82ynlKG
        19GAKj/14//GgkeLrH8pEOi/MUCu51ixx96mj8s=
X-Google-Smtp-Source: ABdhPJx4Qzp5/KvwYGLxwbL5y+B7itSkoeGkgu40KGhxhqPxnPpNPyE08am+leRP+rX0L+h8iNqO9z4Jw4+caqkiteY=
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr13696946wmt.94.1596830393486;
 Fri, 07 Aug 2020 12:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200803193547.305660-1-jcrouse@codeaurora.org> <20200803193547.305660-10-jcrouse@codeaurora.org>
In-Reply-To: <20200803193547.305660-10-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Aug 2020 13:00:37 -0700
Message-ID: <CAF6AEGvum9zLj41Ds+8+Q7qaMctwtcsEpC5aHGHZjb=piZO-QA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v11 09/12] drm/msm: Add support to create a
 local pagetable
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Daniel Vetter <daniel@ffwll.ch>, Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 3, 2020 at 12:36 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add support to create a io-pgtable for use by targets that support
> per-instance pagetables. In order to support per-instance pagetables the
> GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
> split pagetables enabled.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
>  drivers/gpu/drm/msm/msm_iommu.c  | 191 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
>  3 files changed, 206 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 310a31b05faa..aab121f4beb7 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
>         }
>
>         gpummu->gpu = gpu;
> -       msm_mmu_init(&gpummu->base, dev, &funcs);
> +       msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
>
>         return &gpummu->base;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 1b6635504069..bc6a4bbc904a 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -4,15 +4,202 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include <linux/io-pgtable.h>
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
>
>  struct msm_iommu {
>         struct msm_mmu base;
>         struct iommu_domain *domain;
> +       atomic_t pagetables;
>  };
> +
>  #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
>
> +struct msm_iommu_pagetable {
> +       struct msm_mmu base;
> +       struct msm_mmu *parent;
> +       struct io_pgtable_ops *pgtbl_ops;
> +       phys_addr_t ttbr;
> +       u32 asid;
> +};
> +static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> +{
> +       return container_of(mmu, struct msm_iommu_pagetable, base);
> +}
> +
> +static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> +               size_t size)
> +{
> +       struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +       struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +       size_t unmapped = 0;
> +
> +       /* Unmap the block one page at a time */
> +       while (size) {
> +               unmapped += ops->unmap(ops, iova, 4096, NULL);
> +               iova += 4096;
> +               size -= 4096;
> +       }
> +
> +       iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> +
> +       return (unmapped == size) ? 0 : -EINVAL;
> +}
> +
> +static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> +               struct sg_table *sgt, size_t len, int prot)
> +{
> +       struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +       struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +       struct scatterlist *sg;
> +       size_t mapped = 0;
> +       u64 addr = iova;
> +       unsigned int i;
> +
> +       for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +               size_t size = sg->length;
> +               phys_addr_t phys = sg_phys(sg);
> +
> +               /* Map the block one page at a time */
> +               while (size) {
> +                       if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
> +                               msm_iommu_pagetable_unmap(mmu, iova, mapped);
> +                               return -EINVAL;
> +                       }
> +
> +                       phys += 4096;
> +                       addr += 4096;
> +                       size -= 4096;
> +                       mapped += 4096;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
> +{
> +       struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +       struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
> +
> +       /*
> +        * If this is the last attached pagetable for the parent,
> +        * disable TTBR0 in the arm-smmu driver
> +        */
> +       if (atomic_dec_return(&iommu->pagetables) == 0)
> +               iommu_domain_set_attr(iommu->domain,
> +                       DOMAIN_ATTR_PGTABLE_CFG, NULL);
> +
> +       free_io_pgtable_ops(pagetable->pgtbl_ops);
> +       kfree(pagetable);
> +}
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu,
> +               phys_addr_t *ttbr, int *asid)
> +{
> +       struct msm_iommu_pagetable *pagetable;
> +
> +       if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> +               return -EINVAL;
> +
> +       pagetable = to_pagetable(mmu);
> +
> +       if (ttbr)
> +               *ttbr = pagetable->ttbr;
> +
> +       if (asid)
> +               *asid = pagetable->asid;
> +
> +       return 0;
> +}
> +
> +static const struct msm_mmu_funcs pagetable_funcs = {
> +               .map = msm_iommu_pagetable_map,
> +               .unmap = msm_iommu_pagetable_unmap,
> +               .destroy = msm_iommu_pagetable_destroy,
> +};
> +
> +static void msm_iommu_tlb_flush_all(void *cookie)
> +{
> +}
> +
> +static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
> +               size_t granule, void *cookie)
> +{
> +}
> +
> +static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
> +               unsigned long iova, size_t granule, void *cookie)
> +{
> +}
> +
> +static const struct iommu_flush_ops null_tlb_ops = {
> +       .tlb_flush_all = msm_iommu_tlb_flush_all,
> +       .tlb_flush_walk = msm_iommu_tlb_flush_walk,
> +       .tlb_flush_leaf = msm_iommu_tlb_flush_walk,
> +       .tlb_add_page = msm_iommu_tlb_add_page,
> +};
> +
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> +{
> +       struct msm_iommu *iommu = to_msm_iommu(parent);
> +       static int next_asid = 16;
> +       struct msm_iommu_pagetable *pagetable;
> +       struct io_pgtable_cfg cfg;
> +       int ret;
> +
> +       /* Get the pagetable configuration from the domain */
> +       ret = iommu_domain_get_attr(iommu->domain,
> +               DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
> +       if (!pagetable)
> +               return ERR_PTR(-ENOMEM);
> +
> +       msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
> +               MSM_MMU_IOMMU_PAGETABLE);
> +
> +       /* The incoming cfg will have the TTBR1 quirk enabled */
> +       cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
> +       cfg.tlb = &null_tlb_ops;
> +
> +       pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
> +               &cfg, iommu->domain);
> +
> +       if (!pagetable->pgtbl_ops) {
> +               kfree(pagetable);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       /*
> +        * If this is the first pagetable that we've allocated, send it back to
> +        * the arm-smmu driver as a trigger to set up TTBR0
> +        */
> +       if (atomic_inc_return(&iommu->pagetables) == 1) {
> +               ret = iommu_domain_set_attr(iommu->domain,
> +                       DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> +               if (ret) {
> +                       free_io_pgtable_ops(pagetable->pgtbl_ops);
> +                       kfree(pagetable);
> +                       return ERR_PTR(ret);
> +               }
> +       }
> +
> +       /* Needed later for TLB flush */
> +       pagetable->parent = parent;
> +       pagetable->ttbr = cfg.arm_lpae_s1_cfg.ttbr;
> +
> +       pagetable->asid = next_asid;
> +       next_asid = (next_asid + 1)  % 255;

nit: extra space before '%'

> +       if (next_asid < 16)
> +               next_asid = 16;

nit: next_asid = min(16, next_asid)

?

BR,
-R

> +
> +       return &pagetable->base;
> +}
> +
>  static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>                 unsigned long iova, int flags, void *arg)
>  {
> @@ -85,9 +272,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>                 return ERR_PTR(-ENOMEM);
>
>         iommu->domain = domain;
> -       msm_mmu_init(&iommu->base, dev, &funcs);
> +       msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
>         iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>
> +       atomic_set(&iommu->pagetables, 0);
> +
>         ret = iommu_attach_device(iommu->domain, dev);
>         if (ret) {
>                 kfree(iommu);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 3a534ee59bf6..61ade89d9e48 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -17,18 +17,26 @@ struct msm_mmu_funcs {
>         void (*destroy)(struct msm_mmu *mmu);
>  };
>
> +enum msm_mmu_type {
> +       MSM_MMU_GPUMMU,
> +       MSM_MMU_IOMMU,
> +       MSM_MMU_IOMMU_PAGETABLE,
> +};
> +
>  struct msm_mmu {
>         const struct msm_mmu_funcs *funcs;
>         struct device *dev;
>         int (*handler)(void *arg, unsigned long iova, int flags);
>         void *arg;
> +       enum msm_mmu_type type;
>  };
>
>  static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> -               const struct msm_mmu_funcs *funcs)
> +               const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
>  {
>         mmu->dev = dev;
>         mmu->funcs = funcs;
> +       mmu->type = type;
>  }
>
>  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> @@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>         mmu->handler = handler;
>  }
>
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> +
>  void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>                 dma_addr_t *tran_error);
>
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> +               int *asid);
> +
>  #endif /* __MSM_MMU_H__ */
> --
> 2.25.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
