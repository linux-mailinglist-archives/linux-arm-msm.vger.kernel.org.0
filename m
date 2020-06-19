Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05092017A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 18:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388664AbgFSQle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 12:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388648AbgFSOpF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 10:45:05 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E319FC06174E;
        Fri, 19 Jun 2020 07:45:05 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id x93so7786901ede.9;
        Fri, 19 Jun 2020 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3TBE7tx6S7GnpZVCrwlr/3N+oOzUPGbvusmUOmG/T0=;
        b=AxLuXevQ37Qe6irR4ELS8KP+FbtI7KzXJI7NPPBrQFIdiz2bPyjW2dwsDyUEuAZ6Gj
         obAXbSqGvGp46HL1svoQ4ohhMLjIhlffXnHZ/rd6JE333aLAHAfe6p6IEAkDpMyo0pXz
         3gqCLLWBaQXFA+AKx51giDtpvGcOTXpNZQBkXRmjuL5/eK+mv5WjFpQ7EHYykN0iQqJQ
         5tiAnbC+hsmw05IcJKVRoieT8Q91BROe1dS0b8nEaqn6ub+ly4za5VRH9v4PT/EhZQS7
         GynsqTBgTG8dn/wZF0n7EHmYWJlx404GKADvC7euqmHvIFUdOyYzOlOpc7sXgaE5Mzfs
         JnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3TBE7tx6S7GnpZVCrwlr/3N+oOzUPGbvusmUOmG/T0=;
        b=lAFkGAcwsAPeoerzFEX75MQHoTrelQmVfx9UR3BgD+iIAey2JSOW9eLd+yn46Lf0lk
         RRs9LKu2fFCs8yp77CHpTMiKod2o7EehHPhZTxJRxL07bkG7aM/ZjYz6yk+0UyRMZx72
         G8DdJpbWJh0pskhANartUxuelfMObK65nLfalbDbalFxn7JhmA1VjnkN5dGl027TKTjH
         Q2PknDu1HNZuLGLia24T8XNxsGPOnZ7LuRMa/th55O1Te4/kCB4d3DFFg2p77i68RrHU
         Urfig79I1ilbLuBJ4uDCKsxkTroY7BVYptRrFnn9CTRzMU7o88tjFkyKRkcK8U7o4GwG
         u9LA==
X-Gm-Message-State: AOAM532qkrO/gX7uaPBoqYYYHQFxsOqvzhIe0Iblw2sr92xeMPFfH5Tc
        ldirfodSGA9qvc8FfeQ4wgCxcoIRY2ocjGXQsBU=
X-Google-Smtp-Source: ABdhPJyrHWOsI7xCVBWiV5yZaFNfurId9widfkp7/AgosrKLWEbgVSdn17jhr9iXO5CndhUq8INILlVyez+GNc7k8GQ=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr3712651eds.7.1592577904398;
 Fri, 19 Jun 2020 07:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5@eucas1p1.samsung.com>
 <20200619103636.11974-1-m.szyprowski@samsung.com> <20200619103636.11974-14-m.szyprowski@samsung.com>
In-Reply-To: <20200619103636.11974-14-m.szyprowski@samsung.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 19 Jun 2020 07:45:32 -0700
Message-ID: <CAF6AEGv9We+wD72_px3mucsXQuTFZ3ZX_CAA1LTysMBdiDcEFw@mail.gmail.com>
Subject: Re: [PATCH v7 13/36] drm: msm: fix common struct sg_table related issues
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linaro-mm-sig@lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 19, 2020 at 3:37 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
>
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
>
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
>
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Rob Clark <robdclark@gmail.com>

(let me know if you want me to take this one in via msm-next or if the
plan is to take the series via drm-misc)


> ---
>  drivers/gpu/drm/msm/msm_gem.c    | 13 +++++--------
>  drivers/gpu/drm/msm/msm_gpummu.c | 14 ++++++--------
>  drivers/gpu/drm/msm/msm_iommu.c  |  2 +-
>  3 files changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 38b0c0e1f83e..e0d5fd36ea8f 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -53,11 +53,10 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
>         struct device *dev = msm_obj->base.dev->dev;
>
>         if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
> -               dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_sync_sgtable_for_device(dev, msm_obj->sgt,
> +                                           DMA_BIDIRECTIONAL);
>         } else {
> -               dma_map_sg(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
>         }
>  }
>
> @@ -66,11 +65,9 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
>         struct device *dev = msm_obj->base.dev->dev;
>
>         if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
> -               dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_sync_sgtable_for_cpu(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
>         } else {
> -               dma_unmap_sg(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 310a31b05faa..319f06c28235 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -30,21 +30,19 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
>  {
>         struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
>         unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
> -       struct scatterlist *sg;
> +       struct sg_dma_page_iter dma_iter;
>         unsigned prot_bits = 0;
> -       unsigned i, j;
>
>         if (prot & IOMMU_WRITE)
>                 prot_bits |= 1;
>         if (prot & IOMMU_READ)
>                 prot_bits |= 2;
>
> -       for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> -               dma_addr_t addr = sg->dma_address;
> -               for (j = 0; j < sg->length / GPUMMU_PAGE_SIZE; j++, idx++) {
> -                       gpummu->table[idx] = addr | prot_bits;
> -                       addr += GPUMMU_PAGE_SIZE;
> -               }
> +       for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> +               dma_addr_t addr = sg_page_iter_dma_address(&dma_iter);
> +
> +               BUILD_BUG_ON(GPUMMU_PAGE_SIZE != PAGE_SIZE);
> +               gpummu->table[idx++] = addr | prot_bits;
>         }
>
>         /* we can improve by deferring flush for multiple map() */
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 3a381a9674c9..6c31e65834c6 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -36,7 +36,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
>         size_t ret;
>
> -       ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> +       ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
>         WARN_ON(!ret);
>
>         return (ret == len) ? 0 : -EINVAL;
> --
> 2.17.1
>
