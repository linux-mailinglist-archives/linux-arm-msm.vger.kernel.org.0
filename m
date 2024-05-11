Return-Path: <linux-arm-msm+bounces-19735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E48C33DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D9E01C20EA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D83225AE;
	Sat, 11 May 2024 21:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BEgKZYrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE902137F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464027; cv=none; b=twjtcumjjtSoE8AuSyHGCQ4mY+15/iXaty17ykUY6dhH8ocsLtrTQnylvkRWrnY0MRcWfcjAVr3WozJJT/QOO3t3DSPJrkO9FoMEoHANeFlbjBqQUMkwy775MVYl48y3RTrAItD710Km/E2HfK2i/OSDv+evF6fuxgOsyhPaNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464027; c=relaxed/simple;
	bh=kgtbFy2eSnTzPw4xjY4seg/MJRPmqlcxNeoaq47N8Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAFLtSu4IXuE6LJ5tBkdFsSueLzy9HkpkmmVZhnr3xXW0wQDwYeXv33SJezaEl204QT3tqPBnr9yPvoo6zqq27TK3CrmD0W0BP8WJvZXjCxB4GsxEPqcRkGJkBPFJwxnWVvvFf7BCey8M4/Codb0fRfxbXbkRs5Y1dMCWTwB1t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BEgKZYrG; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61e01d5ea74so32745267b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 14:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464024; x=1716068824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UUDDnmzrxB3l3/4aj031ZrzOLNCmAjmO9rvghUTgzkE=;
        b=BEgKZYrGIq4p1gVZha/Nkjls8UFtnAoxf/pmEWRTU49101eUNy185HBfBJ2t5QRcSh
         hRGKFGj46lBuNfo0wDAJiD/GgDxp2m1J4/eKl9BVbNnWk5buU0UF1JK5VZrYwPYkC+Tw
         vmTxlTd0h7/K/hs0CO/MJr6nImqzM1P5FmA0PgCjfXGgeVEB2QHDcli1PClfTvtdhUFk
         ER2q0tfPiEODu6jF16axWbiQDWPOmNCscW2uLxO1sZ78V4Gk5x40TBIdHtdJ7oUKe3aA
         kphslASG6qqBBHnv+BC37fKtWQQ9yEvtps+MQtoAz3nbL/TVFWVkpo2zHKeqZ8HZXWqG
         kkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464024; x=1716068824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUDDnmzrxB3l3/4aj031ZrzOLNCmAjmO9rvghUTgzkE=;
        b=S8FZVRRgWWbg+TACtIImkUdwr3bALREV0/nHr7fYQlLOf8dF49WS1XAFqCfwO7gB//
         PIDcYM3JUNk/b3BqQucAt9cprvG7FLY/O8e3KWfv1ruJpoom3dnT6QnmJRQX34Wl8lMx
         SPvi/LR712IoFMxCBwLLF8utruDP0VrFSceuhnOJjGA+qOaBVKNQEMeEjQ8YgugrLaY2
         FdpfMUgfWHgNjyDrvqtzOLpLajQgaOI+UUrQoLKPT3E1F0qDfKA4puNxoSe57J1B+ayu
         KsgLe2NjZXQvkAq00jUyMDrfgoPg5fRyWyLHLdw4P0SyE0XdWbWq6jjUUZIMpa8mbX/1
         bwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+LOpU+yfgtR06HAE7RCA8mD6Fsun1N2Pq8lo0BZnrldXi2OrIwQ+tMkKVbIPwRn2R3KQUX/WwWzrxDjPRJoHnQ4P4uIgEmIdu9bQBcw==
X-Gm-Message-State: AOJu0YzANNIrCcS+Vy2DAkjwkcpnw01WD+5BdX/dhsngtD6UsrLKB8d6
	CcnN/MfSENg++b/M2/CcmTQwR4i7C9ox5J+aKRPfFePgxUkWW8L7Ol3pKZIBblmgXnembRuVqqm
	Dbs7jcP36P2dJh6pVey1w30ARo/f3VpRBvSWNtO34USo1YDaA
X-Google-Smtp-Source: AGHT+IGG3nr3fWq7oYomiHLISDdigDRI73rcAWer5xHynouZBj9dhN1hlkvK3TDT9c5wAPBOWXNGkt1XOlWrmP10/T4=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr84631617b3.8.1715464024566; Sat, 11 May 2024
 14:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
In-Reply-To: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:46:53 +0300
Message-ID: <CAA8EJprMULN1BbRvUjh81f7x02cdg7UeNzuEnw2nUNrmKC7eFw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 May 2024 at 22:56, Kiarash Hajian
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
> Changes in v2:
> - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.

Same comment as I posted for v1 of the patch.

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

