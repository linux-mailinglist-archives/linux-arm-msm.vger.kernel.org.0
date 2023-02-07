Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D8968E218
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 21:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjBGUor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 15:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjBGUoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 15:44:46 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC1420073
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 12:44:40 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id q4so15330234ybu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 12:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5PXaN+rnDkxZU0a1J/LHZxEMb6BCQd+9g7X1C4pMG0=;
        b=P6G2nj53KX5NnzMLCDglTlx1+uLL5kTHDEQMf+kw3sUQCf8gNO5eC9mXHZsGpYeTO/
         oA4dqLGhV1EcBBDnu4DRpW60ZPV875Cng0qMmSrpiWtZJ1SrGzhIkJhZ6G6cIoNbaM7x
         1UJGRcsPH6hyg6pTKF6IxCB3CPW/AxSF82MqvtBtqgl4aF8EfmW+7797E8SLPM72wQ2B
         ibNRWI629JQ55GxxIpvuHDwz5GuG1WagzkgkBG2yDQ6OW+7bALmis/60GKpbE4Eq75B4
         dKXy0Q0Ya+YkcwQQ3gVxly9AHLb2cQQl2TC/aiTZW4eatrYy5btYpJBXHmI32h/VeWGr
         159w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5PXaN+rnDkxZU0a1J/LHZxEMb6BCQd+9g7X1C4pMG0=;
        b=LV/o2Sh8gFfhwR4fl0owoRE8BpEF4c15WxeEFvaS/SGOYbQKSSKnLi80Rt7z5cyeHq
         FSY0PDgiaTGpDyT8TwmV8Jxdw+XSodbIZ6/iVrE3z2Kajz8LYKX71BA8IO9M4Nn8e1Rx
         WvqL33MfIuCZdM137zXXa6MzxZyx6pZgk5j+9W27b6avtzSa+t7M+IgosDNBuALKjfOT
         8/tbcgS2e9qN2HYQxqfBUrv+oJAHUu5uuz1KWGjGOcsijQluQ7WAG8nxc8PE1+eWxfR2
         GFLU51/JosbthnZy5rJoRnj3UI8Qz7n7nlbLq6pf8n5ijmLQA7q2xPVoqAfy6Yl/lR8J
         jUJA==
X-Gm-Message-State: AO0yUKVcklI7IIF/lAa+FlG0ybarJtSNyzTgYeVifcWZJBRvIykInywT
        jHjzQONq0sEGN2vkn4pe05mExrIcJrNtPsVEMzq8vg==
X-Google-Smtp-Source: AK7set+jTbUlrgbo3Pm83+jU9WPdxt8hSIwSlDA1+2fc+XPGtAFWMuNWO85wfvO5Dkec0F+B+ksxrPgD6xywjhbkyWA=
X-Received: by 2002:a25:9345:0:b0:880:1f26:333f with SMTP id
 g5-20020a259345000000b008801f26333fmr605829ybo.15.1675802680164; Tue, 07 Feb
 2023 12:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-25-dmitry.baryshkov@linaro.org> <b4dbe036-81c4-e56f-12fb-75cb8bb59173@quicinc.com>
In-Reply-To: <b4dbe036-81c4-e56f-12fb-75cb8bb59173@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 7 Feb 2023 22:44:29 +0200
Message-ID: <CAA8EJpqQJdrvx4KML1pFYwM1ogYYie6Wct+ueJYMBAYb2-k=xQ@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] drm/msm/dpu: rework plane CSC setting
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Feb 2023 at 22:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Rework the code flushing CSC settings for the plane. Separate out the
> > pipe and pipe_cfg as a preparation for r_pipe support.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++----------
> >   1 file changed, 25 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index e69499490d39..05047192cb37 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -576,29 +576,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> >       { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> >   };
> >
> > -static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
> > +static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe, const struct dpu_format *fmt)
> >   {
> > -     struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
> >       const struct dpu_csc_cfg *csc_ptr;
> >
> > -     if (!pdpu) {
> > -             DPU_ERROR("invalid plane\n");
> > -             return NULL;
> > -     }
> > -
> >       if (!DPU_FORMAT_IS_YUV(fmt))
> >               return NULL;
> >
> > -     if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
> > +     if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
> >               csc_ptr = &dpu_csc10_YUV2RGB_601L;
> >       else
> >               csc_ptr = &dpu_csc_YUV2RGB_601L;
> >
> > -     DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> > -                     csc_ptr->csc_mv[0],
> > -                     csc_ptr->csc_mv[1],
> > -                     csc_ptr->csc_mv[2]);
> > -
> >       return csc_ptr;
> >   }
> >
> > @@ -1049,6 +1038,27 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       return 0;
> >   }
> >
> > +static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > +{
> > +     const struct dpu_format *format = to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
> > +     const struct dpu_csc_cfg *csc_ptr;
> > +
> > +     if (!pipe->sspp || !pipe->sspp->ops.setup_csc)
> > +             return;
> > +
> > +     csc_ptr = _dpu_plane_get_csc(pipe, format);
> > +     if (!csc_ptr)
> > +             return;
> > +
> > +     DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> > +                     csc_ptr->csc_mv[0],
> > +                     csc_ptr->csc_mv[1],
> > +                     csc_ptr->csc_mv[2]);
> > +
> > +     pipe->sspp->ops.setup_csc(pipe->sspp, csc_ptr);
> > +
> > +}
> > +
> >   void dpu_plane_flush(struct drm_plane *plane)
> >   {
> >       struct dpu_plane *pdpu;
> > @@ -1072,13 +1082,8 @@ void dpu_plane_flush(struct drm_plane *plane)
> >       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> >               /* force 100% alpha */
> >               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> > -     else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
> > -             const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
> > -             const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> > -
> > -             if (csc_ptr)
> > -                     pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
> > -     }
>
> Do we need to check for pipe being valid too (pstate->pipe) &&
> (pstate->pipe.sspp) && pstate->pipe.sspp->ops.setup_csc) ?
>
> Before moving the pipe_hw/sw pipe to the state the code used to check
> for pdpu->pipe_hw to be valid. Since dpu_plane_flush() can be called
> from other files too , dont we need to check for (pstate->pipe)?

pstate->pipe is not a pointer, there is nothing to check.

>
> > +     else
> > +             dpu_plane_flush_csc(pdpu, &pstate->pipe);
> >
> >       /* flag h/w flush complete */
> >       if (plane->state)



-- 
With best wishes
Dmitry
