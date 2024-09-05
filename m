Return-Path: <linux-arm-msm+bounces-31000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21496E0DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27CFB1F26AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4401A2842;
	Thu,  5 Sep 2024 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE/5YwjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA11A2559;
	Thu,  5 Sep 2024 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725556246; cv=none; b=ILKGW7bPFQ9EGwvkDuNaoPDKDu7Vxa1Qs7cOgeD2+flb2hv+uyuDaqScspYmpeY2nPfQyms/1bcaBZlZnp6CEk+LG+iP+NX8C0f7/Opy9tTW5/kapnJUCBsibgkxmh5b/o05UXuUHZmlxDTAxl01uDjwyDnMc9KpRAFFqVDEiHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725556246; c=relaxed/simple;
	bh=W3mjOn/yF2UHDYZ5e+nh25q/TqVulPe8iYhtDSb0T1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRzSkQzcQ37zHujcKYDbsFPLyLxhAvOeiVmjudiRN2vvYyyCHy3u7Pm3akSwwp+4Sxk0lyyHLnUgK0cdLQnJ63UX++kmbZvvL2gAOgEBiouvt7z+3VInM0b2T5d7V2qTmXT1vY2AEjR4t9YFDP37eYYJFPUZNF6nQ5dy3H9WiWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE/5YwjZ; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-39f51934f61so3847125ab.2;
        Thu, 05 Sep 2024 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725556243; x=1726161043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TugYWWTmfA5+0ZqiY0zoD9lJrHPCBxbgSyyl1t8wKjk=;
        b=nE/5YwjZclmvtlTaHFFJy3ld3yN3bnETlWf5XL+ltJNCF3DGrAFXKh1TPHkXFKL5VF
         npKYu+L3UP/UWR6jZ6fF2q6O22V83H+fewf7YSJXDe8R13wnCcALqvDYq9CU6WK58fcm
         NEdfAGZGDxfkm9TB3NaqTA3MkW09aO8HgESrHQQddgBB9SHi6Ol4xBqujRbB+Cm4J09u
         rQjFIrzAmbjze7qdEYuJyY+H0afdfSu+qPeA3sema//30AL1FHeRX05qV12hXPcamLtQ
         t3H3/E+x/ZkHVzyL0b60WNra3YiidsSMMpeIqCuhxFPRPsNBODsZqTvj5CYxhHMJrFwQ
         vuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725556243; x=1726161043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TugYWWTmfA5+0ZqiY0zoD9lJrHPCBxbgSyyl1t8wKjk=;
        b=KYEIkFqdfVyafhfjoHOgFXz9gxch08HGl3WsJxxrpXF5kqoSrku432JdUHXlIE8r+b
         uaX03Ng1PKl2kr94GKXePkH8GfPa6gvAAXKo/P0IEENjS6OclFqexrf18e/UWMll2mBX
         itXv3UGCVSwZHPzd1RwVi6cUmm3ENvwS5hAQbZsIVNLK8QlwURGPhOukiycM35x0sR08
         qPp5Xsws0fNHaoF92T0LJ5EJtTOKV2QHz8rT5GVVn3K0x7WPa9HIZojGD/gks/LFti/G
         51NNucpLGPv2lHtMRXEmHxib1J4MjFXRIHpfo+UrAwXWfv2gUpaIUxQmu1ZRyOkbmIhI
         ltcw==
X-Forwarded-Encrypted: i=1; AJvYcCWu1oR8Nnxiv2NxPW9NS/WO5X8J298QAjJtGmKeVwecASf0qOfxd0rABBOC40caNl670ZPM7DnGCW/rJTgj@vger.kernel.org, AJvYcCXLsdCOdCoCiasLP4t+BO7r73yVdnIime/HmbZfnMRVwVwycZXNej869hH76ZVg0wZRGDOFT+TMMNXd6LA7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx72byIprWAQYkWJjRFEcvL6/nDRCn4ksZN9zwhEa0g07WlWVq
	AdUgZrgjrTXHXekdbySItUhEg4n9ON6HRD0AFXODHena/8hdIPKmluv65uPVUF54QpQHxlS5IBN
	+3x4vzpv1EZDE6SHH0Ys47ueIuOE=
X-Google-Smtp-Source: AGHT+IH5kHkyh4TQY9qQMpV4jTCKCy2lyxsS5qWD7hz50R2gl4bk5tUOxy/O9US635pYUshC6lF6+mLFwVVPNAM4HVQ=
X-Received: by 2002:a05:6e02:148e:b0:3a0:4d72:7f5e with SMTP id
 e9e14a558f8ab-3a04d7282c9mr15898065ab.7.1725556243238; Thu, 05 Sep 2024
 10:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com> <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com> <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
In-Reply-To: <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2024 10:10:31 -0700
Message-ID: <CAF6AEGsqdxO4+kaz6jOLBS_syjEkZg-7Veqh3j-o=RiGNcBH8A@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 10:00=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Sep 5, 2024 at 9:27=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
> >
> > On 05/09/2024 4:53 pm, Will Deacon wrote:
> > > Hi Rob,
> > >
> > > On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> > >> From: Rob Clark <robdclark@chromium.org>
> > >>
> > >> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> > >>
> > >> It was causing gpu smmu faults on x1e80100.
> > >>
> > >> I _think_ what is causing this is the change in ordering of
> > >> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> > >> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> > >> this patch is supposed to work correctly in the face of other
> > >> concurrent translations (to buffers unrelated to the one being
> > >> unmapped(), because after the io_pgtable_tlb_flush_walk() we can hav=
e
> > >> stale data read back into the tlb.
> > >>
> > >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >> ---
> > >>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++----------------=
-
> > >>   1 file changed, 14 insertions(+), 17 deletions(-)
> > >
> > > Please can you try the diff below, instead?
> >
> > Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
> > making a difference. In fact, given that msm_iommu_pagetable_unmap()
> > still does a brute-force iommu_flush_iotlb_all() after io-pgtable
> > returns, and in fact only recently made .tlb_flush_walk start doing
> > anything either for the sake of the map path, I'm now really wondering
> > how this patch has had any effect at all... :/
>
> Yeah..  and unfortunately the TBU code only supports two devices so
> far, so I can't easily repro with TBU enabled atm.  Hmm..
> __arm_lpae_unmap() is also called in the ->map() path, although not
> sure how that changes things.

Ok, an update.. after a reboot, still with this patch reverted, I once
again see faults.  So I guess that vindicates the original patch, and
leaves me still searching..

fwiw, fault info from the gpu devcore:

-------------
fault-info:
  - ttbr0=3D0000000919306000
  - iova=3D0000000100c17000
  - dir=3DWRITE
  - type=3DUNKNOWN
  - source=3DCP
pgtable-fault-info:
  - ttbr0: 000000090ca40000
  - asid: 0
  - ptes: 000000095db47003 000000095db48003 0000000914c8f003 00000008fd7f0f=
47
-------------

the 'ptes' part shows the table walk, which looks ok to me..

BR,
-R

> BR,
> -R
>
> > >
> > > Will
> > >
> > > --->8
> > >
> > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtabl=
e-arm.c
> > > index 0e67f1721a3d..0a32e9499e2c 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io=
_pgtable *data,
> > >                  /* Clear the remaining entries */
> > >                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> > >
> > > -               if (gather && !iommu_iotlb_gather_queued(gather))
> > > +               if (!iommu_iotlb_gather_queued(gather))
> >
> > Note that this would reintroduce the latent issue which was present
> > originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
> > actually allow a NULL gather to be passed to io_pgtable_tlb_add_page()
> > it may end up being dereferenced (e.g. in arm-smmu-v3).
> >
> > Thanks,
> > Robin.
> >
> > >                          for (int j =3D 0; j < i; j++)
> > >                                  io_pgtable_tlb_add_page(iop, gather,=
 iova + j * size, size);
> > >

