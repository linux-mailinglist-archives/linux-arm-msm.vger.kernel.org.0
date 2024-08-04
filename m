Return-Path: <linux-arm-msm+bounces-27869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930E9470A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 23:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D921C20B55
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 21:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B1F768EC;
	Sun,  4 Aug 2024 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qAhuHv13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B67A1B28A
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Aug 2024 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722806524; cv=none; b=RTBXZcxruy5K5wS6jwrLr/02gqLVa2+EpPrL6yG8z9kO6I5PHpqKDIGuPyqTdYotfJwjpR2vvYruphV1nqQe974X2vaocW2jFmaRmrKoqisDHbPYtM6AEwtJb7n9e/3/80Azz3LbhZ3rMcFQAX17A/5IysU9j5yBOsgCfxlEc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722806524; c=relaxed/simple;
	bh=8T0BYdA9Kxi+oVjS9OAReH15eAFcU+2zMrtmp+uLA5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRkTBOPm6jOp+Sgh2IgoIuZD+7sigvIVss9ad1jYjVHZ0YFpk1zBL7SDMDiaSt71ABkhcnaNHd3ZFjKR++lD/CwbIQ8hqJNhJFiN4AniX15f1dkE4FjuTtU8zPNv4pkGD1vpbPVtxB83KHZMJia4INtHQmAZpw+5A97x85BD/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qAhuHv13; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530ad984f2dso509058e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Aug 2024 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722806520; x=1723411320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mqnu+yNGhehLSrkuhy5GkzzL6TnfVoi9+bUerYPLnpU=;
        b=qAhuHv13A1xGhNkRwoNZ2VVcAQtz8ckrjrzy5xSIqCLDUN34jHEYfNeejWZ5me84jq
         y+intyNFIUbXX5hNJ1dlcnz4QlHAijoIflerWtwyZEJS3bMWPqUXssV3ynWuox6Jl4J+
         2yZ6BOg2ZZHyplAJgZV0TgsVJAKMeLYBb8nqg49K6yq3/8P/ia6iktCHcd9OAGtJhXdb
         1W1zEJ0QQtGMUflc+EhyH3+wE4K5CWIcNq4CHmiQbh83ADSVhz/nETxfaSTUSyA7BJ/l
         8VyRdgXsQ+yo/bj8sH2h2Fn3A/dYXlPYNEVrrdinyULPnTscu2WQ0eRl0iuGoVJlnmu6
         q0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722806520; x=1723411320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqnu+yNGhehLSrkuhy5GkzzL6TnfVoi9+bUerYPLnpU=;
        b=cZq+lJXl2c+TuxBGRpP8R8ZHMkJgHjEH0NxgJImQih/8vlEmS61i/VW52rDkXkvlJh
         sdXLmNMSeVXeGrRytfsEDHqRejbhUEZp/DR9o92sPq7bywN5JaO3v4rKPtNUpYDqJiQi
         IwqwKrbMeXZdZNXw+5hVFJOj1ivSEywLzNEneZ1Vgq+pco885PC/aUQgNgdoRDnQnJiq
         vmnbPsMlYda+eWlnPIsc6PN3zRpD/F8RRQZebTGuC6FfyqJzrCgSKgAzxkSL0tM9mvrN
         YkR29q4xJSzWNvdYULQH3bzYNW6D+n+ac2TDY4Z3Lvej9l/AfyaFeFechq9t289zijL7
         4M4g==
X-Gm-Message-State: AOJu0Yz9QPv1REmZ+t8bwyDt4gZiiiZpwWbWiwG0rjmSfodm/LZNydPD
	98ZgmRNAylDQSegDaazHAE0wslj6p8VZrLMawV/oQUvSBv9NUEQvW/r/uKAtOYFe6wWi4V0DMvO
	z
X-Google-Smtp-Source: AGHT+IFmcMxMi0C7iCoG5ilO8+VdI9K5JR+E9gBGMc1h7WBJ6E8D38KzACtDsWOqM/stVtF8l3U3Fw==
X-Received: by 2002:a05:6512:3ca4:b0:52f:c22f:32a4 with SMTP id 2adb3069b0e04-530bb3b52f4mr3588082e87.6.1722806520253;
        Sun, 04 Aug 2024 14:22:00 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba2a027sm896204e87.131.2024.08.04.14.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 14:21:59 -0700 (PDT)
Message-ID: <a12d2ec6-07b1-4577-8bed-981024c5cc9c@linaro.org>
Date: Mon, 5 Aug 2024 00:21:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] i2c: qcom-geni: Add missing clk_disable_unprepare
 in geni_i2c_runti
To: Gaosheng Cui <cuigaosheng1@huawei.com>, andi.shyti@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240803061041.283940-1-cuigaosheng1@huawei.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240803061041.283940-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/24 09:10, Gaosheng Cui wrote:
> Add the missing clk_disable_unprepare() before return in
> geni_i2c_runti().

The function name above is scrambled, it should be geni_i2c_runtime_resume().

> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0a8b95ce35f7..78f43648e9f3 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -990,8 +990,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>   		return ret;
>   
>   	ret = geni_se_resources_on(&gi2c->se);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(gi2c->core_clk);
>   		return ret;
> +	}
>   
>   	enable_irq(gi2c->irq);
>   	gi2c->suspended = 0;

The fix is correct, thank you.

FWIW there is another missed call of geni_icc_disable(&gi2c->se) on the error paths.

Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

