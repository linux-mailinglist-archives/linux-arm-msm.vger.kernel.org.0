Return-Path: <linux-arm-msm+bounces-24170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E140917342
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A20201C246C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 21:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B232517DE20;
	Tue, 25 Jun 2024 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUJW3oKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3312EBEA;
	Tue, 25 Jun 2024 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719350394; cv=none; b=BDxwym9Enaj+Vwhb3qJZ253dG/6HnOUPxcPoli4BSiqH16l6WBhH/9MLadm+W4rpCYLFlS7ajQqbC8DkVKeiSkeyQfOkKHtvW4Bki8rhyUCkVFu79l+CZwqf1c5qk0wJEFA6kG+1jE7FGsJhLBoC3fra/HxqE3mCysjKXkGDsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719350394; c=relaxed/simple;
	bh=+XuujLBS0rgkeBGp3M5ppyNf4ixXXSxMbm51M/ZFzVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEKMuwvBH/DVJSE0/jcpRFYomfRe7wqoZkEHTVPLqcGZJntKQojrf6outfJbNFMPk8rFfNX7JKilO77/iT5zJjWntwfqsnwGxQ5LJYKbks5TdtGiqzzA0b0NychU4X7yjAAmn6R0gwj9gHSQyaFjphkwRck2g++c/2NYxEXq1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUJW3oKe; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d5288e6513so3123808b6e.0;
        Tue, 25 Jun 2024 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719350392; x=1719955192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pE+mGdO/b9jNU7f8ar060kbPsajGXfM93JqBNGUkgg=;
        b=HUJW3oKeBMH3of2opiqm4gZ7Ptd1siDfublP1hFAEhYgAJzbMNH7A7KMoR1hy4zDcf
         uiolxjjb6QQCdP9Hm7Cnfo7Nj1ey2lWPKpJSJprUwjHf5JfxasnML536KlIFKjBrtR44
         N7T99u8lPtGaSDF3Kr378X5hILf1tw6I6xuHeS11cvGrP7o+aSwvRrnCC3Z4x6oorm3S
         WY2Ix1D4SPFOu1/jL3xxUARdrWESjn3tIs+gO3/bxWEwqpHphlNi/Ih+BfVJSzNHSX+q
         YYye/FQ2BQA8OiruvX1Q0jr2TiUiuz0AWcxhINAMACP7/EViuB6NEb6zzo+mSvAxRXrd
         e1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719350392; x=1719955192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pE+mGdO/b9jNU7f8ar060kbPsajGXfM93JqBNGUkgg=;
        b=nqJsDoLPPXE8+9Us0khu75Q5d1CnxyF9B9jbiRUR3OPjdP0omzMCOowT2sJsHP8z2G
         YAvUAnfPtMUyJk64w5GHuO7YgU4WVab49GTG8qgcVX0M1lv9ZCZdl+tpJrQwOA8jJ+hm
         zeF+mT1vndWgPE/F80WGrwX5vmhNZ0DYnjJ8izebuKhsl8ysTNiNPjjmqKhaD0CxQOh1
         1WY/D5twDJDEEX3DzEV77SPBkt3bZ5VSbI9XaMiHZZwHRBhSQGuQbovfpup2gm9gsv5o
         h5g0ohvcsyqkf2M6hg44JVHgHg/hxbkBzDT61KjwHUQVKYPMhpfxaaJWTEMfY3w8R4K3
         5E2A==
X-Forwarded-Encrypted: i=1; AJvYcCUE5cQc5GYnI3kNZ5eaf0AyVE7KZH33K/8B0abuUCQ2IZ5vCWrCLu6HP9cHo9Qlsrfz86Uo+EJNeo1sRLWeYvATj/Osiv254qyK9nu35let6fS0KtQrN8yin3vGcBQR6qOctWJDVkx6uczQCQ==
X-Gm-Message-State: AOJu0YxChsQFZuvtIngqTWdbb9o5nBPMFp9vDRRTVqAefm8jX1olmwBj
	aGP1Tc/qdIoH0seelC1/cM11zNZUg5u3Kwo2H73sGMszHaiAvQ820hd8O7OE3BoWAUBPMEifWLt
	wVHxC+4vAT/Crn3BpmM6mP328qiE=
X-Google-Smtp-Source: AGHT+IFfpS/mJqzmwoGoJ1zaWvoriUTloqnkED1TLqGgvkdc3QDnupkHUmMDbY7hT8896/uRk2P5PekLygV2OxySsj8=
X-Received: by 2002:a05:6808:1491:b0:3d1:be9f:c9a3 with SMTP id
 5614622812f47-3d54587950amr10755257b6e.0.1719350391814; Tue, 25 Jun 2024
 14:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com> <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com> <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 14:19:38 -0700
Message-ID: <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Kiarash Hajian <kiarash8112hajian@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 1:23=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Jun 25, 2024 at 11:03:42AM -0700, Rob Clark wrote: > On Tue, Jun =
25, 2024 at 10:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicinc.com> wrot=
e:
> > >
> > > On Fri, Jun 21, 2024 at 02:09:58PM -0700, Rob Clark wrote:
> > > > On Sat, Jun 8, 2024 at 8:44=E2=80=AFAM Kiarash Hajian
> > > > <kiarash8112hajian@gmail.com> wrote:
> > > > >
> > > > > The driver's memory regions are currently just ioremap()ed, but n=
ot
> > > > > reserved through a request. That's not a bug, but having the requ=
est is
> > > > > a little more robust.
> > > > >
> > > > > Implement the region-request through the corresponding managed
> > > > > devres-function.
> > > > >
> > > > > Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> > > > > ---
> > > > > Changes in v6:
> > > > >     -Fix compile error
> > > > >     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1=
-8664f52fc2a1@gmail.com
> > > > >
> > > > > Changes in v5:
> > > > >     - Fix error hanlding problems.
> > > > >     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-m=
emory-region-v4-1-3881a64088e6@gmail.com
> > > > >
> > > > > Changes in v4:
> > > > >     - Combine v3 commits into a singel commit
> > > > >     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-m=
emory-region-v3-0-0a728ad45010@gmail.com
> > > > >
> > > > > Changes in v3:
> > > > >     - Remove redundant devm_iounmap calls, relying on devres for =
automatic resource cleanup.
> > > > >
> > > > > Changes in v2:
> > > > >     - update the subject prefix to "drm/msm/a6xx:", to match the =
majority of other changes to this file.
> > > > > ---
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++----------=
------------
> > > > >  1 file changed, 11 insertions(+), 22 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gmu.c
> > > > > index 8bea8ef26f77..d26cc6254ef9 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > > @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gm=
u *gmu)
> > > > >         bool pdc_in_aop =3D false;
> > > > >
> > > > >         if (IS_ERR(pdcptr))
> > > > > -               goto err;
> > > > > +               return;
> > > > >
> > > > >         if (adreno_is_a650(adreno_gpu) ||
> > > > >             adreno_is_a660_family(adreno_gpu) ||
> > > > > @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gm=
u *gmu)
> > > > >         if (!pdc_in_aop) {
> > > > >                 seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq")=
;
> > > > >                 if (IS_ERR(seqptr))
> > > > > -                       goto err;
> > > > > +                       return;
> > > > >         }
> > > > >
> > > > >         /* Disable SDE clock gating */
> > > > > @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_g=
mu *gmu)
> > > > >         wmb();
> > > > >
> > > > >         a6xx_rpmh_stop(gmu);
> > > > > -
> > > > > -err:
> > > > > -       if (!IS_ERR_OR_NULL(pdcptr))
> > > > > -               iounmap(pdcptr);
> > > > > -       if (!IS_ERR_OR_NULL(seqptr))
> > > > > -               iounmap(seqptr);
> > > > >  }
> > > > >
> > > > >  /*
> > > > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(stru=
ct platform_device *pdev,
> > > > >                 return ERR_PTR(-EINVAL);
> > > > >         }
> > > > >
> > > > > -       ret =3D ioremap(res->start, resource_size(res));
> > > > > +       ret =3D devm_ioremap_resource(&pdev->dev, res);
> > > >
> > > > So, this doesn't actually work, failing in __request_region_locked(=
),
> > > > because the gmu region partially overlaps with the gpucc region (wh=
ich
> > > > is busy).  I think this is intentional, since gmu is controlling th=
e
> > > > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > > > overlapping region.  Maybe Akhil knows more about GMU.
> > >
> > > We don't really need to map gpucc region from driver on behalf of gmu=
.
> > > Since we don't access any gpucc register from drm-msm driver, we can
> > > update the range size to correct this. But due to backward compatibil=
ity
> > > requirement with older dt, can we still enable region locking? I pref=
er
> > > it if that is possible.
> >
> > Actually, when I reduced the region size to not overlap with gpucc,
> > the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.
> >
> > So I guess that register is actually part of gpucc?
>
> Yes. It has *GPU_CC* in its name. :P
>
> I just saw that we program this register on legacy a6xx targets to
> ensure retention is really ON before collapsing gdsc. So we can't
> avoid mapping gpucc region in legacy a6xx GPUs. That is unfortunate!

I guess we could still use devm_ioremap().. idk if there is a better
way to solve this

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> > > FYI, kgsl accesses gpucc registers to ensure gdsc has collapsed. So
> > > gpucc region has to be mapped by kgsl and that is reflected in the kg=
sl
> > > device tree.
> > >
> > > -Akhil
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > >         if (!ret) {
> > > > >                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s r=
egisters\n", name);
> > > > >                 return ERR_PTR(-EINVAL);
> > > > > @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu=
 *a6xx_gpu, struct device_node *node)
> > > > >         gmu->mmio =3D a6xx_gmu_get_mmio(pdev, "gmu");
> > > > >         if (IS_ERR(gmu->mmio)) {
> > > > >                 ret =3D PTR_ERR(gmu->mmio);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx"=
);
> > > > >         if (IS_ERR(gmu->cxpd)) {
> > > > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNT=
IME)) {
> > > > > @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *=
a6xx_gpu, struct device_node *node)
> > > > >         gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx"=
);
> > > > >         if (IS_ERR(gmu->gxpd)) {
> > > > >                 ret =3D PTR_ERR(gmu->gxpd);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         gmu->initialized =3D true;
> > > > > @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *=
a6xx_gpu, struct device_node *node)
> > > > >  detach_cxpd:
> > > > >         dev_pm_domain_detach(gmu->cxpd, false);
> > > > >
> > > > > -err_mmio:
> > > > > -       iounmap(gmu->mmio);
> > > > > -
> > > > > +err_cleanup:
> > > > >         /* Drop reference taken in of_find_device_by_node */
> > > > >         put_device(gmu->dev);
> > > > >
> > > > > @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu=
, struct device_node *node)
> > > > >                 gmu->rscc =3D a6xx_gmu_get_mmio(pdev, "rscc");
> > > > >                 if (IS_ERR(gmu->rscc)) {
> > > > >                         ret =3D -ENODEV;
> > > > > -                       goto err_mmio;
> > > > > +                       goto err_cleanup;
> > > > >                 }
> > > > >         } else {
> > > > >                 gmu->rscc =3D gmu->mmio + 0x23000;
> > > > > @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_g=
pu, struct device_node *node)
> > > > >
> > > > >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> > > > >                 ret =3D -ENODEV;
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx"=
);
> > > > >         if (IS_ERR(gmu->cxpd)) {
> > > > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         link =3D device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_=
RUNTIME);
> > > > > @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gp=
u, struct device_node *node)
> > > > >  detach_cxpd:
> > > > >         dev_pm_domain_detach(gmu->cxpd, false);
> > > > >
> > > > > -err_mmio:
> > > > > -       iounmap(gmu->mmio);
> > > > > -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "r=
scc"))
> > > > > -               iounmap(gmu->rscc);
> > > > > +err_cleanup:
> > > > >         free_irq(gmu->gmu_irq, gmu);
> > > > >         free_irq(gmu->hfi_irq, gmu);
> > > > >
> > > > >
> > > > > ---
> > > > > base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> > > > > change-id: 20240608-adreno-98c412bfdc03
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Kiarash Hajian <kiarash8112hajian@gmail.com>
> > > > >

