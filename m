Return-Path: <linux-arm-msm+bounces-42864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2069F877E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3E151895EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBD01C5CB6;
	Thu, 19 Dec 2024 22:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5eYFAud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B761AA1FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645990; cv=none; b=YwUgr3YA477Kzj/RFK563iKLqifOi7hVRj+gna6iI+qNqMkZyjGUXwdo68pYvYEdjQp3CZd5RIWVnzbR7vuJqgFo/kVw8mg0DWdDS6h20iyp2ZnK7zNYhJIz87su3sobSxVLEUHgMIcOxdI7SwWchPQ89HMVGSR40SAHXs9o134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645990; c=relaxed/simple;
	bh=dQr/Zfm/iMBpoUciJXztTqPO6FXEALCSLUKbqy41p5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVY7ldYlCBCBlARMLvLSSaiAPFYTQvFMKmNK+nw2+JKJ3gAx/IK+P+j0od1uXvTGLgx31Drz9SPPV5Uo0oNTGqwPlBJFlAV8ZnIDLilLMF4YINFM+C7tv7JZ5xcjRljZNB6vcOSoIZygvv8JxKXferfzFAgKpSlHHFoAhEnIT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5eYFAud; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54024aa9febso1304696e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734645985; x=1735250785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sadvPQGyZFnk5L8H9OLf57JxFXnM4lchsSRTPwpDzuA=;
        b=f5eYFAudL4sl7PIq6U5TD0BDtUWqYW7MjaC5fPSxAwZvyn7HBvw5yB71pgvbUOXKbO
         LmG5UUBzaErfsQxB53+47Vp0PKv9+1NBwOzRrHmB+vxgYbPd3XIyvdR+QMWfAr1ggXXd
         h2k1zn9oWLsiR8g2h0dZ/lXGUb1uG8bCPD9HsRZHQ2cdc6VkY4Yn4KfgFsUc+BLFUiA0
         NufvZOVoxS8AxTZ6h/EXm97W/EN5gZsO54NSuXKSZMAPOwz5utlp1sEh05HyKfbq++rR
         NRc2immRb7RvoWCpUEHJDDysWBQXIKjS5PVAfdQY0mtAjwQcO/HXPkN0IGQQ5YFLfVBw
         zsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734645985; x=1735250785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sadvPQGyZFnk5L8H9OLf57JxFXnM4lchsSRTPwpDzuA=;
        b=lJM1SyA6SJU5eE98PDWnrNqZWZIDbi4TNGd+8gnUleatDViwrkF9tLLFL/eFELXWP1
         p8T0GgVfN5ruUZvUaPEXg+Yqae2nxsioPgm8t93QV9ml3vHBwDnM+jen2Q1t2x3FprXf
         dPQvtWDcDTUNrV6GJ2xKCx65hLmThx6isrMVpWIVy19r4MpbOMdqLNAqK+LEvm7ip/4u
         SN7zDuK6QrwUBXfscR4+4rRj3oW+Ukx+WVPZ8tl5OUwO7tK1sq7FYLIy4om1ltkhMvp1
         8XdxWaGzJco2NC2cPOOIMCUpI56CcM8itueW8Yy1yzVO3qVRmW3gGw6kojC+rhJK/UwI
         RxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBZrr/qrAGwn2KnsPqHalFYBtCxxJd9cYap3x3/fzZI7J1TWT2ibAREqTR/U8yRkdSDU3eneoUmFfkJGVx@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZvZKY1RbvpVLzIEuo75NxiUQaGq7Wf+j5i5d+PVHwHJZEZMO
	U4ODUaiZGexkmbGoBuJKxuNs4CQviNxSHcHSK5/eqqPFaY/7JrrwwOGMbemJ2p0=
X-Gm-Gg: ASbGncurPvt+sdLrwuMgO3kxwcYbVfrmervMWc4ONihTlVJPOesHcsOo2BMSNuBZTOs
	LQwkMVsyxOeKMIvbKyoqx1rW0TxJJQ2f4a+Prp5+/Ef1fy5Tp8/VHQsTyYoHlMOHWtsBaQu8khU
	kRV1ca/zcGjMQWelZYddDw8gpaOSv46ddrfL3hBjODS7G2kuy3YE9qvtp7JJMrRTVX/ZDwAF1H8
	xSsp2IwyEXXgZfaVA0F/WqiEMMrzmrxJS5Y42TA4OLpotPvruY7C4gMM/pr4V2bCOUQfNFTX7Do
	0TFAx/RVnJ4Q53EJGu032/453yxh7FRrMZgn
X-Google-Smtp-Source: AGHT+IG/oQ8IpfK5v75iR85HF9dLqNh4xH59OagcfgNjPICAJFcqOQUIpt3LAxhSNqh7VkOKFn3u9Q==
X-Received: by 2002:a05:6512:3a96:b0:53e:3a73:d179 with SMTP id 2adb3069b0e04-5422954064dmr80477e87.31.1734645984651;
        Thu, 19 Dec 2024 14:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad6dcsm3412371fa.60.2024.12.19.14.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:06:23 -0800 (PST)
Date: Fri, 20 Dec 2024 00:06:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/15] drm/msm/dpu: configure DSC per number in use
Message-ID: <fut2yuxo7ixrbxg24n4azeuyxury5i2ggcbo4pfvfxnp22wbs2@uhulitajdrb5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:20PM +0800, Jun Nie wrote:
> Currently if DSC support is requested, the driver only supports using
> 2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So let's
> only configure DSC engines in use, instead of the maximum number of
> DSC engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 650df585138cd..cc23f364dd080 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2028,6 +2028,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */

Is the comment still relevant?

> +	int num_dsc = dpu_enc->num_dscs;
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2039,7 +2040,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	u32 initial_lines;
>  	int i;
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> @@ -2068,7 +2069,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
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

