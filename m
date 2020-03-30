Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC571983C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 20:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgC3Szn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 14:55:43 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:37537 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbgC3Szm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 14:55:42 -0400
Received: by mail-vk1-f193.google.com with SMTP id o124so5004460vkc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
        b=PF9JCctEmZbycQHUREYCFpB93WZDn96lnP3Obqh6+qo2li0m+PomDclPw436h+k5nE
         HPlEJnAMbHLsbEzWSUiQzAE/czvmUKvzYnBU/0y75CHLnzbcOLHIgDqMclZpnP93bXel
         +PqZr9hZkasdPSR3g/8xLCfssCG0GE51W/VMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
        b=LxJ8dbEGFiNT9dn+dq7hmmcPUSzK7YiYGr2Ydnc/rlRjueD+jHO03MNZdd/pu+v+t0
         CrVrlH+NyX/ilVmZYobXhm43PKD13gXKgMdA7bD2BLIiC3GhztIvRUUtewv6TRndwOUa
         xOfhlscZAr1BOCXNjCuiEz8w49k589A7/vB1R3Y/O5Jik4ZsnLolYBwIqpaTurPpLv+Y
         LjVwS7HRO3tcxeqPybKNHsMnhGyM1i2uRrn0UmK1/eYgPHT5TYwknA3jk0ZGfgzScE7c
         z6NCOfQyOGrJWkpXC0CwPFVAE1efDgrm5TInKzWozoQ5aKGCI3Xo7we+aADqoSqtA7gi
         +7gQ==
X-Gm-Message-State: AGi0Pua0RZQ8N/0wU+kBXKTaoyckN2zjN4rGvfqozNnrAfysoxxELsEQ
        hIXEr9GBovivLdUFQ2jFCCJnqDe7dn0=
X-Google-Smtp-Source: APiQypIAC0xiB3NzYKFiaTnxjior03qP749pSQpoSjMRLRpzm/xo3iVKHUYpxRnzlEFrDQEZJ2Y5gA==
X-Received: by 2002:a1f:91c6:: with SMTP id t189mr8888508vkd.62.1585594538986;
        Mon, 30 Mar 2020 11:55:38 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id s190sm5839003vks.34.2020.03.30.11.55.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id a63so11768764vsa.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
X-Received: by 2002:a67:2c81:: with SMTP id s123mr9594577vss.198.1585594536858;
 Mon, 30 Mar 2020 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Mar 2020 11:55:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 30, 2020 at 2:04 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>    _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c           |  4 ++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  3 files changed, 39 insertions(+)

I am still 100% baffled by your patch and I never did quite understand
your response to my previous comments [1].  I think you're saying that
the problem you were facing is that if you call "suspend" but never
called "runtime_suspend" that the device stays active.  Is that right?
 If that's true, did you try something like this suggestion I made?

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..2343cbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -26,6 +26,7 @@
>  #include "dpu_encoder.h"
>  #include "dpu_plane.h"
>  #include "dpu_crtc.h"
> +#include "dsi.h"
>
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
> @@ -325,6 +326,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       struct drm_device *dev = dpu_kms->dev;
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_dsi *dsi;
> +       int i;
> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +       pm_runtime_put_sync(dev->dev);
> +
> +       /* Increment the usagecount without triggering a resume */
> +       pm_runtime_get_noresume(dev->dev);
> +
> +       pm_runtime_get_noresume(&dpu_kms->pdev->dev);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_get_noresume(&dsi->pdev->dev);
> +       }
> +}

My pm_runtime knowledge is pretty weak sometimes, but the above
function looks crazy.  Maybe it's just me not understanding, but can
you please summarize what you're trying to accomplish?

-Doug

[1] https://lore.kernel.org/r/114130f68c494f83303c51157e2c5bfa@codeaurora.org
