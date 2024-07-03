Return-Path: <linux-arm-msm+bounces-25182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874839265D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 18:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7A31C216BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B2C1822C1;
	Wed,  3 Jul 2024 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5+fHgwL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEBC180A86;
	Wed,  3 Jul 2024 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023539; cv=none; b=GBx0pXQueI1UJkPF+FC07qax0JbALYBgkmJz92qORzI52lFBIrbgLqX6XselhBFqmrZN6lmu0+/Jfmg1ipYG/w9SXssvv50DCOSEJkFVRimI2ETBmkAA9Vbk66Yql0rK3uLHuZUhwDjliDaPOPT5bUixRUvqiNozUTZ7sACWJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023539; c=relaxed/simple;
	bh=gsbxeyzBgRva3YUtYUEpVxn4Ojk5LKZtDO81mCspOh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5We2pS6ssQDwSP+/UUHvbk+Hf7gdDZRPkXvOEAiuapT9mDjwMssbva1hNZbYYBZgxaPYgFft/aWBHBRTIwol9gWSfkqmGVwvRqUCO7gB8CqepWxOzZkPcHkW0sop+AbqQESpUaMdhoh2S+uR9SwrjXr9ANxLTlsm4j+R4aVq/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5+fHgwL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so4130103a12.3;
        Wed, 03 Jul 2024 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023536; x=1720628336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esD+x2zV0b2HUw6HwJUTrpl5r5TD37X0+FbuUmt4lJo=;
        b=l5+fHgwLgTbW/rklc0uxKu5E3EKuEB85AUGRXKUPNDAIpp7Y/xsAY2aczUEoRlgGI2
         amrIU3fEqvRbJvoBjc0ADVuqMoCVKnY3AQTzivTJK8hl/VM9CF6AtLaCUsGMWvI+f3H2
         lrSpQKwERSDi/XlXqH3nLHIBbpe46oglbP109US4FN6e5pCJD7TTPlkkDkTkULk9xjBi
         lNDzDzt6Z4XyhVpDA/1FX1YQvaSeq10DChx7EPYjaMOPKUhqjQn650UcAqEKWJuBVUXM
         Uz30HlAg5H9aKye7HkD8jZy1J+SY9QGuuTP5mBpglqkXQEtYqZxB1zgbCzNYY2v4N9cw
         zvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023536; x=1720628336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esD+x2zV0b2HUw6HwJUTrpl5r5TD37X0+FbuUmt4lJo=;
        b=T1UtzYRnzTfGPbknVvxw+GGFP9fPY98fSizHV9hOe1S78EFLdti4RXUK7vbCmaMEdw
         rD6LkLwBvuQl8c9WOUSMiwgji3ohu1QRCIhYEmYreo0y0mYFl4DoABaAz+Ut8N2/CsWQ
         k94Kg4kCjAqoQn9mMdw6X4md02ncRFGQ+kyF6ewUHjGWuPl90lEGwwJUR+8rvZ8KZF3x
         J8cV5hBH5JI2opKa8/t1jBXkYYKPOYLO7dnPSNPvcy47lXsRvF0MOQlLBULFmJQMyasX
         ZvS788/fqfrENtJ+SsuTHnfrdSH8RMguceXZe1lAsy0k6L8J5UDbywRpwLGDIiwPjxWR
         7YIw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2Aoay+aL+Gn3tbbcqIQeN6AKTqyed6JCR5BcF4mnZx8tK3KVa3dQpluZNeqFnn4SQclyoDW0sB2E7c7onFS7T/tStp0dVCOFh7AHz8AKmCAOxIFhcVudESmX8QtYNcb2yS8F+CCnH475LA==
X-Gm-Message-State: AOJu0Yy5qlLvoQh0o6/J6VVvNAuZp5wLiG6YBa6c9pDnyvBKCK8GHWIA
	Ek/jH7lZjXEvZjfdilqpQNPUdza6OA/fSreIydLez6HgkRhare/ARrnM9t/coviCtJIvQS2DKk6
	OIgHnntTcLS6x8G5o1XWrRlETInc=
X-Google-Smtp-Source: AGHT+IFrxgGuzaRNyApPFpENAxOnyEk7yjeXF5TSrqyg43Iliri20si+kBcM7kVZGYcFuq65U5baHs//egURPR5OvQI=
X-Received: by 2002:a50:e705:0:b0:57c:fa44:7a04 with SMTP id
 4fb4d7f45d1cf-587a0bfeb3bmr7434340a12.39.1720023535793; Wed, 03 Jul 2024
 09:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626204033.255813-1-robdclark@gmail.com> <20240626204033.255813-2-robdclark@gmail.com>
 <20240703150205.GA6012@willie-the-truck>
In-Reply-To: <20240703150205.GA6012@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jul 2024 09:18:43 -0700
Message-ID: <CAF6AEGsgN8O2eJGqcJm1UaPzV2rWSXskAc+A8uk0mVbsj8Wm8A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@chromium.org>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Kevin Tian <kevin.tian@intel.com>, 
	Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 8:02=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hi Rob,
>
> On Wed, Jun 26, 2024 at 01:40:26PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add an io-pgtable method to walk the pgtable returning the raw PTEs tha=
t
> > would be traversed for a given iova access.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 34 +++++++++++++++++++++++++---------
> >  include/linux/io-pgtable.h     | 16 ++++++++++++++++
> >  2 files changed, 41 insertions(+), 9 deletions(-)
>
> Non-technical question, but with patch 2/2 being drm-specific, how do
> you plan to get this merged this once it's finalised? I can take this
> part via the IOMMU tree?

I guess if need be, I could merge the drm part only after the iommu
part lands.  We've lived with an earlier iteration of these series as
downstream patches in the CrOS kernel for this long, it isn't the end
of the world if it takes a bit longer

> > +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > +                                      unsigned long iova)
> > +{
> > +     struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> > +     struct io_pgtable_walk_data wd =3D {};
> > +     int ret, lvl;
> > +
> > +     ret =3D arm_lpae_pgtable_walk(ops, iova, &wd);
> > +     if (ret)
> > +             return 0;
> > +
> > +     lvl =3D wd.level + data->start_level;
>
> nit, but the level is architectural so I think we should initialise
> wd.level to data->start_level instead.

Hmm, I wanted to use wd.level to get the index of the last entry in
wd.ptes.  Perhaps I should just call it something other than 'level'
instead?

> >
> > -found_translation:
> >       iova &=3D (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> > -     return iopte_to_paddr(pte, data) | iova;
> > +     return iopte_to_paddr(wd.ptes[wd.level - 1], data) | iova;
> >  }
> >
> >  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> > @@ -804,6 +819,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
> >               .map_pages      =3D arm_lpae_map_pages,
> >               .unmap_pages    =3D arm_lpae_unmap_pages,
> >               .iova_to_phys   =3D arm_lpae_iova_to_phys,
> > +             .pgtable_walk   =3D arm_lpae_pgtable_walk,
> >       };
> >
> >       return data;
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index 86cf1f7ae389..4d696724c7da 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -171,12 +171,26 @@ struct io_pgtable_cfg {
> >       };
> >  };
> >
> > +/**
> > + * struct io_pgtable_walk_data - information from a pgtable walk
> > + *
> > + * @ptes:     The recorded PTE values from the walk
> > + * @level:    The level of the last PTE
> > + *
> > + * @level also specifies the last valid index in @ptes
> > + */
> > +struct io_pgtable_walk_data {
> > +     u64 ptes[4];
> > +     int level;
> > +};
>
> I wonder if we can do better than hardcoding the '4' here? I wouldn't be
> surprised if this doesn't work, but could we do something along the
> lines of:
>
> struct io_pgtable_walk_data {
>         int level;
>         int num_levels;
>         u64 ptes[] __counted_by(num_levels);
> };
>
> and then have the Arm (LPAE)-specific code wrap that in a private
> structure:
>
> struct arm_lpae_io_pgtable_walk_data {
>         struct io_pgtable_walk_data data;
>         u64 ptes[ARM_LPAE_MAX_LEVELS];
> };
>
> which is used by the walker?

I guess we could just make the walk_data fxn ptr arg a void* and
rename io_pgtable_walk_data -> io_lpae_pgtable_walk_data?  I'm not
sure how hard to try to make this interface generic when I think it is
probably only going to be used by code that knows what pgtable format
is used.  It's kinda the same question about what type to use for the
pte.  Maybe the answer is just "it's pgtable format dependent"?

BR,
-R

