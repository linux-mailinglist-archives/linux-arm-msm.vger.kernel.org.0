Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E93216EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 16:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgGGOYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 10:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGGOYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 10:24:48 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57317C061755;
        Tue,  7 Jul 2020 07:24:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y10so46698718eje.1;
        Tue, 07 Jul 2020 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=McOB/0yYDJQ83thcjyemD5c9BdlKzyjDAog3KEfKSkg=;
        b=o3fLamn66/sQMIHRnVoui2FDdrvygbfj/EJvB9Xw4rIv+X9x15ea1yKUTl/955fnzN
         ilaKEb8ttIYKv59wL5G/bO46wHEJ9VdVfjJ9hiJOKl977QUGjg4Lf2pxJ3+c+cBdo7qj
         9cWYbEmJ0jAhS6KOF1mcCJOuaA0rI4YlTAepyHevjsGqCiKKzJ3Id+g6qy6HcrAzgRMy
         OuF87k/dWiLVPrbDxTo+ontV3+3tl9qTGWQUwmfVKEoEu9xKK70cbuv4fiMG+aXvoLBv
         MUubXLSuPp/SumMQ9Kn9iV2TGdU4QyxK2sw7Bx1d+C9FOSmta10Wl7OGhkkaIccGlxwy
         Mifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McOB/0yYDJQ83thcjyemD5c9BdlKzyjDAog3KEfKSkg=;
        b=EYPwY9rixJICPiRPqfM3TXpb5bJYJ6RpsS804bTbUk0Za1bcU87MJxqT2NFKsp6z2Q
         SVLVKxUO8juLFvjfgdWQF+tcMyVlQOK+LA4/KudbcxEVPDnA3ffNGkJbp6FtxW10aAfU
         CBmbmjmHupqtyDph7J0qFJQS4oWg2PHGeqkxeJfNsMYN25lPwa0k6eWaikNDJR6cLoBw
         KqPdYeQzNKurMAWWfHY7lGxWpamgnQSoqMx5ME337vf3jQx1i4nvKq1F4z8RPgmjYYSP
         eFgRyyr5vt9rkaCZUA4rtxHnuQ6jM6o/TaddRTMBVrYUZBv88qepF6CuGu1MB8GOMtNa
         5vZg==
X-Gm-Message-State: AOAM530TFtLwEnM5I8HbwWJKBoWL3EU4T+6nbuxhg8Gy1AHqIr+jD+Kr
        S/lqrqWV49lEK6vZCGUNLRymhsBKbDp0hXmW36E=
X-Google-Smtp-Source: ABdhPJwm/0c5b1pm+RO/PcvtbbwfHWJUpLgSJZX4m+kdgXqWpEywCtvCuyEdwfXmE9Q48ukNOV1sECfMMVrbTNnIlGw=
X-Received: by 2002:a17:906:1187:: with SMTP id n7mr41984337eja.161.1594131887033;
 Tue, 07 Jul 2020 07:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-3-jcrouse@codeaurora.org> <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
In-Reply-To: <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 7 Jul 2020 07:25:18 -0700
Message-ID: <CAF6AEGv2YXu44r9O0ZRkNM2ny4oMStxn4=GoCS3CLpPAKh_KZw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/6] iommu/io-pgtable: Allow a pgtable
 implementation to skip TLB operations
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 7, 2020 at 4:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-06-26 21:04, Jordan Crouse wrote:
> > Allow a io-pgtable implementation to skip TLB operations by checking for
> > NULL pointers in the helper functions. It will be up to to the owner
> > of the io-pgtable instance to make sure that they independently handle
> > the TLB correctly.
>
> I don't really understand what this is for - tricking the IOMMU driver
> into not performing its TLB maintenance at points when that maintenance
> has been deemed necessary doesn't seem like the appropriate way to
> achieve anything good :/

No, for triggering the io-pgtable helpers into not performing TLB
maintenance.  But seriously, since we are creating pgtables ourselves,
and we don't want to be ioremap'ing the GPU's SMMU instance, the
alternative is plugging in no-op helpers.  Which amounts to the same
thing.

Currently (in a later patch in the series) we are using
iommu_flush_tlb_all() when unmapping, which is a bit of a big hammer.
Although I think we could be a bit more clever and do the TLB ops on
the GPU (since the GPU knows if pagetables we are unmapping from are
in-use and could skip the TLB ops otherwise).

On the topic, if we are using unique ASID values per set of
pagetables, how expensive is tlb invalidate for an ASID that has no
entries in the TLB?

BR,
-R

>
> Robin.
>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >   include/linux/io-pgtable.h | 11 +++++++----
> >   1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index 53d53c6c2be9..bbed1d3925ba 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -210,21 +210,24 @@ struct io_pgtable {
> >
> >   static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
> >   {
> > -     iop->cfg.tlb->tlb_flush_all(iop->cookie);
> > +     if (iop->cfg.tlb)
> > +             iop->cfg.tlb->tlb_flush_all(iop->cookie);
> >   }
> >
> >   static inline void
> >   io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
> >                         size_t size, size_t granule)
> >   {
> > -     iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> > +     if (iop->cfg.tlb)
> > +             iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> >   }
> >
> >   static inline void
> >   io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
> >                         size_t size, size_t granule)
> >   {
> > -     iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> > +     if (iop->cfg.tlb)
> > +             iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> >   }
> >
> >   static inline void
> > @@ -232,7 +235,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
> >                       struct iommu_iotlb_gather * gather, unsigned long iova,
> >                       size_t granule)
> >   {
> > -     if (iop->cfg.tlb->tlb_add_page)
> > +     if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
> >               iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
> >   }
> >
> >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
