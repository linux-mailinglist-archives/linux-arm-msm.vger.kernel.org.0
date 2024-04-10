Return-Path: <linux-arm-msm+bounces-17077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6A89FCE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 18:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B3D282F13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 16:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB06142E62;
	Wed, 10 Apr 2024 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uqa5Hu7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3426BA39
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712766778; cv=none; b=lwGpu1yRq/fYBCu9uvADjYDX4sDvsS5h8FKdnGugXIfwvRAoA3jNt0EIGx3h7dWURZw9yGTcX76IhIWgVLxATM0PZRp03ii7pSJedxv57cA7fZq48il8O8aNKTfIctqPoRPVyz/svoMohL759P7bSE0iOL2isZc3GI6owQ9KFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712766778; c=relaxed/simple;
	bh=kvn102cEV10A9xLHN5t7onB6rby+Efm0PAjcv8ZjKLs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rH+VXOzII9AUSJtIsslkzhGdaUF/j9OQo+FYriNVXOagsqT/PRzoZOjYnIHt0FfuM1YT84a+swJZmM8Dv8V00OpKl4OfpZYJbqDN1tLQZEdY6Kchxuj83c6bLdWH+9VxPrDqtSPqaMqgMw3kr9oeh+mVZg18LkEIgK+DJWNEuSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uqa5Hu7y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343d6b55c42so4978634f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712766775; x=1713371575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNzmsUepIyc6bK2dhvypU77BHCVEUVueQh3p0lKGP3M=;
        b=Uqa5Hu7yflozsNXAFlzkrgy7D19oidRVVot21RDSj1SEv81TNvZQU1f1QQKTsd1mRk
         y8DbcGJk9y/mGd9VXnb1FvuQIHekidfRG91TR+5wq/4Ux6CBobPfAfEHKuNRFuzB0MKv
         Rr+XqXipgIS3AvHNoyW18DlJmv6UiHLsMjVLenIBlGBA9smGYOu1y/5a1uSZJ7tKXW3F
         WA6rcQz8PYWWMqnWp9AkneqaFJ68pRSk/DAilVcMw9sZYjI13drIVNTsDzf/NZjhjUUU
         tV4YWmFRpMdLH5PycaMQrp8XqmJ7WIjxhs8orQJcfby1k+/UedKH91RW+4fcBYgjwieW
         qzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712766775; x=1713371575;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GNzmsUepIyc6bK2dhvypU77BHCVEUVueQh3p0lKGP3M=;
        b=VDHvyLToZWoJcl51XSl1Rm0DN1VITLHt7bqAtRd8voWBq4vWnYKSxb1TfFkdyiy4L9
         GPqxOxUNBpAOJa9+WMvUXOD3Aw7f4Jc0PN7EXtZqXVKOT6SOvWG51sYM8rQ/IwG3ASBT
         7NP2Dm42Jd4DLND73qcr6CyGkSJcL59aHMUYTSdI4QrGj9ln0MQ+UnrZgI0xa+QJ8+GR
         Vicgpk5UhbXUDvBZUtJ73Z2jvhGbZixKQ/NO6glymwBmeknGsXXT9Ma7B8gHONeAqP2R
         Zn3FCcyji+fgx7beZM5ph07EzSlTtydaE6IFK9E5MUdT8pwnhMkdMoPLsOOZsCJ5JGRF
         /LPA==
X-Gm-Message-State: AOJu0YzsgPOptQTZNmntPQdgHK9frveavgwAkZK5mLYKogKVOSTHTBoS
	25e6gYfyG/vVnDKxpyawMLIeKebgyPclY/eH2y+wELh6AJHxEGX4D5ElPPQ2Lmc=
X-Google-Smtp-Source: AGHT+IHxzWKFcKTNPGcfXccrNOQd59vYejACiqOjsAhUMivZExnKxErWbpaBaXq/l8tBxih0OMfplw==
X-Received: by 2002:adf:e80c:0:b0:345:605e:fa38 with SMTP id o12-20020adfe80c000000b00345605efa38mr2827310wrm.60.1712766774935;
        Wed, 10 Apr 2024 09:32:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b00341ba91c1f5sm14114237wrt.102.2024.04.10.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 09:32:54 -0700 (PDT)
Message-ID: <c4934052-b8ea-454d-9b2c-f1262f82777b@linaro.org>
Date: Wed, 10 Apr 2024 18:32:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] clk: qcom: dispcc-sm6350: fix DisplayPort clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
 <20240408-dispcc-dp-clocks-v1-2-f9e44902c28d@linaro.org>
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
In-Reply-To: <20240408-dispcc-dp-clocks-v1-2-f9e44902c28d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2024 13:47, Dmitry Baryshkov wrote:
> On SM6350 DisplayPort link clocks use frequency tables inherited from
> the vendor kernel, it is not applicable in the upstream kernel. Drop
> frequency tables and use clk_byte2_ops for those clocks.
> 
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm6350.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index 839435362010..e4b7464c4d0e 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -221,26 +221,17 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
>   	},
>   };
>   
> -static const struct freq_tbl ftbl_disp_cc_mdss_dp_link_clk_src[] = {
> -	F(162000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(270000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(540000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(810000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	{ }
> -};
> -
>   static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
>   	.cmd_rcgr = 0x10f8,
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_0,
> -	.freq_tbl = ftbl_disp_cc_mdss_dp_link_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_link_clk_src",
>   		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

