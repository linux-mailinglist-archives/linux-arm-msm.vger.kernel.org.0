Return-Path: <linux-arm-msm+bounces-26410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682D93388E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EB27B20C29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF8022086;
	Wed, 17 Jul 2024 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2aY0evG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A411BDD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721203761; cv=none; b=dJ6hXg2xIUgveuHllOQjCPSLo2DPgJqVCQAYtkebs8anvNA3eWJ8jLa5Al86h6WcykZ29el0V7Mq8RiXVHwDaeCWWsUCYwYoxcXknRYtlepiRvXyjEgCXIbvba28kLrJpyM8/SyxSerOJaNgnUjh63kpiKjoa/QEnIcp4n7omjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721203761; c=relaxed/simple;
	bh=2o0dVat0evgmjKlmJB64OfeWmLcQ1n4aYQ0d+bRARXE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=grWqBYdkJiw3SwFTnS/i7WGYkOg2G5axprewSeTOSAXWnGeyP3eYLHgmFeoLbKCjCTj0Z1zl75rjDKQZfUjNGXpnwhHceMbckvIwNdDQL1Yc0GYQfDFK6qI8n6CWIh7qNNFApZAZBRuijFjqdUJr5vRdOE8MSpY3acbDgMxI9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2aY0evG; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eee1384e0aso46750241fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721203758; x=1721808558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOXoNQosPE8+srYjmMs5eTAgqs7D713FND3oFcQySbY=;
        b=K2aY0evGcv6D4xrnVabDTeMbjWL44RdANbiugppY/fehDBT2UN97n2vqWsSueASDLJ
         2waDMQqqTUrv0PwQBOAa02RZoMLGqDDKqou6Piv9DEEJBu2vG35I6OfmHQBMEH62Fesz
         weZ0zgTeWmeAr+Hhqrrw3Iz63XeNCkyzF2bL39VFhpKOG81D40X6u9uqQ4DHth6L3N0d
         MpQ5JoT3FkzxvCvsE9AILl/LzFreToSyt4beq7yxFl+QK98Dfe/ESNOtxutb/XW5LCkc
         U0W3tPM4y+IhaNVSYgGZX4LLAMdT7Ous/6WWyvvFeKb8OPUPYto5oNhoixhtlG0ng9kk
         T7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721203758; x=1721808558;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OOXoNQosPE8+srYjmMs5eTAgqs7D713FND3oFcQySbY=;
        b=vARmghdD7m9pk6msHxvSiCKXjHKqeNrroeeUL33zlhrFAvrN8y4dwGNPCPOFoQ+rRL
         AAWKpIhL14jVju8YshDnDDCbVAM+IumhuVIPzboiLVBLNSfU/Ssp4LA386jjomUTvbgp
         antJUNMpwpc+eUkxkSJGW+aq6RqzLBVFl+/cPm3qvskvhtkksCt6e3JMLxTjK3lUtiA4
         I1XapNvDgmfbHTRdJ/hQcFGsrbl3s9at0KXxU3uP4elRhc92Cq5tMRM8LQS/3PBpVgiO
         fUy9HbQBu71pZ945vml5ufp9qt/jnL9JlnZl/MucVdf8K7oAW+2AYuicziW+h5hgGRRd
         4UEg==
X-Gm-Message-State: AOJu0YxcCYV6a3tl0syIy0GnhaEdwer6gNrSNjdt9Q7rzLAb3jgfQGJh
	US031wQiZ06tAMWP0eLDHcYo1lVI8mfU4mY/tZKb+Mu51gDadzNloQo5yqboFBs=
X-Google-Smtp-Source: AGHT+IFSbAldDNTRKoNcY0RV7ixvmgdkFTNvrkyv921DOFtSKdgDd80Di9g13/eZj8F9UBty/s8wrA==
X-Received: by 2002:a2e:2a01:0:b0:2ee:bd1b:84c with SMTP id 38308e7fff4ca-2eefcdfd545mr7085201fa.0.1721203757366;
        Wed, 17 Jul 2024 01:09:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb50fsm161597715e9.38.2024.07.17.01.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:09:16 -0700 (PDT)
Message-ID: <ef1e4d78-7e94-4853-90c0-73f0b80f9a63@linaro.org>
Date: Wed, 17 Jul 2024 10:09:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for
 mdss_dptx1_aux_clk_src
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-2-efb4d927dc9a@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-2-efb4d927dc9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> clk_dp_ops should only be used for DisplayPort pixel clocks. Use
> clk_rcg2_ops for disp_cc_mdss_dptx1_aux_clk_src.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 09e4b1e40e20..8ceeb17bbb37 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -400,7 +400,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>   		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

