Return-Path: <linux-arm-msm+bounces-29381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 226CF95D43A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 19:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3B4B1F22534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E0018E057;
	Fri, 23 Aug 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8g7O/HD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1CF18594C;
	Fri, 23 Aug 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433822; cv=none; b=iV4ZebMklSAMhu3m9MkO2QegJTe5hoQjXuRRqsn09NWxM+bCFfKf67BFMHNKXDpmcYjLLneq3oOewvp7egkbmq4QZ47rU3miszl3oehiFI+awJquXWLUyRrhwKIHbce3JVWzCqcNG7YRdKZ8tA13Ka+psG5kryKBSnqfF/qjmnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433822; c=relaxed/simple;
	bh=TDmWT5YnHW8yIQcSnVwkjxI1/quD6m7l3+e5yWHnZZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDnDZAOfcEawIyo7c0xN6Ye9y2KFBuPPJe0MNneJgSkkgrsW7MbM8BA0WdsPyayptGelUFBXtUEeefSxIQ0n7reYBrtGSgWC1CaxVqDiHl4BwadoYXxxGLHEVZYQ9MvuHp5aRjhQszXgfucciYTqpnz+GDg5DYpUygVAxYKZuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8g7O/HD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bef295a2b4so3653703a12.0;
        Fri, 23 Aug 2024 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433819; x=1725038619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igaQ+cq5DGxYKGyVENdg674ni4YlsPPzIF+5a4ikTl4=;
        b=l8g7O/HDxUn+eOx+T0avPVv6foW7CwtuU6Um7IEjbdUg+T3md+Qq/NpRiC08odNH48
         hWwhA5ubxBQebb3YisKLaPhEwVcjqX2Z3GZ6qFOvQ9OjENzJVCyF3zpmQpi777Gv0zV2
         Z4O5j+Rtx8QJuJE6hi23sCz2QydH3mSgbS81nez5z5a5VaKKWZ9BEzP8v/fwbhIvh2Mf
         oNruie9l/LJYfiuEw7Fv3axxecneZYZP0FRFmGgWA54mCV4rjbo+PPRjYf7ErWiJSMnt
         12wRfAyWqDYb1CwrSzS8UFYmATqE05Ozih97nhsTb2q/KIs0U0KSaUovL1Dyvxcqj0Ha
         Nqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433819; x=1725038619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igaQ+cq5DGxYKGyVENdg674ni4YlsPPzIF+5a4ikTl4=;
        b=Wyu8NNnTjCGOSiU95RS/UkAvxoxOfhgAGBfZ2gxH86G2gmMxcQzYk+FoElVN2BiJvp
         +SaZ/WD3oX7mkhF/LpT3kazn8DKoZJFZ4mANb01gQHPKRujpKKihUfnxoVEx2mjJqNHD
         OXGgdRcNuVYfCwD7zwblyMdD+ZBlPHtrBb66eHtLwo0lK1+TGFYyeY2W1x7tHau4CX0p
         jdaHBTyWUraBXPVc5VQR6cVEXL8QCL1jK06QBE1fVS/gyyx7uVvGH6U5h3HTNyvGVShF
         2s6nDrWKatRWYKS4fkxAvTipirXLx+l2VfXatOLZJid1z4A8y1fX3L4LYUXG+U8RmhNb
         ZQkg==
X-Forwarded-Encrypted: i=1; AJvYcCVqq2bY4Cz+plKJKV1l6tW/+lycsZcpL2X36Ztmi9dExPDzOm0bQeZH8G5l0HES8cUhMZbQF65XISOCGLl8@vger.kernel.org, AJvYcCW393Cb9NEIU4dgqMErCyf66lcEdTwM2CnqeSpOK7ZSRLIvC7tiL/8agIIIFUzI7jn8tS20EgSEDcEKiBN7@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvZhH39aZHlCTBeNogTVf+Ucp+Nus75KOR0ECB+r2xp8MQxBQ
	hE5kBvJ1JKuzpfUB8P3w4eOELvZvTqtiKhETNJdsyCEAxHr78O7Q6Oedy9r4uPsm6GosV/bXrMz
	cIRS+z4fKINz8/E1ge3HsXTZDth4=
X-Google-Smtp-Source: AGHT+IEvKoYswWA+Kv16z62fxTPQiFoASnuCbE+YY/d9Vq/hDJvvJimzLBjRmNdz9Z390iTh/rA9GLCllZDWraUA9ZU=
X-Received: by 2002:a05:6402:35ce:b0:5c0:8ff8:d7da with SMTP id
 4fb4d7f45d1cf-5c08ff8d8d6mr1124508a12.12.1724433818375; Fri, 23 Aug 2024
 10:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820171652.145673-1-robdclark@gmail.com> <20240820171652.145673-2-robdclark@gmail.com>
 <20240823160929.GA851@willie-the-truck>
In-Reply-To: <20240823160929.GA851@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Aug 2024 10:23:25 -0700
Message-ID: <CAF6AEGtkwjs4XLEBpo2O7W+UgbdxGoMAsYd+3Cr_qY88ofpMjQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Mostafa Saleh <smostafa@google.com>, 
	Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:09=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 20, 2024 at 10:16:44AM -0700, Rob Clark wrote:
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f5d9fd1f45bf..b4bc358740e0 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -747,33 +747,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct i=
o_pgtable_ops *ops,
> >  }
> >
> >  struct io_pgtable_walk_data {
> > -     struct iommu_dirty_bitmap       *dirty;
> > +     void                            *data;
> > +     int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> > +                  arm_lpae_iopte pte, size_t size);
> >       unsigned long                   flags;
> >       u64                             addr;
> >       const u64                       end;
> >  };
> >
> > -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *dat=
a,
> > -                                    struct io_pgtable_walk_data *walk_=
data,
> > -                                    arm_lpae_iopte *ptep,
> > -                                    int lvl);
> > +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> > +                              struct io_pgtable_walk_data *walk_data,
> > +                              arm_lpae_iopte *ptep,
> > +                              int lvl);
> >
> > -static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
> > -                               struct io_pgtable_walk_data *walk_data,
> > -                               arm_lpae_iopte *ptep, int lvl)
> > +static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> > +                         struct io_pgtable_walk_data *walk_data,
> > +                         arm_lpae_iopte *ptep, int lvl)
> >  {
> >       struct io_pgtable *iop =3D &data->iop;
> >       arm_lpae_iopte pte =3D READ_ONCE(*ptep);
> >
> >       if (iopte_leaf(pte, lvl, iop->fmt)) {
> >               size_t size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> > -
> > -             if (iopte_writeable_dirty(pte)) {
> > -                     iommu_dirty_bitmap_record(walk_data->dirty,
> > -                                               walk_data->addr, size);
> > -                     if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> > -                             iopte_set_writeable_clean(ptep);
> > -             }
> > +             int ret =3D walk_data->visit(walk_data, lvl, pte, size);
> > +             if (ret)
> > +                     return ret;
> >               walk_data->addr +=3D size;
> >               return 0;
> >       }
> > @@ -782,13 +780,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae=
_io_pgtable *data,
> >               return -EINVAL;
> >
> >       ptep =3D iopte_deref(pte, data);
> > -     return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1=
);
> > +     return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
> >  }
> >
> > -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *dat=
a,
> > -                                    struct io_pgtable_walk_data *walk_=
data,
> > -                                    arm_lpae_iopte *ptep,
> > -                                    int lvl)
> > +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> > +                              struct io_pgtable_walk_data *walk_data,
> > +                              arm_lpae_iopte *ptep,
> > +                              int lvl)
> >  {
> >       u32 idx;
> >       int max_entries, ret;
> > @@ -803,7 +801,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_l=
pae_io_pgtable *data,
> >
> >       for (idx =3D ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
> >            (idx < max_entries) && (walk_data->addr < walk_data->end); +=
+idx) {
> > -             ret =3D io_pgtable_visit_dirty(data, walk_data, ptep + id=
x, lvl);
> > +             ret =3D io_pgtable_visit(data, walk_data, ptep + idx, lvl=
);
> >               if (ret)
> >                       return ret;
> >       }
> > @@ -811,6 +809,20 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_=
lpae_io_pgtable *data,
> >       return 0;
> >  }
> >
> > +static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl=
,
> > +                    arm_lpae_iopte pte, size_t size)
> > +{
> > +     struct iommu_dirty_bitmap *dirty =3D walk_data->data;
> > +
> > +     if (iopte_writeable_dirty(pte)) {
> > +             iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
> > +             if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> > +                     iopte_set_writeable_clean(&pte);
>
> Are you sure that's correct? I suspect we really want to update the actua=
l
> page-table in this case, so we probably want to pass the pointer in inste=
ad
> of the pte value.

oh, right

> Will

