Return-Path: <linux-arm-msm+bounces-41550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD59ED4BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 19:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999CB283D23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 18:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1574E1FF1B8;
	Wed, 11 Dec 2024 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2SDwYYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773424632F
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733941978; cv=none; b=C5IAppozXAIknahde3dBKPxz9FtAQMDjvaftMZJbMiY7FPDUxEBabUBil6dZQ9BqLoTZLIipiMpZz/WY21I2gKgZ2isO3jCaAGX5C4QQyINiNDVAIxwlVooyk2iaGflu7Kec940oKj3qe/bQSmJFv46ApgdIZ55IFrv7TkKPQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733941978; c=relaxed/simple;
	bh=JyMdFqQ5H7a+y8ZEgtz5H4pttRzC1chxkXLm88NSVNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSLnvVr5382vlB2RgmR4C5YvbBLDxiYGAzinkSEXqM1nDsYL204ll0vPXeC9Lp57EXvtalAG1yfIUZAnTY+tMCVOhhP+pSRVfe2mswWoSw2rukH/Kkm7AkYkE1uhq1SMN7q7b6/3mTxZSwOITnnCFioCj+zPzR1FGjgsHJXDFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2SDwYYe; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4402573e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733941974; x=1734546774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwjqsNH/3nF2Q3XbWudExYhlk4EBq4Q9BHCqHdvdEaI=;
        b=m2SDwYYeWD4JdE/vgvBEToHnM3qCJ0ziUxTHBlSEv4aWQsECsTww4wSKqpyVK2KUXD
         bXfA/ubryDkZ7+XpdBOrm2LBtCP4OrG0TcfIggjeD8mRIRaNZ3rGHBt97E9SzGWmN50L
         jca24gP0wWkS9UAXeVJ0YkzvIWxznoPTwdR09FSToPMVSLdN6T2cBxOeGo+iRwjs7rsW
         XkferZnL+cilsS7PzterMuEMPY+4JEnuHWhnL+/VC1FFY5ZEdFLHdu0Jv+o2UvPlGEaF
         gU7aJm9rcF9DeUFGNbXY/2EJF4yADt65sRIt9u5gdT3UdZwcYs1aKfxEBRYRUB277ThM
         n7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733941974; x=1734546774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwjqsNH/3nF2Q3XbWudExYhlk4EBq4Q9BHCqHdvdEaI=;
        b=OzFZypraCZRQer7Nv3888EOtU4/fivQ5zMbPGkp48ypxMEvQzqhFSNFyigjhlm/LoK
         fqYtdkHuf8jarwNZwCZkUl+V1KVzjLoaOtc1Sk6bT7Pe9BcyVUTEPb780eEVlST6WBAS
         8w+BgeGPdVzJi3W/Y+DMrLSKV1Hx2PsMxETIQ7skP7OfvPKwHEIkGVVcyS+w+prhecq2
         LE8h4ddv05xglcm1OYLL6eyUWpIB7JAv+U+8gzVz8scIiG6JOLCp6jGPKfSFOxW7F1U1
         YUJeRsZgaujSRZwfDHe9mKGxspvbC+5MoRkk+I2OTBcoCbBFvOE6vaEzmjFPCJ6K2Ad0
         ETGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGi8VmoGSo/JhR5sZIk4gK8r17XrEhl0YU2xmV7kr13HOcmeADlMyH8Sz2+VfUTgQb08FtaDMVv23GSaIX@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/Na4+f7hXmCT2mZeRlGEI7CUyY48GxepPZ21cW2Pwk/aDcSx
	T+spfmKlZy9P1BKByudleV/TIbyIcg0U/PKbst3lgEG/j1hTBGpE0dfe1fVWrmQ=
X-Gm-Gg: ASbGncvfJGXZ1Z9YT6wvu8D3YjoOAHAxq3Fn/CqD6Dt2//MMLFWM0odid+g0fGm3+6I
	HZ9W6nQQRhn/Lv/Uu0eHTf31PCB/t5riEE7FdcRUIsVYvZuGgD7c/yPJ2P2Z88t7c6FD56jXIup
	u23uYLW0uCXMmdDtfB/i4jnErTrVh2swbv1NZajq1LNiNFWQ+xEt1kNICVaG+3diixB56UtiKi5
	Ai4wBDh3OBh5A74ehb0eSho56Njzrc4hVhgmIAukbRZYvm3B9bQ4T1JFou7SdMdvsLKWDPOcCbX
	ltzxInpJd3y1c8ojXMdqLgvXUvrL+PfFLg==
X-Google-Smtp-Source: AGHT+IFmZdkDf94Jsx8fCrALITW/9iPuUY5e7Ad8TDSKUOMmNblYCFB7l7IPRhIdF6tMpVRDpdpenQ==
X-Received: by 2002:a05:6512:1329:b0:540:1dac:c03d with SMTP id 2adb3069b0e04-5402f04d0ffmr331050e87.57.1733941974289;
        Wed, 11 Dec 2024 10:32:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401d2aab5csm1134637e87.168.2024.12.11.10.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 10:32:52 -0800 (PST)
Date: Wed, 11 Dec 2024 20:32:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1mk08SHEd5_vc99@hovoldconsulting.com>

On Wed, Dec 11, 2024 at 03:42:27PM +0100, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	return ret == 1 ? 0 : ret;
> 
> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> sure it never returns 0 (for short transfers).
> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> 
> This appears to be what the driver currently uses, but why not
> EXPORT_SYMBOL_GPL?

$ git grep EXPORT_SYMBOL drivers/gpu/drm/*.c | wc -l
962
$ git grep EXPORT_SYMBOL_GPL drivers/gpu/drm/*.c | wc -l
93


-- 
With best wishes
Dmitry

