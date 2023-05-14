Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BEC701E5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 May 2023 19:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjENRBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 May 2023 13:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjENRBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 May 2023 13:01:41 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F68635B5
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 May 2023 10:01:40 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55a2691637bso173907467b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 May 2023 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684083699; x=1686675699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2UHE6KlW9JyEYO4rMr/i63nT9UiBXdbXXzrRs9yxmkU=;
        b=RPKTeggauu5yKDq3wGbtAgtozDUWB6aA+Niak68nX+2zDqgRHObtdkLgGG+ZS2s62q
         AQM5/zSZhEl6sm9upmDn+HR9bAEO/uu3Ori8BkiQDeEv7r58e46h6gLcP7/IPJpbuQhS
         ICnC6i6cT2fqe8mNqWMod+M5DcSyf0ddQN+1s6p/UHwwJmxZa9a0M/PG4KqWgFRqukFY
         NT7QlCB+4sUJCU5ujJMlS5tJWvLjyWj1FtHwYgK9qlwe6z1A6SFU3NydcxRDYXb04rvc
         9EUeFGRjjaW0qh9gLJ3Zbp/vQ4tJSA1Pw7oM6NDFfOosBrCvWyBHnHvEWe7qOjCmd45S
         b6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684083699; x=1686675699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UHE6KlW9JyEYO4rMr/i63nT9UiBXdbXXzrRs9yxmkU=;
        b=AvcuK2RrbWbUm05OZLMEFZjlwnlf3ftGer3XvMvMAvA4b158YhHS/77tj8l7p8msRG
         7gAvi3P1zXVefBpUKK18wY/eNlTa+X68kSV0HDE7rhlafnr7GFVx96x3ojRZcAYUO8VO
         NCAk8zhCZzgTBgVis0ndrtDqSrrrAY1BgPFmzFB+v95p3cOSijymshr2W81S+6W87pJF
         05ormZGIflkir/su6FLx8MFGClPkjEXt7GSmUrClC21+4OK1xqxSZhPE3xPHrDPtRQvy
         hRxA0NNoz/v5VXF97ao8B8LBEtlRkkRooRM3d90wixBFwfVe7mugVvwdqK1l+MUV+yRm
         Na5A==
X-Gm-Message-State: AC+VfDw976Nwl3Bvr92SZXxIsPtBDJvLULX/Kjqdbr3dTmesQ3Rm4WMV
        89MOb8FC0cf8lU+cf/5SJTiVIXqX59S/Ix6uTTYkxQ==
X-Google-Smtp-Source: ACHHUZ6CIWv7Cilknh4FESFfjsUlP+18hc9999+7vuxr0cmZZf09oa3qy8n/zP5ZyAmBRAUuuyuzlPz6QAxgVJIsHeE=
X-Received: by 2002:a81:4985:0:b0:55a:577f:eff9 with SMTP id
 w127-20020a814985000000b0055a577feff9mr29769040ywa.28.1684083699008; Sun, 14
 May 2023 10:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-3-dmitry.baryshkov@linaro.org> <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
In-Reply-To: <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 14 May 2023 20:01:28 +0300
Message-ID: <CAA8EJppbXavJCT4ErBoW2cBjRoabFK58UQ39T6h96Ovm8yMdEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] drm/msm/dpu: take plane rotation into
 account for wide planes
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

On Sat, 13 May 2023 at 01:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > Take into account the plane rotation and flipping when calculating src
> > positions for the wide plane parts.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do we need to have a fixes tag for this? This means we dont consider
> rotation while calculating src position today which is a bug?

Hmm, I thought that I had a check forbidding rotation with the current
approach, but I don't see it. Most probably I thought about it and
then forgot to add it.
The proper fix should be to disallow it for static SSPP case. I'll
include the patch into v3.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
> >   1 file changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 2e63eb0a2f3f..d43e04fc4578 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > -     pipe_cfg->src_rect = new_plane_state->src;
> > -
> > -     /* state->src is 16.16, src_rect is not */
> > -     pipe_cfg->src_rect.x1 >>= 16;
> > -     pipe_cfg->src_rect.x2 >>= 16;
> > -     pipe_cfg->src_rect.y1 >>= 16;
> > -     pipe_cfg->src_rect.y2 >>= 16;
> > -
> > -     pipe_cfg->dst_rect = new_plane_state->dst;
> > -
> >       fb_rect.x2 = new_plane_state->fb->width;
> >       fb_rect.y2 = new_plane_state->fb->height;
> >
> > @@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +
> > +     pipe_cfg->dst_rect = new_plane_state->dst;
> > +
> > +     drm_rect_rotate(&pipe_cfg->src_rect,
> > +                     new_plane_state->fb->width, new_plane_state->fb->height,
> > +                     new_plane_state->rotation);
> > +
> >       if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> >               /*
> >                * In parallel multirect case only the half of the usual width
> > @@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >       }
> >
> > +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > +                         new_plane_state->fb->width, new_plane_state->fb->height,
> > +                         new_plane_state->rotation);
> > +     if (r_pipe->sspp)
>
> Dont you need to check for if (r_pipe_cfg) here and not if
> (r_pipe->sspp) because parameter you are passing is the r_pipe_cfg to
> drm_rect_rotate_inv().

Of course not. r_pipe_cfg is a pointer to the field in pstate. We know
that it can not be NULL.

>
> So we rotated the pipe_cfg once, then rotated_inv it to restore the
> rectangle to its original state, but r_pipe_cfg's rectangle was never
> rotated as it was not allocated before this function so it will remain
> in inverse rotated state now right?

No. r_pipe_cfg is set beforehand to the half of the rotated pipe_cfg.

> > +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > +                                 new_plane_state->rotation);
> > +
> >       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> >       if (ret)
> >               return ret;



--
With best wishes
Dmitry
