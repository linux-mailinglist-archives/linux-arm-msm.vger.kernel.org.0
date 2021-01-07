Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708042ED555
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 18:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbhAGRSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 12:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbhAGRSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 12:18:52 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A69FC0612F4;
        Thu,  7 Jan 2021 09:18:12 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r7so6390085wrc.5;
        Thu, 07 Jan 2021 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFzg996wZghRDMljRiUDGgbxiUKBLaZNfvfWsKyW/2c=;
        b=O/R+YVTkjwuKfy5YWvgsyEfgiPoH29vHtCLfdXluhXXDQMecR7hA02HYW+phgP5FYf
         +rsTzDsrfDY8eQYb8LyKk+xV1LNc0tuVEWT3KNzaBp/CW3BTRimzApYGGgUuzM6BGc9h
         xKdBo+utOMeFzYJ5tSOuZBPdMvi52ufJHp/ZThMp8s4n6yF2Qd6kwtUIgbP+z6lX3nrD
         1/zvka84oezzVer77cNZY8C4+JnWxPovPfjxWvghOMBGpNAEvKplFCuuX0sScDxFtIAo
         jeTOwCiMe/CJ+56CMrh121XfXrV76LIggms0SkQS4SvrdJdJnqkgo6oydFaT5d0H19o5
         BJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFzg996wZghRDMljRiUDGgbxiUKBLaZNfvfWsKyW/2c=;
        b=gG8P3dmV5nsbBtixHf/TZ7PKRxFYVJqcfojF3CuFqnpkA3p1dWmEmPHhZ2GL8HlXru
         XFlajpItfbQYt6KyZAjkaurjbTHOJ4tnsiNfRbGQAza0Gfhy+aVFldvCGm8EwV9qSK4f
         l9Rl4EY4OkUvIGOpGbywVoPl7kgiAjdJRpk1ITUVwOGeSyWqoJbmwSihqcGTPACDFR81
         2OLnNJlCKwlI9xLGomQMzWBgwsQdOnkQTvUkPSzWeJ3RCE9TKzyEBLapoQm04veoORoT
         Uatj44vfMvhe9y8P9SlLhyPxfxeWEMlf5re9jDGm2o/unLeSDOE9gW4E8g6kIspEWukn
         2VWQ==
X-Gm-Message-State: AOAM5312gKSiQUZHkhyAJf42ZpVv6qsRef8uudlTvZK/LdXBQrs8crUR
        MPCUdfdJiVAWJH7SV/urncetTB4h5zzpVJazRHw=
X-Google-Smtp-Source: ABdhPJz/iMez31ElhUqyL+2r7iU5UeEAm0l66rJM1+cGzIhU1tpyYXo3Hi1iqH1RN+pFBNtJxM9eBcIe2Kge97Aq9S0=
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr10040275wrv.132.1610039890761;
 Thu, 07 Jan 2021 09:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 7 Jan 2021 09:20:29 -0800
Message-ID: <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 2, 2021 at 12:26 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> != NULL, because aspace is NULL when using vram carveout.
>
> Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c5e61cb3356df..c1953fb079133 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
>                 struct drm_file *file, struct drm_gem_object *obj,
>                 uint64_t *iova)
>  {
> +       struct msm_drm_private *priv = dev->dev_private;
>         struct msm_file_private *ctx = file->driver_priv;
>
> -       if (!ctx->aspace)
> +       if (!priv->gpu)
>                 return -EINVAL;

Does this actually work?  It seems like you would hit a null ptr deref
in msm_gem_init_vma().. and in general I think a lot of code paths
would be surprised by a null address space, so this seems like a risky
idea.

Maybe instead we should be creating an address space for the vram carveout?

BR,
-R


>         /*
> --
> 2.29.2
>
