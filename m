Return-Path: <linux-arm-msm+bounces-26451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8CE933AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8570C283599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C625FBBA;
	Wed, 17 Jul 2024 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTry9gij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C117E8E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721211214; cv=none; b=OEjnCrQEfFacMhBV97XAz1taCnoOYHAaZS7MLwljFw19Wc+FWApWE9ZrhvoVP4jlubzX4ry+LX66LFCIGQYUNA1S8AvrrsCHjvhNec+InJf6/jLz7YM68w5wLbnSilU2z0XKOssOi9mZGg36mH7smZWG0L50n6MRKfqTfq84U0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721211214; c=relaxed/simple;
	bh=hxNjZ66OWMZr/C2wZN8pEwfxToH7/kQfSytf/d2PWmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGXNNz46R2H/4dBtOG6G07TtEQM7V/kYnZhvVU9g1wmbevB+zemHsHQY/Bn40mC0QtAL0equP/O7j1JnfCO0WHvvYzFbaGN4pnhqk+DBlzxo7oWH7QsDoUxmTswJCLLtsi+5/FzYePkkBplzd1vfkOh1rfrAMySviC327W6LgwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTry9gij; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so92070681fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721211211; x=1721816011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMZYKLKt5nFd5HxKUlHRZ5jJLcFrY6yg4Rsgp9kmoAQ=;
        b=eTry9gijch8j+EOLZTkQZOUnzQKoNg0mfK1Y9+lo+L5QSnhr2yw6gOT8UXcOBtDQXG
         S5eeFriSKDbBJbLkjRMqGlZyTsVpNcEOo2QXA0S58jtpyuAWDtkBCOA31+fihBcF24Fe
         ghFEkwPgkrJfLO6mpydx6GGK7KkbCg0nxZq3CvlZNDnLkW69qCb5AZNZZx+qhKdA0zj7
         64vBP1fd9T8pVQEJFLF90GqFg4IGF/LidLUpEjYgSM+ecXLWQK09B1wy8cgijdn+7+FX
         TW2OqYN9bRMRvLYcuNQjdB+aQqjgqB+uAShZlh4eFnIo75QIOZNk9WTu2JxV+Z7p+3Yi
         wBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721211211; x=1721816011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMZYKLKt5nFd5HxKUlHRZ5jJLcFrY6yg4Rsgp9kmoAQ=;
        b=V4Wt7X+UUru3t7aIgvJINNC2FWQIz8C3ttKro3uwZgn+fA32mtdEo3Ykzr8zDbohn4
         Pi6FqKhLnmW8fyGW2ryVfcrS/OEPq0e34gNs8s1bd1yPRKYvw900KEGV07YIRrjeVDZs
         9vaEcq9T/wauu85Q7d/APUJ/jWVhFCD44atRfk34zI0G/UZxOdq6LY8P62DWzwlnfEgx
         QAci5jing1O33igY8xeejB37XPw64G/nKSnyNsjx8AR2BW5YQ9dac+m2gxmHOHdWDtbT
         qBmxVLDYzLixQIUWCFwWa54WkKRzZ5JlRljeMrDiFKqIAKqsPMfqlxc7d31iPe7QptDt
         uiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWhMXxMo+1QugDLzLJuQK9NGO4k9wmyR+UEJlegys6cbLuFmfHWGMUUu1naWcGer0GfueN+0fxU5ApSgSWqVHNAbHLpMKFirS0PVFC7A==
X-Gm-Message-State: AOJu0Yy0qRUfyq47LhHOKCw+4JJ3eH8FUUknPuNfRBX8tkT34ngHZSJB
	VfDZgBC3fB2T+9jO42Pm+sEFpm9tr/FsKrw4uPeMrZhoSeL6Y9QR2+HJ/YmSLsg=
X-Google-Smtp-Source: AGHT+IELOSsF1rgKjRha5ckjNRdafXsWAIxx9DRlMPjsOekcKMHphs3bL5kmZxENhMXZN90ppLOydA==
X-Received: by 2002:a2e:8e8f:0:b0:2ee:d5c3:3217 with SMTP id 38308e7fff4ca-2eefd153332mr9815001fa.47.1721211210870;
        Wed, 17 Jul 2024 03:13:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee17b1ccdsm14243311fa.54.2024.07.17.03.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:13:30 -0700 (PDT)
Date: Wed, 17 Jul 2024 13:13:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: vkoul@kernel.org, konrad.dybcio@linaro.org, gustavoars@kernel.org, 
	u.kleine-koenig@pengutronix.de, kees@kernel.org, caleb.connolly@linaro.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Handle the return value of
 bam_dma_resume
Message-ID: <nyt7tngjlglaksweiwgj3bfr4b2kbvbeejv32yrk6qv7rexlpw@fgl7v2iet3jh>
References: <20240717073553.1821677-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717073553.1821677-1-nichen@iscas.ac.cn>

On Wed, Jul 17, 2024 at 03:35:53PM GMT, Chen Ni wrote:
> As pm_runtime_force_resume() can return error numbers, it should be
> better to check the return value and deal with the exception.
> 
> Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/dma/qcom/bam_dma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 5e7d332731e0..d2f5a77dfade 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1460,9 +1460,7 @@ static int __maybe_unused bam_dma_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_force_resume(dev);
> -
> -	return 0;
> +	return pm_runtime_force_resume(dev);

Which function will unroll the earlier clk_prepare() if we return an
error here?

>  }
>  
>  static const struct dev_pm_ops bam_dma_pm_ops = {
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

