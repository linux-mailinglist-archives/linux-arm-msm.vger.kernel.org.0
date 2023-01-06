Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FC6660904
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 22:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbjAFV5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 16:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbjAFV5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 16:57:00 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CA5669BC
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 13:56:59 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4c24993965eso33275047b3.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yURizICzWNmVt4WSBC2l5bUComb3tT4KsRBDfo5r7sA=;
        b=bf2DVvfMT3v/7IRlng0JZyteNEPVZloq+pSkiVMt3vqwy6d4PcymGuna2iKFa2L90h
         3xKxNParaiTCmIthyeSB2NhzmHWQRrO8NekICx/AFoVO/CpWHxAlwo6MWQgzD8Q3D1V+
         JWpw/cGtNyTiqtOw8kXwxbDFPDKlDZKtJ5IKgj/8B/M912es82seJdGdAkX71/Uzit4y
         iXUFQRpNgqGA+ccf2PGj6ym0/j+4JJQQgCVgHh7HhxxfZaX/6/Esy57OedKkABbDdw0U
         5Ruv0MEAk3v8wwByVmlWoMOQrSUkiZgHmT/kr0/idYj1Rbd/jY+V+yCuw40g9lAI5r3R
         L9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yURizICzWNmVt4WSBC2l5bUComb3tT4KsRBDfo5r7sA=;
        b=x5lfsDmkJrovV2jX9b2Y4QzqrRU+bmxLue6T/6sc/WyuhifeoIyvAiAPH6IK6Al9Jz
         dI+AKjIwdOF8B/xO9ydEdK6Ot7lJbMRnQsVCiibty/1TH3IS1lJfpDZbJoGfRm6xPmOa
         EXi5neqc2fHdotrgafp0J19+1cdWPW/SUGq4OD7uJyEf+ZPwP6v/z+VDj0mPCi7KZxRM
         t+Fse6E7yuEc+n52BitwAY9lS4C94KLDI+DqWJiPqMMUHwgaCY3ay4FF/JSfom25kc0c
         L9J0D6YqDGAaaLL+OeK/odzu2C8m3BvUeYnHBtcYerRQvOhwWRlHu3Oubo0SUo0sshrp
         cuJA==
X-Gm-Message-State: AFqh2koBsRbCBDgqx4oWFy2PndX8bg6scmQgXPrbrVkZ2/YXWYXHIBpq
        hytlGbpCh60qFo3L7U17INvV7mpt4gZgpfM4SbNfEg==
X-Google-Smtp-Source: AMrXdXu1ecowIJMb20Ss0toVvgXmYrv0ANIdEA802RgHL2TDAnWQDDYBKuo+qePZEW8M6LQUXv2oCf6Vmegm27oawh8=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr3456604ywb.378.1673042218312; Fri, 06
 Jan 2023 13:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-4-quic_jesszhan@quicinc.com> <d352312a-9916-934c-0a1c-e79b7eb3c7e6@linaro.org>
 <60af746f-e88a-c78f-de36-7409a13006de@quicinc.com>
In-Reply-To: <60af746f-e88a-c78f-de36-7409a13006de@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 23:56:47 +0200
Message-ID: <CAA8EJpq8PQyoZNGOC+urvdG2A864R8DC=EsDmpDnJ8D_7cP=8g@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH v3 3/3] drm/msm/dpu: Use color_fill
 property for DPU planes
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
        ppaalanen@gmail.com, linux-arm-msm@vger.kernel.org,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, daniel.vetter@ffwll.ch, robdclark@gmail.com,
        seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
        contact@emersion.fr, wayland-devel@lists.freedesktop.org,
        ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Jan 2023 at 22:57, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> On 1/4/2023 6:16 PM, Dmitry Baryshkov wrote:
> > On 05/01/2023 01:40, Jessica Zhang wrote:
> >> Initialize and use the color_fill properties for planes in DPU driver. In
> >> addition, relax framebuffer requirements within atomic commit path and
> >> add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
> >> as it's unused.
> >>
> >> Changes since V2:
> >> - Fixed dropped 'const' warning
> >> - Dropped use of solid_fill_format
> >> - Switched to using drm_plane_solid_fill_enabled helper method
> >> - Added helper to convert color fill to BGR888 (Rob)
> >> - Added support for solid fill on planes of varying sizes
> >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
> >>   2 files changed, 49 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 13ce321283ff..0695b70ea1b7 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct
> >> drm_crtc *crtc,
> >>       struct drm_plane_state *state;
> >>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
> >>       struct dpu_plane_state *pstate = NULL;
> >> +    const struct msm_format *fmt;
> >>       struct dpu_format *format;
> >>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
> >> @@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct
> >> drm_crtc *crtc,
> >>                   sspp_idx - SSPP_VIG0,
> >>                   state->fb ? state->fb->base.id : -1);
> >> -        format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> >> +        if (pstate->base.fb)
> >> +            fmt = msm_framebuffer_format(pstate->base.fb);
> >> +        else
> >> +            fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
> >> +                    DRM_FORMAT_ABGR8888, 0);
> >> +
> >> +        format = to_dpu_format(fmt);
> >>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
> >>               bg_alpha_enable = true;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> index 86719020afe2..51a7507373f7 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> @@ -44,7 +44,6 @@
> >>   #define DPU_NAME_SIZE  12
> >> -#define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
> >>   #define DPU_ZPOS_MAX 255
> >>   /* multirect rect index */
> >> @@ -105,7 +104,6 @@ struct dpu_plane {
> >>       enum dpu_sspp pipe;
> >>       struct dpu_hw_pipe *pipe_hw;
> >> -    uint32_t color_fill;
> >>       bool is_error;
> >>       bool is_rt_pipe;
> >>       const struct dpu_mdss_cfg *catalog;
> >> @@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct
> >> dpu_plane *pdpu,
> >>                   &scaler3_cfg);
> >>   }
> >> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill
> >> solid_fill)
> >> +{
> >> +    uint32_t ret = 0;
> >> +
> >> +    ret |= ((uint8_t) solid_fill.b) << 16;
> >> +    ret |= ((uint8_t) solid_fill.g) << 8;
> >> +    ret |= ((uint8_t) solid_fill.r);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_plane_color_fill - enables color fill on plane
> >>    * @pdpu:   Pointer to DPU plane object
> >> @@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct
> >> drm_plane *plane,
> >>       dst = drm_plane_state_dest(new_plane_state);
> >> -    fb_rect.x2 = new_plane_state->fb->width;
> >> -    fb_rect.y2 = new_plane_state->fb->height;
> >> +    if (new_plane_state->fb) {
> >> +        fb_rect.x2 = new_plane_state->fb->width;
> >> +        fb_rect.y2 = new_plane_state->fb->height;
> >> +    }
> >>       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >> +    if (new_plane_state->fb)
> >> +        fmt =
> >> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >> +    else
> >> +        fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> >
> > I think this should be more explicit:
> >
> > if (solid_fill)
> >     fmt = dpu_get_dpu_format(...)
> > else
> >     fmt = to_dpu_format(msm_framebuffer_format(...).
> >
> > And in the _dpu_crtc_blend_setup_mixer() too.
>
> Hi Dmitry,
>
> Noted.
>
> >
> > Maybe the code can be extracted to a helper.
> >
> >>       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >> @@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct
> >> drm_plane *plane,
> >>           return -EINVAL;
> >>       /* check src bounds */
> >> -    } else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
> >> +    } else if (new_plane_state->fb && !dpu_plane_validate_src(&src,
> >> &fb_rect, min_src_size)) {
> >>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
> >>                   DRM_RECT_ARG(&src));
> >>           return -E2BIG;
> >> @@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
> >>       if (pdpu->is_error)
> >>           /* force white frame with 100% alpha pipe output on error */
> >>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> >> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> >> +    else if (!(plane->state->fb) &&
> >> drm_plane_solid_fill_enabled(plane->state))
> >>           /* force 100% alpha */
> >> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> >> +        _dpu_plane_color_fill(pdpu,
> >> _dpu_plane_get_fill_color(plane->state->solid_fill),
> >> +                0xFF);
> >
> > I'd push alpha into _dpu_plane_get_fill_color(). Then adding alpha
> > support would be more transparent.
>
> Acked.

Actually after our discussion I wanted to discuss this with you. We
pass the plane's alpha value and blending mode using LM_BLEND*
registers. Does that integrate correctly with the alpha part of
SSPP_SRC_CONSTANT_COLOR?


-- 
With best wishes
Dmitry
