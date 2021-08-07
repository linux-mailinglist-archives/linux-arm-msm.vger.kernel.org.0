Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5FB3E366C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 19:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhHGREL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 13:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhHGREH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 13:04:07 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39BFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Aug 2021 10:03:48 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m36-20020a05600c3b24b02902e67543e17aso826822wms.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Aug 2021 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EY9y4ON0juXKYfLznttxYDzTld1gp3deUpzOVk7N+oU=;
        b=glpbTCGOyPbkGlJ5keLSaT+80VA+kIklrOEcnd7C4HX2im1CZRCKnLnnmO4eO93/2I
         51oEkZx5ZQrbH9tHDCvtKsSvBiGweOZn5I0r5NpPzDlQc1KhM2t9p0VAVk92CR02pJ1+
         ekeCHRpIIEkato3O5j+8EOQaMv1ngJGMu1KV9A9Pa0Q34gGlcLPyTsu1Fylt85rQEXGp
         nzZSyrNmNGtaPLIvoZuuhjjsTm3sswDuhxPP3ekSXbtq8M/D21XNozGbgvdMVHe4ZScS
         ADlqmpBYMytkW9gZ1K/+yZlO6A+v0QKL5HqLaVc3rDKXf9kp8+WX3XxMqMkumHSMl8SS
         HqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EY9y4ON0juXKYfLznttxYDzTld1gp3deUpzOVk7N+oU=;
        b=oKNM2+FiUZFnyWojOaTZKI3/D29hLBrjrwXa7l+Gn5f8Ixrlz8cQNbLk1jP3XYfnBf
         FBH07CqV3mzCtn/zT4eAfbm9FmsLeJ0JemMLQaacBNb6s7XxcP0wGJhJj86bpkVP6OYs
         B3+Q1+DXJddNmXMKUUbez3maraCJA9hQ2iDYuMkEBaNLdGXCUDvXiFbyqn/4I4qNqm9K
         VwYZMJ57C8+cExsrYjjdyClLTl9YxGApDfqW/OmJWbIuMdGm3b2ODP1ijg0m0qG68h+q
         yas4u4PT9R8Tuv7aCYxL8jjj+xkPqz8yQ40b16JQw0jotvVALh4oCV2xTuIYN+XhyeaG
         R2NQ==
X-Gm-Message-State: AOAM530qmyFpkfZgMtepPiyh291pCv+an/uM0/0Cb7+ho78QRW5+c2b/
        4jrMKIf0uk3VjYpTx49xgltrJCv8pGSvzmgt2mE=
X-Google-Smtp-Source: ABdhPJzxUQgXEhZKiVPSljDBCuN8hvEk14E1C9HBZE8++O0L0mZVtCGLPLKhOz6j6UVg+bmnp4jG1hHHA5nPQPsChQU=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr25606015wma.164.1628355827296;
 Sat, 07 Aug 2021 10:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210803090704.32152-1-tzimmermann@suse.de> <20210803090704.32152-8-tzimmermann@suse.de>
 <1f5f285a-b923-16ff-2ca1-6f92e22ffcab@linaro.org>
In-Reply-To: <1f5f285a-b923-16ff-2ca1-6f92e22ffcab@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 7 Aug 2021 10:08:02 -0700
Message-ID: <CAF6AEGu-Vj_3ex1Auae_SQvFkwgaXVokqhL_nsFzXOKP0p06SQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] drm/msm: Convert to Linux IRQ interfaces
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Alexander Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stefan Agner <stefan@agner.ch>, alison.wang@nxp.com,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        anitha.chrisanthus@intel.com, edmund.j.dea@intel.com,
        Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>, jyri.sarha@iki.fi,
        tomba@kernel.org, Dan.Sneddon@microchip.com,
        tomi.valkeinen@ideasonboard.com,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 3, 2021 at 2:37 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2021 12:06, Thomas Zimmermann wrote:
> > Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> > IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> > don't benefit from using it.
> >
> > DRM IRQ callbacks are now being called directly or inlined.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Rob should probably also give his blessing on this patch though.
>

I've pushed this to msm-next-staging, but if Thomas would prefer to
merge the series together then I can drop it (in which case a-b for
this patch)

BR,
-R

> > ---
> >   drivers/gpu/drm/msm/msm_drv.c | 113 ++++++++++++++++++++--------------
> >   drivers/gpu/drm/msm/msm_kms.h |   2 +-
> >   2 files changed, 69 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 1594ae39d54f..a332b09a5a11 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -14,7 +14,6 @@
> >   #include <drm/drm_drv.h>
> >   #include <drm/drm_file.h>
> >   #include <drm/drm_ioctl.h>
> > -#include <drm/drm_irq.h>
> >   #include <drm/drm_prime.h>
> >   #include <drm/drm_of.h>
> >   #include <drm/drm_vblank.h>
> > @@ -201,6 +200,71 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 or)
> >       msm_writel(val | or, addr);
> >   }
> >
> > +static irqreturn_t msm_irq(int irq, void *arg)
> > +{
> > +     struct drm_device *dev = arg;
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct msm_kms *kms = priv->kms;
> > +
> > +     BUG_ON(!kms);
> > +
> > +     return kms->funcs->irq(kms);
> > +}
> > +
> > +static void msm_irq_preinstall(struct drm_device *dev)
> > +{
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct msm_kms *kms = priv->kms;
> > +
> > +     BUG_ON(!kms);
> > +
> > +     kms->funcs->irq_preinstall(kms);
> > +}
> > +
> > +static int msm_irq_postinstall(struct drm_device *dev)
> > +{
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct msm_kms *kms = priv->kms;
> > +
> > +     BUG_ON(!kms);
> > +
> > +     if (kms->funcs->irq_postinstall)
> > +             return kms->funcs->irq_postinstall(kms);
> > +
> > +     return 0;
> > +}
> > +
> > +static int msm_irq_install(struct drm_device *dev, unsigned int irq)
> > +{
> > +     int ret;
> > +
> > +     if (irq == IRQ_NOTCONNECTED)
> > +             return -ENOTCONN;
> > +
> > +     msm_irq_preinstall(dev);
> > +
> > +     ret = request_irq(irq, msm_irq, 0, dev->driver->name, dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = msm_irq_postinstall(dev);
> > +     if (ret) {
> > +             free_irq(irq, dev);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void msm_irq_uninstall(struct drm_device *dev)
> > +{
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct msm_kms *kms = priv->kms;
> > +
> > +     kms->funcs->irq_uninstall(kms);
> > +     free_irq(kms->irq, dev);
> > +}
> > +
> >   struct msm_vblank_work {
> >       struct work_struct work;
> >       int crtc_id;
> > @@ -265,7 +329,7 @@ static int msm_drm_uninit(struct device *dev)
> >       }
> >
> >       /* We must cancel and cleanup any pending vblank enable/disable
> > -      * work before drm_irq_uninstall() to avoid work re-enabling an
> > +      * work before msm_irq_uninstall() to avoid work re-enabling an
> >        * irq after uninstall has disabled it.
> >        */
> >
> > @@ -294,7 +358,7 @@ static int msm_drm_uninit(struct device *dev)
> >       drm_mode_config_cleanup(ddev);
> >
> >       pm_runtime_get_sync(dev);
> > -     drm_irq_uninstall(ddev);
> > +     msm_irq_uninstall(ddev);
> >       pm_runtime_put_sync(dev);
> >
> >       if (kms && kms->funcs)
> > @@ -553,7 +617,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
> >
> >       if (kms) {
> >               pm_runtime_get_sync(dev);
> > -             ret = drm_irq_install(ddev, kms->irq);
> > +             ret = msm_irq_install(ddev, kms->irq);
> >               pm_runtime_put_sync(dev);
> >               if (ret < 0) {
> >                       DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
> > @@ -662,43 +726,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
> >       context_close(ctx);
> >   }
> >
> > -static irqreturn_t msm_irq(int irq, void *arg)
> > -{
> > -     struct drm_device *dev = arg;
> > -     struct msm_drm_private *priv = dev->dev_private;
> > -     struct msm_kms *kms = priv->kms;
> > -     BUG_ON(!kms);
> > -     return kms->funcs->irq(kms);
> > -}
> > -
> > -static void msm_irq_preinstall(struct drm_device *dev)
> > -{
> > -     struct msm_drm_private *priv = dev->dev_private;
> > -     struct msm_kms *kms = priv->kms;
> > -     BUG_ON(!kms);
> > -     kms->funcs->irq_preinstall(kms);
> > -}
> > -
> > -static int msm_irq_postinstall(struct drm_device *dev)
> > -{
> > -     struct msm_drm_private *priv = dev->dev_private;
> > -     struct msm_kms *kms = priv->kms;
> > -     BUG_ON(!kms);
> > -
> > -     if (kms->funcs->irq_postinstall)
> > -             return kms->funcs->irq_postinstall(kms);
> > -
> > -     return 0;
> > -}
> > -
> > -static void msm_irq_uninstall(struct drm_device *dev)
> > -{
> > -     struct msm_drm_private *priv = dev->dev_private;
> > -     struct msm_kms *kms = priv->kms;
> > -     BUG_ON(!kms);
> > -     kms->funcs->irq_uninstall(kms);
> > -}
> > -
> >   int msm_crtc_enable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev = crtc->dev;
> > @@ -1051,10 +1078,6 @@ static const struct drm_driver msm_driver = {
> >       .open               = msm_open,
> >       .postclose           = msm_postclose,
> >       .lastclose          = drm_fb_helper_lastclose,
> > -     .irq_handler        = msm_irq,
> > -     .irq_preinstall     = msm_irq_preinstall,
> > -     .irq_postinstall    = msm_irq_postinstall,
> > -     .irq_uninstall      = msm_irq_uninstall,
> >       .dumb_create        = msm_gem_dumb_create,
> >       .dumb_map_offset    = msm_gem_dumb_map_offset,
> >       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 086a2d59b8c8..9de7c42e1071 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -150,7 +150,7 @@ struct msm_kms {
> >       const struct msm_kms_funcs *funcs;
> >       struct drm_device *dev;
> >
> > -     /* irq number to be passed on to drm_irq_install */
> > +     /* irq number to be passed on to msm_irq_install */
> >       int irq;
> >
> >       /* mapper-id used to request GEM buffer mapped for scanout: */
> >
>
>
> --
> With best wishes
> Dmitry
