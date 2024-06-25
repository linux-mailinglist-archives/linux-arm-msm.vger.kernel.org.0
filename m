Return-Path: <linux-arm-msm+bounces-24123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE4F916D38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02D5328AE45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 15:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C61684AD;
	Tue, 25 Jun 2024 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyiOTurf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91D16FF3D;
	Tue, 25 Jun 2024 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719329785; cv=none; b=se4QK7XXctrTwSpIaJTTPlPlrxy3sIXOKAcOjPBa1+UZ8l0NRK5+sTMjxYnUY+lyQkTH/7D7d5IkMgO/EgyFq7jgOnL8bkrsltmGwH7mCs0+oD3K6osJq95LCUabvoYPEx3ae2T9dj2dM+qmlm+Dr+dnJrKKo2nP0BhtKIvd0w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719329785; c=relaxed/simple;
	bh=cRmziDwgNra4eake5aUYRKgsQh9E0oLGcu/fKvQHGsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIIt+rF0XIZHbtqvi6gL9hJhLy71Qq4n/vAdtquU+ClvZwTFc9ekdK1dbFv5anPn9/PAOpeFEMvpBOlKRqLbztzTm2mdTIrLuINESqOJHZQfGMGY6aNC4XipOicKMGJlAo+HJOyK5L1eXajBRuy9y7jGca171lgZcUfAEhjLdrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyiOTurf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6fe61793e2so211209966b.0;
        Tue, 25 Jun 2024 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719329781; x=1719934581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox1lbjwU21POUzsTNWtq+35PHOWR0ci2ck/cLItWRLY=;
        b=PyiOTurfKHTXuD+ri2C/5aBUQA8TDBK6EoxN5ko+DWZ4Q4INkvGESkaql1VhBBZ7ot
         akiTC8cJZ2FfODqQxJQhg2kWxvI2SA4dpSK3rJlfsWy70kiaGrLVIuwRZBQSXl/aLROG
         9AivxWYAXoOw2ng/uNVKcSx85z53id0wyAdSX0DYtO3wCSz51M0ZkN3+Pi8b8277Nyzz
         bWsrdaNn5EeBDO78omqeJidMHLifNchyEa7sTwrXSk3V42gAZncWiSc+mmOujvYNGDs2
         nLJDWRw1VoFsqcaegjcpJxcQmpi85RzkVjnFrMsB20g7ygM58vhb2Bhkd1CrkK6VlYnQ
         qcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719329781; x=1719934581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ox1lbjwU21POUzsTNWtq+35PHOWR0ci2ck/cLItWRLY=;
        b=TNU1AFvaswQh6rGQPPLVLBrTveLXcxc1WqmgdkOPRYFpEeM9jkOmudP57Ez/mbXyp1
         dy/4HredoQP8k8nvJzugSj3LeCyRbFpwXkBdbxEviF2eJftOSlnGUmEr1GDF4/Bq2kaU
         yAa+i7IBC2CwYRfQS4tNA7LIPYeIKq0q0LcFgte89PxpbaG2IBxD6Vod6QTikJ6bGwxY
         NytaqMJBftv/5xoz70FO1hiUB8BulHhXaScKKwOicWsasWUEm+k1PncGYK2/V5dTBUtA
         +oWCU2grHv/cRg5fcJhYOT2xgTEZEmtqC5iemE0C/6xO2/VgAlZnwrCz6XDKs7bU7rE3
         cL+g==
X-Forwarded-Encrypted: i=1; AJvYcCUjyOfaf7P6TVa/zO9l+yYNX85xRDTK5wWejqa+SC1JsIIHga7hofjzeueZeaYSTfZIEZdQx48vc0OKrva/sRd0j+yfdcVcgrHaMB14f2xNlo4PS4rJ2gxzGB5ZkiRhj+82ufo9eL3VIt8FxQ==
X-Gm-Message-State: AOJu0YzegiwB5QaMd6Qr9bnd1i0BSGeOuCb2qjNBnm2pwLd1/vXNhZxI
	g9Cl2dkNQLh3n1Xswnmm+vuQwaMIhzqIbNNNHqmVBCWpjl+MCUIlXskJWkwferHgaI9awJM94m7
	PWnfvPItBsT7EvtVml2K9EzIVq6g=
X-Google-Smtp-Source: AGHT+IHxpsEaiq7s8p8MnTUzi0PLbTnU1MrdrE7dFVtZiMWrVR2nmXkgwgR1pOTuRiNCFznIg23NJHs+fBN4vaKf6Qw=
X-Received: by 2002:a50:cdd2:0:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-57d4bd8fcf3mr6998806a12.24.1719329780722; Tue, 25 Jun 2024
 08:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523175227.117984-1-robdclark@gmail.com> <20240523175227.117984-2-robdclark@gmail.com>
 <20240624151401.GB8706@willie-the-truck> <CAF6AEGttkHPOsO+NSHZeRXiZBxU_26HZyGMjOZ3-Y8NZUgz0gA@mail.gmail.com>
 <20240625112703.GA10175@willie-the-truck>
In-Reply-To: <20240625112703.GA10175@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 08:36:08 -0700
Message-ID: <CAF6AEGu-NxM0HO_sKxu_bhAxMEwOZkisPmoouocvisk6ng_6Bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
To: Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Kevin Tian <kevin.tian@intel.com>, 
	Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 4:27=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 24, 2024 at 08:37:26AM -0700, Rob Clark wrote:
> > On Mon, Jun 24, 2024 at 8:14=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Add an io-pgtable method to walk the pgtable returning the raw PTEs=
 that
> > > > would be traversed for a given iova access.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++--=
----
> > > >  include/linux/io-pgtable.h     |  4 +++
> > > >  2 files changed, 46 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgta=
ble-arm.c
> > > > index f7828a7aad41..f47a0e64bb35 100644
> > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_=
pgtable_ops *ops, unsigned long iov
> > > >                               data->start_level, ptep);
> > > >  }
> > > >
> > > > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *op=
s,
> > > > -                                      unsigned long iova)
> > > > +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsig=
ned long iova,
> > > > +                     int (*cb)(void *cb_data, void *pte, int level=
),
> > > > +                     void *cb_data)
> > > >  {
> > > >       struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(o=
ps);
> > > >       arm_lpae_iopte pte, *ptep =3D data->pgd;
> > > >       int lvl =3D data->start_level;
> > > > +     int ret;
> > > >
> > > >       do {
> > > >               /* Valid IOPTE pointer? */
> > > >               if (!ptep)
> > > > -                     return 0;
> > > > +                     return -EFAULT;
> > >
> > > nit: -ENOENT might be a little better, as we're only checking against=
 a
> > > NULL entry rather than strictly any faulting entry.
> > >
> > > >               /* Grab the IOPTE we're interested in */
> > > >               ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > > > @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(stru=
ct io_pgtable_ops *ops,
> > > >
> > > >               /* Valid entry? */
> > > >               if (!pte)
> > > > -                     return 0;
> > > > +                     return -EFAULT;
> > >
> > > Same here (and at the end of the function).
> > >
> > > > +
> > > > +             ret =3D cb(cb_data, &pte, lvl);
> > >
> > > Since pte is on the stack, rather than pointing into the actual pgtab=
le,
> > > I think it would be clearer to pass it by value to the callback.
> >
> > fwiw, I passed it as a void* to avoid the pte size.. although I guess
> > it could be a union of all the possible pte types
>
> Can you just get away with a u64?

yeah, that wfm if you're ok with it

BR,
-R

