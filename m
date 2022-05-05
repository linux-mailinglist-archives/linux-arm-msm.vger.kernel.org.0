Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F6851CBCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 00:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239829AbiEEWFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 18:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237116AbiEEWFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 18:05:41 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9D81EEF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 15:02:00 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id c11so7731239wrn.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PVdKjf8r7i6549fCuW/sK3U25vWwNJcaPF1ncZ/jgok=;
        b=Og5DterDsqKhQM9M9XE9Bsi4p0a52NHWGdItH2txILHAxhjdz7dY/XULcCXBcV2Ss5
         eW0PvEzfa/T6ioIxYTa6bGbtFWWHFjwsRLQ/MRhaaQjyFTxR5A7TDuTnI99M3M4VdBhx
         HgWpAABKDBL/TC6T+GNfqhtA+CNoZ4zfJHWisZ320DBh/AMx1JgGgjoE7lg+ugaQnsmG
         abmasT+nYYGAN3Esw6hnZ15UYusipa83DWfc+w3NskeW5nahF5THYjP48M/zh+EpTyMj
         oIuM0a1hNolrbJPRafHLJ3u80X5OsSSWf/JJ05ervvcETB2WykVYU4tZLPmLkFdHr+NA
         jtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PVdKjf8r7i6549fCuW/sK3U25vWwNJcaPF1ncZ/jgok=;
        b=YXrsqOlU5wk5+0XAjEyyyW/L7NYSg+l8eOxfjbTbsbXFJrqMjB9lwcwNUjS5IEzTYp
         ggU873HhnIN14sSoRQFDMD8pyxxbxbXjNOEk87A/kMzVDtDLEGfDJ72ewyEmB06UCIi8
         SFz4NRfxBEuY6ymGHSNSdNwEVzbZ3SuryOJEROwFNcad51ZD7kpFWYMAEUfWjG0KmJCH
         IXLThKqqu5JTZ3wPwhOyg8xFCM84dLO1jdMxlr40B7MTl12Gqrw1ghy6yvZhgE5yS+it
         WXAOG4e3+5FQ71vZDvt7KAfy6ByKLrztfjQjwNeD0g2CuBpPUj6fgJ2GbpTowfuk5Wc7
         evGg==
X-Gm-Message-State: AOAM531K3I6r0KxaJj28cHNoSfYUu3AO/FBrV6AFzJVCYZnnTS65LNCo
        LVUJNT82iP1pTDaGKWkf8GCMee1w9CnirWl8tgs=
X-Google-Smtp-Source: ABdhPJxsPeyGHFJPjwM4JN0d564Eg0zZwZY5Wto8oWZpbih/FBmmM++aIDeXLzeBb8d6eOwV8Q6uDG+PO7UvDhevFqg=
X-Received: by 2002:a05:6000:719:b0:20c:7894:22e1 with SMTP id
 bs25-20020a056000071900b0020c789422e1mr144542wrb.93.1651788118866; Thu, 05
 May 2022 15:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220505214051.155-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220505214051.155-1-quic_jesszhan@quicinc.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 5 May 2022 15:01:45 -0700
Message-ID: <CAF6AEGsFAkozD1j+padLREzGWNyzq8eVM9YxsX4=P4SROJ_0wA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/mdp5: Return error code in
 mdp5_pipe_release when deadlock is detected
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, quic_aravindh@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
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

On Thu, May 5, 2022 at 2:41 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
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
> Changes since v2:
> - Return 0 in case where hwpipe is NULL as this is considered normal
>   behavior
> - Added 2nd patch in series to fix a similar NULL dereference issue in
>   mdp5_mixer_release
>
> Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Fixes: 7907a0d77cb4 ("drm/msm/mdp5: Use the new private_obj state")
Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
>  3 files changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> index ba6695963aa6..a4f5cb90f3e8 100644
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
> +               return 0;
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
