Return-Path: <linux-arm-msm+bounces-33245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F8A991FEF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 696E31F2117B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692ED4D8CB;
	Sun,  6 Oct 2024 17:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAhRWZGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9A16133C
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728235940; cv=none; b=GtZk2aUS0f/vDyB2RUl5W16CsJZWga1H40UADXj0jsMfBhjoxgCkgWHIwBpiJtKjqRYfluUG6UPRx7PRNqcdqf6lIhpJnxenDKSdpnA90kRMIGpCsTgHywCTxdnivGnhRr5T0el9yPSt7o/q/14SmUSvJ0cOhzIOeQxvyJWNuvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728235940; c=relaxed/simple;
	bh=eH2s1nSiTj3aux4IRTk8hs3hHnOMWonaaoHf+Jgu2FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIovuS6XrEuCtCPCbL+j68hC78tL45BdaFPnE7tM2bXDKuVUEWw5TAXOevVcjLLkVd4x2TySYaxvJTtqAcesi0rEd2pbMpoLY3aKeqUOdEfTjTR3U++AHU2ThCS7uWor6PRqZnXwRRkvvwmyLu1rx5dxEQ6r0snEJWk/2KdNWkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAhRWZGe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539885dd4bcso4474491e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728235937; x=1728840737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkkTShwqvEkU2pXAQY0BAtAP+96Mr0a+LcjE8tjGdL0=;
        b=aAhRWZGeENSTvvbPfcy2sI6IVJeZOmrfqs69xqQjeanpzjCaA8A39v6hprFu95SXvR
         K6DLzkeewbHmo2d3XjELwgoZhvIisJ4c25quh8mak2YMErQKrcAQSRz+vRA8Oln91G/5
         mguxX7mRhx1k8rxfX3VKkVleJJ57+2IiOTvVlhjKhOv50Fgb0UWstHsvA+oHr/d+2zp7
         SZa9MTcZVMOKEoSYqxn2wd34k4BUcHMA9BvN8RbKyjpiNcpbOB+/pNnt1yxhSeY1QKfg
         GjOl0fP5EyMxb3enHp2EQecZ9ftLKk5dR18WnLN0NPZ43aIY9zI5XGvgbEo/frUgTvWm
         RSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728235937; x=1728840737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkkTShwqvEkU2pXAQY0BAtAP+96Mr0a+LcjE8tjGdL0=;
        b=qRpUNmnBylbHxRD+rcIb3HNzfEqWY3oTLEMIhxcFn/K7TSJE+hQekhzB715uSw51RC
         aUIYaj9CkZetZDyLy9X0kZ9TraVghN0gFeM1F3Gdy6g60mhgn25HggACXeZSLaY5yqsI
         6zbt90j27ygYfeUr+OK+rqXekNS/zeJiAnPhQiaaor25b4JpofFb5tPh2zU7XePNOAs3
         fDQV+EAdIsgPGIOv+PhxMKUA3AFjTb0U6qiWc+JgcHDOXr5qlu3o6FqSABFX4xgx6jzN
         BOT2kp4SGUrx+eDmP//CwAW/NzsuMRXma5lul/C6Vl2HgHu6bfeDq6KfqCDVVmCBTY7z
         mIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbZ4Hq7cqhk3lQsYMRC6iwFO5MCLy7/2IL4u6X7vXZUI1BGZ/f8XBArD51WqP1prJq4tSgGWMlwlPQiw+p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3VVh+hmuj5bGAlZRrmpfF/ICVm6b7td7lh7THwyIGCrexRxP
	FcRcKM0JEpwlWXbtkX7gvgAfPF+RkrRnMJF24woxb0bytAYRDS70p2EGHk+vkJc=
X-Google-Smtp-Source: AGHT+IGK8Akt1ah5HhrTyw13URk23TpEFUe03bKEw6dqgLZPPsHuJ6XyU8+xsn5SsbthvxzekZGOIA==
X-Received: by 2002:a05:6512:3c9f:b0:539:8f2d:a3bc with SMTP id 2adb3069b0e04-539ab9ec4c3mr4196367e87.49.1728235936960;
        Sun, 06 Oct 2024 10:32:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff2336fsm572403e87.203.2024.10.06.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:32:16 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:32:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Message-ID: <hibhrxq42xoffxa57fckiwbvzjvyzxi4rrtokdpzu533ul3wnb@kas6rhji52mz>
References: <20241005143818.2036-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005143818.2036-1-jonathan@marek.ca>

On Sat, Oct 05, 2024 at 10:38:09AM GMT, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 

Fixes?

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf376..1205aa398e445 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
>  
>  	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
>  
> -	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
> +	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
>  }
>  
>  static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry

