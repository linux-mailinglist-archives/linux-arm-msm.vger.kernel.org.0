Return-Path: <linux-arm-msm+bounces-30275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB20966711
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 18:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 755D828517E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6C61B2ED3;
	Fri, 30 Aug 2024 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vW+gA4aY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06468199FAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725035943; cv=none; b=pr7SgrcKtneZwUA1ICujR31dzK79fUpnCXRy/20d8g0DJlJsc7SNArxIvjvgB/Az6VQ4AzyVREke+eZhZYzlbRT4sE3/PQftvE9EYDGdo9w7CWjzTva4VXtH+HsQi/zjf0bxV0aQRqk98zuTtFWOEUnDAeBeZnj9wV8tcEcAd+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725035943; c=relaxed/simple;
	bh=9CFrXcknrszqO6vd2KlpPYg8IThO+L2g2ySYied+bck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWxf/wCuYFd7IRebS0AjA5B1+IX0XokUY9mtFg9ZiMWigEtJHYVntWH1TwU4+DVnei3Gbyzsir4EWYbqI64YyhYQHUOzmzrP6WpVPKrhu3IJ2FddJ4CUZZaV8ZYpirA+4bpK4lIVZXULtDRCZvXZxzCdW5kQF/i2OrYnfCwJePg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vW+gA4aY; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f51b67e16dso23005801fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725035940; x=1725640740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwq4R/f36WQQ1Swarqd8PQ+Sx4wkeeX3AmNPKu0eUyY=;
        b=vW+gA4aYHPc+EChNPqOxONHp8YrUAeErN35Y2n/PlIAEa8b5Trkcc1qjhJNMQJGIXy
         tp8ksY62SKCiutYpWyBMQSIFyZL31WHRZM64r5Q4ngDG4SxAf0BTmbDkTgNhfesZa8bf
         eGhF7Ry71UdxX/wMM2Qp6MxZJAhbbFJQFdcEsaREKRmJmvNAj7TKKb5M8dcitSRv031i
         QH+Wn1fr8pcFr3I9WMpJEPB2ae8zBdcxBK1EDA8XyFRVoo5NI1p+aAI4Wt8HG4YlppOw
         tfVrIeXYI53+TUgjBkbYwc+4G0Jj4NvjcN6QwjwhNghKT1wtKCtoNkAPA6QR8F8C/SAc
         yDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725035940; x=1725640740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwq4R/f36WQQ1Swarqd8PQ+Sx4wkeeX3AmNPKu0eUyY=;
        b=md0W2maqxX3voudIY3OSvHPGwU7JJyLbA+612lh7PQvgTzJaL45ktuIasgnobEpwI9
         5SoH8mYDd0OhRPPPcQNnBYauUF1EwesoE799qHVWnnkcDBwYW61tbekJwdVNoXr2Hoj8
         NQV/LKP/09+2V5Xbe5995+PBEzlCO2dyxubV/4qwJgocxihdBngVCG+dt3mmv+KAcUXM
         SQf92oY7tBO8g00y9s+BQnCOqq96R0HRr6mwug7dhuKYDeBSNBQGgvm9Sfv4tVpEUPS1
         SKZyjLt/WEjbnujZo4OUdRRL+W4/mUExaE87URG5zeg6SCfZZ7P3sbXcuwv17CMOvNsm
         g46A==
X-Forwarded-Encrypted: i=1; AJvYcCVgF/pLE/geM2B1iIUcYJfg7ZoUfXry3aon0Vvd7QtAR6CMfkCcvEgE1JgTwrhjqSHF8E5HNhCSh/fC4TKc@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNhcyWYIqDIFzpp/gcThbDzOJsk+ZcleTMW05Z1mWRNmI60b2
	Qrs+bMwh/lLDdMBHt4eIE35ZXjXDAnMO5/zrJxTqg1zHpCtczjG+l/Y2EBIjaVKBSvTtfyXGyVV
	x
X-Google-Smtp-Source: AGHT+IGXlaawo+aNd8bvyU9hJTs0LcQHomL+gI7bfl9YYFu3/2gV7tZKCkjm/N27yB8W8cQUyGkfZg==
X-Received: by 2002:a2e:3213:0:b0:2f3:f6fa:cfd2 with SMTP id 38308e7fff4ca-2f6106d6968mr40049701fa.25.1725035939563;
        Fri, 30 Aug 2024 09:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615194f19sm7176211fa.130.2024.08.30.09.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 09:38:58 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:38:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 02/21] drm: print clone mode status in atomic state
Message-ID: <e3moledbfob2xkgxpbta3onlzc5yi6u7cbsmuo5ao4qq7nyyhj@lr32vqnjzkbi>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:23PM GMT, Jessica Zhang wrote:
> Add clone mode status to the DRM atomic print state
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 07b4b394e3bf..145d6a758d4d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -455,6 +455,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>  	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
>  	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
>  	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
> +	drm_printf(p, "\tin_clone_mode=%d\n", drm_crtc_in_clone_mode(crtc->state));

We have encoder_mask two lines above. What is the benefit of having the
separate in_clone_mode?

>  
>  	if (crtc->funcs->atomic_print_state)
>  		crtc->funcs->atomic_print_state(p, state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

