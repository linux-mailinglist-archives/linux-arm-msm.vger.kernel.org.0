Return-Path: <linux-arm-msm+bounces-24003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DC91529C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6A01F20FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBC019CCE4;
	Mon, 24 Jun 2024 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqoG4rq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A10C1EB48;
	Mon, 24 Jun 2024 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243461; cv=none; b=RsVy+QF5DuyVseqGKDAvbnIWLK19h7n6cam5AhcpnmGAsp+nyFyl9OT56FmxqT7hWFkfH4RL1SIzsyMzurPGZqc7XbqOKoLJRIHWQlWEwARJws7zs9eOWMoB/o/1yg+wo7wrHRiPex0jXQ96+2gI9Zi2i+ejVNxHHGP6Q423pgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243461; c=relaxed/simple;
	bh=Z36F+leuCU/otTunzaT4BJQLU9anN/d01xVBaiT1ZT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nR+HBWbVvk9yZcT2aXeeAjKIfDDXbssgo1bfD3nBMLHZ/Jh30RSMjOBdyRyXEV40d0eKTgrInAPJLWQdw5F8Hmvbe7s7BUCTKIw8a5P4bxnBvGvf+qIj8l20htRiM6WG5ki9wiR0aIcbsXkRDPUpoYoSwYnrlK656fM9n9DEw9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqoG4rq0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so4275783a12.0;
        Mon, 24 Jun 2024 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243458; x=1719848258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQc+e+I6ia7/ogMpB2OJkI6aQ1tlYzw7cUiWzpvi62U=;
        b=DqoG4rq0HE/klKgn+fesYF+6UdKdDf8ce9R4vH3nvH8sm3f+aCroHiL8c96F8lv4UN
         7ZN50dbGhweikJ9VeJWITLgNnMfJ7gZnB9aI2Ur1Cctt2OpR4fjlBCgWf6DgIHaOl3Q7
         33MgHSKXMiTd/CfWf+xeo4I8lDJDtFxTgKmSBPxz7d/os9IP/IkvB3i508s3WH2WAjK3
         Z7YXNqIEYVorsvDhXWh/A8FlK2HpzctC+DkyhhFE+zrFCWJYczLuapoHwAetFuKLSnli
         b3D1tSsETNERQbeqVQ7S281qxzhX/QFtSdHNxeQ3RT1rstb6iLRf7JIdeC/8WkBR5Ov9
         5qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243458; x=1719848258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQc+e+I6ia7/ogMpB2OJkI6aQ1tlYzw7cUiWzpvi62U=;
        b=OnkvKWLYtl8n2dO/4+GIOGgbXTnS7tH7GdKRjPnvKOYdYr3ifFdg7149U/gWR5mWBv
         oK9spmxj8XUx3hMYIfhVMZtGkYtUq6QEDDm6IyLxZIMWpOm3fpUvNU2SdXpRE8xMCR/Z
         3bgRPTap4ZE5gHmLoZRHhSStk/HnWsiQj5rEPwoy06RUf2NW5dXHNYVb1tvDTD3eoj+X
         434AXp2iMC+aWw5te2n7jl1tjWo25EY2mtcLZk+TKklLZJ+0UESdeP/Td3bW5iT2rr6q
         5E0qHnan/0XVKAQ6KxapyOGVm1JFpmMrMyIfS3R5E3USMQ60fQrifzn9ztKslegLsLs4
         SePA==
X-Forwarded-Encrypted: i=1; AJvYcCWTRE9Gr+hipht6ieyzaLlBvEZCoC4hcK4n804U23Zfm+tv5/ZAm7r3niB8ANoT6PJdeXZ+8DX33mkcbPs8tUBvvEsY3HGPwiAMrk/JjpiXUkDnCr2hmsS/uPPA7y1vLpHl96nXHY1QDZoTlw==
X-Gm-Message-State: AOJu0YxM/2/OEK9uzPSUjppes3NZn3D3f2LUkdQ3rBA7+k3Bo91qP+I9
	uMR2n5UTouuGxAEcsHHHpcG8Agf8UlwDXF3j6VbrwR5e5TN/D/nunMz4wUu43zQRZp/9/ki42Q7
	X+Lz0/CJqDE5P0cxi5zxdZJ+mjn0=
X-Google-Smtp-Source: AGHT+IHEEQxmIHCl7aQptuGI+5uw01VLWA2AyOiSUHqCVl//O6JanrQFmlogbqjX9PEO1AhYjBS3Z5mQrF25LbmaeRY=
X-Received: by 2002:a50:931a:0:b0:57d:2db9:15e8 with SMTP id
 4fb4d7f45d1cf-57d4bdcb3bfmr2974167a12.34.1719243458252; Mon, 24 Jun 2024
 08:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523175227.117984-1-robdclark@gmail.com> <20240523175227.117984-2-robdclark@gmail.com>
 <20240624151401.GB8706@willie-the-truck>
In-Reply-To: <20240624151401.GB8706@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 08:37:26 -0700
Message-ID: <CAF6AEGttkHPOsO+NSHZeRXiZBxU_26HZyGMjOZ3-Y8NZUgz0gA@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 8:14=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add an io-pgtable method to walk the pgtable returning the raw PTEs tha=
t
> > would be traversed for a given iova access.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
> >  include/linux/io-pgtable.h     |  4 +++
> >  2 files changed, 46 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f7828a7aad41..f47a0e64bb35 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgta=
ble_ops *ops, unsigned long iov
> >                               data->start_level, ptep);
> >  }
> >
> > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > -                                      unsigned long iova)
> > +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned =
long iova,
> > +                     int (*cb)(void *cb_data, void *pte, int level),
> > +                     void *cb_data)
> >  {
> >       struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> >       arm_lpae_iopte pte, *ptep =3D data->pgd;
> >       int lvl =3D data->start_level;
> > +     int ret;
> >
> >       do {
> >               /* Valid IOPTE pointer? */
> >               if (!ptep)
> > -                     return 0;
> > +                     return -EFAULT;
>
> nit: -ENOENT might be a little better, as we're only checking against a
> NULL entry rather than strictly any faulting entry.
>
> >               /* Grab the IOPTE we're interested in */
> >               ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct i=
o_pgtable_ops *ops,
> >
> >               /* Valid entry? */
> >               if (!pte)
> > -                     return 0;
> > +                     return -EFAULT;
>
> Same here (and at the end of the function).
>
> > +
> > +             ret =3D cb(cb_data, &pte, lvl);
>
> Since pte is on the stack, rather than pointing into the actual pgtable,
> I think it would be clearer to pass it by value to the callback.

fwiw, I passed it as a void* to avoid the pte size.. although I guess
it could be a union of all the possible pte types

BR,
-R

>
> > +             if (ret)
> > +                     return ret;
> >
> > -             /* Leaf entry? */
> > +             /* Leaf entry?  If so, we've found the translation */
> >               if (iopte_leaf(pte, lvl, data->iop.fmt))
> > -                     goto found_translation;
> > +                     return 0;
> >
> >               /* Take it to the next level */
> >               ptep =3D iopte_deref(pte, data);
> >       } while (++lvl < ARM_LPAE_MAX_LEVELS);
> >
> >       /* Ran out of page tables to walk */
> > +     return -EFAULT;
> > +}
> > +
> > +struct iova_to_phys_walk_data {
> > +     arm_lpae_iopte pte;
> > +     int level;
> > +};
>
> Expanding a little on Robin's suggestion, why don't we drop this structur=
e
> in favour of something more generic:
>
>         struct arm_lpae_walk_data {
>                 arm_lpae_iopte ptes[ARM_LPAE_MAX_LEVELS];
>         };
>
> and then do something in the walker like:
>
>         if (cb && !cb(pte, lvl))
>                 walk_data->ptes[lvl] =3D pte;
>
> which could return the physical address at the end, if it reaches a leaf
> entry. That way arm_lpae_iova_to_phys() is just passing a NULL callback
> to the walker and your debug callback just needs to return 0 (i.e. the
> callback is basically just saying whether or not to continue the walk).
>
> Will

