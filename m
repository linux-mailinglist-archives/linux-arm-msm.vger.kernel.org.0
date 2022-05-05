Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A492A51CBD1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 00:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345140AbiEEWGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 18:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237116AbiEEWF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 18:05:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8128B1EEF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 15:02:18 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i5so7725107wrc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 15:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EleMdFDe6EPpi491MtMNfJ19qgZxHUEIp+inkKcil6A=;
        b=n5E9Nbyo+PSl7ny53DlxqRQONdh91E2WDDyqPIyjac+SlPaZR9OTfVVnc3/H04FL/p
         1kVQsfHxJfhQy32wSTPoNE16Ec/8Hr5SbVKle9MOrwmohgYxR1Eks3s4LVSMU+mRdYvq
         gPRafTyANi4TbuKIc909Ol89AQDZ62zCAfknHxYXYK9MLEQrG/dn4p5+5ZegHcmwnw0P
         xqx/98SdDi4tTDeEciMzuCVy+AeBDHkW0/wHcm97+IrfuHumV6lWmaOYLm56AUO3YPvO
         qyuO6BcCyjIEExXiy7dUwDfWixL1zVUhcsFrwDEnkvGH9i/5qUsNycwoUIsVvZoW04H0
         AgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EleMdFDe6EPpi491MtMNfJ19qgZxHUEIp+inkKcil6A=;
        b=IYTIxxKF9iCNuJc6hlBU6qeseZsRekKkxjK4r7gMREZ37V0vhEzKs2T318nUlJ2uiY
         s/mSuvXQve1g33l54U60GM0epxdDxW0jAJrA0jmCvEyXRNPucaCB6tnBNphLIJ2Kd9RN
         lBq+Xb9RECP2caFQANZf4iARKxik0ozzNWmocCCrSjXGGT78Agi8p3D7G5GEtZL0O4DJ
         cEXGJfw6tPj7q5oXkjh/rJPBgSkCYqmWnxWUs0w023sJd23hPPEUPmDR7gJOMdfpLc/E
         OLiNwko5b8fQ1Ye5rmbUZYcLdCMwIM+NZl4qA9J5KLrsr09AoRTNPiHbqkwomv3LGPEr
         Z6ig==
X-Gm-Message-State: AOAM531M53SzsWwVIcV+WMHU/JZ8tf49IBaEoEbfeXwcE30gYrMHZF45
        cE2YuBKRu9z5W3spatp+KxEYPcpFJkPpcjH4TUM3iRPoPQM=
X-Google-Smtp-Source: ABdhPJyULR+SgnNGt8xSulu/YA0/ogrI5ZQfEF1P2TBrdzY1YBKESg9LPequ1dxB0dxdDfkxzJd2+PMitC8Wb4Rt/dg=
X-Received: by 2002:adf:fec2:0:b0:20c:6ffb:9598 with SMTP id
 q2-20020adffec2000000b0020c6ffb9598mr153645wrs.418.1651788136913; Thu, 05 May
 2022 15:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220505214051.155-1-quic_jesszhan@quicinc.com> <20220505214051.155-2-quic_jesszhan@quicinc.com>
In-Reply-To: <20220505214051.155-2-quic_jesszhan@quicinc.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 5 May 2022 15:02:04 -0700
Message-ID: <CAF6AEGucMA0eQWd-r5uvktoge=y-WQ5Cfvab4kLaJXAsFsX05w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/mdp5: Return error code in
 mdp5_mixer_release when deadlock is detected
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
> There is a possibility for mdp5_get_global_state to return
> -EDEADLK when acquiring the modeset lock, but currently global_state in
> mdp5_mixer_release doesn't check for if an error is returned.
>
> To avoid a NULL dereference error, let's have mdp5_mixer_release
> check if an error is returned and propagate that error.
>
> Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Fixes: 7907a0d77cb4 ("drm/msm/mdp5: Use the new private_obj state")
Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 10 ++++++++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 15 +++++++++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h |  4 ++--
>  3 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index b966cd69f99d..fe2922c8d21b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -612,9 +612,15 @@ static int mdp5_crtc_setup_pipeline(struct drm_crtc *crtc,
>                 if (ret)
>                         return ret;
>
> -               mdp5_mixer_release(new_crtc_state->state, old_mixer);
> +               ret = mdp5_mixer_release(new_crtc_state->state, old_mixer);
> +               if (ret)
> +                       return ret;
> +
>                 if (old_r_mixer) {
> -                       mdp5_mixer_release(new_crtc_state->state, old_r_mixer);
> +                       ret = mdp5_mixer_release(new_crtc_state->state, old_r_mixer);
> +                       if (ret)
> +                               return ret;
> +
>                         if (!need_right_mixer)
>                                 pipeline->r_mixer = NULL;
>                 }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> index 954db683ae44..2536def2a000 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> @@ -116,21 +116,28 @@ int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
>         return 0;
>  }
>
> -void mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
> +int mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
>  {
>         struct mdp5_global_state *global_state = mdp5_get_global_state(s);
> -       struct mdp5_hw_mixer_state *new_state = &global_state->hwmixer;
> +       struct mdp5_hw_mixer_state *new_state;
>
>         if (!mixer)
> -               return;
> +               return 0;
> +
> +       if (IS_ERR(global_state))
> +               return PTR_ERR(global_state);
> +
> +       new_state = &global_state->hwmixer;
>
>         if (WARN_ON(!new_state->hwmixer_to_crtc[mixer->idx]))
> -               return;
> +               return -EINVAL;
>
>         DBG("%s: release from crtc %s", mixer->name,
>             new_state->hwmixer_to_crtc[mixer->idx]->name);
>
>         new_state->hwmixer_to_crtc[mixer->idx] = NULL;
> +
> +       return 0;
>  }
>
>  void mdp5_mixer_destroy(struct mdp5_hw_mixer *mixer)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
> index 43c9ba43ce18..545ee223b9d7 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
> @@ -30,7 +30,7 @@ void mdp5_mixer_destroy(struct mdp5_hw_mixer *lm);
>  int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
>                       uint32_t caps, struct mdp5_hw_mixer **mixer,
>                       struct mdp5_hw_mixer **r_mixer);
> -void mdp5_mixer_release(struct drm_atomic_state *s,
> -                       struct mdp5_hw_mixer *mixer);
> +int mdp5_mixer_release(struct drm_atomic_state *s,
> +                      struct mdp5_hw_mixer *mixer);
>
>  #endif /* __MDP5_LM_H__ */
> --
> 2.35.1
>
