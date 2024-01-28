Return-Path: <linux-arm-msm+bounces-8686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22483F443
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E70628327A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0BF8F61;
	Sun, 28 Jan 2024 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRZ9faZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C98F4E
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706421356; cv=none; b=Ig8AdxbgcYLRUHYnKTXKWCYzrhxBn0ze3jLjMhrtePwK1eKG/cJMPmpieqejWBUibtLx/xZyvLU2BqiAP2AEFPMhMmB+E+Y/kO9PoePM6gRnTdu6Fhce3xO7rsVB0KvrbFGQys+FOIHPBPoHMxDqim3j402Q2n7vohPDyAQ33iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706421356; c=relaxed/simple;
	bh=Lj2c8DkjeU8HkDJLLCLSz+lUXBMHgWDppxpb2Ht2Z8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqBeJGCQs9Rw0cHBl8EYUcJZetuxQg7UwddWf+S8ctD/No4Wi3tMgxA5SAMbq7BkeM1IB8n2pVBYaulDywlJH61/vf7cy9Bvv/1ezBpO7zem/dlAYolXZcyVibhy7oJho0tbsJOLrQcaWojXSSAHAWJlRlM8athiHRZypNeA9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRZ9faZ3; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-602c714bdbeso12630387b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 21:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706421354; x=1707026154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GoyXWuZuNIYb2AEQYAXtq1yea8sURCjpiGY3DNRMjFk=;
        b=RRZ9faZ3e/t4HeRhBZD40qe1phE5YpmGw4agWciLTbue4AFpVtmmEoyPrY8zIZ4E/q
         TWjIiL6hitSzLQlPlSMob7dUHEzGb21Oqq4W+a9EZvhLq9k/0z1J1o5vhHN9O55JQqeb
         /x88QBAKbOGynpkFDz5kSJ7mjOeINeDPNeXbrHueYCCZsxUXWCSnglVPdK6u8QYiVbvQ
         ibnLUcMMjivMYrzePobj89Wl+JwyM5cQW78trBHwvFCWWb1C/y6js0QvdgP81DoOsNXx
         SPwsCmqqxHa8ocH9MmWayJJdMGTBVyvRPGny+sk1+O6Ttrc3Gs23+/OK57eQ/K+neMiL
         bz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706421354; x=1707026154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoyXWuZuNIYb2AEQYAXtq1yea8sURCjpiGY3DNRMjFk=;
        b=KHo1BSaBtzwNHvO81sYklcs1/6idyd1ntfJAvdMjweQgRR9SYDHz4vFAU07uF1uGh0
         dyh7kfmH3vP3ua34jyYyxFrJcocASf77Q6EbS0AMPAGyiLg6Pr/1rxmYzsBVSyfpHi4U
         3yjm3YHMR+mf/XY6nkmMsq9yw9cLKbTICPjWWWfaQfd+QVEr5n63R7hcUXFkwVfxaqem
         LdeOTT4mMYfE0v1fllGkyqqPFmUa4eUEQCHZoCHxHb7zpcS8Es3C+ZrY0USsNCr/5Lla
         54k7+ZsodFC/UYXb1Wpy4M62cLSvoTyUY3+IZVj9GP1n//xKiIkG8hEEMVtqjWxlAqEV
         pp1A==
X-Gm-Message-State: AOJu0Yzrx8NHokE6WsFdzFyvIRyPmsRXSO5mzd0DvFtWwdUdJZSR6ZJd
	KSentzKVc+S7P4F1aRwUmle23j3UjKnC+2z28KSstMdY1DUkZWbfvYM0mOvnqpMIdOJDbXU7OFr
	Tbv7PMuYUR57Fom9GEcVlTYYecE81/m2AY5Tt/A==
X-Google-Smtp-Source: AGHT+IHkSqAKYfzVsj6hVNVsU4hjWyhT1c0XzYouiW/wnj/O9gADHq1PbKAwRnHsSW6Bm37v49IKgr8/jRt5EaK4Paw=
X-Received: by 2002:a81:520a:0:b0:5ff:79bd:ea34 with SMTP id
 g10-20020a81520a000000b005ff79bdea34mr1420288ywb.49.1706421353712; Sat, 27
 Jan 2024 21:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-15-quic_parellan@quicinc.com> <52674357-2135-4784-a371-e7809b632c19@linaro.org>
 <d1679d6f-a388-2a13-2924-1e6040217c01@quicinc.com>
In-Reply-To: <d1679d6f-a388-2a13-2924-1e6040217c01@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:55:42 +0200
Message-ID: <CAA8EJppPFuP4w-OAi0hDE36tjPXOHpigg1PMyzhkOTLL-q0VMQ@mail.gmail.com>
Subject: Re: [PATCH 14/17] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 07:48, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:57 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Adjust the encoder format programming in the case of video mode for DP
> >> to accommodate CDM related changes.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 16 +++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 +++++
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 35 ++++++++++++++++---
> >>   drivers/gpu/drm/msm/dp/dp_display.c           | 12 +++++++
> >>   drivers/gpu/drm/msm/msm_drv.h                 |  9 ++++-
> >>   5 files changed, 75 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index b0896814c1562..99ec53446ad21 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -222,6 +222,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >>   };
> >>   +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> >> const struct drm_display_mode *mode)
> >> +{
> >> +    const struct dpu_encoder_virt *dpu_enc;
> >> +    const struct msm_display_info *disp_info;
> >> +    struct msm_drm_private *priv;
> >> +
> >> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +    disp_info = &dpu_enc->disp_info;
> >> +    priv = drm_enc->dev->dev_private;
> >> +
> >> +    if (disp_info->intf_type == INTF_DP &&
> >> + msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]],
> >> mode))
> >
> > This should not require interacting with DP. If we got here, we must
> > be sure that 4:2:0 is supported and can be configured.
> Ack. Will drop this function and only check for if the mode is YUV420.
> >
> >> +        return DRM_FORMAT_YUV420;
> >> +
> >> +    return DRM_FORMAT_RGB888;
> >> +}
> >>     bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> >> *drm_enc)
> >>   {
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> index 7b4afa71f1f96..62255d0aa4487 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> @@ -162,6 +162,14 @@ int dpu_encoder_get_vsync_count(struct
> >> drm_encoder *drm_enc);
> >>    */
> >>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> >> *drm_enc);
> >>   +/**
> >> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> >> + * @drm_enc:    Pointer to previously created drm encoder structure
> >> + * @mode:    Corresponding drm_display_mode for dpu encoder
> >> + */
> >> +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> >> +                const struct drm_display_mode *mode);
> >> +
> >>   /**
> >>    * dpu_encoder_get_crc_values_cnt - get number of physical encoders
> >> contained
> >>    *    in virtual encoder that can collect CRC values
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index e284bf448bdda..a1dde0ff35dc8 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -234,6 +234,7 @@ static void
> >> dpu_encoder_phys_vid_setup_timing_engine(
> >>   {
> >>       struct drm_display_mode mode;
> >>       struct dpu_hw_intf_timing_params timing_params = { 0 };
> >> +    struct dpu_hw_cdm *hw_cdm;
> >>       const struct dpu_format *fmt = NULL;
> >>       u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>       unsigned long lock_flags;
> >> @@ -254,17 +255,26 @@ static void
> >> dpu_encoder_phys_vid_setup_timing_engine(
> >>       DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
> >>       drm_mode_debug_printmodeline(&mode);
> >>   -    if (phys_enc->split_role != ENC_ROLE_SOLO) {
> >> +    hw_cdm = phys_enc->hw_cdm;
> >> +    if (hw_cdm) {
> >> +        intf_cfg.cdm = hw_cdm->idx;
> >> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &mode);
> >> +    }
> >> +
> >> +    if (phys_enc->split_role != ENC_ROLE_SOLO ||
> >> +        dpu_encoder_get_drm_fmt(phys_enc->parent, &mode) ==
> >> DRM_FORMAT_YUV420) {
> >>           mode.hdisplay >>= 1;
> >>           mode.htotal >>= 1;
> >>           mode.hsync_start >>= 1;
> >>           mode.hsync_end >>= 1;
> >> +        mode.hskew >>= 1;
> >
> > Separate patch.
> Ack.
> >
> >>             DPU_DEBUG_VIDENC(phys_enc,
> >> -            "split_role %d, halve horizontal %d %d %d %d\n",
> >> +            "split_role %d, halve horizontal %d %d %d %d %d\n",
> >>               phys_enc->split_role,
> >>               mode.hdisplay, mode.htotal,
> >> -            mode.hsync_start, mode.hsync_end);
> >> +            mode.hsync_start, mode.hsync_end,
> >> +            mode.hskew);
> >>       }
> >>         drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
> >> @@ -412,8 +422,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >>   static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys
> >> *phys_enc)
> >>   {
> >>       struct dpu_hw_ctl *ctl;
> >> +    struct dpu_hw_cdm *hw_cdm;
> >> +    const struct dpu_format *fmt = NULL;
> >> +    u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>         ctl = phys_enc->hw_ctl;
> >> +    hw_cdm = phys_enc->hw_cdm;
> >> +    if (hw_cdm)
> >> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent,
> >> &phys_enc->cached_mode);
> >> +    fmt = dpu_get_dpu_format(fmt_fourcc);
> >>         DPU_DEBUG_VIDENC(phys_enc, "\n");
> >>   @@ -422,6 +439,8 @@ static void dpu_encoder_phys_vid_enable(struct
> >> dpu_encoder_phys *phys_enc)
> >>         dpu_encoder_helper_split_config(phys_enc,
> >> phys_enc->hw_intf->idx);
> >>   +    dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt,
> >> CDM_CDWN_OUTPUT_HDMI);
> >
> > If there is no CDM, why do we need to call this?
> Inside of dpu_encoder_helper_phys_setup_cdm(), there's a check to see if
> there is a hw_cdm. If there is not, then it immediately exits the function.
> >
> >> +
> >>       dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
> >>         /*
> >> @@ -437,7 +456,15 @@ static void dpu_encoder_phys_vid_enable(struct
> >> dpu_encoder_phys *phys_enc)
> >>       if (ctl->ops.update_pending_flush_merge_3d &&
> >> phys_enc->hw_pp->merge_3d)
> >>           ctl->ops.update_pending_flush_merge_3d(ctl,
> >> phys_enc->hw_pp->merge_3d->idx);
> >>   -    if (ctl->ops.update_pending_flush_periph &&
> >> phys_enc->hw_intf->cap->type == INTF_DP)
> >> +    if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> >> +        ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> >> +
> >> +    /*
> >> +     * Peripheral flush must be updated whenever flushing SDP
> >> packets is needed.
> >> +     * SDP packets are required for any YUV format (YUV420, YUV422,
> >> YUV444).
> >> +     */
> >> +    if (ctl->ops.update_pending_flush_periph &&
> >> phys_enc->hw_intf->cap->type == INTF_DP &&
> >> +        phys_enc->hw_cdm)
> >>           ctl->ops.update_pending_flush_periph(ctl,
> >> phys_enc->hw_intf->idx);
> >
> > Should there be a flush if we are switching from YUV 420 to RGB mode?
> We only need to flush for the sdp packet, but for msa we do not need to
> flush.

What about having SDP with RGB as colorimetry? In other words, if
there is a decision point, this one looks incorrect.

> >
> > Also, I'd say, we should move update_pending_flush_periph invocation
> > to this patch.
> Ack
> >
> >>     skip_flush:
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 6d764f5b08727..4329435518351 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1399,6 +1399,18 @@ void __exit msm_dp_unregister(void)
> >>       platform_driver_unregister(&dp_display_driver);
> >>   }
> >>   +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                   const struct drm_display_mode *mode)
> >> +{
> >> +    struct dp_display_private *dp;
> >> +    const struct drm_display_info *info;
> >> +
> >> +    dp = container_of(dp_display, struct dp_display_private,
> >> dp_display);
> >> +    info = &dp_display->connector->display_info;
> >> +
> >> +    return dp_panel_vsc_sdp_supported(dp->panel) &&
> >> drm_mode_is_420_only(info, mode);
> >
> > YUV 420 modes should be filtered out in mode_valid if VSC SDP is not
> > supported.
> Ack. Will change
> >
> >> +}
> >> +
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>   {
> >>       struct dp_display_private *dp;
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> >> b/drivers/gpu/drm/msm/msm_drv.h
> >> index 16a7cbc0b7dd8..b9581bd934e9e 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -387,7 +387,8 @@ void __exit msm_dp_unregister(void);
> >>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct
> >> drm_device *dev,
> >>                struct drm_encoder *encoder);
> >>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct
> >> msm_dp *dp_display);
> >> -
> >> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                   const struct drm_display_mode *mode);
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> >>     #else
> >> @@ -409,6 +410,12 @@ static inline void msm_dp_snapshot(struct
> >> msm_disp_state *disp_state, struct msm
> >>   {
> >>   }
> >>   +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp
> >> *dp_display,
> >> +                         const struct drm_display_mode *mode)
> >> +{
> >> +    return false;
> >> +}
> >> +
> >>   static inline bool msm_dp_wide_bus_available(const struct msm_dp
> >> *dp_display)
> >>   {
> >>       return false;
> >



--
With best wishes
Dmitry

