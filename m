Return-Path: <linux-arm-msm+bounces-35851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D99B00A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E903A1C21657
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5481F708E;
	Fri, 25 Oct 2024 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VROG6mkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16FD1E8834
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853699; cv=none; b=oCsRRr5pjPGGLhqpgm/gDcPfiCdQy4Tv6J1LAwJAsYLgqxyXjnC300DwhiHykxvmz5mztcWM1atILvWVMpMP8r3tMJ7mbdpdauAswW4fbMJ2Voh0XIzKuLi/7YDY57o/3e0MMzVAXbKheuamaZXDUgCAiNQh3/r8vjeYL2W0iUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853699; c=relaxed/simple;
	bh=B6BnrCQ+m8WxHzFBv9zBDpv2ny1bdJMGY2pKixHiQ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvMXZ0jhDkX+q+PxBTSguon+ZYCPscA7VOZBTDrub8ZmmnSXcXADkaj9wA02OOmASfRtp69/NcSFJURdSAj1jTMXfxX49U7pM1hYC0xMNC7r4lorvZJNQGtCYvUz0dkmOJh5Qz+RZdbA8jKVzvb+c2gYKnnIwNLM0DbjMZ34sfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VROG6mkL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f84907caso2105806e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729853695; x=1730458495; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RRluDvgLstVsYFQpKWXOrvnW+AuzroV7iXmo5BY1EVc=;
        b=VROG6mkL92gkZjL6ztcqaig5R+anta2dsVKPWQzIo8t3+DZjI9Vq69hmA6j4r6p9Lq
         OW8iNRVD3kFcXvrAWvqrNohgqNozrGKEcduh8I8kOjjj5vMHZSM10z5GCFfKHNEwqM68
         J+GjW7T5kfN7gus7Z/DkCSjyZgL+xyBgLILFGiU3ac69tdT5t9njtMMkWtelAj9xeMN4
         IdP582wf6V4Fj6hk0t9U99wRtPnjNu9ma5URNsOlohC41XoXlpdpB20HisSPndczrTC4
         6As/3wR1q06XJ9RPxwR+JyEy1CmpJbyE2FlFEGLvzo/pNnsRRGp8ShwH6HELeet2p4Xp
         geRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853695; x=1730458495;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRluDvgLstVsYFQpKWXOrvnW+AuzroV7iXmo5BY1EVc=;
        b=CXk5eHsof+oklfhrqdeXw9yq4tZ2yKMYB513MHpuTtjfLTj2069fiO3+9ttKfcWOHK
         TOjBmp1p5mbwrNKYzqs4SHsx08/WGqWefOvxA/I9eMuNLt+d8fCT/ZwKCPJCpo37oDbz
         NKIk+Cxzd8rOAXydjMwndEFAwFMZpsRmYPELPgyhKnphCXDPe0IEoWd4dXxV6NoxMOux
         6ZDdgwnvEuPpOPSioBz811tNTOT9EwCYqzsgdMgQr+46k9mKyfVd/S6+OuG7Tqe95ZcH
         3pJ1K8ZTIx0PrOSQUHONk8D8780zrXETuNBwHIdJHBwTxv8VvCL48Am/ZLsnOnnSPbcv
         +Oow==
X-Forwarded-Encrypted: i=1; AJvYcCV8jMDIfNs0FtGQw8pSKjFTvrPwyltny/wsnq4VjuIioGUJgEvO8ZQgSoeYQqiyR7Lhtq/IaH6pYCD17NXK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+P683osQrdS3EXQZ57jn4A6s4RtRZvwmhpWvQLBrIqSVcZMAp
	KHy32hYBXCKoheyigkhTWY70R0OqhHhuPMeEUOU4GCXu0KEwd8xjmztxbwg/QG0=
X-Google-Smtp-Source: AGHT+IGjCzX6lZ+7mkst5UkS/WDy5l500ImsTTb7hvSmO+puUYbDtf/5cQU+H32FDsdSZFtA4Wb8zQ==
X-Received: by 2002:a05:6512:3090:b0:52e:767a:ada3 with SMTP id 2adb3069b0e04-53b23e84b50mr3366445e87.47.1729853694754;
        Fri, 25 Oct 2024 03:54:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c8c78sm136810e87.201.2024.10.25.03.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:54:54 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:54:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Message-ID: <lddlzl7mnza7pc7btwn4rpsyijdrclihncudecujvwlb3sunvw@a5yzckvfdzwh>
References: <20241025085728.113098-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025085728.113098-1-jiapeng.chong@linux.alibaba.com>

On Fri, Oct 25, 2024 at 04:57:28PM +0800, Jiapeng Chong wrote:
> Variable ret is not effectively used, so delete it.
> 
> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 5cc791b3b57d..c7c4fbf73183 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -523,7 +523,6 @@ static const struct dev_pm_ops qcom_cci_pm = {
>  static int cci_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	unsigned long cci_clk_rate = 0;
>  	struct device_node *child;
>  	struct resource *r;
>  	struct cci *cci;
> @@ -597,7 +596,7 @@ static int cci_probe(struct platform_device *pdev)
>  	/* Retrieve CCI clock rate */
>  	for (i = 0; i < cci->nclocks; i++) {
>  		if (!strcmp(cci->clocks[i].id, "cci")) {
> -			cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
> +			clk_get_rate(cci->clocks[i].clk);

Why do you need this call if the result is unused?

>  			break;
>  		}
>  	}
> -- 
> 2.32.0.3.g01195cf9f
> 

-- 
With best wishes
Dmitry

