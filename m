Return-Path: <linux-arm-msm+bounces-45227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF4A13535
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBB9B7A00B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFCC198857;
	Thu, 16 Jan 2025 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COJJMk0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42A194C75
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015593; cv=none; b=Ay/kO9t19cAxZzp26o1q9YciBsb4+Md3xiBhLIFAdIiCstPGlMGsodfLC6lx+4Mp74Ryd+pEKYO8zMYkqKB/DICjkRqWFYmADqIeY97J/hoM/7Com85BSjb0m7QhhOdEhMt3iaVw9tK1xqoUHwHgmCwpL5FnXLhZIt6yjLu78Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015593; c=relaxed/simple;
	bh=MoJx//s3XO+21LNgnZMyJ/kFuNmfvDn724YC1CfHV1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5BPSi/AqTmhcshaIubYr+yADlRJIpSEGsZ3QhDKddOHpHLMYaYJcVFl+0DD5ql9WNL6Mony0ZqpL+DE1/PsT8eMe6T/D5+mhAwyMVU5RCXLmEtNs6zEv4Te97BIYfubqyPdQhyUB9wAoKgkhY2n7ly9356zrpQKkHMrTbjcr5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COJJMk0N; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54263b52b5aso721393e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737015590; x=1737620390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzvEM6Sx/Mz/fcLQKNf1rXALQX/HnytzEqDjtX99KKo=;
        b=COJJMk0Nsfch0+bjf7+ymF+dTXNhrrjS1pX7V1jDiOe5vR9W9w2uTfy10n4Df5wK5+
         bMyB7QhV67gIwdhlnxTOKcs4YjOtz0wE4QGXbBnpUU+YrRgnSOQ2xesHOS9L7H7C2cPR
         QYI4jXOyC8YSN86fg0l7SrBk24l1LyLw8OyOZCutvGhlmdOm6RC8pZJ5bSaZ7gQyI9hu
         nTSd9cdQaZR4TVMx4d2l+yzbOMkTNeUPqQIRcX1L2T/eoYH9TuolLaryUIeem+7NyDC5
         7qLyots16/ThbJbX1HpQFfUqNh+b4pmkMRF8yRFbfSrBr4L/GgRqt1BtijytdZxMFMO0
         zykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737015590; x=1737620390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzvEM6Sx/Mz/fcLQKNf1rXALQX/HnytzEqDjtX99KKo=;
        b=BTtS3PJg8BRUgbljJ5+Cj+8JYJf1a73AroURsPFn8qxL6Q4F/ziRXbwKO3uFvD0kSm
         olraxZie2B1S/LXeSWnxHFu5LoZaPDmnfWUw0wNM3s0oPQsxXc42tMkc7pDV74vR89Cc
         3j7gE3lRh/z9bBNAE4PorX24GSCUZrSGHD8Wvrwffj8K5Kvll8VIURF7WQlZuAhRSNoI
         Xw9AGRaCZ2afnX/j/WaDLWOvCqJywPyt7mODgJW6bdUAv8DMuSNsFFHaUsvurCxRJY/e
         e/Ypsd3BK8RFPOHIxDcSKTPUueYbnUG+DFhadz5KoGeidqEpVkW8vmRX8DfU/1dooRx7
         cWLg==
X-Forwarded-Encrypted: i=1; AJvYcCVXsgnT3ZgA5VvWRQpXDAZsXAq2O5qX2RI2qo8IqRFGRttJv59H3SlA0BJmoxdoZTatrAk2SM8SzvsKdJ2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXwN/5A/M4JxYJY/bGv6y+jwt8E3d0l2y2JT4ZtTr9VGZCIB0
	BCUT4b0n4+IkoYM42LZ/P0ZvR7ZfRgGLY6L5FoNTGKwdwSDfWDCpu+Qp+Op31NY=
X-Gm-Gg: ASbGncs0+HYVTa8m79FQ4WjJcw2gCrlZOf556AIqnn484n16VZf+J9qwzUQYhq84bTT
	ENgelQ9Lg/HV3S+TAHVXnYWuGhmycnSwijyTTgTIdoMvF1Tu7AKjTPxaltCX3A6ZyqOhM7mc1T5
	WzAHMLLvG43W8qW9m8LJqqcOz6g8wKcEBMppNUESIK/UZKQrgRHxma/ENvAe7ZPJ/kp4YX51PJz
	keCX2aCUxbf6ArTSZMotB/RAnMQ+mXsgnaSS/K2k9v/Et/kO2OUgfsvLxRzghzMECFlA5GxqXnl
	Y/9XwMX0BJk7m7/aSeaGEDrXgasacVhw+Sm8
X-Google-Smtp-Source: AGHT+IEW+BLFAKp5RZ8kJKPMw7gbZ80UVcR5TDbEC3UmcmTe61NigrFsJGQQDkAseKY0uUZNPZhGmw==
X-Received: by 2002:a05:6512:158f:b0:542:28a9:dcbf with SMTP id 2adb3069b0e04-542845bac70mr9816333e87.23.1737015589596;
        Thu, 16 Jan 2025 00:19:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a5bsm2234637e87.129.2025.01.16.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:19:49 -0800 (PST)
Date: Thu, 16 Jan 2025 10:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 15/16] drm/msm/dpu: Disable SSPP multi-rect mode for
 every pair
Message-ID: <riau5d6ndc7ujjyzgbdzwybzigot7xdg6xweewqmnsmlr4xws2@zwcg2fdngr55>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-15-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-15-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:26:04PM +0800, Jun Nie wrote:
> Currently, 2 pipes are supported at most. It is enough to check id to
> know which pipe is in multi-rect mode and disable it. Multiple pairs
> are used and need to check multirect_index to decide what pipes are in
> multi-rect mode to disable them.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d96f4405a4c26..d2e0fcfbc30cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1480,7 +1480,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  		 * clear multirect for the right pipe so that the SSPP
>  		 * can be further reused in the solo mode
>  		 */
> -		if (pipe->sspp && i == 1) {
> +		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {

I don't fully appreciate this change. I'd really rather keep it as
i % PIPES_PER_STAGE != 0

>  			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>  			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

