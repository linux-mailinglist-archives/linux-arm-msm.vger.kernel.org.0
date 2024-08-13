Return-Path: <linux-arm-msm+bounces-28423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F476950D76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 22:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F165B2222E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A150D1A2C14;
	Tue, 13 Aug 2024 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEbU9YwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985EA953
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579312; cv=none; b=k3RsnTuqaw3ZoAPJWW1x4fitW1kG/t7UARy8GL6wHHt4rhKdXEw9D38vHhffVNn3Eng87YHk877iqYCxSqkSrrA4hm0plgU+tlgz+BiTc1DOOQz2/wys2vzIKKnkXnIgsClBAjmWBuRd/59JBKDf7Bb6Epprijv5w8QGcfdk2XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579312; c=relaxed/simple;
	bh=S4mnivLfaC6CBnZ9vA9MBqgg+x+E3rHUM2iJioJ/fN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+Or18WjVYOqmu37xV28Tztu29Nx3sLkiYfYMk6IdY3bdGY404xjW2uyItGBA/gSxUAxS9+BOOc9c8li6pDrc9PBy6tv/Ipe0Xt6NFnV6DRhgNk+nBSQH86HifaaaJ+oc55Vfr5Op0orTuASUomGCACwEufWPy0+Z/bgrwfxH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEbU9YwA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530ad984f2dso576597e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723579309; x=1724184109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05yxfIPzb+vpmSjZ9OYifCLd7i3CDlpKM0BKHiz5UCQ=;
        b=hEbU9YwAuUKEftUXuV5Hih/D4iujHrKgJD7aCOnvUZVpV+M1VNa1uI/kLLCb+8eqcs
         RGfSExHXxDzFpu+wrLtZqJpDN5TAyF5nTJ73wRAeX8ioBL3b2c1DeozK2pbdtHs9oV/Y
         HcO7zUp+POE/9/xJQznPmMSVoQ1XTsSQDzF+71B2lFUu+/b2tjdVRUBSiwpz8IA8QWxo
         nckSm2rpk3DMxCsW9hrzZWghB2RYdVlfvdb+ZAEF8sPPkX8XlyI+ktMxtsfGejxaObNq
         z+yjn5u5JfOjYgLxD9d9xEOLr54mUJpTFwKLmDkVqcrOcSiHDgiewsBJr3xh2PVfh9M5
         tgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723579309; x=1724184109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05yxfIPzb+vpmSjZ9OYifCLd7i3CDlpKM0BKHiz5UCQ=;
        b=MgS0dyvby+4KOznbEif5Ktm9Al+BzdBmkD2bsTF9qT4NyxkLzGMPfdYh9MvRjQSJOa
         MrH08EEz4fPj3u7qhCYaMuwLw711CjtHfR5cttqFdsAznozKMoCKWAokPn70rm3OsNUt
         OX1jeuoADRSyWtQ+ZrQOFrfWjmyRwg48zuMgs3XaYDqaaWC4EcAmeREx60l6oAPpe5f5
         RUPf5I38sebaKU+ZqTEeQHUnMAPu2LJNZsNPlkqlF6ZHXfA8sRZlGOxNMgolieN3VueA
         NM9Wu6YYIb2QW+F1+CRUrPvlJMQyMpEP1+qOp9o75GlfM8DcwYCMB58aAoXxAK7L67Q8
         vmfg==
X-Gm-Message-State: AOJu0YwMX16Ec7fHbYCgsYYhAzJ/DEQLeeUBnGWCiGXgAxTZn7r0Ll+M
	M/I+j++QaaRinlMyic4ATUBm7qAqAuP6qV1nX4OQgiN60DO0jX5f7rauCHoNKOo=
X-Google-Smtp-Source: AGHT+IEy2HUeh4eHrPS74gTyv0LL8fkr5nwO3fJw8lDbNGJBQEugQTA2bj4xmGTeJyDShLmEXgiiAw==
X-Received: by 2002:a05:6512:3c84:b0:52c:ce28:82bf with SMTP id 2adb3069b0e04-532edbb2d5amr162410e87.5.1723579308586;
        Tue, 13 Aug 2024 13:01:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f4220asm1053557e87.261.2024.08.13.13.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 13:01:48 -0700 (PDT)
Message-ID: <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
Date: Tue, 13 Aug 2024 23:01:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240813094035.974317-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> operator since comparisons are faster than divisions.
> 
> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")

Apparently the change is not a fix, therefore I believe the Fixes tag
shall be removed.

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 2f620ccb41cb..fd8a82bb3690 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
>   	remainder = do_div(quotient, prate);
>   	*l = quotient;

Since it's not a fix, but a simplification, you may wish to remove
an unnecessary 'quotient' local variable:

remainder = do_div(rate, prate);

>   
> -	if ((remainder * 2) / prate)
> +	if ((remainder * 2) >= prate)
>   		*l = *l + 1;

*l = rate + (u32)(remainder * 2 >= prate);

I hope the assignment above is quite clear...

>   }
>   

With the review comments above implemented, feel free to add to v2

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

