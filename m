Return-Path: <linux-arm-msm+bounces-45218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E1A13461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E1C83A36F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4C415252D;
	Thu, 16 Jan 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oist2R/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A20F195FEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014092; cv=none; b=hpO/cdv6Ld3qJgsHrYYRG2ncHCGAYue0im+BNHp6FnQpokpx6fnl8N6KRwTBkGMTI8Ynje3GfzImkXZOKxJNZYLysbTVQYKOiGrSiaoxkY/VJUBBrKvCGA+TS8gebJKFCxAcEL60vzJJ5Dvq2ar5plTTMIMS7w4JD2B7drj/6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014092; c=relaxed/simple;
	bh=wMp6RjtLkP/31AcAcrMzjJROeADx1IJmbZiAPpqQXHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTz967j9hLyv9XvvgTt5sxg0IkispamAbHw8iKpeiSlGtRHW5rBkDWrqi7zRi2xKjIAYiXr8Bl3yNCC9CXvLvqLyFvXgdEeFDk7YXgjmivFdnerRnhKzi4rliYlF5C0MMZeTrBA9vIEwHmSv7+NJVFh9SAnbXWlaYopS5i0MhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oist2R/L; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613802a6bso6687811fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737014088; x=1737618888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Jjg1mbduj57rKOjNRlVksmRWcTyDNvupEP5TEf++8E=;
        b=oist2R/L9oXppURyw0P5N2cC/2L5NvVXvtb5HnSo6+avoQYTZkLDOi21u2buHNI62B
         10y7llhSp0XrRZ4JRNaWZy237OyzpmlKDehnLWtMO4h6rtFi+Kn+D7YjMDgn6t0ycJRk
         mHUASxhhraXukRfSK3IpmojOVvqteX+Kxph14ysdNzB6Hqn1xOItjN0Y/6hxFLUYgDWw
         n4SsvDxZTsEMwbta4Rjr5VAwYitr3j0C6zyYZUscVrfXG18diKrEzX7bEc4pg3Ka/w01
         lVrwYyR2shYogeiv1DHSnk5zWWcdLC7GM56Eu3B7NdkmyndlUsuDmLNidEGtR6VttJ8y
         +RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014088; x=1737618888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jjg1mbduj57rKOjNRlVksmRWcTyDNvupEP5TEf++8E=;
        b=ow5vGTitX3EUPzHUlqLMAZjSk5UTSCXe3pLMTm3Muwp1RTaZ08cWZQHiTBbVAifDyL
         lJJStV6EqoT0GAeUNJ7UHBkQORnMZaFp01cGlxHXeIQ8KjAaWi2hyHmjrk4IdROjPI8J
         Kp1VmoqSc7kS11k93GBEhUIkPpQUg6nAtLZyJgPdMsQYazRnP4c2NFGNwnET6B/zNp3e
         cB/MaMnA5nk8o0BokZFBzhfl7tCr6WmsQGacyolly2e4/hFw3fIpXh7I+BRCxP4YwrKK
         EIUTILivp82MCP1u0j+qnR/U/L9yz6QqO99fSQeGv0B2aYrG/69TzF0xWEviktsK/scA
         iFoA==
X-Forwarded-Encrypted: i=1; AJvYcCVGa//NAudC9Wsex8jE+d80x9vX83iNeYiR4MNUKY/Zg7LI08AmERNJgJO2BN6pvtx3DvPbf3TwJvf8JrjV@vger.kernel.org
X-Gm-Message-State: AOJu0YxJp2y/11qXa5lTnYB5hXus6Gck6/K5vzuIgS9TtW2SetAVOch+
	dQQMX4FWOZvBt1MLmV39R/HLMUpc2JRkNPkwDQ9O3nBo9c2jMMjsSWnQ9V4Ip0I=
X-Gm-Gg: ASbGnctwPU/XytFWXjgk19xCrXRommUB2HDRJ1jUUI+xFvOw3pkxWD4n9vSmlMdi/vk
	eNEHjk+HC7VzvZNj6eioKcHQHbkSaoB8CjB1ibVk1HIugZYPcDGydk97tWEDsIJbiVgSK6fuvT9
	jwnuksjhfqlXQd1Gja5fHVF/p6hbS+ig08Vh35tlAqLJmxzWzdJZdDiy/q0C6bEwf4CoPhNKhpL
	hBAfr4gREFBKB8BCZEcJ0rzz9BRAg/C+jQYKKdIptoG0XAzjDKjtqv7wKsJa3H08LxL0mJStEJl
	EvCF7ObSYnWrfqttvgtdFgtBfc1I2XXf9EgO
X-Google-Smtp-Source: AGHT+IGWSf/yOZvfXpZLF9q6SysUzRLStDO6lKJGlRWpgWwJ6ksytVOsuvgX8Usotsu+jYmZJps9Bg==
X-Received: by 2002:a05:6512:3c82:b0:542:622f:124 with SMTP id 2adb3069b0e04-5428444d202mr11223288e87.0.1737014088248;
        Wed, 15 Jan 2025 23:54:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49f0bsm2221108e87.36.2025.01.15.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:54:47 -0800 (PST)
Date: Thu, 16 Jan 2025 09:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/16] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <lyl74bqxrc46ygtkhawdmmjrfrl3jnxmmkoyjtlhjmghmztqvt@c3zlpfxcz4st>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:55PM +0800, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.
> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Reset the current lm_count to an even number instead of completely
> clearing it. This prevents all pairs from being cleared in cases
> where multiple LM pairs are needed.

- The pairs are not being cleared here.
- Problem description before solution.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 24e085437039e..3b3660d0b166d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		lm_count = 0;
> +		/*
> +		 * Reset lm_count to an even index. This will drop the previous
> +		 * primary mixer if failed to find its peer.
> +		 */
> +		lm_count &= ~1;
>  		lm_idx[lm_count] = i;
>  
>  		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

