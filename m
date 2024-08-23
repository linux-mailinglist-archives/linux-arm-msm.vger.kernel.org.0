Return-Path: <linux-arm-msm+bounces-29380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A795D435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 19:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4C81C20BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132FB18E043;
	Fri, 23 Aug 2024 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9RZM6vE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E341C69;
	Fri, 23 Aug 2024 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433747; cv=none; b=O8+//rd9wynrfINu7bcPEFGkFFLtwKsfY5Kcv0Cg3E6yidqgwG1HXmy/EX4nywwCWOXZzQGT5J+peylqTciRoK/x4Uqnxjn7onMChcj/ClV5wllOyKICD36jW0sYArUkHxRzDWtkOf2IlSS8fbl3mibavhStVkJiMyww1T+GacM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433747; c=relaxed/simple;
	bh=G0lER78D+2SETUz/ApeRDt+Z853WduaDAX8/ePTaJyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N39lynHZgvT71RZMdmiIUCR2sPLsAu4L5v98Ue0BQU+1mFtN+7t2hYams9QVMzrg2vI2w1KfYjEAj920K0z4IP0b3TZG1kSA3+AhNGHGy2zZjKR4TvTYjOkoU6qAMRLc9ppZ/e9DZGrVGbJp2mTnPW4qu4P9La57ci7dHuy6MYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9RZM6vE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso2744081a12.0;
        Fri, 23 Aug 2024 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433743; x=1725038543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to9+ooQ8roiiPWwijQQKyxvjukW+kYNzLti9AMo/t7c=;
        b=j9RZM6vEpgBcKCFuy3AvdbakDChgoB9E1qSZL1xlL3eS0du9+Ycel7IgrfR/ewuMuR
         rCp2Y6w+qRj67jtGPGJCVbn4kgeq16lNKrOk9exyW6lp4RIEzMV0FXIHoQZggfWi1mqg
         OW0s2vidiLTTBGAvgYCuoitZitECDr49OU1yfvgY64wZkPGBfjB9ppWl62LjrNdmkad5
         EliwDUyhjIgq8GG4xihl9I2e1MOLwEfh6Vdd7udUuEB0vTJfsnX9RfItrJOEThB+OKtH
         FUp5sdZ/3uaTvq3fp4+p52OuU/BxXNiUCSMY+enaLIG011hBiyy71wSt00jyz/cxgiIU
         eUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433743; x=1725038543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to9+ooQ8roiiPWwijQQKyxvjukW+kYNzLti9AMo/t7c=;
        b=ojOu7WfqSszE20Qz1hB2wlfBNpego+trfcl5ymePLO5COIbJsYBPCLji1kJCMkQjw2
         xXKrh5CIl9RMmfUaf7tWzRy7lndO5c11uV0zOoNhSFfppVio8h2opGNWra7JeGxE0o/2
         k2jqYs04TrW9ObqtOcJDG91QKkaFfvhxAk9+5s+htQWn9e2AwkcavzsOVj6KTAxtgSyg
         iXScyn9NQUGjw3OfMy/lgEJr43rfuVftA8VyTW9TieTzLojVNbq4Mvy7kGneUr/dW+dx
         GBpkxbkC0C8jCpcQNwa70FbH+LYz7sAh4TlLo9pzQaUcEhw79TUNS99GwkIG3/UGvnVg
         XN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/lAJsQ7T1EYUQ4eZqSuyFbZIpyM0DVAaz1928GfggJ4YCjVzK9kQgwWAnzg3s62U9x8+/KNiARTViI1vJ@vger.kernel.org, AJvYcCXPn5lzJqEuEtwcDtAGVhIoP3O4Z8gKJEXHL0PNTkZG8YmM3HzguvJ3bhvNaaX6zZg2f4RXNKVYHEZ3P3vq@vger.kernel.org
X-Gm-Message-State: AOJu0YztqWtMg5Ht25mreQYxSJTr9oeZqgHY2hM2QGfFVILtEMBzGT5T
	lByM6G0rgcEduBJHu7Ph6e5i4zX9ZkAKrMh7oHG+fWNijVhjKp/ZxlKLxsAHqRltlvFXV0UELp5
	bHBg0Y4HeJnapSrv+RXN3A7DSkcs=
X-Google-Smtp-Source: AGHT+IFuXT0FKUkEk5+963PnUNJ3N6G9Q52jPVUXuTKK5Gcc+EuJjboxEWGL4C/ondtpTBM89q0Dd2Hl/8/TbjklQKc=
X-Received: by 2002:a05:6402:5109:b0:57c:a422:677b with SMTP id
 4fb4d7f45d1cf-5c08915f498mr2302771a12.8.1724433742982; Fri, 23 Aug 2024
 10:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820171652.145673-1-robdclark@gmail.com> <20240820171652.145673-3-robdclark@gmail.com>
 <20240823161148.GB851@willie-the-truck>
In-Reply-To: <20240823161148.GB851@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Aug 2024 10:22:10 -0700
Message-ID: <CAF6AEGvdKc3APaYVZ1G9iQfw22yb2MGssADhXU50MhZqp8tcrA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Mostafa Saleh <smostafa@google.com>, 
	Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:11=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 20, 2024 at 10:16:45AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Re-use the generic pgtable walk path.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 73 +++++++++++++++++-----------------
> >  1 file changed, 36 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index b4bc358740e0..5fa1274a665a 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -710,42 +710,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtab=
le_ops *ops, unsigned long iov
> >                               data->start_level, ptep);
> >  }
> >
> > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > -                                      unsigned long iova)
> > -{
> > -     struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> > -     arm_lpae_iopte pte, *ptep =3D data->pgd;
> > -     int lvl =3D data->start_level;
> > -
> > -     do {
> > -             /* Valid IOPTE pointer? */
> > -             if (!ptep)
> > -                     return 0;
> > -
> > -             /* Grab the IOPTE we're interested in */
> > -             ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > -             pte =3D READ_ONCE(*ptep);
> > -
> > -             /* Valid entry? */
> > -             if (!pte)
> > -                     return 0;
> > -
> > -             /* Leaf entry? */
> > -             if (iopte_leaf(pte, lvl, data->iop.fmt))
> > -                     goto found_translation;
> > -
> > -             /* Take it to the next level */
> > -             ptep =3D iopte_deref(pte, data);
> > -     } while (++lvl < ARM_LPAE_MAX_LEVELS);
> > -
> > -     /* Ran out of page tables to walk */
> > -     return 0;
> > -
> > -found_translation:
> > -     iova &=3D (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> > -     return iopte_to_paddr(pte, data) | iova;
> > -}
> > -
> >  struct io_pgtable_walk_data {
> >       void                            *data;
> >       int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> > @@ -760,6 +724,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_i=
o_pgtable *data,
> >                                arm_lpae_iopte *ptep,
> >                                int lvl);
> >
> > +struct iova_to_phys_data {
> > +     arm_lpae_iopte pte;
> > +     int lvl;
> > +};
> > +
> > +static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, =
int lvl,
> > +                           arm_lpae_iopte pte, size_t size)
> > +{
> > +     struct iova_to_phys_data *data =3D walk_data->data;
> > +     data->pte =3D pte;
> > +     data->lvl =3D lvl;
> > +     return 0;
> > +}
> > +
> > +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > +                                      unsigned long iova)
> > +{
> > +     struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> > +     struct iova_to_phys_data d;
> > +     struct io_pgtable_walk_data walk_data =3D {
> > +             .data =3D &d,
> > +             .visit =3D visit_iova_to_phys,
> > +             .addr =3D iova,
> > +             .end =3D iova + 1,
> > +     };
> > +     int ret;
> > +
> > +     ret =3D __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->=
start_level);
> > +     if (ret)
> > +             return 0;
> > +
> > +     iova &=3D (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
> > +     return iopte_to_paddr(d.pte, data) | iova;
> > +}
> > +
> >  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> >                           struct io_pgtable_walk_data *walk_data,
> >                           arm_lpae_iopte *ptep, int lvl)
> > @@ -776,7 +775,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgta=
ble *data,
> >               return 0;
> >       }
> >
> > -     if (WARN_ON(!iopte_table(pte, lvl)))
> > +     if (WARN_ON(!iopte_table(pte, lvl) && !selftest_running))
>
> Why do you care about the selftest here?

Otherwise we see a flood of WARN_ON from negative tests in the selftests

BR,
-R

> Will

