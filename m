Return-Path: <linux-arm-msm+bounces-57212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7DAAF3E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C034C7F37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 06:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EF121A45A;
	Thu,  8 May 2025 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkVsDYMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A932192F1
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686434; cv=none; b=F75rDMxK+U34CvyxR9yOz2jd+JvUd02hyNnOlCitZQ8P4w+axbniZGaaUAT/Kx+nhDoZMU56lS7XHWHP9Fp8Q5eba9g92RGXrbYSBLsHnnUXPyOBhXABiV5+NJK5yFvBu6qaOj7f3Ioa7qRRrIiidhCvQLqVmvsrmvD6/cg5a3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686434; c=relaxed/simple;
	bh=mo7aBOYxy2laS+VfZHPupXplp+OJ0XZ0QwmwUj+Cx7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9B7K2sZV2/7Ed1DcazW7O9GdYG1lTGVhmI4QBh7z4Fo5chC1Upy2A9ZSGLqe0yzTpH8Zb5YblkHI4dTjWKhU4iSN3NMVmthPq5FBV4LzizOjm6LNMEnbZ7ceynwy8Zx0uzFDrMRjaSxDQ7sL8+xKX1i+dZ63eTIZyuPaNiq+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkVsDYMz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso5565885e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 23:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746686429; x=1747291229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0BYhiXUdA6i9dCcFIqo30mmGVKS8d1Kjub/7fShZA0=;
        b=CkVsDYMzDpzRHRO6FcVVzzHLgRGY4XxjKvk3TqtyBCrBQQMfFO0SleHFkpRLJZPB89
         terLxyDUCkNb/9OW1fmRTLcNTGnDwWS3OB/mCPUR28HD8+j8WA3IeQQEyItIgOK/gnUR
         88VcAsrNKud4mY4WMJ87NrUHoiBzwFP8LGA7qag3DYb+QG4dAQGjwIgH22k445UE2fDv
         tsNpQhiTladg92zjGW2oS90vcZ5JzZG2nfHeWwj15lJgXJjks1lTSPL7j+EnmNFIAVV/
         1RXk5sRaPtimqAnJjb/VnHsH5PQnsJuAS731kwCsv9xO8SYMHqfKvQh/TeX0LOa/RyNX
         7Ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686429; x=1747291229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0BYhiXUdA6i9dCcFIqo30mmGVKS8d1Kjub/7fShZA0=;
        b=nBqDfRO+s8FtuWF0TlCSrq+GqX3tGg8lMwDhqX+7OCOUBCc4nvQpv4XNe8d8D58WmV
         dYJiH5QW+S8DdgUYHD4AkGZE7VzX5GOaFdFX22Kr94hK/KDgyHPyAe1RQCWAalpN7KVM
         TYmtrnMk13hAGVQZrPsbRh9635qgkkVTXlzYBJ8Eonb0ApR4yRDRhgdQtKAMiLkB9yBN
         sscURz1qgmE5Z/phjIGKMdAjxroUpDznrBZZe6AkvDEQHlZ9jqNogt1Mcw3qoW+jhEX1
         CGfgyF81vDqAIlYrzyZbxb2l2p1qZCPrQj4Ch7/IHxbzL5wG9+v0cdg0ObVMk+RQpb3O
         3wsw==
X-Forwarded-Encrypted: i=1; AJvYcCU7AKcxty9GpRp6D45TpUQTilDFKmui3qD5WMm6tBvGtZq20zi6g7npAXzaPOh5NUR8Y3FNhvqocv4EEyfk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QO5WVuWFvVekNlpSeYe/IQGZyx+utRc+Klbpk+8mpkm/mhDw
	gWjvuyFbm8bjPF8umlRfEu+ed5FMhCR19aoyeGk0ZBfB3azTHt60HCu06IQPDaQ=
X-Gm-Gg: ASbGnctpLSiX300jnfANxLdeJBEPfsmBET0gGOOBK52eZADIGZKwzwyHRgyJqJFC0ep
	I6QOmsMmT5ntG3+AxXUhMHSqdcipa9VJtpXgVqhC4ttw10m4XUz0BkZCg6MKelMt5roHgd0n1xq
	a3lLp2XWlkrzgLiRqENysTxecsyTAo3m7kCoBBRbIAJt0+2eCGwcBDk8TdoQen+pdHzSwQPHTB7
	SgdlK4oqaiUJSF5OS/F06YIFxcGjInWhDtD6BrLYqpPP82iaQDsQVB0Br0Zs+zBuRMzjIvmg1P9
	G8z/sFm6xHYrYTMHBfFtsVVITV6IOi4Ja7tYKAzBsa+lpK5r7rwptAgT
X-Google-Smtp-Source: AGHT+IFZRIfE5PxRRbMe4B54cwayzKdn3VEZhgxzfmBDRkxcWCbiRLfEqYjfrSNjGm+C2f+T0IBaxg==
X-Received: by 2002:a05:600c:628d:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-441d44e3359mr67512805e9.30.1746686429396;
        Wed, 07 May 2025 23:40:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd35f40asm25158595e9.27.2025.05.07.23.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:40:28 -0700 (PDT)
Date: Thu, 8 May 2025 09:40:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxR2nnW1GZ7dN__@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

Hi Greg,

I'm sorry I forgot to add the:

Cc: stable@vger.kernel.org

to this patch.  Could we backport it to stable, please?

regards,
dan carpenter

On Wed, Apr 23, 2025 at 08:22:05PM +0300, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?
> 
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>  	__le32 hdr[5] = { cpu_to_le32(len), };
>  	int tlen = sizeof(hdr) + len;
>  	unsigned long flags;
> -	int ret;
> +	int ret = 0;
>  
>  	/* Word aligned channels only accept word size aligned data */
>  	if (channel->info_word && len % 4)
> -- 
> 2.47.2

