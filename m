Return-Path: <linux-arm-msm+bounces-30999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EA96E0B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 564451C25111
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915321A2C39;
	Thu,  5 Sep 2024 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhkebIbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E21A3026;
	Thu,  5 Sep 2024 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725555638; cv=none; b=AVfdLDvkCdwjTWpW7CNxVUCJXngfKvQDV3asX8tit6o0FkcpzvnjGx3QPPEFvcLoacoa+MQcfqM/g+W3W1jyUnrShHt76uNOriZLGJ+dh6KT7y+vUBGdFl4ljvlA2lp9StO5uR9UdOrHfZLqgxHSm2ZFARoaxFhiwEoWreJ1Xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725555638; c=relaxed/simple;
	bh=0xRWDki03sNCLRzgJ+q3t0ANUfhb4+r2+irubfO7wyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSqcyUJMzJbH+nxP8+yiEwtCZPjiOqsCFpp/rNG3v+25ued1QHGzTzfnf6T4wjPyNfbOhJPjJiv8OjBIWSrUhcpdnFcfGLgrya4OC3mZj6GjB4lpDto0M9SG7Al1kxrE7/FBmRX6Sz4ROTvFKys4a4DY2OFs9S8LDTir7rNNkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhkebIbs; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-39f4f62a303so3519285ab.1;
        Thu, 05 Sep 2024 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725555635; x=1726160435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZV/Ct62i0SWe/eQOuu8hbmxJsUYcvz+0fB6177mZLk=;
        b=LhkebIbskAn9T9SRN7lozgeewGAJ5utyg4DIPEJmhFKzz/joK540y+WVjBHoAC/gLm
         Avr+OQ/bm5P0YLGJ8s8NambzVY5sOOkGRM9l5/Vy9BfuzoMxbM5i9wATq4tVdvq1d7fA
         C27m1YgfNYtX0jGDcQZYYh0NvJMTpa3qiHJ9u49b5JOBwehZbMQDJ6vNKxNbXMnURZiR
         UaNG83yqkKqz+kLfTCKVqU/4tG4RF2K42dooSAGg2jak0mdNrYekaXaZkvhwaLz/M7i+
         WGKRyVrcmQBGm/NdWfjmHZY8BoJCaQh6sdCz/zosdv3jTrUh/SoYKeAgn3JDWw+hHLYB
         d6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725555635; x=1726160435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZV/Ct62i0SWe/eQOuu8hbmxJsUYcvz+0fB6177mZLk=;
        b=eaaJxn2aLK94TTU17SILGW7xQ4x4+Ec2GOfucu0/jurl2VKda/FqboTVwBjCeuyuCz
         H/30FWZ0+GCsiazq/ikJ3r6Xq7d8paWswyUk1YvTnReBOJMaRnMpIRlp8baHKZHnQHhe
         6yRbpVWMyYnTJMBAgtYLepImjaPHJ3oTpQDPxAkZZccd9+IRP348hV+7QHqb+xF1IEqz
         Dmt0wEfHNKHDoZauMed2sZESZAFj83yy+Vq971XADGvKX84Hzfx4cJNPxieRmLa5qJ0b
         zNPlImGD0HuzOy56CF6Piy0ZlDymHdsuag9WFSnuvsJ1Jh85jzH5Y4mA8FgAJZ2xJK7+
         5EdA==
X-Forwarded-Encrypted: i=1; AJvYcCVzeueRVgCDy7R5SVCnJcbbKx8lXFz4AmKPGZLDPRhB9JluCdahaLnBU4kH1ygsq6pOjwiJlDPfOIystnxH@vger.kernel.org, AJvYcCW07WMNxK/ekniGB5CFSA10h/dlA7ugKm9nfTB3nSV7YrAH1nYVhLoQIodSlBbo37IqDZxg3ygEUxEGpy0C@vger.kernel.org
X-Gm-Message-State: AOJu0YxJeBg9t7WTmbHJ4pjfxKlOcLimbsgOtoOFBHbJwsMuxW9TJAaa
	9mtntjHXbPxL6OiqiLdIWgI8BrVKm1j7aI1fHpJ/XMCYtVIKipZkTPpFOJmWkb34c2pJC1z/wAi
	iOeeujrRltTW4PR8i+nqVtPdanAkl2g==
X-Google-Smtp-Source: AGHT+IG3fVJMj8X+QupsVk+lbXCJzCFrxGLdE4Y0iBpJXuWEfA4+fZ1P0PS+T7tA6d644LYLD2Q7k7jx/OI0IyXRgj8=
X-Received: by 2002:a05:6e02:1545:b0:3a0:4255:1912 with SMTP id
 e9e14a558f8ab-3a042551a3bmr75420225ab.10.1725555634840; Thu, 05 Sep 2024
 10:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com> <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
In-Reply-To: <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2024 10:00:22 -0700
Message-ID: <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 9:27=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/09/2024 4:53 pm, Will Deacon wrote:
> > Hi Rob,
> >
> > On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> >>
> >> It was causing gpu smmu faults on x1e80100.
> >>
> >> I _think_ what is causing this is the change in ordering of
> >> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> >> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> >> this patch is supposed to work correctly in the face of other
> >> concurrent translations (to buffers unrelated to the one being
> >> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> >> stale data read back into the tlb.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
> >>   1 file changed, 14 insertions(+), 17 deletions(-)
> >
> > Please can you try the diff below, instead?
>
> Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
> making a difference. In fact, given that msm_iommu_pagetable_unmap()
> still does a brute-force iommu_flush_iotlb_all() after io-pgtable
> returns, and in fact only recently made .tlb_flush_walk start doing
> anything either for the sake of the map path, I'm now really wondering
> how this patch has had any effect at all... :/

Yeah..  and unfortunately the TBU code only supports two devices so
far, so I can't easily repro with TBU enabled atm.  Hmm..
__arm_lpae_unmap() is also called in the ->map() path, although not
sure how that changes things.

BR,
-R

> >
> > Will
> >
> > --->8
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index 0e67f1721a3d..0a32e9499e2c 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
> >                  /* Clear the remaining entries */
> >                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> >
> > -               if (gather && !iommu_iotlb_gather_queued(gather))
> > +               if (!iommu_iotlb_gather_queued(gather))
>
> Note that this would reintroduce the latent issue which was present
> originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
> actually allow a NULL gather to be passed to io_pgtable_tlb_add_page()
> it may end up being dereferenced (e.g. in arm-smmu-v3).
>
> Thanks,
> Robin.
>
> >                          for (int j =3D 0; j < i; j++)
> >                                  io_pgtable_tlb_add_page(iop, gather, i=
ova + j * size, size);
> >

