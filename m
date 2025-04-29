Return-Path: <linux-arm-msm+bounces-56136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFBAA0E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8A2A168CE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2961E2D0279;
	Tue, 29 Apr 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFX+7WIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3FA86353;
	Tue, 29 Apr 2025 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935176; cv=none; b=ddkoZyal0Ew4z0+Gt5fCC9Km3h62Utim9yCsBuuFRQNxT0j9dMsSRTX6IYxQWNREB2Dc+4CumRkL5FGh9enGiVdsR/tlpnLtWbMdq+2fM7ZbLoKGJfqtTRxCQbwBFcaWmJRwmbPVKnuxkPK7wvN1QWWaWEiXxKaOJIdu/bffQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935176; c=relaxed/simple;
	bh=YPMp0nVDBBkdckFiIUUeu6Pi+XKcY9sIE7EQDQJW2fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5kkcwLmIdDCVhzm7LIoIzsFRUU9EME+0xPRPxHWf1FcSDbtoHa2JIH86jYk9hRJLWhoSLDL70+LJimgSSgSQdAtFQs4ESUyvUCWNqhv03TVM3nSnXdoEpd/MT9bFrl60uxnziRhY6mtssSkixO4kdInsFnv5uHH9rtOvu6isYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFX+7WIE; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d93c060279so15099915ab.3;
        Tue, 29 Apr 2025 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745935173; x=1746539973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=;
        b=ZFX+7WIE/EFnXSJTtcwAz6iF4ayA2l1K8H98+vdz8OR+ifHsjwRZlvsi0ceCfgRcWc
         z+hOqnjS0zMpNlxWNp39ALdLdXBz/htoWtoQSS6v1MUHZONlmjotk2j411OELOOBkyPQ
         AeaZ3MuAnwo2OR1iGiOVe/7hfore8gLNveElKHq1GIHvz0GRKCcJ+hN6AIiyvqhhOISy
         Vf7ZMgLFBsNDVpZd1qfYT7rtoYxto5QR9OtrEFNYiWwO2kU/QBuHmsN1RZxRvjXdlvqj
         wzk2lbiwZ3JNdZAFk0lGInn9OOPNQ+563x0saTJRMVVubd+Js1AykNBdJ0nqm7ijc8Ag
         qCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935173; x=1746539973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=;
        b=LQoM36/iS/CHyjp/VZwwcXXh2LqQ0ctlg+T/z+r/trg1FmgA0tVAkDVCrEqQMIeX7F
         bja84PmdpvMrvYnbhPZ+VXVdQDzUMSRMwe4tMs5WQA8vhwpA/tU1vK9+rHgNWAR4SqkN
         4k/TbMT0igE/M3HF13slUaFmkw8Oq4zAHJrKryBckURiFdVM82mXLJ59WeIRPjCnn9x3
         drarRUpHPckE8A6uS/SDKhMXniMq/B2jwxI9/3Pu3JeiR90hvD92IzPBT0SQlWDbNGEE
         FEDog0rO6Dilv/zdwWxaa5xXY+Yc4R61EeKQJeu9sv1YVywXfLmAJKbmL8zmNUBEsHWP
         JAjg==
X-Forwarded-Encrypted: i=1; AJvYcCVN5nYq2SZAE7vM+ZDz5f0qMq5eX+WDIE4AFY4/Tm05YFND8kzMcJLeqGj6nQp3y/Y7MX6/o7Z+SiIc7oEq@vger.kernel.org, AJvYcCXEuYkg0pd6Y2QS5lxlHG14rUqq5HCFsf7JEprtNN4lp7GpUzMLJJWhigI+pdWiOaC0RyIvJkql8VG8X4np@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jTUD09YE0/JaOroGRz5628b4OMELi8SbCAe4Uv/2uckIzdWL
	JgcT9Qjin2XZOik48k9GwVUms0jm3k5fYaGKAJF/x8U75Oc4r6h8FW8bFx771ZtVtCNrwbNsuPE
	BGu7opwt3UUzJI6e6NhdxIKn0vok=
X-Gm-Gg: ASbGncvrckp8YYxyX5NOstlMj6p88GB5NEgZVku4CoBTDu9hCSzmy7QSL+sB/K4+jHI
	3/i03KpwKwqZ9YMUcIGc/q/3PwrcabgBCXrXA8tnn7Z7l769Ev13KaXMfEgN6hLRHqYzUHs2jC7
	Vwx+8Y1GRRRI8I4+pGg+WsctJzKAVOkJkydBGQHCm5NuuYbqOM2MU=
X-Google-Smtp-Source: AGHT+IEdTO5hNn1ezgivOymNsegNzfJ83eKjctWNeTpWMsM57J4OJKn3z6ximxQld4YNySvnfhfQGQpz4RThMZJUjO0=
X-Received: by 2002:a05:6e02:3e02:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d95d24557emr38606775ab.3.1745935173509; Tue, 29 Apr 2025
 06:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428205619.227835-1-robdclark@gmail.com> <20250428205619.227835-4-robdclark@gmail.com>
 <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
In-Reply-To: <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Apr 2025 06:59:20 -0700
X-Gm-Features: ATxdqUHI0I0FZW2gLzxkvF3EsTwzlI4FDJUgZ3k8m88LbsKKtn-nlD3_9TKUqac
Message-ID: <CAF6AEGs8gPtmYeYBMCn3r=w4eq4pk25fdS=YeqMYUySj7kz0ow@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:38=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 28/04/2025 9:54 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping squence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
> >   include/linux/io-pgtable.h     |  8 ++++++++
> >   2 files changed, 20 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f27965caf6a1..99523505dac5 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
> >               cptep =3D iopte_deref(pte, data);
> >       } else if (pte) {
> >               /* We require an unmap first */
> > -             WARN_ON(!selftest_running);
> > +             WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_Q=
UIRK_NO_WARN_ON));
>
> If we are going to have this as a general mechanism then the selftests
> should use it as well.

Makes sense, I can remove the selftest_running hack in the next version.

BR,
-R

> Thanks,
> Robin.
>
> >               return -EEXIST;
> >       }
> >
> > @@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_=
pgtable *data,
> >       unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> >       ptep +=3D unmap_idx_start;
> >       pte =3D READ_ONCE(*ptep);
> > -     if (WARN_ON(!pte))
> > -             return 0;
> > +     if (!pte) {
> > +             WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN=
_ON));
> > +             return -ENOENT;
> > +     }
> >
> >       /* If the size matches this level, we're in the right place */
> >       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> > @@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_=
pgtable *data,
> >               /* Find and handle non-leaf entries */
> >               for (i =3D 0; i < num_entries; i++) {
> >                       pte =3D READ_ONCE(ptep[i]);
> > -                     if (WARN_ON(!pte))
> > +                     if (!pte) {
> > +                             WARN_ON(!(data->iop.cfg.quirks & IO_PGTAB=
LE_QUIRK_NO_WARN_ON));
> >                               break;
> > +                     }
> >
> >                       if (!iopte_leaf(pte, lvl, iop->fmt)) {
> >                               __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
> > @@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg =
*cfg, void *cookie)
> >       if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> >                           IO_PGTABLE_QUIRK_ARM_TTBR1 |
> >                           IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> > -                         IO_PGTABLE_QUIRK_ARM_HD))
> > +                         IO_PGTABLE_QUIRK_ARM_HD |
> > +                         IO_PGTABLE_QUIRK_NO_WARN_ON))
> >               return NULL;
> >
> >       data =3D arm_lpae_alloc_pgtable(cfg);
> > @@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cf=
g *cfg, void *cookie)
> >       struct arm_lpae_io_pgtable *data;
> >       typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr =3D &cfg->arm_lpae_s2_cfg=
.vtcr;
> >
> > -     if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> > +     if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> > +                         IO_PGTABLE_QUIRK_NO_WARN_ON))
> >               return NULL;
> >
> >       data =3D arm_lpae_alloc_pgtable(cfg);
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index bba2a51c87d2..639b8f4fb87d 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> >        *
> >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pag=
etable.
> >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttr=
s bits
> > +      *
> > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > +      *      mappings, but silently return -EEXISTS.  Normally an atte=
mpt
> > +      *      to map over an existing mapping would indicate some sort =
of
> > +      *      kernel bug, which would justify the WARN_ON().  But for G=
PU
> > +      *      drivers, this could be under control of userspace.  Which
> > +      *      deserves an error return, but not to spam dmesg.
> >        */
> >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> >       unsigned long                   quirks;
> >       unsigned long                   pgsize_bitmap;
> >       unsigned int                    ias;

