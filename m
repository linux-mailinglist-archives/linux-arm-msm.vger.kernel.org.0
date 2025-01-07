Return-Path: <linux-arm-msm+bounces-44215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 836AEA04C30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06AC18866C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 22:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6CD1AAE2E;
	Tue,  7 Jan 2025 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuhZGkEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48281AAA1D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 22:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288754; cv=none; b=WZlIXcOwhhq111y8+f4DOnVSnR8W7L5R+TRvyMGlou/b705Zjjuy1ggWBKyH2KONHzg7nR6+3MCswLnsBk0CegPb/RW7jpfuBEVntasy7zskTgbKrGIyGjrlFu7x0KU658DJsgYftqsJ887ld/hL7pz7/sL2O0Vp5xrmftADvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288754; c=relaxed/simple;
	bh=yYGrbZbIjKEuYzARcxhoOlOXMUDDXOwDKAYFFOKNkIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1oYb6lhGreVuqgC+vfRcOIrIGzGgFBjaRX6pOHq+zLucY/lLeWoBvxXgxKOZhelwguApAIda6hIoXygJE16R4n2sPKuNvViFDL0wa6Mzmfxy8Yfcb0yC/Qd5K+Jjl7Q/ZAT3ipQlkYA1bzz/pZasCtSvRyQG+aLcSGrbhXvwQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuhZGkEC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so16758157e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 14:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736288751; x=1736893551; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mMn+z48n5sDePMLHOThKGK3HUHhS6YpHtjLFF5FzZzw=;
        b=KuhZGkECHWmQrjxskLDfDOKpI1MRFhIg1xPUJaX1tUbakaTPtqh6oStAp29czOwOoE
         4TDu+ATjJtQiOSZwvo5PeB95EuRejmCNtEGGNl/uFz4o6HBnsUIwZhD3i4bmueablbKO
         U30lwj/9kP4EQmg5Kw9X2gTiGheg9EKrRzROHdOvi7mkK67pjBWLdgAJpbje7G7LXsar
         H+aijv3TKNUqM/aH1kIzwSAUglwVxAQxK/GpZBvsI2OzpC13N4aYKlaPgigN1Bk4ziWj
         vnd7XuJj2abB114Fr3Xwn8J6VDvDf7LBzYjV+83atUc+nnv3cqxc9W8FTeaGKa5Hq3LW
         E25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288751; x=1736893551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMn+z48n5sDePMLHOThKGK3HUHhS6YpHtjLFF5FzZzw=;
        b=LUqJDSkEmkIQ/qn/cTtlIHbFiRlF7y/RKIVQy41FojvDN9XR+VIcWUKOtySlmjOZQ6
         E8Y7BoB+KEkJ9hls6hyUppQrnj0vKekTfcI3/43rXwjcK3RC4XcG8HYrM+UjjsMbTnNs
         0UTKAwGpVMFc0ve8d1V+eOtlN8SwwM5ljN5ZdX3DFGyM13kZZu9BpOgpOjqTBd18EFUa
         aGt/Pu4qkiVF24+Lb161vFnFoWraI2E998kRfEyQDOyqBKykJkcZfPmyHXOLv4k5BScH
         FgZ2UvgO+NyWDtIexQRnEEZerbRKpH1/VQqhLJ2br9UuRgNXkz01UdBytBAwC87PWpeN
         OrbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfIPsGEPUo2KjaSu2kx86vAQuZ1zxtmOo+uB6jcZLlo7KcVs1Jj3Ek5MLB1FtvgG9HWFkdLPYkDaiVCVq6@vger.kernel.org
X-Gm-Message-State: AOJu0YwVx+UdUYdKRD/+t7SKaJ9xioFobvQpZQG1haI1KpP3R2/SiMG3
	D7skDcdMne/djRA0s4avOZUK9rI0DrX09PfwAIEb1hjKEVlzMo6ipY8qAoEb31s=
X-Gm-Gg: ASbGncuDpJcW4ErqeNynIhxyGhEdx0+QVw4qxqm8vwOS0Xry6i5lvR8hKJ9fdfXAuTc
	TMX++TJqoqf9Tz1xsai9i4mJrbthNiFfNc6ES9hNzZPKpkjiK2ZXRJeNQf+8sDXGRpUxOa7TIxp
	xuARtSr64gGsnAHN7/N1rrA/eurZLlpVhYCo/duRyzIABZi6lZhAOHLpd/28M4A2A3Tel9x/h10
	QeUDho9/9akBLQBFJETzOHgMIopSfGBH1ocRuJ8AdDsYOQVtbnyWTdfgm9zBUda3DODTv4smODA
	Dk2Ue4hRn+WMm/01NR62lCBfbdCT6lJ57onm
X-Google-Smtp-Source: AGHT+IFCpSE+6bYHg6NHBaB8kARffXJeZAVotzbF1jSuppzcHd7AtPj85AqoS/RBH5MSht9AXr1DdA==
X-Received: by 2002:a05:6512:2803:b0:542:29b6:9c26 with SMTP id 2adb3069b0e04-542848108femr117742e87.47.1736288750743;
        Tue, 07 Jan 2025 14:25:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6002sm5357569e87.36.2025.01.07.14.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:25:49 -0800 (PST)
Date: Wed, 8 Jan 2025 00:25:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <mo45zzcmr56grnj42o5rc57t2xdj3rq27chryaqbiwzcbzhjdh@4cvk6er7fr3g>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
 <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
 <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>

On Mon, Jan 06, 2025 at 04:21:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月4日周六 01:51写道：
> >
> > On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年12月20日周五 07:46写道：
> > > >
> > > > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > >
> > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > >  #define DPU_MAX_DE_CURVES            3
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > > > >               trace_dpu_plane_disable(DRMID(plane), false,
> > > > >                                       pstate->pipe[i].multirect_mode);
> > > > >
> > > > > -             if (pipe->sspp && i == 1) {
> > > > > +             if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
> > > >
> > > > Separate change, please. Also I'm not sure how does that work with the
> > > > shared SSPP case that I pointed to in one of the previous replies.
> > >
> > > Maybe we can add a peer member in the pipe to reference each other, then we have
> > > chance to use multirect across all pipes in all planes.
> >
> > I'd rather not. We have pairs of pipes. I'd rather see the code stay the
> > same way: processing one pair at the same time.
> 
> I mean only use the peer only when the SSPP multi-rect pips cross
> planes. This shall not change
> too much to current SSPP management.

Still no. Please please don't add extra 'peer' member. There should be
no need to have one.


> >
> > >
> > >
> > > >
> > > > >                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > >                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > >

-- 
With best wishes
Dmitry

