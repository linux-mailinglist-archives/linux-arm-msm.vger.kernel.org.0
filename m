Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B853B67DD56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 07:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjA0GFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 01:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjA0GFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 01:05:38 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2022D48A03
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 22:05:37 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4ff1fa82bbbso53905687b3.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 22:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=odMtKOfoNkQ4B9p3SnpsiAi9zMJKcUAjwtL3wnlE3AA=;
        b=RNyPF0+/ap+ruzzg1wD4e4PQNxBwSYFgd/1RKZQWm7+tGU5pEDz9xHwy9meDhUTt8A
         k01qy6gj7R26es5SVivJcFe/+ZHjxRdStaLCxd07iP+ckGDbcTqYmA+6+jLjIjGr1PAF
         kQf0eXWfctWKX5H28QxZJ65rON5FbTwxGpqKKuyOYNuzNtywDhS6G+MHhtKD69qV/nwW
         6/xql/i2GTvIxTL2DXRbB8FthgaG9V58xWpxwAkBkaOK5esAHwWRhFxvMhlYXymdT8em
         K6uytowwxdf3Qqr6ehsFB9yhOm+s8zEi9fUAlS2f5GTiWjhT0D9iNCN1CwEXfe09njMh
         fM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odMtKOfoNkQ4B9p3SnpsiAi9zMJKcUAjwtL3wnlE3AA=;
        b=k2+9/6c3m530LL68jAy1Y96w7EQD41oe9zr6LvWRjHdFo4ZftRG8IapFMMpWJ87OmK
         n5enaqFcogm3QZz4TZQ794/c+cvwTecgJfy2l2hWoAhEQ+MKY5lyfQJDWlUbtP5d0hBD
         dJnBV+meeOIdJI9RWpt+lF0sbWtThYsmuidaV5pzIZ3RySoD75TsUXVYSPWb4Lq/i+mg
         CWwmRvQXx8BK2gzpUkF5eeKSk+xzYL8K5OVrSVHtliz+RLRiRWWD3yBgKLsrXP2RslkM
         aoKt3PhSzXA8/ZbGW6Q+YFyFQ/siAAk8n+m+1jwfMtyPWsv//KmWGpZVl1pHwhwICVoA
         kXXA==
X-Gm-Message-State: AFqh2kqjm3OijPaw/Bf0kBcTjcLFCl9PSEl6Hgp5KAYkRFqbh7d3jhqQ
        tTu8B15CqmsVRcvO4fYWOBOixccTQTKDibPm4bMCrg==
X-Google-Smtp-Source: AMrXdXtEg1A7UCnm6yhyPrtoBPuOsCDqdR8WlThIEy7XXoaoDuLIrk+YOHX+XdWZcy5CZthipKVrrohYdWsEzfHIRGM=
X-Received: by 2002:a0d:fd07:0:b0:3d6:2151:4038 with SMTP id
 n7-20020a0dfd07000000b003d621514038mr4491500ywf.418.1674799536315; Thu, 26
 Jan 2023 22:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-6-dmitry.baryshkov@linaro.org> <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
In-Reply-To: <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Jan 2023 08:05:25 +0200
Message-ID: <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
Subject: Re: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
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

On Fri, 27 Jan 2023 at 02:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> > The pipe's layout is not cached, corresponding data structure is zeroed
> > out each time in the dpu_plane_sspp_atomic_update(), right before the
> > call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().
> >
> > Drop plane_addr comparison against previous layout and corresponding
> > EAGAIN handling.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> The change itself LGTM, hence
>
> But, shouldnt we add this EAGAIN validation or in other words fix this
> rather than drop this?

What for? Does it really save us anything? What's the price of
re-programming the SSPP_SRC0_ADDR registers?

>
> Like I wrote in the review last time, this makes sure to fail the commit
> if the same addr is being programmed.

First, there is nothing wrong with committing the same source addr.
For example setting the atomic property incurs an internal
drm_atomic_commit() with no change to addresses at all.
And then, this doesn't make atomic_commit fail. Instead it just
shortcuts a call to SSPP->setup_sourceaddress.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 10 +---------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +---
> >   2 files changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index d95540309d4d..ec1001e10f4f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -918,8 +918,7 @@ int dpu_format_populate_layout(
> >               struct drm_framebuffer *fb,
> >               struct dpu_hw_fmt_layout *layout)
> >   {
> > -     uint32_t plane_addr[DPU_MAX_PLANES];
> > -     int i, ret;
> > +     int ret;
> >
> >       if (!fb || !layout) {
> >               DRM_ERROR("invalid arguments\n");
> > @@ -940,9 +939,6 @@ int dpu_format_populate_layout(
> >       if (ret)
> >               return ret;
> >
> > -     for (i = 0; i < DPU_MAX_PLANES; ++i)
> > -             plane_addr[i] = layout->plane_addr[i];
> > -
> >       /* Populate the addresses given the fb */
> >       if (DPU_FORMAT_IS_UBWC(layout->format) ||
> >                       DPU_FORMAT_IS_TILE(layout->format))
> > @@ -950,10 +946,6 @@ int dpu_format_populate_layout(
> >       else
> >               ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
> >
> > -     /* check if anything changed */
> > -     if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
> > -             ret = -EAGAIN;
> > -
> >       return ret;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index cdde7b9ec882..43fb8e00ada6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -476,9 +476,7 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
> >       int ret;
> >
> >       ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
> > -     if (ret == -EAGAIN)
> > -             DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
> > -     else if (ret)
> > +     if (ret)
> >               DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> >       else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
> >               trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,



-- 
With best wishes
Dmitry
