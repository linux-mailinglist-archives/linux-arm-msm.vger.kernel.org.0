Return-Path: <linux-arm-msm+bounces-44553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4BA0756D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F73A1644A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D89F21764D;
	Thu,  9 Jan 2025 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hGQcPTj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E87216E24
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424868; cv=none; b=TpO3Gi/PR3+/VsYIkbffBVQuOaGifYavucLX0kPRkAxCH7wdJTmC3UiNgWu6FXTGyX6fNuRvwIDpZ5qTzBxB5itPJwU7eyXMw98r9s43ZXnSyLPR9RDytSJXjrpSvLDr9JOMBF42xMNUNuyV4mf6NGDlJzx8S4up8rq++mnmsrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424868; c=relaxed/simple;
	bh=8Vv2C9JrNlsK2WjWmy3HhCT7El+dsWz+YiIQGAZv1Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBOUGsBUQ7QJyzzmBrv1WXejHPqIccoZpZ1+pneNKfgf3epIZQcMAB+ZlKQEMcHZBKMj8t7Zzw1JQrZKbbSZ3GVl7dADkS68pIkxhfA3wX8wqKWJxBuVtKgC1H/ylwM0Ib19A5SKDcBq1e4ByINBxHJXe2Cto8LUQyfg1PyMYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hGQcPTj5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436341f575fso9198435e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736424864; x=1737029664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgi4e6BoGIUkq88BVzT7YBbI2Ar0NhYklw/AGMjsAlg=;
        b=hGQcPTj5OD9dr8icYh3aUe8YZzGY5BLBWeiq3C8BW64bbwyrj80rkGOrkoXCHFboN3
         YcJXgvHM52xjTgM8mTFuxpJEIGEsm0k+EKNpQs7WpWeYhy1jHpY339/dEGlqO89xrDcR
         lsQi9cRczh2+0eJnutu/nLsGmoqBH3nC7LRj0Bsn++VNllRz5yy7B3EsdcFBsLbfA3gC
         qsZDleTZmI+iDyRl2GTm9MuDzbQah6X/Dplx/uS0Rm2wTFlsm9Mo7kXMdRrYG/wcKRqO
         5+BQJT+i5uy6sjBHQq3p9p5SEyJAPbdofNa9tCPzlQ4E0yu+Cz92/MSzAnVMCAgo+kcj
         dFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424864; x=1737029664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgi4e6BoGIUkq88BVzT7YBbI2Ar0NhYklw/AGMjsAlg=;
        b=vPCJsm5QLKHT5HhACKmTSa4M/jY8uDeUY7Qmdca1lev31PjmTA+9Jhri5afl1n2LhQ
         O+oLtUhRqjMImUZbm2qxtEW2ruJjgofckY3XlTs+KLvW9c+jf+KZvdMLZO+/KzRtCVtl
         3+2batNHUgAZbSwb9vwiuXk0723mXxL/nYGDiHDvnX8F/9kg1Okx7DY7ncKY00Kr/QD5
         TtFIe80Mc3TcbrEvSUQY7LjcIacBOnZ5wyPJOXYTtTu30IYRMFYshwJGgMXPj9oI6V9Q
         Th1Yboe6Fdc2EmsbBSydCL6acj2i6rBF5PV8r3W0BXg9GAAr/lVVfd0M+gahsvL5y6CF
         5PvA==
X-Forwarded-Encrypted: i=1; AJvYcCUWlwhoVHdW6MRdUWWY+Z+JVI72Jd0IIX5lrm0s07XIXNzk+izkGva7rSr98iNDoHvrtGZ9zOCeryVxnLU0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++bPcA0bxrvupUm81SQDYNawGj/6V62pi2wOoGPB7wKs8qjLI
	0qzYjfdm2exh0FjMm4Vo3W8c8atI13Fqf6nCj95paDY6+1SYEFpZ3AuWU9XJ7fM=
X-Gm-Gg: ASbGncu7V8D+AWh3ZoetkljZvv0p3rntO2gtX8JtY7P3YP/vmyvvNdso+JRm7Z8KlKe
	Nl+FY5jCWoVPxAkfR5B2Sr8ZJFh5VCdWC3Phlcv3gf6FfqVGRmN1NL2JoJq+bpZDU5zsq+Rygzm
	a7nyRoRmBDMHKPHUHiOWNqgYu6SHchC2lehgy+o4fbgs9LnRW+3oLKrG5OqbsITuE/FdpQCydtn
	1jwIEza+j5hycs8u5tkVs1fPeZv43aqRT/m2TjSdTeMzNDAYPI4APw=
X-Google-Smtp-Source: AGHT+IFZfJfwssLNpBYM5MjiXFRSaZImZ4dWDIr4RYjQoPZfimRRPYITmNGGjTmVo8KU+9ieJp1Ivg==
X-Received: by 2002:a05:600c:6b6f:b0:436:e86e:e4ab with SMTP id 5b1f17b1804b1-436e86ee529mr33625975e9.30.1736424863901;
        Thu, 09 Jan 2025 04:14:23 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6401sm53853955e9.2.2025.01.09.04.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:14:23 -0800 (PST)
Date: Thu, 9 Jan 2025 14:14:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z3+9nUwDyyYkB2Jl@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
 <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>

On 25-01-08 16:17:47, Bjorn Andersson wrote:
> On Wed, Jan 08, 2025 at 04:31:43PM +0200, Abel Vesa wrote:
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > Add a generic helper that allows switching between these modes.
> > 
> > Also add a generic wrapper for the helper that handles the explicit
> > disabling of non-transparent mode and its disable->enable sequence
> > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > to move this handling out of the vendor specific driver implementation
> > into the generic framework.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 64 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..fa7eff94d408718a1762834597f0cd51376d2596 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2817,6 +2817,68 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> >  }
> >  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
> >  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> 
> kernel-doc functions should have () suffix

Yes, will add.

> 
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> 
> And this should be "Return: ...".

Will fix as well.

> 
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return (ret == 1) ? 0 : -EIO;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> > +
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> 
> Documentation also explicitly says not to leave a blank line here...

Will drop the blank line.

> 
> Regards,
> Bjorn
> 

Thanks for reviewing!

Abel

