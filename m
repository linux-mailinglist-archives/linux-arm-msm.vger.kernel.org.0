Return-Path: <linux-arm-msm+bounces-10932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3A8539D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF79EB2155C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2B0605BF;
	Tue, 13 Feb 2024 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwaI6G+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4C05FEF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707848624; cv=none; b=MzEPrwqCbov1Cp3bBSt1DaLbhayFgwsVhZ5OdoIYM7YHqmE3H+CFayBM7DfQ9HiRnZAoHmoM2YiYnVPOZ9M7qqp/uLN3ERaO2nKA9BPCtZFLEWAP58O22Pe7EiRfAbvtwasmk3Fevb/LT93fM2Q4a/r995Or0FQ7XY3/MfFpIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707848624; c=relaxed/simple;
	bh=IRP3B5ENtgcG426d3ub/0di93XGp/E4fSH6/+Uioc4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBjNk6Qqt7fyJJEuX7zhPKmWE4hL4F0lcl+h8sDLZyj5XKpy+q+FS4TD3E5yB1Q13XLe8a1xj8W+/cND1AzD1VRgYc/X71Hl9mBDhSGcHTDs+Ncp31HznPLDuYcfao3QQC98bjR1n7HHxFL9WOWSgapcvyh6Zo0SUXN98PEeE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwaI6G+V; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso951227276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707848621; x=1708453421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fkE7klX7XNiSTQoWMiVmKEm1+UjPMHYgC73Fg53elTk=;
        b=AwaI6G+VjhOZ/Wk2GB/j7ych/tWY3j/5qhwsoe1lF31JQendw3Vywp3gwT1WtyV8aJ
         pGYjk8jRZ6s4/8TZ9XbRiuG04OWRfhl4WO787P2o8Hd9beDRYvnFoo66/lT4hyW1IyR+
         BxQIvrZ6dI6cvBLhEaE9jFlVHp5EdUmZU4xjuYZPePlLRXPcz79Gvsmw2Pb8qJnUVGTp
         HyQhIRJsXBMhNUTF4Fo3qsT2rTB5KWDyOvBhoUYQc6VQRfn2F43ONat1qdeFwST52t0+
         IgSxbtbfCRlrRDO9zuy8moqqfFQMGojcdJtlkiMbv7cpwv/5tkELz/ub/KGVAFapXDRq
         74Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707848621; x=1708453421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkE7klX7XNiSTQoWMiVmKEm1+UjPMHYgC73Fg53elTk=;
        b=GrIpldaCHD3a5s5Ff3mengwivU94WGxHHUNW4QOYZUJMfbzJpYCjYBovhGYEz6JGAH
         ey4LQQUUxxInDjhB2x+KBVIFpEmKQyWtr2bjn6NexABunjGDKEwepJsyrXGqScEUjEJZ
         Q4VlFXJ7yzb4D5FBLnZhiNwrjkfoNfEuWsV8FFdWKlwPSST3yQTXKD6jAD5R85GXUExS
         UBbmtRwpWX0ykcIMimFL0rr/EBst0y4fStSg+FyY3BfvA4dhTr9ZnpXlC623TK0uHPZB
         OYrsCoAojTq+w+9ocFgGRKiWl12gJXGkHtIQB6DJRZ9lIHFbA7JpFNjX/loREaq5Vdil
         hsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3krm7Fh/O8IdRZN3IRBYzLbZ0eu3Sn9oB9G+CBOgEPBychDDPs1beg+i6bhJmQysotlDDWpfB7EjTKWsapFo+q84z4sJziO/c7zaZ1A==
X-Gm-Message-State: AOJu0Ywg4bEVWuUQ3Cx31vH3gu/R3DqVYxk2WrkxvKe8jmneJJKlbu4c
	h1LdRLjuywfL7rCNljtgm5qOTL8H4Z6qBijzPIiBCLOsVHHPcg7NXc2TLt7VSlNzIgWXluk0R0g
	KKokUtuM4afa7OjBf+5C6p8TWr+QM3vBgp9onLQ==
X-Google-Smtp-Source: AGHT+IHPEcvTPrTpsArVtgDoVOviSAZns5rt7zwUv1ceQVVZm5sUBuZ5CtnML8JYHAsVTo/0clSpq0TXPI9c02oUX6A=
X-Received: by 2002:a25:c58a:0:b0:dcc:8f97:9744 with SMTP id
 v132-20020a25c58a000000b00dcc8f979744mr63961ybe.43.1707848621125; Tue, 13 Feb
 2024 10:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-17-quic_parellan@quicinc.com> <CAA8EJprttbMgM=HEwctePZOwKny+nM2=qRJsPWmP4Ar0H8ATEg@mail.gmail.com>
 <217dbec7-d7b9-688f-ce40-2a62179cb507@quicinc.com>
In-Reply-To: <217dbec7-d7b9-688f-ce40-2a62179cb507@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 20:23:29 +0200
Message-ID: <CAA8EJprLvEn7ndCHqkw4RuGq_AE1nOxyONZx832Wv8Y2dGtRhQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 19:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/13/2024 3:18 AM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> Adjust the encoder format programming in the case of video mode for DP
> >> to accommodate CDM related changes.
> >>
> >> Changes in v2:
> >>          - Move timing engine programming to a separate patch from this
> >>            one
> >>          - Move update_pending_flush_periph() invocation completely to
> >>            this patch
> >>          - Change the logic of dpu_encoder_get_drm_fmt() so that it only
> >>            calls drm_mode_is_420_only() instead of doing additional
> >>            unnecessary checks
> >>          - Create new functions msm_dp_needs_periph_flush() and it's
> >>            supporting function dpu_encoder_needs_periph_flush() to check
> >>            if the mode is YUV420 and VSC SDP is enabled before doing a
> >>            peripheral flush
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
> >>   drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
> >>   5 files changed, 101 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 7e7796561009a..6280c6be6dca9 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >>          15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >>   };
> >>
> >> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +       struct drm_encoder *drm_enc;
> >> +       struct dpu_encoder_virt *dpu_enc;
> >> +       struct drm_display_info *info;
> >> +       struct drm_display_mode *mode;
> >> +
> >> +       drm_enc = phys_enc->parent;
> >> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +       info = &dpu_enc->connector->display_info;
> >> +       mode = &phys_enc->cached_mode;
> >> +
> >> +       if (drm_mode_is_420_only(info, mode))
> >> +               return DRM_FORMAT_YUV420;
> >> +
> >> +       return DRM_FORMAT_RGB888;
> >> +}
> >> +
> >> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +       struct drm_encoder *drm_enc;
> >> +       struct dpu_encoder_virt *dpu_enc;
> >> +       struct msm_display_info *disp_info;
> >> +       struct msm_drm_private *priv;
> >> +       struct drm_display_mode *mode;
> >> +
> >> +       drm_enc = phys_enc->parent;
> >> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +       disp_info = &dpu_enc->disp_info;
> >> +       priv = drm_enc->dev->dev_private;
> >> +       mode = &phys_enc->cached_mode;
> >> +
> >> +       return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
> >
> > Do we really need to check for phys_enc->hw_cdm here?
> >
>
> hmmm I dont think so. If CDM was not there, then after the last patch,
> YUV420 removes will not be present at all.
>
> The only other case I could think of was, if for some reason CDM was
> used by some other interface such as WB, then hw_cdm will not be assigned.
>
> But, I think even for that msm_dp_needs_periph_flush() will take care of
> it because we use the cached_mode which is assigned only in mode_set().
>
> >> +              msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
> >> +}
> >>
> >>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
> >>   {
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index f43d57d9c74e1..211a3d90eb690 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
> >>    */
> >>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
> >>
> >> +/**
> >> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> >> + * @phys_enc: Pointer to physical encoder structure
> >> + */
> >> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
> >> +
> >> +/**
> >> + * dpu_encoder_needs_periph_flush - return true if physical encoder requires
> >> + *     peripheral flush
> >> + * @phys_enc: Pointer to physical encoder structure
> >> + */
> >> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
> >> +
> >>   /**
> >>    * dpu_encoder_helper_split_config - split display configuration helper function
> >>    *     This helper function may be used by physical encoders to configure
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index f562beb6f7971..3f102b2813ca8 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -413,8 +413,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >>   static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >>   {
> >>          struct dpu_hw_ctl *ctl;
> >> +       struct dpu_hw_cdm *hw_cdm;
> >> +       const struct dpu_format *fmt = NULL;
> >> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>
> >>          ctl = phys_enc->hw_ctl;
> >> +       hw_cdm = phys_enc->hw_cdm;
> >> +       if (hw_cdm)
> >> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
> >
> > Please move if(hw_cdm) inside dpu_encoder_get_drm_fmt().
> >
>
> I think we dont need to check for if (hw_cdm) at all.
> dpu_encoder_get_drm_fmt() was just supposed to be a helper which returns
> the fourcc code based on the mode. It doesnt need to know if there is
> cdm or not.
>
> We cannot move it inside dpu_encoder_helper_phys_setup_cdm() because for
> WB, we do not change the fourcc based on the mode. Its specific to video
> mode.

Wait... In the case of the WB we use the fourcc + modifier from the
framebuffer. Ok, this looks fine then.


>
> >> +       fmt = dpu_get_dpu_format(fmt_fourcc);
> >
> > Can this be moved into dpu_encoder_helper_phys_setup_cdm() ? Or maybe
> > we can move both calls into the helper? I mean, fmt_fourcc is not used
> > at all if the CDM is not used.
> >
>
> fourcc is always used to get the fmt to setup the timing engine params.
> Its just that it was always hard-coded to RGB. With CDM, it can change
> based on the mode. Thats why this utility was introduced to return the
> fourcc from the mode information.

Yes, I perfectly understand that. I just disliked the idea of calling
dpu_get_dpu_format() if the result gets unused.
What about passing fourcc + modifier to
dpu_encoder_helper_phys_setup_cdm() instead?

>
> >>
> >>          DPU_DEBUG_VIDENC(phys_enc, "\n");
> >>
> >> @@ -423,6 +430,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >>
> >>          dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
> >>
> >> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
> >> +
> >>          dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
> >>
> >>          /*
> >> @@ -438,6 +447,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >>          if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
> >>                  ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
> >>
> >> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> >> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> >> +
> >> +       /*
> >> +        * Peripheral flush must be updated whenever flushing SDP packets is needed.
> >> +        * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
> >> +        */
> >> +       if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
> >> +               ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> >> +
> >>   skip_flush:
> >>          DPU_DEBUG_VIDENC(phys_enc,
> >>                  "update pending flush ctl %d intf %d\n",
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 4b04388719363..ebcc76ef1d590 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
> >>          platform_driver_unregister(&dp_display_driver);
> >>   }
> >>
> >> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode)
> >> +{
> >> +       struct dp_display_private *dp;
> >> +       const struct drm_display_info *info;
> >> +
> >> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> +       info = &dp_display->connector->display_info;
> >> +
> >> +       return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
> >> +}
> >> +
> >> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode)
> >> +{
> >> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
> >> +}
> >> +
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>   {
> >>          struct dp_display_private *dp;
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> >> index 16a7cbc0b7dd8..b876ebd48effe 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
> >>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>                           struct drm_encoder *encoder);
> >>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
> >> -
> >> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode);
> >> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode);
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> >>
> >>   #else
> >> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
> >>   {
> >>   }
> >>
> >> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                                            const struct drm_display_mode *mode)
> >> +{
> >> +       return false;
> >> +}
> >> +
> >> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> >> +                                            const struct drm_display_mode *mode)
> >> +{
> >> +       return false;
> >> +}
> >> +
> >>   static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>   {
> >>          return false;
> >> --
> >> 2.39.2
> >>
> >
> >



-- 
With best wishes
Dmitry

