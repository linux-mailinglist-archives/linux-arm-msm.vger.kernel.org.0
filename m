Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBDC27A269
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 20:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0SzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 14:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0SzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 14:55:01 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5190FC0613CE;
        Sun, 27 Sep 2020 11:55:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id s13so4312158wmh.4;
        Sun, 27 Sep 2020 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=brvQm4unB3hIW5ks3wpg170xx2FM0HklqjhCrETMSNw=;
        b=JFzdOJLTF1KRTT0oZdkxEw5FHIUmpAjxRb6c+ecTjVsE1za0CU4dvy8wHmdQka+QCy
         2IhVbXv3DBsE4a5Wjm4vQR6v5LhmaFd+Rncmw3nIY6ES7Ta9Cg6mMB2hOtrDZXppot7W
         RPe6NHvCxSOgwhWZeFKN6b0FdYiZ3CQwmLfcU+VzOjo/YWrh0mMTg/5MFX3rxZJuwKRY
         jGBPj0D3rl9Sf9sBU3Z0vjfDmzXA51ER3Wy1e+g2kj8qGivJc8QIKEVoV9Hg0OGMMgr5
         6WmwiBwi03iYpYXjbIR4+CTzk6pq4wbDrwFQIXOTz4LKcGWd93dVAc1uMRCLQQlJ+dbP
         DsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=brvQm4unB3hIW5ks3wpg170xx2FM0HklqjhCrETMSNw=;
        b=K+RQYnvxr5VyU/RGp0EQu2wGaGvnmldg1f0Q7mppheOLixNnTllZZenJqut6YwW9Oc
         J30/U679oqIgHk8TMkuIf9F8YsNfl8dX596K+BN4PMga5WBQ7WesP+9eiMXcGrln4mpt
         szl8YqxSSenvLAd4SSzigGcnzC1CY4Ud26NtwvnfIOGsfI2p0koSogKuBQmBXQBNkymp
         PPIPWrUBMZZ6cYfejntoR7vW5oc/rYv72fM30y8vVEWePAir2sbKScFx/nBhY0/uWXj0
         dnLuett0Hz3ehPFuXwS/mlGD/4qNJuNdX46SE5rIOsdKFyKAHsDnpGhnft4fOr1/SmMM
         H6Tg==
X-Gm-Message-State: AOAM5321Io2ulamxx3/Sf4o9xnlwwnyIn2ndJbLEXcFzFosueUF0RRFA
        F9D4hcNtuq82+d0t89WgIG7fkWS3GF4x4BZa+/C5oopoPrM=
X-Google-Smtp-Source: ABdhPJyciMQiTeNvYglZLOHS2eTlNWi1mE4u3Eejs/H7XAjuqgHYQE8Xqkj+zDqXIj5Sr/dWauhAxw99yHdJ8k5ebFU=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr7872233wmg.164.1601232899846;
 Sun, 27 Sep 2020 11:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com> <20200926125146.12859-7-kholk11@gmail.com>
In-Reply-To: <20200926125146.12859-7-kholk11@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 27 Sep 2020 11:56:03 -0700
Message-ID: <CAF6AEGtZhnWqzP4YAh-zBX_kYXZWWx6a_deV8ONHfQ4af394ew@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/msm/a5xx: Disable flat shading optimization
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>, marijns95@gmail.com,
        martin.botka1@gmail.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 5:52 AM <kholk11@gmail.com> wrote:
>
> From: Konrad Dybcio <konradybcio@gmail.com>
>
> Port over the command from downstream to prevent undefined
> behaviour.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index b2670af638a3..bdc852e7d979 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -759,6 +759,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>             adreno_is_a540(adreno_gpu))
>                 gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
>
> +       /* Disable All flat shading optimization */
> +       gpu_rmw(gpu, 0x00000E60, 0, 0x1 << 10);

Looks like VPC_DBG_ECO_CNTL.ALLFLATOPTDIS (based on downstream
41582a1f24d2961094c556db788028b433d8476a)

BR,
-R

> +
>         /* Protect registers from the CP */
>         gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
>
> --
> 2.28.0
>
