Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCEB4CC8B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236771AbiCCWU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbiCCWU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:20:27 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AF765E1
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:19:40 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so7431636ooi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4t2LjIcb3Y5PcJA9EnXEeCDewlAkwl6nfPC5xbFyhKc=;
        b=NgaiNlip48ccTU/Z0abVKJcjoPdp8zPOygUKZS/0o2aqQyQ/lDXgGyrxJpMcFLyZZh
         NjMB2sg4KynfrDfUzHPeOsU8fEEw6XtA73/wlYxL0R+iVX1kSaNOcrBPtazaIP3KHSq9
         Ukm2NkyT+qowu3tTC1MdNa13BQxK7istHbD78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4t2LjIcb3Y5PcJA9EnXEeCDewlAkwl6nfPC5xbFyhKc=;
        b=pYHwJwzLPMdaO6BHjOJk/vHdhKiwugOWFUoLginlNrb0ZFYiJYUEuOWNHzWBFb8G16
         Lr0Io9PtGgCXF+B75j7QiMg3+zIXwM3jwUubQrBcrc0jReEhKbC1VFbIUEZfrqCEMw8I
         qz1pwsjHpUNLzRBevQSGpg8mPTifHZUkCpoRz7Y1hOKaCzJ9ZheL8KWH1enV6Y6gcuPh
         jkkGQOJQZD2creZUIKlin6QH2BXc5UOok7aObdRlvRZt9BSS+R0KLGIRVPZpbZxb/d34
         RDZlUp7kaIOqguNXGicIafhJnRdXdt08E6/k2JCJ8F6oi520cNWSkFtdT9rO9t7iVpIz
         jkDA==
X-Gm-Message-State: AOAM532NomRGZV5fV4CQo7jZnM2Na0d3zYa9XlSh4XD7CaAroXe0YMF3
        RgCXQK2kcaSd/47Usen9uzFTKBTFBPBskOkjxOmIcg==
X-Google-Smtp-Source: ABdhPJwhCrFSKbX4MZ7r7kmi2XrRTYUuOB1reA9ZGnf98wKu3zinmAj5zZ486INBN1KJl9/++UW1xbL/8eJ3aFjwtLI=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr5734313oab.32.1646345979709; Thu, 03
 Mar 2022 14:19:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:19:39 -0800
MIME-Version: 1.0
In-Reply-To: <1646307779-5654-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1646307779-5654-1-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:19:39 -0800
Message-ID: <CAE-0n50m=fxv0Va_=BkZDsw_HDuwfRq5WLR5mttgOnrFatrB8g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/disp/dpu1: add inline rotation support for
 sc7280 target
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-03-03 03:42:59)
> - Some DPU versions support inline rot90. It is supported only for
> limited amount of UBWC formats.
> - There are two versions of inline rotators, v1 (present on sm8250 and
> sm7250) and v2 (sc7280). These versions differ in the list of supported
> formats and in the scaler possibilities.
>
> Changes in RFC:
> - Rebase changes to the latest code base.
> - Append rotation config variables with v2 and
> remove unused variables.(Dmitry)
> - Move pixel_ext setup separately from scaler3 config.(Dmitry)
> - Add 270 degree rotation to supported rotation list.(Dmitry)
>
> Changes in V2:
> - Remove unused macros and fix indentation.
> - Add check if 90 rotation is supported and add supported rotations to rot_cfg.
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

Missing a Co-developed-by tag here?

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  44 +++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  17 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 108 +++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
>  4 files changed, 134 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index aa75991..7cd07be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -25,6 +25,9 @@
>  #define VIG_SM8250_MASK \
>         (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>
> +#define VIG_SC7280_MASK \
> +       (VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
> +
>  #define DMA_SDM845_MASK \
>         (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>         BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -177,6 +180,11 @@ static const uint32_t plane_formats_yuv[] = {
>         DRM_FORMAT_YVU420,
>  };
>
> +static const uint32_t rotation_v2_formats[] = {

Just use u32 when in the kernel. It's shorter and is the same.

> +       DRM_FORMAT_NV12,
> +       /* TODO add formats after validation */
> +};
> +
>  /*************************************************************
>   * DPU sub blocks config
>   *************************************************************/
> @@ -464,8 +472,7 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   *************************************************************/
>
>  /* SSPP common configuration */
> -
> -#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
> +#define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
>         { \
>         .maxdwnscale = MAX_DOWNSCALE_RATIO, \
>         .maxupscale = MAX_UPSCALE_RATIO, \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 31af04a..269eb45 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -312,6 +314,20 @@ struct dpu_qos_lut_tbl {
>  };
>
>  /**
> + * struct dpu_rotation_cfg - define inline rotation config
> + * @rot_maxheight: max pre rotated height allowed for rotation
> + * @rot_num_formats: count of the formats

number of elements in @rot_format_list

> + * @rot_format_list: list of supported rotator formats
> + * @rot_supported: allowed rotations
> + */
> +struct dpu_rotation_cfg {
> +       u32 rot_maxheight;
> +       u32 rot_num_formats;

size_t?

> +       const u32 *rot_format_list;
> +       u32 rot_supported;
> +};
> +
> +/**
>   * struct dpu_caps - define DPU capabilities
>   * @max_mixer_width    max layer mixer line width support.
>   * @max_mixer_blendstages max layer mixer blend stages or
> @@ -387,6 +403,7 @@ struct dpu_sspp_sub_blks {
>         u32 num_formats;
>         const u32 *virt_format_list;
>         u32 virt_num_formats;
> +       const struct dpu_rotation_cfg *rotation_cfg;

Any kernel-doc update for this new member?

>  };
>
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ca75089..031a0ff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -528,11 +528,19 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>                 struct dpu_plane_state *pstate,
>                 uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>                 struct dpu_hw_scaler3_cfg *scale_cfg,
> -               struct dpu_hw_pixel_ext *pixel_ext,
>                 const struct dpu_format *fmt,
>                 uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
>  {
>         uint32_t i;
> +       bool inline_rotation = (pstate->rotation & DRM_MODE_ROTATE_90);

Drop useless parenthesis please.

> +
> +       /*
> +        * For inline rotation cases, scaler config is post-rotation,
> +        * so swap the dimensions here. However, pixel extension will
> +        * need pre-rotation settings.
> +        */
> +       if (inline_rotation)
> +               swap(src_w, src_h);
>
>         scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
>                 mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
> @@ -591,6 +594,24 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>         scale_cfg->enable = 1;
>  }
>
> +static void _dpu_plane_setup_pixel_ext(struct dpu_plane_state *pstate,
> +                               struct dpu_hw_scaler3_cfg *scale_cfg,
> +                               struct dpu_hw_pixel_ext *pixel_ext)
> +{
> +       int i = 0;

int i;

> +       bool inline_rotation = (pstate->rotation & DRM_MODE_ROTATE_90);
> +
> +       if (!scale_cfg && !scale_cfg->enable)

!scale_cfg || !scale_cfg->enable

> +               return;
> +
> +       for (i = 0; i < DPU_MAX_PLANES; i++) {
> +               pixel_ext->num_ext_pxls_top[i] = inline_rotation ?
> +                               scale_cfg->src_width[i] : scale_cfg->src_height[i];
> +               pixel_ext->num_ext_pxls_left[i] = inline_rotation ?
> +                               scale_cfg->src_height[i] : scale_cfg->src_width[i];
> +       }
> +}
> +
>  static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>         {
>                 /* S15.16 format */
> @@ -1035,6 +1061,42 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 return -E2BIG;
>         }
>
> +       if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
> +               (pipe_hw_caps->sblk->rotation_cfg)) {

Drop useless parenthesis please

> +               rotation = drm_rotation_simplify(new_plane_state->rotation,
> +                                       pipe_hw_caps->sblk->rotation_cfg->rot_supported);

pipe_hw_caps->sblk is used multiple times. Make it into a local
variable? Also make this whole chunk into a function to reduce
indentation?

> +
> +               if (rotation & DRM_MODE_ROTATE_90) {
> +                       bool found = false;
> +                       u32 i, num_formats;

unsigned int i, num_formats;

or

size_t

> +                       const u32 *supported_formats;
> +
> +                       if ((drm_rect_width(&src) >

Remove useless parenthesis

> +                               pipe_hw_caps->sblk->rotation_cfg->rot_maxheight)) {
> +                               DPU_DEBUG_PLANE(pdpu,
> +                               "invalid height for inline rot:%d max:%d\n",
> +                               src.y2, pipe_hw_caps->sblk->rotation_cfg->rot_maxheight);

Indent the above two lines one more time so that they don't align
exactly with DPU_DEBUG_PLANE.

> +                               return -EINVAL;
> +                       }
> +
> +                       supported_formats = pipe_hw_caps->sblk->rotation_cfg->rot_format_list;
> +                       num_formats = pipe_hw_caps->sblk->rotation_cfg->rot_num_formats;
> +
> +                       for (i = 0; i < num_formats; i++) {
> +                               /* check for valid formats supported by inline rotation */
> +                               if (fmt->base.pixel_format == supported_formats[i] &&
> +                                       DPU_FORMAT_IS_UBWC(fmt))
> +                                       found = true;

break?

> +                       }
> +
> +                       if (!found || !num_formats) {
> +                               DPU_DEBUG_PLANE(pdpu,
> +                               "supported_format not found num:%d\n", num_formats);

Same alignment request. Also, put it on the same line as DPU_DEBUG_PLANE
so we can find it with a grep for that macro.

> +                               return -EINVAL;
> +                       }
> +               }
> +       }
> +       pstate->rotation = rotation;
>         pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>
>         return 0;
> @@ -1150,21 +1212,18 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                                 pstate->multirect_mode);
>
>         if (pdpu->pipe_hw->ops.setup_format) {
> -               unsigned int rotation;
>
>                 src_flags = 0x0;
>
> -               rotation = drm_rotation_simplify(state->rotation,
> -                                                DRM_MODE_ROTATE_0 |
> -                                                DRM_MODE_REFLECT_X |
> -                                                DRM_MODE_REFLECT_Y);
> -
> -               if (rotation & DRM_MODE_REFLECT_X)
> +               if (pstate->rotation & DRM_MODE_REFLECT_X)
>                         src_flags |= DPU_SSPP_FLIP_LR;
>
> -               if (rotation & DRM_MODE_REFLECT_Y)
> +               if (pstate->rotation & DRM_MODE_REFLECT_Y)
>                         src_flags |= DPU_SSPP_FLIP_UD;
>
> +               if (pstate->rotation & DRM_MODE_ROTATE_90)
> +                       src_flags |= DPU_SSPP_ROT_90;
> +

This would be smaller if

	rotation = pstate->rotation

replaced drm_rotation_simplify(). Please do that to minimize code
reviewer.

>                 /* update format */
>                 pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
>                                 pstate->multirect_index);
