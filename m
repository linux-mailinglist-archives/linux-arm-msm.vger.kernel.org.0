Return-Path: <linux-arm-msm+bounces-26462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A25933C88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD663B20D39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF80317FAC6;
	Wed, 17 Jul 2024 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEJfnQVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BC17FAC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216997; cv=none; b=OcI5SJfapiowpHB72ryqMZ1+G31VGgxQ1dRJgNGI8AoJfiXjeGofBRggV6/rVpfDNw0MKisIGT7POoOZqOKUMapF8MZ/ubXMfJ11iCLoMap/yShSY+WJ/iCVtCCqjwhHa9Fv5TkNwokE1nWS0C6zU2MSUXZPjd2C/IBLBkXvNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216997; c=relaxed/simple;
	bh=nI/3YM9q6bZto9j2in5+t3424lyXL6J4GQ4x++22zNU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=morNobjuUimhHSGPQH4z5U3vtkiw5ns/qmnODcvq2ezZEYkRsR6DoSHHdNty3iB7IJW29erLCNfVAFcJ6uucLGKO1wlZRG9yy5ISJKt4ojXi9E35A9VY+JQdYXs0vppOxyxZfhGJEHIzhcVt5UGCbyKsLFRnwcP5Z3T7zfee8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEJfnQVA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3683329f787so277655f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721216994; x=1721821794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orDTWYSZsRk1SW+448dI9OxvFqdVzjOm8FEcYCfWgwg=;
        b=oEJfnQVAQBD/xgxLWc1KvzidrnImg7dNciWLRBiFo5CwDgiNRvrY9XnHR8StR1TBjS
         2leu8KwlcI/piQqO4SNNAnyUy0KYGDHZzGN60FSnw8QXwOA7tLCw188rlWlGpGcld8pU
         lgHBhGpugAHis+ga5TVNOC6HsnEkWAXAMCq0qUj0BssyT2lzK8KUM2Gysid/D/ek89IJ
         VIcRje2YF4SPOEB2b0dbg3EG21ekRk58gQX6v5OH4bFWvp55qYM4N0p2on6fMYG6pVYw
         tmo/N+1AjETUZxoJFZSlMCkzpZjvCTiPvQyrROZlpW+Pb4rlH5cLuV/QgUNSj77ZKz5i
         k+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216994; x=1721821794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=orDTWYSZsRk1SW+448dI9OxvFqdVzjOm8FEcYCfWgwg=;
        b=UQnCCcuPLhFqBoIudYSBYym+jv2sDDUIs1wAt7OeCZOzPkLcnN7CtPo64OdnDKa3ou
         q7TpLdxYZ52G66TV1aRF37lpWtKz/egbywxYOjI9uOUKnMcFuDKGN1SgWyZvU3K92fmS
         2DK3otheR3pvEkwWqJ09FssyVeDVOWGAkNEQJgO4AFrcDlX/vUJ4VIoioJIGAZqFxR7Z
         Eqkttte76gULhUejl6xw0KFSdd9lHaEteh2RfAW84Jn53vpl+mGFhQNyI5QQIPK7nHOM
         ZnhfzZRbSpWZh1GcvvPlEEAdCZgV3oGEUJH8DCFgs2hqD2AUCQT3yVEvyb8qCCHBDael
         C2Nw==
X-Gm-Message-State: AOJu0YwgUJXgvUWkljBwIpjLbVVhANDLEDoG8S5Q40RGO7XJOMVd17y4
	FtHik7xlxhp7YTk4LBoDIGoR/HpCL5bM2Nc5vhHSmgkV6pGdqbm5tcepaxrK9eM=
X-Google-Smtp-Source: AGHT+IFSZ2QA/xfvafEGc9Auxp6vvvltoYTTClW8CA5JOYDkOks1EFOro1KABhaw+MhvotffkRzmrA==
X-Received: by 2002:adf:a1c5:0:b0:368:3ee5:e3e1 with SMTP id ffacd0b85a97d-3683ee5e543mr647649f8f.7.1721216994143;
        Wed, 17 Jul 2024 04:49:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf0e4sm11490435f8f.33.2024.07.17.04.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:49:53 -0700 (PDT)
Message-ID: <39dfab9f-6cfb-4cba-a6d7-387b6e2001da@linaro.org>
Date: Wed, 17 Jul 2024 13:49:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for
 mdss_dptx1_aux_clk_src
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
 <20240717-dispcc-sm8550-fixes-v2-2-5c4a3128c40b@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-2-5c4a3128c40b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 12:04, Dmitry Baryshkov wrote:
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
> index 954b0f6fcea2..a98230540782 100644
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

