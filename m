Return-Path: <linux-arm-msm+bounces-11144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DD855CE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57A4AB32DAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 08:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D381134CA;
	Thu, 15 Feb 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynTb+5Z4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0C134C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707986745; cv=none; b=ZjeupYBVfwOVco8BgjuwF2f7jYKdhWkUfslKdzdXXmOqwCqRn8DFVVS0MEE91L0JuP7KqwqEU9xfP+eKNfWEHdsK6kCS7dvtDfHSd3z/olXTEOPxP2DPfUpxR6nBLVknMjftHLDsxPseyTSYi+VlNul+tAeDaDOC6QA4uCJWLHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707986745; c=relaxed/simple;
	bh=Mf0wGbS0opYA6iuXCxvYQ/8T/vzLV1AfCwdRl7sKHa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOoYvC+CqGfRRXdR7ope7g8DAkvWpIqynIjWCF+XRxXrjAPdD0gQI5LtkdDQtX01RFEimjfPN8g9Z8i0ptv7Hj18t+Nh2IKyQDO71BVJNtxRhTVRTjO59alKB2N7fABqeB16Qwxnbin+tdWaFFb6UjrmRMuT8oOwFAMLdGLH+VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ynTb+5Z4; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60790e62f90so6537917b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707986742; x=1708591542; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IDB6oJU318rjrhCQ1hGZkP4wdh542f+aaw58PBz7AZ0=;
        b=ynTb+5Z41p7Q0wGNxsbYtMADWD08GDCPHepSTIPD68mbibdzee/tveRfkxDJqjVSYA
         9qviiN0K6YZ+eDtwPqyBpqM0hMrKPPoKUL5j56XIcVD5ZfR7oylXWxjB5ydqUNPO1c2M
         zKOOU0qDJ1r4ccsS6lfcOUSMODJn3SGnqJHYbUa0bz8sAI1CILsvRub23HuaCanAr6Rw
         QbZ/xFVP23RA65BcvjdMLvgxyMmYDjA6zP2rE5kP24CKCLEQiJLOPLAqGv+5u23AZkGl
         Mp8NjvpDRAvJe3QeVaUD/VDzRaDUScnszGyMXywz3S3BK+NXM0YiuovWTEakXHS2SlK9
         /h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707986742; x=1708591542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDB6oJU318rjrhCQ1hGZkP4wdh542f+aaw58PBz7AZ0=;
        b=J2CUTW5bfi80MaMBIn0cdMoKJWCYuPl5PBDLp+0eFIt4WHo9ZX+48BKIrWTKULTo1A
         IG8IdK8riES26arP8m9FFwh5m7w89n7AZkMVSCVAXL6mn0Zu072u1K3/ZPssZbBJ3LeU
         sKAUFh2sDrwQaLHoG3EyeM2up4ljCzftE2aDwSWIMpE4oG3Vq85+RDk6iEsXn1oL+2ub
         ZMqTCu6fgSM4t3BntJLU9F/AFMDwM4FwRqjtRrVS9A2PRsFPw0bjXHrhO8Izh97gGdMj
         /Cv+awT4cy7dES9QuiMk+cdvhiCvLGy2VMJNYEIiabfSZGjQeegHedSU7umAq7+BbI4J
         27Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUdr6RtBffu39BmiERvIYoSzkl+GO1/2XhBHLuY607gIcih5YmwS2sSqTMtOXerQTGwH377dzyvKSt9H8xI//+Y88AjrtA73h6UXTEuXw==
X-Gm-Message-State: AOJu0YyIaHSbBX7pDFFSc3CNuq8zYsvLKXkFY+jrc6nXvlqIQST+wzb1
	weWsWsE5hmNdTvNq8FM8vrefLlr5YQbFNRwMc0hVJDki/Z8ixbW5IbVLGhv+4WOd+zFhxoA4VFP
	F1aNqP+1R8e2TaTnLeoMG+pBRpyjZWFlOD5SYNw==
X-Google-Smtp-Source: AGHT+IFzc71r1OL/JY6adDM6klR65tkU0P7RysIBbCnoPUE2T9XlewvFmLVCz330Isl1bQG7NkJmffZ0Wr+GEFrCTbo=
X-Received: by 2002:a05:6902:1ac2:b0:dcd:8a5:d5b8 with SMTP id
 db2-20020a0569021ac200b00dcd08a5d5b8mr1106283ybb.49.1707986742341; Thu, 15
 Feb 2024 00:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com> <20240214180347.1399-17-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:45:32 +0200
Message-ID: <CAA8EJppvxr_Cc6xYkrTPQtiDDqMrErByvz9a532ccbdDgsM7GQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder format programming in the case of video mode for DP
> to accommodate CDM related changes.
>
> Changes in v2:
>         - Move timing engine programming to a separate patch from this
>           one
>         - Move update_pending_flush_periph() invocation completely to
>           this patch
>         - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>           calls drm_mode_is_420_only() instead of doing additional
>           unnecessary checks
>         - Create new functions msm_dp_needs_periph_flush() and it's
>           supporting function dpu_encoder_needs_periph_flush() to check
>           if the mode is YUV420 and VSC SDP is enabled before doing a
>           peripheral flush
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>  drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>  5 files changed, 101 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7e7796561009a..6280c6be6dca9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>         15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>  };
>
> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
> +{
> +       struct drm_encoder *drm_enc;
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct drm_display_info *info;
> +       struct drm_display_mode *mode;
> +
> +       drm_enc = phys_enc->parent;
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       info = &dpu_enc->connector->display_info;
> +       mode = &phys_enc->cached_mode;
> +
> +       if (drm_mode_is_420_only(info, mode))
> +               return DRM_FORMAT_YUV420;
> +
> +       return DRM_FORMAT_RGB888;
> +}
> +
> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
> +{
> +       struct drm_encoder *drm_enc;
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct msm_display_info *disp_info;
> +       struct msm_drm_private *priv;
> +       struct drm_display_mode *mode;
> +
> +       drm_enc = phys_enc->parent;
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       disp_info = &dpu_enc->disp_info;
> +       priv = drm_enc->dev->dev_private;
> +       mode = &phys_enc->cached_mode;
> +
> +       return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
> +              msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
> +}
>
>  bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index f43d57d9c74e1..211a3d90eb690 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   */
>  unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>
> +/**
> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
> +
> +/**
> + * dpu_encoder_needs_periph_flush - return true if physical encoder requires
> + *     peripheral flush
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
> +
>  /**
>   * dpu_encoder_helper_split_config - split display configuration helper function
>   *     This helper function may be used by physical encoders to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index f02411b062c4c..e29bc4bd39208 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -415,8 +415,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>  static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>  {
>         struct dpu_hw_ctl *ctl;
> +       struct dpu_hw_cdm *hw_cdm;
> +       const struct dpu_format *fmt = NULL;
> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
>
>         ctl = phys_enc->hw_ctl;
> +       hw_cdm = phys_enc->hw_cdm;
> +       if (hw_cdm)

I thought that Abhinav proposed to drop the if(hw_cdm) condition here.
LGTM otherwise.

> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
> +       fmt = dpu_get_dpu_format(fmt_fourcc);
>
>         DPU_DEBUG_VIDENC(phys_enc, "\n");
>
> @@ -425,6 +432,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>
>         dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>
> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
> +
>         dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>
>         /*
> @@ -440,6 +449,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>         if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>                 ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>
> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> +
> +       /*
> +        * Peripheral flush must be updated whenever flushing SDP packets is needed.
> +        * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
> +        */
> +       if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
> +               ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> +
>  skip_flush:
>         DPU_DEBUG_VIDENC(phys_enc,
>                 "update pending flush ctl %d intf %d\n",
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4b04388719363..ebcc76ef1d590 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
>         platform_driver_unregister(&dp_display_driver);
>  }
>
> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode)
> +{
> +       struct dp_display_private *dp;
> +       const struct drm_display_info *info;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> +       info = &dp_display->connector->display_info;
> +
> +       return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
> +}
> +
> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode)
> +{
> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
> +}
> +
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>  {
>         struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 16a7cbc0b7dd8..b876ebd48effe 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                          struct drm_encoder *encoder);
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
> -
> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode);
> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>
>  #else
> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
>  {
>  }
>
> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +                                            const struct drm_display_mode *mode)
> +{
> +       return false;
> +}
> +
> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> +                                            const struct drm_display_mode *mode)
> +{
> +       return false;
> +}
> +
>  static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>  {
>         return false;
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

