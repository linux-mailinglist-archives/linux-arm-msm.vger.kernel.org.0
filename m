Return-Path: <linux-arm-msm+bounces-23428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC79112B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A2A01F2259E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B561BA073;
	Thu, 20 Jun 2024 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flDkmKok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08431B9AAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718913605; cv=none; b=rgRoCz3vQrcKdwsszW/tUlraGK/dw7CS5vZxKDG8fwKmdpCmrd7fwgoiHRtZE63EjAJ5ZEQxttFDh4OIfXp/v2rn8c5/wED9KCwP/7MrDw9wrRkXvqRNLuIewdiKTLU7/JXZ8qnT+UFt4zmv50OVkD86SI2BRjMPQVHozPMVG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718913605; c=relaxed/simple;
	bh=2EWx4KYDnrDNkjCe8TXjn64YD4M1kKZ6OMRdencFrlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8rPJAR3SUtdRn8VhF8lkL6m5zkCNzDVOCCyaKntvuBqwHrPROVhbhLxwiYGosf+F3NPurGFV7MkNdf6Aqvl3y9y4opHf25Vispbrels+YS+GIEc4Mz+7UZ/jKrKi0u8shKUZ4pjQh3/hewtdpugcGIsQtzbUsJkCE2c8hwLqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flDkmKok; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c525257feso1456210e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718913600; x=1719518400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMilNXtwVzUh+PE2x1zMrBwSzBscyeknBF0WgBRu6Ys=;
        b=flDkmKoktAcMOeUdgFRoFs8lgFwLeYmRNv/SbvtvKEXUe7VzYzAjIKykgVHQeveXpm
         vJcqwo3QuHUSCPUfGWMobqifdvCJcVJA2JUm75Swu/JbB8uAn64gDR0ZdVrwM6nZP2WX
         9cD5LzqR5LVOnJgV7p3IpYqOxiPLlMWfxK1Nl1g5mxi+bApARHTjC8yQkFapg/BUAWYt
         Rq1uGQtryp9kwxoiHVDjHyME+IqgEn6d4HyMZsM6i7wdb+nJkPucoU/MXkwADftG7amH
         e4fPuZZpx0CjR//5TCut6UZfQpvtj171sF7GjCFtPLw4X7V94IpUEneO3VmE2hdNq+tg
         fnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718913600; x=1719518400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMilNXtwVzUh+PE2x1zMrBwSzBscyeknBF0WgBRu6Ys=;
        b=mh339HkfR8dfbH82igstqBvFWK3p3G2jsg/j0UHAQKmpv/Iw7JT6LCMJmeV904LI6p
         JT0N2QBx+Fhgl1tl1P/dyJhT+4yFBJVQr3PosPFYItNfIXhAEiW+47BZWSaedJaprtCT
         lUPPy0j1y1MgG2wAndVoBPvsd+7PAZVCUCq4QksIEbwPRyJ06HsG8n7iLKbMj71DwX7+
         Bo2PBGr1VHFRIVMhzqzpLDBhoMv/9AN9YCqltMxYTXbyUQxDgYJ7OkRc/CQPjMQICSjy
         mI8+Z7VmdDIEGIygkbyIiMNNQF2Zp4FbmXcoBRUVxUWGhnMh4Ym2uiQCRZL1cgQ3TpCs
         W94Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4W1kKjfD1bdvznvo9HhMwISOA/6JkYjl8H8DNx4TcQAXMsXtkZTuvp/NsR64GMdEDj4ny7FxQaC5hr/NgZPQQ55YAshn/gUhKjofRdA==
X-Gm-Message-State: AOJu0YzbPZ4wg5k1L8/zAPAFJVJG5BDS0uO9QXP0MQHuYASWbMkTsJf6
	o3tsyGBGdtXtjNeiT5sNkG/imC9HJV42oytOe/PWxl+Gexw93PbUfggry9FGuus=
X-Google-Smtp-Source: AGHT+IHdCVdixc3RWfaztM0Yax6GeQG03rZH2fQxNQj3MXGnPGiL+pdPpHyRVEOOF2kRgRIM885D1Q==
X-Received: by 2002:a05:6512:ac4:b0:52c:cb56:8e8d with SMTP id 2adb3069b0e04-52ccb568fc9mr4688542e87.37.1718913600095;
        Thu, 20 Jun 2024 13:00:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cae91a0ccsm1763627e87.97.2024.06.20.12.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 12:59:59 -0700 (PDT)
Date: Thu, 20 Jun 2024 22:59:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Message-ID: <2fwo2pbplaxkkviln7m6jgidlspnur25qrth42s6jozksb22w6@qkyt2og57baj>
References: <20240620191228.3673550-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620191228.3673550-1-quic_abhinavk@quicinc.com>

On Thu, Jun 20, 2024 at 12:12:27PM GMT, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> changes in v2:
> 	- instead of adding more validity checks just drop the one for clear_pending_flush
> 	- update the documentation for clear_pending_flush() ctl op
> 	- update the commit text reflecting these changes
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 4 +++-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ef56280bea93..6f8c7ffa2d27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -83,7 +83,9 @@ struct dpu_hw_ctl_ops {
>  
>  	/**
>  	 * Clear the value of the cached pending_flush_mask
> -	 * No effect on hardware
> +	 * No effect on hardware. This ctl op is always assigned
> +	 * irrespective of hw version and hence no check is needed
> +	 * for the callers to check its availability before calling it.

A simple 'Required to be imlemented' or just 'Required' should be enough.

>  	 * @ctx       : ctl path ctx pointer
>  	 */
>  	void (*clear_pending_flush)(struct dpu_hw_ctl *ctx);
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

