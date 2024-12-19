Return-Path: <linux-arm-msm+bounces-42868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAA9F879B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445D3161DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103E81BC061;
	Thu, 19 Dec 2024 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJ5gPhrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324931B394E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646468; cv=none; b=UP6HOQMa2XNbxhw2j9gySk9zn6/FgA0NZVT9DqDc+yVpnYMA8C4Filn0sYmMjWlT8i+VEcb9jDD4nZtoebtN9Imld6co3w+UJFnmC+0V0eNcO80q6nRj18ulIeU3rr/pE7wohsKKHWnAQBYE65AI7AfSCHyVRTb9isojCd2s3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646468; c=relaxed/simple;
	bh=bfnh2LqUcLz4ZfLxg1rcZhfCv7nIbVOfdl3hTxFrZX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTp7KWJpJKH4H/pGuqDP7inARQaflkVmKS89JOB0ttF1osL0nbyh+wev+R93iUeCSGq70cy3Hx9SFvu2EjQapeXRFm8yJ1ZB383PQ7Hf1onsoHx9ySdgu9TrwNzbGpECTuLXMnXejg05JCnGy+2D5mpElmzYscEjubOZ9fL2XFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJ5gPhrV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53f22fd6887so1123846e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734646464; x=1735251264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lp/0WgoJMYBw3pbcjem9wtwnD12qURoBMg8Gz+u8iz0=;
        b=TJ5gPhrVfoKKacFQqN8u1MZZ+sG5tOk04V1DchIfHSjKmJW9dC/fTSMbSq6Eq05FsD
         UV8YA34NQB3AIxBxfmCZUjIOE3RoSVd2qNqspctu0ToqyQvprsuLjKsl02hMIUMU4s9Q
         npTGH9XkhIo6iI0yaP6S7orCCiRCW7qaN92v3Fe3Qyg1sZ+qMo3VHVNLOh2HnnkEUGqM
         LrphqWzD4gkckLD0ou9t64E7UuX2qTYsam11RS35YBU0pp0kd9ImzHDyrzzq2sLgHZMj
         U4yTqVLJdaA+jDfA54Dl4GNDt2a8UuzHY9fZ3AVMphugFrFDpnSyRaJqfCerX9hAIn9l
         XjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734646464; x=1735251264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lp/0WgoJMYBw3pbcjem9wtwnD12qURoBMg8Gz+u8iz0=;
        b=pkMmhP3cldq+9TV5alfPrLzEjQFq8FQEO8Ru9FPg5mVTNQaUTVc6G1snT+I3GDRniq
         cW6HXQkpJKbfB7mX7BviVrqAdec6brvAcKgrn1RcLSqTGPxpeRJQS/8HYfneBrpP9xU+
         h0w+VRkDiZhNL6zd0AwmdWuYdBmW/hCItQbO1oC+suzLzFfis/zE+Pul7KDqnCsa55g+
         UkCKuJP3QIMA9vsnI2PAGjX09tv8vbVSaLp/Ial5T/2LDUWoOBQtabxZVrTZQGJpLkw+
         Ig4VDVZ0fhjWNO0INohjN9ZUEf3l86voWTbatsPcTQwTyf7yOu2grBUrSdhYdZ4NQG2O
         bayA==
X-Forwarded-Encrypted: i=1; AJvYcCXCyUODPNlBs/43aeh6YVu8LUr8RqEEMEHOSKi1Eq+C2Ru3WxW+1qsWaJ9tsHKFG37CXKQ/a5FrZeKRS2ER@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3HpfrnyJPfvPqlSkORGduiMowWFn5HUSp488X3nWXBcA6yGa
	3LIb49a6nl72qb3bJKQ2QtYDf1QGwoRuVLTwXRkj7OAOxGoG8rr9/1a10/lH8U4=
X-Gm-Gg: ASbGncu3fQY3vvpyCKZI4Fv2gp0UHqUCNjjHz0yrb0KHiPLhxhqIE+OG3b0fszUve9E
	y7himmePxVQpjSar9D5NYbpuQ9p6l2ut26vpo3qymoNFMO7/i/TgBrOGgf3o852y576Cc8KPjXl
	T1Zi4rOCpihIr6n6FG1roR48RbtImuLdc4Z1vkbPfvbRScDJQmt0FBzNB5Q9dl3IgX2ScT12iIi
	8gvgMzQmmVULkzdQjkcB8t6Uz3CMp4kp9P/WbYaa1o3Te6OeCLMpr2szyLa+rWlTtsa/gbpPxuv
	hlExT9VvysCkiZzYku5x5c/DRSJ4PS1tlben
X-Google-Smtp-Source: AGHT+IFNifr8Kzw3iPEBcMsxUT1SldWwUcNVnrkSzCCYrK96VGVfXM2/WECOPOwNTnRen4dFc2DMfw==
X-Received: by 2002:a05:6512:234d:b0:540:30df:b3ea with SMTP id 2adb3069b0e04-54229533d4emr96410e87.15.1734646464146;
        Thu, 19 Dec 2024 14:14:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382fa6asm286103e87.229.2024.12.19.14.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:14:22 -0800 (PST)
Date: Fri, 20 Dec 2024 00:14:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <auo3266g3wt6q4kowutx7tvysqrgr2v6v2kw4mnnzd2gqbxb5h@5473wmczjtjc>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:23PM +0800, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.

You are not adding anything.

> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Current code resets number of mixer on failure of pair's peer test and
> retry on another pair. If two pairs are needed, the failure on the test
> of 2nd pair results clearing to the 1st pair. This patch only clear the
> bit for the 2nd pair allocation before retry on another pair.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index cde3c5616f9bc..a8b01b78c02c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		lm_count = 0;
> +		/*
> +		 * Clear the last bit to drop the previous primary mixer if
> +		 * fail to find its peer.

if the driver failed

> +		 */
> +		lm_count &= 0xfe;
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

