Return-Path: <linux-arm-msm+bounces-45228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62005A1355D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97BAE1887F9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FEF19E7D0;
	Thu, 16 Jan 2025 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZrevACy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD5190052
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016348; cv=none; b=fNLZ/5ryXjZFy93X8SP6rkKaeqU61iH0oAQpyI0iyFJrjpM70DjLER8DS6CPWV/Vs+H7Gn2m5+tHkHKyt/J3CqdhHvjEYwSuIZ08tJ7PXvxR8rlliZNZ3h+yznMErJ0l3NLV35Lzayt/sY3ufJOzdWlgRlISEy3c+JK1F7dJBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016348; c=relaxed/simple;
	bh=SzfGH9Ii7Qr+33K+Y8nk3Z4SVWd05UiqG2SQhAh25eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bD3W0wOpzUSwSIpI/sbVdkBUR1GACGeBE98EVlXLzcSsmRJzQ0HLl2kuJcWUdAHU5M7Sh3XwH03SRAlFatlRJbVdiPLiJ74c+Kj8pOHFwBuykkwatjLuE90sF+hE2tg91QZqAbd1em2zGi+mIKnKaH7VkzKGlqNOuzHngt3rM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CZrevACy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3002c324e7eso5661561fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737016344; x=1737621144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JELxApQBYXscs6o4pzVvERT8kCwa0GBmZxwst9tiL/4=;
        b=CZrevACyUH0aT9B1g4O9dIpGd1EuN1qa1kdW4ssIQSbHDhMkC8w/jS/zPTidM2SCAn
         n7OSyR8aqWmg/IHYS2zziSZMW3TNlHEhRiaSBU8e8OZ81xA2tXKbvnFGBfuwspqxLui7
         9FZV48FvgBXqttuucnIan4fKZvsgq0wfTMwizYPu6fGIRP6QFUhG2Ejwctkc9SeW8RvL
         Rw1vBq77yJ92JRpKeS2DPUVXYZ4pbGEZlF9gc66OxrPv6zmQrRCHbcyIK38U/0aReDWY
         x1qVjBd0LzASatcEicAj3xWqH24We42RIDVA3lV6iSRyzj5vAkXKmIBlM+/mMszW6k7a
         aJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737016344; x=1737621144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JELxApQBYXscs6o4pzVvERT8kCwa0GBmZxwst9tiL/4=;
        b=ANEZMQT/JAqxOvLqkRb6Pq9N1MwY4ROsUu2GleifzMIA9bMqRtTWlzz9S1B8OeDuzp
         Iq2ssM9ehCqa14ACTSgZ/zTe33XzqEN0tlF9/ibeiNpSxsOdgtisz6CXd/y7oIYHybp0
         3IQg2cPsgcXLmhWT80DR8z/hBkTzdLyUOCsXqKOlCsesyoDZOI3zKEABqJyWEIfdHOLn
         p3sQqH6+kOdmkS35FHPje6AYhBeUBW+xtgsX4iaJXbjm7kqGrH9m/cUHX8Pa77AtF606
         4wuUUlGdDwF/lNlih9i0pQ8DUyDtpoeNOh9vyUxWc+dOih3rdIpYVXxQ968eW5Kv1e8k
         8Dzw==
X-Forwarded-Encrypted: i=1; AJvYcCWcp3UO9c7c7F0sL7VHU9R08DYjd2ugCfTzym6O7T/TqWqlECk1LMX6AY7yaQG4XPrIGZ0/mkoEbkwn49N5@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTuZSxpz/UE5XGlfcR++s5SkdTsfgJS8/ppKM8RUgsfWue6me
	WRTM6EHNP8ESBaPkEah31ajDXarVgUdJBNgIiIHszd/EKWLnTAtaxrGZu2L+/O3kkgeZRsOZiMn
	+SY0=
X-Gm-Gg: ASbGncuYsQMHM314T06elfuiFOg7RZAwUNZ3U0mMDOOjiXG/BkqT712NhZbppfx/NSX
	DEK4Gp6jkghGsBgr+gyZu/4xuxZwJowAutQixWcxxr9zFRrokUi1gwRjfQP4kbVvs4v6QTu/Tnp
	fziE2IGNt61hvNYqVBvwuwkU8qs3AJqCG5qvC/sWAOiJXslsZfxPQXAxy1t9pYarTTKoXDm5cBu
	9AtBbzcqcp50tF9eWgk6CmauUw0pGRs6hMGHaY6eKplqFJv6CaNNB18Q4AMjCxLy+BMtubc2MTk
	EloiiTRwACmxJqPABoVOM4ArMeSuODZw4AD7
X-Google-Smtp-Source: AGHT+IHf1QkPHEH+gYTiHUprZLlRzENM5Wzn0GjuOJKVCo+ZX8LZ/i1daAtaAZX+OpWKiFta2uF9Pg==
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id 2adb3069b0e04-542845b9480mr9657745e87.14.1737016343789;
        Thu, 16 Jan 2025 00:32:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0613sm2277202e87.181.2025.01.16.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:32:22 -0800 (PST)
Date: Thu, 16 Jan 2025 10:32:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> enabled.

Why? What is the issue that you are solving?

> 4 pipes are preferred for dual DSI case for it is power optimal
> for DSC.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 29 insertions(+), 14 deletions(-)
> 

> @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  
>  	/* Datapath topology selection
>  	 *
> -	 * Dual display
> +	 * Dual display without DSC
>  	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
>  	 *
> +	 * Dual display with DSC
> +	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
> +	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
> +

irrlevant extra line, please drop.

>  	if (intf_count == 2)
>  		topology.num_lm = 2;
>  	else if (!dpu_kms->catalog->caps->has_3d_merge)
> @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  		 * 2 DSC encoders, 2 layer mixers and 1 interface
>  		 * this is power optimal and can drive up to (including) 4k
>  		 * screens
> +		 * But for dual display case, we prefer 4 layer mixers. Because
> +		 * the resolution is always high in the case and 4 DSCs are more
> +		 * power optimal.

I think this part is thought about in a wrong way. If it was just about
power efficiency, we wouldn't have to add quad pipe support.
Please correct me if I'm wrong, but I think it is about the maximum
width supported by a particular topology being too low for a requested
resolution. So, if there is a DSC and mode width is higher than 5120
(8.x+) / 4096 ( <= 7.x), then we have to use quad pipe. Likewise if
there is no DSC in play, the limitation should be 2 * max_mixer_width.

>  		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +
> +		if (intf_count == 2) {
> +			topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;

This assumes that the driver can support 2:2:2. Is it the case?

> +			topology.num_lm = topology.num_dsc;
> +			topology.num_intf = 2;
> +		} else {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +			topology.num_intf = 1;
> +		}
>  	}
>  
>  	return topology;

-- 
With best wishes
Dmitry

