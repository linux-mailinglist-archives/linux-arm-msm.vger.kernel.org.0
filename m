Return-Path: <linux-arm-msm+bounces-24426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98291A4C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 589C6B207D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C896146D7F;
	Thu, 27 Jun 2024 11:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgMfmJ2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DCB13BACC
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486837; cv=none; b=Ropzvd6K97U3bGSBCQfykuNVGy6XKijCV9QuCKfcp83VkvKBIe0BZcwFUfA3zLQJAf94c1XoF+9aoL2WKjGDoMmswiDfd2qnprZxzEJLqgxRXrbPGI+fCz7kRj8d7RzI6pXbBpbLHh4Dnh9Rm+Qw6eQUzLe60prT1bzf3mXjJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486837; c=relaxed/simple;
	bh=5sFBwc0DRlqfmuA3e4F8SEnbpYW/9mA68h42r8rQVuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpa3VKLDFy82ZTBhdZugxEMBY62qwnvFhyojTMk1BOfbjP3nUARfXLz7Omp/cHKfHKXzzNY6X6krSvMCAkjGwBcRMuF2ZjSHyWINDARjzzwMKKwNLnRkxOjKTOF70YHwPBi6r/czyDuIKPv4VHomCtdOmoMYzXHiVo3WACjz5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgMfmJ2K; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ce01403f6so5137928e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719486834; x=1720091634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tdkhxg4V+EaWFRe9R6fxXILIl8Q+Rdop2i8/UoriEyI=;
        b=lgMfmJ2Kx8bcR2ZC62NIydjo0Ucgkz+wDnwDtF+dxX/Tcd5YLrP5963MIxezSgZsGO
         wTP80uFHKqY+V/k2qOIfdoe7Q9OzV3HKJcq4Gxd1yJgyXGK4gh6U4tfMKoTH9LsTfcYa
         1kzfzo4RiI5jWmMYK30+6sMedphju4R45tX36jJYh0jmcfxW1JStc8pY1iEg74sEnjcz
         tnWKej0A0BwUDMtYof7g5rFiJHNJXIne7Kmlmm92UyDk4VyePTcsjw/XXSQhORVQME6R
         RqneEIWfckKbhwMUgE5+hWjowZh3S6BDtffLCdS6h7QRs3maNbrK3D2yZwhhmYejNgRR
         eSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486834; x=1720091634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdkhxg4V+EaWFRe9R6fxXILIl8Q+Rdop2i8/UoriEyI=;
        b=iBE1Pn01EOBKPx6Y12ickdTeqMWpDMtcOIxkKnkuhhBxxXhFzbz90bXeRGgey3MuZQ
         MpVkkoizI9HxYAmB2fWoUfyiFQxBlHUMCd6hcrAbNEN6LgewH9DCG+dfsvZIyetqNCZk
         DAhq+vmLDa8HOqZcxnnvMlqnmV7YrYPpopXglWD+2cXpqv0Dj2tH8Ix39ZGGmh/VzTqD
         nlf+BbYc86KNYIJZ1wYc0/3/N7gInBUqnj2Cf215ZZB6yelJvdDSzYtmyAdSN005HSDm
         Q0sJJRsJ6LVkzJMWNttyvZXS992H29cUhRLt7cw6sVY7kWKI0+/+ZT1kYPAZOTQz6TcV
         YZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQG5adU33ueAOKqoLUN62ly9Al5ih6hUrffhxb+ZDDEuUuATuwuO6ORuoBcjHknw3qpaxcEy6djrsJzuJhkjHxZsKaHc2NqbWLMj2mUw==
X-Gm-Message-State: AOJu0YykZCGyB77gbvcw9tQB+o2MUsMAfDD5mkl5VxeSRKa2rXK//pxo
	GhTiuZJZabURR3Ys1L0PvosP7xuE1LsTfntQIE3PawRiAf8ziUFrCCiaDynwsVA=
X-Google-Smtp-Source: AGHT+IEdwvrlXULMeBgYsXv7E9ICpsRXSh9tY/qkO+ZPVpF3yvrZOGiOZUlYLCfb7JwzlTJu+GuYfw==
X-Received: by 2002:a19:e046:0:b0:52c:e171:ba2 with SMTP id 2adb3069b0e04-52ce1835617mr7505956e87.17.1719486833817;
        Thu, 27 Jun 2024 04:13:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e71305d15sm163090e87.162.2024.06.27.04.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:13:53 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:13:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>

On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is passed
> by user space and is checked against a max size. For unsigned PD
> offloading, more than 2MB size could be passed by user which would
> result in PD initialization failure. Remove the user PD initmem size
> check and allow buffer allocation for user passed size. Any additional
> memory sent to DSP during PD init is used as the PD heap.

Would it allow malicious userspace to allocate big enough buffers and
reduce the amount of memory available to the system? To other DSP
programs?

> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> 
>  drivers/misc/fastrpc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..9d064deeac89 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> -	if (init.filelen > INIT_FILELEN_MAX) {
> -		err = -EINVAL;
> -		goto err;
> -	}
> -
>  	inbuf.pgid = fl->tgid;
>  	inbuf.namelen = strlen(current->comm) + 1;
>  	inbuf.filelen = init.filelen;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

