Return-Path: <linux-arm-msm+bounces-10864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E42852EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF4491F20D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C9F364B6;
	Tue, 13 Feb 2024 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3PvwoIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C8364A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823096; cv=none; b=WYRyqYRSYkpoT+968mErhBQw9MrQ15OUafkxbecsESN4KvMVZP4Z47qVLMmTNYE9f36gdB+TaJXYZznDwG17nSNH/iveEWUSOB6rcxN16QrjPDhaw1M/Hvr03+ZE3Kg+G6DSLbM0TuIPd7ewKDVUzb9ldVpigmaoq7veoOTRVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823096; c=relaxed/simple;
	bh=FthklSLXB2Gvouk6aluW9TYnxhA/T7a9jT2QvI6T/IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVqlgi5SVtGIDD3B7WVZXknXW0timRVw2riANjStxm0tmXEO67j5z+2LprjLVq4SrnJn/opIozy819zN165OKcfW//4g14YLQlGXDDWN8bfLsAqezQwdoHEdOcGfZbPfrBVBmpfNy64NcudfQ09ioSJ+58LSri/Grju1rAhpPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3PvwoIo; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso465161276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823093; x=1708427893; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f6L9sPVuw/xEO6Dhj1zgSlfDhHIbvMMFflBRHa07Z3s=;
        b=d3PvwoIoL2BfcUm4DlnJzZbmxbLp1JZLNZmcJu2k0pgnM7plWC52hoK036gkU4NiC9
         dUN/Sbr1Xw41GrGPhF7j2+4QYybjxutrlP/X+LOb2v+iNivdoW2nI8JTb698JZwUUp87
         i+j1H4NiXL1ICXaTH33s/DBgmo+IEZrSN5Krp88wx7Pn/fo7KyT2PYPGN0jodAjtlPtf
         ijH7BRWN24gIXIUh39S/pWN9XBlNVqPWP9Zv42FysjLRzFk1TBJaa5SyRaLrkVquQ07b
         KUJt4zC8rnqQM2DgEcaBx+8k16Ov39vWHT5KwR/eqg5f5889hi7MIfsPTIAfWANqgw5U
         X2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823093; x=1708427893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6L9sPVuw/xEO6Dhj1zgSlfDhHIbvMMFflBRHa07Z3s=;
        b=nndSTAdH4QzUYEDan+sHN8QEPOP4d5evkIiJL3fuqJIIShbOEorT9Ubh7+vhYWMDkC
         L5nKBeLo66pwlMdWmde0yHWNexO1DPszHQPK8qrIjbrnvN2jQnmy//8tn8AWlDlnB4Hw
         uFEzfVVu+UDBKkpEM+hQH/LBVzelRg/aqqEpYZAVNhCZgreAKlJvzHliHocBnICeYMJj
         PG5HLoDGW7NLrI7woQcCCX2rZ9nTdOCsGXwNmUj/qcU2LgWWHG6qiv59BW4W7TmWgWxH
         scSva3itOfbXVYcDIoWLPI6Jt3OgMj1vuhtjqtR+hQ67XbGeG7WL+/MbLWabKkI6b8k2
         sBkA==
X-Forwarded-Encrypted: i=1; AJvYcCX0rUZlIBd7Ws1/zUYm5KSy+v79yDnuBiFwdnzA3RysFT3LCMfZol1vz7k6GknshC9BfOOoHBCjvgdLQ2Zs+/f9msAlxeZLKl862oT08w==
X-Gm-Message-State: AOJu0Yzlkr8L4GOx2wJytQNan+TR3L7AdTppeycxf9Qm8X+6ynJdii6K
	UzXehhWtq9iFcGqDZ32ueNCGaHB9BM7xAGZi/2TefuC1QsAq8hjePx6jSR6vhMJhVRQvJGswXRw
	a2CW3CuyFdNhHBxbPpCUKj2yOOGzh4j6vZWxyrw==
X-Google-Smtp-Source: AGHT+IFg4epJvCP1Qw8gt9ZyFhF+q9oJBh/4R2edV6TBPLI//eGf4oeTN91oQKPOcGjYVXfTHUvqHl1GDBNQODY+ums=
X-Received: by 2002:a25:6e03:0:b0:dc6:c252:75fe with SMTP id
 j3-20020a256e03000000b00dc6c25275femr1453941ybc.10.1707823093581; Tue, 13 Feb
 2024 03:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-17-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:18:02 +0200
Message-ID: <CAA8EJprttbMgM=HEwctePZOwKny+nM2=qRJsPWmP4Ar0H8ATEg@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
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

Do we really need to check for phys_enc->hw_cdm here?

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
> index f562beb6f7971..3f102b2813ca8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -413,8 +413,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
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
> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);

Please move if(hw_cdm) inside dpu_encoder_get_drm_fmt().

> +       fmt = dpu_get_dpu_format(fmt_fourcc);

Can this be moved into dpu_encoder_helper_phys_setup_cdm() ? Or maybe
we can move both calls into the helper? I mean, fmt_fourcc is not used
at all if the CDM is not used.

>
>         DPU_DEBUG_VIDENC(phys_enc, "\n");
>
> @@ -423,6 +430,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>
>         dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>
> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
> +
>         dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>
>         /*
> @@ -438,6 +447,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
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

