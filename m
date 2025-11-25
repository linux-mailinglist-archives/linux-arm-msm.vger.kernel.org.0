Return-Path: <linux-arm-msm+bounces-83180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CA6C839D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 835B74E1689
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A522D0C9B;
	Tue, 25 Nov 2025 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uKDkZ9OJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869FA21D3F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054384; cv=none; b=EmA2RWJfYamOIpAMy3wTLVOk/Aw6IYELhNyRT5PqUJ+E0BCwal1OkF9mLeTEBhQFu+GydpHuCf5tD5wYC/LVFt5iLjfSb/xtlxZuBMAikv5dSsbeEflDvQrULjrfEDlMI7U2BbKruKfK3cL4Q7TBxQWMCZdh2X9r/Yka5dPrTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054384; c=relaxed/simple;
	bh=Gw6uECWao/CcVODq0iXLSu/Ie6XcNwzkbcDiX8ZX2l8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J5oiF4piaaYDA657ttSNRVAZ1lygNMn8apA22EVLHz2Lv56VcBvpY8BSe/f0TM/SSR9iRVCaGbGgaGucwH+4QNqiuKBEQFN21MWZSynLUeCYgdeJlBDj3zsGC/cFXU68FMvwZOKl36Udx9RyoVyGGqVbIlFSBqO1WJEMHpXkbcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uKDkZ9OJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b427cda88so3466787f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764054381; x=1764659181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2+82/9oD1tWEXjzNPF49kBbvMwNzJUnFzzIpHjNXPY=;
        b=uKDkZ9OJTTZOIHqdoNvfpxLGo/HdqcxJIHXFtb14SbJPsXJtK3ZzRM9f9yEjm4eHZs
         73RWJGqbJjrnUdnkuEpChNFk+3SmW10p9pVCATLlBPt2hcOOGsJ1lMkIMwPVfyioZlVB
         EVmDTfHP6saATkk9eJ67bc0y6GYM6XJ63NbdjrWrlJjG6RPhOnyayUpDF4S6gXcpbGDp
         m7ysGK6AqQ4xmizaEu6jDb6jBKEhx2Xo2D0zt0sd1jSV8C/Cee6sKBkfPeSV9sAUeF+h
         P3PZ6f+G7RtNTrMRlFLgJInxQXCzOwXeMvzXN1CD2NzQ/alxRrtl8w/pOmVUyk7tjtAC
         T9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764054381; x=1764659181;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2+82/9oD1tWEXjzNPF49kBbvMwNzJUnFzzIpHjNXPY=;
        b=VQSwQWeyKyDZEb6BRVdQNDmvXeDnB4E0+BJtKs20QHtMpkUonjyEtXKLb+OUtakQjg
         xWcBJnEf5Gz2P+rzJ+KUyvE5sVLXaGTrp1YEsgJvossf86V/lukJdRzorJ3vswzO8KJN
         VWTrBpCBuxuAxXf7h74Umrrvw0dOp6DnkMJkhQsyuMpXy1O7k0H56qkxaiz+0C1Co+DQ
         2+Cwo3Z5ygFlQZ+B87hNrfMEDk1zui4Fo+iTUyh1bZH+nYfj5SOCReD8NzFVCixkT2IS
         wZVAbhpGyq4H5n8aY1M9pp8ixPYPTJj/RfntjKrFsY5UAsxS7Wo5eRVZ/FonZsLsf//z
         0H3A==
X-Forwarded-Encrypted: i=1; AJvYcCWaGEe0O2uXL0FhmgQaKjwDO9tD6ZK4BQq5T6OECGmFxyEU6LX859feOTmaahOT0kQ9Qd7dedIdroK3YSdN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zmeQ/1g5Huu9//Bfv8T5xOfQw31o7zqilb6UvyGrS2uoX4uA
	i7Aenod0aTX+vLYqckDIX+6CagF/aLAHUFahcNh7bxL3EFY3mcYBRxWxV6Ua6Nvw2c4=
X-Gm-Gg: ASbGncvHDDptv/AtNVuVMJaR2Si/jBEX2Ol2Jqoy+I8e2gTI4BFBFrSv5hBJ5F+6j0i
	BEz/dDgm3UqIR6EyDmQ/ZkdwgxyynpzxMiSJqxGkZMvPVfPrx8gp4utZk7kEzUxVPTT9UvByBWF
	w/7aLKWyxA5Cpo59w7F3eHn1Qq/Hc/++GXw+oSPO9h/98D4lpVqRhzwehrZKERoLKWbC1rL8ntc
	yyXHD+/MNbTH9qFkz4WskKKfF3jsKF7qh5wfeXGV9iHhOjJ3e6sOKFf9iIUtGQWDzRjvZ7bqjue
	u8ZoL9biVajQNCRZSS8cVPrmZFcFiTkt/JBXUiT6GhIaFO+OEhIMUc3sZBZQaYAeSViO/yJVt8o
	IAYLTknGmPwBtzuzAmyyNv/M+ljspUR6gE4BQNRPuqgFxvcNLTrwh510oruimDltW7kPeZIAv/u
	OxY9NrCT2xdFqO5K4vYeS+phCT11BI8bOBICraVCn+uwF80IyJaQ2R9HM9W5Zia70flPJUilKog
	A==
X-Google-Smtp-Source: AGHT+IGsjz2hbRO/pHJstLn91MnHU/fAz5/ounsfyQx8inx9YaA4KV53U/62wUNWOz2+lrbZrVO5vA==
X-Received: by 2002:a05:6000:420e:b0:426:d5a0:bac8 with SMTP id ffacd0b85a97d-42cc1d19624mr16597825f8f.56.1764054380774;
        Mon, 24 Nov 2025 23:06:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e? ([2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm32036511f8f.19.2025.11.24.23.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 23:06:19 -0800 (PST)
Message-ID: <25582df3-0cd5-47c4-98c6-a499c3da07e8@linaro.org>
Date: Tue, 25 Nov 2025 08:06:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 22:20, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8650.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>      mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>      mmc0: error -110 whilst initialising SD card
> 
> Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8650.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
> index 24f98062b9dd..2dd6444ce036 100644
> --- a/drivers/clk/qcom/gcc-sm8650.c
> +++ b/drivers/clk/qcom/gcc-sm8650.c
> @@ -1257,7 +1257,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>   		.parent_data = gcc_parent_data_11,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>   	},
>   };
>   
> @@ -1279,7 +1279,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>   	},
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

