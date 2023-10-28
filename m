Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455A07DA493
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 03:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjJ1BQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 21:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbjJ1BQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 21:16:55 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23F4128
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 18:16:52 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d9cbba16084so1832563276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 18:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698455812; x=1699060612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYOGSzc5gVhC61nl8UkhLbfPjbeXVie5I0ZyNVFICnw=;
        b=VJObLTGZFxNsFNB0LRGkl1SdDfJDrzDvOoWCrM81x5wKJq4yt/MRVR/h3OWalHwu85
         y4hzLeuCti7O6BrSFJAJ4l6EiRZDz18UNvCt4haApaJMhG99tJh+FFshGtlS6g1QevYz
         ec9vC3SDc6WWIiqqtS8pEzwZ1153/8vKtjPnEKsJyTccG/VgSsNchdsfqCcdi604zyxs
         LKCDSNQ8wY8H+izPa1tG6ugshBdu9pFYSUj6u+KyDHYNvdF8YnnsIMmvm+/tALnggjWf
         0epJ7sSg+qZf23Cpi4SIsgMJ/ZXIwNNGKO9Oan4q8/pTPVkLe9zrqLdRxItKwluD/L9F
         NGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698455812; x=1699060612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYOGSzc5gVhC61nl8UkhLbfPjbeXVie5I0ZyNVFICnw=;
        b=NKOESLyeowAT6qY9GCS5sCKzLrwjmF9h7ea3h448pxECeNMb3GERoQAoLXymW8HrZt
         S908C2fWCePLvzjSVzz4FGGkvdDkTeVz2ZrLY+nmSd0RszPGfABfDU7g37zuAjsk21+G
         rmUpfNr8ZxalIgG8eAc6oxjNx/TIgdRvFazoUP0rIdKpsja4QbdiT2mEIq+mSNi7zn/g
         YNV8BbAyjnNV6U2JaX+6e3/90qzxb1pE62x5b17YPnCPwq5HdpsvPzN4gV0NbYagKIGi
         RtZZ5ifr3jXUPmmK2r89qD8dKuJ9H54crGkRPfB0tYI/ymJX2snZEVW0y+uuW+VfGY27
         YwoQ==
X-Gm-Message-State: AOJu0Yw9dUTExQZ2GMul90C/lDSMG78K3W4lVH133rQrrKPzbeEeSU4Q
        zs6USSFncQLb1DRyH1VR8N9fF6mcfZFNHVhdNNo4Dw==
X-Google-Smtp-Source: AGHT+IEB3TSQlXZiiMkMFKwFsa+wSKRdof4CP2GWjs5xlZAPeKKsclBTSDJH5mSHR1MJbJSXDKE/F6VBpGTFf3auWrs=
X-Received: by 2002:a25:a292:0:b0:da0:5775:fd77 with SMTP id
 c18-20020a25a292000000b00da05775fd77mr3817290ybi.63.1698455811663; Fri, 27
 Oct 2023 18:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194537.408922-1-robdclark@gmail.com>
In-Reply-To: <20231027194537.408922-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 28 Oct 2023 04:16:40 +0300
Message-ID: <CAA8EJpoOHqzQBESqjxCh4DHztJrsBQ5gKtkj++jYTAYEds9Ocg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Add metadata
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Oct 2023 at 22:45, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The EXT_external_objects extension is a bit awkward as it doesn't pass
> explicit modifiers, leaving the importer to guess with incomplete
> information.  In the case of vk (turnip) exporting and gl (freedreno)
> importing, the "OPTIMAL_TILING_EXT" layout depends on VkImageCreateInfo
> flags (among other things), which the importer does not know.  Which
> unfortunately leaves us with the need for a metadata back-channel.
>
> The contents of the metadata are defined by userspace.  The
> EXT_external_objects extension is only required to work between
> compatible versions of gl and vk drivers, as defined by device and
> driver UUIDs.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 59 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_gem.h |  4 +++
>  include/uapi/drm/msm_drm.h    |  2 ++
>  3 files changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b61ccea05327..8fe2677ea37a 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -37,9 +37,10 @@
>   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
>   * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
>   * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
> + * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
>   */
>  #define MSM_VERSION_MAJOR      1
> -#define MSM_VERSION_MINOR      10
> +#define MSM_VERSION_MINOR      12
>  #define MSM_VERSION_PATCHLEVEL 0
>
>  static void msm_deinit_vram(struct drm_device *ddev);
> @@ -566,6 +567,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 break;
>         case MSM_INFO_SET_NAME:
>         case MSM_INFO_GET_NAME:
> +       case MSM_INFO_SET_METADATA:
> +       case MSM_INFO_GET_METADATA:
>                 break;
>         default:
>                 return -EINVAL;
> @@ -618,7 +621,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 break;
>         case MSM_INFO_GET_NAME:
>                 if (args->value && (args->len < strlen(msm_obj->name))) {
> -                       ret = -EINVAL;
> +                       ret = -ETOOSMALL;

This is unrelated and it also slightly changes user interface, so it
IMO should come as a separate commit/

>                         break;
>                 }
>                 args->len = strlen(msm_obj->name);
> @@ -627,6 +630,58 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                                          msm_obj->name, args->len))
>                                 ret = -EFAULT;
>                 }
> +               break;
> +       case MSM_INFO_SET_METADATA:
> +               /* Impose a moderate upper bound on metadata size: */
> +               if (args->len > 128) {
> +                       ret = -EOVERFLOW;
> +                       break;
> +               }
> +
> +               ret = msm_gem_lock_interruptible(obj);
> +               if (ret)
> +                       break;
> +
> +               msm_obj->metadata =
> +                       krealloc(msm_obj->metadata, args->len, GFP_KERNEL);
> +               msm_obj->metadata_size = args->len;
> +
> +               if (copy_from_user(msm_obj->metadata, u64_to_user_ptr(args->value),
> +                                  args->len)) {
> +                       msm_obj->metadata_size = 0;
> +                       ret = -EFAULT;
> +               }
> +
> +               msm_gem_unlock(obj);
> +
> +               break;
> +       case MSM_INFO_GET_METADATA:
> +               if (!args->value) {
> +                       /*
> +                        * Querying the size is inherently racey, but
> +                        * EXT_external_objects expects the app to confirm
> +                        * via device and driver UUIDs that the exporter and
> +                        * importer versions match.  All we can do from the
> +                        * kernel side is check the length under obj lock
> +                        * when userspace tries to retrieve the metadata
> +                        */
> +                       args->len = msm_obj->metadata_size;
> +                       break;
> +               }
> +
> +               ret = msm_gem_lock_interruptible(obj);
> +               if (ret)
> +                       break;
> +
> +               if (args->len < msm_obj->metadata_size) {
> +                       ret = -ETOOSMALL;
> +               } else if (copy_to_user(u64_to_user_ptr(args->value),
> +                                       msm_obj->metadata, args->len)) {
> +                       ret = -EFAULT;
> +               }

Doesn't checkpwatch warn here about extra curly brackets?

> +
> +               msm_gem_unlock(obj);
> +
>                 break;
>         }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 7f34263048a3..8d414b072c29 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -109,6 +109,10 @@ struct msm_gem_object {
>
>         char name[32]; /* Identifier to print for the debugfs files */
>
> +       /* userspace metadata backchannel */
> +       void *metadata;
> +       u32 metadata_size;
> +
>         /**
>          * pin_count: Number of times the pages are pinned
>          *
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 6c34272a13fd..6f2a7ad04aa4 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -139,6 +139,8 @@ struct drm_msm_gem_new {
>  #define MSM_INFO_GET_NAME      0x03   /* get debug name, returned by pointer */
>  #define MSM_INFO_SET_IOVA      0x04   /* set the iova, passed by value */
>  #define MSM_INFO_GET_FLAGS     0x05   /* get the MSM_BO_x flags */
> +#define MSM_INFO_SET_METADATA  0x06   /* set userspace metadata */
> +#define MSM_INFO_GET_METADATA  0x07   /* get userspace metadata */
>
>  struct drm_msm_gem_info {
>         __u32 handle;         /* in */
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
