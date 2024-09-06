Return-Path: <linux-arm-msm+bounces-31112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ECD96F481
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 14:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF201C20E83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 12:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6387E1E49B;
	Fri,  6 Sep 2024 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGWH9N5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAE2745B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725626781; cv=none; b=rmKdS2vB9sid5Ok9c45B2QtrwOJNR5kqXHTOVZ6PmgEUouBafwzbNyMnjtp7PnZNOKQiToFcQdcdqrb2u0giNUZJefYTml2guIP04t2nT2+WHqt5qwzOLKu8m983vlZyczBAj803vZ+tAQh/fKp/B8l/uB0Eu5MO/ZHNYgowph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725626781; c=relaxed/simple;
	bh=hC/tGF8cSl4flBiWeSmMpIIt69LufoFugG+Yk1h7n3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFO4runv+1y7HlyOPhtbyavha2LRujOV4UaeHMAlm7wTO1rPAz9OgZo92lIk0EG1WXyxtcy9BvHIuQT7p4obG2sz6us0Lzbm2XNm13mCLYIC6zxvtfMBD7LEFA7/ZqY2pqFwdsIAYdxS5dQAgDkIVISuSarM9AYl10duCydc5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGWH9N5z; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3aced81ebso1948171fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725626777; x=1726231577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIRBLYQ4+mKh3KvEse9INuFPvpdgYruUAOkgTL5XFS0=;
        b=fGWH9N5zfA2Dtwt5RuDLJNA5dsPA1GjBwVyhWIHFKCBb7e0878kF+TWDgefsmrk9V/
         M4KXwBYqDNqKUxn1r5nVmOLnArUe4hxENAoKKI5n7Gj8N6RHLLxq1CRH/W/sjnDDCY3/
         RXRZg7ceFu3UvosIdPJeKz1LAaXy6R05QB3mJ/X/lrqMqbGjo0mOU9joj7nXReBPwiCM
         DG7bzsLtrtmHOVnTJKX3skkDoeJdXT8vZNRaNjClNYdUIoOAEd3okAv+Y+HmErhxbKYG
         7V9RHRKJlH/UnQJyqcAG3hZ6phwTaF7g6ViXAbS619Uv61en5ox+W8RuFzyYIF/xnlSX
         8VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725626777; x=1726231577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIRBLYQ4+mKh3KvEse9INuFPvpdgYruUAOkgTL5XFS0=;
        b=En9rZFmvzn5vwmtOtRt/HlsFy/HAQvjYF4dcsaiKIXP9J+vW9MYvPcjnOXkU6E4Xda
         dfk49jskgK4a0TLS6VLYC6BOJbjj6fDEng7sa64ELnoZ41FVHfC0WJO8TXnX1gZMzORQ
         UmF3nQwu0mYAAbkqNCp5qTAFMhuraedbf5M0zaecF13yV+ZRuUUvyf47/TlItSqTph2K
         ReAzgIMw99bVqUuJjPr26lO/o7JcCON/ZhFEA8Iqh3f4kBwT9NAwb91/qbwg+dlW8LSw
         QaJbmkHxegiJMTDYXhLdxvoRD1k0FYLw7/iA0GHjpXK9sBo4xo3+TCh4KqHFXL3kYIw0
         PD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQvnA70qoMuEe1Ld452QPe6CWUdOdTye7Q0g71YlApJvMwIXBanoD5Cm2U0mJIvFv2emqSb3Oy7YIMNX6o@vger.kernel.org
X-Gm-Message-State: AOJu0YyH/+2zNWXsJfXe9KGyxn0S757y7eTyxHu9bLX5S2qqQAel0mLq
	nboRBYYY7dEOP6HAOUprF3J67PsZ3OkYJG4v3imt4Y8DWZ1jV3lx3fdhNG+44TI=
X-Google-Smtp-Source: AGHT+IH7TcjPOhUnSCOztxx0ezKCT+YBhSK1/HnVI58kj/H9R25mEbT+/4axuFgUNssPy7mS67UILQ==
X-Received: by 2002:a05:651c:541:b0:2ef:27fa:1fc4 with SMTP id 38308e7fff4ca-2f751ea5828mr10045711fa.1.1725626776719;
        Fri, 06 Sep 2024 05:46:16 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171f9dsm30793331fa.97.2024.09.06.05.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 05:46:16 -0700 (PDT)
Message-ID: <3ebb955d-ca25-4bbc-bf55-1b3cf2e20525@linaro.org>
Date: Fri, 6 Sep 2024 15:46:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] clk: qcom: clk-alpha-pll: Simplify the
 zonda_pll_adjust_l_val()
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jon Hunter <jonathanh@nvidia.com>,
 kernel test robot <lkp@intel.com>
References: <20240906113905.641336-1-quic_skakitap@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240906113905.641336-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Satya Priya,

On 9/6/24 14:39, Satya Priya Kakitapalli wrote:
> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> operator to fix below build error and smatch warning.
> 
> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
> 
> smatch warnings:
> drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: replace
> divide condition '(remainder * 2) / prate' with '(remainder * 2) >= prate'
> 
> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

thank you for the updates.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 019713c38f25..f9105443d7db 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2176,10 +2176,8 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
>   
>   	quotient = rate;
>   	remainder = do_div(quotient, prate);
> -	*l = quotient;
>   
> -	if ((remainder * 2) / prate)
> -		*l = *l + 1;
> +	*l = rate + (u32)(remainder * 2 >= prate);
>   }
>   
>   static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

--
Best wishes,
Vladimir

