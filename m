Return-Path: <linux-arm-msm+bounces-44163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C3A044A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72753A75AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA8A1F4266;
	Tue,  7 Jan 2025 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpStcvFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736F1E1C3B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263899; cv=none; b=OuvdAfZGcfLDPjH6+mUiDkODNTy3Eou59VxMgexXe7pT9RJ5jje/6dGmjzz+KlRK2p28DEoCe9OM1M1CkpGbpxJTvoLMhEOYI8s2euuA1I+TXh3NAGvrSqRox9BVmztFQpm/yu92ntqMYJ/0w7Hm1i4OrH/1R4tIcrAAHLwq+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263899; c=relaxed/simple;
	bh=FjgyM8gSdHQ+RyQDOK78opGrICfaQRwv6uViGvP85cc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Kgi9xUHPzcOdZJLWUz51fjTEW64Q5ONlO5ML5mdiQG9wSNNnmBeKBAruaeGkbJbHQRGjaY2zuUx3UWBYqW4xbEj6pYb5RrZIWJFORFQEfzUSUWHLUoRjC6W6RmoQFMOjtySsiiPiUvPtyQNF1bwSzbN9QWCOhywX/U+swB6MNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpStcvFx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283d48so113604375e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 07:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736263893; x=1736868693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cm0jWQj+kGMRd8+xdbQIL9hMAS+A9sN1aQHyc863mzU=;
        b=kpStcvFxvXFsUvFqofSy1J/aTGr0c0oSLZEFaNNTQSpUf5wuxnI/5liPWDeetcI3M7
         MRm9oXeQB/GjILvPKj/721bEAFk1mUyjKWfQ/3Exv3DaT9Qg1x5w/1MsiBTkrEw88xWr
         qaifkCF1FV2GpefVVHqEuEdxYjSM5IlLU8AyAubOaXymuenqVoTXM4iApcaKpztGurLJ
         Azoo1f1WhvJUuoutcn0Km9Kk8RYwuX/Z+kOoc5YPwLSPqlzQIOxAEYjefVuS0owXNpxP
         +IoXf0Wa1yaExSM+BugipNOQ8k0qcyx6uW2KmJ+5Q6PYQbTpO9g64JSW4x3I7UI7ZAwc
         lDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263893; x=1736868693;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cm0jWQj+kGMRd8+xdbQIL9hMAS+A9sN1aQHyc863mzU=;
        b=rGo4r7mUvyvi6qTW47zpIBYxL5CsFudhRnNQLfcdyrgRiil1S7fBCEjJ2RlTuAro6h
         gD8hxENn5zD1BoYo3zn69IPkt2DPru3ApNKEg0Cl1PmQUKq3tASmkv2/ShwDMAy6JxPp
         EeG2b84V6oXFCieBsAyUOjveSpjHH60Gu+vuTKVGK3DUMiLt+F2n6zE3m9Y1pcMLphVo
         MCKNaaD8UPeGLl+06wlp5Rd7kNEp8V9wHYsJqPrMd5AyQpz1Z8zH4/6HIgdFPF57r2PJ
         OiLGqEmrK9FGd1zbLI7Nt3xsotmRgut4fdlUUQ5FGGvH36rdACtq04m/xM1+3FCJEO58
         ZBhg==
X-Forwarded-Encrypted: i=1; AJvYcCVUkCbHkb1NzyGWbbfayIrLOGNksSwwqmqtIzpmQWWTmeMgHOxhEuGcDfVUMUc4lusirNFaX3ap/Z/q5/j0@vger.kernel.org
X-Gm-Message-State: AOJu0YwPeDuoBOpBp62ieU506OQAoMzrg3NAzBVo+mzLCDOreU7UWKh0
	mYQ/NwwF5P6euWQxxgs17TzNNFGcOjmbpVHj4/oWXm4Js1nXJM8bUITHlsvCOmE=
X-Gm-Gg: ASbGnctcl3nDgY6qRuCnOtNj/4Pxbdyq6c2SVLvXdtk2PfwJQJpNlyDDA3CwSYQFmvd
	we6hjJuhtFfyUzqL+EU4AU42PEgb1mUP0+yoIncX/uKEdgu8vc+LkG7t12El5J8KLGjKVF1PfD7
	mtojhzdgsYu1rUAfGigB1LRD2qSo8jFdNDH01bpnsmX7pWY6IUofzTfZMVTvcJ6HZU0DvSyuw/o
	qd//NGfueUN46oV6ptPaIA5EGUjWF5A8zGIjnyokmKfXXgtp3/7uRO8Z0bm4GZvtA==
X-Google-Smtp-Source: AGHT+IEXgQH3KvQW5MgAeggB1EDeaKRyN3/XifxNFRzR8n64GqSyOtdVr2SBzgQxNynjvtwxKami1A==
X-Received: by 2002:a05:600c:4a83:b0:436:1aa6:b8ee with SMTP id 5b1f17b1804b1-4366d356735mr471761135e9.2.1736263892766;
        Tue, 07 Jan 2025 07:31:32 -0800 (PST)
Received: from [192.168.20.246] ([5.50.50.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm50202380f8f.32.2025.01.07.07.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 07:31:32 -0800 (PST)
Message-ID: <cfd4d531-9c39-46dc-8b08-86217c392374@linaro.org>
Date: Tue, 7 Jan 2025 16:31:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: defconfig: Enable basic Qualcomm SM8750 SoC
 drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107152749.327407-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250107152749.327407-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2025 16:27, Krzysztof Kozlowski wrote:
> Enable necessary drivers for booting Qualcomm SM8750 based boards like
> MTP8750 and QRD8750.  The clock controller (GCC), interconnect and
> pinctrl drivers are considered necessary for early boot debugging, e.g.
> via serial console, thus make them built-in.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5e88321aa603..0812bd9df09b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -636,6 +636,7 @@ CONFIG_PINCTRL_SM8350=y
>   CONFIG_PINCTRL_SM8450=y
>   CONFIG_PINCTRL_SM8550=y
>   CONFIG_PINCTRL_SM8650=y
> +CONFIG_PINCTRL_SM8750=y
>   CONFIG_PINCTRL_X1E80100=y
>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>   CONFIG_PINCTRL_LPASS_LPI=m
> @@ -1344,6 +1345,7 @@ CONFIG_SC_CAMCC_7280=m
>   CONFIG_SA_CAMCC_8775P=m
>   CONFIG_QDU_GCC_1000=y
>   CONFIG_SC_CAMCC_8280XP=m
> +CONFIG_SA_DISPCC_8775P=m

This looks a spurious change

Neil

>   CONFIG_SC_DISPCC_7280=m
>   CONFIG_SC_DISPCC_8280XP=m
>   CONFIG_SA_DISPCC_8775P=m
> @@ -1369,12 +1371,14 @@ CONFIG_SM_DISPCC_6115=m
>   CONFIG_SM_DISPCC_8250=y
>   CONFIG_SM_DISPCC_8450=m
>   CONFIG_SM_DISPCC_8550=m
> +CONFIG_SM_DISPCC_8750=m
>   CONFIG_SM_GCC_4450=y
>   CONFIG_SM_GCC_6115=y
>   CONFIG_SM_GCC_8350=y
>   CONFIG_SM_GCC_8450=y
>   CONFIG_SM_GCC_8550=y
>   CONFIG_SM_GCC_8650=y
> +CONFIG_SM_GCC_8750=y
>   CONFIG_SM_GPUCC_6115=m
>   CONFIG_SM_GPUCC_8150=y
>   CONFIG_SM_GPUCC_8250=y
> @@ -1384,6 +1388,7 @@ CONFIG_SM_GPUCC_8550=m
>   CONFIG_SM_GPUCC_8650=m
>   CONFIG_SM_TCSRCC_8550=y
>   CONFIG_SM_TCSRCC_8650=y
> +CONFIG_SM_TCSRCC_8750=m
>   CONFIG_SA_VIDEOCC_8775P=m
>   CONFIG_SM_VIDEOCC_8250=y
>   CONFIG_QCOM_HFPLL=y
> @@ -1667,6 +1672,7 @@ CONFIG_INTERCONNECT_QCOM_SM8350=y
>   CONFIG_INTERCONNECT_QCOM_SM8450=y
>   CONFIG_INTERCONNECT_QCOM_SM8550=y
>   CONFIG_INTERCONNECT_QCOM_SM8650=y
> +CONFIG_INTERCONNECT_QCOM_SM8750=y
>   CONFIG_INTERCONNECT_QCOM_X1E80100=y
>   CONFIG_COUNTER=m
>   CONFIG_RZ_MTU3_CNT=m


