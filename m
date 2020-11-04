Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932442A6B93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 18:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbgKDRYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 12:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgKDRYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 12:24:51 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B576C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 09:24:51 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id w14so22889123wrs.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 09:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2t6bsOvcaKKa8aR9J8fbfDJiM/7JPVfDs636SBMVeQg=;
        b=oqswMzax2NZZWri8s+7sGggS2Z+ar/36vEeNk36cbDsmy1CY3nBah1lCxd1L/24Kit
         +eAnPGyMvdMn2c+CZxHiSavR4e8HpFo4WUOawJOnSTGxEUltgSv/M36sKB0PIickks8o
         EqbPTlbU40dcDX5LeK7g21AnU0f0LLlOQp8hIv4yCQK6axPIarhcLoCBBQvPNUxtGH3T
         1XvlQLxcfJ8ywZof2f4IMr5RAvLFsULLg6fyyqsPoFe01tjO6aOj8j73YpSIOnLBlx4s
         EOJMxrQbQ0cr9NPxHzMs3bu+4JV+WGcYelcvhTyBCTruWVbEpvYBF0JIvhA/xsD4ivpV
         vY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2t6bsOvcaKKa8aR9J8fbfDJiM/7JPVfDs636SBMVeQg=;
        b=QwwImMixP7aqBLDMbgU4DdwnGmYSgPQD8ubyVmabHePdleQkamtgYna2TLVWEDVfQ5
         N2Qc9A8e05BRoikzd3NsbAqvReTr33nr+z06bS4LFnbrRPOyIt/4xc0D/5xkjFyzNGHI
         nGWvOOcsWPSildRe8kMGZn4mHtk/uj/GY0/ihjKmhNJQOTSz/afqtwehOZtx33DWnlm5
         5WEKLiDlYEIKLzdVvjlXDwhiTIxx7k6vcvYp6JTXCwOtv3heu8eTyTQRfuU/UgdNYLes
         3QhFrY+bB10hDbGofqL/5NjXRQTOp5pCHEbjaq7rm+mfpz6Ou+gfICTEoQ6hHGi+Lz9v
         Nsgw==
X-Gm-Message-State: AOAM533zQCzqxEMsqB8Ff/fhiZT3qwsXIr6+gZS5k2ldIMGHCIoLPgp8
        gDptk5g5pIOZF///99NWgr2ChOtNP6NwdT4wz0MU9zW6PMo=
X-Google-Smtp-Source: ABdhPJyCoTGhdf3bFvQiuuwVj6l+bkeSchp/yzLV6WBnd0fB4fTk+dADo/wtaXwoaSS9CpQtn69K1BCKxbfXS+Rrcb4=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr32281679wru.28.1604510690248;
 Wed, 04 Nov 2020 09:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20201030010101.4345-1-abhinavk@codeaurora.org> <20201030010101.4345-4-abhinavk@codeaurora.org>
In-Reply-To: <20201030010101.4345-4-abhinavk@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 4 Nov 2020 09:26:24 -0800
Message-ID: <CAF6AEGseHWb43jx0HzqL0aZSGMeijnXcv2eOi7oU9d8peAQOVA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: register the base address
 with dpu_dbg module
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>, aravindh@codeaurora.org,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 6:01 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> Register the base address of various dpu sub-modules with the
> dpu_dbg module so that it can be dumped out during error scenarios.
>
> changes in v2:
>  - Fix an issue where the same dsi client was getting registered
>    multiple times to the dpu_dbg module
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c       |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  6 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  7 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  5 +++-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  6 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  8 +++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  7 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 +++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 12 +++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  4 +++
>  drivers/gpu/drm/msm/dp/dp_display.c           |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c                 |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 15 ++++++++++-
>  drivers/gpu/drm/msm/msm_drv.c                 | 26 ++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h                 |  3 ++-
>  17 files changed, 108 insertions(+), 15 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f6fb0187388f..df505a3d53e8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -17,8 +17,8 @@
>  #include <drm/drm_prime.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_vblank.h>
> -#include "dpu_dbg.h"
>
> +#include "dpu_dbg.h"
>  #include "msm_drv.h"
>  #include "msm_debugfs.h"
>  #include "msm_fence.h"
> @@ -166,6 +166,24 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
>         return _msm_ioremap(pdev, name, dbgname, true);
>  }
>
> +unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
> +{
> +       struct resource *res;
> +
> +       if (name)
> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +       else
> +               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +       if (!res) {
> +               dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
> +                               name);
> +               return 0;
> +       }
> +
> +       return resource_size(res);
> +}
> +
>  void msm_writel(u32 data, void __iomem *addr)
>  {
>         if (reglog)
> @@ -535,6 +553,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>         if (ret)
>                 goto err_msm_uninit;
>
> +       dpu_dbg_register_drm_dev(ddev);
> +
>         drm_mode_config_reset(ddev);
>
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
> @@ -1282,6 +1302,10 @@ static int msm_pdev_probe(struct platform_device *pdev)
>         int ret;
>
>         if (get_mdp_ver(pdev)) {
> +               ret = dpu_dbg_init(&pdev->dev);
> +               if (ret)
> +                       pr_err("dpu_dbg_init failed ret = %d\n", ret);
> +
>                 ret = add_display_components(&pdev->dev, &match);
>                 if (ret)
>                         return ret;

I'm a bit skeptical about where you are registering/initializing dpu
dbg.. what happens on mdp4/mdp5 devices?

BR,
-R
