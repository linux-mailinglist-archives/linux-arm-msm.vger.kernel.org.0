Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14C451B59F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 04:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237256AbiEECKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 22:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiEECKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 22:10:37 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F7B21829
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 19:06:59 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v12so4192423wrv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 19:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DEPgWFnLOr771z8PKsdXSNpbwwQAe1tcA/QsjC8yy0M=;
        b=oKcEhcoJ84Xt4KNF3ZG193tKm8R8cuAzsjJmmUIOLMJMizzoOnLEwzVW04pTCMLeux
         IGlfFA2oRgJU5UvE73+gHVvVIENsKX5Oc4TGJTXKK/eHXKSaVnMPZD2VNZqbriWMpqLF
         4LA1LGnIa3z1km9fRXoPUzUo56hcYozcIJLsCzH/4bg0QD8wDolQ2fVoUSHr3GPQoLrQ
         UJVhKdmWVox4S0R7a+mlyn5Hw3KeBRXRV3uiF0TZ2oJVAOOyidKiVaaja5CGk6zNMBRq
         0cROseC9rJJIYBx3Lw1qBW+hXFX/xb8IU3XMJvcl1OXY/EOn9+rE5OycoXr8nNNG4pim
         cQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DEPgWFnLOr771z8PKsdXSNpbwwQAe1tcA/QsjC8yy0M=;
        b=OOc9N2qAWSyL/0FhZpKlZKJP2Js1i+DGksXyTOvOE4p1tEZCulODp66oFWnpyoEur0
         OLOsGgo/4WdtTSn8M/XNIplKR033kTn4vuLITUgO9dPnSH61dnY6th02zpobKQFq4UQ0
         QHrU8aWggU863By7M4npOnsED7nLgvbve0l4gCnfN0YmGtSEaLF65FUkwQWEcJwxuM2Y
         MxsKUejHchOvJ7DNAo+5fSAkqnzivv9KJeKQ4XDpCgxT5lRaggQ4bbx1EqFWipbtPVzM
         bh7c/9x0B6WbMXPGvO+D8dkCN4zy+dMJkc4GVPQcrIzy1MlVRAHmmAecfKWbI4bC9Hfw
         oJ8g==
X-Gm-Message-State: AOAM531UtibjIpXwmHu8rRObBtQOGwLzXbca1JNre8mAy/y7GyuwVGut
        gzIxqBF9Q5bYizwnI/FucTKhs7VJ5xSzmhux3EU=
X-Google-Smtp-Source: ABdhPJym27A8TrOOQOftDb3rc+bQ/X2D/JvrlqrlXqY2VGoPDqaVMsW/Kmby1WB/8U181nip3D3BxIqwa8uy+lHZvaY=
X-Received: by 2002:adf:fec2:0:b0:20c:6ffb:9598 with SMTP id
 q2-20020adffec2000000b0020c6ffb9598mr10410391wrs.418.1651716418103; Wed, 04
 May 2022 19:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220505015528.344-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220505015528.344-1-quic_jesszhan@quicinc.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 4 May 2022 19:06:46 -0700
Message-ID: <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/mdp5: Return error code in mdp5_pipe_release
 when deadlock is detected
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, quic_aravindh@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 4, 2022 at 6:55 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
> the modeset lock, but currently mdp5_pipe_release doesn't check for if
> an error is returned. Because of this, there is a possibility of
> mdp5_pipe_release hitting a NULL dereference error.
>
> To avoid this, let's have mdp5_pipe_release check if
> mdp5_get_global_state returns an error and propogate that error.
>
> Changes since v1:
> - Separated declaration and initialization of *new_state to avoid
>   compiler warning
> - Fixed some spelling mistakes in commit message
>

Note that mdp5_mixer_release() needs the same treatment.. one more comment below

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
>  3 files changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> index ba6695963aa6..97887a2be082 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>         return 0;
>  }
>
> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>  {
>         struct msm_drm_private *priv = s->dev->dev_private;
>         struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>         struct mdp5_global_state *state = mdp5_get_global_state(s);
> -       struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
> +       struct mdp5_hw_pipe_state *new_state;
>
>         if (!hwpipe)
> -               return;
> +               return -EINVAL;

At least per the current code, !hwpipe is "normal".. I think that fits
the model of things like kfree(NULL), so lets make this just return 0

> +
> +       if (IS_ERR(state))
> +               return PTR_ERR(state);
> +
> +       new_state = &state->hwpipe;
>
>         if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
> -               return;
> +               return -EINVAL;
>
>         DBG("%s: release from plane %s", hwpipe->name,
>                 new_state->hwpipe_to_plane[hwpipe->idx]->name);
> @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>         }
>
>         new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
> +
> +       return 0;
>  }
>
>  void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> index 9b26d0761bd4..cca67938cab2 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>                      uint32_t caps, uint32_t blkcfg,
>                      struct mdp5_hw_pipe **hwpipe,
>                      struct mdp5_hw_pipe **r_hwpipe);
> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>
>  struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
>                 uint32_t reg_offset, uint32_t caps);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 228b22830970..979458482841 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>                                 mdp5_state->r_hwpipe = NULL;
>
>
> -                       mdp5_pipe_release(state->state, old_hwpipe);
> -                       mdp5_pipe_release(state->state, old_right_hwpipe);
> +                       ret = mdp5_pipe_release(state->state, old_hwpipe);
> +                       if (ret)
> +                               return ret;
> +
> +                       ret = mdp5_pipe_release(state->state, old_right_hwpipe);
> +                       if (ret)
> +                               return ret;
> +
>                 }
>         } else {
> -               mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> -               mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> +               ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> +               if (ret)
> +                       return ret;
> +
> +               ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> +               if (ret)
> +                       return ret;
> +
>                 mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
>         }
>
> --
> 2.35.1
>
