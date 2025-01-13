Return-Path: <linux-arm-msm+bounces-44861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F971A0B19C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DCE18801E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ECB23315F;
	Mon, 13 Jan 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRG35a3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BF249F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758059; cv=none; b=adC28O8mq9u9kcO8P1VhBO0ogGliHVGbqRHSqSZYlP5pB1Dbh3k0gmd7rtFw60yY3Hy/LavhXDyIAlVbYrDdTGCh+pG33+wvNseUZf88ffftVCCJEfeJxh/aCE+C25FV/VEa9GaWO9FRqlnCrhMmw0lz10+r+PCCv9BD8S5DLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758059; c=relaxed/simple;
	bh=cijMUYPH385DIjxG4eMFPXBl9zKH9zua0WNv2mSvMd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9ZzGLTPHqgfduf4VwAJ6zuH6TKjqdW127clJvuPOwJJK1NiCRa/ieo7H4URUTH93tuN3yGYLQawPvrCgeee4Ux+EcsrUZEIHv5Z+3Ag6f1dIzQRJktq6+8G4Esr83fXt5nAg1vCYkF7b7E0XPpb/JDCRDhqOY+fgu+UNJ7ka90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRG35a3p; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so4908101e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 00:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736758055; x=1737362855; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbA7N28Us7Vr+7VJn+xTT4k5t5lfn0IEvogilmiRnfA=;
        b=jRG35a3pGOPfwRz3I8SWSk4X87NCaDPX6JhCgoXs/fffD5wWKANyC/qLsQ+wjhSBkS
         1HWmZtAyxDYcaleug1P6Ea1ilITLex4f7rmRcZkX+nMUiwEISGeKgH05DWoLzG3SZmi2
         MmA/sm9mnM9adrFltaKnmNTbQt/fEIIZYHPybHdUpLOAlegDHS+pXhGT9s6v1AvA3rzE
         tp4xr5orvl1S8g7zbEQdcsq3uY97ZY9U+N6Nf0bnblBR3nVXXRI3aSVMV9npzqoQaOeV
         AmNYnr3cTsgLxIfNhIP6eU7vj6CuYA+L+EPdjipsO3pw5iq1PAQeRObiqVymPHkrPKXx
         vfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758055; x=1737362855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbA7N28Us7Vr+7VJn+xTT4k5t5lfn0IEvogilmiRnfA=;
        b=nJTHK/YMrG9F3A4NYKum+MLFtukY210GLyjIc8ac/tL3SzfDe3Htyn2R0QA6DsplED
         ZRvuHeHHuVZFNglfNCeYC5K3q8yVjaCnCf1mwZ9E+r25rIXqHTsqG5xl26auLSAm4Rwn
         kr96dTPZMLFdfvuAc1WH0TL3lQM9LItbfg5mn4ZRpQ9PErj0I2Sa45idQFSi9nF/2Q6e
         5EAfJPu2cGluhyfPKQ6yGZAK00d6vn0ZZGMVkr9xOWRIw4rV8nHBKxBMY8lbrxCbZ2fm
         m7z+hIwlyWaTlUw8NPOt+2EGKiUJjFcx88ulyUAl8pm3q2wHjRcLGlnKDxMlDjvnW6qP
         ofaw==
X-Forwarded-Encrypted: i=1; AJvYcCVM3FIHc2oDQSOov08g7zKxPV71jJqBK+PA/53oFuWXHDI8t/Ay7p/ojwxGdOF9MWzPs6zMThbfF8YcpYWo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9HmzJ3XRhV9+VgY8jWQgGsiXHrWLK8zrbzFwXSh9NcNtWkKvj
	34S7qr7dx7Hrb3lJgP6yryfDhKdjmQ4iBLr3r9Ay/W7W4FWfFobigJw+KFsK+to=
X-Gm-Gg: ASbGncu/uBAdhkASm2p1tHx0hjY96rjr+ewXtVu6MYJdieVtU0UtGN/defq37vUUeuX
	KZ+l7SASNHT2YxvF2+9DskxmRHGBG+JZ0Ttx5RTQui4LIaoLN/GV/nHcTNdfu97Cgta7kGJaMHC
	t3iUcyj+v1QynFxyFd1w/gIGEkRYvnPpaR+XP37mldkjR3BnVwEKnE802oxE+ZVL8M1YQ32Rqpj
	NcvwQTjMVsezPAmIJBYA7thHJyRFbzr3CcskTjIulYHx3IWZeaPTmQHyuldl/kbJvX1EDSQCHmw
	LmcpLhDo7pZVwRLlhDs/xFPMpHuQng6JbMB/
X-Google-Smtp-Source: AGHT+IECnRlWJYygMd3OjI6hYNyjvQCPtRVHR3YG5DLTJEoxW1qbQ3tX1+uH0zp6a8djtx9mw2QjYA==
X-Received: by 2002:a05:6512:3d19:b0:540:20c5:f847 with SMTP id 2adb3069b0e04-5428c2df79bmr5063496e87.22.1736758055509;
        Mon, 13 Jan 2025 00:47:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becb15dsm1251610e87.238.2025.01.13.00.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:47:34 -0800 (PST)
Date: Mon, 13 Jan 2025 10:47:31 +0200
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
Message-ID: <kwain2xevvf35wxf5xyes4jdpfk6mdblhjg7cwc64t3tedbrxm@cegm7ixqaasq>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
 <t7ga7l7hi5y634hc6sklp6mzae3jfqs66nkalviojrzrgez3kf@b4h4ue6fdj7j>
 <29dcf748-c571-4c91-92b7-481be5a43ff5@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29dcf748-c571-4c91-92b7-481be5a43ff5@suse.de>

On Fri, Jan 10, 2025 at 02:30:55PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 10.01.25 um 00:57 schrieb Dmitry Baryshkov:
> > On Thu, Jan 09, 2025 at 02:53:16PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > 
> > > Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
> > > > As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> > > > drm_atomic_helper_check() require the former function is rerun if the
> > > > driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> > > > drivers which failed to follow this requirement.
> > > I'm concerned about the implications of this series. How does a driver
> > > upgrade from simple pageflip to full modeset if necessary? The solution in
> > > msm appears to be to run the related test before drm_atomic_helper_check().
> > > (Right?)
> > > 
> > > My corner case is in mgag200, which has to reprogram the PLL if the color
> > > mode changes. So it sets mode_changed to true in the primary plane's
> > > atomic_check. [1] This works in practice because the plane checks run before
> > > the CRTC checks. So the CRTC code will do the correct thing. Reprogramming
> > > the PLL means to disable the display at some point. So it comes down to a
> > > full modeset.
> > > 
> > > You mention that drm_atomic_helper_check() needs to rerun if mode_changed
> > > flips. Would it be possible to implement this instead within the helper?
> > I think this should be a driver's decision. For MSM it was easier to
> > move the mode_changed changes and to isolate that before calling into
> > the drm_atomic_helper_check_modeset() code. Other drivers might prefer
> > to rerun the helper.
> 
> Is it legal to do something like
> 
> int atomic_check(state)
> {
>   ret = drm_atomic_helper_check(state)
>   if (state->dirty_needs_modeset)
>     ret = drm_atomic_helper_check(state)
>   return ret;
> }
> 
> within the driver ? It appears that the atomic helpers warn then.

No, it is legal if I understand it correctly. The warning comes up if
the dirty_needs_modeset is set after the driver returns from its
atomic_check() callback, see drm_atomic_check_only() patched in the
second patch.

> 
> Best regards
> Thomas
> 
> > 
> > > Best regards
> > > Thomas
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493
> > > 
> > > > As suggested by Simona, implement generic code to verify that the
> > > > drivers abide to those requirement and rework MSM driver to follow that
> > > > restrictions.
> > > > 
> > > > There are no dependencies between core and MSM parts, so they can go
> > > > separately via corresponding trees.
> > > > 
> > > > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Dmitry Baryshkov (6):
> > > >         drm/atomic-helper: document drm_atomic_helper_check() restrictions
> > > >         drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
> > > >         drm/msm/dpu: don't use active in atomic_check()
> > > >         drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
> > > >         drm/msm/dpu: simplify dpu_encoder_get_topology() interface
> > > >         drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
> > > > 
> > > >    drivers/gpu/drm/drm_atomic.c                |  3 +
> > > >    drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
> > > >    drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
> > > >    drivers/gpu/drm/msm/msm_kms.h               |  7 +++
> > > >    include/drm/drm_atomic.h                    | 10 ++++
> > > >    9 files changed, 192 insertions(+), 43 deletions(-)
> > > > ---
> > > > base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
> > > > change-id: 20241222-drm-dirty-modeset-88079bd27ae6
> > > > 
> > > > Best regards,
> > > -- 
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > HRB 36809 (AG Nuernberg)
> > > 
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

