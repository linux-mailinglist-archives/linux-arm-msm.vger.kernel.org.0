Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 925B9187035
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 17:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732074AbgCPQiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 12:38:14 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40592 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732044AbgCPQiO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 12:38:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id a24so22803296edy.7;
        Mon, 16 Mar 2020 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HuM304MO1/ZB/qBf9QvuGFLVkiNetb4DHuULLR29UtE=;
        b=O1R/Tuy99Uc2SMTzuIKISJ/DTcWfVOeEI4FdK6RqhILSd5TF1DjAYyJgFm8/AhUesc
         +I8ejSy7gf7oG7/kjM5XSFMzBCGPX8sGlqjMQSSimZvPCzGsrh826EV7pnsqovO8nJjE
         0zolCX1BriW0+9ibBo5cxyHBD4XOGikQ1+N+FTBmzE6ULxFWxYMiC5X5jwDMbdfarO6O
         4nrp8L6yZP8Mr9hk1Y14ItydygAWMpfi5jKq9N7EhNjDFQtrdS/tKsybGrUfZLRKDUrm
         9j2lrjbcEoXOofU5uEm3K11cNJHAjdgs2vekaP8GXw09xV+kZW/ILzeh5WVYthIVi5s3
         Ct4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HuM304MO1/ZB/qBf9QvuGFLVkiNetb4DHuULLR29UtE=;
        b=Gvv5gacJGllH8PX63iT2Zl0nad/VW9XlJvP0rJj2qzb9tGK75taoksAyhmj4n2hsfn
         2T1KistWCktfhsD/DSWgLBOzyw8CX+xBbKrMQcHy5EVD4IAKF/Fj7mCJLi0Jjj9ZQ+S9
         f6zwhKHu8ay/xzbRyGgpd2WTtrNpbnC5zUF7Z65KH3X3GA4QhKBerXI0M20yAzAP2J3u
         0zu7ZId8bu7jrXd6I8/ycftMKEyk7AFRl/3RjSSzKCagAxMGanuMbtM2dUF0vnuEDmHb
         Qrrq6H0jUWWObgUjFdhWX2g2WH5nq6wHhfupRuXafRuBVgfVZRrhHlPhisKNnNPeHuBW
         KKwA==
X-Gm-Message-State: ANhLgQ09nDq0VmnDXzKe4NCYgfZDTPvxMhk5l6gpVTFye3mNbm3IGyKR
        TXupkAc0LbeTMRMwMcMxo6K3OZFhyiDx193oxAs=
X-Google-Smtp-Source: ADFU+vuMUSlm+j3u+hl4D2E/jIJ+Wy5ofrMVRGh+JieievTTKXTXv7iYStChy+cpuggq64vtIfoppJmk8TZPRcQoWhU=
X-Received: by 2002:a17:906:b888:: with SMTP id hb8mr115808ejb.166.1584376691503;
 Mon, 16 Mar 2020 09:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1584356720-24411-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584356720-24411-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Mar 2020 09:38:01 -0700
Message-ID: <CAF6AEGtKZUODb0gNdx7qdyzKMFnqvRYVbB--1owOsS=chcGgoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        travitej@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 16, 2020 at 4:05 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 41 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi.c           |  7 ++++++
>  drivers/gpu/drm/msm/msm_drv.c           | 14 +++++++++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  4 files changed, 64 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index cb08faf..6e103d5 100644
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
> @@ -250,6 +251,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct drm_device *dev;
> +       struct msm_drm_private *priv;
> +       struct dpu_kms *dpu_kms;
> +       int i = 0;
> +       struct msm_dsi *dsi;
> +
> +       dpu_kms = to_dpu_kms(kms);
> +       dev = dpu_kms->dev;
> +       if (!dev) {
> +               DPU_ERROR("invalid device\n");
> +               return;
> +       }
> +
> +       priv = dev->dev_private;
> +       if (!priv) {
> +               DPU_ERROR("invalid private data\n");
> +               return;
> +       }

the !dev and !priv checks can be dropped.. these aren't things a user
should hit, and if I screw somethign up in development and hit that
case, I'd rather see a stack trace

otherwise, I think it looks reasonable

BR,
-R

> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +}
> +
>  static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
>  {
>         struct drm_encoder *encoder;
> @@ -683,6 +715,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init    = dpu_kms_debugfs_init,
>  #endif
> +       .disable_dpu = _dpu_kms_disable_dpu,
>  };
>
>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
> @@ -1053,7 +1086,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>         return rc;
>  }
>
> +
> +static int __maybe_unused dpu_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  static const struct dev_pm_ops dpu_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(dpu_pm_suspend_late, NULL)
>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 55ea4bc2..3d3740e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -154,12 +154,19 @@ static int dsi_dev_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int __maybe_unused dsi_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,mdss-dsi-ctrl" },
>         {}
>  };
>
>  static const struct dev_pm_ops dsi_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(dsi_pm_suspend_late, NULL)
>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e4b750b..12ec1c6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1038,6 +1038,7 @@ static int msm_pm_suspend(struct device *dev)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct msm_drm_private *priv = ddev->dev_private;
> +       struct msm_kms *kms = priv->kms;
>
>         if (WARN_ON(priv->pm_state))
>                 drm_atomic_state_put(priv->pm_state);
> @@ -1049,6 +1050,11 @@ static int msm_pm_suspend(struct device *dev)
>                 return ret;
>         }
>
> +       if (kms->funcs->disable_dpu)
> +               kms->funcs->disable_dpu(kms);
> +
> +       pm_runtime_put_sync(dev);
> +
>         return 0;
>  }
>
> @@ -1067,6 +1073,13 @@ static int msm_pm_resume(struct device *dev)
>
>         return ret;
>  }
> +
> +static int msm_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  #endif
>
>  #ifdef CONFIG_PM
> @@ -1100,6 +1113,7 @@ static int msm_runtime_resume(struct device *dev)
>  #endif
>
>  static const struct dev_pm_ops msm_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend_late, NULL)
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
>  };
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1cbef6b..c73a89b 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -126,6 +126,8 @@ struct msm_kms_funcs {
>         /* debugfs: */
>         int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
>  #endif
> +       void (*disable_dpu)(struct msm_kms *kms);
> +
>  };
>
>  struct msm_kms;
> --
> 1.9.1
>
