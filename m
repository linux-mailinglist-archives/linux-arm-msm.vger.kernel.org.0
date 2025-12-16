Return-Path: <linux-arm-msm+bounces-85330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC147CC2053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 11:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93E643022F06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0603A28466D;
	Tue, 16 Dec 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZ6BqBER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F82135B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765882072; cv=none; b=mSLw8vbkymmMakmtvtP8kdyh5Zvkr2nxuTBnk5wkhlZ7D8hyNRGMovEiQGSuggt963wM081KdI+Yuba8hYAuLf/JqxkPDFr/ZDyLZeb1hTnLPVtOwOHUl9VGywaH7cjA2E2Nb69qZK01PUSuBj3gPWym+dUtsjYhUqEMgFTmDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765882072; c=relaxed/simple;
	bh=qK2WahaIx91FQUd5b/negr3UGlrtL4mCkdFv/WLMjRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvz9zAxWulKrcyJBOdsiGMzJt9MLyncYFJPixzGRmXelANOE0NhNulFbvhTt55jCLZaCm39Y+C8wptRs5GAYegkWRyc+nDEaOacwgOMCtEsnI+qdsHw+uAafVp0WnxbLzyCmSqinr+8o2cKrC01D67gKezK4Y9AuwXREbzuBz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZ6BqBER; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59425b1f713so377168e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 02:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765882069; x=1766486869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=;
        b=zZ6BqBERjLoJa7UZuDvuLxysJcIVW1IZURBViObFCiOo5Enz4RwBdmZWQWRU+kmlX4
         FHE+QnC2/0GD/VQ/QFCZYmFYzsuZTHHNpL6cGT4db/N14s4SSgCj/AfT+6XADT48geYC
         ovJftVlH1g7dC4s7LPhdgAM9IhUXB4mk03yZi7aArR2lY3MqNCS8BC70zNsCkMA+q603
         cQpVNOrx/+HKK2NZsav/W3Mh+3/JjugUaQ3D+l2cOH+j6QUobxi0yElXNLE3TYlZNVyC
         M2L9q2aQMdxvGL+wPnkW5WsUZ3v+0Xah0xoMWYNpDLlRdPwD1B3uz5ISYNCfZP1YqrRq
         lhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765882069; x=1766486869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=;
        b=WzXVLjzinVYGEoCefOCA++0XcwyhSZGVOjaEwS2nTW8j05TDg2+p9zvGqFIp91QBir
         iK351aVZLngVkyWFY3T9xkLZcQhkPPROmYC3jKCf7LYFMhjmWEye3lelTWvIXYMfkj/8
         Yq+gPpJkuz3wf6td9VwPnSPsOy3MD4/t0FGMNbAqz3a4g7sORH+AXdHlEGO0JX3RxUrz
         ar0UI4b0KzzF346Qi09D24d5e+bp/met1lHaFyhDa1bmSkdjICq/PFTD6MBecSjWJbwU
         QxpfCgiJAnOciWVZJMJA/TaDCkUf5xOtI3UAJMHR1HnJdlYHpbs+EIjtcfDG+RuKbcrj
         SDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl+N47cFWwoE3R3H6sn5gxZDlq8n7PIpX97ismzpmHiuvsLjIuDh/dW5O+5GHp2Kbv6AXruQed9svzkDI/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QzYgp7lIJNpjNVYAbVuX3lgqQ2SKT2X3VRHJS/dY24tXyL5a
	skDipsqrTF46AVkVf1ZmJWumNWgV6yPeq+s8uIGTndgt7/o7DMAX65RFOsFPNkJhfjg=
X-Gm-Gg: AY/fxX6E5r0VcA6lC2WyHdgR3sLbysOqbe455qIavRCLvHuhhnkL4x+HC0V19lVZDYr
	wCSyoKigGhEleYaL5pdXhmW+YJOIJYhEU7E5NBHxtefqOMVrxPac6+/Bn7gs/b+EZMC2k7NoeC8
	0LwNj0jSeHHVJdD4FZJN6+agejG0w8gifvpTk2Vqglzfoe1jE2u/A31qbG8BzXUxIkPLgh8HNgL
	IOP1ByVbI2e3PdS688BOwKV0ODaU+xVr0xLwkGlMWZAICEnk9b22ToVvvkuoIU/AHKKT5qoJ8X4
	OFCckKYcUgpcwXrTxyjyxDV4xLvTye3kKugqoOE8sy08MQib0VHUed7ZfbstRXID+lmsp/Vv9eg
	eM2eqGZukPCgdX+455mZnFHCgIuElUL4931wEtumjsJJKg7y8NBU55qJlc4qfJsJMs6AJGF9zXp
	1d4+nk0GYYUGeK8hxRLyv/7AZvREdKk1t3SalPZCjNRjKlzsTbbNQADbyF4GZy9M5fOQ==
X-Google-Smtp-Source: AGHT+IF0H41NSoDHeiVoQB8t5PFRmbwgMPCmvxitVkRlghvklguwBlJGvPt9E5BeekSJvgfAgDKMYA==
X-Received: by 2002:a05:6512:3c8b:b0:594:2f72:2f78 with SMTP id 2adb3069b0e04-598faab5a2emr2935465e87.8.1765882069039;
        Tue, 16 Dec 2025 02:47:49 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da119c1sm806260e87.18.2025.12.16.02.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 02:47:47 -0800 (PST)
Message-ID: <3658e6cc-755c-4b38-aec7-b8bfdd7c8bd2@linaro.org>
Date: Tue, 16 Dec 2025 12:47:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] dt-bindings: clock: qcom: Add support for CAMCC
 for Kaanapali
Content-Language: ru-RU
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Taniya.

On 11/25/25 19:45, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +
>   .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>   include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>   3 files changed, 186 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..3ec9bf4d82ad3b0fbb3e58fe312a416b3580c30c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -15,6 +15,8 @@ description: |
>     domains on SM8450.
>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-camcc.h
> +    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -22,6 +24,8 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-cambistmclkcc
> +      - qcom,kaanapali-camcc

I do have right the same review comment as the given for SM8750 CAMCC one.

The introduced qcom,kaanapali-cambistmclkcc does not inherit reset
controller or power domain controller properties, thus it should not be
added to the list of regular camera clock contollers.

Please create a new dt schema file for qcom,kaanapali-cambistmclkcc
and qcom,sm8750-cambistmclkcc IP descriptions.

>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> @@ -63,6 +67,8 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cambistmclkcc
> +              - qcom,kaanapali-camcc
>                 - qcom,sc8280xp-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ddb083b5289ecc5ddbf9ce0b8afa5e2b3bd7ccad
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
> +
> +/* CAM_BIST_MCLK_CC clocks */
> +#define CAM_BIST_MCLK_CC_DEBUG_CLK				0
> +#define CAM_BIST_MCLK_CC_DEBUG_DIV_CLK_SRC			1
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK				2
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				3
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK				4
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				5
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK				6
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				7
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK				8
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				9
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK				10
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				11
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK				12
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				13
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK				14
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				15
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK				16
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				17
> +#define CAM_BIST_MCLK_CC_PLL0					18
> +#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				19
> +#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			20
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK				21
> +
> +#endif

-- 
Best wishes,
Vladimir

