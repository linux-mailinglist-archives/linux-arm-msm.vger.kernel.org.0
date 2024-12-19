Return-Path: <linux-arm-msm+bounces-42724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C299F733C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 04:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D9AE189315E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 03:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F312886336;
	Thu, 19 Dec 2024 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VG5U5OBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009870824
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 03:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734577752; cv=none; b=FvRQ28sq5dJtMd5Fw7CxT8tJ2u42B+Hzd15+d5FLBClhcYPED0ws3UGyhvjwPo4DRehXmq6fdgOE6SyoBH8ql0Y4P+27rvq6ciIOQLpm8SSQZeKZ/qNZ5qvZ4ITkerweQnZRQZq+1YMS4TpVnIM8slX0ZPDj00TvJio/iriZQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734577752; c=relaxed/simple;
	bh=h6rtXx6E/Ub/8ntDL7SsxJGNcDe7moZzv+DgjbG2H/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8riIotVcvHvJVkeC+TgogGt6N8sKq0tBOFjub4YY8MLTzaxB/nZui7zv/PvdyYcylm336su8rNI8EXHqQZQk5oqTBToBMyWvRs7/t6BA0ZunKnnGLNPJ4RIQSU88k42G7I+c2cOImbA8YoemHOhquVUZILkJmGIgDQh3iC09Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VG5U5OBA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso178950e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 19:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734577749; x=1735182549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAWj/RXMsp39rYtlPFugVfFgIik5mQ56vTtEiy6K898=;
        b=VG5U5OBAO1/0c2NoAS8EgOPyS//UMo4tfFgffo+3ZP81uSqnaGfj5+TqUJN4sQ9MlY
         cWtrJ6dZwZ9oHy6P97/OnLK7klSPmTfz7QYyzp2+/lzzVPGBk1VJ7OWeVU/LInw76jUV
         m1yazrzBQEphZks3dvcr8NiKcFAttpR8y9OTkdZ/JVPeSPyVQJyLcCK1sKFkYBBONyYx
         b7hqkLVj+uVo2odihWXh+g2AeYZCjRrPpSNnqWJJSxf4Xfpj8xY70fl0ynaGxtMRGKD8
         UeCGkpvAj2vjeIrAMkv/yjnn2YlC8+snVeM18UlFWFVmkXeN3Et32qzPwt/BXalTBAv1
         /7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734577749; x=1735182549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAWj/RXMsp39rYtlPFugVfFgIik5mQ56vTtEiy6K898=;
        b=R7qULu6PrGQV+LHsJMGE7WbHv+rqyK6nU0xfL9m1TEBY5KR0cAh8xBCo7hJoD4h/Ke
         MsgJR+YkCHIWMGnr4q4jQoJOgw7ef6mKIkuRlG5qfVBKddgH0HlUJMh6T3rSq92n/V2n
         kV3Y3+ee+0l2gpxneCq2vE+0CmlqY4BFG53c8TsSlEwmSNIYjDJ0SrkrsN2Q10XqRWD6
         FF+2D5fFqegk9Xd7ihglEMsLZOzJFsSc7xxVIXvSgXmZ43z53O7z7TnrEw6h92HCht0e
         va9d3dpDmFs8ybTp53jiAGzHgcBfEMez0V4mD4Tah4DDEZYXUU4louYZM+uTyiequES3
         FZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk+vJfikN/kLyPbuurs/Xbrf43DupRXk2gaX1cOUU5FCVtdOFD6O5XO5oT7AlOiPh9Jq4xMlqbX9skK+PG@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6SsknR5Runvu2sYypWBdIIzaACO4Is/UmBN6VkXqCcZ/XF/9
	heQgu1jGv2wAbAVcFCT2KxTKYJr//+scv7zZ0cVTb7CZdzyiD+dvXxjmGb+8eWQ=
X-Gm-Gg: ASbGnctOwCCDYadfdtkjf9fX+E3D12P4op0RL/Ke6BKGo1cpZl9RLCnQb37yNMUzzsa
	rfhtGs5ZZxMwRoyJ8xt/xjfoqsGjvd+2xXv2w/5Jex9bGT/MZFK6e15W8XCZ2G09+nBsC6JuKsv
	mMmtWDzCtyVOCLSxnNC9/zs4vie1wyfNgTb54GWeLGk4+/oYGJ0CrUoOriGYQILa/2UASd7gwkN
	D5u30nzrhUGnLjRSknRgkgYCE1/ItWvjpHjm5GsXwqBdz5CZZURgXjAPSpXVrJUNb+gsLE6H0d2
	ldbxE/CLbgrFgsJJ3aMvuyB6rqj96OKyzk/C
X-Google-Smtp-Source: AGHT+IHy+maYGCy3dtwKHO7L044QpVaiEZ8uB8NFDb7ONkLj7lNRSAMbMHNVrRm+1ULsyRJjtFsZuA==
X-Received: by 2002:a05:6512:3190:b0:540:30df:b3ea with SMTP id 2adb3069b0e04-541e6747036mr1574039e87.15.1734577749125;
        Wed, 18 Dec 2024 19:09:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215ccsm47821e87.215.2024.12.18.19.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 19:09:08 -0800 (PST)
Date: Thu, 19 Dec 2024 05:09:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V2 1/2] mmc: sdhci-msm: Add core_major, minor to msm_host
 structure
Message-ID: <emdc6nq3z7z2zimkbut4hknhksoyzsemnna7iyrdvkfxpvbkvb@7vxdyoams4ky>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-2-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218091057.15625-2-quic_sachgupt@quicinc.com>

On Wed, Dec 18, 2024 at 02:40:56PM +0530, Sachin Gupta wrote:
> Add the core_major and core_minor variables from local
> scope to the msm_host structure. This change improves
> the organization of the code and allows these variables
> to be accessed more easily throughout the msm_host context.

It doesn't improve anything, it is necessary for the followup patch.

> 
> core_major will have information related to sdcc controller
> major version number.
> core_minor will have information related to sdcc controller
> minor version number.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..2a5e588779fc 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -273,6 +273,8 @@ struct sdhci_msm_host {
>  	bool tuning_done;
>  	bool calibration_done;
>  	u8 saved_tuning_phase;
> +	u8 core_major;
> +	u16 core_minor;
>  	bool use_cdclp533;
>  	u32 curr_pwr_state;
>  	u32 curr_io_level;
> @@ -2557,6 +2559,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	core_major = (core_version & CORE_VERSION_MAJOR_MASK) >>
>  		      CORE_VERSION_MAJOR_SHIFT;
>  	core_minor = core_version & CORE_VERSION_MINOR_MASK;
> +
> +	msm_host->core_major = core_major;
> +	msm_host->core_minor = core_minor;
> +
>  	dev_dbg(&pdev->dev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
>  		core_version, core_major, core_minor);
>  
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

