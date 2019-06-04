Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B18913516D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 22:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfFDUz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 16:55:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36572 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfFDUz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 16:55:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id a3so3648670pgb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 13:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v+92O3n02yoDelWN8iZNqJXdtIdrpwjaH6lh8UZDq/4=;
        b=Q1YQR7Zvapt1hpvux/XCZl//rLrlL/D4+FneUY/1ynkD/saTdpWUfG3hvddES/CbLP
         a2dAuEaBcb7MWlJ8Vz5RbLUGNkBOHVHoRTOzAS8fmys8/cNNw2Tkvj7M/A58auxsUmm7
         f9vuHpAzGBiBtv3vkxdpnIvlBE3/PSb2hveSM2XFCWzgRjNcjBW547nQpQWj/4JF8FS0
         Bx6IZpSqBX222uf0D9nEag/4gM88WinVIHCHBf0eY2FcHWoBFmCD81jF6y7Jlgc/22E1
         LIyeAb4lfGfcaivUZMi3U6Lz+pN3UKwh/LuK90yfT58Qn1QmMnER77aZr0qUuI47yDYJ
         Lhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v+92O3n02yoDelWN8iZNqJXdtIdrpwjaH6lh8UZDq/4=;
        b=flcfz0MFHgGo1kZVp9SMFyQZDbDimaVm3ltI0JU+JWoYwVwJXyi/cKrxhTXIedHcqR
         4yPBfrkwm1c2K/rYGTv4ou71lEmQ3CLySMugDwExy50k7JGKEIf3mrPIGvhEDdSUfQZY
         bns932fQgkQx39UouwSj6LHqLNTaT96ZiDI8ezNJJ+9ImCDFnruye785g1iJKM1IIMF9
         MHRB98yqjAesZntpCNRHlrQTKwHYiClmtVWE8t+oqs2A6trA4yJHG/ohSUeSIZvB/wxr
         ALqlsPqVb/vEUXh+Isw/Fjrpg2nq4tizBFdH1b+h7PsBG4aTIJixEwhnWzD6582vqfhU
         tcQQ==
X-Gm-Message-State: APjAAAV5xJu8oYrS4yRkE/0FtOGKP8EipgT1F/81LMZWUN3wFOTxT/+6
        JALTu/Vrlh4Ul2WhkF4X0QIzh6iACdbtg1DQ45Nw9w==
X-Google-Smtp-Source: APXvYqw+H7JR94Yq96/lJf96GQ3j9mVGk0D/gy0Fk/7bWIFCbcRc1fzOxgHNBfvgHcBRYOGvo7U8WlOj2foZLp/Q+uE=
X-Received: by 2002:a17:90a:d3d2:: with SMTP id d18mr4205910pjw.5.1559681757847;
 Tue, 04 Jun 2019 13:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190506185207.31069-1-tmurphy@arista.com> <20190506185207.31069-2-tmurphy@arista.com>
 <33a1e3c1-1906-9e45-d060-e7998424973b@arm.com>
In-Reply-To: <33a1e3c1-1906-9e45-d060-e7998424973b@arm.com>
From:   Tom Murphy <tmurphy@arista.com>
Date:   Tue, 4 Jun 2019 21:55:46 +0100
Message-ID: <CAPL0++5cB8LOZuyK_k2bbQWXz1TWdvtSjsWGjWzHpFo2fG1vag@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] iommu: Add gfp parameter to iommu_ops::map
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 4, 2019 at 7:11 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 06/05/2019 19:52, Tom Murphy wrote:
> > Add a gfp_t parameter to the iommu_ops::map function.
> > Remove the needless locking in the AMD iommu driver.
> >
> > The iommu_ops::map function (or the iommu_map function which calls it)
> > was always supposed to be sleepable (according to Joerg's comment in
> > this thread: https://lore.kernel.org/patchwork/patch/977520/ ) and so
> > should probably have had a "might_sleep()" since it was written. Howeve=
r
> > currently the dma-iommu api can call iommu_map in an atomic context,
> > which it shouldn't do. This doesn't cause any problems because any iomm=
u
> > driver which uses the dma-iommu api uses gfp_atomic in it's
> > iommu_ops::map function. But doing this wastes the memory allocators
> > atomic pools.
>
> Hmm, in some cases iommu_ops::unmap may need to allocate as well,
> primarily if it needs to split a hugepage mapping. Should we pass flags

Are you sure that's the case?

I don't see that in the amd or intel iommu_ops::unmap code and from
looking at the intel code it seems like we actually unmap the whole
large page:
/* Cope with horrid API which requires us to unmap more than the
size argument if it happens to be a large-page mapping. */
BUG_ON(!pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level));

if (size < VTD_PAGE_SIZE << level_to_offset_bits(level))
      size =3D VTD_PAGE_SIZE << level_to_offset_bits(level);



> through there as well, or are we prepared to assume that that case will
> happen rarely enough that it's fair to just assume GFP_ATOMIC? It won't
> happen for DMA ops, but it's conceivable that other users such as GPU
> drivers might make partial unmaps, and I doubt we could totally rule out
> the wackiest ones doing so from non-sleeping contexts.
>
> Robin.
>
> > We can remove the mutex lock from amd_iommu_map and amd_iommu_unmap.
> > iommu_map doesn=E2=80=99t lock while mapping and so no two calls should=
 touch
> > the same iova range. The AMD driver already handles the page table page
> > allocations without locks so we can safely remove the locks.
> >
> > Signed-off-by: Tom Murphy <tmurphy@arista.com>
> > ---
> >   drivers/iommu/amd_iommu.c      | 14 ++++-------
> >   drivers/iommu/arm-smmu-v3.c    |  2 +-
> >   drivers/iommu/arm-smmu.c       |  2 +-
> >   drivers/iommu/dma-iommu.c      |  6 ++---
> >   drivers/iommu/exynos-iommu.c   |  2 +-
> >   drivers/iommu/intel-iommu.c    |  2 +-
> >   drivers/iommu/iommu.c          | 43 +++++++++++++++++++++++++++++----=
-
> >   drivers/iommu/ipmmu-vmsa.c     |  2 +-
> >   drivers/iommu/msm_iommu.c      |  2 +-
> >   drivers/iommu/mtk_iommu.c      |  2 +-
> >   drivers/iommu/mtk_iommu_v1.c   |  2 +-
> >   drivers/iommu/omap-iommu.c     |  2 +-
> >   drivers/iommu/qcom_iommu.c     |  2 +-
> >   drivers/iommu/rockchip-iommu.c |  2 +-
> >   drivers/iommu/s390-iommu.c     |  2 +-
> >   drivers/iommu/tegra-gart.c     |  2 +-
> >   drivers/iommu/tegra-smmu.c     |  2 +-
> >   include/linux/iommu.h          | 21 ++++++++++++++++-
> >   18 files changed, 78 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> > index ebd062522cf5..ea3a5dc61bb0 100644
> > --- a/drivers/iommu/amd_iommu.c
> > +++ b/drivers/iommu/amd_iommu.c
> > @@ -3092,7 +3092,8 @@ static int amd_iommu_attach_device(struct iommu_d=
omain *dom,
> >   }
> >
> >   static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova=
,
> > -                      phys_addr_t paddr, size_t page_size, int iommu_p=
rot)
> > +                      phys_addr_t paddr, size_t page_size, int iommu_p=
rot,
> > +                      gfp_t gfp)
> >   {
> >       struct protection_domain *domain =3D to_pdomain(dom);
> >       int prot =3D 0;
> > @@ -3106,9 +3107,7 @@ static int amd_iommu_map(struct iommu_domain *dom=
, unsigned long iova,
> >       if (iommu_prot & IOMMU_WRITE)
> >               prot |=3D IOMMU_PROT_IW;
> >
> > -     mutex_lock(&domain->api_lock);
> > -     ret =3D iommu_map_page(domain, iova, paddr, page_size, prot, GFP_=
KERNEL);
> > -     mutex_unlock(&domain->api_lock);
> > +     ret =3D iommu_map_page(domain, iova, paddr, page_size, prot, gfp)=
;
> >
> >       domain_flush_np_cache(domain, iova, page_size);
> >
> > @@ -3119,16 +3118,11 @@ static size_t amd_iommu_unmap(struct iommu_doma=
in *dom, unsigned long iova,
> >                          size_t page_size)
> >   {
> >       struct protection_domain *domain =3D to_pdomain(dom);
> > -     size_t unmap_size;
> >
> >       if (domain->mode =3D=3D PAGE_MODE_NONE)
> >               return 0;
> >
> > -     mutex_lock(&domain->api_lock);
> > -     unmap_size =3D iommu_unmap_page(domain, iova, page_size);
> > -     mutex_unlock(&domain->api_lock);
> > -
> > -     return unmap_size;
> > +     return iommu_unmap_page(domain, iova, page_size);
> >   }
> >
> >   static phys_addr_t amd_iommu_iova_to_phys(struct iommu_domain *dom,
> > diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> > index d3880010c6cf..e5c48089b49f 100644
> > --- a/drivers/iommu/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm-smmu-v3.c
> > @@ -1777,7 +1777,7 @@ static int arm_smmu_attach_dev(struct iommu_domai=
n *domain, struct device *dev)
> >   }
> >
> >   static int arm_smmu_map(struct iommu_domain *domain, unsigned long io=
va,
> > -                     phys_addr_t paddr, size_t size, int prot)
> > +                     phys_addr_t paddr, size_t size, int prot, gfp_t g=
fp)
> >   {
> >       struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
> >
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index 045d93884164..2d50db55b788 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -1286,7 +1286,7 @@ static int arm_smmu_attach_dev(struct iommu_domai=
n *domain, struct device *dev)
> >   }
> >
> >   static int arm_smmu_map(struct iommu_domain *domain, unsigned long io=
va,
> > -                     phys_addr_t paddr, size_t size, int prot)
> > +                     phys_addr_t paddr, size_t size, int prot, gfp_t g=
fp)
> >   {
> >       struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
> >       struct arm_smmu_device *smmu =3D to_smmu_domain(domain)->smmu;
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index fa5713a4f6f8..7a96c2c8f56b 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -440,7 +440,7 @@ static dma_addr_t __iommu_dma_map(struct device *de=
v, phys_addr_t phys,
> >       if (!iova)
> >               return DMA_MAPPING_ERROR;
> >
> > -     if (iommu_map(domain, iova, phys - iova_off, size, prot)) {
> > +     if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) =
{
> >               iommu_dma_free_iova(cookie, iova, size);
> >               return DMA_MAPPING_ERROR;
> >       }
> > @@ -641,7 +641,7 @@ static void *iommu_dma_alloc_remap(struct device *d=
ev, size_t size,
> >                       arch_dma_prep_coherent(sg_page(sg), sg->length);
> >       }
> >
> > -     if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
> > +     if (iommu_map_sg_atomic(domain, iova, sgt.sgl, sgt.orig_nents, io=
prot)
> >                       < size)
> >               goto out_free_sg;
> >
> > @@ -1003,7 +1003,7 @@ static int iommu_dma_map_sg(struct device *dev, s=
truct scatterlist *sg,
> >        * We'll leave any physical concatenation to the IOMMU driver's
> >        * implementation - it knows better than we do.
> >        */
> > -     if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
> > +     if (iommu_map_sg_atomic(domain, iova, sg, nents, prot) < iova_len=
)
> >               goto out_free_iova;
> >
> >       return __finalise_sg(dev, sg, nents, iova);
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.=
c
> > index 05c6bc099d62..46414234c179 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -1078,7 +1078,7 @@ static int lv2set_page(sysmmu_pte_t *pent, phys_a=
ddr_t paddr, size_t size,
> >    */
> >   static int exynos_iommu_map(struct iommu_domain *iommu_domain,
> >                           unsigned long l_iova, phys_addr_t paddr, size=
_t size,
> > -                         int prot)
> > +                         int prot, gfp_t gfp)
> >   {
> >       struct exynos_iommu_domain *domain =3D to_exynos_domain(iommu_dom=
ain);
> >       sysmmu_pte_t *entry;
> > diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> > index 28cb713d728c..4f0ff28f7cb9 100644
> > --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5137,7 +5137,7 @@ static void intel_iommu_detach_device(struct iomm=
u_domain *domain,
> >
> >   static int intel_iommu_map(struct iommu_domain *domain,
> >                          unsigned long iova, phys_addr_t hpa,
> > -                        size_t size, int iommu_prot)
> > +                        size_t size, int iommu_prot, gfp_t gfp)
> >   {
> >       struct dmar_domain *dmar_domain =3D to_dmar_domain(domain);
> >       u64 max_addr;
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 109de67d5d72..1b49841c177e 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -1584,8 +1584,8 @@ static size_t iommu_pgsize(struct iommu_domain *d=
omain,
> >       return pgsize;
> >   }
> >
> > -int iommu_map(struct iommu_domain *domain, unsigned long iova,
> > -           phys_addr_t paddr, size_t size, int prot)
> > +int __iommu_map(struct iommu_domain *domain, unsigned long iova,
> > +           phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> >   {
> >       const struct iommu_ops *ops =3D domain->ops;
> >       unsigned long orig_iova =3D iova;
> > @@ -1622,8 +1622,8 @@ int iommu_map(struct iommu_domain *domain, unsign=
ed long iova,
> >
> >               pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
> >                        iova, &paddr, pgsize);
> > +             ret =3D ops->map(domain, iova, paddr, pgsize, prot, gfp);
> >
> > -             ret =3D ops->map(domain, iova, paddr, pgsize, prot);
> >               if (ret)
> >                       break;
> >
> > @@ -1643,8 +1643,22 @@ int iommu_map(struct iommu_domain *domain, unsig=
ned long iova,
> >
> >       return ret;
> >   }
> > +
> > +int iommu_map(struct iommu_domain *domain, unsigned long iova,
> > +           phys_addr_t paddr, size_t size, int prot)
> > +{
> > +     might_sleep();
> > +     return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> > +}
> >   EXPORT_SYMBOL_GPL(iommu_map);
> >
> > +int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
> > +           phys_addr_t paddr, size_t size, int prot)
> > +{
> > +     return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
> > +}
> > +EXPORT_SYMBOL_GPL(iommu_map_atomic);
> > +
> >   static size_t __iommu_unmap(struct iommu_domain *domain,
> >                           unsigned long iova, size_t size,
> >                           bool sync)
> > @@ -1719,8 +1733,9 @@ size_t iommu_unmap_fast(struct iommu_domain *doma=
in,
> >   }
> >   EXPORT_SYMBOL_GPL(iommu_unmap_fast);
> >
> > -size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> > -                 struct scatterlist *sg, unsigned int nents, int prot)
> > +size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> > +                 struct scatterlist *sg, unsigned int nents, int prot,
> > +                 gfp_t gfp)
> >   {
> >       size_t len =3D 0, mapped =3D 0;
> >       phys_addr_t start;
> > @@ -1731,7 +1746,9 @@ size_t iommu_map_sg(struct iommu_domain *domain, =
unsigned long iova,
> >               phys_addr_t s_phys =3D sg_phys(sg);
> >
> >               if (len && s_phys !=3D start + len) {
> > -                     ret =3D iommu_map(domain, iova + mapped, start, l=
en, prot);
> > +                     ret =3D __iommu_map(domain, iova + mapped, start,
> > +                                     len, prot, gfp);
> > +
> >                       if (ret)
> >                               goto out_err;
> >
> > @@ -1759,8 +1776,22 @@ size_t iommu_map_sg(struct iommu_domain *domain,=
 unsigned long iova,
> >       return 0;
> >
> >   }
> > +
> > +size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> > +                 struct scatterlist *sg, unsigned int nents, int prot)
> > +{
> > +     might_sleep();
> > +     return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_KERNEL);
> > +}
> >   EXPORT_SYMBOL_GPL(iommu_map_sg);
> >
> > +size_t iommu_map_sg_atomic(struct iommu_domain *domain, unsigned long =
iova,
> > +                 struct scatterlist *sg, unsigned int nents, int prot)
> > +{
> > +     return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_ATOMIC);
> > +}
> > +EXPORT_SYMBOL_GPL(iommu_map_sg_atomic);
> > +
> >   int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_n=
r,
> >                              phys_addr_t paddr, u64 size, int prot)
> >   {
> > diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> > index 9a380c10655e..e005c83d49d8 100644
> > --- a/drivers/iommu/ipmmu-vmsa.c
> > +++ b/drivers/iommu/ipmmu-vmsa.c
> > @@ -707,7 +707,7 @@ static void ipmmu_detach_device(struct iommu_domain=
 *io_domain,
> >   }
> >
> >   static int ipmmu_map(struct iommu_domain *io_domain, unsigned long io=
va,
> > -                  phys_addr_t paddr, size_t size, int prot)
> > +                  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> >   {
> >       struct ipmmu_vmsa_domain *domain =3D to_vmsa_domain(io_domain);
> >
> > diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> > index 9fb0eb7a4d02..3f6bf3653aa2 100644
> > --- a/drivers/iommu/msm_iommu.c
> > +++ b/drivers/iommu/msm_iommu.c
> > @@ -508,7 +508,7 @@ static void msm_iommu_detach_dev(struct iommu_domai=
n *domain,
> >   }
> >
> >   static int msm_iommu_map(struct iommu_domain *domain, unsigned long i=
ova,
> > -                      phys_addr_t pa, size_t len, int prot)
> > +                      phys_addr_t pa, size_t len, int prot, gfp_t gfp)
> >   {
> >       struct msm_priv *priv =3D to_msm_priv(domain);
> >       unsigned long flags;
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index de3e02277b70..3176b9b54d4d 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -364,7 +364,7 @@ static void mtk_iommu_detach_device(struct iommu_do=
main *domain,
> >   }
> >
> >   static int mtk_iommu_map(struct iommu_domain *domain, unsigned long i=
ova,
> > -                      phys_addr_t paddr, size_t size, int prot)
> > +                      phys_addr_t paddr, size_t size, int prot, gfp_t =
gfp)
> >   {
> >       struct mtk_iommu_domain *dom =3D to_mtk_domain(domain);
> >       unsigned long flags;
> > diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.=
c
> > index 52b01e3a49df..e7b1907faec1 100644
> > --- a/drivers/iommu/mtk_iommu_v1.c
> > +++ b/drivers/iommu/mtk_iommu_v1.c
> > @@ -303,7 +303,7 @@ static void mtk_iommu_detach_device(struct iommu_do=
main *domain,
> >   }
> >
> >   static int mtk_iommu_map(struct iommu_domain *domain, unsigned long i=
ova,
> > -                      phys_addr_t paddr, size_t size, int prot)
> > +                      phys_addr_t paddr, size_t size, int prot, gfp_t =
gfp)
> >   {
> >       struct mtk_iommu_domain *dom =3D to_mtk_domain(domain);
> >       unsigned int page_num =3D size >> MT2701_IOMMU_PAGE_SHIFT;
> > diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> > index d2fb347aa4ff..c1d5a71285dc 100644
> > --- a/drivers/iommu/omap-iommu.c
> > +++ b/drivers/iommu/omap-iommu.c
> > @@ -1109,7 +1109,7 @@ static u32 iotlb_init_entry(struct iotlb_entry *e=
, u32 da, u32 pa, int pgsz)
> >   }
> >
> >   static int omap_iommu_map(struct iommu_domain *domain, unsigned long =
da,
> > -                       phys_addr_t pa, size_t bytes, int prot)
> > +                       phys_addr_t pa, size_t bytes, int prot, gfp_t g=
fp)
> >   {
> >       struct omap_iommu_domain *omap_domain =3D to_omap_domain(domain);
> >       struct device *dev =3D omap_domain->dev;
> > diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> > index 8cdd3f059513..a01e07a4e76f 100644
> > --- a/drivers/iommu/qcom_iommu.c
> > +++ b/drivers/iommu/qcom_iommu.c
> > @@ -411,7 +411,7 @@ static void qcom_iommu_detach_dev(struct iommu_doma=
in *domain, struct device *de
> >   }
> >
> >   static int qcom_iommu_map(struct iommu_domain *domain, unsigned long =
iova,
> > -                       phys_addr_t paddr, size_t size, int prot)
> > +                       phys_addr_t paddr, size_t size, int prot, gfp_t=
 gfp)
> >   {
> >       int ret;
> >       unsigned long flags;
> > diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-io=
mmu.c
> > index 77d4bd93fe4b..aa3507f35107 100644
> > --- a/drivers/iommu/rockchip-iommu.c
> > +++ b/drivers/iommu/rockchip-iommu.c
> > @@ -760,7 +760,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain=
 *rk_domain, u32 *pte_addr,
> >   }
> >
> >   static int rk_iommu_map(struct iommu_domain *domain, unsigned long _i=
ova,
> > -                     phys_addr_t paddr, size_t size, int prot)
> > +                     phys_addr_t paddr, size_t size, int prot, gfp_t g=
fp)
> >   {
> >       struct rk_iommu_domain *rk_domain =3D to_rk_domain(domain);
> >       unsigned long flags;
> > diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> > index 22d4db302c1c..efa6aa68521d 100644
> > --- a/drivers/iommu/s390-iommu.c
> > +++ b/drivers/iommu/s390-iommu.c
> > @@ -265,7 +265,7 @@ static int s390_iommu_update_trans(struct s390_doma=
in *s390_domain,
> >   }
> >
> >   static int s390_iommu_map(struct iommu_domain *domain, unsigned long =
iova,
> > -                       phys_addr_t paddr, size_t size, int prot)
> > +                       phys_addr_t paddr, size_t size, int prot, gfp_t=
 gfp)
> >   {
> >       struct s390_domain *s390_domain =3D to_s390_domain(domain);
> >       int flags =3D ZPCI_PTE_VALID, rc =3D 0;
> > diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> > index 4d8057916552..f300099852b1 100644
> > --- a/drivers/iommu/tegra-gart.c
> > +++ b/drivers/iommu/tegra-gart.c
> > @@ -190,7 +190,7 @@ static inline int __gart_iommu_map(struct gart_devi=
ce *gart, unsigned long iova,
> >   }
> >
> >   static int gart_iommu_map(struct iommu_domain *domain, unsigned long =
iova,
> > -                       phys_addr_t pa, size_t bytes, int prot)
> > +                       phys_addr_t pa, size_t bytes, int prot, gfp_t g=
fp)
> >   {
> >       struct gart_device *gart =3D gart_handle;
> >       int ret;
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index 5182c7d6171e..e1bf867e0607 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -641,7 +641,7 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as=
 *as, unsigned long iova,
> >   }
> >
> >   static int tegra_smmu_map(struct iommu_domain *domain, unsigned long =
iova,
> > -                       phys_addr_t paddr, size_t size, int prot)
> > +                       phys_addr_t paddr, size_t size, int prot, gfp_t=
 gfp)
> >   {
> >       struct tegra_smmu_as *as =3D to_smmu_as(domain);
> >       dma_addr_t pte_dma;
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index ffbbc7e39cee..76b8e7fe3ed0 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -198,7 +198,7 @@ struct iommu_ops {
> >       int (*attach_dev)(struct iommu_domain *domain, struct device *dev=
);
> >       void (*detach_dev)(struct iommu_domain *domain, struct device *de=
v);
> >       int (*map)(struct iommu_domain *domain, unsigned long iova,
> > -                phys_addr_t paddr, size_t size, int prot);
> > +                phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
> >       size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
> >                    size_t size);
> >       void (*flush_iotlb_all)(struct iommu_domain *domain);
> > @@ -295,12 +295,17 @@ extern struct iommu_domain *iommu_get_domain_for_=
dev(struct device *dev);
> >   extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
> >   extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
> >                    phys_addr_t paddr, size_t size, int prot);
> > +extern int iommu_map_atomic(struct iommu_domain *domain, unsigned long=
 iova,
> > +                  phys_addr_t paddr, size_t size, int prot);
> >   extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long =
iova,
> >                         size_t size);
> >   extern size_t iommu_unmap_fast(struct iommu_domain *domain,
> >                              unsigned long iova, size_t size);
> >   extern size_t iommu_map_sg(struct iommu_domain *domain, unsigned long=
 iova,
> >                          struct scatterlist *sg,unsigned int nents, int=
 prot);
> > +extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
> > +                               unsigned long iova, struct scatterlist =
*sg,
> > +                               unsigned int nents, int prot);
> >   extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dm=
a_addr_t iova);
> >   extern void iommu_set_fault_handler(struct iommu_domain *domain,
> >                       iommu_fault_handler_t handler, void *token);
> > @@ -469,6 +474,13 @@ static inline int iommu_map(struct iommu_domain *d=
omain, unsigned long iova,
> >       return -ENODEV;
> >   }
> >
> > +static inline int iommu_map_atomic(struct iommu_domain *domain,
> > +                                unsigned long iova, phys_addr_t paddr,
> > +                                size_t size, int prot)
> > +{
> > +     return -ENODEV;
> > +}
> > +
> >   static inline size_t iommu_unmap(struct iommu_domain *domain,
> >                                unsigned long iova, size_t size)
> >   {
> > @@ -488,6 +500,13 @@ static inline size_t iommu_map_sg(struct iommu_dom=
ain *domain,
> >       return 0;
> >   }
> >
> > +static inline size_t iommu_map_sg_atomic(struct iommu_domain *domain,
> > +                               unsigned long iova, struct scatterlist =
*sg,
> > +                               unsigned int nents, int prot)
> > +{
> > +     return 0;
> > +}
> > +
> >   static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
> >   {
> >   }
> >
