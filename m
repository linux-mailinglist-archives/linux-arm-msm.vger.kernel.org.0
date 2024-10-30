Return-Path: <linux-arm-msm+bounces-36421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB69B61FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AF9CB24010
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78871E47DE;
	Wed, 30 Oct 2024 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oc2Sa1xI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C829A1E00B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288264; cv=none; b=jA6qYFVMnPKNDiFpfG04JdVzJH5JN3X2kwO6ydBZXTC14HP/yLo0XY7K2nt1yYXHumSBhaAPEuBWY+fjrRyHklmi3+UmDyxvnB3icC/rzBfi2dhwILFF7bwf7y+RJIWdiHARabEju7ZrgxwcNw4E8U1tLqG0CUOk8I8Qov+4rwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288264; c=relaxed/simple;
	bh=FpqEcqz5ysQty4cAtR4jPHdLSbIpX1aKXXfjG/Vd8MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOlfQS7LtcPLzpAb6uWBBwvL47RQd6dSQNj9jkiucdNhthKLprn1YFaGryIe+UAP9GtkX1PTocHdpfgaAJQQBp5IGzOGF9TeEbPoKMmJkoNSDBNwGTM6SY3U4d+UKhmy1HFRaMq0i7u7sEF+NPaSRX5hq1Pd7BYbVtcUxuYtGfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oc2Sa1xI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53c779ef19cso238091e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730288261; x=1730893061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6P6CHR2G+Z74CeVbWC/M2HCFnqe+PKSGrzretJt9j4=;
        b=oc2Sa1xI1y5+9zYywu0qF5PQZFT60fAT1lUYQOd9GBzjhxC2rB5AQ7BYh67EZKRPO/
         eGlIZBmgcYkMOipk4GHYyxagUX5S5rbRBz+atnUaWXljFM7yLi0Iou42p9cSjrEwTgBH
         F/cWvK4+zOYShK0UxgPoRg2X+gnvKVdl2cnL7nbhkzhWSX4Fj2uIonER8kr4sezIotVK
         XgkHNerptC53bwVR44wuQ+urD11UjZ3kRuo1GaZi3toKUnyylksxAIKMXabv8CDL5YHR
         5aufBFqnZklSrotM1SIhmp+s09IWXvLkXCQh9+tcBhCfePEokiTh0pUrXHgYgcGPhO73
         sq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730288261; x=1730893061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6P6CHR2G+Z74CeVbWC/M2HCFnqe+PKSGrzretJt9j4=;
        b=pCluwPZqROQJkjD8ILKfRaodKZSE8ILvM0MsCQ6fqLUoKiUMyEaQLoq2wXDXmfK8hd
         trHVdR/C6vOkhA/6vYrkE5gGyrfsZv8fVMH7e3UYCnM7rf5ffo6/YSeWuvwLoHYCowWi
         w7FQ/V6nSAnNut5GYQ1woy2QisA5RcZfzDLSPeuepUyqBIS3jAgE4UcHUmQ8Q9SuADYO
         2iUVYmEmjCrCadvbD/Id7FLz1ceDDyVOvOHWrUzltuT963QS8fDDBL9gYiXmknU+9oba
         4F4WIiwkX0IKZHH8E2KtAS95pWhUY9OXsTAxCWo4Y/uZo2FzWA4KnRDkdALOV8HV2v4s
         zNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpwp+k8dKf7xYs8OHZ0+p3F23GjwWbh0o3TZi9AqjZ2iXZAjwmHdlj9Esq99CF7bm1oFQpxgPrftCWnGe4@vger.kernel.org
X-Gm-Message-State: AOJu0YwKHQ3QlraEf0cJQh+WDalQIGtEShJTSus/IyJudYaXXHfYOsfJ
	0rlwRqKINXYXBdc3a/mb96A3YgZPQ/r7HzePIwkJG/7v1QuRcwM7xTU9xsAJ7Xo=
X-Google-Smtp-Source: AGHT+IHyikXAyWWvRz+LDig1htJzJ4Wi027eELtxUwK8sBFMRombUryR+qpp/TW7fESgN0nBLz3WyA==
X-Received: by 2002:a05:6512:3d14:b0:539:fc86:ce0e with SMTP id 2adb3069b0e04-53b348e58c7mr7586492e87.35.1730288260923;
        Wed, 30 Oct 2024 04:37:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c763d8775sm85995e87.129.2024.10.30.04.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:37:40 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:37:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Stephan Gerhold <stephan@gerhold.net>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] cpuidle: qcom-spm: fix platform device release in
 spm_cpuidle_register
Message-ID: <ltsbd7dyvfpk6dhcl5cpwcy3gctzdt3rmiivue4uluujgxcfxb@duuo5ygohqwr>
References: <20241030-cpuidle-qcom-spm-cleanup-v1-0-04416fcca7de@gmail.com>
 <20241030-cpuidle-qcom-spm-cleanup-v1-2-04416fcca7de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-cpuidle-qcom-spm-cleanup-v1-2-04416fcca7de@gmail.com>

On Wed, Oct 30, 2024 at 07:38:33AM +0100, Javier Carrasco wrote:
> A reference to a device obtained via of_find_device_by_node() requires
> explicit calls to put_device() when it is no longer required to avoid
> leaking the resource.
> 
> Add the missing calls to put_device(&pdev->dev) in the success path as
> well as in the only error path before the device is no longer required.
> 
> Note that the acquired device is neither assigned nor used to manage
> additional resources, and it can be released right after using it.

Well... This raises one question: if the device is put, then its drvdata
can go away. But at the same time the drvdata can also go away if the
SPM device is just unbound from the driver. Granted the age of those
platforms it's probably not worth refactoring the drivers too much.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Cc: stable@vger.kernel.org
> Fixes: 60f3692b5f0b ("cpuidle: qcom_spm: Detach state machine from main SPM handling")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-qcom-spm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
> index c9ab49b310fd..601aa81ffff3 100644
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -106,10 +106,13 @@ static int spm_cpuidle_register(struct device *cpuidle_dev, int cpu)
>  		return -ENODEV;
>  
>  	data = devm_kzalloc(cpuidle_dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> +	if (!data) {
> +		put_device(&pdev->dev);
>  		return -ENOMEM;
> +	}
>  
>  	data->spm = dev_get_drvdata(&pdev->dev);
> +	put_device(&pdev->dev);
>  	if (!data->spm)
>  		return -EINVAL;
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

