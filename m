Return-Path: <linux-arm-msm+bounces-21089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F28D49F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3359C1F2272E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718BC15B142;
	Thu, 30 May 2024 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="msmmZocF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7486F2F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717066831; cv=none; b=SrYCeHiho/Vq8fN7Wdemp7KPsFegIgmg2oyIYGYyHK/O4N4w7rcTI5AEJRild8FiSKzbMsusGsFjw/YeFj2sfxMKB6HqmnRkiidyK4EwCtDNOYEhBUpcfOlBEb7knYhVBX2zcfy6YXg2gnvtbqxNCSMlpoKI1DnmhiCZ45me4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717066831; c=relaxed/simple;
	bh=rEI9DBa1j4BnVdoajTpb+tL8h1oh0Y6i4rM4cqp3UDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6a0/nTx6GDkSIISzSsfJJkmd6Le8TmtRj/b6G2eggF2qK4x8XZaeUuTwFf8FrvNlddtlSGAfkDplkbfvsymgnKuzMG5DbZfalzFI5HUjNkX6a/VyNpqusADVELmLgkkUXqxgif9McH/CR42mAoQpq74WW9+4yHYOmJjhV7r/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=msmmZocF; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso8705401fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717066828; x=1717671628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLmMfTZOf1ncPAiMphJf/hzLTXpE5zXvNOVM9cB3vug=;
        b=msmmZocFtCm4QUEwY3pq9rrdLwHWZ/lOvoPZEpTGW+7BXtH66JjgRl6BtmNO/7sqQv
         nboy/tYqLqoWELVsz9YVLXfoPQf+RQGssuUF+dWMmRXCet1VbAjC3cE94FMFQrZGM0Wt
         MQUXP04AKwYt9kOh+OyKYWOmmZrknujCP8P3DAiez2qdCpOnwei1RY3VLGcO2Y0OTqNw
         WnKdI12qVQ+TlKGcS6vHw8/1V3XPGjrpa777HvmDZ4haZjsi78FT2NoibW+nweork3UZ
         4Dfql/azY+F7D2RzjU5ogp7FfXVhjpa35rjet7hAh3ZKrxtLh7NB0vWGwbOu6o42yf5W
         5qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717066828; x=1717671628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLmMfTZOf1ncPAiMphJf/hzLTXpE5zXvNOVM9cB3vug=;
        b=Ry/i8a6tovdm/98ROLlT/AMJhbAc9DqZi5E82MKfQk0Du93RB5MQMlbmb3L/PNmOby
         l8lq45ogOktaL0tIJUXm7J/nYAMx/K7PWn+HWfnuygc21yd4XFisaxbcyDOUXetrCjb9
         b5XOSFk13j2V2bNYa/W5RYcEwHUyinhizdQ6eWDUlP8SnjbdigyBqTVVaNF+T8DAxwzS
         91f9gtRls30WQt+enVbFhljjDDp+Z0n7SptdNyViW8LUKfkPeSeMSOd/Qcnhl8WvWp4t
         p7NihxHLrrd+FDCJNhw+2p05wVEHgtYu2K90FNPC6cRckUPn0RADqViCnJtAIYRR6ry5
         fcpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC2bDz94tKDOSOgrULlI0DR2S5bJlWRvR3iknJhcq4SG1KRWZB4KEsDZ5jwVMQjsJ4A6rBvzJC/FLKXfMBSi2udKnisPTRtzoSxxAXZQ==
X-Gm-Message-State: AOJu0Yyzv6e0Gd49ge0HPXO5W8kkRiKgZRtWSMPvA7CLzeluqbiqXikL
	Xza5LKPvRTSgftOFIkWSJfzNiadwz/7Vs+lOUKettzCPI4GpZil0PqOaW7jo4mg=
X-Google-Smtp-Source: AGHT+IEQgmHnz5CqUIVafRMF5L11GfhlU9KNug91AV4hAUh1JmfKZgmX1wOk45hkWxayLZUnKC3/xA==
X-Received: by 2002:a2e:9e44:0:b0:2df:907e:6de3 with SMTP id 38308e7fff4ca-2ea848844d3mr9698541fa.35.1717066827745;
        Thu, 30 May 2024 04:00:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea803cc73asm3191881fa.8.2024.05.30.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:00:27 -0700 (PDT)
Date: Thu, 30 May 2024 14:00:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v3 3/9] misc: fastrpc: Fix memory corruption in DSP
 capabilities
Message-ID: <o5zjxqgt4z3uypa3ucoark7auiik7k7jvzpnrnn3psnwvhc2tw@jpvgzga7ruod>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-4-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530102032.27179-4-quic_ekangupt@quicinc.com>

On Thu, May 30, 2024 at 03:50:21PM +0530, Ekansh Gupta wrote:
> DSP capabilities request is sending bad size to utilities skel
> call which is resulting in memory corruption. Pass proper size
> to avoid the corruption.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>

Should be squashed to the previous commit.

> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 61389795f498..3e1ab58038ed 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1695,6 +1695,7 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  
>  	/* Capability filled in userspace */
>  	dsp_attr_buf[0] = 0;
> +	dsp_attr_buf_len -= 1;
>  
>  	args[0].ptr = (u64)(uintptr_t)&dsp_attr_buf_len;
>  	args[0].length = sizeof(dsp_attr_buf_len);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

