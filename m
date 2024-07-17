Return-Path: <linux-arm-msm+bounces-26412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ACC933897
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6196A1F22F64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5592D05D;
	Wed, 17 Jul 2024 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bfk5/whl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF79249E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721203783; cv=none; b=rQk5XSRYZ1GbIRZkpP5yugJfRvvsCbQf9/qSaZT7tcTy5rx7F1U4Jtq4/KQ3g3q1pk6pJof0QfAvg14mOdfIssmNuCd8PqdbtT4cBHNAOI7BVjK70GDlkgtecVVCwS1jZGvawNFqLbA7unzVnhBbGu2sUb4YuGwZfBWy2pnNhQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721203783; c=relaxed/simple;
	bh=3lpgL8JX6lclcl5bOHVHY4a3EyinEV2YVq/V1EYlI3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zs2Z0+O/hh89PkvDY8GnTJ6doYFZTWWZAq3BrvDZxKLBvfkVvlXcp+eOIyPPIK0VPNIE8zEw9DsX8YVSOHjJ1tkwBwLwkcADa9YEw2mmMY8u2yTChYBkabA57nIEKP7GYrBrocQxps1n6j+WVWxpZfiXLwglpYIZ8aAMKpZsMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bfk5/whl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4279ca8af51so41162885e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 01:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721203780; x=1721808580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEk9j3PxQi/U6Kj2C9qYjTRpguq4a9W1RY82vlez4mk=;
        b=Bfk5/whl9n9T+dgbx7qIglPyGHb5qmK0Q6SE8N8/xAYNWogdf+O7SK9r0aoHNaXlDe
         uuSddojbrl4JpDboZlckZTxe8XCoX5wkKMZMPyHVRGhltZxmRJ65fSi0tYGf7WL5ntCy
         NgjJFzjoed+TzKRPDcREFXz20h+6H1nRgwi+XDJe4ImaZoz2u8qgx+ZuaxNMVzAREMWD
         xfWPYok5nEVMddbDdq71WXIJXBN7TMDbBbj5F1Wl1PWnVVJeSFdAZtCyLl74b0dR/W42
         oW2Y8Ke6DD9Ap8q71evw2ngfJhBOT12bCDgebnRSJxsB3sHl5KhXgI7zCVdoZSd8PDgr
         xMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721203780; x=1721808580;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mEk9j3PxQi/U6Kj2C9qYjTRpguq4a9W1RY82vlez4mk=;
        b=PryN89tjCARJQDSesGQepvHBCg+xXOTw1dpA2cdfctHpHpg8W9vKA8RRl37huqhVUZ
         BFtKdpk4NsjCPElsT+64ZlTBsOIN53/cdt34Ay4nXLpmvy+YsCoJKp16dTvnEp5K0ajw
         9Q+xNiC623pBkrekPHN8Lcb85npS8QOuo0y2U/r0eC11MOl0HKoRrd6tATlc1ZNkxxdO
         ZieZ3LX+js9UOaSbqjQf2uT5AaeSjvREJTwjP+PEYTHru6KMNWwBpFX/0U4wB2T9Woof
         NI6pjC6+XaK+KwjoIb78uZh5Tx0YvG5+v0N7CFD1kWE42n6AtMaqYQOjSBGWup+VZrUL
         yPhg==
X-Gm-Message-State: AOJu0YwWg53aU/tFnoo+R46VkpHj0sW4nM24EGwuXuAy8+MDwV990uLf
	tuzjg+2yKvSjMhN3Aw8etbt1LfbmRz2Xd3cB1+MsBbHfe3MV46hPmcCktWgRqQk=
X-Google-Smtp-Source: AGHT+IHt+gwZdzXzE8FBVvFbVFGzMeHqi3Jxcv2Sr7SCgDhwWr+SbRFe7FpOiAtmmq2gX67RFTqfEw==
X-Received: by 2002:a05:600c:1c21:b0:426:5d0d:a2c9 with SMTP id 5b1f17b1804b1-427c2cd36d1mr6173605e9.10.1721203780186;
        Wed, 17 Jul 2024 01:09:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25a957sm193359715e9.13.2024.07.17.01.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:09:39 -0700 (PDT)
Message-ID: <08e0945c-1c52-4f95-af6b-0e0b9b28b30d@linaro.org>
Date: Wed, 17 Jul 2024 10:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC
 RCGs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-5-efb4d927dc9a@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-5-efb4d927dc9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> Follow the recommendations and park disp_cc_mdss_esc[01]_clk_src to the
> XO instead of disabling the clocks by using the clk_rcg2_shared_ops.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 49dff9b81fa1..a476be3403ba 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -562,7 +562,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>   		.parent_data = disp_cc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -577,7 +577,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>   		.parent_data = disp_cc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

