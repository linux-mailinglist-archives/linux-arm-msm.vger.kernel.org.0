Return-Path: <linux-arm-msm+bounces-11860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DBB85BE33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 15:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC7D51C215F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 14:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177736A8B3;
	Tue, 20 Feb 2024 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvmjUdRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4EA6BFA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708438082; cv=none; b=ceLcPhY1Re/yWR2nfGYTPG1yOhe+NbAH9BJ06MqWIxAz/XKjadyDbinlqSpAXSaN24puY6Y0IjAo7wOIHMvyOsfCw+8yXzSBusj+0N5zljpPM5Z7e1XE9DFR8DMXY52ZMXyJRnVpGPtV8kTiZbrNElHHv0+IXs8HjvzgTZBIsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708438082; c=relaxed/simple;
	bh=5oaeW/V0LDGVm1ZQQ73YcEjzNaiTcy6WpefpawYWA1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMLfLmf+l5FUvcMy0F9ipmIrlKYuRnDjuZ/6S6KyrhpWnLj5C6ypgEr+0ljvDR+MGDucDOhuBPufneieujVt770y9wYk1Gz3hEYCpnn7SWk9gSG6TdHtVK84mGbAwvcwjohh89ZJZTmPtXQ6NpwC2fyQrrU6JKdE7CcJglzrmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvmjUdRt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so669370466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 06:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708438078; x=1709042878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DSMyX8FZ9wn9s6dszFNVxl4SdqcyAmoAGLVwPyba9iE=;
        b=yvmjUdRtTnIQVUXJRArmx3rrtQq/wwJ8+icFWUDPfCBBS4mjNo9peX5jijDZW4MdIP
         xXwdWk4+/zs4XvDxt2wu7ELzHHKs/F4KJkQSFP85C+i52SENCQG1rWIskORac1NCh8qZ
         t4TbYncFQDoE+snQkIJWZanNzpVPo2gctuzxngvMzz/VstSZsVsNs857YV9rI3AnXbsx
         TD1EoHGX2BfpkBHsrx1ubE1h04XmTc4jkwreR7Qeg+k4lbHRYeA8j3Pkb6gj3KRaYGpv
         NjQZoOKO7gSqsF/GOtQyosCl1QpyToQY21VgQIM2nSSSVsN622tVMibCaJJ3VXJqf82m
         7neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708438078; x=1709042878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSMyX8FZ9wn9s6dszFNVxl4SdqcyAmoAGLVwPyba9iE=;
        b=t8E4pBRlvu3yh7iyW1h0RATPz6MjP5a0WWMwbliFG9bfL6IbMUvCfozRK7X/U71ZDS
         VGifFFvzBz6iZEyYLHb82YUhVWKtl8vZHZyJCMm3H2YNS58ERI4zue+AArkHnan7Seec
         T9qqalt5hGNWUojWW9Kc0ZHqu9jfGJCkH7PJe32VqUNgMP72jV5DHklo764+sEtVhUXa
         /OfZmz1l7u5ts7eCJYZUu25wJ/N5W2Prqs2qJ/UXnlAtxxSOZI8Cg76/Mwd7WhgVT+OV
         L85bsh75TEV7YCt52Mumh0opKLwuwB4TfBwg+HIdA5529oQ3ldzC/bl4m1rU/C/PdbL4
         GOdg==
X-Forwarded-Encrypted: i=1; AJvYcCVNXj3771ZFuu0PaOyVW/+oxHxy2wlJKn6vO+R3QsLCfQCoXH/uX5PxNaiysSZG5KRt3u4+DU4w26J83owLxblOWfpmzHyifcfxXWaaaw==
X-Gm-Message-State: AOJu0Yz5PghfpsENB0r8t657iWP+A2hzVDRX86W/WweRTIDJM4ymGnBj
	W4yk8J5bi+z0Y20Hqgxdqx5RYpmdDUixC1hD4C8mn/P5wi6bGIxM1uhnoh07ePg=
X-Google-Smtp-Source: AGHT+IH7KpLxnQBbQwJdCvCCTzsuWiXSt3e1ClIEjTyKYfW88fPzUAcb5CjerS4ur6N409QduSLclw==
X-Received: by 2002:a17:906:48cc:b0:a3e:6501:339d with SMTP id d12-20020a17090648cc00b00a3e6501339dmr4686923ejt.61.1708438078395;
        Tue, 20 Feb 2024 06:07:58 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3d559c6113sm3974635ejc.204.2024.02.20.06.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 06:07:58 -0800 (PST)
Message-ID: <738dcf0e-57fe-4123-af83-be91d8166420@linaro.org>
Date: Tue, 20 Feb 2024 15:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] backlight: lm3630a: Initialize backlight_properties
 on init
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 00:11, Luca Weiss wrote:
> The backlight_properties struct should be initialized to zero before
> using, otherwise there will be some random values in the struct.
> 
> Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index a3412c936ca2..8e275275b808 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -343,6 +343,7 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
>  	struct backlight_properties props;
>  	const char *label;
>  
> +	memset(&props, 0, sizeof(struct backlight_properties));

You can zero-initialize it instead

Konrad

