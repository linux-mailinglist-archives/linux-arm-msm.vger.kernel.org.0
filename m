Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C6523CCAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 18:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgHEQ5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 12:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbgHEQzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 12:55:15 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7856C001FCA;
        Wed,  5 Aug 2020 08:47:51 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id di22so25717997edb.12;
        Wed, 05 Aug 2020 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+thVhnOzocq+PgCFY0tda78F/9CHLw5tyXEyW5ctJ0o=;
        b=K30Jpi+unvD+CodHrimHJBJOgIBKD2vORRRsNDdnxowxbqvNqWmkAuS87xxPAvIxSE
         ePsUbOvmJ2NJ/xZNYGM9PJaoNcn/9NN9lsFvOaM2shMUcbTCUbYb86NythE2JhhhJNZQ
         IPzpttIxwWgZMBIpbgr3qu+/sQaRlEc9o+gOa6sbnKflX3vw5+Qyq+5+Ts4dZtEaZoIB
         r7bRtoTPTc7S494vAZzE1jsYQXemBVLfNJfQpUKxqDPcxayazZStrgobE4jw9ZObecr+
         UKlUHS8s2PCiYg+N0X5gslQEfsQEMKsjRSifBnzyqFxNyjtFjnSSOtvmPkfGyBskiDbl
         BVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+thVhnOzocq+PgCFY0tda78F/9CHLw5tyXEyW5ctJ0o=;
        b=s0mIlclpL3+TdiGf3d9+AhofQqABHMrsq3YaVAOv7Hpyf1hxuXoA68/5admcysEYZ6
         IH8CL3rNK/EmB1Q+lnV2ASxvrRJkXeeFwg61WQb3pVlD6xWFwozSsRWwLa1mGboghe9N
         JA7RhAAmmAg5yTu5DmdIkmyO/1dV+t782aniKUxW5hZzGwOFn+T3oe7yD4ZQt352OU5C
         291yHgS9Nw8braywlZzBCqKHAl5C3uPxVyXEpU45m+bl4TiX1PitYma3qAVNOZjyCbSm
         THG9oGzYglMfms3ZEMIOj/H76H4bkijgGFmCUvNt8YoPtLclHl+mztxNBOd5Nj3dN53R
         BIlg==
X-Gm-Message-State: AOAM531SbDZUtlZI9iMECw9kpQgqCg6LRsA7jrzoD6ynH5p6J3tkdSgX
        kuUfCaE1tOxDopXfULzdHkyReJJ02NbkATQw0vpQ87/nwQg=
X-Google-Smtp-Source: ABdhPJwWW0KOvBhVO5pikas+uaQ+9Bi+oT+23iSZ47+Y2ckg0AYW5ATvLjA/5bzvEOv35sFXN/1aBcuO1YWaqys/Vi4=
X-Received: by 2002:a05:6402:a5b:: with SMTP id bt27mr3476095edb.120.1596642470596;
 Wed, 05 Aug 2020 08:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 Aug 2020 08:48:34 -0700
Message-ID: <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: Fix reservation failures in modeset
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org, Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 5, 2020 at 6:34 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> In TEST_ONLY commit, rm global_state will duplicate the
> object and request for new reservations, once they pass
> then the new state will be swapped with the old and will
> be available for the Atomic Commit.
>
> This patch fixes some of missing links in the resource
> reservation sequence mentioned above.
>
> 1) Creation of a duplicate state in test_only commit (Rob)
> 2) Allow resource release only during crtc_active false.
>
> For #2
> In a modeset operation, swap state happens well before disable.
> Hence clearing reservations in disable will cause failures
> in modeset enable.
>
> Sequence:
>     Swap state --> old, new
>     modeset disables --> virt disable
>     modeset enable --> virt modeset
>
> Allow reservations to be cleared only when crtc active is false
> as in that case there wont be any modeset enable after disable.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..b85a576 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
>         dpu_kms = to_dpu_kms(priv->kms);
>         mode = &crtc_state->mode;
>         adj_mode = &crtc_state->adjusted_mode;
> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +       global_state = dpu_kms_get_global_state(crtc_state->state);
>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
>
>         /*
> @@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>         struct msm_drm_private *priv;
>         struct dpu_kms *dpu_kms;
>         struct dpu_global_state *global_state;
> +       struct drm_crtc_state *crtc_state;
>         int i = 0;
>
>         if (!drm_enc) {
> @@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>         priv = drm_enc->dev->dev_private;
>         dpu_kms = to_dpu_kms(priv->kms);
>         global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +       crtc_state = drm_enc->crtc->state;
>
>         trace_dpu_enc_disable(DRMID(drm_enc));
>
> @@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>
>         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>
> -       dpu_rm_release(global_state, drm_enc);
> +       if (crtc_state->active_changed && !crtc_state->active)
> +               dpu_rm_release(global_state, drm_enc);

I still think releasing the state in the atomic_commit() path is the
wrong thing to do.  In the commit path, the various state objects
should be immutable.. ie. in the atomic_test() path you derive the new
hw state (including assignment/release of resources), and
atomic_commit() is simply pushing the state down to the hw.

Otherwise, this looks better than v1.

BR,
-R

>
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
> --
> 1.9.1
>
