Return-Path: <linux-arm-msm+bounces-40106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0039E1F59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D85A166FD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741381F707A;
	Tue,  3 Dec 2024 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YR0pNFpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E11F4707
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733236455; cv=none; b=rkfZ/tgVoStWE2PMqud6jpplAEZKONe5Xj75lif33mW8dzD/BmJQsnxuHh9lEB9ObyGQHOlV6r7YwAcdGckCDdLTwV86VvVS9N0rxdrJslgEEN5kcIe7R0CNmoo2L0Vxw80kI014+RBeZcX9Ov8LeyrXjZLAGIaKA7Ljlb26x4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733236455; c=relaxed/simple;
	bh=pYO9Ik7h6Sy05p7jQh246VoAGtssBLsMf5ZGe5lS1pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onWnnsYtcSXRpDFz6up8qLP48Ttp3ZMr1ZRLoe+ergCcNaOq4TTGORRRikxbp+U3BFb+GF6wZ3Q7ENUjrUAeZkUCBLkU3d4tlcDExUTwDt57oQBA01PMw0IB7mRMjZrIrCxsbmJVSxpo1UErr7nBzdpONkM1chnqBH8fMaEYiB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YR0pNFpB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso5942413e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733236452; x=1733841252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OTwLeT3aQeMpcOp4Q1BFPHKxDtrlDP9yLmVoPEGdsN0=;
        b=YR0pNFpBhbrq1w/uinww+THsp2QGkGLmruULyQT94jyDONQEIKLgLMIC9FhmJcC05j
         TCcymrIN2XjysZHn5D78TWrid9s0/IS6SrJJvSAarALfA0juvfX7j5LP732qlx4sYa2Z
         524T/8piDCt5XVMzFwRiKk58HGCcNTWDjB//kJJpk77FTzpuhjrJ1ZnCD3kDPC5jV7k/
         AYRnO+Pdk3pzq/Uz+rwz89F0UZEZv1YMgIQTFNAoXdYl9Ja8HTwMI0A5fzGE/qGlj8lM
         zKijekm+jd5Umeoo4tkql1tneMvGLV7HV9aMJ1aJWODKdfVlwNve0ehOWavE0a3fDLXt
         FlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733236452; x=1733841252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTwLeT3aQeMpcOp4Q1BFPHKxDtrlDP9yLmVoPEGdsN0=;
        b=N9lTRofBH+ffbIBmebX8JW8zJ2+3Uk9QrGvq2RmVaVbHE3tU7NHJNEss6d0FcbkXIC
         LKKo9cjV5sudtY0Y2SA9PFdly1ocCBg5aRgHgI42iIh9dbOckV8ctIMf4k7jNtr99tkf
         6QVN0BQfvlFDPKWIq3+8mYXjGkLvxcXMR65uPunz/icdmq7HFdvAKJxnbgTi4Xycl8bH
         JpC0ghzap6sQBGU8drgR76NDXfU3BKqEjNdkU109PJbRq5YNeO9IugP8LrquAYfjLQB9
         3Gx5JgXtIqYiffgnyveAGeqeG5KZ8m7odkBI1a7ZSq/RKsqfyCbja2+2CCPdQ9uMK7pN
         W3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWmkYC09DALF93FoWTGtuo/t2GbWDt+SAmxqd1FrTNf909JngiKSjywGul6Tb0ohSaX8PZd2pqPeW9zFFs/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xzcCbQx9pXnWeTXuM9tIgV6zezWT5stQ3W9hFW0dcdPe39Wy
	jp84iSKtf1uPzxeQ1iipFIlOwemApsecb/xx2k85yK2cKa12lB6TXwZrPMdwN7M=
X-Gm-Gg: ASbGncsCujokeeYu4WKJmViWDLy2bOm2Jnp1s/uMAlNio9qhRxmpIm5Z12tYDqlLvWW
	3dkoJKPpJCtgXl/+8+hTQFEXf5EKd/oXp1z0/iSr3Pjw5DkBo+CYxrztYi5nSjICXlyzdv3r/PR
	2Y3EoRmjiIuJ+LpnXSofpjQtFQUs9VCIS8rrx43v9G9rY++e4GzuirGprEAa6DVm/Nt/WDxj5g7
	NTbndbm74nGCtntKssGxZCqq4Aqc1g2pGu2vsm/gQfn96W9EfETPs02RITgLtZufTAuQo84i1ce
	LsZthJCN1Q3lGQgkQ9n8ABHotOaApQ==
X-Google-Smtp-Source: AGHT+IEy1sx0BWSMOp5Z7xI7HaeVkaEKc3qbAGcaYeHf/G5vYZpDUtVEJUQzItIhVGsMUW1ZYWXRpw==
X-Received: by 2002:a05:6512:b8e:b0:53d:ed62:e653 with SMTP id 2adb3069b0e04-53e129fdbebmr1839987e87.15.1733236451759;
        Tue, 03 Dec 2024 06:34:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f097sm1840541e87.161.2024.12.03.06.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:34:10 -0800 (PST)
Date: Tue, 3 Dec 2024 16:34:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: account for widebus in
 msm_dp_catalog_panel_tpg_enable()
Message-ID: <hwomnwmuak3optjooe6g5szqi77nc7znsfjrxqbxx72nqe3e7k@om2e65vaurov>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-1-0fd6b518b914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-1-0fd6b518b914@quicinc.com>

On Mon, Dec 02, 2024 at 12:41:58PM -0800, Abhinav Kumar wrote:
> Adjust the h_active calculation to account for widebus in tpg.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d..05c8e1996f60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1011,9 +1011,21 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
>  	u32 v_sync_width;
>  	u32 hsync_ctl;
>  	u32 display_hctl;
> +	u32 h_sync_width;
> +	u32 h_front_porch;
> +	u32 h_back_porch;
> +	u32 h_active;
> +
> +	h_active = drm_mode->hdisplay;
> +	h_back_porch = drm_mode->htotal - drm_mode->hsync_end;
> +	h_sync_width = drm_mode->htotal - (drm_mode->hsync_start + h_back_porch);

It's at least drm_mode->hsync_end - drm_mode->hsync_start

> +	h_front_porch = drm_mode->hsync_start - drm_mode->hdisplay;
> +
> +	if (msm_dp_catalog->wide_bus_en)
> +		h_active /= 2;
>  
>  	/* TPG config parameters*/
> -	hsync_period = drm_mode->htotal;
> +	hsync_period = h_sync_width + h_back_porch + h_active + h_front_porch;

Is it equivalent to:

hsync_period = drm_mode->htotal;
if (msm_dp_catalog->wide_bus_en)
    hsync_period -= drm_mode->hdisplay / 2;

I think it's simpler to handle.

>  	vsync_period = drm_mode->vtotal;
>  
>  	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

