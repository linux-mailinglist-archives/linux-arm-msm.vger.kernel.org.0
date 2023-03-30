Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFDE6D00A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 12:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjC3KFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 06:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjC3KFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 06:05:41 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C157DB2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 03:05:30 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id n125so22733465ybg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680170729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WgoKuCIBwgckhU5BejJJvSWb2GJbmr7RiOOAd94YUdI=;
        b=ag1ZcK0+OFBcxgjI+fRJFjlY/GQ96iAeX/H8l3sgMulu4IkZjsFGuCjMItmFk0bnuT
         dRP2YrCnbGrvI3a2iS0900ToZZ2DZZH40LZGQIvUqI1WRBDT19EyiGu/Pcv9ZMeDzUS9
         37x5rght4u+Fmc/wzsF05sSMndMFL1qDPKZ6kfmOEvGvCmh3GB/ogemvpEvv/ca+1Wif
         2lva36DCMhHqFfxRwaNqLp/OMr9VUfQvbzI1fTi+x8VwMZ/ZWctUmADBPTPBM78qW6Uu
         Ki549T8+Ny2y5iBEB2kZ1F9WCYuRtBXLHh27LPLhE+X5D9ylcFl5KJGVsVLmh2bmOM8h
         0JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgoKuCIBwgckhU5BejJJvSWb2GJbmr7RiOOAd94YUdI=;
        b=Jv8sSgbyE5dS/PSv9PdK/cNe4r8RbrSJWDhsaOLtliSrCE9YxLYd0n9wH2yQtwgBkW
         SNO+ARTBMzO+bvnujA/SEES0aeyIb9cvr73ShwOiTuS/jiq19fpVNFLbpaDwwkaD6IJr
         A9mHFCcESRf1Ot957JGv19IOZI2kASVnm3njbpD0P/Orw+bvntmJzxFtXUzjZpnE1WSQ
         kOZrITTy4enmdkdglDxd+Y6tHVizHJCsyYUbPobyGgznm9k6HfeAJFFLlVpUJlwqTuD6
         XM0m6PtymLlMsAz+4sh5muAKd3i0yj08WL+lwAcA4kGAbm8vpFzae+phVBf3TsvzJA9g
         HXgA==
X-Gm-Message-State: AAQBX9ccfM/KZm+TywabEzKyz8PBYG3jO9guvFO3gc09vWHW3NvwI6Kc
        jcLtXH8mrYn1oNeOsMO+4tiJrRYz0jkp1CkyuSB72g==
X-Google-Smtp-Source: AKy350ZipAZcOkTjtM8Tf0YDGNmJgPaAsrxIL1oh8fvqdo2Gaqh00PpDJqjToaaRqtiHvVoYDF6PBqnJqmYASCGNMLk=
X-Received: by 2002:a05:6902:1549:b0:b77:be38:6406 with SMTP id
 r9-20020a056902154900b00b77be386406mr11733804ybu.9.1680170729341; Thu, 30 Mar
 2023 03:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de> <20230330074150.7637-6-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-6-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 13:05:18 +0300
Message-ID: <CAA8EJpookZF4nQjYtZjaK8FcF1iy7EJrj18UNOjhyfGDuOoBag@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm: Initialize fbdev DRM client
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
> Initialize the fbdev client in the fbdev code with empty helper
> functions. Also clean up the client. The helpers will later
> implement various functionality of the DRM client. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 38 +++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)

With the nit below fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 95b193a5e0d5..6c3665c5f4f6 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -119,6 +119,30 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>         .fb_probe = msm_fbdev_create,
>  };
>
> +/*
> + * struct drm_client
> + */
> +
> +static void msm_fbdev_client_unregister(struct drm_client_dev *client)
> +{ }
> +
> +static int msm_fbdev_client_restore(struct drm_client_dev *client)
> +{
> +       return 0;
> +}
> +
> +static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
> +{
> +       return 0;
> +}
> +
> +static const struct drm_client_funcs msm_fbdev_client_funcs = {
> +       .owner          = THIS_MODULE,
> +       .unregister     = msm_fbdev_client_unregister,
> +       .restore        = msm_fbdev_client_restore,
> +       .hotplug        = msm_fbdev_client_hotplug,
> +};
> +
>  /* initialize fbdev helper */
>  struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>  {
> @@ -131,10 +155,16 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>
>         drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
>
> +       ret = drm_client_init(dev, &helper->client, "fbdev", &msm_fbdev_client_funcs);
> +       if (ret) {
> +               drm_err(dev, "Failed to register client: %d\n", ret);
> +               goto err_drm_fb_helper_unprepare;
> +       }
> +
>         ret = drm_fb_helper_init(dev, helper);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
> -               goto fail;
> +               goto err_drm_client_release;
>         }
>
>         ret = drm_fb_helper_initial_config(helper);
> @@ -145,8 +175,11 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>
>  fini:
>         drm_fb_helper_fini(helper);
> -fail:
> +err_drm_client_release:
> +       drm_client_release(&helper->client);
> +err_drm_fb_helper_unprepare:
>         drm_fb_helper_unprepare(helper);
> +       kfree(helper);

This one should go to the patch 3

>         return NULL;
>  }
>
> @@ -168,6 +201,7 @@ void msm_fbdev_free(struct drm_device *dev)
>                 drm_framebuffer_remove(fb);
>         }
>
> +       drm_client_release(&helper->client);
>         drm_fb_helper_unprepare(helper);
>         kfree(helper);
>
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
