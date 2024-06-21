Return-Path: <linux-arm-msm+bounces-23654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F4912F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EC881F213B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D2B17920E;
	Fri, 21 Jun 2024 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTm99474"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48416D4F5;
	Fri, 21 Jun 2024 21:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004214; cv=none; b=Erk6XJbaeacOVnHYqMrxafQgtu4pKsIJQHwRnJGWhJGk1jnVbkMpzjVEpvIFXl6dqps/kHHiWvNSxdD0wTf4KWM35sH0sX3vd6YdngBaSt7V4+EIDN3Vtl+fN1XMBR3DSVmX/fZ6m8vohtuK508y7YF4lwoD43afSy07Y/yKpK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004214; c=relaxed/simple;
	bh=kBMVQKD187TQoFUzvudiO59K6NVUbYUsV7I2wwDMgqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icLvnN+c9lWzGg45kADtgXbD4U5Ob7XNROMdU6uG31HRU6aA3IY5bEE+/P//dFtoif4pc6gGT/yhbR6Zx25QN2IJlpjD+IpE+1iLvdiJT1N8RCfJUOF8rnXqBWyrrtmwygqHibdQDiZ0N66nGlcPGvG+uOEhdkBQtKJl6zyeO7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTm99474; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso25976291fa.0;
        Fri, 21 Jun 2024 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719004211; x=1719609011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iyb8hSYVKKM/r+VcpqNlS7PyezuJWmc+CZRduY6w58=;
        b=BTm99474DIfXvy4lyYH8e45Im0wKrwg77ytulN05IbeA1drZ56MwuDo3adz6dl/7Q+
         Xnu7PHBbuyYhoAYJV5DcZgscJawJFDRCgH/yHkzFcPXDN9fsSw4tr2u79SolubdfF8QH
         CRQjZSlkUGf+GKCMHhvUKsZujuDCb/PFw+k+Rv5omgdjjZ0BIMPduvzudW7t9yYi2fyk
         gElFRIAM/8O+Ch5a0pq3M3OZeh+sRdFEhxYm1NVgszSkpBCEw5CP/KPu1FWJlfIhMrbd
         BPFeIew124X5pU0C/WasrRc3tG+rl8mmoCnYZ2gxLfF2dN8s4BouIcU67Z2zNP4kWSfy
         z10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719004211; x=1719609011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iyb8hSYVKKM/r+VcpqNlS7PyezuJWmc+CZRduY6w58=;
        b=odJeXGrbGvzorIng+ON5twKXWj+62XiqSz6JCjTKJZeF4NxrYYnCSkOYDKAlkbZBEU
         8OlT5+T7cnx8bAo8yBFXhUySH6nMxueNn4BxZWVHErQNXnS+hWe3e+aW8CYLikh566m5
         LKw2C7yh84CqKxrF/PWKblE7MWfQcokRACifA+e+dltTwg3P796oH/KZU1gNv4m3QM5e
         ngKiar2qHeBB+1B+4UBXVYLYm5ixMMlFpyj3aIUtOTPFWbnqLbN/Rc1Of1jPvjx/IY/j
         Omm/et/vudxBwrF+qJTRKpTlItWWgSeKH7ZglR7pMEQ3Of5KIbtOUs8VkYfDlHvLL/rP
         IwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaYjMfin1Dqzfcj924nF5xJ50Y1BXe2MLVc8LL37+YNjGIqF2gdqPrk/TE/TY7LjwauGX+6pXUORPv0k35Ujd9DqoKIJMvUGozUzPi9GePyjIVTw7EQPvla53OQGRK9LYxTSBztbcvFTt3wA==
X-Gm-Message-State: AOJu0YzV/8QEdkmql0K94SI0KwpoHXrxaG89xVgW3oH60fiufasiY/qx
	gkatfBkW3/GFPw/mA4d5/6XPyWsXZDN9Cdfi9IK33WgB5lSdSP+L+9mM7951SB+KlseTyxbiVo6
	WZhCdzGPSCV4jLsUtvOr802B4dnM=
X-Google-Smtp-Source: AGHT+IFTUdQNhFX9z3HzVsP6p8XRuwLWasMMpz6XtrH6ITxmXMhIMxrau9yHHT5d8uO3N60DhYAXORX55VBi/l3TcOk=
X-Received: by 2002:a2e:7818:0:b0:2ec:3bc4:3e36 with SMTP id
 38308e7fff4ca-2ec3ceb6a56mr60042591fa.14.1719004210910; Fri, 21 Jun 2024
 14:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
In-Reply-To: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Jun 2024 14:09:58 -0700
Message-ID: <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 8, 2024 at 8:44=E2=80=AFAM Kiarash Hajian
<kiarash8112hajian@gmail.com> wrote:
>
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
>
> Implement the region-request through the corresponding managed
> devres-function.
>
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v6:
>     -Fix compile error
>     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-8664f52=
fc2a1@gmail.com
>
> Changes in v5:
>     - Fix error hanlding problems.
>     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-re=
gion-v4-1-3881a64088e6@gmail.com
>
> Changes in v4:
>     - Combine v3 commits into a singel commit
>     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-re=
gion-v3-0-0a728ad45010@gmail.com
>
> Changes in v3:
>     - Remove redundant devm_iounmap calls, relying on devres for automati=
c resource cleanup.
>
> Changes in v2:
>     - update the subject prefix to "drm/msm/a6xx:", to match the majority=
 of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++------------------=
----
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 8bea8ef26f77..d26cc6254ef9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         bool pdc_in_aop =3D false;
>
>         if (IS_ERR(pdcptr))
> -               goto err;
> +               return;
>
>         if (adreno_is_a650(adreno_gpu) ||
>             adreno_is_a660_family(adreno_gpu) ||
> @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         if (!pdc_in_aop) {
>                 seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>                 if (IS_ERR(seqptr))
> -                       goto err;
> +                       return;
>         }
>
>         /* Disable SDE clock gating */
> @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         wmb();
>
>         a6xx_rpmh_stop(gmu);
> -
> -err:
> -       if (!IS_ERR_OR_NULL(pdcptr))
> -               iounmap(pdcptr);
> -       if (!IS_ERR_OR_NULL(seqptr))
> -               iounmap(seqptr);
>  }
>
>  /*
> @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platf=
orm_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret =3D ioremap(res->start, resource_size(res));
> +       ret =3D devm_ioremap_resource(&pdev->dev, res);

So, this doesn't actually work, failing in __request_region_locked(),
because the gmu region partially overlaps with the gpucc region (which
is busy).  I think this is intentional, since gmu is controlling the
gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
overlapping region.  Maybe Akhil knows more about GMU.

BR,
-R

>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers=
\n", name);
>                 return ERR_PTR(-EINVAL);
> @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_g=
pu, struct device_node *node)
>         gmu->mmio =3D a6xx_gmu_get_mmio(pdev, "gmu");
>         if (IS_ERR(gmu->mmio)) {
>                 ret =3D PTR_ERR(gmu->mmio);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
>         if (IS_ERR(gmu->cxpd)) {
>                 ret =3D PTR_ERR(gmu->cxpd);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu=
, struct device_node *node)
>         gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx");
>         if (IS_ERR(gmu->gxpd)) {
>                 ret =3D PTR_ERR(gmu->gxpd);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         gmu->initialized =3D true;
> @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu=
, struct device_node *node)
>  detach_cxpd:
>         dev_pm_domain_detach(gmu->cxpd, false);
>
> -err_mmio:
> -       iounmap(gmu->mmio);
> -
> +err_cleanup:
>         /* Drop reference taken in of_find_device_by_node */
>         put_device(gmu->dev);
>
> @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct=
 device_node *node)
>                 gmu->rscc =3D a6xx_gmu_get_mmio(pdev, "rscc");
>                 if (IS_ERR(gmu->rscc)) {
>                         ret =3D -ENODEV;
> -                       goto err_mmio;
> +                       goto err_cleanup;
>                 }
>         } else {
>                 gmu->rscc =3D gmu->mmio + 0x23000;
> @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, stru=
ct device_node *node)
>
>         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
>                 ret =3D -ENODEV;
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
>         if (IS_ERR(gmu->cxpd)) {
>                 ret =3D PTR_ERR(gmu->cxpd);
> -               goto err_mmio;
> +               goto err_cleanup;
>         }
>
>         link =3D device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)=
;
> @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struc=
t device_node *node)
>  detach_cxpd:
>         dev_pm_domain_detach(gmu->cxpd, false);
>
> -err_mmio:
> -       iounmap(gmu->mmio);
> -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -               iounmap(gmu->rscc);
> +err_cleanup:
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
>
> ---
> base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> change-id: 20240608-adreno-98c412bfdc03
>
> Best regards,
> --
> Kiarash Hajian <kiarash8112hajian@gmail.com>
>

