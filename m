Return-Path: <linux-arm-msm+bounces-45970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8CA1A3E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0EA13A2A95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1050020F092;
	Thu, 23 Jan 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ux4OxYbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E4F20E306
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634128; cv=none; b=jx59xk6rvkBm88F/CbJzTKGxToZNVa4hFstsW6TXMPNsV+i12HYR2FdglOeohfziPES4k0r3dwuZShXYYX5Szwn8weApUMKHTPNJDPdbBsW/eg5b7cddnn+5fR3uIWXb7Jkp13UIYJw6yqUgEOOyLsxkcwcON/OiC8BAWrp+Qg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634128; c=relaxed/simple;
	bh=fun4xThgDQFgrYdVjjOh/OiQnfLLoxIHi3OsdaNyZKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLECb2PIYSGQEjgiYu+rsWvsN9fVc3h3FnvVO9Veal/EQFeCk7fmQTQxe18Y4Lrb61C/GJk+fXJx2n/Q6xlI/CA8c0nW9Pp/O0Zc4Xo4WpENCVr9HPVg0Pacry6fKJw9jnM8kOAjaVxfrp/kbbctZkbtbKb4cQD4tdfH9VLslgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ux4OxYbS; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6887so948625e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737634123; x=1738238923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTmEOgD3xfc+fwIttOduP71Ufl9BgBhivnCzDUxKm9A=;
        b=ux4OxYbSd5QPjufxHOWhyJkrbfnmG+Fke51VMDyXv1Otwlnpq6HAy1/4BJPw2XLUTK
         +Zp0yKZC7wox4Dg0kW3tavlQIGEKxU9dxOE87LkAEK0G3Mc3xWCnYD94c7Z6fXj9rBMe
         /I1n3ZclouC7ZEiK/LVbtMCgTRNl7Bkm5iDD0xJk7TUcVxEQNmEwO6reZgCqYh+g0d1h
         nLx2786oUdibtGGAZcOJjuaeOeg/GfTFuBCG5dB//zsNOz+fwttJaRmi+o14XMwi9Dwe
         WWGhlpGHxC1reIoVTzTpd9TarC72HW4HBByYalxiwJP6mZIGMzOndaCeB0tzR/6o6H17
         5FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634123; x=1738238923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTmEOgD3xfc+fwIttOduP71Ufl9BgBhivnCzDUxKm9A=;
        b=sOaTXGJy4RT1V2/PNBIEagN45nVI2uEAiMFLz4d1T1ez/Wblxq0fYE1zS+2tLBdxk5
         iI2Cbre0vdWrBdRj5ErN9XrmrnXqyehBJZJEj5MLfqKEiHfMwykXwyMDMiE8VQv/1hkE
         2dVZmnPj7NLRwINBcpVEqESwnCqRY+k/8Q1xqd0Ed2jNeXX5Iv/8/8SAdzB5l2DCwC90
         xhf3GgvnzPrDj3/DyMTfvElHQta6eKDtqP1UTiuicBFsKm1O6dRQn2TkwGCBjx0Q6Rng
         HmmBGWoRLVh3H4BKmxEhmgzsCiWs00dBa5E8hlypozidFzt0ZN2t3Hb9upNynFHs6CZ3
         Xkhw==
X-Forwarded-Encrypted: i=1; AJvYcCXMQFG70yn8ZaEY1cScTwc4bepGiDbLnjILazaJRaP6d8yhZSEz9/+cjsHU55HNnygbhjJj1vCqPQC9Ogvd@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxE9R13jl8zlsQdKKcHXDwjTHi+/4Mjz1F5OJwJgUe59uJxwe
	LfKOXXnJELXn1sMKAJX3CDEab8yxW0jmduzp/vhLGTLNm8u9rceuMIeuuGH/axY=
X-Gm-Gg: ASbGncvJxH2uvp2aVv8PcZXcDzFP3Speaw1PUzSLPGVNAuQRj0lmS0UCRVwZLovh+p8
	X6mrF1tX/+ddqzpsaF4zGrnfAhfVo2cHaByc5bm00h6lCZmEqteDmzdFTgs0jkT+uvfweE31akX
	Am0aALszaFesmXrmecx5tNr5YEryFdbYl7DlQqSLydlZ9UDxAfQ/cVB8Cqsf2pNAmw5jdTAsuY8
	DVbIojAbeSVbqJVkCtTMwTrkMM3frd80ZMYW0YJUrju81TxOdYk7V05dd1IpdkQ7roMJASL6BeO
	y5AHBYo5eIPC55VxlXBesnWfhvQeZXqPkDwCDghs0jVBivugxMibrXjhTdEk
X-Google-Smtp-Source: AGHT+IFbOx6ctuTmmRLLNk/eHiWv/TSPLK7NEzKkr1HnoNXi9QhiZe7Adm2mXqrnq+teryB16WA3sQ==
X-Received: by 2002:a05:6512:e8c:b0:540:2223:9b0b with SMTP id 2adb3069b0e04-5439c282cd8mr8971004e87.35.1737634123427;
        Thu, 23 Jan 2025 04:08:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bae0ba76sm786051e87.8.2025.01.23.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:08:42 -0800 (PST)
Date: Thu, 23 Jan 2025 14:08:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Sravanthi Kollukuduru <skolluku@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
Message-ID: <bfuplxwielalawtozidaoj67smxlzqxatwjl7rza5o4gqgky6y@eika3dvihvk7>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>

On Thu, Jan 09, 2025 at 02:53:16PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
> > As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> > drm_atomic_helper_check() require the former function is rerun if the
> > driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> > drivers which failed to follow this requirement.
> 
> I'm concerned about the implications of this series. How does a driver
> upgrade from simple pageflip to full modeset if necessary? The solution in
> msm appears to be to run the related test before drm_atomic_helper_check().
> (Right?)
> 
> My corner case is in mgag200, which has to reprogram the PLL if the color
> mode changes. So it sets mode_changed to true in the primary plane's
> atomic_check. [1] This works in practice because the plane checks run before
> the CRTC checks. So the CRTC code will do the correct thing. Reprogramming
> the PLL means to disable the display at some point. So it comes down to a
> full modeset.

After giving this a second thought, I see an obvious issue from the
generic code perspective. If you set new_crtc_state->mode_changed from
your atomic_check(), then it's already too late for
drm_atomic_helper_check_modeset() to add all affected (aka routed to the
CRTC) planes to the state. Their atomic_check() callback will be
skipped. So even if the end-result works in the MGAg200 case at this
moment, I think we should still disallow that.

Another option might be similar to what we had to do in the DPU driver:
check whether the mode_changed has to be set before calling
drm_atomic_helper_check(). Maybe we should consider adding new set of
callbacks to the drm_*_helper_funcs, which are executed at the beginning
of the drm_atomic_helper_check_modeset().

WDYT?

> You mention that drm_atomic_helper_check() needs to rerun if mode_changed
> flips. Would it be possible to implement this instead within the helper?
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493
> 
> > 
> > As suggested by Simona, implement generic code to verify that the
> > drivers abide to those requirement and rework MSM driver to follow that
> > restrictions.
> > 
> > There are no dependencies between core and MSM parts, so they can go
> > separately via corresponding trees.
> > 
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >        drm/atomic-helper: document drm_atomic_helper_check() restrictions
> >        drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
> >        drm/msm/dpu: don't use active in atomic_check()
> >        drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
> >        drm/msm/dpu: simplify dpu_encoder_get_topology() interface
> >        drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
> > 
> >   drivers/gpu/drm/drm_atomic.c                |  3 +
> >   drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
> >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++
> >   include/drm/drm_atomic.h                    | 10 ++++
> >   9 files changed, 192 insertions(+), 43 deletions(-)
> > ---
> > base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
> > change-id: 20241222-drm-dirty-modeset-88079bd27ae6
> > 
> > Best regards,
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
With best wishes
Dmitry

