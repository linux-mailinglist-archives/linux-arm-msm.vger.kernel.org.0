Return-Path: <linux-arm-msm+bounces-32168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C63997E206
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2024 16:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57B41C2082C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2024 14:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB0C6FBF;
	Sun, 22 Sep 2024 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woPcY6vv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD1F4A28
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Sep 2024 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727015973; cv=none; b=cgXflOhPx2ZNhkbzduQoi5+quhVkFeZz4wyuMNKs1uHoutOMqm8ybW329EyAg58zADU4PnH3xaxvZ5Oul8++HUOETZBRnP91y+uweE7GpRI1WBxEZUAT93WdHkKqyqDAP9pKW6GVOJxc1Nm+TGn6vT4H43RptUISVO5m1JWKNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727015973; c=relaxed/simple;
	bh=AfR9SBqzuLK2O2sxCewRKtNE8lpuN4wYOAadBWmt3y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj7QRgm/DLI2G/7N9mnCbIY3jH6H6kLsKcgUYUeinizj8KCvUgW/eyjxiwGSlnoQ2daNILwVnuIyJqyCI3RBJG4GYbF1RdE9ap/C3Gm0gcclF1pYAB65edN7/BP+Fng8W/QDTliFFqRy+kfUwlKkSkP0CYW8XTUjVW59djDdqJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woPcY6vv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so3797038e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Sep 2024 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727015970; x=1727620770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+Z1Fj0zQf/4137f/rr72W5Rrit5dm3a9kJJ8qdJcv4=;
        b=woPcY6vviRsMzWueMRvlNy2Ly6d5Y3PgPaL4zhJsY9AeQpbqkYHpjzxqdJ/9UnRtMP
         PueazGsiUc8DRzy17TZBPPpnd4RGePKiP1m8kAPMxifhyVuae8LF2KdU3vr0tQf3WFnF
         R9H5yGzP7nCad08DVlLIY9+JKMsG3Pcp5LAgsN5/qP2tlqlOCbtol+iywfVTNMDz2A8o
         aHQPDTV7BGYb8Te4Q8ptQFxZJnQbh9jjADuA+Ds2SH0d0Ft18bETkwx9X48cTzi5QB5i
         lpK9Xx32ladnFEgjaDpW1bpDmduOeOan5FMCCPBXc92FQlgWYp175SGDyx9xQNtx2NCN
         8AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727015970; x=1727620770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+Z1Fj0zQf/4137f/rr72W5Rrit5dm3a9kJJ8qdJcv4=;
        b=ccfWeLi5ZJ0Mpgp8L3Emm0vXZ4RGAC4zOhJjQ9Xc3LpDeUTqSIXyWl5wk6zO5UH33v
         QFvCFwLduRIDQjps6ksdLVjZqNdLR9XL0trdytkpGYHv/tD31pj4R4l6Xv1Ksnzg1RkL
         PoaMp9dJD0+54MNdgpICJuqw4J45KBiKtAKUC82OyX7dG61+V7azV77Wzu3S4Fh8S9oe
         md/YK7+teeVHMKZHjNXmloeL9gUmrsUbh++vv+HKGSQaupVZLVQmig+iioJYgjlReXAV
         1OQf58sQkWQ3ksJQ/+ensOPp/u2tEqgycUpGsDLBPyvDFwFZxe5oKWDzGD8brv/Uioxp
         40JQ==
X-Gm-Message-State: AOJu0YwoG4r06CIVcdlZoowKWzTX9CGrO8JizarH28tkjhPUCBYRExv2
	kUysnDyVjCMvbFJvG1Hnfl8AJ7FMTUVu20p8UMpmVWghdYRxKPSXVkABAKN7+ug=
X-Google-Smtp-Source: AGHT+IEMNG1wX9oM1T2uLOaIh7Ct9PfBz53bCjFMsXE96yUL+EvR1Zc2C/eXgw9P+Ufx9b3NCVYzDw==
X-Received: by 2002:a05:6512:ac1:b0:536:55ef:69e8 with SMTP id 2adb3069b0e04-536ac179d79mr3815089e87.0.1727015969504;
        Sun, 22 Sep 2024 07:39:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536a7a4c4besm1326814e87.65.2024.09.22.07.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 07:39:28 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:39:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: John Schulz <john.schulz1@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drivers/gpu: Switching Adreno x1-85 device check to
 family check.
Message-ID: <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j>
References: <20240921204237.8006-1-john.schulz1@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921204237.8006-1-john.schulz1@protonmail.com>

On Sat, Sep 21, 2024 at 08:42:54PM GMT, John Schulz wrote:

Subject prefix is not correct, it should be drm/msm

> Switches the is_x185 check to is_x1xx_family to accommodate more devices.
> Note that I got the X1-45 GPU ID from Windows which may not be correct.

How did you test it? It's not that the driver is going to work on that
GPU without a catalog entry.

> 
> Signed-off-by: John Schulz <john.schulz1@protonmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 12 +++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 06cab2c6fd66..f04aeacae3c2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
>  
>  
> +#include "adreno_gpu.h"
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
>  #include "msm_gpu_trace.h"
> @@ -1026,7 +1027,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>  
>  	/* Set weights for bicubic filtering */
> -	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>  			0x3fe05ff4);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 58d7e7915c57..ec36fc915433 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -526,9 +526,15 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
>  	return gpu->info->chip_ids[0] == 0x43051401;
>  }
>  
> -static inline int adreno_is_x185(struct adreno_gpu *gpu)
> -{
> -	return gpu->info->chip_ids[0] == 0x43050c01;
> +static inline int adreno_is_x1xx_family(struct adreno_gpu *gpu)
> +{
> +	switch (gpu->info->chip_ids[0]) {
> +	case 0x1fc31043; // X1-45

Just by comparing it with other IDs it looks like you got it backwards.

> +	case 0x43050c01; // X1-85
> +		return 1;
> +	default:
> +		return 0;
> +	}
>  }
>  
>  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
> -- 
> 2.46.1
> 
> 

-- 
With best wishes
Dmitry

