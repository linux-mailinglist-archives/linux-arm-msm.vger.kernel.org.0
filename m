Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3996D0058
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 11:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjC3J6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 05:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjC3J6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 05:58:12 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF95C6582
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:58:10 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id r187so22736852ybr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680170290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lM1clLMyFkv8RnfmeF0BvNOKffXMAeEtVBe3ANIN4rM=;
        b=B1SyhkzVdWGwXx5MQnwXKgJUgmsgRElhiJ/ccK5nN7O55gclBTHvjJWMbYZTrgXuY/
         XVrrY8RAOzgU33TFT+PaPJeCl9WJqhucaHVvj74vo3DjyyiaXkTudXmw+Qsc8Sd2/0hT
         VxybRcBl29YhCkdjWKPhJCkO9u3kiy3HTRzjfGmzPuoXeTAE1HOb4r4ovsXyfygfqrfw
         4d1xFf5XLXHNF17GJZE1zohRW7j6r3/fmXtzvj6VwbuPw7GldOJ74qLEQ5hn3GKDHiqw
         av3ejpM/gGs+58O37qRqnTnCRetC5oGklJR6g0D5CqTP1TaX6KKH7MPHu9scLSxpfg8T
         DqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM1clLMyFkv8RnfmeF0BvNOKffXMAeEtVBe3ANIN4rM=;
        b=lFrj03port6KjeTpZEAj7rVPrXnOd9LmcfhWanNev+86haEKqWaKV6vEfxdWGqMGOC
         i7bkHRNqu5cdya3T7i+ZLGpWmi0DT37/tCUWavrjZLamcvno/JJFfd4uLMNAAD06wAhL
         sF6VWtetNdmKquKKrKSi7fMVjNmKh+FjPq9PfBpBkvVqyC7RYonkKb4hzeOAl6LUz27w
         4+V6nmZ0fPEgcdsPNVtap09KFptULlPHC4EH2N1kV6t+VMh1t2n0sp8xYydH6gOVbM7X
         XkLSQQnK3QuNsOqp40xcHOkcRx506crjZYoqFQiEutuORLN2lUpUi6ps3JyLv0rRUbqS
         hZRA==
X-Gm-Message-State: AAQBX9f44YC85J6c9GpAwUJPEMOV9DkMwCqjJ4yksYHC2s7XMIwmENVZ
        DUyph26sR1I9lyffHPUGzB0DjTx7G//2ZpcLZeaKsQ==
X-Google-Smtp-Source: AKy350ZvlWGvCwpr4//KI4810BMNOvHxy1rAcxCPE12M/gjQgM0PKbZ9M+wilo3JKUUgVMPf3zydkfCeJP2rPtarqxo=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr15577834ybu.9.1680170289973; Thu, 30 Mar
 2023 02:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de> <20230330074150.7637-4-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-4-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:57:59 +0300
Message-ID: <CAA8EJpqa+simnPi6w-hj4J5AJaWajRUvKS=azVvi2OA1tG_zoA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm: Remove struct msm_fbdev
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
> Remove struct msm_fbdev, which is an empty wrapper around struct
> drm_fb_helper. Use the latter directly. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 323a79d9ef83..0985486d194b 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -18,12 +18,6 @@
>   * fbdev funcs, to implement legacy fbdev interface on top of drm driver
>   */
>
> -#define to_msm_fbdev(x) container_of(x, struct msm_fbdev, base)
> -
> -struct msm_fbdev {
> -       struct drm_fb_helper base;
> -};
> -
>  static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  {
>         struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
> @@ -129,16 +123,13 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>  struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
> -       struct msm_fbdev *fbdev;
>         struct drm_fb_helper *helper;
>         int ret;
>
> -       fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
> -       if (!fbdev)
> +       helper = kzalloc(sizeof(*helper), GFP_KERNEL);
> +       if (!helper)
>                 return NULL;
>
> -       helper = &fbdev->base;
> -
>         drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
>
>         ret = drm_fb_helper_init(dev, helper);
> @@ -159,7 +150,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>         drm_fb_helper_fini(helper);
>  fail:
>         drm_fb_helper_unprepare(helper);
> -       kfree(fbdev);

I think this will leak the newly created helper instance.

>         return NULL;
>  }
>
> @@ -168,7 +158,6 @@ void msm_fbdev_free(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct drm_fb_helper *helper = priv->fbdev;
>         struct drm_framebuffer *fb = helper->fb;
> -       struct msm_fbdev *fbdev;
>
>         DBG();
>
> @@ -176,8 +165,6 @@ void msm_fbdev_free(struct drm_device *dev)
>
>         drm_fb_helper_fini(helper);
>
> -       fbdev = to_msm_fbdev(priv->fbdev);
> -
>         /* this will free the backing object */
>         if (fb) {
>                 struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
> @@ -186,7 +173,7 @@ void msm_fbdev_free(struct drm_device *dev)
>         }
>
>         drm_fb_helper_unprepare(helper);
> -       kfree(fbdev);
> +       kfree(helper);
>
>         priv->fbdev = NULL;
>  }
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
