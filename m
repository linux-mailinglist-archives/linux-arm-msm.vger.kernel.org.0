Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7725B20DA7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732171AbgF2T5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388200AbgF2T5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:57:31 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BF4C061755;
        Mon, 29 Jun 2020 12:57:31 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id h28so14053585edz.0;
        Mon, 29 Jun 2020 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AaIAGXzm3zle6m3IyH6J6bY+lak3D/cEfWozndthNJQ=;
        b=bH7wT0Px6bC7hXr1S6yEgmoWByAw/Sx0DSg0e3sBnS6GfVDVkgciX1P6xiXpE5ikWi
         EKNxcnejGmYA74L9W6I79GzlF+DEBoJDK9EZpI3DGdPHozeUi933NqosK1opTbyWgskW
         ta2XN6jexhlUpxoUpJJ68E+L+6RcUF4kcyij9OgF1o7eM6Y8JzUP8cafX4ViUqNz6TaB
         Lt0FKK9Nu+u4VEyFbOojPocJ0pnx/8RJPCHhxka9jm3y2F6G1YUMZAPRUbSdvYM8RrPh
         ANjOnT2SH02GOZKMLwoa4t0cOvQGEENFu0/ZhL9smtbFnj2dZfjMa2k4ysF/piDp7gd0
         Bl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AaIAGXzm3zle6m3IyH6J6bY+lak3D/cEfWozndthNJQ=;
        b=jJ9+pIK3JdCHw6lEMn97tzxaqG4FB0LCjm6WKYhFkifZvsju7JVaQMsIjtYvt8yMnZ
         BYP9sBSw6wjnOY4qGpNZCmPV3yOZhkntZbCXEe0oYP1g4MjO/4zuO4hQLEwoYIC02UjA
         y1UaEO6FdDX6XEavzq7PwwT7cf7W9HRYFXq1Wuydt+giXMn/15NWh2Y4T+mcUuGLUEZl
         jgfiMvMN9I0OuTDP0Im//1tXGJ0Cymwmb3FSNT5T66oyzkAbR/rPRLdq0gqB7j4a3Lgx
         Qtl4XZxBkTt1FeCOeg8p0EZYY3gbFSpWlA19wNLxYG3IRU2IlMd1j3VR904U2xQr2ZgF
         bYNw==
X-Gm-Message-State: AOAM5322vxZYZ9gMLg3oqZMKCcFz/KMPGKEbL9afCHWptIlHC3DjTTSp
        n8uKv/OAaz9fR7eqMAUUjCMUM1txgUgNI6uSDySZgPl/
X-Google-Smtp-Source: ABdhPJxuqVeCta8VoAgMN0v4dnb20yspX1tWXnf7++Cbpyc1biLAcvlB00qweNwifDIJzhl2qqHoB4gCEw2ejQUXIfA=
X-Received: by 2002:aa7:d792:: with SMTP id s18mr19820549edq.7.1593460649733;
 Mon, 29 Jun 2020 12:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200629181921.3019271-1-eric@anholt.net> <20200629181921.3019271-2-eric@anholt.net>
In-Reply-To: <20200629181921.3019271-2-eric@anholt.net>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 29 Jun 2020 12:57:59 -0700
Message-ID: <CAF6AEGstctXSCwW9Hv=MmB_Ca1VGA_DZNtzvqSY-1NqPTK+WPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Quiet error during failure in optional
 resource mappings.
To:     Eric Anholt <eric@anholt.net>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 11:19 AM Eric Anholt <eric@anholt.net> wrote:
>
> We don't expect to find vbif_nrt or regdma on cheza, but were clogging
> up dmesg with errors about it.

nit: s/cheza/sdm845/ (since this really applies to the SoC rather than
the board..

also, maybe msm_ioremap_optional() ?

BR,
-R

>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 ++--
>  drivers/gpu/drm/msm/msm_drv.c           | 22 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.h           |  2 ++
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a4ab802fee6d..d9aef2b5e930 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -838,13 +838,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>                 dpu_kms->vbif[VBIF_RT] = NULL;
>                 goto error;
>         }
> -       dpu_kms->vbif[VBIF_NRT] = msm_ioremap(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
> +       dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
>         if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
>                 dpu_kms->vbif[VBIF_NRT] = NULL;
>                 DPU_DEBUG("VBIF NRT is not defined");
>         }
>
> -       dpu_kms->reg_dma = msm_ioremap(dpu_kms->pdev, "regdma", "regdma");
> +       dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma", "regdma");
>         if (IS_ERR(dpu_kms->reg_dma)) {
>                 dpu_kms->reg_dma = NULL;
>                 DPU_DEBUG("REG_DMA is not defined");
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f6ce40bf3699..df4a3c6a49cd 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -120,8 +120,8 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>         return clk;
>  }
>
> -void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
> -               const char *dbgname)
> +void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> +                          const char *dbgname, bool quiet)
>  {
>         struct resource *res;
>         unsigned long size;
> @@ -133,7 +133,8 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>                 res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>         if (!res) {
> -               DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +               if (!quiet)
> +                       DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
>                 return ERR_PTR(-EINVAL);
>         }
>
> @@ -141,7 +142,8 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>
>         ptr = devm_ioremap(&pdev->dev, res->start, size);
>         if (!ptr) {
> -               DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> +               if (!quiet)
> +                       DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
>                 return ERR_PTR(-ENOMEM);
>         }
>
> @@ -151,6 +153,18 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>         return ptr;
>  }
>
> +void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
> +                         const char *dbgname)
> +{
> +       return _msm_ioremap(pdev, name, dbgname, false);
> +}
> +
> +void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
> +                               const char *dbgname)
> +{
> +       return _msm_ioremap(pdev, name, dbgname, true);
> +}
> +
>  void msm_writel(u32 data, void __iomem *addr)
>  {
>         if (reglog)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e2d6a6056418..2687f7a42c15 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -411,6 +411,8 @@ struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
>         const char *name);
>  void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>                 const char *dbgname);
> +void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
> +               const char *dbgname);
>  void msm_writel(u32 data, void __iomem *addr);
>  u32 msm_readl(const void __iomem *addr);
>
> --
> 2.26.2
>
