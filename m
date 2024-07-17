Return-Path: <linux-arm-msm+bounces-26506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56499934495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 00:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 973B3B21986
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 22:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A0B3BBDE;
	Wed, 17 Jul 2024 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="voP7Qvvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4DB2574B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 22:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721254160; cv=none; b=dA+ifmRyDLuS4XR5Jv29KvkH9BZ4UFN/Wn1sKr9QeqYsZUwlCJHD3w469UWRc1U7PuHFmoXcIx3cqdHP71QAHjJc6PVuiFpCHRo0exFgDOZpbFUlFPVughBA8MwMdwhLKzvT3/MSiFvr0dMepnBfnEEf6KjEguUu/oeSt5P6Cnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721254160; c=relaxed/simple;
	bh=6gstO4ngk3iydAJkm6Rk7mmCuW1pWKgKKA93NTQ7e3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsRDg7D0gz8xbiPSInN6K4uL3E8JpSQdasyUWNI26Aqk+px3+c9EJcM2Bp/tDN3GAUFVgQYAgs5qoJw+NAFIUg4PReUCUsx4Dh2Kz0rScCTxs5jXZX0ca44oJYAyg7qnhb6APgCyaW34P8w1D+B4lFqQglRsnnsE2YZ9245bdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=voP7Qvvw; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-66498fd4f91so1077507b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721254156; x=1721858956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsVDKWypgLDT5YDLNjnV8mTYT3kKNXub5wdl2QEBMpM=;
        b=voP7QvvwzirjV0Ich+3vU+/WbMr+y6QTZcJcEDHEyBngjN5epYBDYpAnvCnqq45XRd
         EzqkDyh2tOlC10AM7BPwcyqBTCjL4xluomAmhVtl82EawL7+OYjLZ/fUUVAhiXA+5sKS
         8Bun+Oe3AXzBI9bNNFdIIYIHRczwu8MgMwbxHEqYncgxJKKKlL//WTu/JJYOyFuyK+dZ
         O+Aje9X/usVzPX2TKH2edwvpRZKuyg60o1ASThOuj1gP1WDOrd8LsZSvksfJuClml11L
         9l6OiAMwJ1KcgcF9j5lgilm3LK0z3569SE9MrPh+5/f/J+z4Qr3Y8Dj4qCYVSsZzHRZi
         OQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721254156; x=1721858956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsVDKWypgLDT5YDLNjnV8mTYT3kKNXub5wdl2QEBMpM=;
        b=iWFrC4/RtI8Vlx7WOLoyB+dP5zXccH/PWC+UQtCaeV/jZdfflVqjPRJHQi/MotIOLf
         cOyyFvlVI673V31VNWbSmcwrIqh6BGBO+EFL/y8C8WM9QzyNxAziAk3DPKBB6n8fq26X
         pH4VfDqXqqxrFnpv2AC8mWaXKieEpNaVZkUCVBHJmb5dsLdNF8T7LGW5hltptBakWBoG
         Q/QwToWvFmNFUqPQ8iuKt0o13iWIWYlfJu7wqZtdjGJM57ud2FcPf0kPgyGlfZYm1Hn4
         rR8mTxOBiYBvUzYExSWumg1rt18Px4pUpUtlfmBgc9hdumZC2u6RjfeJ/zRDLDew+cSG
         s4eA==
X-Forwarded-Encrypted: i=1; AJvYcCXsWMcxWiafR72logINf55spwLBZKptYKuQQVlwPLK6DyCwhz8tnlHoewCms7dsJGlXDjMwhBAM+OxMT3YR6uIaZxUEY/rFR4cT0I4YSA==
X-Gm-Message-State: AOJu0Yw27JvHfSJYatve4++WmPXRsC7hYX5Qc/JZjGTDvA/4tm0THe+g
	UdtTc3LSOTYw9U7AIblaPP/iKPnnkte/X+7n9xTovmaGuRGVQemCDl2oCDRHeOElJAJmPY2hHuo
	J2ictNEJuLAdFsltihuQQk0bLrgqxVvs/2Tbp/VDdUCm+LKam+nY=
X-Google-Smtp-Source: AGHT+IGp53w5JFJXinLfxngAAOC4Se8zd8clOSSE5HSo6ISXAyhqoYmBo0Hc7/CZzmDiE/S24AngXbmiTkF8yavGN3A=
X-Received: by 2002:a05:690c:4d48:b0:65f:7cee:43b with SMTP id
 00721157ae682-664fe071e10mr34429437b3.19.1721254155923; Wed, 17 Jul 2024
 15:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-8-501d984d634f@linaro.org> <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
In-Reply-To: <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jul 2024 01:09:04 +0300
Message-ID: <CAA8EJppGC_u-79YyXqXEeQAc9oBUOm-+ZuUDu_3b8MWnVVAOxg@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 23:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> > The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
> > sizes and pitches. Drop format field from this structure as it's not a
> Missing closing brace ")" here?
>
> > part of the data layout.
> >
>
> Its a bit subjective IMO whether you consider format as part of hardware
> data layout or not. Registers do have format bitfields too so I am
> somewhat unsure if this change is really needed.

It's not a part of the data buffer layout (num_planes, sizes, pitches
and offsets) - the items that are defined by struct dpu_hw_fmt_layout.
As such there is no need to store it in the structure. When necessary
we can always get it from the framebuffer itself.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 31 +++++++---------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 ++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
> >   5 files changed, 25 insertions(+), 38 deletions(-)
> >
>
> <Snip>
>
> > @@ -318,15 +318,10 @@ static void dpu_encoder_phys_wb_setup(
> >   {
> >       struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
> >       struct drm_display_mode mode = phys_enc->cached_mode;
> > -     struct drm_framebuffer *fb = NULL;
> >       struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> > -     struct drm_writeback_job *wb_job;
> >       const struct msm_format *format;
> > -     const struct msm_format *dpu_fmt;
> >
> > -     wb_job = wb_enc->wb_job;
> >       format = msm_framebuffer_format(wb_enc->wb_job->fb);
> > -     dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
> >
>
> This is interesting. I wonder why I just didnt use format directly that
> time itself :)
>
> Maybe I was thinking that mdp_get_format() will also match the modifiers
> and return the corresponding msm_format.
>
> >       DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
> >                       hw_wb->idx - WB_0, mode.name,
> > @@ -338,9 +333,9 @@ static void dpu_encoder_phys_wb_setup(
> >
> >       dpu_encoder_phys_wb_set_qos(phys_enc);
> >
> > -     dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
> > +     dpu_encoder_phys_wb_setup_fb(phys_enc, format);
> >
> > -     dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
> > +     dpu_encoder_helper_phys_setup_cdm(phys_enc, format, CDM_CDWN_OUTPUT_WB);
> >
> >       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >   }
> > @@ -584,14 +579,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
> >
> >       format = msm_framebuffer_format(job->fb);
> >
> > -     wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
> > -                                          format->pixel_format, job->fb->modifier);
> > -     if (!wb_cfg->dest.format) {
> > -             /* this error should be detected during atomic_check */
> > -             DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
> > -             return;
> > -     }
> > -
> >       ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
> >       if (ret) {
> >               DPU_DEBUG("failed to populate layout %d\n", ret);



-- 
With best wishes
Dmitry

