Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9349B25A205
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 01:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgIAXrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 19:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgIAXrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 19:47:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30559C061244;
        Tue,  1 Sep 2020 16:47:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so2461991wrv.1;
        Tue, 01 Sep 2020 16:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jRTuoyd0aXcHbT1FCJs9RFpBaj1SWDBNdxNAjLow6A=;
        b=n6smDPuHIimNu776vQSUaS1qsggoBq5uOTSwHLd5/IFbSMz5ED44hhXce9aEMpeJru
         ManD+gIWuESONyAVptU2MIj71LebpM14JXLMctKVe3L7glTMP7lE6BlnTos3LRqxZFJz
         SkQdY/SFu1A8/Bg2V80/DqvuAzb5I9Yv314kmaQWCQSdgMIJtsL4NnqeHmXR69SPWsWu
         p1YgYYiUZkPpVuwVgPsRk6EUe0dyUoHKEFpZN84ZR/hvpPcIKVDLW9lokYaoulBwmIe8
         NfOxsHq5MfAHB2qdlxxb9AEdjh7/kQscnsIEboSN5Nc575xjVgRk3CqpnChZQkrIUX9m
         yAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jRTuoyd0aXcHbT1FCJs9RFpBaj1SWDBNdxNAjLow6A=;
        b=mKknEWz5y0zKEHTCimn8jvx5pj8F/ShabhwIYfz+XjnF/BOnx45rrKTshajop4OxaY
         DaQfvbLKW5KZ+u3Hpb2xumUhl8FAFx3HmaB3B+TOmUdrZtb2o0Z+IXt9ITDImqHUSyHm
         QxRaZYkTyMQjubuyL0i8clWS4l1CTzsHXysk86kNwU+I3BvqsF3PrLNJuhjZ5ZqZJ2Iu
         mSpakKAtP2vhEQT2gFr6P/pr+DpRACyKWwi7BO8THVEHoXnNYR1bL7ZcEv0KOmp5bvq7
         suI+FUdgGNB0RUWElf+QTKOOzquPbHfMUtem6AWM40zMEDlrvxZ4JAkglsZhglKEkIyl
         Eqaw==
X-Gm-Message-State: AOAM531oXNEHJqfldcBUv3EOEVmvhI3jfb3SD2tww9eOIvhRqxb4B315
        hR6R3WFg6aaHOTiP6KO/X4M98qGeyPeeRshY67I=
X-Google-Smtp-Source: ABdhPJyxKRxrKYP38mwrpz7T/Q77cJAyI6CywuVy5qABpdgIdnJCw1QbCXjLLTX9MPIVNAtteXyldSgHtVE6jFLWLVA=
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr4572138wrt.132.1599004058403;
 Tue, 01 Sep 2020 16:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063535eucas1p10cef37d8364216cf57c97e96d3959dd2@eucas1p1.samsung.com>
 <20200826063316.23486-13-m.szyprowski@samsung.com> <fe224152-b621-d96e-b432-bf837d320210@arm.com>
In-Reply-To: <fe224152-b621-d96e-b432-bf837d320210@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 1 Sep 2020 16:48:25 -0700
Message-ID: <CAF6AEGscE4tdzugs75gFD+D43Un1DcKf8_=CwiPG2uHrytzwcQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/32] drm: msm: fix common struct sg_table related issues
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linaro-mm-sig@lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
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

On Tue, Sep 1, 2020 at 12:14 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-26 07:32, Marek Szyprowski wrote:
> > The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> > returns the number of the created entries in the DMA address space.
> > However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> > dma_unmap_sg must be called with the original number of the entries
> > passed to the dma_map_sg().
> >
> > struct sg_table is a common structure used for describing a non-contiguous
> > memory buffer, used commonly in the DRM and graphics subsystems. It
> > consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> > as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> > and DMA mapped pages (nents entry).
> >
> > It turned out that it was a common mistake to misuse nents and orig_nents
> > entries, calling DMA-mapping functions with a wrong number of entries or
> > ignoring the number of mapped entries returned by the dma_map_sg()
> > function.
> >
> > To avoid such issues, lets use a common dma-mapping wrappers operating
> > directly on the struct sg_table objects and use scatterlist page
> > iterators where possible. This, almost always, hides references to the
> > nents and orig_nents entries, making the code robust, easier to follow
> > and copy/paste safe.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Acked-by: Rob Clark <robdclark@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/msm_gem.c    | 13 +++++--------
> >   drivers/gpu/drm/msm/msm_gpummu.c | 14 ++++++--------
> >   drivers/gpu/drm/msm/msm_iommu.c  |  2 +-
> >   3 files changed, 12 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index b2f49152b4d4..8c7ae812b813 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -53,11 +53,10 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
> >       struct device *dev = msm_obj->base.dev->dev;
> >
> >       if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
> > -             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> > -                     msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> > +             dma_sync_sgtable_for_device(dev, msm_obj->sgt,
> > +                                         DMA_BIDIRECTIONAL);
> >       } else {
> > -             dma_map_sg(dev, msm_obj->sgt->sgl,
> > -                     msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> > +             dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
> >       }
> >   }
> >
> > @@ -66,11 +65,9 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
> >       struct device *dev = msm_obj->base.dev->dev;
> >
> >       if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
> > -             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> > -                     msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> > +             dma_sync_sgtable_for_cpu(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
> >       } else {
> > -             dma_unmap_sg(dev, msm_obj->sgt->sgl,
> > -                     msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> > +             dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
> >       }
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> > index 310a31b05faa..319f06c28235 100644
> > --- a/drivers/gpu/drm/msm/msm_gpummu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> > @@ -30,21 +30,19 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
> >   {
> >       struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
> >       unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
> > -     struct scatterlist *sg;
> > +     struct sg_dma_page_iter dma_iter;
> >       unsigned prot_bits = 0;
> > -     unsigned i, j;
> >
> >       if (prot & IOMMU_WRITE)
> >               prot_bits |= 1;
> >       if (prot & IOMMU_READ)
> >               prot_bits |= 2;
> >
> > -     for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> > -             dma_addr_t addr = sg->dma_address;
> > -             for (j = 0; j < sg->length / GPUMMU_PAGE_SIZE; j++, idx++) {
> > -                     gpummu->table[idx] = addr | prot_bits;
> > -                     addr += GPUMMU_PAGE_SIZE;
> > -             }
> > +     for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> > +             dma_addr_t addr = sg_page_iter_dma_address(&dma_iter);
> > +
> > +             BUILD_BUG_ON(GPUMMU_PAGE_SIZE != PAGE_SIZE);
> > +             gpummu->table[idx++] = addr | prot_bits;
>
> Given that the BUILD_BUG_ON might prevent valid arm64 configs from
> building, how about a simple tweak like:
>
>                 for (i = 0; i < PAGE_SIZE; i += GPUMMU_PAGE_SIZE)
>                         gpummu->table[idx++] = i + addr | prot_bits;
> ?
>
> Or alternatively perhaps some more aggressive #ifdefs or makefile tweaks
> to prevent the GPUMMU code building for arm64 at all if it's only
> relevant to 32-bit platforms (which I believe might be the case).

yes, the gpummu path is only used on older armv7 snapdragon and imx5
platforms.. I suppose maybe the easy thing would be to add a stub for
msm_gpummu_new() and msm_gpummu_params() and then only build it on
arm64?

BR,
-R


> Robin.
>
> >       }
> >
> >       /* we can improve by deferring flush for multiple map() */
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 3a381a9674c9..6c31e65834c6 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -36,7 +36,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
> >       struct msm_iommu *iommu = to_msm_iommu(mmu);
> >       size_t ret;
> >
> > -     ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> > +     ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
> >       WARN_ON(!ret);
> >
> >       return (ret == len) ? 0 : -EINVAL;
> >
