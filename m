Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FFA1C37B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 08:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfENG4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 02:56:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38628 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfENG4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 02:56:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AE1F3602DC; Tue, 14 May 2019 06:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557817003;
        bh=YbCMg9q9sBLc3fJxn2hqKhzGhuLKnHO2+q9S7K7wCHA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gZDflyB4sz8QNmCF1TST2PdBum6IwkE2DRD1xlKUiKeZxNuEKhaO0foXHjVT0bz9i
         XVdkMMZoT1d/scVJnMxmFFl4h0nLCOTHyyPpD4oVoV6yWiqkOBrE204Yy3rGSVVaQe
         xWPn7RSz/ATmoIYXDrgyMWYZlONjE5B9HAmhtvfA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 994AD602DC;
        Tue, 14 May 2019 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557817002;
        bh=YbCMg9q9sBLc3fJxn2hqKhzGhuLKnHO2+q9S7K7wCHA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KWaFgXrNaDe51ouWPsXt5smZpBHgyUS9VReQZ0Ymy1EyAOn1HKe1IROnS3pXLRRFU
         2ea4tlUes9UuInlI1rgQ9mz4Y6VTqz+hzA4/NMRR15wqh8ppN8VwJ8sh5nIrbH67nx
         zb9Nn+u4/Es43ioaznd8THNzbcIYvaG8u7ntrd5Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 994AD602DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f46.google.com with SMTP id p26so21299095edr.2;
        Mon, 13 May 2019 23:56:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVdDzF8LCOA8xd6Pm3ghynd0lHCgDj7QP8QI5uFjhbxj+Ra3ppt
        rdMuVofA1/Id5eJ760JjNOLVe3g/Q8OQOmwFqfs=
X-Google-Smtp-Source: APXvYqxdecIIrC9t9SvKavda81uHlDzBZ7FRquT0EGiRV7bOSzF8qWkN9acHi6LQaNpyPTJhBKy5kqxAj3Nt0mkmn64=
X-Received: by 2002:aa7:d381:: with SMTP id x1mr34647046edq.251.1557817001406;
 Mon, 13 May 2019 23:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190513100403.18981-1-vivek.gautam@codeaurora.org> <dc53456d-027e-0ede-1ce9-1efa476937a9@arm.com>
In-Reply-To: <dc53456d-027e-0ede-1ce9-1efa476937a9@arm.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Tue, 14 May 2019 12:26:30 +0530
X-Gmail-Original-Message-ID: <CAFp+6iH0f+uUCWjS738M_W0bW7eF2=DSu9rtEbexCoWio+TZsQ@mail.gmail.com>
Message-ID: <CAFp+6iH0f+uUCWjS738M_W0bW7eF2=DSu9rtEbexCoWio+TZsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] iommu/io-pgtable-arm: Add support to use system cache
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        pratikp@codeaurora.org, open list <linux-kernel@vger.kernel.org>,
        pdaly@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,


On Mon, May 13, 2019 at 5:02 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 13/05/2019 11:04, Vivek Gautam wrote:
> > Few Qualcomm platforms such as, sdm845 have an additional outer
> > cache called as System cache, aka. Last level cache (LLC) that
> > allows non-coherent devices to upgrade to using caching.
> > This cache sits right before the DDR, and is tightly coupled
> > with the memory controller. The clients using this cache request
> > their slices from this system cache, make it active, and can then
> > start using it.
> >
> > There is a fundamental assumption that non-coherent devices can't
> > access caches. This change adds an exception where they *can* use
> > some level of cache despite still being non-coherent overall.
> > The coherent devices that use cacheable memory, and CPU make use of
> > this system cache by default.
> >
> > Looking at memory types, we have following -
> > a) Normal uncached :- MAIR 0x44, inner non-cacheable,
> >                        outer non-cacheable;
> > b) Normal cached :-   MAIR 0xff, inner read write-back non-transient,
> >                        outer read write-back non-transient;
> >                        attribute setting for coherenet I/O devices.
> > and, for non-coherent i/o devices that can allocate in system cache
> > another type gets added -
> > c) Normal sys-cached :- MAIR 0xf4, inner non-cacheable,
> >                          outer read write-back non-transient
> >
> > Coherent I/O devices use system cache by marking the memory as
> > normal cached.
> > Non-coherent I/O devices should mark the memory as normal
> > sys-cached in page tables to use system cache.
> >
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > ---
> >
> > V3 version of this patch and related series can be found at [1].
> >
> > This change is a realisation of following changes from downstream msm-4.9:
> > iommu: io-pgtable-arm: Implement IOMMU_USE_UPSTREAM_HINT[2]
> >
> > Changes since v3:
> >   - Dropping support to cache i/o page tables to system cache. Getting support
> >     for data buffers is the first step.
> >     Removed io-pgtable quirk and related change to add domain attribute.
> >
> > Glmark2 numbers on SDM845 based cheza board:
> >
> > S.No.|        with LLC support   |    without LLC support
> >       |       for data buffers   |
> > ---------------------------------------------------
> > 1    |        4480; 72.3fps      |    4042; 65.2fps
> > 2    |        4500; 72.6fps      |    4039; 65.1fps
> > 3    |        4523; 72.9fps      |    4106; 66.2fps
> > 4    |        4489; 72.4fps      |    4104; 66.2fps
> > 5    |        4518; 72.9fps      |    4072; 65.7fps
> >
> > [1] https://patchwork.kernel.org/cover/10772629/
> > [2] https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/?h=msm-4.9&id=d4c72c413ea27c43f60825193d4de9cb8ffd9602
> >
> >   drivers/iommu/io-pgtable-arm.c | 9 ++++++++-
> >   include/linux/iommu.h          | 1 +
> >   2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index d3700ec15cbd..2dbafe697531 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -167,10 +167,12 @@
> >   #define ARM_LPAE_MAIR_ATTR_MASK             0xff
> >   #define ARM_LPAE_MAIR_ATTR_DEVICE   0x04
> >   #define ARM_LPAE_MAIR_ATTR_NC               0x44
> > +#define ARM_LPAE_MAIR_ATTR_QCOM_SYS_CACHE    0xf4
> >   #define ARM_LPAE_MAIR_ATTR_WBRWA    0xff
> >   #define ARM_LPAE_MAIR_ATTR_IDX_NC   0
> >   #define ARM_LPAE_MAIR_ATTR_IDX_CACHE        1
> >   #define ARM_LPAE_MAIR_ATTR_IDX_DEV  2
> > +#define ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE        3
>
> Here at the implementation level, I'd rather just call these what they
> are, i.e. s/QCOM_SYS_CACHE/INC_OWBRWA/.
>

Thanks for the review.
Sure, will change this as suggested.

> >
> >   /* IOPTE accessors */
> >   #define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
> > @@ -442,6 +444,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
> >               else if (prot & IOMMU_CACHE)
> >                       pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
> >                               << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > +             else if (prot & IOMMU_QCOM_SYS_CACHE)
>
> Where in the call stack is this going to be decided? (I don't recall the
> previous discussions ever really reaching a solid conclusion on how to
> separate responsibilities).
>

Based on the last discussion [1], I understood that we may not want to expose
these cache protections to DMA APIs. So such control would lie with the masters
that are creating the individual domains. An example [2] of this is
graphics on sdm845.
Please ignore the change in naming at [2] IOMMU_UPSTREAM_HINT in [2] is same as
IOMMU_QCOM_SYS_CACHE here.

At that point [1] I also pointed to the fact that video that uses DMA
APIs to handle
buffers too uses system cache on sdm845. In this case shouldn't we expose the
protection controls to DMA APIs? Or would you suggest that such devices get
iommu domains in the driver, and then update these protection flags?

[1] https://lkml.org/lkml/2018/12/4/790
[2] https://patchwork.kernel.org/patch/10302791/

> > +                     pte |= (ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE
> > +                             << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> >       } else {
> >               pte = ARM_LPAE_PTE_HAP_FAULT;
> >               if (prot & IOMMU_READ)
> > @@ -841,7 +846,9 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
> >             (ARM_LPAE_MAIR_ATTR_WBRWA
> >              << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
> >             (ARM_LPAE_MAIR_ATTR_DEVICE
> > -            << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
> > +            << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
> > +           (ARM_LPAE_MAIR_ATTR_QCOM_SYS_CACHE
> > +            << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE));
> >
> >       cfg->arm_lpae_s1_cfg.mair[0] = reg;
> >       cfg->arm_lpae_s1_cfg.mair[1] = 0;
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index a815cf6f6f47..29dd2c624348 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -31,6 +31,7 @@
> >   #define IOMMU_CACHE (1 << 2) /* DMA cache coherency */
> >   #define IOMMU_NOEXEC        (1 << 3)
> >   #define IOMMU_MMIO  (1 << 4) /* e.g. things like MSI doorbells */
> > +#define IOMMU_QCOM_SYS_CACHE (1 << 6)
>
> Nit: 6 usually comes *after* 5 ;)

Sorry, pasting mistake.

>
> Plus although it's fairly self-evident that this value has *something*
> to do with Qcom system caches and isn't as generic as, say, IOMMU_PRIV,
> it probably still warrants some degree of comment.

I will add the necessary comments.

Best regards
Vivek
>
> Robin.
>
> >   /*
> >    * Where the bus hardware includes a privilege level as part of its access type
> >    * markings, and certain devices are capable of issuing transactions marked as
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
