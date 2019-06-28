Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF14159C26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 14:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfF1M5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 08:57:43 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38384 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfF1M5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 08:57:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id r12so10778770edo.5;
        Fri, 28 Jun 2019 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ueum79s2anlYRWAS9FzgzUG5wD5wG/lgkeWFXCOZvM=;
        b=Vsvc9FDKFPgRzauk8Np3VxKo8ItjOarCG/RlvXleY2TbKd28c/x/ep7DNZ2QsaFtp+
         qPSDxgbdaCVLAqkDqePuAf4kl1Gs+fC421GxUCMubv5o3NHu37Q/B7uFx3zKlYCBCo62
         DmrkABGvkTzrFhmRrV2eZEswUp+1+/IH3k0Y4+9APWCbJK9CrbH8GWoTzvFwonJOEhod
         JSUAMZmjsu6UFkipC2194iWXuqzUzdV2EEHWRI5SVToBk2QGi6wnHjvqC7iL4i/QGyPe
         EChj5ytcdah2+5MBwfJQMcFvMc73KIHiTSIgRs7kmPMwFXI904fprhovqJVFndOWvapW
         fLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ueum79s2anlYRWAS9FzgzUG5wD5wG/lgkeWFXCOZvM=;
        b=lYsMv7lhf9v20T5PllNPPggBsdr1LBir7F7F28Qqe/Nr/IYc4v+gYZDN3+2JsbQAR8
         yQ2h2RNwl9yu5nViP2sKb5zBBXi4M4EyhZ4D+tBbphPoRTIRli9gR/dNMIfngJ8vqfmh
         Rhg2lKLY45lZhK0zvZVvl6JnGeCCM3I0JCKOTfWrBUo/bszob8JfpnR47vnALfMl1OmQ
         bSGBn+Gk76XWSbMvEKWWHVNnTjdLQbRXjpjCGUxHuHEXV6dN9XdKMVwALvlABApSWR50
         vJwhtiyHo7nuTXN+Ck4d6RJca0lqyWEe+DwekhhzDDdLpTw3OQV+K+6afyJmo+aXFnSy
         kvsA==
X-Gm-Message-State: APjAAAXo3dZ8hvEiTuEIJ5tiQ8LvwW0FMXMm+hd8fb8yyCYoufrBn3/h
        VxJ2CuN+l4i4eFbWSqOwWKbB7zlGptP83fredTA=
X-Google-Smtp-Source: APXvYqx/IMk24rdtcifnHuLMV6DCNhTAzYuxxQja93vW7hEYjOvG7wHyp/9qq5VtECkxVyq2rfOAvLhGOZyY7X4lzP4=
X-Received: by 2002:a17:906:951:: with SMTP id j17mr8540123ejd.174.1561726661672;
 Fri, 28 Jun 2019 05:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190627020515.5660-1-masneyb@onstation.org>
In-Reply-To: <20190627020515.5660-1-masneyb@onstation.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 28 Jun 2019 05:57:26 -0700
Message-ID: <CAF6AEGvFE46aKCBP5de_Bx_hFcTyF0Vc9B1PebBZjGZmw9zh2g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: correct NULL pointer dereference in context_init
To:     Brian Masney <masneyb@onstation.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 26, 2019 at 7:05 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Correct attempted NULL pointer dereference in context_init() when
> running without an IOMMU.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: 295b22ae596c ("drm/msm: Pass the MMU domain index in struct msm_file_private")
> ---
> The no IOMMU case seems like functionality that we may want to keep
> based on this comment:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/adreno/a3xx_gpu.c#L523
> Once I get the msm8974 interconnect driver done, I'm going to look into
> what needs to be done to get the IOMMU working on the Nexus 5.
>
> Alternatively, for development purposes, maybe we could have a NOOP
> IOMMU driver that would allow us to remove these NULL checks that are
> sprinkled throughout the code. I haven't looked into this in detail.
> Thoughts?

yeah, we probably want to keep !iommu support, it is at least useful
for bringup of new (or old) devices.  But tends to bitrot a since it
isn't a case that gets tested much once iommu is in place.  Perhaps
there is a way to have a null iommu/aspace, although I'm not quite
sure how that would work..

Anyways,

Reviewed-by: Rob Clark <robdclark@gmail.com>

(I guess this can go in via drm-misc-fixes unless we get some more
fixes to justify sending msm-fixes MR..)

>
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 451bd4508793..83047cb2c735 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -619,7 +619,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>
>         msm_submitqueue_init(dev, ctx);
>
> -       ctx->aspace = priv->gpu->aspace;
> +       ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
>         file->driver_priv = ctx;
>
>         return 0;
> --
> 2.20.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
