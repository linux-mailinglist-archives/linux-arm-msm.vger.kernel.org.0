Return-Path: <linux-arm-msm+bounces-26467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24317933C9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890F31F2493A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153B71802D4;
	Wed, 17 Jul 2024 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnaWIcob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C811802C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721217065; cv=none; b=ZTgtxzue7WXJwjLthTDOzOM0U/ybZmMzol9eSu+a5CN2Car8CL4o2K/JnGrW0T4QQqg17XsXcYgFJUMQ4gbs/RFA+x5YLDTr5+XHlvd7z2wZm8XSEj/LJ5x0RL7S72v26A2AFGfCpQYCi774pPRn5b0YP53I9dmtQsFuyEBOlu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721217065; c=relaxed/simple;
	bh=AzBMMDAghiczCysgLO0b5ZIg722fsn++iWx4IU8NrNI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KJN2aZP8uZsIhBaStVLX8ks4ouAdv/k8QQ1f06cMEmMIEkcZr/sHm/48gFYGRyiBeaoNjNKkqoEh541y6Ua3DU5vPbU1RBrxzyf+KugQzTo0x/43gJu9RWCpg/nNTON/FwVBKG4nLpDLwTAC6c7UWYgq92+6JSUy2/yFXwYayqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnaWIcob; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-426636ef8c9so46008235e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 04:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721217062; x=1721821862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5iSYwu2Fya9n3LtiCeiPJi0IpqnIRAYPPpc+pIWxV0=;
        b=FnaWIcobpUg6iRUX/gAnK2aONExwHuNSipA7ZwSTXoDCJ9xR00wFiRKOJMPiTUPu2B
         Tl/GZTDLge02jz6Icg980FcTx5UubDqYxHYNrUq8cy5Poy3Jhy9yUJrt2tl16Ae5AfWS
         4WGFYFkt11+wZLYuoceY4H41XuEb6UH24r0UiOlE2YTOndgVATDmAHpFOMLqPf6o2fZI
         wC1WYYCbTI+Z0AxfVdSj6NhmXhdOjgbP6YsRKV6y4OXSnYvyf05nZ3bkQao3Jiragsde
         K/NMtaXoK0CGmLvlR8jbBpgGhcR6MpeG1Idz/vg3dAu2cpw//6c9yE9MnY44MokFu7qK
         cQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721217062; x=1721821862;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U5iSYwu2Fya9n3LtiCeiPJi0IpqnIRAYPPpc+pIWxV0=;
        b=w0JOm1lqKu3qaQDla+j9P0/v5vZbECdrr7Go6xB8ezpu9K83mtHY40yfiRKkkbNHai
         aFmrMLIwYlX148Ceo1NDTVEty+AwHb0rrQ0y56zfGq0Dz3XUzUwBZCnfVT8+WTt7FKIg
         hMDFFigvcm9PZqLWKI2cYo5YVsxVF953q/NBzKY4RyQ52WGfOy2zFai/VWktdoD6UNtf
         /omJ6XKo1HE3L5KEVt0cTFZAUkf+bUyH4TdP+5Vkk6xXWOwx+7c1LY6Pm7xPYUYDqF2u
         vZ0hwjElEeP4vEaioi1Dq2FcH0fjO9CwIkN+Z3o4AG5PjCZ7Q6UpT2AJmsis3GERHc3i
         tGuQ==
X-Gm-Message-State: AOJu0Yy11Es3FMWjJ/pshGiq31kVf0FKtvlHiY0BosDZik6EDp06m6qJ
	RBXEtWWhQEVjV9jRs14qP4zoV11MkMFvEPus3M+JI2VM3a+C1nWaZs1voFP9rwg=
X-Google-Smtp-Source: AGHT+IH2obwE+xY10IR4fwn1zJ/m742wzyjzBp1iYs8L1go1Izqx9mGJY4LSMCBV8b0JIx8xITUr7g==
X-Received: by 2002:a05:600c:35d4:b0:426:5fbe:bf75 with SMTP id 5b1f17b1804b1-427c2cbeea4mr12451735e9.23.1721217061423;
        Wed, 17 Jul 2024 04:51:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb478sm168571415e9.33.2024.07.17.04.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:51:00 -0700 (PDT)
Message-ID: <791af99c-6b79-430b-8df2-d884859d3040@linaro.org>
Date: Wed, 17 Jul 2024 13:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 7/7] dt-bindings: clock: qcom,sm8650-dispcc: replace
 with symlink
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
 <20240717-dispcc-sm8550-fixes-v2-7-5c4a3128c40b@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-7-5c4a3128c40b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 12:04, Dmitry Baryshkov wrote:
> The display clock controller indices for SM8650 and SM8550 are
> completely equal. Replace the header file for qcom,sm8650-dispcc with
> the symlink to the qcom,sm8550-dispcc header file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   include/dt-bindings/clock/qcom,sm8650-dispcc.h | 103 +------------------------
>   1 file changed, 1 insertion(+), 102 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,sm8650-dispcc.h b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
> deleted file mode 100644
> index b0a668b395a5..000000000000
> --- a/include/dt-bindings/clock/qcom,sm8650-dispcc.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> -/*
> - * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved
> - * Copyright (c) 2023, Linaro Ltd.
> - */
> -
> -#ifndef _DT_BINDINGS_CLK_QCOM_SM8650_DISP_CC_H
> -#define _DT_BINDINGS_CLK_QCOM_SM8650_DISP_CC_H
> -
> -/* DISP_CC clocks */
> -#define DISP_CC_MDSS_ACCU_CLK					0
> -#define DISP_CC_MDSS_AHB1_CLK					1
> -#define DISP_CC_MDSS_AHB_CLK					2
> -#define DISP_CC_MDSS_AHB_CLK_SRC				3
> -#define DISP_CC_MDSS_BYTE0_CLK					4
> -#define DISP_CC_MDSS_BYTE0_CLK_SRC				5
> -#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				6
> -#define DISP_CC_MDSS_BYTE0_INTF_CLK				7
> -#define DISP_CC_MDSS_BYTE1_CLK					8
> -#define DISP_CC_MDSS_BYTE1_CLK_SRC				9
> -#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				10
> -#define DISP_CC_MDSS_BYTE1_INTF_CLK				11
> -#define DISP_CC_MDSS_DPTX0_AUX_CLK				12
> -#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				13
> -#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				14
> -#define DISP_CC_MDSS_DPTX0_LINK_CLK				15
> -#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				16
> -#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			17
> -#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			18
> -#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				19
> -#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			20
> -#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				21
> -#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			22
> -#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		23
> -#define DISP_CC_MDSS_DPTX1_AUX_CLK				24
> -#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				25
> -#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				26
> -#define DISP_CC_MDSS_DPTX1_LINK_CLK				27
> -#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				28
> -#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			29
> -#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			30
> -#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				31
> -#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			32
> -#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				33
> -#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			34
> -#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		35
> -#define DISP_CC_MDSS_DPTX2_AUX_CLK				36
> -#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				37
> -#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				38
> -#define DISP_CC_MDSS_DPTX2_LINK_CLK				39
> -#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				40
> -#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			41
> -#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			42
> -#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				43
> -#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			44
> -#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				45
> -#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			46
> -#define DISP_CC_MDSS_DPTX3_AUX_CLK				47
> -#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				48
> -#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				49
> -#define DISP_CC_MDSS_DPTX3_LINK_CLK				50
> -#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				51
> -#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			52
> -#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			53
> -#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				54
> -#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			55
> -#define DISP_CC_MDSS_ESC0_CLK					56
> -#define DISP_CC_MDSS_ESC0_CLK_SRC				57
> -#define DISP_CC_MDSS_ESC1_CLK					58
> -#define DISP_CC_MDSS_ESC1_CLK_SRC				59
> -#define DISP_CC_MDSS_MDP1_CLK					60
> -#define DISP_CC_MDSS_MDP_CLK					61
> -#define DISP_CC_MDSS_MDP_CLK_SRC				62
> -#define DISP_CC_MDSS_MDP_LUT1_CLK				63
> -#define DISP_CC_MDSS_MDP_LUT_CLK				64
> -#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				65
> -#define DISP_CC_MDSS_PCLK0_CLK					66
> -#define DISP_CC_MDSS_PCLK0_CLK_SRC				67
> -#define DISP_CC_MDSS_PCLK1_CLK					68
> -#define DISP_CC_MDSS_PCLK1_CLK_SRC				69
> -#define DISP_CC_MDSS_RSCC_AHB_CLK				70
> -#define DISP_CC_MDSS_RSCC_VSYNC_CLK				71
> -#define DISP_CC_MDSS_VSYNC1_CLK					72
> -#define DISP_CC_MDSS_VSYNC_CLK					73
> -#define DISP_CC_MDSS_VSYNC_CLK_SRC				74
> -#define DISP_CC_PLL0						75
> -#define DISP_CC_PLL1						76
> -#define DISP_CC_SLEEP_CLK					77
> -#define DISP_CC_SLEEP_CLK_SRC					78
> -#define DISP_CC_XO_CLK						79
> -#define DISP_CC_XO_CLK_SRC					80
> -
> -/* DISP_CC resets */
> -#define DISP_CC_MDSS_CORE_BCR					0
> -#define DISP_CC_MDSS_CORE_INT2_BCR				1
> -#define DISP_CC_MDSS_RSCC_BCR					2
> -
> -/* DISP_CC GDSCR */
> -#define MDSS_GDSC						0
> -#define MDSS_INT2_GDSC						1
> -
> -#endif
> diff --git a/include/dt-bindings/clock/qcom,sm8650-dispcc.h b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
> new file mode 120000
> index 000000000000..c0a291188f28
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
> @@ -0,0 +1 @@
> +qcom,sm8550-dispcc.h
> \ No newline at end of file
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

