Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6BD30AC7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 17:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhBAQSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 11:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhBAQSx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 11:18:53 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A807DC061573;
        Mon,  1 Feb 2021 08:18:11 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v15so17250138wrx.4;
        Mon, 01 Feb 2021 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tVx3P1GkJGLI1uKBNlxXY3RMDtB/IpyYjPT6P6zHw5s=;
        b=gS7cvhd9tIsWsQWamd844erzMzEv+0azffG4y1wnD7p6yHLCPnwK1aG4LbChngEOSC
         8/weiexIBXRCHk53nWXfv/Iyj8jDwsjtuplhe5CGty81EU/CxmmwQ9qj8Ad2xBUhkyoa
         BPLiuGV/g9R2Y7wGLkD2eEL7eY3SBOT0jaoYns5AV+pkP8mD83TDp1eXF5osBlCtAEfx
         Af01yVytJ4pAuQAfCOc/FCxZosdmRwhn4p6PIWo/9BtvnILStCOvKMcOVQbspyJmReZk
         zUXVtvGTZgeNd/BAfuhrvN9U1c7h8QzABedZOgYceTPH3Ot98yLe651CV1PaIFqQSYeN
         V5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tVx3P1GkJGLI1uKBNlxXY3RMDtB/IpyYjPT6P6zHw5s=;
        b=if57/V1hfnwh0sR1VK7VXYvPYPidUoaVQ6tN5896Ssh/q7H0yjDFa+4SVlTfwGaWW5
         QaqP7cNQQ42glaZB1X494wZWtorw75gahYuULmAHE6PVG7rmjQV1FOEjvsH2HiFoQNTG
         ysU5umbpwnQN8JNAifEPO0q3nQ/Dnnadogu9Gvr2QLIfgphBWc7WlIZ1L/VQ0bbXFrII
         QGgO9QVCiuNkDqW6g57pBy6NaUCLYxGdln9iqq4Lkyxwvsadqu2dHTGy1MAHDDzJ/+3E
         c33Use8eNIi3Z2uH3Zc216j7C7bbfid2zowmw4IJHymyJ7p+LUrKTvp8TTQElKVbowtD
         mvgw==
X-Gm-Message-State: AOAM532TP+VL7pTI9LO43pEBIf7x8Br3PAicKbBUSwG2yGXF9oV+tK5J
        bywY4ZFGqi4mQQ3q1Im3YlWUtFQYZiOpCjSTd3s=
X-Google-Smtp-Source: ABdhPJx8q9wwVZBia3ylOOk6tIuKE9b+ySiZiBv3V7ppswlXm6ZEtFt5l8YWZ+VVvUpdPPdbcnjj4tChykQ3ODiG83E=
X-Received: by 2002:adf:dd07:: with SMTP id a7mr19293832wrm.83.1612196290263;
 Mon, 01 Feb 2021 08:18:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck> <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
In-Reply-To: <20210201111556.GA7172@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Feb 2021 08:20:44 -0800
Message-ID: <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
To:     Will Deacon <will@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > On 2021-01-29 14:35, Will Deacon wrote:
> > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > Add a new page protection flag IOMMU_LLC which can be used
> > > > by non-coherent masters to set cacheable memory attributes
> > > > for an outer level of cache called as last-level cache or
> > > > system cache. Initial user of this page protection flag is
> > > > the adreno gpu and then can later be used by other clients
> > > > such as video where this can be used for per-buffer based
> > > > mapping.
> > > >
> > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > > ---
> > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
> > > >  include/linux/iommu.h          | 6 ++++++
> > > >  2 files changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/iommu/io-pgtable-arm.c
> > > > b/drivers/iommu/io-pgtable-arm.c
> > > > index 7439ee7fdcdb..ebe653ef601b 100644
> > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
> > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
> > > >           else if (prot & IOMMU_CACHE)
> > > >                   pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
> > > >                           << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > > +         else if (prot & IOMMU_LLC)
> > > > +                 pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
> > > > +                         << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > >   }
> > > >
> > > >   if (prot & IOMMU_CACHE)
> > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > > index ffaa389ea128..1f82057df531 100644
> > > > --- a/include/linux/iommu.h
> > > > +++ b/include/linux/iommu.h
> > > > @@ -31,6 +31,12 @@
> > > >   * if the IOMMU page table format is equivalent.
> > > >   */
> > > >  #define IOMMU_PRIV       (1 << 5)
> > > > +/*
> > > > + * Non-coherent masters can use this page protection flag to set
> > > > cacheable
> > > > + * memory attributes for only a transparent outer level of cache,
> > > > also known as
> > > > + * the last-level or system cache.
> > > > + */
> > > > +#define IOMMU_LLC        (1 << 6)
> > >
> > > On reflection, I'm a bit worried about exposing this because I think it
> > > will
> > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > MAIR
> > > set up for this memory type). Now, we also have that issue for the PTW,
> > > but
> > > since we always use cache maintenance (i.e. the streaming API) for
> > > publishing the page-tables to a non-coheren walker, it works out.
> > > However,
> > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > allocation, then they're potentially in for a nasty surprise due to the
> > > mismatched outer-cacheability attributes.
> > >
> >
> > Can't we add the syscached memory type similar to what is done on android?
>
> Maybe. How does the GPU driver map these things on the CPU side?

Currently we use writecombine mappings for everything, although there
are some cases that we'd like to use cached (but have not merged
patches that would give userspace a way to flush/invalidate)

BR,
-R
