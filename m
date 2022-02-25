Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5BAB4C3AB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 02:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbiBYBEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 20:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiBYBEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 20:04:11 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A0C1A06E2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 17:03:39 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id v3so1159224qta.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 17:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aiBRRmAabEtzf7fAFugu3t5mTsmuCMXobrG596zXrAs=;
        b=Ty8nIS87hvCZgefl4Yw55gr+V2rpupGihj23sMx6ige/z4LJl8/JdNgtd6GLioGsjt
         u2uUOTWcXxjczhsnZ1aPNy8uV496KoA1x6yn+eI8DmtoN2faxl5Y4wTZ4FCPDQ2+IlVx
         kV9sBzCNRRDuCCkzlJ8jnzPm18pSIyFYpu1JHIUlwe9fmvHQhFVL2+UKVd76L5QlINqd
         5oyaClHDWzn3/+mPDdQU//3Er0jgoD38ysXTM/iqZPYf1XaY5cZy4vob/M1R3HuJd9Af
         bNlvNiWUaXE5fhaDHnoYm6gIBvKdSYD4NbAqlnvgDbH7QdNXbwPUj6lvkYoKWDA5MBRv
         gD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aiBRRmAabEtzf7fAFugu3t5mTsmuCMXobrG596zXrAs=;
        b=ha7yLM4oqSzdifc9/Cl31KStZH2eSg2bVq+8lyKjVC0PghR9E7QUvffwEzDueQ/Ij9
         gRnDt+4KGOw9sUIrY9LrHEL2mIrlgNY6/3ojqarbjdDTytXd2iKgf5dntQlOaG+Gi5HE
         LaN7QTutfnCb+ri8cn8UclQ6/2lcIAFudn5ulu57E0AGP2CWXHTfNYdiYXvssYLzWq6v
         8vpE/CNq3u+gaZNXKtOmKLfIoOJvs3qM7dQWo5SSo1if6yHTBw3qE2bT5lsuRS/fK5gt
         syR1PP+otTV8K053yE/B99kWzgaqCHs/pL2RG4SAddnClfOFVmZs+EWgv/+IS8LjKQgJ
         L8iQ==
X-Gm-Message-State: AOAM531LmqXsmaqbzvSYr1e1D4mTWbqK5t0ZmXS1YT+E3e1DzFwOo3eP
        kWpcSYnyIBVr0bGL3fpFbmdOPBS48IzIh6nRDlcxHrFSxQM=
X-Google-Smtp-Source: ABdhPJyCsRCbuc9sR67sicTg3FPJyaFT+cgt0OhOTMz/K7MH6krdelYdMvuoEs0JmkgcOL9Nriy7nSwCmgr/Aeu++Jo=
X-Received: by 2002:a05:622a:1206:b0:2de:6fa4:41fb with SMTP id
 y6-20020a05622a120600b002de6fa441fbmr4897026qtx.295.1645751018161; Thu, 24
 Feb 2022 17:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20220223191118.881321-1-robdclark@gmail.com>
In-Reply-To: <20220223191118.881321-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 25 Feb 2022 04:03:27 +0300
Message-ID: <CAA8EJpoH=czjYKBNjDs2eSjwRAc-18SLR8r8dJKygkKonrQoQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Avoid dirtyfb stalls on video mode displays (v2)
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        open list <linux-kernel@vger.kernel.org>
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

On Wed, 23 Feb 2022 at 22:11, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Someone on IRC once asked an innocent enough sounding question:  Why
> with xf86-video-modesetting is es2gears limited at 120fps.
>
> So I broke out the perfetto tracing mesa MR and took a look.  It turns
> out the problem was drm_atomic_helper_dirtyfb(), which would end up
> waiting for vblank.. es2gears would rapidly push two frames to Xorg,
> which would blit them to screen and in idle hook (I assume) call the
> DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
> dirty rects, which would stall until the next vblank.  And then the
> whole process would repeat.
>
> But this is a bit silly, we only need dirtyfb for command mode DSI
> panels.  So track in plane state whether dirtyfb is required, and
> track in the fb how many attached planes require dirtyfb so that we
> can skip it when not required.  (Note, mdp4 does not actually have
> cmd mode support.)
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I like the way it ended up being implemented. A really nice hack!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 20 ++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c  |  5 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h  |  3 ++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 19 ++++++++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  8 +++++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   |  5 +++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 21 +++++++++--
>  drivers/gpu/drm/msm/msm_atomic.c           | 15 --------
>  drivers/gpu/drm/msm/msm_drv.h              |  6 ++--
>  drivers/gpu/drm/msm/msm_fb.c               | 41 ++++++++++++++++++----
>  10 files changed, 110 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 662b7bc9c219..7763558ef566 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1046,6 +1046,20 @@ struct plane_state {
>         u32 pipe_id;
>  };
>
> +static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> +{
> +       struct drm_crtc *crtc = cstate->crtc;
> +       struct drm_encoder *encoder;
> +
> +       drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
> +               if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>                 struct drm_atomic_state *state)
>  {
> @@ -1066,6 +1080,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>         const struct drm_plane_state *pipe_staged[SSPP_MAX];
>         int left_zpos_cnt = 0, right_zpos_cnt = 0;
>         struct drm_rect crtc_rect = { 0 };
> +       bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>
>         pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
>
> @@ -1097,6 +1112,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>
>          /* get plane state for all drm planes associated with crtc state */
>         drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> +               struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
>                 struct drm_rect dst, clip = crtc_rect;
>
>                 if (IS_ERR_OR_NULL(pstate)) {
> @@ -1108,11 +1124,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>                 if (cnt >= DPU_STAGE_MAX * 4)
>                         continue;
>
> -               pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
> +               pstates[cnt].dpu_pstate = dpu_pstate;
>                 pstates[cnt].drm_pstate = pstate;
>                 pstates[cnt].stage = pstate->normalized_zpos;
>                 pstates[cnt].pipe_id = dpu_plane_pipe(plane);
>
> +               dpu_pstate->needs_dirtyfb = needs_dirtyfb;
> +
>                 if (pipe_staged[pstates[cnt].pipe_id]) {
>                         multirect_plane[multirect_count].r0 =
>                                 pipe_staged[pstates[cnt].pipe_id];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ca75089c9d61..6565682fe227 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -902,7 +902,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>
>         if (pstate->aspace) {
>                 ret = msm_framebuffer_prepare(new_state->fb,
> -                               pstate->aspace);
> +                               pstate->aspace, pstate->needs_dirtyfb);
>                 if (ret) {
>                         DPU_ERROR("failed to prepare framebuffer\n");
>                         return ret;
> @@ -933,7 +933,8 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
>
>         DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
>
> -       msm_framebuffer_cleanup(old_state->fb, old_pstate->aspace);
> +       msm_framebuffer_cleanup(old_state->fb, old_pstate->aspace,
> +                               old_pstate->needs_dirtyfb);
>  }
>
>  static bool dpu_plane_validate_src(struct drm_rect *src,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 9d51dad5c6a5..50781e2d3577 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -25,6 +25,7 @@
>   * @pending:   whether the current update is still pending
>   * @plane_fetch_bw: calculated BW per plane
>   * @plane_clk: calculated clk per plane
> + * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
>   */
>  struct dpu_plane_state {
>         struct drm_plane_state base;
> @@ -37,6 +38,8 @@ struct dpu_plane_state {
>
>         u64 plane_fetch_bw;
>         u64 plane_clk;
> +
> +       bool needs_dirtyfb;
>  };
>
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> index 49bdabea8ed5..3e20f72d75ef 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>
>  #include "mdp4_kms.h"
>
> @@ -90,6 +91,20 @@ static const struct drm_plane_funcs mdp4_plane_funcs = {
>                 .atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>  };
>
> +static int mdp4_plane_prepare_fb(struct drm_plane *plane,
> +                                struct drm_plane_state *new_state)
> +{
> +       struct msm_drm_private *priv = plane->dev->dev_private;
> +       struct msm_kms *kms = priv->kms;
> +
> +       if (!new_state->fb)
> +               return 0;
> +
> +       drm_gem_plane_helper_prepare_fb(plane, new_state);
> +
> +       return msm_framebuffer_prepare(new_state->fb, kms->aspace, false);
> +}
> +
>  static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
>                                   struct drm_plane_state *old_state)
>  {
> @@ -102,7 +117,7 @@ static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
>                 return;
>
>         DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
> -       msm_framebuffer_cleanup(fb, kms->aspace);
> +       msm_framebuffer_cleanup(fb, kms->aspace, false);
>  }
>
>
> @@ -130,7 +145,7 @@ static void mdp4_plane_atomic_update(struct drm_plane *plane,
>  }
>
>  static const struct drm_plane_helper_funcs mdp4_plane_helper_funcs = {
> -               .prepare_fb = msm_atomic_prepare_fb,
> +               .prepare_fb = mdp4_plane_prepare_fb,
>                 .cleanup_fb = mdp4_plane_cleanup_fb,
>                 .atomic_check = mdp4_plane_atomic_check,
>                 .atomic_update = mdp4_plane_atomic_update,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index bb7d066618e6..b966cd69f99d 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -690,6 +690,8 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>         struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>                                                                           crtc);
> +       struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc_state);
> +       struct mdp5_interface *intf = mdp5_cstate->pipeline.intf;
>         struct mdp5_kms *mdp5_kms = get_kms(crtc);
>         struct drm_plane *plane;
>         struct drm_device *dev = crtc->dev;
> @@ -706,12 +708,18 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
>         DBG("%s: check", crtc->name);
>
>         drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> +               struct mdp5_plane_state *mdp5_pstate =
> +                               to_mdp5_plane_state(pstate);
> +
>                 if (!pstate->visible)
>                         continue;
>
>                 pstates[cnt].plane = plane;
>                 pstates[cnt].state = to_mdp5_plane_state(pstate);
>
> +               mdp5_pstate->needs_dirtyfb =
> +                       intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
> +
>                 /*
>                  * if any plane on this crtc uses 2 hwpipes, then we need
>                  * the crtc to have a right hwmixer.
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> index ac269a6802df..29bf11f08601 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> @@ -100,6 +100,11 @@ struct mdp5_plane_state {
>
>         /* assigned by crtc blender */
>         enum mdp_mixer_stage_id stage;
> +
> +       /* whether attached CRTC needs pixel data explicitly flushed to
> +        * display (ex. DSI command mode display)
> +        */
> +       bool needs_dirtyfb;
>  };
>  #define to_mdp5_plane_state(x) \
>                 container_of(x, struct mdp5_plane_state, base)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69afcbac8..b176338ab59b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_print.h>
>
>  #include "mdp5_kms.h"
> @@ -140,18 +141,34 @@ static const struct drm_plane_funcs mdp5_plane_funcs = {
>                 .atomic_print_state = mdp5_plane_atomic_print_state,
>  };
>
> +static int mdp5_plane_prepare_fb(struct drm_plane *plane,
> +                                struct drm_plane_state *new_state)
> +{
> +       struct msm_drm_private *priv = plane->dev->dev_private;
> +       struct msm_kms *kms = priv->kms;
> +       bool needs_dirtyfb = to_mdp5_plane_state(new_state)->needs_dirtyfb;
> +
> +       if (!new_state->fb)
> +               return 0;
> +
> +       drm_gem_plane_helper_prepare_fb(plane, new_state);
> +
> +       return msm_framebuffer_prepare(new_state->fb, kms->aspace, needs_dirtyfb);
> +}
> +
>  static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
>                                   struct drm_plane_state *old_state)
>  {
>         struct mdp5_kms *mdp5_kms = get_kms(plane);
>         struct msm_kms *kms = &mdp5_kms->base.base;
>         struct drm_framebuffer *fb = old_state->fb;
> +       bool needed_dirtyfb = to_mdp5_plane_state(old_state)->needs_dirtyfb;
>
>         if (!fb)
>                 return;
>
>         DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
> -       msm_framebuffer_cleanup(fb, kms->aspace);
> +       msm_framebuffer_cleanup(fb, kms->aspace, needed_dirtyfb);
>  }
>
>  static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
> @@ -437,7 +454,7 @@ static void mdp5_plane_atomic_async_update(struct drm_plane *plane,
>  }
>
>  static const struct drm_plane_helper_funcs mdp5_plane_helper_funcs = {
> -               .prepare_fb = msm_atomic_prepare_fb,
> +               .prepare_fb = mdp5_plane_prepare_fb,
>                 .cleanup_fb = mdp5_plane_cleanup_fb,
>                 .atomic_check = mdp5_plane_atomic_check,
>                 .atomic_update = mdp5_plane_atomic_update,
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 27c9ae563f2f..1686fbb611fd 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -5,7 +5,6 @@
>   */
>
>  #include <drm/drm_atomic_uapi.h>
> -#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include "msm_atomic_trace.h"
> @@ -13,20 +12,6 @@
>  #include "msm_gem.h"
>  #include "msm_kms.h"
>
> -int msm_atomic_prepare_fb(struct drm_plane *plane,
> -                         struct drm_plane_state *new_state)
> -{
> -       struct msm_drm_private *priv = plane->dev->dev_private;
> -       struct msm_kms *kms = priv->kms;
> -
> -       if (!new_state->fb)
> -               return 0;
> -
> -       drm_gem_plane_helper_prepare_fb(plane, new_state);
> -
> -       return msm_framebuffer_prepare(new_state->fb, kms->aspace);
> -}
> -
>  /*
>   * Helpers to control vblanks while we flush.. basically just to ensure
>   * that vblank accounting is switched on, so we get valid seqn/timestamp
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 57b0cd6f917e..9f68aa685ed7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -239,8 +239,6 @@ struct msm_format {
>
>  struct msm_pending_timer;
>
> -int msm_atomic_prepare_fb(struct drm_plane *plane,
> -                         struct drm_plane_state *new_state);
>  int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
>                 struct msm_kms *kms, int crtc_idx);
>  void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
> @@ -299,9 +297,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj);
>  void msm_gem_prime_unpin(struct drm_gem_object *obj);
>
>  int msm_framebuffer_prepare(struct drm_framebuffer *fb,
> -               struct msm_gem_address_space *aspace);
> +               struct msm_gem_address_space *aspace, bool needs_dirtyfb);
>  void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
> -               struct msm_gem_address_space *aspace);
> +               struct msm_gem_address_space *aspace, bool needed_dirtyfb);
>  uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
>                 struct msm_gem_address_space *aspace, int plane);
>  struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 4d34df5354e0..96b379a08327 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -18,16 +18,36 @@
>  struct msm_framebuffer {
>         struct drm_framebuffer base;
>         const struct msm_format *format;
> +
> +       /* Count of # of attached planes which need dirtyfb: */
> +       refcount_t dirtyfb;
>  };
>  #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
>
>  static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>                 const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
>
> +static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
> +                                  struct drm_file *file_priv, unsigned int flags,
> +                                  unsigned int color, struct drm_clip_rect *clips,
> +                                  unsigned int num_clips)
> +{
> +       struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
> +
> +       /* If this fb is not used on any display requiring pixel data to be
> +        * flushed, then skip dirtyfb
> +        */
> +       if (refcount_read(&msm_fb->dirtyfb) == 0)
> +               return 0;
> +
> +       return drm_atomic_helper_dirtyfb(fb, file_priv, flags, color,
> +                                        clips, num_clips);
> +}
> +
>  static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
>         .create_handle = drm_gem_fb_create_handle,
>         .destroy = drm_gem_fb_destroy,
> -       .dirty = drm_atomic_helper_dirtyfb,
> +       .dirty = msm_framebuffer_dirtyfb,
>  };
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -48,17 +68,19 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
>  }
>  #endif
>
> -/* prepare/pin all the fb's bo's for scanout.  Note that it is not valid
> - * to prepare an fb more multiple different initiator 'id's.  But that
> - * should be fine, since only the scanout (mdpN) side of things needs
> - * this, the gpu doesn't care about fb's.
> +/* prepare/pin all the fb's bo's for scanout.
>   */
>  int msm_framebuffer_prepare(struct drm_framebuffer *fb,
> -               struct msm_gem_address_space *aspace)
> +               struct msm_gem_address_space *aspace,
> +               bool needs_dirtyfb)
>  {
> +       struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
>         int ret, i, n = fb->format->num_planes;
>         uint64_t iova;
>
> +       if (needs_dirtyfb)
> +               refcount_inc(&msm_fb->dirtyfb);
> +
>         for (i = 0; i < n; i++) {
>                 ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &iova);
>                 drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
> @@ -70,10 +92,15 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
>  }
>
>  void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
> -               struct msm_gem_address_space *aspace)
> +               struct msm_gem_address_space *aspace,
> +               bool needed_dirtyfb)
>  {
> +       struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
>         int i, n = fb->format->num_planes;
>
> +       if (needed_dirtyfb)
> +               refcount_dec(&msm_fb->dirtyfb);
> +
>         for (i = 0; i < n; i++)
>                 msm_gem_unpin_iova(fb->obj[i], aspace);
>  }
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
