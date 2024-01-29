Return-Path: <linux-arm-msm+bounces-8749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F883FCEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 04:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5A81C217DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 03:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C5110957;
	Mon, 29 Jan 2024 03:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+zIzgzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764A1094E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 03:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706499788; cv=none; b=QVU8OAOLhnuoHDSlWLT7w4+a+6wY4x7xJLgFjJUKnLgFXhXm6qFIsLuLGnCcjDlDNxHRdoH7Br3ixJk9qcipExSidl6yowT8ji72Svhp5unWt9lrmq6h7UMKKMHGCHVMhHTr9HC+Jx+2bkUsfSvhSXX5y8myLrCoH3oO6pGOykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706499788; c=relaxed/simple;
	bh=IXJTbD7zWlJUg2YNO5+r7ukY+FwHM/Ezdg5hG4F5wP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a97PJ0JBQ7hgIpq7BiGehFlFENuGPwsAvN+XcvOKlowoUnaqVEtlZXqvJd5bEJB9ELVfn9Vn4V+khiXE9lqqRdIjSGgcicnTw0Ar0AXze170ePTnKsfBxzehF4JWWIKgnC7FNOdLHAkK29of/ImmjIsBFFEamVEBGbld1lzVjYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+zIzgzF; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-603c5d7997aso8955847b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 19:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706499785; x=1707104585; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J0DV7QGMiPinKgD216LjWiY34diwCxfaE2ieTUqBaRM=;
        b=J+zIzgzFTsRaY7hFzQVzBYkAZIOexTO+agI7rYsg8vzq/qjPT1BvLBjlgjK0+rTDIc
         E2BfNvVM0qxyRpj/yhr2DHmCdFIbDEEwbf7wpc8HR4C+4zzSnrUQxKcCxGs2RLrdZr89
         BWKhgqWG5GAYWn4n8Cxv647xZpkUyx8VBizwOQhHJ4v98M4B4+UvydAjYPHPcoLdfZvC
         5oEgiofEMKEB2G2Q7YMENRCC1kzq3SIvmDpCUKuIw67XPRAg5xc5+rbH/GKlBPJOeBD+
         76xcC6OJcl1tAtdcnhZk3X/EwJpaXW3E9drkQE10jeIXXIUcb6a+ZK/pQ5L8yN3hY5tQ
         VqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706499785; x=1707104585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0DV7QGMiPinKgD216LjWiY34diwCxfaE2ieTUqBaRM=;
        b=b2wamgaHxXex//+uuQze1Y8Av89oeuIeIgTuYX92T2jCr4BF7MbApXR7wkLFKpo1In
         phWmqY1XudkeX9KBwre3R5cOcnsPwi7dgqaNVYvN7RpKJpUejCnhmq9vSq9F+3x+aklZ
         zihN4WuFl0UuBahzuJ4HZiVjr95nhACi0x0GUsVobyf9i9CwAo24YhhgGzmQMyAQyNrk
         b/0r8rTuq3n+7GYy8OQf9haQCwa5padvuYz/m5f2lY3WM67Byn5emtjUKE6IYku0QJWi
         mkc42rqMIzhWTP5CwTJDOKoUtHBPwQCbdfSxT7DIgM35PTCiy+eHscUjouojYz+W4rJZ
         xNsw==
X-Gm-Message-State: AOJu0Yz3N5LXzU0i+D6gSwn8qG3wPU/l0wuf5kK097qoM1hZwWm0sywW
	BPHfjd237e9j7Pv6kK7f+6Jr+eyrYbUDUdlDPJpL8ZQUHDiyF56UpbapzSyn+foBBRvtlNkXjDb
	5/id3x344uCGVS6Et/ewVkgTQbPj95SUglSyktA==
X-Google-Smtp-Source: AGHT+IECpxk8R+uyM8T0pPyBSCfiRgguiHKEHQwur04FX7i18RI0YyOX52E99gQx3swdSB7AwR5QqEnug+KgiLXwL6A=
X-Received: by 2002:a25:f210:0:b0:dc2:7c84:8aaa with SMTP id
 i16-20020a25f210000000b00dc27c848aaamr1410011ybe.84.1706499785463; Sun, 28
 Jan 2024 19:43:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-15-quic_parellan@quicinc.com> <52674357-2135-4784-a371-e7809b632c19@linaro.org>
 <d1679d6f-a388-2a13-2924-1e6040217c01@quicinc.com> <CAA8EJppPFuP4w-OAi0hDE36tjPXOHpigg1PMyzhkOTLL-q0VMQ@mail.gmail.com>
 <771094aa-b8d9-6e6e-1945-b66818fa6d88@quicinc.com>
In-Reply-To: <771094aa-b8d9-6e6e-1945-b66818fa6d88@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 05:42:53 +0200
Message-ID: <CAA8EJprBjq8OvE2tfjZmxHfp3EbxKpWWv-xTym70t6ksBoTojQ@mail.gmail.com>
Subject: Re: [PATCH 14/17] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 04:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/27/2024 9:55 PM, Dmitry Baryshkov wrote:
> > On Sun, 28 Jan 2024 at 07:48, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >>
> >> On 1/25/2024 1:57 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> Adjust the encoder format programming in the case of video mode for DP
> >>>> to accommodate CDM related changes.
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 16 +++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 +++++
> >>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 35 ++++++++++++++++---
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c           | 12 +++++++
> >>>>    drivers/gpu/drm/msm/msm_drv.h                 |  9 ++++-
> >>>>    5 files changed, 75 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>> index b0896814c1562..99ec53446ad21 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>> @@ -222,6 +222,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >>>>        15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >>>>    };
> >>>>    +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> >>>> const struct drm_display_mode *mode)
> >>>> +{
> >>>> +    const struct dpu_encoder_virt *dpu_enc;
> >>>> +    const struct msm_display_info *disp_info;
> >>>> +    struct msm_drm_private *priv;
> >>>> +
> >>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
> >>>> +    disp_info = &dpu_enc->disp_info;
> >>>> +    priv = drm_enc->dev->dev_private;
> >>>> +
> >>>> +    if (disp_info->intf_type == INTF_DP &&
> >>>> + msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]],
> >>>> mode))
> >>>
> >>> This should not require interacting with DP. If we got here, we must
> >>> be sure that 4:2:0 is supported and can be configured.
> >> Ack. Will drop this function and only check for if the mode is YUV420.
> >>>
> >>>> +        return DRM_FORMAT_YUV420;
> >>>> +
> >>>> +    return DRM_FORMAT_RGB888;
> >>>> +}
> >>>>      bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> >>>> *drm_enc)
> >>>>    {
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>> index 7b4afa71f1f96..62255d0aa4487 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>> @@ -162,6 +162,14 @@ int dpu_encoder_get_vsync_count(struct
> >>>> drm_encoder *drm_enc);
> >>>>     */
> >>>>    bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> >>>> *drm_enc);
> >>>>    +/**
> >>>> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> >>>> + * @drm_enc:    Pointer to previously created drm encoder structure
> >>>> + * @mode:    Corresponding drm_display_mode for dpu encoder
> >>>> + */
> >>>> +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> >>>> +                const struct drm_display_mode *mode);
> >>>> +
> >>>>    /**
> >>>>     * dpu_encoder_get_crc_values_cnt - get number of physical encoders
> >>>> contained
> >>>>     *    in virtual encoder that can collect CRC values
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> index e284bf448bdda..a1dde0ff35dc8 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> @@ -234,6 +234,7 @@ static void
> >>>> dpu_encoder_phys_vid_setup_timing_engine(
> >>>>    {
> >>>>        struct drm_display_mode mode;
> >>>>        struct dpu_hw_intf_timing_params timing_params = { 0 };
> >>>> +    struct dpu_hw_cdm *hw_cdm;
> >>>>        const struct dpu_format *fmt = NULL;
> >>>>        u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>>>        unsigned long lock_flags;
> >>>> @@ -254,17 +255,26 @@ static void
> >>>> dpu_encoder_phys_vid_setup_timing_engine(
> >>>>        DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
> >>>>        drm_mode_debug_printmodeline(&mode);
> >>>>    -    if (phys_enc->split_role != ENC_ROLE_SOLO) {
> >>>> +    hw_cdm = phys_enc->hw_cdm;
> >>>> +    if (hw_cdm) {
> >>>> +        intf_cfg.cdm = hw_cdm->idx;
> >>>> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &mode);
> >>>> +    }
> >>>> +
> >>>> +    if (phys_enc->split_role != ENC_ROLE_SOLO ||
> >>>> +        dpu_encoder_get_drm_fmt(phys_enc->parent, &mode) ==
> >>>> DRM_FORMAT_YUV420) {
> >>>>            mode.hdisplay >>= 1;
> >>>>            mode.htotal >>= 1;
> >>>>            mode.hsync_start >>= 1;
> >>>>            mode.hsync_end >>= 1;
> >>>> +        mode.hskew >>= 1;
> >>>
> >>> Separate patch.
> >> Ack.
> >>>
> >>>>              DPU_DEBUG_VIDENC(phys_enc,
> >>>> -            "split_role %d, halve horizontal %d %d %d %d\n",
> >>>> +            "split_role %d, halve horizontal %d %d %d %d %d\n",
> >>>>                phys_enc->split_role,
> >>>>                mode.hdisplay, mode.htotal,
> >>>> -            mode.hsync_start, mode.hsync_end);
> >>>> +            mode.hsync_start, mode.hsync_end,
> >>>> +            mode.hskew);
> >>>>        }
> >>>>          drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
> >>>> @@ -412,8 +422,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >>>>    static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys
> >>>> *phys_enc)
> >>>>    {
> >>>>        struct dpu_hw_ctl *ctl;
> >>>> +    struct dpu_hw_cdm *hw_cdm;
> >>>> +    const struct dpu_format *fmt = NULL;
> >>>> +    u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>>>          ctl = phys_enc->hw_ctl;
> >>>> +    hw_cdm = phys_enc->hw_cdm;
> >>>> +    if (hw_cdm)
> >>>> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent,
> >>>> &phys_enc->cached_mode);
> >>>> +    fmt = dpu_get_dpu_format(fmt_fourcc);
> >>>>          DPU_DEBUG_VIDENC(phys_enc, "\n");
> >>>>    @@ -422,6 +439,8 @@ static void dpu_encoder_phys_vid_enable(struct
> >>>> dpu_encoder_phys *phys_enc)
> >>>>          dpu_encoder_helper_split_config(phys_enc,
> >>>> phys_enc->hw_intf->idx);
> >>>>    +    dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt,
> >>>> CDM_CDWN_OUTPUT_HDMI);
> >>>
> >>> If there is no CDM, why do we need to call this?
> >> Inside of dpu_encoder_helper_phys_setup_cdm(), there's a check to see if
> >> there is a hw_cdm. If there is not, then it immediately exits the function.
> >>>
> >>>> +
> >>>>        dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
> >>>>          /*
> >>>> @@ -437,7 +456,15 @@ static void dpu_encoder_phys_vid_enable(struct
> >>>> dpu_encoder_phys *phys_enc)
> >>>>        if (ctl->ops.update_pending_flush_merge_3d &&
> >>>> phys_enc->hw_pp->merge_3d)
> >>>>            ctl->ops.update_pending_flush_merge_3d(ctl,
> >>>> phys_enc->hw_pp->merge_3d->idx);
> >>>>    -    if (ctl->ops.update_pending_flush_periph &&
> >>>> phys_enc->hw_intf->cap->type == INTF_DP)
> >>>> +    if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> >>>> +        ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> >>>> +
> >>>> +    /*
> >>>> +     * Peripheral flush must be updated whenever flushing SDP
> >>>> packets is needed.
> >>>> +     * SDP packets are required for any YUV format (YUV420, YUV422,
> >>>> YUV444).
> >>>> +     */
> >>>> +    if (ctl->ops.update_pending_flush_periph &&
> >>>> phys_enc->hw_intf->cap->type == INTF_DP &&
> >>>> +        phys_enc->hw_cdm)
> >>>>            ctl->ops.update_pending_flush_periph(ctl,
> >>>> phys_enc->hw_intf->idx);
> >>>
> >>> Should there be a flush if we are switching from YUV 420 to RGB mode?
> >> We only need to flush for the sdp packet, but for msa we do not need to
> >> flush.
> >
> > What about having SDP with RGB as colorimetry? In other words, if
> > there is a decision point, this one looks incorrect.
> >
>
> There are two ways to do it:
>
> 1) Use SDP for both RGB and YUV as that supports both. If we implement
> this policy, then what you are asking for is correct that we will need
> SDP even to switch back to RGB. But to implement this we will also need
> to have some sort of state management in the encoder layer about what is
> the current encoder fmt Vs what is the prev fmt and then trigger
> peripheral flush only during transitions from RGB to YUV and vice-versa
>
> 2) Use SDP only for YUV because MSA does not support YUV formats and use
> MSA for RGB
>
> We decided to implement (2) and there is no significant impact of
> switching between MSA and SDPs but state management becomes easier.

Yes. However as you wrote, there might be other usecases concerning
SDP. Having this in mind, it sounds like the driver should decide
whether to flush peripheral at a different place (when the SDP
infoframe is being updated?). And the dpu_encoder_phys_vid_enable()
should use this previous decision. Maybe this should be a part of
msm_dp_ API, something like msm_dp_needs_peripheral_flush()?

>
> >>>
> >>> Also, I'd say, we should move update_pending_flush_periph invocation
> >>> to this patch.
> >> Ack
> >>>
> >>>>      skip_flush:
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index 6d764f5b08727..4329435518351 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1399,6 +1399,18 @@ void __exit msm_dp_unregister(void)
> >>>>        platform_driver_unregister(&dp_display_driver);
> >>>>    }
> >>>>    +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >>>> +                   const struct drm_display_mode *mode)
> >>>> +{
> >>>> +    struct dp_display_private *dp;
> >>>> +    const struct drm_display_info *info;
> >>>> +
> >>>> +    dp = container_of(dp_display, struct dp_display_private,
> >>>> dp_display);
> >>>> +    info = &dp_display->connector->display_info;
> >>>> +
> >>>> +    return dp_panel_vsc_sdp_supported(dp->panel) &&
> >>>> drm_mode_is_420_only(info, mode);
> >>>
> >>> YUV 420 modes should be filtered out in mode_valid if VSC SDP is not
> >>> supported.
> >> Ack. Will change
> >>>
> >>>> +}
> >>>> +
> >>>>    bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>>>    {
> >>>>        struct dp_display_private *dp;
> >>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> >>>> b/drivers/gpu/drm/msm/msm_drv.h
> >>>> index 16a7cbc0b7dd8..b9581bd934e9e 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_drv.h
> >>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >>>> @@ -387,7 +387,8 @@ void __exit msm_dp_unregister(void);
> >>>>    int msm_dp_modeset_init(struct msm_dp *dp_display, struct
> >>>> drm_device *dev,
> >>>>                 struct drm_encoder *encoder);
> >>>>    void msm_dp_snapshot(struct msm_disp_state *disp_state, struct
> >>>> msm_dp *dp_display);
> >>>> -
> >>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >>>> +                   const struct drm_display_mode *mode);
> >>>>    bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> >>>>      #else
> >>>> @@ -409,6 +410,12 @@ static inline void msm_dp_snapshot(struct
> >>>> msm_disp_state *disp_state, struct msm
> >>>>    {
> >>>>    }
> >>>>    +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp
> >>>> *dp_display,
> >>>> +                         const struct drm_display_mode *mode)
> >>>> +{
> >>>> +    return false;
> >>>> +}
> >>>> +
> >>>>    static inline bool msm_dp_wide_bus_available(const struct msm_dp
> >>>> *dp_display)
> >>>>    {
> >>>>        return false;
> >>>
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

