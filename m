Return-Path: <linux-arm-msm+bounces-45215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F0EA13448
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA151887C9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36DC190052;
	Thu, 16 Jan 2025 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JoGJLJDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA386155308
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737013693; cv=none; b=fite4qmBK+VDQYQ7MGLstksor6XWezCqAAYWp2pQfwI2YC7u7oRZkLqUTBb4auZm80n6R/VMMBQow8gy+vh7+szUq4mVLxlBBEtuWkciozDJ5bBg4Nz99kOYfiJFBcew5Fyzt710gpxuy9Hf2KKEaYyPR1p8GG93/oBl6PPE2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737013693; c=relaxed/simple;
	bh=UxK0Vw3rzBbOKdncxh7smDNiTQmU7AFlVZ6TvopIE4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuxUmnaUGEv0pxdpJD8ZZqemxRXOAJrPQpMvyErckHXZzC6Y+xnvAvrwYdrNYbvKLLtxWCSBm1jEeggky3KYR5F5m2eeDPfocv3XHnJUeFgA3t2XnICP850HkFvvzJB0o8SF+QWGX95HdoAsYxc8ctH+sm3cEsNtSg2Ng3nyw2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JoGJLJDG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-303489e8775so6282631fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737013690; x=1737618490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Luwgr/98+f8j9HTp9cKFmSabnH9PtUv555iDvEhdCnM=;
        b=JoGJLJDGA2kaMlcKvPqRXAourwgIQU9gXV1QNnf17CrDN7eQNOrBUrJWQXXiTfprq0
         JFYBHENDhlG8Tar4pNCsuQoU9UP0ZZLhEPwPSVTrpNwu6uXYLPyzwgp4hH083sop5G11
         6QbVhnUNugGXoCQT0ZTkjsfTsr0Qp++ixJ3XS9GhZU69/MGr80MBm/WIAMUW3hhQoSj2
         +KCxzMtp/yk1x+1klDEvn1hxzF16+0MB6yEE83uH7eVejc8UMq4WWRUa9bhCP7B0fuHd
         PnZTo0tqW2vTyf46PFs3qcD6JkfH3uwynKzqFAcnuXIZ9469XloedXEch2N+PhmKeaAA
         fkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737013690; x=1737618490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Luwgr/98+f8j9HTp9cKFmSabnH9PtUv555iDvEhdCnM=;
        b=EdykJ1jybx/lcbyCZYYNyag1CjEyCoxAGyTBDrnz9eIe+b75LdFlZ83PmNsQHW4ME6
         yp3c6tFJk8hXhIPWE6aXayJVsa2IckBPKcZT9KFYPvyJ7SOo+55jozQWIH99rjKGiEIa
         H76xsjgXwp9dJG0es2NftQ46I5L6+Lakk690kaTca8ApPEi8TNCqrh7DNqbCCJPO3umA
         2m+h2daxtN35Trc74MV9QUso8Fgjo6FLwxpWq2t1X9qqCJ76QYG6G/NZNUIkcHgMvmXf
         xE4c+SdZol93bJeNhxdQTjiRd24v4dxicVDhnoVO3ou/4efTqjgdVGCBU/7kN+Svvb6y
         qSPA==
X-Forwarded-Encrypted: i=1; AJvYcCWpdOhLsWX5+9kHy5yt++J33QnPns9Od+HU/VABxx4GnR+IMZycK3sDGbavj3thGxf5J69q8a0RinoYWEAB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgm8exNhwJ3OEpvzwv7rlLMo8WlmHDVRNs7IJGKc1q7HLIBjjz
	mbIUMxE0olZrucfo7Fk2py313zbt4aNP2WbgSHRc1bxl3pMt9HuWztR1xTuYP78=
X-Gm-Gg: ASbGnct4hZqc+CjRcobCq0xdhVd4wJdTpI/Tjn0QtJ0UlK+TzcE5AlQwE0FiftqjHOo
	AWH3itXiuwCsnRnQw6/hhyErk66IX0QVNQz/gwKcNocNq5ANXBp0v7dNDWGIGSU081JUrYAgFho
	uDJxeFXtI7kxeskzivqaiBgIgycfwrz8rGnewOUecL3KABfxL6fmtnojb8c/cm4eG/cK6tq6Dvc
	10wCwMG2cgvuHAZqGL6Qgu8y75pjcPKna2NML8kovhIBav3RcZTZTWZuPTyMIKla07V6xYtdUjx
	UZdow/jeFYv84Tr/fZIIMIyquYe9qv7xiRNd
X-Google-Smtp-Source: AGHT+IFQa3wMQmdvF5PR29nT2j5Y4yU5wi9b2px9OWV8zN7GBDkw/qif9xH5KGsN9r+gg/ugRekl8w==
X-Received: by 2002:a05:6512:acf:b0:542:63a8:3939 with SMTP id 2adb3069b0e04-542845a6f01mr9968008e87.8.1737013689890;
        Wed, 15 Jan 2025 23:48:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec066fsm2284879e87.189.2025.01.15.23.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:48:08 -0800 (PST)
Date: Thu, 16 Jan 2025 09:48:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/16] drm/msm/dpu: configure DSC per number in use
Message-ID: <bmjrpuxahjzjbnl7xvqhwmzh7dlhyjnfvh7swnxo6txuerfy4o@pvyzbd5cxfsm>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-3-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-3-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:52PM +0800, Jun Nie wrote:
> Currently if DSC support is requested, the driver only supports using
> 2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
> configure DSC engines in use, instead of the maximum number of DSC
> engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c734d2c5790d2..6603e9c03226f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2027,7 +2027,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
> +	int num_dsc = dpu_enc->num_dscs;

Reverse Christmas tree, please. Or the variable importance criteria.
Anyway, num_dsc should be lower.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	u32 initial_lines;
>  	int i;
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> @@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	enc_ip_w = intf_ip_w / 2;
>  	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>  		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>  					 dsc, dsc_common_mode, initial_lines);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

