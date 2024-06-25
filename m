Return-Path: <linux-arm-msm+bounces-24146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F432916FBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095302812DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB63176AA9;
	Tue, 25 Jun 2024 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee8+jbAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF0F1459E2;
	Tue, 25 Jun 2024 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719338637; cv=none; b=hI0X5wnxqZTNLlt2oceUvDIowtpPKaDMCc0fUpUNL5GZ8tM4toRoiHQz6CJ7IwHmsO8oPjLeXwdj9yWdAYdKrZ8o2bQZYNzhG6wGNPGuut7S5oiEhNdbUm7KhZTlQ5ylyTG6fCqD+eswLgXxVB2Zdcn1Wuwu5DA62n/cfAeR4Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719338637; c=relaxed/simple;
	bh=4eZEqFRWoipG4zTd9GOuhMs3kNAWsvxhedyQHEcVKDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSn8LYZKV0Ef8B6ljArLyRnejsUHlR5GevTxGevQQcxej5llMqn1UTkP01Nwu7Hy8mJtSFtzO+LsFZESm5vrVvysKBBMdr+oEVvLnwDU6cP9izTcGbbKxLmTeOFp96M+l0pNqYHK2SrOZHSYcQZCENKGolo5/4WXX3wY+HT4WUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee8+jbAe; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso7226772a12.0;
        Tue, 25 Jun 2024 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719338634; x=1719943434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6601RBK+eocJf2ba8P+FLfSKXpn6mR5woMfwy6PoMIA=;
        b=ee8+jbAevXE+j22jA359Yr+7/YJ8WhMBgDPuSPYlEHIHjXWLRlCCQcH0dps+9Osan8
         mL+v3oFNifXOJn1aDbh5nnOXer73U/WzgvZFYhmcGYu8Is1i9nRZTyZTDQI2ABBLXKPe
         dJgTzqM4oyVdzhyHypLgULEI7AWdhdHSsaCqbVJWgWhOQdkPtEjCtYL44JLxAcctNYir
         4wsmwVfqRqELvUAF6Ds+lPdzr9q4GqrscNGEX7AxvZfCPFdlRI4HYjInKxahvOiURPTU
         JaCSmewKJHbgO1qdJUyaQjqSibpCibXqFfc7tvYu9JyflSBYs/vsXeV4AUgCKWkzaymu
         cKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719338634; x=1719943434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6601RBK+eocJf2ba8P+FLfSKXpn6mR5woMfwy6PoMIA=;
        b=Wodfk7xe8NY5G30ptOOCYktMgWUuuTpTDIBvhA7o5D2VoO5RMKcZstb2gdP/mBOu23
         b6heJ4t+fyw7SAtOxw8CeUHHLBjJ1E0x/Caa4z1UoiEIM1OWXBV3PBjCKNHA34pOhLwK
         IDTcaMzTZNpv1Z3b0TMJgjDaPwdy26Rsnqo8do8xgcD4NLPpRz/xFwbGu9DcpkY1dMb/
         2gFu7ER2x3oNknxiIvFQcJKOu15faF8F6oryR66dm3MCfPBEdK3M6rtO7936RppulzQu
         EYwVpoM1VLh23ijOTKhn094IBne940LujwQ7Sqv9Rs5tV2ttjNI3NuzuT7/MRMIHVo5f
         BYzg==
X-Forwarded-Encrypted: i=1; AJvYcCXlc8QUMX4BwRYY8HwKvQLxmO8ki1kQQUfHJ/rnG5dcIKgV4ra93tdc16N6xg9fa7lbsg7YPcel/W55pyo9ionavUWTUgxhdaxKeM/orQ/JNmb3/B2WYFtf0MEr8B35gBShoCFDLRKXL6EP2A==
X-Gm-Message-State: AOJu0YyZWDu6WOCDnEbneQi6Ns7lS5SevLggSMM0RpD0HLPvA9mBEVWL
	xiSA9tWBippazVJNEWqt1MODWKNa159jpDNRhGHAS+X5IOT2oI3JI4tujS5uDBYy6V4i4QHxVTj
	xRYaE/3YYIFjGLKbDoTEIh6f9aZ0=
X-Google-Smtp-Source: AGHT+IHJedgwbLU61bzST1zWFY1JoWUlU7S5Qb8p5ldwdp6EHIf6sUA+bXFFcjhLptnoC+wGuGdU73R+N1AbZw60oSo=
X-Received: by 2002:a05:6402:1d52:b0:57d:5e33:371a with SMTP id
 4fb4d7f45d1cf-57d5e3337cfmr6987032a12.39.1719338634304; Tue, 25 Jun 2024
 11:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com> <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 11:03:42 -0700
Message-ID: <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com>
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

On Tue, Jun 25, 2024 at 10:59=E2=80=AFAM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On Fri, Jun 21, 2024 at 02:09:58PM -0700, Rob Clark wrote:
> > On Sat, Jun 8, 2024 at 8:44=E2=80=AFAM Kiarash Hajian
> > <kiarash8112hajian@gmail.com> wrote:
> > >
> > > The driver's memory regions are currently just ioremap()ed, but not
> > > reserved through a request. That's not a bug, but having the request =
is
> > > a little more robust.
> > >
> > > Implement the region-request through the corresponding managed
> > > devres-function.
> > >
> > > Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> > > ---
> > > Changes in v6:
> > >     -Fix compile error
> > >     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-866=
4f52fc2a1@gmail.com
> > >
> > > Changes in v5:
> > >     - Fix error hanlding problems.
> > >     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memor=
y-region-v4-1-3881a64088e6@gmail.com
> > >
> > > Changes in v4:
> > >     - Combine v3 commits into a singel commit
> > >     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memor=
y-region-v3-0-0a728ad45010@gmail.com
> > >
> > > Changes in v3:
> > >     - Remove redundant devm_iounmap calls, relying on devres for auto=
matic resource cleanup.
> > >
> > > Changes in v2:
> > >     - update the subject prefix to "drm/msm/a6xx:", to match the majo=
rity of other changes to this file.
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++--------------=
--------
> > >  1 file changed, 11 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gmu.c
> > > index 8bea8ef26f77..d26cc6254ef9 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *g=
mu)
> > >         bool pdc_in_aop =3D false;
> > >
> > >         if (IS_ERR(pdcptr))
> > > -               goto err;
> > > +               return;
> > >
> > >         if (adreno_is_a650(adreno_gpu) ||
> > >             adreno_is_a660_family(adreno_gpu) ||
> > > @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *g=
mu)
> > >         if (!pdc_in_aop) {
> > >                 seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> > >                 if (IS_ERR(seqptr))
> > > -                       goto err;
> > > +                       return;
> > >         }
> > >
> > >         /* Disable SDE clock gating */
> > > @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *=
gmu)
> > >         wmb();
> > >
> > >         a6xx_rpmh_stop(gmu);
> > > -
> > > -err:
> > > -       if (!IS_ERR_OR_NULL(pdcptr))
> > > -               iounmap(pdcptr);
> > > -       if (!IS_ERR_OR_NULL(seqptr))
> > > -               iounmap(seqptr);
> > >  }
> > >
> > >  /*
> > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct p=
latform_device *pdev,
> > >                 return ERR_PTR(-EINVAL);
> > >         }
> > >
> > > -       ret =3D ioremap(res->start, resource_size(res));
> > > +       ret =3D devm_ioremap_resource(&pdev->dev, res);
> >
> > So, this doesn't actually work, failing in __request_region_locked(),
> > because the gmu region partially overlaps with the gpucc region (which
> > is busy).  I think this is intentional, since gmu is controlling the
> > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > overlapping region.  Maybe Akhil knows more about GMU.
>
> We don't really need to map gpucc region from driver on behalf of gmu.
> Since we don't access any gpucc register from drm-msm driver, we can
> update the range size to correct this. But due to backward compatibility
> requirement with older dt, can we still enable region locking? I prefer
> it if that is possible.

Actually, when I reduced the region size to not overlap with gpucc,
the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.

So I guess that register is actually part of gpucc?

BR,
-R

> FYI, kgsl accesses gpucc registers to ensure gdsc has collapsed. So
> gpucc region has to be mapped by kgsl and that is reflected in the kgsl
> device tree.
>
> -Akhil
>
> >
> > BR,
> > -R
> >
> > >         if (!ret) {
> > >                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s regis=
ters\n", name);
> > >                 return ERR_PTR(-EINVAL);
> > > @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6=
xx_gpu, struct device_node *node)
> > >         gmu->mmio =3D a6xx_gmu_get_mmio(pdev, "gmu");
> > >         if (IS_ERR(gmu->mmio)) {
> > >                 ret =3D PTR_ERR(gmu->mmio);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
> > >         if (IS_ERR(gmu->cxpd)) {
> > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)=
) {
> > > @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx=
_gpu, struct device_node *node)
> > >         gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx");
> > >         if (IS_ERR(gmu->gxpd)) {
> > >                 ret =3D PTR_ERR(gmu->gxpd);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         gmu->initialized =3D true;
> > > @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx=
_gpu, struct device_node *node)
> > >  detach_cxpd:
> > >         dev_pm_domain_detach(gmu->cxpd, false);
> > >
> > > -err_mmio:
> > > -       iounmap(gmu->mmio);
> > > -
> > > +err_cleanup:
> > >         /* Drop reference taken in of_find_device_by_node */
> > >         put_device(gmu->dev);
> > >
> > > @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, st=
ruct device_node *node)
> > >                 gmu->rscc =3D a6xx_gmu_get_mmio(pdev, "rscc");
> > >                 if (IS_ERR(gmu->rscc)) {
> > >                         ret =3D -ENODEV;
> > > -                       goto err_mmio;
> > > +                       goto err_cleanup;
> > >                 }
> > >         } else {
> > >                 gmu->rscc =3D gmu->mmio + 0x23000;
> > > @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, =
struct device_node *node)
> > >
> > >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> > >                 ret =3D -ENODEV;
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
> > >         if (IS_ERR(gmu->cxpd)) {
> > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         link =3D device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNT=
IME);
> > > @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, s=
truct device_node *node)
> > >  detach_cxpd:
> > >         dev_pm_domain_detach(gmu->cxpd, false);
> > >
> > > -err_mmio:
> > > -       iounmap(gmu->mmio);
> > > -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"=
))
> > > -               iounmap(gmu->rscc);
> > > +err_cleanup:
> > >         free_irq(gmu->gmu_irq, gmu);
> > >         free_irq(gmu->hfi_irq, gmu);
> > >
> > >
> > > ---
> > > base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> > > change-id: 20240608-adreno-98c412bfdc03
> > >
> > > Best regards,
> > > --
> > > Kiarash Hajian <kiarash8112hajian@gmail.com>
> > >

