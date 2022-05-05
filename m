Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8554951BAF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 10:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346404AbiEEIwk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 04:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350432AbiEEIwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 04:52:38 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C2E4AE28
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 01:48:59 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id w187so6497211ybe.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 01:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=op5ROKe2ZN3R178e7Bu8w5MlRYrTA2IJQ63KYbg67x0=;
        b=PlQULGTSlWNcIR7xPZDYQG2Pa8eSpGTcolUplNhYBX/Nm4Yp95pd7BYFPUtf606YSc
         19v4xDJJ2QlHi9c8bGxAbCXYQTQFHyq7pIKSguxg/MgiGd+KOBZ7oKl2NdmUibY6Sga2
         MSDvMGQuMD8pP62o08MoI5rkuY46WTL0P2XwhogDtkZ5lpbSBYjW6bByhbP82EHKj60n
         /sxfuNmOh7XcwQ+qGNS0gqxZL8TM0VC0Wc5XhwryNxv4NFtWsGrgUKaoA4YKSvNS5SOv
         Wj2zJRTpSCu/batd46b1k2S5otWGZzb/W54OY1D0r1ia/0C5CXDbiTQnhZhnstTJryTU
         8RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=op5ROKe2ZN3R178e7Bu8w5MlRYrTA2IJQ63KYbg67x0=;
        b=Q9ihC9KesYJnU0XI/qyeUodweZf7NJ+FjWo3ldGbE+IiFQG2ZqZ6if/vWq5GaFzk7V
         LmVEA9P0XTJ/TJpGO7R5GpHSVR2nHenJu2w8UwnTcD8jMZPJ5GB0sFSe0WKTgCrMGDdQ
         KPwrsW5BHKfpbyL9CIQYz4mcYdUpwLzEixxkA0Xmd2ADIxukP6M4CmCSy/UOKEW+XqTv
         qzmSGFdeid7UPG7d/C+jcZ/meE3gvxehjJiB2tjXjpBC/wBfjjfez/67ujUHuaD8ON7D
         aMyuDz9vLSpT32yMmpdIihWgdlGl5ZTdxCRKIp3Juve2AMXIGsho82jfwLboEruwx/gR
         fKXQ==
X-Gm-Message-State: AOAM5330vz1xPkoZ6Zp3OdMXw+XV43B+U0Hfs+sh5cujMEZKAb6mrRd4
        9e2nR48f84HX9lxk/sXzS1fO91wZM2qq2uzxYjEMWw==
X-Google-Smtp-Source: ABdhPJz2AMrVv3CJIjrI6pJqL+b8hzT+Mj4fdxway48kUTXDu4QxBUWQrSy+dKStzWQ5d1zkk8f5o+rC9IbeqBsiFQ8=
X-Received: by 2002:a25:3455:0:b0:648:44db:51e0 with SMTP id
 b82-20020a253455000000b0064844db51e0mr19579704yba.314.1651740539255; Thu, 05
 May 2022 01:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220505015528.344-1-quic_jesszhan@quicinc.com> <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
In-Reply-To: <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 5 May 2022 11:48:48 +0300
Message-ID: <CAA8EJpraDRzBevNPC6H9ZAaLAXFq2aOkdoD9NGo-DpgsXoCm=g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/mdp5: Return error code in mdp5_pipe_release
 when deadlock is detected
To:     Rob Clark <robdclark@gmail.com>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, quic_aravindh@quicinc.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 May 2022 at 05:06, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, May 4, 2022 at 6:55 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> > mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
> > the modeset lock, but currently mdp5_pipe_release doesn't check for if
> > an error is returned. Because of this, there is a possibility of
> > mdp5_pipe_release hitting a NULL dereference error.
> >
> > To avoid this, let's have mdp5_pipe_release check if
> > mdp5_get_global_state returns an error and propogate that error.
> >
> > Changes since v1:
> > - Separated declaration and initialization of *new_state to avoid
> >   compiler warning
> > - Fixed some spelling mistakes in commit message
> >
>
> Note that mdp5_mixer_release() needs the same treatment.. one more comment below
>
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
> >  3 files changed, 28 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> > index ba6695963aa6..97887a2be082 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> > @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> >         return 0;
> >  }
> >
> > -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> > +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> >  {
> >         struct msm_drm_private *priv = s->dev->dev_private;
> >         struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> >         struct mdp5_global_state *state = mdp5_get_global_state(s);
> > -       struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
> > +       struct mdp5_hw_pipe_state *new_state;
> >
> >         if (!hwpipe)
> > -               return;
> > +               return -EINVAL;
>
> At least per the current code, !hwpipe is "normal".. I think that fits
> the model of things like kfree(NULL), so lets make this just return 0

Especially since we release the r_hwpipe w/o additional check. And
r_hwpipe frequently is NULL.

>
> > +
> > +       if (IS_ERR(state))
> > +               return PTR_ERR(state);
> > +
> > +       new_state = &state->hwpipe;
> >
> >         if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
> > -               return;
> > +               return -EINVAL;
> >
> >         DBG("%s: release from plane %s", hwpipe->name,
> >                 new_state->hwpipe_to_plane[hwpipe->idx]->name);
> > @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> >         }
> >
> >         new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
> > +
> > +       return 0;
> >  }
> >
> >  void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> > index 9b26d0761bd4..cca67938cab2 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> > @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> >                      uint32_t caps, uint32_t blkcfg,
> >                      struct mdp5_hw_pipe **hwpipe,
> >                      struct mdp5_hw_pipe **r_hwpipe);
> > -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> > +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> >
> >  struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
> >                 uint32_t reg_offset, uint32_t caps);
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > index 228b22830970..979458482841 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
> >                                 mdp5_state->r_hwpipe = NULL;
> >
> >
> > -                       mdp5_pipe_release(state->state, old_hwpipe);
> > -                       mdp5_pipe_release(state->state, old_right_hwpipe);
> > +                       ret = mdp5_pipe_release(state->state, old_hwpipe);
> > +                       if (ret)
> > +                               return ret;
> > +
> > +                       ret = mdp5_pipe_release(state->state, old_right_hwpipe);
> > +                       if (ret)
> > +                               return ret;
> > +
> >                 }
> >         } else {
> > -               mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> > -               mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> > +               ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> > +               if (ret)
> > +                       return ret;
> > +
> >                 mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
> >         }
> >
> > --
> > 2.35.1
> >



-- 
With best wishes
Dmitry
