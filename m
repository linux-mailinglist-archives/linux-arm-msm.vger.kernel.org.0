Return-Path: <linux-arm-msm+bounces-44377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB73A05C74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15271664AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127DB1F76C3;
	Wed,  8 Jan 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="naKhyRqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C91F8F06
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342201; cv=none; b=nqkzx/83aQxlqSmWY28U8zSDahcobRDvjzXFb40MPNUSHmcQmN3Seuwlze0revpArJ0xMca4eQsiTDZLkRauuCiimfJHIwlAis6NCkDtZSu3QaC+tWvTjO1fgFKAZxemShKbN1e19XJfvA+eK7K4znIRRq+/PJvxeoPuihYdnxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342201; c=relaxed/simple;
	bh=58fHc2ylZsBzk/+g0gPOZYXbq7Taq9dz4tCVApLQD6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd2fuiDFmiLKJhcA+/iTatrUwz5YmRHB0C3KfrKoReHOTyHA9zgVnQfJCzIoaFgx50vFnNEcaprxdRt9XWw5eeQca+mVVw8lqr2y6+fAMtxpY9QYJ7HeAtkip+MSMwoy7sga7JddROC3goW8OV7PomdVtrXeYT1/RSDTfzvqV8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=naKhyRqE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so6411430f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 05:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736342197; x=1736946997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=go7fn8G/ymJBJOoBu9CCL9fg2QtY/C41teH6UPJDvwo=;
        b=naKhyRqEfMY+edEs6oYsbr8xfaGwHwXKxyy2kcy+XSEyP81X6WUxZ6m85+ExOK93OK
         bUq/xCSsZnu++oLIVRYYkFIGWj2tc9Ni9r8102VTAw4vlhQyb9oKmSZUZNBNwro1ypwd
         /3tsT5xZr+IBz/ibpGkCYhfzU5tCnbiUlU3OFED9Qkbw0VX8tJItlj3HLjZ1XH4u/wDg
         vqeM38pJkzNGr/0ZOAas5y1nJBKP1PvD2XeQD9HryaFPHAD4ceZYhLgjBDBE7RVM7fyu
         V3u6k0ddV5pspSipVnSGwu3JXy2Ef5HRQ7i8cwe9BmImE3JU8RFjoKlYilsAiNXJKh2R
         yMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342197; x=1736946997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go7fn8G/ymJBJOoBu9CCL9fg2QtY/C41teH6UPJDvwo=;
        b=pNxMMXFEKorxuJQVDdMh9uUuWDy1rnOy9KrIwhP6RK9B8ROs9GVt2TmetPfG0oZW4/
         AWzFYDF2YGgAuuuOQBHDrDqg2nDxLewaAdQg5vdNLJxJV0YZDrVBsWVaWGKKbeZuxHs3
         eM7qmcv3SJYd7C85uTOYOaNf/yTn5HsSOsJCBfX1TbctEJk7cgt1BMST+GV/9GHqm2pG
         iv0vvoQ/ThL4b+g7dsZ0ItmHy0tXUCIToqXvY6bDuJvXqnUWWlNCJU1+7/ZWyuIvrMW6
         SCnMsRM87sC86nrXo+M1vrqqVhiJxUJ4IlxMbtLqerKUe/7WGgHNCXXl8kpB7v8Vp2Xt
         NLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNwx/bYV7cSyjppTwMXRrBhq7abMxePeKNWFMnC2Relz0HovoPwUGvtHduEg4XXuE2b9WNMY22kKWeexth@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QcG0MrZvsZtzoRKbi/WjlJEBpX5EoWxCBMmkAgvvDLoxJPLP
	dKvc6thpc517YhXLaWKBTAhvJ5G7axRPmqdbpxlS4PV7F8Kn2FnUXZsg3Vx1RvA=
X-Gm-Gg: ASbGnctwmFKSV1NV0dmKGcSrhqzxsHvPfLM8ZjWJCgEBc7uH8qt2GZYi3B7g+OFbYgu
	mI0wwZb+r/TPOrApqcuXaPAtl+xoZ3sZpyH5uNikJuS+kKWNOxmY5iDAkGGYivhog9BkMvCgzUj
	bQ3XSmiYwSq/0K2iEeErGD5YYqaVpTw8buxZtTKoFH6WmWS2qn56QPaz252zbklpfsBO5BnnkjA
	8FQINicfNBI/sGI72blESjRSij5jUjxqLJCzCRaupITaYW8ghNIRiE=
X-Google-Smtp-Source: AGHT+IHuzod8aMhCQ+n6NVLGNnPNVKNs6REXYs0yamrClbVZfZoa7djflMAszxH2qhTaAW4scrTx/w==
X-Received: by 2002:a5d:64ed:0:b0:385:e303:8dd8 with SMTP id ffacd0b85a97d-38a872e8b18mr2604012f8f.26.1736342197530;
        Wed, 08 Jan 2025 05:16:37 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm52417065f8f.32.2025.01.08.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:16:37 -0800 (PST)
Date: Wed, 8 Jan 2025 15:16:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z356ra0IDQ4SMbfN@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
 <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>

On 25-01-07 10:30:29, Johan Hovold wrote:
> On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
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
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
> > + *               Negative error code for any non-valid number.
> > + *               See drm_dp_lttpr_count().
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	int ret;
> > +
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (lttpr_count < 0)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed
> 
> typo: transparent (2x)

Will fix.

> 
> > +	 */
> 
> I think this comment now needs to go inside the conditional, if you want
> to keep it at all.

Yes, will move it.

> 
> > +	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
> > +		drm_dp_lttpr_set_transparent_mode(aux, true);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> 
> This looks much better to me now, so with the above addressed: 
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for reviewing!

Abel


