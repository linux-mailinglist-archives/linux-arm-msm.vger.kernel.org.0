Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8890C6D0033
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 11:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjC3Jww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 05:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjC3Jw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 05:52:29 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C839015
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:51:23 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id b18so22732862ybp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680169882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UIbgOG+h3FIDF+Si9VD6Zwd1DkLvZs1s8HyCvFhZ9EY=;
        b=sIvdOknzxUYNAk4I6ea88QdgCUOqrLOBhfsopoNo72TjQSvr62pPA+qFgOBmBObhNQ
         1PiYmezYMMSy99UdDOt97wrNif94MO7BrEasdZG2OHRAFpAP12BH5FHEWNMRaohrN8pc
         3HpOqKEZsvG5TQA3EPMzKRABDsaCCdTO9c6HW17ugwV+mtVUImMPwRaTOsqHyATjya0O
         kXdSx5dPodiZUqDOJuJ9RCTjVxCvdI2Oc8o18aBY2k7CFfdPPBW+uQqMkQ2pz5M0FU/k
         bBX08oiVk2fSckkrwPhgQ7xLxSA1/5FxbxWlCwMWM9F3IA6pACWWb8eMBRUMXt/XAEOz
         WXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIbgOG+h3FIDF+Si9VD6Zwd1DkLvZs1s8HyCvFhZ9EY=;
        b=gEutlVpX8daFo/fAMsM7u6liGPkBqRav+Irf4yjVWHTAccU0maWC7AEqf8CmcW3OfG
         tXp1oM3NTLF59P0GBSkFudfUxifSBolH4GDalUcQ473z3vu3a81QdJ5r5vvl7meYkxio
         AcKuEtW+yqI4T0IYXJ6XyP+OtrDX8MytIdSkNFgMH2BZYwJgKmHUUkwfwauu1UJfb8J0
         oxZIw1Kqv1WtR02e0ueIm071W+ln6BcubV5a92YeoRvyravgo0KY9UtLuO9qwXTTAY8q
         De8ot7hyLx11G61QpanKVGhLHoznmC4auy7O2J6sQvTXFaBW3eH6n5Rwkgg1hk5nGv3/
         l+eg==
X-Gm-Message-State: AAQBX9dkrAnp/SHARy4Sa91hR4z///dogqGCvX4ReKzRVk2D03FyKfEK
        ls4Be4c0zW9nVVQSDkRdSAaRXWFrYcYJ2VPZEP+pVA==
X-Google-Smtp-Source: AKy350aaiOzzm2r5w48FBnQYN8mcYV/XBLAtomsqXCbKsIiygpKHaym8tbpgh+vg7oUtg7IBqovmwJMlURVoqAEzW0A=
X-Received: by 2002:a05:6902:102b:b0:b46:4a5e:3651 with SMTP id
 x11-20020a056902102b00b00b464a5e3651mr14647883ybt.9.1680169882207; Thu, 30
 Mar 2023 02:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de> <20230330074150.7637-2-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-2-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:51:11 +0300
Message-ID: <CAA8EJpov+D5VjWWKWCEjp_C1Rt2B6=2j8rBc8JUPtjEcYYRzYQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm: Clear aperture ownership outside of fbdev code
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move aperture management out of the fbdev code. It is unrelated
> and needs to run even if fbdev support has been disabled. Call
> the helper at the top of msm_drm_init() to take over hardware
> from other drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
>  drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index aca48c868c14..5211140ec50b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -12,6 +12,7 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/sched/types.h>
>
> +#include <drm/drm_aperture.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -411,6 +412,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         if (drm_firmware_drivers_only())
>                 return -ENODEV;
>
> +       /* the fw fb could be anywhere in memory */
> +       ret = drm_aperture_remove_framebuffers(false, drv);
> +       if (ret)
> +               return ret;
> +

I think it is not a good place to remove framebuffers. EFIFB might be
still alive and if we kick it out, it might be very hard to debug what
went wrong.
Could you please move it after component bind? Then we can be sure at
least that all subdevices are bound. I see that armada and sun4i call
it as late as possible, when no calls can fail.

>         ddev = drm_dev_alloc(drv, dev);
>         if (IS_ERR(ddev)) {
>                 DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index d26aa52217ce..fc7d0406a9f9 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -4,7 +4,6 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> -#include <drm/drm_aperture.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> @@ -154,11 +153,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>                 goto fail;
>         }
>
> -       /* the fw fb could be anywhere in memory */
> -       ret = drm_aperture_remove_framebuffers(false, dev->driver);
> -       if (ret)
> -               goto fini;
> -
>         ret = drm_fb_helper_initial_config(helper);
>         if (ret)
>                 goto fini;
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
