Return-Path: <linux-arm-msm+bounces-41554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E419ED664
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 20:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCCF281418
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 19:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC022594AA;
	Wed, 11 Dec 2024 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzGtvK3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA825948D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733944929; cv=none; b=JeC+9tpLFe6OZvJMiLmdoV/4zuoOB/N2QhdFbMnw0oiguBT1asMCYais6moYW2syJx4/LgdYrqv9rJ2SgA5TBv/M1PjcONf5lsZpnesIsTAnvmrcJppqNCNwylqLWi3B6rYJH/rwCPK0ffRT7gy6MFOoO12NQAojkfPPjiMKjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733944929; c=relaxed/simple;
	bh=11evcTn2jA7V+NZsSFqxVqumc3HPnPBemNUZBzUxFOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AokCISGKO55tnun9LdOf5Phen2+SSuF9RD20D0FkJ2l0HKzMmdQe1JVl9vAdJ0ziLFjowcL/EH8AYOZYEAptT/LxSgcN4TdXDZvq4CLyjvAG66uXRw8DEy0TFUTcLHxLpESWFlR26g/CT7gluzq8oOp8u108JTkZ+CTEKopUeaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzGtvK3c; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c52000dso3938348e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 11:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733944925; x=1734549725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhMIxqS4yJy4TMfF6IpImxcWZLV7gqt0icqJ+XQLDEs=;
        b=MzGtvK3cjtRIrnlvgucLSMR1ApKqUkQ/VtN6mxhZiqnr2TmGobWrA5sx69lV1AUrB0
         KfiXiSvoQ9OrIqIKdVMv7+bif08bFSLbomKKFsjgBWII9eDK8zYwPhJdaNmKCX8Z3EVo
         wQlmMXUYSJHphIZeNa5K8TxZgoT5TsmMwSH2gPISIBwJC1qn1A+ljoM6n3AHb6iOYPbY
         dgkbY5+v6z4Liqh+VeY0/dmIX+k7AACIBVpLNdNgk/pKViMw9XPKzOl5QY/94zrDFQTW
         eAE8mjx7Zs5mGT9vxTcA+SAxuH2uQlAWNtZh08YUK3kF4mJXCVTF0YnqoE1clFaZ7keI
         kxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733944925; x=1734549725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhMIxqS4yJy4TMfF6IpImxcWZLV7gqt0icqJ+XQLDEs=;
        b=ijonou6L++LejiEKXIpkj/jKmrC28MgQ8GHTpUWIoFjtTisyt2Rt4QRgmaeZ5emD9T
         AWCHa8HSVvR4wugPbAAx0huqcInSJRKOyw3vB1cjwNonKz5D3KTI0qEx3ueKi5AIF3l8
         bvBd+z2XOQMstJc9O3WSkyyneljtBD7jEXG+ZJ5tEuS64KNeCBS9UtpyY6042vLxeSOu
         RD3MfUNWYvbtu3fXGgVKvS1g9UvYfxdaovFzrOCMVHZw41iEBrqxDHyyYltGdNfTWXlG
         mH6q1JUe23EkD59hSTMNGuXiMqSNUNTCZVqz/7mLnEdQAHn+b496pUoA7/CGT5Lhpb+w
         5e+g==
X-Forwarded-Encrypted: i=1; AJvYcCW0CaKIsEbCDHuxdRpxye5Pwufsqa63JQY9GT0uLGyDO6t2lCOfIemW4pDy8jryOjEn9YODB2MNUg6yZrce@vger.kernel.org
X-Gm-Message-State: AOJu0Yybli1eETsUY1qOnK+R29D0ExpHuiF+wRfyNTUb8gJhtgsXQEyP
	UEgmlG2/3vhELCK2LjbCNm4yHU0BAC0jw4jZjLvoyY2sO/KCMGiwu90f9TdlYgQ=
X-Gm-Gg: ASbGncvch0ktHGO3jOPVm+WAw4aHBr5XVPx88TQPfH/Pna9WSBfHADfS6b1mpuO3KNV
	YtcWkcC3MmxXFNh61V8QeJ7caKkB3qTqzwrV8OJEneonyjnNeq0I5aTG+2jOpoVh2iWY1op+26b
	+Vjs3+DZ4X2OImjCoJN+hXIlDHEDUzcwBWe4NcTxvOZTfS0L2bZfhRZUKugMampbQsXI2w02+pJ
	anGRtQ2NkKbeUl68Q7nkf1aiPWYVDhI/MOtRkfuTd+eTTR4wF/xp0GWw8ReHWpGCHIqfRjFoGkO
	GPs/lXKsSOEx4NrYqfXDJ5TldtQACUbpyA==
X-Google-Smtp-Source: AGHT+IE7tOuuyi7X6war4XV8L7zXaUOuiy/zuezb7qOEEGBSx8kQ05R5q5SvNGFQfCAc2tJou2uPgw==
X-Received: by 2002:a19:8c1c:0:b0:540:2ff1:309d with SMTP id 2adb3069b0e04-5402ff1319cmr40692e87.34.1733944924716;
        Wed, 11 Dec 2024 11:22:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e38dcdd1esm1617171e87.124.2024.12.11.11.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:22:03 -0800 (PST)
Date: Wed, 11 Dec 2024 21:22:00 +0200
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
Message-ID: <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>

On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 52 insertions(+)
> 


> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);
> +
> +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> +		return 0;
> +
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> +	 * the number of LTTPRs is invalid
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);

This means that if lttpr_count < 0, then there will be two requests to
set LTTPRs to a transparent mode. Is that expected?

> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);
> +

-- 
With best wishes
Dmitry

