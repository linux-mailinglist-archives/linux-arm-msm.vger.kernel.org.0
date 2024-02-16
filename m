Return-Path: <linux-arm-msm+bounces-11360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B9857E31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 805C11F27C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 13:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BA312BEBB;
	Fri, 16 Feb 2024 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YxN39ZrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202A12C528
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708091765; cv=none; b=E96kEtVVYDzm/Kpa2tApMyy5F1U1bxK9eBOTAGaIKHXFegYltInhIxGJG5lZDjw4POS/KzZ6528cY5qrdrmckv/xYR2n3cNXJPWIMUcbM1f395ckuBX0i6ZJDl9BlzAMXfwyImmrtOLKBUXEBth6tmD2ozUs+670VqjOgA/CAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708091765; c=relaxed/simple;
	bh=HH+tpzai7oJ2DremXUqDYhyOQtLpOjkgJ3mafJf+8bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TiYaX/iwYaAdliEMacKitY6GB9MQIOQqrEXTK7xdqRJge/BYWez9G+rj4smMORqx2mgXtJ8zM2Mth94AzS/ajL+li805I6+g2zxR7mDzZMu9A4SSAowUA6OYOniK+EaS3vqa10SHP0DE2ulAD0hWcKNYTvmYLeJTMSdCL4owAsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YxN39ZrK; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5128812662eso1085630e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708091762; x=1708696562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sx+N6arR97QWfJcz5eTsFgWwMeNE/57mdj7f2gyCg9E=;
        b=YxN39ZrKVYJkLkG+UBMzxEy14Wvs9gU1m9QtZzEdnpo0IALg/zhW8re/AekqQRz5rk
         hVgZSVCnWgD2mvRlsLe4vg330K3wK0WWXxxMsbaEatNZ8ZrG2IdktC+sukTed+OQTUi1
         yCVmb87TCYf+ajAQSoSowTrOieLRYI3+bunMmIhpDnFhiobI3OQjy5R9YjUfaVnSi5/z
         gUBUXxY5dWHOS3uTfSAwfvgFLZ5GsOGJFVyaR3+DJaR2+JqMd9bms/CagajuH1ezp+F2
         uxAxUKvUDPlCWlxr4Qule42+EeRllCnxnFID6GpSdYC0kxya3FU9Qm52sQFQMG7SF+F4
         WBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091762; x=1708696562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx+N6arR97QWfJcz5eTsFgWwMeNE/57mdj7f2gyCg9E=;
        b=CFA9riaZ6LJ9fbq+r5+GTSgaKWrxm3AVU3T4GE3XvdC3AjTgsXHoBKuoh3GzQDIM0f
         35q24of/pXPjPzCbyjN2CQff2UH3d26vLLr22EH75zzraq8xpX8SZQ+DUown5++SgrSL
         HOU+nVd5GnTv8fV7AL5xgHnPI4Hq8g+O6vKk7n3c6FGGfZR/ZLfgNSao2Q6jWK/q5P7z
         CDeyd8xll4ebOr0mm1FrwyUjGx4mowgDg4pVnBDPaiBN0fhiLfkQqB6XWhT4A5BWdUdF
         s6VYVZ4S6B5odt0607Q9MZtipB6q9rEJ4gtECBg4bjHluFRuin5Io2FgoD+W14tfcKnr
         1eJA==
X-Forwarded-Encrypted: i=1; AJvYcCXVh2QcNDNtT2TCVEWdqYyotWL+fpyAMH5dAHyeaNvqg1doTMSL0uirytFfL23ptmQ3rNUYROmwae/nhg+4C3lLB/2rCbFUrAxRRjJ2tg==
X-Gm-Message-State: AOJu0YzmO4gjghUl0M1HG8g+37a7FkfOe84x/MMNfJRd7woHPznZMnTT
	jOTozcE03B84zPZdnB2iCzqhguOxb34stv0l0BXcu52TyA2jFN6bkQQgIs+W0S0=
X-Google-Smtp-Source: AGHT+IEREGsZFv/c3ANUUBXrwqpzBGK1tnvv9RJ/EJpxn2KABM5uyQq2ul44xSimUFdQVGK0Ic4JyQ==
X-Received: by 2002:ac2:4301:0:b0:511:4c68:f3d0 with SMTP id l1-20020ac24301000000b005114c68f3d0mr3728689lfh.23.1708091761765;
        Fri, 16 Feb 2024 05:56:01 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id u20-20020aa7d894000000b00563a6c9fd71sm1124edq.16.2024.02.16.05.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 05:56:01 -0800 (PST)
Message-ID: <488cc7dc-f45a-4c9e-b572-e4a6b3202e3e@linaro.org>
Date: Fri, 16 Feb 2024 14:55:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: constify of_phandle_args in xlate
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Georgi Djakov <djakov@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20240216135236.129878-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240216135236.129878-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2024 14:52, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c              |  2 +-
>  drivers/interconnect/core.c            |  4 ++--
>  drivers/interconnect/qcom/icc-common.c |  3 ++-
>  drivers/interconnect/qcom/icc-common.h |  3 ++-
>  drivers/interconnect/samsung/exynos.c  |  2 +-
>  drivers/memory/tegra/mc.c              |  2 +-
>  drivers/memory/tegra/tegra124-emc.c    |  2 +-
>  drivers/memory/tegra/tegra124.c        |  2 +-
>  drivers/memory/tegra/tegra186-emc.c    |  2 +-
>  drivers/memory/tegra/tegra20-emc.c     |  2 +-
>  drivers/memory/tegra/tegra20.c         |  2 +-
>  drivers/memory/tegra/tegra30-emc.c     |  2 +-
>  drivers/memory/tegra/tegra30.c         |  2 +-
>  include/linux/interconnect-provider.h  | 11 ++++++-----
>  include/soc/tegra/mc.h                 |  7 ++++---

Ended up being a bit wider than just icc..

Looks sane apart from that

Konrad

