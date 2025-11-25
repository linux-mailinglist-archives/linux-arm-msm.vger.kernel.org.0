Return-Path: <linux-arm-msm+bounces-83179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BFC839CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D80C4E1558
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE752C21C7;
	Tue, 25 Nov 2025 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6h9KpG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501521D3F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054374; cv=none; b=l/70tzt08sZKTm+CZwyE139bG4C/M0s6EDqZS6U51BRp73dRvzhGjX+QGMalvyydUujI1X1puui5YHYnwnoezeDl2DDBAIi8txKfL1m0sR8+n9ZdrJPpTZJViRjvpR1Ya4WR2Ixl6mhUaHZWUL9ciGsM9jSZPjNc+9Ci/6rgp1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054374; c=relaxed/simple;
	bh=Pmh3tnqQxKeS/SEMGYgGDVSJN8Tg/FabFKdMF6JrEEQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pVRZTLuY4UTAAjnG877pDGlxQjRjBlJKilWmqXuc1Q0dCZJkB+gNdzpr81UYwD4/T8eoBCf4/sOERZI5Yh2AsMhyIDkyPf2j8J2swz2Qwg4A7NFPmb4mf/0Wua6BKo1Low6IN7U6YuPCEXsgWBEGxvETo+3M5AS8cOiAzog+ldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6h9KpG5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b427cda88so3466694f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764054371; x=1764659171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEm0xkER5A9fvC8M611AVTHN4OE0WgnQgh+pWroZoTU=;
        b=O6h9KpG5dCXZfxaEg43qw/WNrbqJ2javhXtYa9/xnORRiyNFRd/10VIbMfRLrws/uq
         i8Rj7qN+a3VFv7hMJp9T/eL2/P+8l8n2zEEjUNP0HWbSKhnl/oBfTZ35pulTcsBjXLR+
         TzuccdBoPFnKwuPNg3AgTSzK+JM3AK36tQU81UnrukUDz1+4PZ36t17/jPElFjglSF8Q
         f0sSg/3L0Zv/+lmVpg8sMajdVFdlXDmn6QVe1y1apvOeXwrMBnkWJtzTY+fJUK7WFDfL
         2A/+mptd/W0CSXwSJhyKef6zRjGMQoMb0XDatQjWZLxvDvYlV9oks+0PYjwKYrlm3M7m
         0UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764054371; x=1764659171;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEm0xkER5A9fvC8M611AVTHN4OE0WgnQgh+pWroZoTU=;
        b=bH0d7au5d9mpVK1VDFfxRUfe6juY489SRXdCqF7sNUcmIJd49lqjmz7SWJXRquHJlI
         ceh4pmo6OsAlWGElbmQRIi9ZoKn1DMzsFnh6WmNg1m1B5fkv9lFzftEtxoWkGpoP3PvH
         QyB97vsQKj7dlJZvvfC8Iv3kdjfxBNTQweVqJMcxejFYpAJnm9TiLk+GvHI1ZF865Xap
         ZozPcauPRLPxva5yhfw4kPk14ZUMZ97VxSAqahGDEZOVL7guT8c9LsviFmbGXGLTANW8
         2ZnCzLzoyPgPivbj7zLc7J4rqYEGp9Bnp8t356Ms+tKl/tReFgYZxV3v2khm2PV0urhW
         /gtg==
X-Forwarded-Encrypted: i=1; AJvYcCUL6B5RcelfPAsawRqSi6BYCPfWnkvmNMWX2plzg5+bxDqmP8Qnfz0/GYdBBywwhzm+S2DPJCU5nLaEzzyP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5r73vrHxLkXYSnON71vcEJfSzaM8RS9iuWt9FhZz08f0Fusj0
	d0YvQTx1RHblWeiAd9ATiz0OpYy+xrYzMzEneLlRxaNKcR7kRGuBh/VlD2G4KM39C3Y=
X-Gm-Gg: ASbGncsXGObDHk3KFbGp8MtvTt3CNETdJKd/bvVD9QC+NsJx1S9zNTxo0kZ9o6XHdWB
	iARi/oWtZnOwI1dssDmc+NGTTtK/54IPszw00pjqf73mcHQNyPFcqTWKIjZNqRZL5mzkLDhnvmu
	pzKeNztToyknpS1YX1yyZ3bsAA8Iry8RMO1Wb/Qa5mHyAWEHJ5x4Vrz/sdSX1hQ34CBwp7dOTL5
	hWOecTFjSw4Q9YAPsAZwcOPEP8Yr493zw/xTeSE8IYdNYIfe70I6BpdIStPceRgrnXvb+eF5dJc
	m64pyoZiSP2IrbDdH5L0+IiL4SK2bNMZuXfHKXMngsxClqf/w234BNBraJl94y4LLc1eHNXck5k
	hP3waHhfPQStasKJKdvZOV6BicgvwgUbK0p5ZG3IQbxzNak3RpOd9/645v1v5Ys51BtVxslVlZ9
	/NkkAdv1un9QVzgGd3uQfzd4XXTwCgKfqx7sYZQSj5RdMCwWgc5iurex4SyR9Oyyg=
X-Google-Smtp-Source: AGHT+IHSHFMY4Ju7/Ym0lfE9c56GU1AZP59rAXfNrVOGGYtc1Si8CFAqa69njaVqAPt9294ITeFN6w==
X-Received: by 2002:a05:6000:4012:b0:42b:4081:ccea with SMTP id ffacd0b85a97d-42cc1cf3c2cmr15083426f8f.35.1764054370539;
        Mon, 24 Nov 2025 23:06:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e? ([2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm32500921f8f.22.2025.11.24.23.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 23:06:10 -0800 (PST)
Message-ID: <c150b3e8-23ef-4c33-aa10-1047717d67a4@linaro.org>
Date: Tue, 25 Nov 2025 08:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 22:20, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8550.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>      mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>      mmc0: error -110 whilst initialising SD card
> 
> Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 862a9bf73bcb..36a5b7de5b55 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -1025,7 +1025,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>   		.parent_data = gcc_parent_data_9,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>   	},
>   };
>   
> @@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>   	},
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

