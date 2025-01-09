Return-Path: <linux-arm-msm+bounces-44500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D01A06CDC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F69416689A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81E913C80C;
	Thu,  9 Jan 2025 04:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7ElqiKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A6313AD1C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736396566; cv=none; b=jpqUlIlTHXHGJIDCfOo212SpQB1td5kLJfvRVImKIqRnqr/lLdCEfVQMfbUZLW72gadyvWmsOfxgMZr3Ie+DMeWmKgCtWV8K7+LF+QRmK0YEtCAOXWxnI6Qtk6X/s9AuDvrKgFauD8Xm0td7E/D3NKIFxVG0nBXmz+zdrxPRcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736396566; c=relaxed/simple;
	bh=nmSC3BchdMq+tyFMfm2CIqyoRRTi4shLDD30scJ2kSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKNyLaf04tHJG2T4oRkaxS401AFM3Yrwv9iIrJkrrPQC61y/8xUgvsgICZW8nuVWxoNgcs/lsbdvZ+1q9I2n2Wsfa9rxSI63ebVluxP7pA9oQp+OUwpQjQ8IXUP06IOLlHGE7F3TZ0QRUSvQvf/Gtgi+L6DPLxOZ2PYnhyleA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7ElqiKQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3778bffdso509606e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736396563; x=1737001363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8RZpQ2r9Mn21NHPw670vKYSiFhVy622sgKUY1Z4mzI=;
        b=d7ElqiKQs1pS5HiSjSo4lGBc3mY5WTi3S7vAh12omMOe0cawIV2hPNERiG6d6P9aX9
         6Ik9zWrb7UC9BRFk59WO91khS0ias0Cu+iaNe1sp4PUksEQk7hbK1PZ/XUTv9vnuCz7R
         9zXis924X/POvyJ3h5p0Dztv4XxK3gEcCuFckMRa1wqDzrdwEaMWT2nrzWEPjCgC4iHj
         0qFJjbPtHsvvip86+fP8OFlEp6WT8UbMRhO6q9FSXSblGZVa/r6lncgsWHEo7icwcqLb
         mS2bs5AaPnEDE/hkgOSO2RliRpIxqghLylpEKc/lEnpPsEc5h9sbQ6O57MUczhZomN6e
         tSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736396563; x=1737001363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8RZpQ2r9Mn21NHPw670vKYSiFhVy622sgKUY1Z4mzI=;
        b=qLG0mitLroZxv27B7jaSWSOhJTA5W1yAg6Ec/1SdW9lhIf6S/GFeJVBDFoBsml39GF
         sPn+lZ1IgcOacjdWML3mygWUtM1kyp0Cx+H1Z260nC87YFx5X0qDhqm+bmpL3qBp0dXp
         2aAMNyeR+/rVU4n2A6/4ypgSjSZu76dFna5HZ9Pf8gMqgR1zvMHY+M6wCbo3ldjWPiwp
         MQwSUmivph5zTy+LTan9tMXh37/zFhAVyr3X4Rc0XCI8wprt4cVbEcQ8JaHch/hgQzLL
         rB7PcNr4+/dPPx2bwRaXZ99RYYpgcKKUbDVARAjfQUl/3qmxKg0HUIilZD1EVy7KWdD8
         2JZA==
X-Forwarded-Encrypted: i=1; AJvYcCVGKeOK6xMpcNkQJ0Iv/QvIlgBK7v6PjouOzO2IRabihelH7wBpuyQg2mtSxptvFOQvPA8Akp+jKq2OSuRw@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdfGfELOYbyhwiXgP+3CnT8s6xipTqLYGO4PWvUnTfs9OXfnr
	QanQYzE+fGE8FE/VIfTmuVO0FhM9zVSskK8f8XFeUWJ/aELD4IMsfmby3izzmPg=
X-Gm-Gg: ASbGncsTTLTzvFoMppGv/s5e6Ueewl+6JZDqzlThfzuTTpqURIhjdE6/0COccA73+0o
	6dkiLYQ4ZVD7VhDnzmmWHjaNfqEAmcsjKA7T8tljcZ7covm98YKkZHUeuIPTiom+ntNRyxs3Awr
	jpRRODYHWsHEunLkQ5U4yFrKh0GaA4VEu3FoVZGX92koXcFIibgBPQ/CHhb0UxYMkEMYGq+jvmX
	cgknzG79qQUkm7tCOWxc9FvvAhZkitX3++liTRxhyoTnAM3PuyARfEtoDAG3mLDW+IqvMysKxPc
	/EQxSlc9SxIFp+DIOoGg/WJqJYK/7r/zp/96
X-Google-Smtp-Source: AGHT+IG1V8Jg2MaRUXUmzF8uHSbf02lJcqcW8qbepGUCESN2xtzsOIioyzPL1t8gTqIQIkv8DzAQUg==
X-Received: by 2002:a05:6512:3e23:b0:542:1bdd:511a with SMTP id 2adb3069b0e04-542845268e7mr1247466e87.13.1736396562833;
        Wed, 08 Jan 2025 20:22:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be549c2sm73895e87.109.2025.01.08.20.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:22:41 -0800 (PST)
Date: Thu, 9 Jan 2025 06:22:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
Message-ID: <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
 <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>

On Wed, Jan 08, 2025 at 05:19:40PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > The driver isn't supposed to consult crtc_state->active/active_check for
> > resource allocation. Instead all resources should be allocated if
> > crtc_state->enabled is set. Stop consulting active / active_changed in
> > order to determine whether the hardware resources should be
> > (re)allocated.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
> >   2 files changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >   	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
> > -	/* force a full mode set if active state changed */
> > -	if (crtc_state->active_changed)
> > -		crtc_state->mode_changed = true;
> > -
> >   	if (cstate->num_mixers) {
> >   		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
> >   		if (rc)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
> >   		crtc_state->mode_changed = true;
> >   	/*
> >   	 * Release and Allocate resources on every modeset
> > -	 * Dont allocate when active is false.
> >   	 */
> >   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> >   		dpu_rm_release(global_state, drm_enc);
> > -		if (!crtc_state->active_changed || crtc_state->enable)
> 
> I think this was leftover code.
> 
> What happened was, we used to have dpu_rm_reserve() both in dpu_encoder's
> atomic_check and mode_set. Hence this is checking !active_changed because
> that case was expected to get handled in mode_set to avoid duplicate
> dpu_rm_reserve() calls. Code has progressed since then to drop the
> dpu_rm_reserve() from mode_set and only use atomic_check.
> 
> So the correct fixes tag for this should be:
> 
> Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")

Actually it should be:

Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")

> With that addressed, this is
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > +		if (crtc_state->enable)
> >   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >   					drm_enc, crtc_state, topology);
> >   		if (!ret)
> > 

-- 
With best wishes
Dmitry

