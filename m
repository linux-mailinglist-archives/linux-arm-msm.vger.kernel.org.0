Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0C43E36D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 20:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhHGSq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 14:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhHGSq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 14:46:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F825C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Aug 2021 11:46:08 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso11347687wmq.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Aug 2021 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nV3qpX+3bVp0U9kKFh0UIyBG5TJfEo7ObAFTIhI1b+Y=;
        b=rVJymXLXyuSM5JcZhyiXADyiGMZNgjIk2PYfif0GwI5ESM9nWDUtlpuesmjKnivsz8
         T2tq0OD3UrY+ph2ON+IECkAR+WOrorbP+mAass6ioWkHcqfAsAlZHeiFyzHyosA5QjO3
         3SOPqCW7eqLhMOzVL5qv4/39Tjfkpa0MdnRH9vSlJMiYUraodO/0fx/29mE/uqtjbLQ8
         Z8x6iORtFhl9j1WzR5JztMHqDAbheVjAlyVooaDFlv1YcSv7hqFvVQ4Q9wLRXOGn5k5B
         LCfFYp47vzG3qDDmDAiz4tt/4zNUhtZvFMtICCmE+bDmUGHAFudltYYhu6Q6MmuGLh3x
         d+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nV3qpX+3bVp0U9kKFh0UIyBG5TJfEo7ObAFTIhI1b+Y=;
        b=fIPLdzMpx1/fEoA3efW8sSBWKzfH0MvXHoEkOCORrcaPRo/LxHr8Yjrj8WnpOcMB3x
         q86tEQ5OfB1ZLatU2neNQRC6YtbOxAOIojDK/UQuTribz5V+nj2GwX2+mQ0B03RdWtcA
         wAnX7KCkSOZLuhNFnA5wH4zKUAFdD9tCUfHURvi+R0u6v5H4kmjabSevmecMju9ioGjK
         3Ylfy1ly+b8J/GQl7tvpEJlkXaeMcH/85qXEpYeQvlxBiEGg6we5tDqabXByQrvJSWiG
         7ja6sV+wDLDeztUGXz8NkVg3Q2IqIi938ir27rRwkTIBu2RHv0RT+rOIXS9UNaCAZqah
         Z8mg==
X-Gm-Message-State: AOAM531pIWPjxjwxb+TlfI9gQV3/Ck+s/CbfSjLp9DCtTjfHShjrlhDw
        M4vSL5N2y+U6g4e/5TmAOyVhS63JelUvoFP+cWo=
X-Google-Smtp-Source: ABdhPJz4ypAkD3i89UWZ+msJCiMFasQNjIjZq0VlXP5nCdO19LTpadkOCnE0llsFFYeSvP2v8dpemasWfdeRwPtPOzo=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr25863907wma.164.1628361967157;
 Sat, 07 Aug 2021 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210803090704.32152-1-tzimmermann@suse.de> <20210803090704.32152-8-tzimmermann@suse.de>
 <1f5f285a-b923-16ff-2ca1-6f92e22ffcab@linaro.org> <CAF6AEGu-Vj_3ex1Auae_SQvFkwgaXVokqhL_nsFzXOKP0p06SQ@mail.gmail.com>
 <9c6471b2-cd6b-d5b9-0c93-1f3e498233ee@suse.de>
In-Reply-To: <9c6471b2-cd6b-d5b9-0c93-1f3e498233ee@suse.de>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 7 Aug 2021 11:50:22 -0700
Message-ID: <CAF6AEGs4wD725pqA-tVkyrbPkpumV5DuxWc41x=cPvqi1RACiw@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] drm/msm: Convert to Linux IRQ interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Aug 7, 2021 at 11:40 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 07.08.21 um 19:08 schrieb Rob Clark:
> > On Tue, Aug 3, 2021 at 2:37 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On 03/08/2021 12:06, Thomas Zimmermann wrote:
> >>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> >>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> >>> don't benefit from using it.
> >>>
> >>> DRM IRQ callbacks are now being called directly or inlined.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Rob should probably also give his blessing on this patch though.
> >>
> >
> > I've pushed this to msm-next-staging, but if Thomas would prefer to
> > merge the series together then I can drop it (in which case a-b for
> > this patch)
>
> Yes, please. I'd prefer to merge the whole patchset at once through
> drm-misc-next.

Ok, I've dropped from msm-next-staging..  for merging via drm-msm-next:

Acked-by: Rob Clark <robdclark@chromium.org>

>
> Best regards
> Thomas
>
> >
> > BR,
> > -R
> >
> >>> ---
> >>>    drivers/gpu/drm/msm/msm_drv.c | 113 ++++++++++++++++++++----------=
----
> >>>    drivers/gpu/drm/msm/msm_kms.h |   2 +-
> >>>    2 files changed, 69 insertions(+), 46 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
> >>> index 1594ae39d54f..a332b09a5a11 100644
> >>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>> @@ -14,7 +14,6 @@
> >>>    #include <drm/drm_drv.h>
> >>>    #include <drm/drm_file.h>
> >>>    #include <drm/drm_ioctl.h>
> >>> -#include <drm/drm_irq.h>
> >>>    #include <drm/drm_prime.h>
> >>>    #include <drm/drm_of.h>
> >>>    #include <drm/drm_vblank.h>
> >>> @@ -201,6 +200,71 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 o=
r)
> >>>        msm_writel(val | or, addr);
> >>>    }
> >>>
> >>> +static irqreturn_t msm_irq(int irq, void *arg)
> >>> +{
> >>> +     struct drm_device *dev =3D arg;
> >>> +     struct msm_drm_private *priv =3D dev->dev_private;
> >>> +     struct msm_kms *kms =3D priv->kms;
> >>> +
> >>> +     BUG_ON(!kms);
> >>> +
> >>> +     return kms->funcs->irq(kms);
> >>> +}
> >>> +
> >>> +static void msm_irq_preinstall(struct drm_device *dev)
> >>> +{
> >>> +     struct msm_drm_private *priv =3D dev->dev_private;
> >>> +     struct msm_kms *kms =3D priv->kms;
> >>> +
> >>> +     BUG_ON(!kms);
> >>> +
> >>> +     kms->funcs->irq_preinstall(kms);
> >>> +}
> >>> +
> >>> +static int msm_irq_postinstall(struct drm_device *dev)
> >>> +{
> >>> +     struct msm_drm_private *priv =3D dev->dev_private;
> >>> +     struct msm_kms *kms =3D priv->kms;
> >>> +
> >>> +     BUG_ON(!kms);
> >>> +
> >>> +     if (kms->funcs->irq_postinstall)
> >>> +             return kms->funcs->irq_postinstall(kms);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int msm_irq_install(struct drm_device *dev, unsigned int irq)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     if (irq =3D=3D IRQ_NOTCONNECTED)
> >>> +             return -ENOTCONN;
> >>> +
> >>> +     msm_irq_preinstall(dev);
> >>> +
> >>> +     ret =3D request_irq(irq, msm_irq, 0, dev->driver->name, dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     ret =3D msm_irq_postinstall(dev);
> >>> +     if (ret) {
> >>> +             free_irq(irq, dev);
> >>> +             return ret;
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void msm_irq_uninstall(struct drm_device *dev)
> >>> +{
> >>> +     struct msm_drm_private *priv =3D dev->dev_private;
> >>> +     struct msm_kms *kms =3D priv->kms;
> >>> +
> >>> +     kms->funcs->irq_uninstall(kms);
> >>> +     free_irq(kms->irq, dev);
> >>> +}
> >>> +
> >>>    struct msm_vblank_work {
> >>>        struct work_struct work;
> >>>        int crtc_id;
> >>> @@ -265,7 +329,7 @@ static int msm_drm_uninit(struct device *dev)
> >>>        }
> >>>
> >>>        /* We must cancel and cleanup any pending vblank enable/disabl=
e
> >>> -      * work before drm_irq_uninstall() to avoid work re-enabling an
> >>> +      * work before msm_irq_uninstall() to avoid work re-enabling an
> >>>         * irq after uninstall has disabled it.
> >>>         */
> >>>
> >>> @@ -294,7 +358,7 @@ static int msm_drm_uninit(struct device *dev)
> >>>        drm_mode_config_cleanup(ddev);
> >>>
> >>>        pm_runtime_get_sync(dev);
> >>> -     drm_irq_uninstall(ddev);
> >>> +     msm_irq_uninstall(ddev);
> >>>        pm_runtime_put_sync(dev);
> >>>
> >>>        if (kms && kms->funcs)
> >>> @@ -553,7 +617,7 @@ static int msm_drm_init(struct device *dev, const=
 struct drm_driver *drv)
> >>>
> >>>        if (kms) {
> >>>                pm_runtime_get_sync(dev);
> >>> -             ret =3D drm_irq_install(ddev, kms->irq);
> >>> +             ret =3D msm_irq_install(ddev, kms->irq);
> >>>                pm_runtime_put_sync(dev);
> >>>                if (ret < 0) {
> >>>                        DRM_DEV_ERROR(dev, "failed to install IRQ hand=
ler\n");
> >>> @@ -662,43 +726,6 @@ static void msm_postclose(struct drm_device *dev=
, struct drm_file *file)
> >>>        context_close(ctx);
> >>>    }
> >>>
> >>> -static irqreturn_t msm_irq(int irq, void *arg)
> >>> -{
> >>> -     struct drm_device *dev =3D arg;
> >>> -     struct msm_drm_private *priv =3D dev->dev_private;
> >>> -     struct msm_kms *kms =3D priv->kms;
> >>> -     BUG_ON(!kms);
> >>> -     return kms->funcs->irq(kms);
> >>> -}
> >>> -
> >>> -static void msm_irq_preinstall(struct drm_device *dev)
> >>> -{
> >>> -     struct msm_drm_private *priv =3D dev->dev_private;
> >>> -     struct msm_kms *kms =3D priv->kms;
> >>> -     BUG_ON(!kms);
> >>> -     kms->funcs->irq_preinstall(kms);
> >>> -}
> >>> -
> >>> -static int msm_irq_postinstall(struct drm_device *dev)
> >>> -{
> >>> -     struct msm_drm_private *priv =3D dev->dev_private;
> >>> -     struct msm_kms *kms =3D priv->kms;
> >>> -     BUG_ON(!kms);
> >>> -
> >>> -     if (kms->funcs->irq_postinstall)
> >>> -             return kms->funcs->irq_postinstall(kms);
> >>> -
> >>> -     return 0;
> >>> -}
> >>> -
> >>> -static void msm_irq_uninstall(struct drm_device *dev)
> >>> -{
> >>> -     struct msm_drm_private *priv =3D dev->dev_private;
> >>> -     struct msm_kms *kms =3D priv->kms;
> >>> -     BUG_ON(!kms);
> >>> -     kms->funcs->irq_uninstall(kms);
> >>> -}
> >>> -
> >>>    int msm_crtc_enable_vblank(struct drm_crtc *crtc)
> >>>    {
> >>>        struct drm_device *dev =3D crtc->dev;
> >>> @@ -1051,10 +1078,6 @@ static const struct drm_driver msm_driver =3D =
{
> >>>        .open               =3D msm_open,
> >>>        .postclose           =3D msm_postclose,
> >>>        .lastclose          =3D drm_fb_helper_lastclose,
> >>> -     .irq_handler        =3D msm_irq,
> >>> -     .irq_preinstall     =3D msm_irq_preinstall,
> >>> -     .irq_postinstall    =3D msm_irq_postinstall,
> >>> -     .irq_uninstall      =3D msm_irq_uninstall,
> >>>        .dumb_create        =3D msm_gem_dumb_create,
> >>>        .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> >>>        .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_=
kms.h
> >>> index 086a2d59b8c8..9de7c42e1071 100644
> >>> --- a/drivers/gpu/drm/msm/msm_kms.h
> >>> +++ b/drivers/gpu/drm/msm/msm_kms.h
> >>> @@ -150,7 +150,7 @@ struct msm_kms {
> >>>        const struct msm_kms_funcs *funcs;
> >>>        struct drm_device *dev;
> >>>
> >>> -     /* irq number to be passed on to drm_irq_install */
> >>> +     /* irq number to be passed on to msm_irq_install */
> >>>        int irq;
> >>>
> >>>        /* mapper-id used to request GEM buffer mapped for scanout: */
> >>>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
