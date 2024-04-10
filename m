Return-Path: <linux-arm-msm+bounces-17070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A289FC2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739D41F2491C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4173176FAF;
	Wed, 10 Apr 2024 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i7TC513M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151FE175556
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712764557; cv=none; b=uPpdpYSupWarRHcIb67sItVog1mkvJrfXrzxn67/n2tdsaRMCbMTWDrbDAWlm+OZQ/EQpzA1WEOvtaGYW0t1nTOrxtEo4M+16RznUqq4Am2WhdfbQBhy37HaRmt12Q3bpq/wbXn9ktV4cw1fbYyIw1wJbRXBJrRw8hKpgGooneQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712764557; c=relaxed/simple;
	bh=PG5sFp0A4g6NIomxLWHs95V4FEpSYSwegOg8mPFCvUE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=efWznsD5xANmJCfCpkLwAdT2EBSs85JbXdCV3ng8dS2dL/qpe0t1arc2cTTJvqnCNoIQpPZCQgoeCqtnfpA4EteY9Q+tzpYWI7FQH3TaDzLKmV3f6koK23w5k0f+ASdZosC8i++tfz3BnPguoKAGtAJmYt7C8cZCTy8JFhRc8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i7TC513M; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-417c5aa361cso1888355e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712764554; x=1713369354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y95uWlPjr3MmH9j9cyBlMM8xwJEau1Gnn9pV4tIaP0=;
        b=i7TC513MqfoKhLv9OmDCVuFuZBXtQYwgyR8lsdxqUwCOE03/zzjDE2g08S9lxF892x
         GctlRp1YNUIwXhowp1vn/E3Uw1T+OXKQL58X1I19Assp0essj+j9fc4qN5sHTTrcYRfa
         gJnzpyqZFUzFH/q0E+IWwJf90zTCEeT2tK7IZwO+gb/zI0QX7OvNzfQK+X+d5cLH074h
         eA/37mKHvFbpOeqfCNdKcxJo8YDCv38noSyi53FQ9+CY/tMaFvafcotnLgqGzfCBW4C4
         l2LcOkJ7DAl09e5O6jxS9NpRxQE/N69e6I6471bd8KmDYtG2b0GN+9cKqPvgkGqQdVeg
         +/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764554; x=1713369354;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Y95uWlPjr3MmH9j9cyBlMM8xwJEau1Gnn9pV4tIaP0=;
        b=YjOlCPoxMWoTxP/xx2FdCqhg5RK/Q/tYxaiftvQzrxbpo5OUWMXcWRFAh/AvSWfZST
         GDQ95tndmxC3dzsZ/CvfZi5m04v1fLjtXPcv+xYWVz/hBv9wEeej3w0fQviFh8N5wg9k
         BxSYy5XOyBK5KwKu6ktuwwaIZfnNRu4LOY844ndgNUSGNA4j9q+MLNHQo+rr3LBhpJlR
         fB3fOrgQ/MJwAU1Iwe8w0wGIhh9nrqWCHIbs7dO/UbTIv/BX3w1qnNU5rrWbXFj047eE
         UC6deYCmPyG+0bU4r1wjuXgZ263KJ4v1A/ZpguThkstP4S4WACfG8K/0rMZYmfKTqneN
         +qhA==
X-Forwarded-Encrypted: i=1; AJvYcCV6OU3f7k108D3r0igRaA1EPdRbrmcICdAtfS7l42D7wsf7Vij4IMkndsSoQgVO11qha9Vuz4ncCRw2qzFbVmS4zeO8WlHkCgUPBifQrQ==
X-Gm-Message-State: AOJu0YyeXF0+7F+tQb7nC57q8bVdhd7G9YX3qbJTaDVbNw2MQxzEugMc
	i8Ho0M4/FJHwCidswKP13Fv9AfoqBM9fYrQgPOhzMhAQh+5xRRGqZ4ZpwAxcvh4=
X-Google-Smtp-Source: AGHT+IHW6x6HUMvGoC6y0vrk8e/XA0YiesateG2RI9Bg2DRVnfVvm+OFOxbdSrej5+vqjr7YqetnSA==
X-Received: by 2002:a05:600c:3504:b0:416:bc6d:e8bb with SMTP id h4-20020a05600c350400b00416bc6de8bbmr2231879wmq.0.1712764553849;
        Wed, 10 Apr 2024 08:55:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id je7-20020a05600c1f8700b00416a43d60e6sm2625547wmb.39.2024.04.10.08.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:55:53 -0700 (PDT)
Message-ID: <0a93713a-efd4-4b9a-b9e0-50631cb69e2d@linaro.org>
Date: Wed, 10 Apr 2024 17:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410155356.224098-1-krzk@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240410155356.224098-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 17:53, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/clk/qcom/gcc-msm8917.c | 1 +
>   drivers/clk/qcom/gcc-msm8953.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
> index f2dd132e2fb1..f2b8729e4198 100644
> --- a/drivers/clk/qcom/gcc-msm8917.c
> +++ b/drivers/clk/qcom/gcc-msm8917.c
> @@ -3278,6 +3278,7 @@ static const struct of_device_id gcc_msm8917_match_table[] = {
>   	{ .compatible = "qcom,gcc-qm215", .data = &gcc_qm215_desc },
>   	{},
>   };
> +MODULE_DEVICE_TABLE(of, gcc_msm8917_match_table);
>   
>   static struct platform_driver gcc_msm8917_driver = {
>   	.probe = gcc_msm8917_probe,
> diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> index 68359534ff25..7563bff58118 100644
> --- a/drivers/clk/qcom/gcc-msm8953.c
> +++ b/drivers/clk/qcom/gcc-msm8953.c
> @@ -4227,6 +4227,7 @@ static const struct of_device_id gcc_msm8953_match_table[] = {
>   	{ .compatible = "qcom,gcc-msm8953" },
>   	{},
>   };
> +MODULE_DEVICE_TABLE(of, gcc_msm8953_match_table);
>   
>   static struct platform_driver gcc_msm8953_driver = {
>   	.probe = gcc_msm8953_probe,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

