Return-Path: <linux-arm-msm+bounces-38826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF99D5D8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A0E1F21C37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5331DDC12;
	Fri, 22 Nov 2024 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKFun1Nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE471BE243
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 10:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732273175; cv=none; b=Ghh0xyZLR8vXLLAJCg5A8wr3T1ZgJXMdkJ1hz8LB8Itr9MUTOlM3/mTugHGT0djx7It3qb0p1MiAB79UiET4DOSXzE8YbZhdN2utbp6NPUtIEnBVY/5nwhJoAd39OoRXH/sYOS+K2V8dn9a92vK8bO/f8OUuhe+4P8ZtSr/KMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732273175; c=relaxed/simple;
	bh=nEzgREpChasM34b4gISMzAEe13sm7XvSNaprCZAX5HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrkbvbb/ltg1PJsfM5JXRWx5afRTAsxrkVs4M4MqyCzxYt7yx6/E5SQQXWnM/khXn99mGb1tHRw24zqC9zAtCil90C3PLv5hCyeKmzRq8i2702ab98ezMMqnALCjS7qx3fHuh2zPkKvmozwD6wRgZxyimNrnMHYa4HcsXsyGKXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKFun1Nf; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffa974b2b0so3386011fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732273171; x=1732877971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca1wh/KO+WUPMC9ZKsaxo5mo5dUX/wOwJn5Ib1h7hEA=;
        b=MKFun1NfHOOc1g6GQm9fqqJB0kZlGHqEbo4JbbYuHdu3Ufn3qQ58UYfNiHLqWMTyta
         PkvDgtd/FzsEZa4GnUf9vPqdBkG6s0yo9eiLukStnCcMZyGb+F1EGHRCJ4f1Vl0pqexI
         nL+vIHsN1DMinyjMV6l2SFa9ZMatd5P6ri3tCjVlaJIw2v7LSzeBxNZoMCAQNqeGxA9A
         idYRJ8URIXUvK+8nLn65/3k7+TM+ZFN1fiLwP2s6usDW06FW+XUdodSPsyat/8iqxePU
         efu2xEFQENda2jCkpoxFDVzT9YbtQluuLErbwevQtkIlwR4xuf4194O/76Z9EpbsuKP1
         +GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273171; x=1732877971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca1wh/KO+WUPMC9ZKsaxo5mo5dUX/wOwJn5Ib1h7hEA=;
        b=RzvbqeN5YWfuFnOhINbl9928kZbDtQUMwsXP6m2WdueHPafXf0paE/6904O6HNdA8U
         Dmc1jXNriIDIucHHuA8cCoySdHHQfWfH6quu1PNlc6Wu/KSeI/ceOhPECgfZRG5V1lxD
         QXR4+fqs0aDW2ajY+BOzjLfs1Bb/t8PBxAdwiVQyes/QI53aqSHV3Y965yEXCAi5FYQK
         mEcE0BzP81Fmdb4cSxUhsLlLSKUmFC2MviX9uSZD1Atkr8TpSl5/n+GDhglEyfPtEVsX
         nZQscZ0hcBGKcLK2atNePhPbpES5u+O4cF7gPmjPW8HtreMsihPnScat5a6TwGa5N+hG
         SEBA==
X-Forwarded-Encrypted: i=1; AJvYcCW7j9FknzZH0P75G9ae8eGndnnoSUTUftRI1/InatUH8LaBI8+upqicRFoWTHUMkuL5iVD8bEFxplAq04/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyhHSRVuYihHlbRIZpLabyjh6m1rWYHmnxAwBDKcWELUa+cpyks
	5VXvR0M3MQtF9AR2OV2D70x3sw7JkPJ2L2R818XXupuQCHV7HrPadR0ijXbBLQA=
X-Gm-Gg: ASbGncsiAkKTreX7ZVnx8WFH0XNzyzBmp+znfHP/cC1BRp+cECWP1OZUD7mMo7aEPPU
	KqR/5bGbp75QyB0kLMost4oTSrgyGfGKMSmXPurAndXIFlZlpvdftKgw7JWARyzmsyZwcuFUekP
	y1Npk/3aj9ouxbNkLo5TiL+H+nBFbeByswJiJUJYyUCEI0wGAl/FTGsQQfDs3e6ETy2Wu7YSMO4
	ff/uUx/r0dkVzxfLy+cgltxsinyQYKuzRHLDo2rD9FBetLohiMowEeK1wn0QUiVoBNa4jDQuj2c
	yCag18cz8qVbPW3QDHOcJAEOaLHHmw==
X-Google-Smtp-Source: AGHT+IFlyxZP6biD5HPPeqicl8Wlb81WmlgYHkbJwaVmdfCVMRq/sOgXjiyZs52bpQDkMT/aAiHhjQ==
X-Received: by 2002:a05:651c:503:b0:2fb:8774:440c with SMTP id 38308e7fff4ca-2ffa712017emr12224181fa.10.1732273171190;
        Fri, 22 Nov 2024 02:59:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa53a112dsm2894751fa.119.2024.11.22.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:59:29 -0800 (PST)
Date: Fri, 22 Nov 2024 12:59:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>

On Fri, Nov 22, 2024 at 04:01:45PM +0530, Renjiang Han wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> The video driver will be using the newly introduced

'will be' or 'is using'? Or will be using it for these platforms? Is
there any kind of dependency between two patches in the series?

> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180 and SDM845.

Is it applicable to any other platforms? Why did you select just these
two?

> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sc7180.c | 2 +-
>  drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
> --- a/drivers/clk/qcom/videocc-sc7180.c
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>  	.pd = {
>  		.name = "vcodec0_gdsc",
>  	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
> --- a/drivers/clk/qcom/videocc-sdm845.c
> +++ b/drivers/clk/qcom/videocc-sdm845.c
> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>  	},
>  	.cxcs = (unsigned int []){ 0x890, 0x930 },
>  	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>  	},
>  	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
>  	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

