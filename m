Return-Path: <linux-arm-msm+bounces-46524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EBBA220FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62AE93A6190
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3AF1DDC2D;
	Wed, 29 Jan 2025 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SB0+6mVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD11B4235
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166133; cv=none; b=CmUiAqiTJyHym6qlGiKAFeZplcWRL5fWsl28c6a/pHCKg/JIXhXNTurwZ6dD1/2gwRe8d+RyEJ3Tdpm0owM0AeJb+7xwO/sM4cuhRNcSqwCQsDXxB4O6xQtd/J8VXImnDllqWbb/avo1yCPgRF4dNdzf/uXgciOL7kOF2vYCesc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166133; c=relaxed/simple;
	bh=s+OWfgaSGm/+RPUDXXe0w2gMZBjSWPoKkfSbsD0c8f0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=AW1plR1UsViuJvzVkzbt6AZL2i8mSi5BR37YHioYig1BYuDSR+w8pQ7Z2jXt37d8Fwkv5V9P+lovmCsJylPZfSesRg7OaerqPYnf9OlUVwuWUXJ1BrBruU5NJmN5jQu3XREiIrAyCLy0HuHJbcUZSSPCEZHM/DfYeRPwaLqAcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SB0+6mVL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so74164915e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 07:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738166130; x=1738770930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yZWN8mtPuEHoCdaoLKAs730omUBu/4wCEX0PGdNSj8=;
        b=SB0+6mVLrnvUntUi0iRYca4Gw6e8sGPZkzfl/Ukse9MUWO7ZmmF1iQYq/JdwGy/Fu/
         xGlMWwjyAmnXVoYHpkWb9x4/PPqwsdBWdAl4+uIGYRrj1Ps5EqXIzJ8yQ8kjDnyIMpK2
         7RJtmIPmhlzKyHZHtu1x6zo5KweE7ftOepkTx982/6sw8Ge1uhPdpVB4EpKozv++evrz
         ecze1q4l2242eHqUx6XVBEojU6QKku8SGYZYIYimpVHJZweRugk+9grFTrt6beNHvOQk
         cpoAvBXyRQf0SS/9Ae8gqbsh+oEWdK2d79NaaBCiONlBpaVuzaw2+QWhf5sikOinj02b
         wkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166130; x=1738770930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yZWN8mtPuEHoCdaoLKAs730omUBu/4wCEX0PGdNSj8=;
        b=ewh1kTr6jyJV8s+ffez4iK/t+yk7WWmdtOgBya4K6oqBOCVFkMW0w+SGtRGQFITFpu
         MR1UDpx2WwzglgckgFDCuyQgCD9Om43I+y7KS3hCjhNuDiSYJi8lrmvcCpA09WJ0JVE1
         hwqgmy9aG04cX5sSfoQR6i+0d88pT2U5lTyrXYPt14+F0eM2GTJ/rDbxj+NlJ3okPBo+
         RFUIAGzKj8g4VnZ25BAbFnptW5JIdMs+2eoUd5UsBjL9sA1lEGzq2Ih2B8+/LIoKDGOl
         9G1n6Kju3IHWS5fEatmYLn6Lu63tJ0cyTl65CeOrehqwrGlWTuqa9DMx79GHFo9OofaF
         DIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ54AE59xQHjGdYWyUgiTnmexPdr/xOIR7pNwKHHpjlUaVsFpcvhMcXMFJJzLWPwrigo0djaAc7e4upxOd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5I49ekloceTnH65VEU6AH0aA9TK6D6VvP67r0l0XES/IurT2n
	ezSRb+WCHOvYBoxyMybQnusfAc+G72wgAU0azRDuLsEwYlET97Z9Z5rut9D2Ug4=
X-Gm-Gg: ASbGncu5NgPBk1mqCCdSGy94tJzvsQNARVgFnwG4rHZQM3Z4XLZOadjqGgHSy5ijFHW
	bxL9lzEfz42b9vj2rRDlTk5xmRUbnMIAgWiCBeJWpDWN91iM19XcV+xyi+yWvhs6CSy9c2wQWHN
	rN+TywPd0oQGyjM1kIcx7ABE4TeMaBC70CDkS+UIexnH9wW5nPMwfFspzJ6lAlbcsOj2+u8kT3l
	Ll66QsS4dTbH0HT7i8PnsvIJQIQdpmu5pr4gMSsgWIYM0IA3Qc5eJQf5LlueoG+Ctit/zEo46gY
	EmTtpSpXtT6yFilhJgxG2MAKBgiO/EPPtVX8LacvvoI4cCNZQmWOSnBbwI2xs3eUmdRm
X-Google-Smtp-Source: AGHT+IGT0WVwTcIw3LywNfSFnLHYETFde0wR5SLZpkmojlTofw80UCCkaIbOmJwajRQ72JiyBUyPQQ==
X-Received: by 2002:a05:600c:4e87:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-438dc40d6cemr29865355e9.24.1738166130108;
        Wed, 29 Jan 2025 07:55:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc23c7csm27102485e9.11.2025.01.29.07.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:55:29 -0800 (PST)
Message-ID: <802dff81-6fe3-41d4-a470-ad35a09ce191@linaro.org>
Date: Wed, 29 Jan 2025 16:55:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect
 CLK_SET_RATE_PARENT on byte intf parent
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2025 16:45, Krzysztof Kozlowski wrote:
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
> 
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
> 
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Fix for v6.14-rcX.
> ---
>   drivers/clk/qcom/dispcc-sm8750.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index 0358dff91da5..e9bca179998b 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -827,7 +827,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>   			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_regmap_div_ops,
>   	},
>   };
> @@ -842,7 +841,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>   			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_regmap_div_ops,
>   	},
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

