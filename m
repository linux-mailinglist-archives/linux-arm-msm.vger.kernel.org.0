Return-Path: <linux-arm-msm+bounces-32520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C1986827
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 23:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD5E1F23CF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047161D5AD5;
	Wed, 25 Sep 2024 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGw98LgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24178145FFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727298699; cv=none; b=XtLaWijwwtKQAg06pGsblFSMKJlSKjkzijPC3hFdMDMvPWl+m8MaOeJavVIr909G4JgUwEQr3Bt/Fskwgx87uOJpOneitYYZAUg9fuWg6F43g1mQmmr1kfUXjZaBRgpzXxUYY3kwlRbyE/V/LfWU4FxIdCsh1ePWqLnob0JGnPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727298699; c=relaxed/simple;
	bh=uaJyIEoSwNKsjJkoEyrCnv8T+eq1xY6FzObEOx7j1Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIIpx/IjHZguqqmFZks2fxxTqxDBLB8QuYeVBJLCFMizh4bJCDvdpwRYcSwh0Uqpa8sI57nyMOO+AIc2D7PVNZq1uPehqyy8Zxfu56HOpqAmWFIY3985WigE0nw2BBvaV9l/JLMQbYOKwgpvWDsN/a31WjDI07k76NvFpPcvbHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGw98LgU; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e20a8141c7so4031347b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727298697; x=1727903497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+9TIU+9hxJV2zxmNs4d032rUDDVyJj1j83Li4zDnFvc=;
        b=oGw98LgU9N+LZvTwAj1dGhCsC5B4hX0XLm9HNsbxKvvdDW59MjvzZ1KLJa3b0/Ft+O
         QXnTpzvx2bUIt1PKSeVXYOgYVgP84/iTRBDRe3ngkwba/KfcwnTD7IKYdqhemXzkwpu+
         nRZVZUw9pKWf8WkTMu1vpX3ZtY8BdSDzZRJLL0Tecs1B0xMiNwD6k39FviBkmJuo4ID9
         PXEbP9IKW6oLtYTljFSwHI7qqdEIaGHBgnlD+oChwcQ6aoGwJFIKui7ZVUyZoX98pC87
         7Sm6RaoO3xqTezzr+dQnp3XnLsQgjRud3sBOGIkaOZf/cdEnqW+Tejxqe3rTBxf/Q1yZ
         jPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727298697; x=1727903497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9TIU+9hxJV2zxmNs4d032rUDDVyJj1j83Li4zDnFvc=;
        b=vbHMfS70GtkW1YmrS74VAb+X8ud+UeHGKNU6Q72vbNq5wHpT3mFl3s/O/VB5zmN9Yw
         LaZNxR17ZHeivqSHpvYyEVqyrVTkPpQV8K6ZMYQR9hw90C6S90i5SfeZ+U2T1iYLtyqQ
         mOYfuxLGUjg8Z7qPqxE6P5aCfTpHUg0zOlSkJkSKLM6GWJfLyazzo3dpHa4jhICMzSVk
         3pqXdqWY10sWs0mQsWxRlPBpSQHZVVfKMtBA9MowWtRo12XBbxUEl8OliYirdGU7UusK
         pAtgKil5P9O9W0n76LJ2vnj647MrtHSxY6fClhCBrez2jp8wg1wXYN+AyA3WbhhtbTly
         mb3g==
X-Forwarded-Encrypted: i=1; AJvYcCVrAjZ23X2ysX41WRTVf/8HKL+EePWL4Ud7zCsfHgWrZqRoUjWSvzVPvOo1plz31cOeRsfFu3q4AVJZG2os@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfo1qMVfQEUTj8QRRqsjaDQfzp+5IS3sOTicMAGl3Yzi8J7kKt
	ofvbU5z3YyFiQGrT53PwwhF8xg5xCdeRgK31N40fiLH+PMyHcKcRBbTFTryoms/UVhY1GdcZ4S8
	8v1sGq60zH+gbxJBAvmwsv/OE6Ec5j82VT+X0JE60FDaq0rwVvOyu+Q==
X-Google-Smtp-Source: AGHT+IEp+mxvGkg3YqT/1KJufgJQB/xXWcnPMsUafm3tUlKhN15iL95oyO8K6Op3Y8xSE5IQjn21aX/7DyU72/mq1E4=
X-Received: by 2002:a05:690c:660f:b0:6de:b23:f2c3 with SMTP id
 00721157ae682-6e21d6ec709mr41328167b3.7.1727298696928; Wed, 25 Sep 2024
 14:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com> <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
 <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
In-Reply-To: <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Sep 2024 23:11:25 +0200
Message-ID: <CAA8EJpraspHpgGvJxe7dXx-hN+yirs_+AacjkrHvPWuEvrLJ-w@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 22:39, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 9/24/2024 4:13 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
> >> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> All resource allocation is centered around the LMs. Then other blocks
> >> (except DSCs) are allocated basing on the LMs that was selected, and LM
> >> powers up the CRTC rather than the encoder.
> >>
> >> Moreover if at some point the driver supports encoder cloning,
> >> allocating resources from the encoder will be incorrect, as all clones
> >> will have different encoder IDs, while LMs are to be shared by these
> >> encoders.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >>   3 files changed, 183 insertions(+), 123 deletions(-)
> >>
> >> @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
> >>      }
> >>   }
> >>
> >> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> >> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> >> +                             struct msm_display_topology *topology,
> >> +                             struct drm_atomic_state *state,
> >> +                             const struct drm_display_mode *adj_mode)
> >>   {
> >>      struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> -    int i, intf_count = 0, num_dsc = 0;
> >> +    struct drm_connector *connector;
> >> +    struct drm_connector_state *conn_state;
> >> +    struct msm_display_info *disp_info;
> >> +    struct drm_framebuffer *fb;
> >> +    struct msm_drm_private *priv;
> >> +    int i;
> >>
> >>      for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> >>              if (dpu_enc->phys_encs[i])
> >> -                    intf_count++;
> >> +                    topology->num_intf++;
> >>
> >> -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> >> +    /* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> >>      if (dpu_enc->dsc)
> >> -            num_dsc = 2;
> >> +            topology->num_dsc += 2;
> >>
> >> -    return (num_dsc > 0) && (num_dsc > intf_count);
> >> -}
> >> +    connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> >> +    if (!connector)
> >> +            return;
> >> +    conn_state = drm_atomic_get_new_connector_state(state, connector);
> >> +    if (!conn_state)
> >> +            return;
> >>
> >> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> >> -{
> >> -    struct msm_drm_private *priv = drm_enc->dev->dev_private;
> >> -    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> -    int index = dpu_enc->disp_info.h_tile_instance[0];
> >> +    disp_info = &dpu_enc->disp_info;
> >>
> >> -    if (dpu_enc->disp_info.intf_type == INTF_DSI)
> >> -            return msm_dsi_get_dsc_config(priv->dsi[index]);
> >> +    priv = drm_enc->dev->dev_private;
> >>
> >> -    return NULL;
> >> +    /*
> >> +     * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> >> +     * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> >> +     * earlier.
> >> +     */
> >> +    if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> >> +            fb = conn_state->writeback_job->fb;
> >> +
> >> +            if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> >> +                    topology->needs_cdm = true;
> >> +    } else if (disp_info->intf_type == INTF_DP) {
> >> +            if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> >> +                    topology->needs_cdm = true;
> >> +    }
> >
> > Just to note, the needs_cdm is not enough once you introduce CWB
> > support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
> > don't have), but this doesn't get reflected in the topology.
>
> Hi Dmitry,
>
> Ack. I can add something to make atomic_check fail if the input FB is
> YUV format and CWB is enabled.

I'd prefer for this to be more natural rather than just checking for
the DP && DP_YUV420 && WB && WB_FMT_YUV. In the worst case, count CDM
requests and then in RM check them against the catalog. But I had a
more logical (although more intrusive) implementation on my mind:

struct msm_display_topology {
    struct {
      u32 num_intf;
      u32 num_wb;
      u32 num_dsc;
      bool needs_cdm;
    } outputs[MAX_OUTPUTS];
    u32 num_lm;
};

WDYT?

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>   }
> >>
> > --
> > With best wishes
> > Dmitry
>


-- 
With best wishes
Dmitry

