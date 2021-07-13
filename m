Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD523C75DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 19:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhGMRrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 13:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMRrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 13:47:14 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAA2C0613DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 10:44:24 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id c197so1794513oib.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YM6mwOPhOFmuR5W+3oxkc/rlqYmdsrstoASxQRez5ew=;
        b=TMhR/h7Ck+r/kjSlCs3FDr/Jau72H/rnf2EY20+WlcPBXYEmAz96D4YC6ADD/N+KvB
         bexgK0pZhWgsv2yVpKkKsRksMVrMwn//FrS2JafQ6aTGY4rb6lRsYudb3BeAQHXm2AIa
         OwDHf5Gv5RbCZgxDHLhrdyn3uRDuppwi7m39s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YM6mwOPhOFmuR5W+3oxkc/rlqYmdsrstoASxQRez5ew=;
        b=hl/LlMjRRvbK114IqJrcPkH18hA+k+uKLBTJVi115IVjjkMnlMdDOFHsXbA/pE7Zvv
         TettnlZyFBNefotNwLg6oF5pTzPd3bv+BE1q50QFtSpj/S1l318sfktpNA9ubqMytjl8
         oaCGHetUSez4A1MKNb9KbuoIy0JIhSDP/ksjql9rTUVscNZhpK+y+cJeiADWZae1Cyft
         yU+WpfxsZsaBQ1080Yp1ZddLzskT4NmgCnmRcunOuPb/gSsISrIdL8QDvVbyAhMguL7i
         a75xcToi5rYWHDOkEj4NYitbvZOKYBEm4qJuKWUwJMV9qKCGBpnrLlfd+Ukkp5tD9Zip
         za2Q==
X-Gm-Message-State: AOAM53081D1KHqH/IgkH/Y2cybmcOyU5vW+cml3DI1oRfHkFtLTebtQn
        z2CdELV3k35B+QKzu5JUf0mkBT6vP3Of7zO4BW2mlg==
X-Google-Smtp-Source: ABdhPJwTA4IFS1zrTa6SZtTVF+HKn/thgr0wLyb0QfabiBxjH3coCb2AmYkg6eR9mjuDrd+K4z0014Ss9e91ZdQs5cQ=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr441684oig.14.1626198263812;
 Tue, 13 Jul 2021 10:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
In-Reply-To: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 13 Jul 2021 19:44:12 +0200
Message-ID: <CAKMK7uGcwLmvyPB1Z2HyOQg3bHYev5J=ad8Cjj=AQMVTTSHPNg@mail.gmail.com>
Subject: Re: [RFC] drm: return int error code from mode_fixup
To:     Grace An <gracan@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Clark, Rob" <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, nganji@codeaurora.org,
        aravindh@codeaurora.org, Kuogee Hsieh <khsieh@codeaurora.org>,
        pdhaval@codeaurora.org, Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 13, 2021 at 7:14 PM Grace An <gracan@codeaurora.org> wrote:
> When CONFIG_PROVE_LOCKING is defined, the kernel randomly injects
> -EDEADLK errors for all the ww_mutex. This results in
> drm_atomic_get_private_obj_state randomly returning -EDEADLK.
> However, the mode_fixup functions do not propagate these error
> codes and return false, causing the atomic commit to fail with
> -EINVAL instead of retrying.
>
> Change encoder, crtc, and bridge mode_fixup functions to return
> an int instead of a boolean to indicate success or failure. If
> any of these functions fail, the mode_fixup function now returns
> the provided integer error code instead of -EINVAL.
>
> This change needs modifications across drivers, but before submitting
> the entire change, we want to get feedback on this RFC.
>
> Signed-off-by: Grace An <gracan@codeaurora.org>

Why don't you just use the various atomic_check hooks we have for
this? There you get passed the state and everything, have a full int
return value, and things actually work.

->mode_fixup is for compatibility with legacy crtc modeset helpers
from the pre-atomic times. If the kerneldoc isn't clear yet, please do
a patch to fix that up so that @mode_fixup points at the relevant
@atomic_check as the recommended function.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c      | 8 ++++----
>  drivers/gpu/drm/drm_bridge.c             | 4 ++--
>  include/drm/drm_bridge.h                 | 2 +-
>  include/drm/drm_modeset_helper_vtables.h | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f2b3e28..d75f09a 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -457,10 +457,10 @@ mode_fixup(struct drm_atomic_state *state)
>                 } else if (funcs && funcs->mode_fixup) {
>                         ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
>                                                 &new_crtc_state->adjusted_mode);
> -                       if (!ret) {
> +                       if (ret) {
>                                 DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] fixup failed\n",
>                                                  encoder->base.id, encoder->name);
> -                               return -EINVAL;
> +                               return ret;
>                         }
>                 }
>         }
> @@ -481,10 +481,10 @@ mode_fixup(struct drm_atomic_state *state)
>
>                 ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
>                                         &new_crtc_state->adjusted_mode);
> -               if (!ret) {
> +               if (ret) {
>                         DRM_DEBUG_ATOMIC("[CRTC:%d:%s] fixup failed\n",
>                                          crtc->base.id, crtc->name);
> -                       return -EINVAL;
> +                       return ret;
>                 }
>         }
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0eff..3ad16b5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -736,9 +736,9 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>                 if (ret)
>                         return ret;
>         } else if (bridge->funcs->mode_fixup) {
> -               if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> +               if (bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
>                                                &crtc_state->adjusted_mode))
> -                       return -EINVAL;
> +                       return ret;
>         }
>
>         return 0;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa..5d02dfc 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -153,7 +153,7 @@ struct drm_bridge_funcs {
>          * True if an acceptable configuration is possible, false if the modeset
>          * operation should be rejected.
>          */
> -       bool (*mode_fixup)(struct drm_bridge *bridge,
> +       int (*mode_fixup)(struct drm_bridge *bridge,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
>         /**
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index f3a4b47..e305c97 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -184,7 +184,7 @@ struct drm_crtc_helper_funcs {
>          * True if an acceptable configuration is possible, false if the modeset
>          * operation should be rejected.
>          */
> -       bool (*mode_fixup)(struct drm_crtc *crtc,
> +       int (*mode_fixup)(struct drm_crtc *crtc,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
>
> @@ -599,7 +599,7 @@ struct drm_encoder_helper_funcs {
>          * True if an acceptable configuration is possible, false if the modeset
>          * operation should be rejected.
>          */
> -       bool (*mode_fixup)(struct drm_encoder *encoder,
> +       int (*mode_fixup)(struct drm_encoder *encoder,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
