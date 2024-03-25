Return-Path: <linux-arm-msm+bounces-15052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBF88A8B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8331C21EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45AF482DA;
	Mon, 25 Mar 2024 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AT4GQn24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EEC1422A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711375825; cv=none; b=LIyU26K/RjzD7p9NYcokyYsuUFs9plzKhaDQgNi3wSZVwGHPz2UAnUpa3HFfEu0YjCxgaEKkyndYdZNBIqiiviiyhu5s5dq6jEZ4hIn/M9IiJCrZNvpoEFT6u0AY7aPiCPe12VTM6e9d+a5DnBNSmDsXxyuey92hK3jv6dVDyNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711375825; c=relaxed/simple;
	bh=26jxuhHkpyff8BK9/UclL9/UXwdt5S7191xk5qpKRi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=APlA6HvVuGwN1w4c7qjiCqmMPvtrVL7DhEc7Cp1LAuYgu+H/zk5JfMChpEhaT6qYhoqbv+Ui0XhMN1OvRF0R/wgI1bpz3Xf49VOBipHDaY3i+Hr0MtUYxNSNoMbZDDiGnSl/tLxuIrzATWIJFOF8FQGS8R0WCKnMmHBnA9VowTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AT4GQn24; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4148bc73069so3689725e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711375822; x=1711980622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StaTdWf6gyGmgptSfaLJLNr+tsmMpQyJX3qJGrQC274=;
        b=AT4GQn24VpcRaGev9/3aWYUhXpDRo8tYSZTuWENEogv6ygUlld83pxWtgQu3yav3gT
         bsTJYvFBmOY/COvOEpna/D2zFxv1gE8s2Z7lN7rEVtgEgAYXUJ+ocXUSpVVa6+T5yCFW
         AmDGnW++gIzZd+UCoc6vB620I3+wYgFMgNscptFpuJj5qzgoHN3avntANfWZOAItz1V0
         TB1GKP1qHKAzpesEu+e7Mt47ZrzOqY/TIPEIwntNsyEmNaAytesLkKZKTfvZRnpZikmJ
         rtV47gKdK/jVs6Xci+vXqX+t4Q0oTKfmat/89kxC3p2GgfN1x/GXB6gfi29atd8ooSWw
         wo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711375822; x=1711980622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=StaTdWf6gyGmgptSfaLJLNr+tsmMpQyJX3qJGrQC274=;
        b=soZSTrCvYJ7dKUZHHkJBlGN3B0YevcyZWbqqnKrVGgIw/RtCO7aELRJ078/lQ7vA8w
         8e4KDGfrDkZ7vhgpTVnlIbhUrQbNtcsItcvZhwWl+L7lrqQ66/055wBZm1jhgF6XQieF
         uqdjVzEL0+DDlq2xoW4hhdhQqkhGLK/u+9lc+cAdZRnltsg//A+sdyUeHMmk6EmGA/NF
         k1rvVDYh3yN7W7kCCIzPLvJaOnWI1Ss6cRaFIDbQd2WyNDVfF5eFDVewbZY6KAJZ3sBu
         8OxgMAsyZvI0qzimMVK9MGNbwHpbDorfxQ+a9xsKjM9daHULVcNBBF9gaoEGMEd4cQix
         KAZQ==
X-Gm-Message-State: AOJu0YxZiFp2Auy1aTy2bhcrKdGefbjCcMPAjzCTie7/JIbWF0lpGc1R
	ezQrDCByzTQL/lkSSrE0e2BTFySVx8sj1IsMrAkNNvhpTJS/4D+PINLrwBurpPw=
X-Google-Smtp-Source: AGHT+IHdIdvy6UZ7I6p2pVccv6Aqr62AKhWY6+stOQWCPRYlp6X6M6ZgGnAcvf0YLcc1RYh0Gwh/0g==
X-Received: by 2002:a05:600c:4fc3:b0:414:24d:7f9 with SMTP id o3-20020a05600c4fc300b00414024d07f9mr6107491wmq.1.1711375822139;
        Mon, 25 Mar 2024 07:10:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada? ([2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b0041477f3f99fsm8517646wmg.30.2024.03.25.07.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:10:21 -0700 (PDT)
Message-ID: <ed6a4199-ad9d-4ee8-a24c-cc3be4642fad@linaro.org>
Date: Mon, 25 Mar 2024 15:10:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: Fix SM_GPUCC_8650 dependencies
To: Yue Haibing <yuehaibing@huawei.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240323032806.14356-1-yuehaibing@huawei.com>
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
In-Reply-To: <20240323032806.14356-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2024 04:28, Yue Haibing wrote:
> CONFIG_SM_GCC_8650 depends on ARM64 but it is selected by
> CONFIG_SM_GPUCC_8650, which can be selected on ARM, resulting in a
> Kconfig warning.
> 
> WARNING: unmet direct dependencies detected for SM_GCC_8650
>    Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>    Selected by [m]:
>    - SM_GPUCC_8650 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
> 
> Add the same dependencies to CONFIG_SM_GPUCC_8650 to resolve the warning.
> 
> Fixes: 8676fd4f3874 ("clk: qcom: add the SM8650 GPU Clock Controller driver")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>   drivers/clk/qcom/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 8ab08e7b5b6c..3e85df1514bd 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1094,6 +1094,7 @@ config SM_GPUCC_8550
>   
>   config SM_GPUCC_8650
>   	tristate "SM8650 Graphics Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
>   	select SM_GCC_8650
>   	help
>   	  Support for the graphics clock controller on SM8650 devices.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

