Return-Path: <linux-arm-msm+bounces-19733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6A8C3399
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2955F281C9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 19:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E571CF9B;
	Sat, 11 May 2024 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UarpGMWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D451C290
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715457013; cv=none; b=M4P96Jrgq4D4M0QgutYgF9qOmsqTCGF7DLYmeLOwnWIst+YXFNMSiGe05O9f96tTaZjnmVNxkAPdflBX/lqtaAolNJTtPWJeQ6KnbOiwpMfZoND9FlAc/aEpFhH7uPQS2s7tjHAlbjoZCyMIkakO5VhX4eWzNzltJ0HvLMeGr6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715457013; c=relaxed/simple;
	bh=msAa4ThmS8hfyYYGhv7dJYNyuAiFPDgAPlDKrrH68wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo55kqKoqD/NefrahbOowxZ4zFa1swZjYDUp/LpE8Y42P8jZ1lbRh6E5MfUCg3v84tYxoeO8j1NKW4RJj6+yVqQt+vjmWiPheBnAI2SNitOn0Bn7VV55Q1bgBJ9oGUzNlCd8y6eopUXE0Ky3XN7tqLQlb6QZZsimr20cU/XXRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UarpGMWe; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de604ca3cfcso3086251276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715457010; x=1716061810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F3s0BYtwV5QP2poIgqh39ZmRBGGeeft/DMBZxm9dZ+c=;
        b=UarpGMWenC64SyI18dVsfmSUsmA6ux3QGhmPJ0gYkbrqnvs5Lbs1Xl70BS6JYamykJ
         +tArF1BPEY66iZiWLWzlh51Ksgu6o0lLyPecNpN23ve59P6KfvHZGA4JjMfAkw8LZFiT
         qv5MJoNmdaYHUV/54L5p2vNsxewoK/NFx41yp9mq3k/funBNqLFsNEag7xIP/FHZ9lvf
         C2wjgjtzl8yMfVEC3HlzLzdesQHRH4ZwhPsCm3bk7Tjseljr58MrRzc0/+C+ZvvmfcCb
         eBN0rZEveVMzDBE0neBq2RUblRvqbnscRqVQmU6UITj1jF1g1Aa8NsjUtfSdVH5cQhCr
         ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715457010; x=1716061810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3s0BYtwV5QP2poIgqh39ZmRBGGeeft/DMBZxm9dZ+c=;
        b=hU+6BiYO9WFttvhVzzT4XxAaETSugbQGA2WkXOMVuCC+NimZiLOYKdiHw9L1bhQAfH
         XN/ig8ns43NIo/nueKbixNBD4I7SNQOa0c7OpeB4Y+74a4oPVnWEb6dYfPISSK0+DM21
         u5y2VBzmChERHbHNVvNlNXB2xIWz9D1/QNJdvLdX+SQofhshkdeoiMuFbaDFLaKnucI3
         5Q8KIIXvr+gY8hOVEFvojt32HSH4VqRMXk7IHRPzbLmUGGqiAwnzYt770bHgukvx0uPS
         ssXPNSWJebH7AqPy7EZhZKM9PEzGQKGZ7lzKsPUmXelV9fyekWGD1EhXDL+mQJnyWjiq
         636g==
X-Forwarded-Encrypted: i=1; AJvYcCVJvMA4r54302NyHBlImf8oVYLCf0Vscc21MYeLVao5lhYkwZP6WpCofM+wHpfJbSrXvyWSZ5PiCTUV0X8CMgdjIgIQdhqpmbTQZq5toQ==
X-Gm-Message-State: AOJu0YzZpJdMQ29HNhVRlizOEmgYt1Ti8UPLcUm7xqfiubEXaMwm13sT
	YF6gz3VH8gtwk3vrbUj0mSjee6QW7CtOqYWU60Obzx6pzl/PFmXhioq9ukbCsogTPZjFb4+HzWY
	BXMbredE7jssUKn556KNJb4l7ruydX0eA5xRCl3vBAdA6tSKg
X-Google-Smtp-Source: AGHT+IH9oytgieimnJ6EUHW02efq8o7XP9X5e1CpiXtKNoPTUQJ83yI9IK5vGxbcwkH+3Dtqr7EKoZaRHYG6zBFUUaY=
X-Received: by 2002:a25:b1a3:0:b0:dee:5cb6:483c with SMTP id
 3f1490d57ef6-dee5cb64977mr4069754276.49.1715457010482; Sat, 11 May 2024
 12:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
In-Reply-To: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 May 2024 22:49:59 +0300
Message-ID: <CAA8EJprdnzvhx50DVHBRLZGkk4GNuCXaBiXt3wfNv-xm2AWOvg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 May 2024 at 22:35, Kiarash Hajian
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
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..aa83cb461a75 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>
>  err:
>         if (!IS_ERR_OR_NULL(pdcptr))
> -               iounmap(pdcptr);
> +               devm_iounmap(&pdev->dev,pdcptr);
>         if (!IS_ERR_OR_NULL(seqptr))
> -               iounmap(seqptr);
> +               devm_iounmap(&pdev->dev,seqptr);

Is there any reason to keep devm_iounmap calls? IMO with the devres
management in place, there should be no need to unmap them manually.

>  }
>
>  /*
> @@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret = ioremap(res->start, resource_size(res));
> +       ret = devm_ioremap_resource(&pdev->dev, res);
>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>                 return ERR_PTR(-EINVAL);
> @@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>
>         /* Drop reference taken in of_find_device_by_node */
>         put_device(gmu->dev);
> @@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>         if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -               iounmap(gmu->rscc);
> +               devm_iounmap(gmu->dev ,gmu->rscc);
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
>
> ---
> base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
> change-id: 20240511-msm-adreno-memory-region-2bcb1c958621
>
> Best regards,
> --
> Kiarash Hajian <kiarash8112hajian@gmail.com>
>


-- 
With best wishes
Dmitry

