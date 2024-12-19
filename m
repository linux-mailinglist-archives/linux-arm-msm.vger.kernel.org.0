Return-Path: <linux-arm-msm+bounces-42867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 317969F8789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2275B7A0461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5871C07EC;
	Thu, 19 Dec 2024 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wy95Uper"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CF1AA1FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646187; cv=none; b=BUoyzlzrLsziJPGsqtyThrnbSbkUp+egP99nh601m8eVdKXvryNpHsWk7OGfvsiXF9R1UMSPEHTjerNk9MrFcyHMtDO5MSaFbt356wmW9hol9eFp1Jo819tlTuNXxpJ55RcwbueoFfER+a9dMmyModOEsLcCWGT1K2FF2OqEX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646187; c=relaxed/simple;
	bh=NWaDuQwZJBISPGTUHMwQCBW/3+K7aCBYNJS+Y9YBwZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU1IZbRHHEmWFmmGWsIDHvs2JfmryPI5bAJDu4b1lzYQVkvZfC33lUh/J5nDcxa7K4lbuyYsK6mBjIXJqiw5DyvEZo6T/WZCDBX3/x9+t5XbzD6xV4eZtw0SCIrH7jehL62by3L8BVoU+1yQKsLI3QR6iotie1jz/7fBWsnRU7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wy95Uper; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df6322ea7so1454484e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734646184; x=1735250984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfFrfuHrDlsSX/EuDepOiwLHvFjx8uS+56G1Zl81UHE=;
        b=wy95UperMHka8ceBCiVcGi7w4RteRjFgnGgkR7xlW6wC19w13+DmLUw6tTEgDZmkau
         vG/wISMiBB8aCbqOPh6w4ql0l8f42Dv+hq1VP52DPMm/8k4r22MZYJx5MIE43L7UPNkL
         uzi8+j97uqTb524IM9cL57OkIBItVaNHnktevzFA7uHBn5+WRNMFQx6UoZU5QfL/1xhz
         KHnYoHT0rLzrQ16ylqIGf4qDvkL2zwQ7YvZXdipQ9msnTDOEBPq7lAYCSURxxPW8UPD9
         JHqeQCIkCFS+jZMAgJM6iYBoTmfYB0kWJt40D0r/YWTZ4c22XAY5jvFORaCCbP6BUHtI
         U9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734646184; x=1735250984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfFrfuHrDlsSX/EuDepOiwLHvFjx8uS+56G1Zl81UHE=;
        b=afjYm2/SqPTH1B4fz+u6MsZKeFk7K2owzCEg5lpwdNlHQPggwSKFn51Plpq3kNBa7s
         0NdmMHVIF8IhuSDJJxv3TVGYP059ZvqWGM1yLr+N0PUtKSXxyBLK9g3PM/RsQbkmigUw
         rrXkZADnMD9bKAb8DR3Igi43EpacoIfP6yPSZAjiwEo6/H0nMBZJQaCllWNDbn0tk6oM
         LmR8/7CZ+fXPb8RKNTEgNWtXWMPrMQFCYBiPaOVvMDTnfpec9hTSr2nFHPPPo8ElIcDc
         TFzTzi+Q4gqAV6mvr1uuJpPVrerxHZ5jwf9vxdzQhRMU7cjNAh2TWPDbIx/4aXDSax0X
         HonA==
X-Forwarded-Encrypted: i=1; AJvYcCUiWW9mYOg+zhoGADDbuUx/6VPbmtDfXhXeT6Zwp1jeFIW4VbIzftdNzNofeRC83ayh+lkmVQh2ro2Ht9Yf@vger.kernel.org
X-Gm-Message-State: AOJu0YzOwy2MAG8iE10lAcwqoZ4INZZuqWDSsVYQ1S9PtKI+NOZL15NP
	RwzV1IJ6W+Kj4B+9F2fQX+DrezJ74UfN9h+lcaILrT/67HYBBQjqzu+bHd+VGl0=
X-Gm-Gg: ASbGncsVI4fIasFUbQMZgA7dT0ALekuS6Pt3yu/N1G4E699ZPdCxNkN3aRO+4kb86NS
	9c51QjKQJADF7iHVqFf8Ek1bzYE94TvnMl6sdKVcPwkdWIUVfQDx14+6nuZ3kXx9RPzvGfXeqTd
	mEKeo6r3aB5EceIujmr9DSLkZZX/FpMdE3n3aPMzkrJkjL9o/DOgydSLTm7H0wKcqYugmpLW1zx
	ocYLq49l0RZUWh0yhixiowITLsFH7w9wn2t7+f22XBjqojknD7xplSVqa+UW69FYOU1SbHN8xNe
	5NgepqkUe4Y9gkYFYUBfdReLQdu9Aqy8kBh2
X-Google-Smtp-Source: AGHT+IGI1strB9pz1L+6dNnfXxg3RVHpxg+mATsyyFO5eKsyMNYu9cO2lopjm3nWXPaSP7RDnPsvcQ==
X-Received: by 2002:a05:6512:31d1:b0:540:2160:1f79 with SMTP id 2adb3069b0e04-5422959d3bdmr97847e87.51.1734646184080;
        Thu, 19 Dec 2024 14:09:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6047sm283724e87.26.2024.12.19.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:09:42 -0800 (PST)
Date: Fri, 20 Dec 2024 00:09:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Message-ID: <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> decide right side of a pair per last bit, in case of multiple
> mixer pairs.

Proper English sentences, please. Also describe why, not what.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>  static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>  {
>  	struct dpu_crtc_state *crtc_state;
> -	int lm_idx, lm_horiz_position;
> +	int lm_idx;
>  
>  	crtc_state = to_dpu_crtc_state(crtc->state);
>  
> -	lm_horiz_position = 0;
>  	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
>  		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
>  		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>  
>  		cfg.out_width = drm_rect_width(lm_roi);
>  		cfg.out_height = drm_rect_height(lm_roi);
> -		cfg.right_mixer = lm_horiz_position++;
> +		cfg.right_mixer = lm_idx & 0x1;
>  		cfg.flags = 0;
>  		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

