Return-Path: <linux-arm-msm+bounces-25122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE9925B40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D403D1C20C21
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C895119B5A7;
	Wed,  3 Jul 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Az/WAxw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86F19B5A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004091; cv=none; b=qG2w3xZHFNeu03b2wR3LhkS25TUrYiSInFQ7YecaEgnyfVqky0zLj7/l7n//3yJukczpwqdyJPbgl9/uib16nNEagiQYok8+eiO+G1wkdfwWbjE8EPFKeWTarR/gbXGefiCaJE90CeUblp16hSIucI2NPi7id364H1fK9TSsa64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004091; c=relaxed/simple;
	bh=V5EJvXwdV+R0mDeAgAA0N9jGKaFbWm7c40FfMFoUbzQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=otNQwtgPe+W7IU3CEcTxAa1MjKoK7UgM+xluQWtEeZ5Mx5GSwSEG/DODr4cA/nghH2AHKwblOuw5V5X4QlTB3trkzvWfwr0uk5k6mOFY4/SPIw44YlYib51YVaEVXN76RAwFMWP8Hdl+A2HTgf7vQn6CcsfygTOecXKR4B6JcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Az/WAxw/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36794da7c96so232622f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004088; x=1720608888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+k9XFol8r5KGsoCLeIMiq2xKkkPY/+JBFOCWGLwrwI=;
        b=Az/WAxw/0i+sTOoBihjIhS6xoqOdxwH3f4qGwyDCvpNYt8CssW1IMlr9EGMmtS0Ovg
         6gLY1GkJydMvCrDDeItvMzErUh9yxAQEzo0Mso1ihuO0BUhXm7yFR8VWzZJEoxESZ2O1
         R+XI0oakrZfHuUp3EZKpFwDNVgDpKQWfXGoCChL9KTCL3Cf5XLsZjbK3DBiACeLyBBD2
         pnAIoK4kahAhJIHycH0MBj0FG60aLtQKJSfI1XjScRT6j700V2kT8HXfSa4MskMwhXMO
         K+rpURnQhzMS0AaV2hEDQXOzRGb6+8WUURKN0vrWdnAcvjxrOJ8P97BkP0xEGzJaCtc1
         6zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004088; x=1720608888;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o+k9XFol8r5KGsoCLeIMiq2xKkkPY/+JBFOCWGLwrwI=;
        b=ixaXzTptbYPOxwoxUCdQw+Bc7EumO04IREivQCdLubr9g+uOhp2mb3s3G2EjsH+spt
         dgkVsmTzAjsOnytPVwxn0UwgiXvRY6JhCBffBY4iU2MwKjOpc2N+uv5ARkAFfpObY6Xm
         Gg56zbdktYCN932TPRKfAkQjzgguNnpDH3YFtGiENq7UFdh1QsDjSXku30tlSoU8LMYI
         7Zw52hbhYNSr4dxA65C3U+eCXdEdBdEtQkR45WgDMKkTOQsqOVrsGoHf0VuYa6ZpG+fW
         paoV40NQ14AP0vxZoAYDlTl+5bd4LJgLSmRdV5efUKOq9d9Q4Zl/BqteqGI6xfVkSwey
         tFsw==
X-Forwarded-Encrypted: i=1; AJvYcCUmjj2Kb3+ZbrpkQiwBOt3HKOqItvmiv5Ah4IdF/6pZHQQxPMKarqxLwIDJigEjEW86S5q942T9dVqG3xdRuN9ctWmQDlp1Tvz2TxgLlA==
X-Gm-Message-State: AOJu0YzymaAiXeSo4PoBWoNVzRG7gWv96E6gCy0WLAskB6pUVSdFiC+4
	W9mRQ0pKWWAc89TlvN+/GTxk9/nasYhGe9hRGYWbDALlX0MvVc5QOviNGLYlHwQ=
X-Google-Smtp-Source: AGHT+IGkhxLtD/eSLOamFQYV8oE1yN01ZRLKSVM5lCohT4/wrTW1GQiO0WQkwPXdH0yP4tb4re4TBw==
X-Received: by 2002:a5d:630f:0:b0:367:418c:a90d with SMTP id ffacd0b85a97d-3677571c205mr7031507f8f.51.1720004088419;
        Wed, 03 Jul 2024 03:54:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:48 -0700 (PDT)
Message-ID: <26650b6a-c8e0-4884-99f6-5140f6eee15b@linaro.org>
Date: Wed, 3 Jul 2024 12:54:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 04/10] clk: meson: c3: pll: Constify struct regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-4-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-4-7d15a0671d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 11:50, Javier Carrasco wrote:
> `clkc_regmap_config` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/c3-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 6d5271c61d14..f09f4f7b46fe 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -678,7 +678,7 @@ static struct clk_regmap *const c3_pll_clk_regmaps[] = {
>   	&mclk1,
>   };
>   
> -static struct regmap_config clkc_regmap_config = {
> +static const struct regmap_config clkc_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

