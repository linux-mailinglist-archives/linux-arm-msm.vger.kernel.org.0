Return-Path: <linux-arm-msm+bounces-48732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BFA3E056
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F57F3A4DEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3920B200B9C;
	Thu, 20 Feb 2025 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPLjjBcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AB1FF1B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068247; cv=none; b=fBbLD8zn1qoypQhuJLOkI4qA8xHZUPYT3ndT/UnH42KJU7J+4lN66zuBntYDwHfG9/zNwCiY7lNskf9e0/MIckvTJ7QbQ9ndOTWhCMgtsXNgsI66FkeiRRh15xWElmvG+niNcI2SkvJhA4xlTSKf/ZW4ZL0f2Cig2Uw+OzhViEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068247; c=relaxed/simple;
	bh=a3bWlj9KxQ4SeDO5nlRz4K2d9Se5cXopGD3sUzlhvN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAk3SOwTAg1gfXrk1BPowjA7jSwRGYqtORigM/U5ri+jimUZKtZ6k03IrVtHNziCEXnDIcJLwkliUSWo4JKe0L3mumR4OTCje28ao3auY3GEQ3ANHQzbWuNIq26JwpWqflj43ReaDSc/7mXZ+H/md7fbjm/UhutLm7OvSLGYRiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPLjjBcN; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227c56b11so10565671fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068243; x=1740673043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YxCgzyXpY/JXfZWrj67IExkL8lKhk1y+mpy4/JkmQsc=;
        b=TPLjjBcN19jUeK2pWoKITuuFIla0FjxT544CTgk3xLzfcaKUEf79VpjQFTPZNbGm6k
         3qKy7AK9qVAR6yezJwSQWbRD290mptp8XpFcurL8H6cKPmDWSwsNJjRDT3vJuBTm7x/r
         6izA/GZwSdRmkG8jtVDzgbDO8Zy1Ppn3X8x9K+aR4760EfRd7QJ4ENXHXTaOeniT0coS
         h5IjDeEt95egp18+hGUB8kx6oRHfZOVDsIW0vKhgX1RK8bTY9DRjcM1AQKNC5yLevqYg
         GMeL1Hz1kFqxQNuyGVk6a5e5wCowGz4fjALr4prpCd0FaxDR4HQRwnH6IR6/0KJOoj3K
         9S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068243; x=1740673043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxCgzyXpY/JXfZWrj67IExkL8lKhk1y+mpy4/JkmQsc=;
        b=KrWe5v9Hd1d5IxibblgesMHK2QFL7x+aRmFGlBsfg0OYC1ht6azYyYtrRwFaxmzLke
         YPUsbE4qd0mJD4yR5js/CQZuWTGBPAIcoFYyHYlstoPeXhF2YawcjwwB3LeoVcaCnFz1
         1BVjDvgII6u7TdlT55CTv49Pqy9oFXKC3XWV8UHkc/jwuTTjpPMDbI4FeJwVhrLiKwRh
         4Q/oJgk6tgrK/CKdUUvOZR/s35VZDn9vcusbKm6rizCWPhJFJxjmavuonTaN7orF5oYS
         1spi2UyuGtcGVnisdrjpXvIOzkbMtGozjSZmtvb/Jf4GZ4Z4dYZwWbEttskwV4G9zGoj
         kScw==
X-Forwarded-Encrypted: i=1; AJvYcCVpgDMS3BqkmaH3hmfVTkak3tdsvWMN+oCfYzEuFIlePdngRy9r4a7mdahrKAD30mfVFAOzmlZgXexewuP3@vger.kernel.org
X-Gm-Message-State: AOJu0YweajryrtkQKZ6VYe6x3Mp2KO30dEA/ujbYE61pd4+w1vTOj9Td
	WrgOcQdtfS7IcSdlyqPyOAsBZq4ZBnYGK26WmUC98JZGRRfz6kMPZlpAva9UAvY=
X-Gm-Gg: ASbGncv0GWdqXWXCEA5E+g8NAyadyrFGeO2kzFcpEMH6zdnuPTdz52mvt7wHxz8Eomp
	9jo5VQwkh56MYXwcAV7C1h6ccv71typIZhhqzzsLC6yrnJIQHgMNJKaBwjPgcpbICNwGfgH1Iqj
	WnVf3CLew9aU3DskZaK+4nOE3P+KHIELyDVzVOTsfnOEvUwP8sniw2+kFc651Ow8mQo5WZ/DRAg
	Bx12FuAto0FYid3r7PCz0Wp8V7zGiymJ+d/dt5sa86X8ovFOu/jy+BcHpPVDuZ8Z/8btmDzUfyD
	6sdWd4R3kyi4BBYH0+j81CLwzcdTid3qpEDWCxAaCOD7COgM9WXQ7J0ntJ4ewJIwltoP1wM=
X-Google-Smtp-Source: AGHT+IFeOg7tp5OAbgC93OlXoFFngw3d0ZH7XDdUb+7qRylGEOLb57jjSdQNnl0wj9HshJooaXws4w==
X-Received: by 2002:a05:6512:1306:b0:545:ed8:abef with SMTP id 2adb3069b0e04-547243c34a0mr1385075e87.20.1740068243179;
        Thu, 20 Feb 2025 08:17:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545f60c18bcsm1624130e87.2.2025.02.20.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:17:21 -0800 (PST)
Date: Thu, 20 Feb 2025 18:17:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>

On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月18日周二 03:57写道：
> >
> > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > Currently, only 2 pipes are used at most for a plane. A stage structure
> > > describes the configuration for a mixer pair. So only one stage is needed
> > > for current usage cases. The quad-pipe case will be added in future and 2
> > > stages are used in the case. So extend the stage to an array with array size
> > > STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
> > > stage structure.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa816fe74566784844c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
> > >                                      struct dpu_hw_stage_cfg *stage_cfg
> > >                                     )
> > >  {
> > > -     uint32_t lm_idx;
> > > +     uint32_t lm_idx, lm_in_pair;
> > >       enum dpu_sspp sspp_idx;
> > >       struct drm_plane_state *state;
> > >
> > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
> > >       stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
> > >
> > >       /* blend config update */
> > > -     for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> > > +     lm_in_pair = num_mixers > 1 ? 2 : 1;
> > > +     for (lm_idx = 0; lm_idx < lm_in_pair; lm_idx++)
> > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
> >
> > I almost missed this. Why is this necessary?
> 
> It is protective code. In case there is only 1 LM, we should not
> iterate 2 LM in a stage.

That's not what the code does.

> >
> > >  }
> > >
> >
> > [...]
> >
> > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
> > >                       mixer[i].mixer_op_mode,
> > >                       ctl->idx - CTL_0);
> > >
> > > +             /*
> > > +              * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> > > +              * There are 4 mixers at most. The first 2 are for the left half, and
> > > +              * the later 2 are for the right half.
> > > +              */
> >
> > The comment is invalid until you introduce quad pipe, currently there
> > are 2 mixers at most. However you can just say something like 'stage
> > data is shared between PIPES_PER_STAGE pipes'.
> 
> Accepted.
> >
> > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > > -                     &stage_cfg);
> > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > >       }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d02074505c5474a547a814 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -34,6 +34,7 @@
> > >  #define DPU_MAX_PLANES                       4
> > >  #endif
> > >
> > > +#define STAGES_PER_PLANE             2

BTW, This should be 1 for now.

> > >  #define PIPES_PER_PLANE                      2
> > >  #define PIPES_PER_STAGE                      2
> > >  #ifndef DPU_MAX_DE_CURVES
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

