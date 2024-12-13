Return-Path: <linux-arm-msm+bounces-42088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FD9F1238
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8579D282CFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E615152E1C;
	Fri, 13 Dec 2024 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGVPwLGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE213AD1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107545; cv=none; b=PORUcsGbSkoEbYu3r09yUBLN0dqvDOpJXzQmdENX3tuPAxtx7AsBLCc77jXelc3cN1lkPxPTe8M/S6Ejb5U8hKuKT5WcRPcLsAkgcHh3cHdlhXejmDZO3IgF+sg1+SBIzTJsq5SW61VRpBCzV+MlA2beajKztTI5C5N5I4b6zqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107545; c=relaxed/simple;
	bh=ZPYhrEJ4C9YCXdunFyqtw5wLjFVZJ3nAjA/yurNDUUo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L/TMvIl7uYKNVHwCJ0ZQZCboa4FJ6PrvByiTDun9FDM4XxPYZW7Xu12uUU2DxQILfpyWSAxBoMjQMkIlk4+Sva6f2f686pCRHlgOL1AC/+lykZq1HqsiH0dp9hwWWRguUMV2/Ry04jWEa1Afwjw+VcvgrAO1feOno8ZYxMTpbcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGVPwLGO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361a50e337so14079145e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734107542; x=1734712342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEItgojaVXZbU1GN6003YTd4LyqNe/xYZINzdoL1yzo=;
        b=SGVPwLGOX0UeWPPGbYTsnaWgu/774dcg9otzMt0tspmqCC4ym3RoIaehVtlqCvVRiw
         QPx8ONgiRoOC990N/wp9alTprMXz6O/KTIhcWbVPxvnxexNA4Slm1dcBNYPS6wZS51nX
         hKZxTqQHGMCRbj+umkilIAcVEzDODpZ7XYgiButCJwo+tw90W6Owobxnps9Y5kpzFIBx
         OH23rdwxPnxo7C/g35kj7LcT9lUwE8q2XpxrNJ/MQ6erLTO/aVi8ZQsPEinWIzTbgGCf
         QgCXWv3X3eIL6lv66E583vN56hXW6QzLuenUKw/HB/wmjT9GGWVlq8ChrvWWGVimBIg+
         Va/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107542; x=1734712342;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DEItgojaVXZbU1GN6003YTd4LyqNe/xYZINzdoL1yzo=;
        b=KmgxZ/2T8IdNx8CLlsm4Y9iYQqbdnPzA4loWfNsrodZiAJIui5b3TSSHHgd3kTwXum
         LZixPn5Z6/CeFVW9w+YPYgdNvgW5k3d0rw54d6Ji9Lwq7kqvg/mbOt3J6itIOPSy897k
         jwF+pDulRkXhLYj1VNf526ceoW+ANKWtOldoZhW7Xdo7FJjerw4F+obJMZDpWnm1tkGu
         guFr3KjHyuA2flBXaa2RicY5CX5Tm/YQ8XDBmlHfY/6JMhiGOObg0jiKJrwQl5LewvHI
         7s3AMFSMUQFZzNyc+l3MESK31Qxo71TW8e547B2YekREiDMyKlfrV2swb/lWPY82sown
         D8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy8ceCefPKd0H+F1Ls/TYgLbxJaGbeyCwMwxbqRnN0Y+jq6JAKvZYAUjr1Oc4b2mLmh9NZ1tGKF5dRjaqj@vger.kernel.org
X-Gm-Message-State: AOJu0YxroFDLspCy4r8CuTHAi7CouYqLNNwTBDDOJgSKGmbUivyrinf3
	W+Y8UfMG9tmOHG1W0sjm8yHAiwDGINPhUj3nzRbYQXu59Wz8t2pC2scrMo2Zbas=
X-Gm-Gg: ASbGnct1JajxjHg2f8iQ0ZEYSOr0bVyZSMFujcZjhj5uZMWa5rppYhQzJ7JfV27U68t
	PaMMGgX5RIb/TezcYNH4STNME0AH93RuwqJdCQaKHvJrMZegmcaoE1Rc4o0+I00r4LtjzJMo0Uz
	U0AVhoznxEOTp5na9K7lzjrdyUSZg79qnum3mywoyu6aS9rOuo/UKCg4QRKWYmjkZ0FTPDpbrir
	/lIOYYdUNdLQsWFRdArZgGw2YY4KMD6y/3Ta4v7m+UO1F24TCmB4nCSD1KbzW81kOil9DuS5UH9
	on69/lTnvS8hOHmvJTP86W8M4zEUdoPXwQ==
X-Google-Smtp-Source: AGHT+IGi3FSQoKO9DoZDt5mN0jq76MoXzn0hU8XoMEuvmZepHPVL8hpQQir9gtzLFbj267rx685IwA==
X-Received: by 2002:a5d:64aa:0:b0:385:f38e:c0d3 with SMTP id ffacd0b85a97d-3888e0c15dfmr2184770f8f.58.1734107541936;
        Fri, 13 Dec 2024 08:32:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70? ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a25sm7571456f8f.27.2024.12.13.08.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:32:21 -0800 (PST)
Message-ID: <335fb7ff-35a0-44bb-981f-757204d829a8@linaro.org>
Date: Fri, 13 Dec 2024 17:32:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
To: ross.burton@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
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
In-Reply-To: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+ linux-arm-msm

On 13/12/2024 17:12, Ross Burton via B4 Relay wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> This option was removed from the Kconfig in commit 802b83205519 ("clk:
> qcom: fold dispcc-sm8650 info dispcc-sm8550") but it was not removed
> from the defconfig.
> 
> Fixes: 802b83205519 ("clk: qcom: fold dispcc-sm8650 info dispcc-sm8550")
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e6158633f07c1f3532fba62f09b31e7448..c6d6a31a8f48c7ce9c9ca74e29db3b8835bfd556 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1352,7 +1352,6 @@ CONFIG_SM_DISPCC_6115=m
>   CONFIG_SM_DISPCC_8250=y
>   CONFIG_SM_DISPCC_8450=m
>   CONFIG_SM_DISPCC_8550=m
> -CONFIG_SM_DISPCC_8650=m
>   CONFIG_SM_GCC_4450=y
>   CONFIG_SM_GCC_6115=y
>   CONFIG_SM_GCC_8350=y
> 
> ---
> base-commit: 231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
> change-id: 20241213-clkmaster-558e5d7c966c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

