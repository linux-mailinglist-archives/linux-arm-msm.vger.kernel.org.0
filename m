Return-Path: <linux-arm-msm+bounces-54747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275DA937DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280C93BE728
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFFD27602E;
	Fri, 18 Apr 2025 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un7bvDB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D71726B95E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982606; cv=none; b=mjYn4JUVhYRViZG4d38HKNHX8S2UouSsMudcG1Sj7eV1jl0nK2HTOs7mux/qh+iEg4poJ3GuflYfIOLxHHiZwXy8ZbGg0bLXZTX+CPJ3/QWqs1Cohtctn6cqECJ8x1fqTC/24JotuMp2Icuu1NYQFDBdu+378SPFMUtsof77kEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982606; c=relaxed/simple;
	bh=Oia/rkgNKHh2/N++KZlkJWuabXAo8hJuINnL3w3Ncyk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nt4Q6FStuMCQf4+jrROnF/ZQXmqKlPW0P9Qf8iWM0amLZt/Gp21b+4l2mKW0eCxEfeYxUTaMqNTkxZUDP71vw/NWxVgsnzK/jZe97fXVAAKSiPrI9QiV2HkiYJJ+znOrkWftwU3wjddHc1AVa3MbUSQbYG3ZFFOGpCHy01zOM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un7bvDB2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so21604645e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982603; x=1745587403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+0uPBCTRcJa+XJIyDOCaVN9ER8Mys0My2OlQ2q8Nbw=;
        b=Un7bvDB2n3MWTJUSop6RjsQMFykd4GvIyaDJAzjqubH0ePTUizdxRJO0oNrrGVLXIi
         PPC7cVfIjLjHCNefyJocFea1Luojl48UXhl2BkyRvB7TP+m17UIwme1rjyEu4gGHf4AP
         NKaWhNWZB+tRnld0hcbGiM1WSPrCebxa40USYClx8RL1X/hQN4+mR+panwNzOxfcTqIm
         H5pQqfE1iOfd+lX70q3LgLOvvgYuDIka1HZhM4KMe85zBk2+zbp9WZdJhw1Csoj1uRmn
         yFt5C8gmEAEEtVTS/djp2QXa2+nf0iedwp3PcKPSZLItcBYC9mBPHIL8hMPsT8WbxW0x
         dbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982603; x=1745587403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8+0uPBCTRcJa+XJIyDOCaVN9ER8Mys0My2OlQ2q8Nbw=;
        b=wOxZ9V4c+zM0SMXEXej5TGUglueTB9INNDuAPdaxM6CYIg9w3r3Fg4szWIoxEHJc2N
         caod6wAqTxV8HOryrO1d7dnONKzj0hViw+M8vszYdCh3bX1kFupw/f2Lv86eczEgT4nD
         OqVlD3HMqNWzxUy7EVqBWdSoXVMe6qv+ga+P6dkXOrBExR1dvOdzvbjYttqKY3rWN6gX
         LG1ThG7bvr3atPoOrVdZt7pCO1VyYiSLjjCgP3HuUJAV0Go/39OPJPkr8CuZ9T8Bs+BH
         TZKQUnjezyb8jQsGyIFAFx81w90wfRm9xvtAqFooNNtQBDZ1B0ct9bHzMwnjt6tukLoF
         Ju5g==
X-Gm-Message-State: AOJu0Yy8AAlYgaLhyuJP7yx3aY0FB3h9WI1Nc+wzOBVWx8MK3Xxcnv2y
	n4ixkOBQp72PWXTKg9IG2tA9+6g5tfrEOXgPjVgFNOyZqE0ds9zijyDjZZpPpx4=
X-Gm-Gg: ASbGncsF1vHsyJuFFRjvmYZAJpvBjtAso1O3rgV0nevTZesstxG/TEvWNjiM8QVviiq
	JEATfdwITHhyLUMpp4ltzf19ibo0HD8gjGmm4Q0a2Tkj8c4+SoSz5UMdR+Wg3sSemAaV041jXfb
	RBZvnegyzh+PV46BBX/rJhk8ZEMHuXizWFk9tHh4ikqH+0PA67A4JWQqqQ+am/AjAmMdV9nWH36
	OZ4oZu685YNfW5IEyjgl6fj81hg79hAAHMU6sg4c67tO6eXovl+qRCg1YenF4r590waC2hBWs/N
	dXJo3KY4Z6TQmRNk/1383qlin7Cx2SAaYSSGuYwnRh+i4WqKao1SCa5RjWrguJyUAreOKHupzoV
	CIl3QG9b06jFIIS0ycg==
X-Google-Smtp-Source: AGHT+IGJzh9R71bSIKxTajSqWiIGIo/+gzFHTQInZvegKY/vJp4hnU48uSfbPDcFzy+R16bgsGHN1Q==
X-Received: by 2002:a05:600c:3485:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-4406ab6897fmr29952425e9.3.1744982603014;
        Fri, 18 Apr 2025 06:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ecesm22619665e9.2.2025.04.18.06.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:23:22 -0700 (PDT)
Message-ID: <9eab3246-9ae1-46bd-8058-aff7774820a6@linaro.org>
Date: Fri, 18 Apr 2025 15:23:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8650: Do not turn off USB GDSCs during
 gdsc_disable()
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250305-topic-sm8650-upstream-fix-usb-suspend-v1-1-649036ab0557@linaro.org>
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
In-Reply-To: <20250305-topic-sm8650-upstream-fix-usb-suspend-v1-1-649036ab0557@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 05/03/2025 20:00, Neil Armstrong wrote:
> With PWRSTS_OFF_ON, USB GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of USB controller from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8650.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
> index 9dd5c48f33bed5b944a0b25959ef69e7862d0449..fa1672c4e7d814e1e08c79f9cda9463bf1cd1598 100644
> --- a/drivers/clk/qcom/gcc-sm8650.c
> +++ b/drivers/clk/qcom/gcc-sm8650.c
> @@ -3497,7 +3497,7 @@ static struct gdsc usb30_prim_gdsc = {
>   	.pd = {
>   		.name = "usb30_prim_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> @@ -3506,7 +3506,7 @@ static struct gdsc usb3_phy_gdsc = {
>   	.pd = {
>   		.name = "usb3_phy_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> 
> ---
> base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
> change-id: 20250305-topic-sm8650-upstream-fix-usb-suspend-20979d5a0170
> 
> Best regards,

Gentle ping !

Neil

