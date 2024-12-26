Return-Path: <linux-arm-msm+bounces-43420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E009B9FCD3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 20:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9271632BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5888249F;
	Thu, 26 Dec 2024 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngAetQ/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC45381B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735239890; cv=none; b=cBHB6NCYNt62xfDnLAK20USVFY09g51QRZsF3H0SQLQ7JWNU/8ky38Ti0zifDjMd8mZdoM3QLE0qc7MXOlVQ38wRFY8cjinP0SboXtYj036uvZuKuzyy7xQKbYrBcTqvfrE4StE8JmdmHVXRBLeB6rhTnUVPfckW8GxaKIqJ/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735239890; c=relaxed/simple;
	bh=bG34lR5EKVjETbphvznP1ZSDutifbde8KU6IYEp3c9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHg/js9rm90faIy/DKkUpbM/sEHJBkcfFVWkVqYACQtQ9vXJiqNMm9W2pO3mLP1agCaH+6aZCx5ZpBPyM/wcrUlJTvxzNnZgMooWCp07q49rn68w47vHW908e57eRZJh2mqcYauvx0dt9qxlPwlODsgfjftBnQjqhSHh4uO9v0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngAetQ/j; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso71903441fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735239886; x=1735844686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EQIjBT5f7zxeyyEBxV1apf9FaTpVhQhT6eVJnqm0klc=;
        b=ngAetQ/jNkk8bLnf3JsHDdVrZEO/Aarak1rRrDcg466v86XGlLB0Wl5WOnZ/gr1iEf
         BmO1mEuEz/Wk0eUwTqzKJIcf3AGgCt1+Ql2GC96SnsuANxkhXLb9HyZ/xWSNQvW6HPsu
         hDdifD7r4FdsbPC6bPxDM4NDTUkgXG7aYJaJW225tuu4Q9w8HX6ikrBVCcAa3VXoLLRc
         JxlfuBIFwkGWGhQ+yzHsGXbTarHFW7Dm0kRfa3e2BvNu90/Erb9azE6cygjqagREriyg
         +nl2UB9v1ao3fBkmivx6w1W4ISCLW1bEIHR3IkdHowI83AMcw4yiKPkZSHL3T2WCzC0T
         zZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735239886; x=1735844686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQIjBT5f7zxeyyEBxV1apf9FaTpVhQhT6eVJnqm0klc=;
        b=rUeVdgEyiltqN8ZC6cbgf2qoD1Xgct764Jtu5akRsEoqPH5T44tKe9zLrv2EWKVNAj
         0/EmQSoDoKJ1F6E/wt1etDeIKBUp92Kx06OK2tc1euzJokyG94wJpopa6uNK9w+xlSA2
         PCOQOhG5FL2iFi0cKSyAzUi0fdA2apRW85RT1EXDVVMJmvNys35zV8IS1eWuQgToW8VO
         c8t/RCZ7NdSXaER+S4WlIT7Wo1v6GK1yFQ96dG8HV+8W26eMeUm9Zlhl6sd666cFTwVu
         61VR7Ztrx5q+VH/S2GwN84bnD4TmT0lQZIr2Pq/wPzFeuj4O7SMUgTgwfS/bDvVcMCov
         4NWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpMntOkRt3LaVEVMPCjwJh43ixt3FwEHuoTqCHn48VHCQR2q/sYzm5rSUaNA1BoQSPTQnroiL3TKD+E6cD@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDGCowy1xa2Fs7+rpf1FYBuZIfZu3qRzFSTN+h8tKa7FKCHaJ
	gREFJN5s6PDdh3j7t6e3tnU98+0t91tZcXKuguC0KM3wU9Ly4D7CTdQfpoyuDw4=
X-Gm-Gg: ASbGncs+kKu69xcrigTzQUW6E8PKhBSt4E+xKJxQKZJ5rsC4tsOMyXQD0b7TdEw6ocg
	qnKq5IzCJknl7pmTv5LHKHi10/BxHB5Ss9/QOxoPzINoSYt9QfsdpyGVSyREEtkOT+dlTv9RGPF
	E2XnXAfySORj0Fdcf4kOpETB48Q+BFR+TXEta3EQzd7FyDqsHqa2dpYFFy5QurHhcC4B/je9xKG
	p8OJoMurX2ZbA7uCuNGXRagcXk9n74s5T0IsTq0WgGxpqYyQbfv7FxLgMphE8U/Z6UXjh6kHMIT
	S1ud3zhsEDF5Xuvk7mcziJP6e/OlToF1JLiz
X-Google-Smtp-Source: AGHT+IFPpW5f2Enccss1o+KDXJuhkH70AFTmBNJ+4hoRITNkp3D9ubEy94ORaBhzWal/SrBrPh6xIg==
X-Received: by 2002:a2e:bc09:0:b0:302:1c90:58ee with SMTP id 38308e7fff4ca-3046856ed2dmr81393031fa.18.1735239886544;
        Thu, 26 Dec 2024 11:04:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bea0sm23984211fa.42.2024.12.26.11.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:04:45 -0800 (PST)
Date: Thu, 26 Dec 2024 21:04:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <xqnlucuofqpex427dawqxc3kggvt26s63i46wfi3ewuboo7nab@oqutuzpmy2kf>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
 <Z21HimmBvwwA7/KD@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z21HimmBvwwA7/KD@linaro.org>

On Thu, Dec 26, 2024 at 02:09:46PM +0200, Abel Vesa wrote:
> On 24-12-11 21:22:00, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> > > According to the DisplayPort standard, LTTPRs have two operating
> > > modes:
> > >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> > >    requests, while passes through all other AUX requests
> > >  - transparent - it passes through all AUX requests.
> > > 
> > > Switching between this two modes is done by the DPTX by issuing
> > > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > > 
> > > Add a generic helper that allows switching between these modes.
> > > 
> > > Also add a generic wrapper for the helper that handles the explicit
> > > disabling of non-transparent mode and its disable->enable sequence
> > > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > > to move this handling out of the vendor specific driver implementation
> > > into the generic framework.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
> > >  include/drm/display/drm_dp_helper.h     |  2 ++
> > >  2 files changed, 52 insertions(+)
> > > 
> > 
> > 
> > > +/**
> > > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > > + *
> > > + * @aux: DisplayPort AUX channel
> > > + * @lttpr_count: Number of LTTPRs
> > > + *
> > > + * Returns 0 on success or a negative error code on failure.
> > > + */
> > > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > > +{
> > > +	if (!lttpr_count)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > > +	 * non-transparent mode and the disable->enable non-transparent mode
> > > +	 * sequence.
> > > +	 */
> > > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > > +
> > > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> > > +	 * the number of LTTPRs is invalid
> > > +	 */
> > > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > 
> > This means that if lttpr_count < 0, then there will be two requests to
> > set LTTPRs to a transparent mode. Is that expected?
> 
> Yes, exactly. If counting the LTTPRs (see drm_dp_lttpr_count) results in an
> invalid number (e.g. more than 8), then according to the DP standard,
> we need to roll back to transparent mode.
> 
> Do you think I need to re-word the comment above more to make it more
> clearer?

My concern is that you already call
drm_dp_lttpr_set_transparent_mode(true) first. So the DP should be in
the transparent mode. Then if lttpr_count is 0 or less, then you call it
_again_.

Shouldn't it be instead:
drm_dp_lttpr_set_transparent_mode(aux, true);
if (lttpr_count <= 0)
	return 0? // or error?

if (!drm_dp_lttpr_set_transparent_mode(aux, false))
	return 0;

/* roll-back */
drm_dp_lttpr_set_transparent_mode(aux, true);

> 
> > 
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> > > +
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> Thanks for reviewing,
> Abel

-- 
With best wishes
Dmitry

