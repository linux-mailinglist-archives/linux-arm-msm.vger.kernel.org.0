Return-Path: <linux-arm-msm+bounces-30928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E496396DAF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699251F253A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F6519D8BC;
	Thu,  5 Sep 2024 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MghnOLUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E42319CCEC;
	Thu,  5 Sep 2024 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725544658; cv=none; b=L6r2JomyPgpB1S58WRMpVFX1RSpXLYqgihQ9DiZnpJT16Js+9XDnbeWqOuXQMiv4r3O/Y5Kg0c1En5xR0/PAWa2Qbhx3/q9MpTnxKd/VQn8q7njQiRDKP2IeYIC4enMevuuOF/wL8rCTPbmgIccXKNU3ZtSa2O2STYcDy/l4VRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725544658; c=relaxed/simple;
	bh=ICoiFojqXJghEOejDRRpEkyrTboLl9TIGErwYJpH6HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofYpWN9+DIqF+57EuRKaVd9/AKEulCCg1x2OfOl3lFVJvNWlZwKVjgzMFjqbk0Z7snYUe2mV8a2i7MjS5MsXvbEV9GWDhnR/fuBKAvT4LADrPZ3nM0YTn+KaSECAkhbbBdopmFpfIjiGBgTSgZaKZOslqMtBuINDzUjyjZj3G5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MghnOLUA; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-39e6b1ab200so3098615ab.0;
        Thu, 05 Sep 2024 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725544655; x=1726149455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc5+mSx3W5XFfGXytntTUzm4xnx4wnnrB9kh6mhBy6M=;
        b=MghnOLUALjr/Z9oF7dvLCZwCf6NzRlyQFUHJn8RzQr40NaB1oLaeuOm8ZTRfxecYCT
         yldTEhTRpnk0QmciR1mxiKEDWGOr3N8L7mqnotW0I91eHXAtfjND/0oUcH2Km8NOt21I
         2oVuWlkbbHiD9SGoLs7+U8t4y33ch3YeF4gQtkULUK++FWacSfBeueTZ5ZepKFwwXCpS
         +CoLoG/HcD8t0trBEukFTp2UEwxB0RsmDe5x6K0qfDVbuwfoFnZ9JcD65rQ51K1uVY3e
         zLTh9v2IChuSyImOLfiQVvhuHnZ759ZprNhiLObMmopZnBjEn1JdlF5Dw5SdoGUQAeLb
         +u4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725544655; x=1726149455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oc5+mSx3W5XFfGXytntTUzm4xnx4wnnrB9kh6mhBy6M=;
        b=XQRxWezQ10Hh4Z1Gz+Ussbu19pZ7OwDtOYeJZf5KHPkMKbjmABKZsDz1OItoirL083
         yi60+KycPFr8aciow8Dv3cpFv/QPzOCemCdYtT05Z6Rdltv2YdgdpJlvZjvnWYwBQ7XL
         tspOpU7LT2Dpri91DN+f6tWxbezhUYpxQiZEhwdSb5yzZXul2ZAsUzrBl3k2HU0H/KCB
         fk0lOWgzEgXWf7vHiHyzCRlSQTfrpaSFyn5pSpT6f9f4ah/bcpjZzjB65q9Tftvjt+Li
         A16Djt7Onow8VYST523accjOC4yX7XGTsiY5julP0BF2b88dtRHi5GCHD9dvCZIdgoEC
         BKOA==
X-Forwarded-Encrypted: i=1; AJvYcCVT77eT8cFgCTB3SE+b+rmURYHfIfDm0eOY9yCTye2yvwwmekUUTpTXscrx/ihqNqjHpkQ++I5idesxbYJG@vger.kernel.org, AJvYcCXOZ2wuVCAVKfcbbS1Nr9Sb43Rc2e2quVuuRKMqeXXMk7Wu7GxD0hJQ3CtMl3Z6+lJFkFlJZsoXg2iEikug@vger.kernel.org
X-Gm-Message-State: AOJu0YwV01dxyIXm2MzjGWbLg9bhVLkFySRawypwlSLpDoA2JnyVZ52c
	B7z1Luu4cxU/1oOPVNKkWKhi69N0kGtJNBu/WAYzqZo26v2s4xEvxZR9Yj1k9bW6bQ1Xpz/uczD
	9Zv7+axM/EpqW6WmlZCKJwB6LgBY=
X-Google-Smtp-Source: AGHT+IH19xIWuVYCDQUvgge4detxZmlypKKLvCBkh2uWT8rdoV0uXU1DBfLhUeWBn085IemWYq1jY9RKwCVgIwlHcUo=
X-Received: by 2002:a05:6e02:1a6d:b0:39a:ea89:22ec with SMTP id
 e9e14a558f8ab-39f4f68d785mr219239495ab.9.1725544654507; Thu, 05 Sep 2024
 06:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com> <fb54ef8d-f769-47d5-8a9d-aa93f96d5c41@arm.com>
In-Reply-To: <fb54ef8d-f769-47d5-8a9d-aa93f96d5c41@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2024 06:57:22 -0700
Message-ID: <CAF6AEGuv=yyVDx58iWU203BQPp-pT2SAC9yW-JMm2U+MTsGUaQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 6:24=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/09/2024 1:49 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> >
> > It was causing gpu smmu faults on x1e80100.
> >
> > I _think_ what is causing this is the change in ordering of
> > __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> > memory) and io_pgtable_tlb_flush_walk().
>
> As I just commented, how do you believe the order of operations between:
>
>         __arm_lpae_clear_pte();
>         if (!iopte_leaf()) {
>                 io_pgtable_tlb_flush_walk();
>
> and:
>
>         if (!iopte_leaf()) {
>                 __arm_lpae_clear_pte();
>                 io_pgtable_tlb_flush_walk();
>
> fundamentally differs?

from my reading of the original patch, the ordering is the same for
non-leaf nodes, but not for leaf nodes

> I'm not saying there couldn't be some subtle bug in the implementation
> which we've all missed, but I still can't see an issue with the intended
> logic.
>
> >  I'm not entirely sure how
> > this patch is supposed to work correctly in the face of other
> > concurrent translations (to buffers unrelated to the one being
> > unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> > stale data read back into the tlb.
>
> Read back from where? The ex-table PTE which was already set to zero
> before tlb_flush_walk was called?
>
> And isn't the hilariously overcomplicated TBU driver supposed to be
> telling you exactly what happened here? Otherwise I'm going to continue
> to seriously question the purpose of shoehorning that upstream at all...

I guess I could try the TBU driver.  But I already had my patchset to
extract the pgtable walk for gpu devcore dump, and that is telling me
that the CPU view of the pgtable is fine.  Which I think just leaves a
tlbinv problem.  If that is the case, swapping the order of leaf node
cpu cache ops and tlbinv ops seems like the cause.  But maybe I'm
missing something.

BR,
-R

> Thanks,
> Robin.
>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
> >   1 file changed, 14 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index 16e51528772d..85261baa3a04 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -274,13 +274,13 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *p=
tep, int num_entries,
> >                                  sizeof(*ptep) * num_entries, DMA_TO_DE=
VICE);
> >   }
> >
> > -static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtab=
le_cfg *cfg, int num_entries)
> > +static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtab=
le_cfg *cfg)
> >   {
> > -     for (int i =3D 0; i < num_entries; i++)
> > -             ptep[i] =3D 0;
> >
> > -     if (!cfg->coherent_walk && num_entries)
> > -             __arm_lpae_sync_pte(ptep, num_entries, cfg);
> > +     *ptep =3D 0;
> > +
> > +     if (!cfg->coherent_walk)
> > +             __arm_lpae_sync_pte(ptep, 1, cfg);
> >   }
> >
> >   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> > @@ -653,28 +653,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io=
_pgtable *data,
> >               max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx=
_start;
> >               num_entries =3D min_t(int, pgcount, max_entries);
> >
> > -             /* Find and handle non-leaf entries */
> > -             for (i =3D 0; i < num_entries; i++) {
> > -                     pte =3D READ_ONCE(ptep[i]);
> > +             while (i < num_entries) {
> > +                     pte =3D READ_ONCE(*ptep);
> >                       if (WARN_ON(!pte))
> >                               break;
> >
> > -                     if (!iopte_leaf(pte, lvl, iop->fmt)) {
> > -                             __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
> > +                     __arm_lpae_clear_pte(ptep, &iop->cfg);
> >
> > +                     if (!iopte_leaf(pte, lvl, iop->fmt)) {
> >                               /* Also flush any partial walks */
> >                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 size, size,
> >                                                         ARM_LPAE_GRANUL=
E(data));
> >                               __arm_lpae_free_pgtable(data, lvl + 1, io=
pte_deref(pte, data));
> > +                     } else if (!iommu_iotlb_gather_queued(gather)) {
> > +                             io_pgtable_tlb_add_page(iop, gather, iova=
 + i * size, size);
> >                       }
> > -             }
> >
> > -             /* Clear the remaining entries */
> > -             __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> > -
> > -             if (gather && !iommu_iotlb_gather_queued(gather))
> > -                     for (int j =3D 0; j < i; j++)
> > -                             io_pgtable_tlb_add_page(iop, gather, iova=
 + j * size, size);
> > +                     ptep++;
> > +                     i++;
> > +             }
> >
> >               return i * size;
> >       } else if (iopte_leaf(pte, lvl, iop->fmt)) {

