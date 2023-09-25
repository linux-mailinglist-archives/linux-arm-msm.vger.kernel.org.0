Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 364EE7AD61A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 12:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjIYKfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 06:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjIYKfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 06:35:11 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE7EB3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:35:04 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59bc956b029so72323927b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638104; x=1696242904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaXJJ8nVHztTAIAYbpwSJZ/6Vi3Ys0Sfbd7EeBK57WQ=;
        b=dH6OTN9qTcVJqF8/C4TY2H6ccOgxG+nQXZXYepqBleICuEhYkLs+s2YXwks+N1+vAW
         x5d9JesnspHobFrDgsR4aFHiv0riRVHe+asmDQOkeUJgMy+er8q6y1510R8wrNPGb+qD
         iVGHAIYvIem7IO6emdOIy4gsDKwdqDfDCIKohp8+BoCzE8TYFAt4TrikorhzunCuyoyN
         kwad1ilEwct+2YqY9uYxG1VYulBK9nD35n+ulHrkjO0pjNSEGeStjtDCmpqA1oGqicU0
         fBXIYL2obU3XRbNAnoORtJt4Yg67O116TbykHVNPDv4D/Wdp+n/O9O471rXWIOV9gDEf
         1aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638104; x=1696242904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaXJJ8nVHztTAIAYbpwSJZ/6Vi3Ys0Sfbd7EeBK57WQ=;
        b=Xk7o0sxFdnRyqzvc3Qp+OKIZm/dk1UMrIYYLP5Qk8aijdwNfFSjX2RDcLQsgxv31Vm
         0A0LnqKcOsoabi94SxwZtuU6e9C6S7lXSkHkXbFyC0mPmfUNsD49pa8bhu3vZccZRaix
         JefnpXKSOOyIAarBwk+KyVIc1NRcX6gW2N79oR+wE07brS/dyWWYMxd/8S83mG4cEd/q
         F4XKYwfoCf/pb1OpV/Na21xKEOEtmv1cMsVjgC43f8VNTPNltJfxQO8crZNwh5Y4BO1t
         Lafg1uNOYD64CuoT3hv9Kbaj57fHa98CsFqVGgaQAsrZ2YPyUe7ZTVv/0UGVhg9omY7/
         BVYA==
X-Gm-Message-State: AOJu0Yxc0Km272G/LbO/gHh7396U9vytDkuJIZuHLzDhl/ZcKCRBXIRQ
        /YOfxCptfqJrmBlxf5/yIRuXSMVp2ojOs0kxlpJqlg==
X-Google-Smtp-Source: AGHT+IGrbyEUltQPUjUpCD+BkCXyKLkEZTcGnoTcl/FQO2ImgXXXiStiF0PC1jRl1ouEnQ0iEZat0qQwZavSoOSosbU=
X-Received: by 2002:a05:690c:e1c:b0:59f:4e6d:b56a with SMTP id
 cp28-20020a05690c0e1c00b0059f4e6db56amr5547142ywb.2.1695638103990; Mon, 25
 Sep 2023 03:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com> <20230828-solid-fill-v6-9-a820efcce852@quicinc.com>
In-Reply-To: <20230828-solid-fill-v6-9-a820efcce852@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 13:34:43 +0300
Message-ID: <CAA8EJpq4FE5AxOAYN+cQM3PB+cvvEVHTn25GONjT7R4d6J1U6A@mail.gmail.com>
Subject: Re: [PATCH RFC v6 09/10] drm/msm/dpu: Use DRM solid_fill property
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        quic_abhinavk@quicinc.com, ppaalanen@gmail.com,
        contact@emersion.fr, laurent.pinchart@ideasonboard.com,
        sebastian.wick@redhat.com, ville.syrjala@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Aug 2023 at 03:06, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
> determine if the plane is solid fill. In addition drop the DPU plane
> color_fill field as we can now use drm_plane_state.solid_fill instead,
> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
> allow userspace to configure the alpha value for the solid fill color.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 +++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 114c803ff99b..639ecbeeacf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -42,7 +42,6 @@
>  #define SHARP_SMOOTH_THR_DEFAULT       8
>  #define SHARP_NOISE_THR_DEFAULT        2
>
> -#define DPU_PLANE_COLOR_FILL_FLAG      BIT(31)
>  #define DPU_ZPOS_MAX 255
>
>  /*
> @@ -82,7 +81,6 @@ struct dpu_plane {
>
>         enum dpu_sspp pipe;
>
> -       uint32_t color_fill;
>         bool is_error;
>         bool is_rt_pipe;
>         const struct dpu_mdss_cfg *catalog;
> @@ -606,19 +604,35 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
>         _dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
>  }
>
> +static uint32_t _dpu_plane_get_abgr_fill_color(struct drm_plane_state *state)
> +{
> +       struct drm_solid_fill solid_fill = state->solid_fill;
> +
> +       uint32_t ret = 0;
> +       uint8_t a = state->alpha & 0xFF;
> +       uint8_t b = solid_fill.b >> 24;
> +       uint8_t g = solid_fill.g >> 24;
> +       uint8_t r = solid_fill.r >> 24;
> +
> +       ret |= a << 24;
> +       ret |= b << 16;
> +       ret |= g << 8;
> +       ret |= r;
> +
> +       return ret;
> +}
> +
>  /**
>   * _dpu_plane_color_fill - enables color fill on plane
>   * @pdpu:   Pointer to DPU plane object
>   * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
>   * @alpha:  8-bit fill alpha value, 255 selects 100% alpha

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:632: warning: Excess
function parameter 'alpha' description in '_dpu_plane_color_fill'


>   */
> -static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
> -               uint32_t color, uint32_t alpha)
> +static void _dpu_plane_color_fill(struct dpu_plane *pdpu, uint32_t color)
>  {
>         const struct dpu_format *fmt;
>         const struct drm_plane *plane = &pdpu->base;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
> -       u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
>
>         DPU_DEBUG_PLANE(pdpu, "\n");
>
> @@ -633,11 +647,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>
>         /* update sspp */
>         _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
> -                                  fill_color, fmt);
> +                                  color, fmt);
>
>         if (pstate->r_pipe.sspp)
>                 _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> -                                          fill_color, fmt);
> +                                          color, fmt);
>  }
>
>  static int dpu_plane_prepare_fb(struct drm_plane *plane,
> @@ -976,10 +990,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>          */
>         if (pdpu->is_error)
>                 /* force white frame with 100% alpha pipe output on error */
> -               _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> -               /* force 100% alpha */
> -               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +               _dpu_plane_color_fill(pdpu, 0xFFFFFFFF);
> +       else if (drm_plane_solid_fill_enabled(plane->state))
> +               _dpu_plane_color_fill(pdpu, _dpu_plane_get_abgr_fill_color(plane->state));
>         else {
>                 dpu_plane_flush_csc(pdpu, &pstate->pipe);
>                 dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> @@ -1024,7 +1037,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>         }
>
>         /* override for color fill */
> -       if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> +       if (drm_plane_solid_fill_enabled(plane->state)) {
>                 _dpu_plane_set_qos_ctrl(plane, pipe, false);
>
>                 /* skip remaining processing on color fill */
>
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
