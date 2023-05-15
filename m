Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BC9703D69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 21:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243021AbjEOTND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 15:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243061AbjEOTNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 15:13:02 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F727DB6
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 12:13:01 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-55a10577911so187775927b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684177980; x=1686769980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=buMTvzj30ZgxcgwVKLFoA6Hv/2Gc4z76k5nbzhdcfcE=;
        b=kGyzVwdggUf0TCs+S9ne4HxjpOQvYeVlI94Z+wRM6wFu5WZrHEVjGgS/gcr5u6sSQu
         6bvrmsBvXMxD4J/AJXeUUdkaENEfKxofPyDqT6r/ILnw25Leaj2iL7fkxQyrTQapODEE
         Jf88zY6aaay7/kJJGEGT5cjSetRMC1GROJtF/UPVsbHDCX8sda8ktlMz13MnZZzrkoGQ
         QEPzI8r9Tq7hnJRZ4AqIFdHEZBuenL49+dTg56lrPvHyTSwYG4QDkJml13BgGM2QaJPh
         lKgff229nsQi6PVUMa7a2yvIYKfomzUfgTXr6x0sY874tUgTDf8HEEBStYlna/e02Sv5
         H2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684177980; x=1686769980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buMTvzj30ZgxcgwVKLFoA6Hv/2Gc4z76k5nbzhdcfcE=;
        b=MicZJl0tYrp9tcAZ1vCufdpwle4NvrNh6/7gmxcbcsDCXMtvfm2/7C+yQUWoA49sVU
         dmIs8EnEi0rnZpe5ojYbVSHOqUsRdqNjt7bizvmvFYxwwTLsmz6F1/hVk10hBK0euv/s
         sTeWASZCPxXr33eXZrNLAQfFmar+dorujsmTkEfJm2KJLYlkkWI9A6Dq8PAjYHNz+Atm
         po92clXAAArjFPiA3cg8njiiReBEILdXURkYJRaMFqOAbcd3fife8b6uYLgKOHJelN1/
         0Igyq7L4Gl2CDEpm8f0SoTdEq9lrGJ710HJYIJqRQnBcllsv+Wfco4gADvM3mB1o/0MD
         hEXA==
X-Gm-Message-State: AC+VfDzVQEh5pTBB1c+ydl80S+aTmd8bYjhDVvQMQcftddqWLAJMFPLD
        ZmS/YywVbQJfL09lPVBxekmui4iw83FvjhNsQWWkBg==
X-Google-Smtp-Source: ACHHUZ4zo5Odlu/M+PIPJ0+/SGozXBDUG7yCyRfqLCsT/XHyRTLU8KzMao1l25ceAAxmRbqbJPdevypdm7mTatLG5yQ=
X-Received: by 2002:a0d:ebd6:0:b0:54f:d816:895d with SMTP id
 u205-20020a0debd6000000b0054fd816895dmr36270831ywe.28.1684177980506; Mon, 15
 May 2023 12:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-3-dmitry.baryshkov@linaro.org> <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
 <CAA8EJppbXavJCT4ErBoW2cBjRoabFK58UQ39T6h96Ovm8yMdEQ@mail.gmail.com> <94d4bc54-74c5-f565-a75e-766fdc458f75@quicinc.com>
In-Reply-To: <94d4bc54-74c5-f565-a75e-766fdc458f75@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 15 May 2023 22:12:49 +0300
Message-ID: <CAA8EJpqWZ0X-npaMEQ6=fzyT-G+fvX_-=DsUjPnqdiuP_RO_ag@mail.gmail.com>
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

On Mon, 15 May 2023 at 21:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/14/2023 10:01 AM, Dmitry Baryshkov wrote:
> > On Sat, 13 May 2023 at 01:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> >>> Take into account the plane rotation and flipping when calculating src
> >>> positions for the wide plane parts.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Do we need to have a fixes tag for this? This means we dont consider
> >> rotation while calculating src position today which is a bug?
> >
> > Hmm, I thought that I had a check forbidding rotation with the current
> > approach, but I don't see it. Most probably I thought about it and
> > then forgot to add it.
> > The proper fix should be to disallow it for static SSPP case. I'll
> > include the patch into v3.
> >
> >>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
> >>>    1 file changed, 17 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> index 2e63eb0a2f3f..d43e04fc4578 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> @@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                return -EINVAL;
> >>>        }
> >>>
> >>> -     pipe_cfg->src_rect = new_plane_state->src;
> >>> -
> >>> -     /* state->src is 16.16, src_rect is not */
> >>> -     pipe_cfg->src_rect.x1 >>= 16;
> >>> -     pipe_cfg->src_rect.x2 >>= 16;
> >>> -     pipe_cfg->src_rect.y1 >>= 16;
> >>> -     pipe_cfg->src_rect.y2 >>= 16;
> >>> -
> >>> -     pipe_cfg->dst_rect = new_plane_state->dst;
> >>> -
> >>>        fb_rect.x2 = new_plane_state->fb->width;
> >>>        fb_rect.y2 = new_plane_state->fb->height;
> >>>
> >>> @@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>
> >>>        max_linewidth = pdpu->catalog->caps->max_linewidth;
> >>>
> >>> +     /* state->src is 16.16, src_rect is not */
> >>> +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> >>> +
> >>> +     pipe_cfg->dst_rect = new_plane_state->dst;
> >>> +
> >>> +     drm_rect_rotate(&pipe_cfg->src_rect,
> >>> +                     new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                     new_plane_state->rotation);
> >>> +
> >>>        if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> >>>                /*
> >>>                 * In parallel multirect case only the half of the usual width
> >>> @@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >>>        }
> >>>
> >>> +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> >>> +                         new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                         new_plane_state->rotation);
> >>> +     if (r_pipe->sspp)
> >>
> >> Dont you need to check for if (r_pipe_cfg) here and not if
> >> (r_pipe->sspp) because parameter you are passing is the r_pipe_cfg to
> >> drm_rect_rotate_inv().
> >
> > Of course not. r_pipe_cfg is a pointer to the field in pstate. We know
> > that it can not be NULL.
> >
>
> Ack, and my bad for not checking that r_pipe_cfg points to a field in
> pstate but .... it was just weird though that you are checking for
> r_pipe->sspp before calling a method which really doesnt care if its
> null or not. How about you use drm_rect_visible(r_pipe_cfg->src_rect)
>
> If its not set, it wont be visible too.

I think it is better for the uniformity to check for r_pipe->sspp:
this is the condition that is used all over the driver to check that
r_pipe is used.

>
> >>
> >> So we rotated the pipe_cfg once, then rotated_inv it to restore the
> >> rectangle to its original state, but r_pipe_cfg's rectangle was never
> >> rotated as it was not allocated before this function so it will remain
> >> in inverse rotated state now right?
> >
> > No. r_pipe_cfg is set beforehand to the half of the rotated pipe_cfg.
> >
>
> Ok i got it now. Instead of directly operating on the plane_state's
> rectangle which makes you to invert again why not just use a temporary
> drm_rect which stores the rotated pipe_cfg->src_rect. That way you dont
> have to invert anything?

I don't think this will work. I explicitly rotate & invert rotation to
get correct coordinates for both source and destination rectangles.
Doing it otherwise would require us to manually implement this in the
DPU driver.

>
> >>> +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> >>> +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                                 new_plane_state->rotation);
> >>> +
> >>>        ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> >>>        if (ret)
> >>>                return ret;
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
