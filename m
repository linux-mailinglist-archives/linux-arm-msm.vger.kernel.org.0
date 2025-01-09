Return-Path: <linux-arm-msm+bounces-44685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9BA083B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2503F1675F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D9E2063E2;
	Thu,  9 Jan 2025 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qfi49NPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D0205E22
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736467065; cv=none; b=bRVcDrbUTGiWRzmgFcbfkAtUeKaO3WMqQJHb6B4nLKILMn907UQ8+p8V2urLugBzS6X9lcOefbVq4XJacehE9G0S8zj+ahs0vaY4m5ZT20zq9vfTB0L0t51dxXacC2klsBf3eGGLZB0ExoH2rcQx3TWVvGVeUTRn8VaRi1tJF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736467065; c=relaxed/simple;
	bh=/IqFR84qWpSKeGYsUa0A+VLSgzQyolbai+JNyY5zxxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFlC2nNzDcOr5lWo5812kW6Xif+otcc8Xt2PzCdWFhw9VyxD1eX/46FtnAXom6REnyObRnPG7Bxy0ooM3msECzGn6n0X0ZdGDzLUjJ/04VgtHjztIUx01PN7d+9S2Qjy5cqo2y0whpvsuqf21Vbpjj2nV2XfE7Ih9d0DzMU1fhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qfi49NPH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so10620601fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 15:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736467062; x=1737071862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79FHqofEtRr0hlMpVLWdJtC6zUk7BGgo+xqNv88BarQ=;
        b=Qfi49NPHwsJWc2O5a5ZlToUx7LexWu9O5fYVhbDNgbEJT71hZOdmJNoD9pmlVCJm6O
         lih7Dp1W6s5W/sHlYDZM4h0XlPDTxidE0jpDIhfLvaVAofoLscfuCubqlG5DaynpGNi+
         HdDUn8oQ890z6P2JBaCw0GovLiteMBdwrXXdTnZwGeVvhsb3qHmjvhHvAL3vgMA0rRs7
         629jq9uPKqrh7glaE+GDhTSFgj0XSRDYyBxtV95ZnlCJxIzhN3s2NDPzOlyo/nqw68Z4
         sJEweVG86eGSrXQ7JsSpt8bGfsFbFOpoBNTGAauSBfXqM0U0nAbR5qPhWg1MWyb/Blhb
         5OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736467062; x=1737071862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79FHqofEtRr0hlMpVLWdJtC6zUk7BGgo+xqNv88BarQ=;
        b=FkO+7ytJR7tMf8L2pvEHDR9849XAcYYBvL4DWBGueqTeipsA/dGiSnmztB6xEHm/4g
         ssZEBmyA9v1oq/QFEeVlTMgEkq+ItaCY5q7jrIxSmxtOgCwk5K/RZ0DoM/cBHxLB95sn
         67Jz71hR+JT8obQMDXTD1I4SOsYNOI1TikL/1FmdQD8jU5sYpJEsvUJU7tooKoA+ooDx
         JZ5OLkZwVvojFio2hB5oHdnaIgNxvXDzkDct1m4ObjQ82lBqf1kzwADcfAT3DT8ZBnwb
         EmsSPbZqzJt+VisAbUILAp1xlRjDhXwFFsBZ8iHRv2bp8Vl34I3piNTBX90cxRVAgq8t
         RdQg==
X-Forwarded-Encrypted: i=1; AJvYcCVN/iuYvkXxiaScANuab+ZmtbYccOHvH1LdSNLzfmCWGlbicygVD07obPptJUySHtyXHSDW8A+ljPyO/HO0@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWgLqwk6RdvFqlNuxC2u47xu6yAFAnMCihxM7JSY0/roNTXRq
	olJFX7vj/gDSX1iitiW45SbcwKl93ylHcBmkQDI4qR63fG5jlaww/mhiFi+qsO8=
X-Gm-Gg: ASbGncvh6dDuGfAY5ROHYXbSKGhwhwsNhXqIz0mosv6PqxV0Augn4EOeZWyxxXWCScS
	NKxAOJ6XaTOSC7urqWfMiAk4QnjQPWnBt7aYsTU65X8YVp8TgBjaMee6LL6rpovnDqeinwktw5T
	I3bRsfNkIeC+fgK5Gk1QrsziyWCbGFtrXEnJy2X8jSTgS6YseQSuChq367utq4wmOTI87Eu3HCV
	POAM+y19/BAggISrcu3UudBd3nwZjDcul3CO41QaSIDEWYPVDNwIFZ+5cCojsjUWqOXpikUq3nW
	PKEppMHwrdvLbE3HdKR3jrolc338/B7sJcoi
X-Google-Smtp-Source: AGHT+IHKbDVXIxAZdZxXANVu9gYbEJQ+jYurQOYZiJih1oOmheQ8+kN5cRpFn4H5d2vGBTXPfoMOKQ==
X-Received: by 2002:a05:651c:546:b0:2ff:d044:61fc with SMTP id 38308e7fff4ca-305f45f37d2mr25960581fa.33.1736467061939;
        Thu, 09 Jan 2025 15:57:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7b99sm3363311fa.84.2025.01.09.15.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:57:40 -0800 (PST)
Date: Fri, 10 Jan 2025 01:57:38 +0200
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
Message-ID: <t7ga7l7hi5y634hc6sklp6mzae3jfqs66nkalviojrzrgez3kf@b4h4ue6fdj7j>
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
> 
> You mention that drm_atomic_helper_check() needs to rerun if mode_changed
> flips. Would it be possible to implement this instead within the helper?

I think this should be a driver's decision. For MSM it was easier to
move the mode_changed changes and to isolate that before calling into
the drm_atomic_helper_check_modeset() code. Other drivers might prefer
to rerun the helper.

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

