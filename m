Return-Path: <linux-arm-msm+bounces-75014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C3B9E17A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A1A1B27C09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6428F27381B;
	Thu, 25 Sep 2025 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQsN1yzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881D2765FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789575; cv=none; b=L54P0MN0NmJJNGGI35fOIyOQ3VPwrnDFgjpWCB9wz4jMSv1MdAEJItHbzq13oNy/2Kyj8OTX6uFAN7gC/diJ/DoUSAyMIuwSD1FPNcu7vSwTUUKpa8/OR8eLFvyZLoTyar3TYYvIZ35/U8NpDeCoraUpVcHcrTpVZKS9guiWrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789575; c=relaxed/simple;
	bh=cJ6XeZddYxkqbSXaCUmWdzO7rq9U+hjrl/1r2Wg2BpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R22ve420AJrNSvjmCDXMxKPFx0CXtP10wPVy9hcnrz3AkvsQc9GXGYIN++TdFxBP107UENR9Xfw0y8sybjB5ruzdGHGbqTZ4sQWA/n6Kfz0PeXYoQq0T1Oor6uGPq14zNLX32gVl2XVbp+JBqPtPcakTWr41yYIU4AOdSQJ8sZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQsN1yzF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso3883605e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758789572; x=1759394372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAHXmMCopf4Jez0mjNqGUbs2LoOHhw0W13KbFKKEtaA=;
        b=XQsN1yzFf/U2AencpYkNAmnG0B12zwaOQugHp+Fly9aw6YwaM61dWCyxHh5lGETw6c
         aNM3jg++rrAaq+e9KZKoesTwlNhVOweu4Eylq1F0xPz0w8Ob81C9yqiaxBCLoqEsj/Ue
         xgaEtzdAiNuQbf6MZ0LjJp/Nh3zyTyUD3BgtHsggmY40EJxkqLQyqMzr6Cnz6WGVQiJJ
         ukle1JbwvesMO1PYMWGYtvBpdyxXN8hPzLzhVcWPihUV6omQuzjj1gILGDQbKdJOYVdM
         +osXg8pRipt6/crevoQDG+bg21d++EXz2SZvyD5aWZlgkWjz9kj3/29wAcC8b5aJi1rC
         J6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758789572; x=1759394372;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAHXmMCopf4Jez0mjNqGUbs2LoOHhw0W13KbFKKEtaA=;
        b=AcUrpoY+CE2c+WWRPy7RzuYSYzcBikweSUhJmD06DPUAjYIMbBpBzypTl3ud7LWqta
         VXIL6F+Ck2B5an+cyRzKEj6fBbBV9qh8THhonLalqhH2ltyn/sJYT+7+BOFCOzD7SQ3W
         b0VqJr6Cfa8rgSEdxE8vTmzmX04T8DnmwATYrXbkKd+4BInCnjc+iM977MNaYGcsMcE+
         GKbDSqkUZeDwWE7T68pTYooFRapWuV9u4C5bk7wccHN7eUVzIcaA85+CpUg5bFwyK3JA
         9eCXrjSfRH83/PrXu7i2wxoEdJOxiYgYYvSWssUMDgeJI/BBmVWhC3MB66tsHhBTj+Jb
         C4gA==
X-Gm-Message-State: AOJu0Yy5N4wmV7kiM1h5h3Hr2KHiDg/m72SkBXzZBvdwguRFjYiUbbQV
	Fyi+FfbJ8RdED14v/K1GqiKy61FWS+hvJJ/qngsqNGX/lRVCxAX4ozMPjBidQqHslbs=
X-Gm-Gg: ASbGncswq41tZpIfALSQkRNh26Qg+1632YYmPP4JOKXMO/6zKsK2em1xU7Bxq3ERGN9
	LjU8J+b8ljauD0midnVVks033oPZva2E1vP0uHX7xa+Pk+0gy6vTo1h0y5+Q39WB0Rbwga1l85Y
	mBihDK5Rz9Rde1lachRWWvebr+gJSSmSSh9q1cgSILvHe2nL8qjHj4PxCMgzrBIbL/z1yxdKFGi
	q+QwLfGCesy2ntqkOW4Xk/UF7/2VaIzK29tlNpSj0Rk0Nn6m/fDo0SRuM5Cd5uTnwmxYSzUeYDz
	2mReVYiFpkPAycG9jZS24mJn0EONbiiR0nILTiPeDIujCmvB83zo720PLzDDnjOvorYzeX241tE
	o4aCG1MHd2L7BrM0z29z0NxK+Vg/jfcyzpmENqkiuE7W86UIjORtvVvP8VkM+3FkcMi+vrqRz1J
	0l0QLY7Et4VDhxDvFs6+pQ
X-Google-Smtp-Source: AGHT+IFO+YOTIwteVZwP9Fc69KqqvgKYIbM3VEI4cOHYQaY7rdoM1kZxNKOGAy+tDNAzlp1GEJGQ6g==
X-Received: by 2002:a05:6000:2586:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-40e498b77bfmr2326378f8f.12.1758789571553;
        Thu, 25 Sep 2025 01:39:31 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32b4f336sm13972145e9.0.2025.09.25.01.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:39:30 -0700 (PDT)
Message-ID: <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
Date: Thu, 25 Sep 2025 09:39:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   8 +-
>   .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>   include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>   3 files changed, 187 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index dbfcc399f10b..54b04ecf67c1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -12,9 +12,11 @@ maintainers:
>   
>   description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
> -  domains on SM8450.
> +  domains on SM8450 SoCs.

This change is not about adding Kaanapali.

>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-camcc.h
> +    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h

What's so special about Kanaanapli that it needs two headers for this ?


>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -22,6 +24,8 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-cambistmclkcc
> +      - qcom,kaanapali-camcc
>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> @@ -63,6 +67,8 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cambistmclkcc
> +              - qcom,kaanapali-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
>       then:
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> new file mode 100644
> index 000000000000..ddb083b5289e
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

BIST == Built In Self Test ?

Can this not just be put into one camcc header ?

> diff --git a/include/dt-bindings/clock/qcom,kaanapali-camcc.h b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
> new file mode 100644
> index 000000000000..58835136b356
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_CAM_TOP_AHB_CLK					0
> +#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
> +#define CAM_CC_CAMNOC_DCD_XO_CLK				2
> +#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
> +#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
> +#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
> +#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				6
> +#define CAM_CC_CAMNOC_RT_AXI_CLK				7
> +#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				8
> +#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				9
> +#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				10
> +#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				11
> +#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				12
> +#define CAM_CC_CAMNOC_XO_CLK					13
> +#define CAM_CC_CCI_0_CLK					14
> +#define CAM_CC_CCI_0_CLK_SRC					15
> +#define CAM_CC_CCI_1_CLK					16
> +#define CAM_CC_CCI_1_CLK_SRC					17
> +#define CAM_CC_CCI_2_CLK					18
> +#define CAM_CC_CCI_2_CLK_SRC					19
> +#define CAM_CC_CORE_AHB_CLK					20
> +#define CAM_CC_CPHY_RX_CLK_SRC					21
> +#define CAM_CC_CRE_AHB_CLK					22
> +#define CAM_CC_CRE_CLK						23
> +#define CAM_CC_CRE_CLK_SRC					24
> +#define CAM_CC_CSI0PHYTIMER_CLK					25
> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC				26
> +#define CAM_CC_CSI1PHYTIMER_CLK					27
> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC				28
> +#define CAM_CC_CSI2PHYTIMER_CLK					29
> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC				30
> +#define CAM_CC_CSI3PHYTIMER_CLK					31
> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC				32
> +#define CAM_CC_CSI4PHYTIMER_CLK					33
> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC				34
> +#define CAM_CC_CSI5PHYTIMER_CLK					35
> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC				36
> +#define CAM_CC_CSID_CLK						37
> +#define CAM_CC_CSID_CLK_SRC					38
> +#define CAM_CC_CSID_CSIPHY_RX_CLK				39
> +#define CAM_CC_CSIPHY0_CLK					40
> +#define CAM_CC_CSIPHY1_CLK					41
> +#define CAM_CC_CSIPHY2_CLK					42
> +#define CAM_CC_CSIPHY3_CLK					43
> +#define CAM_CC_CSIPHY4_CLK					44
> +#define CAM_CC_CSIPHY5_CLK					45
> +#define CAM_CC_DRV_AHB_CLK					46
> +#define CAM_CC_DRV_XO_CLK					47
> +#define CAM_CC_FAST_AHB_CLK_SRC					48
> +#define CAM_CC_GDSC_CLK						49
> +#define CAM_CC_ICP_0_AHB_CLK					50
> +#define CAM_CC_ICP_0_CLK					51
> +#define CAM_CC_ICP_0_CLK_SRC					52
> +#define CAM_CC_ICP_1_AHB_CLK					53
> +#define CAM_CC_ICP_1_CLK					54
> +#define CAM_CC_ICP_1_CLK_SRC					55
> +#define CAM_CC_IFE_LITE_AHB_CLK					56
> +#define CAM_CC_IFE_LITE_CLK					57
> +#define CAM_CC_IFE_LITE_CLK_SRC					58
> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK				59
> +#define CAM_CC_IFE_LITE_CSID_CLK				60
> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC				61
> +#define CAM_CC_IPE_NPS_AHB_CLK					62
> +#define CAM_CC_IPE_NPS_CLK					63
> +#define CAM_CC_IPE_NPS_CLK_SRC					64
> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK				65
> +#define CAM_CC_IPE_PPS_CLK					66
> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK				67
> +#define CAM_CC_JPEG_CLK						68
> +#define CAM_CC_JPEG_CLK_SRC					69
> +#define CAM_CC_OFE_AHB_CLK					70
> +#define CAM_CC_OFE_ANCHOR_CLK					71
> +#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				72
> +#define CAM_CC_OFE_CLK_SRC					73
> +#define CAM_CC_OFE_HDR_CLK					74
> +#define CAM_CC_OFE_HDR_FAST_AHB_CLK				75
> +#define CAM_CC_OFE_MAIN_CLK					76
> +#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				77
> +#define CAM_CC_PLL0						78
> +#define CAM_CC_PLL0_OUT_EVEN					79
> +#define CAM_CC_PLL0_OUT_ODD					80
> +#define CAM_CC_PLL1						81
> +#define CAM_CC_PLL1_OUT_EVEN					82
> +#define CAM_CC_PLL2						83
> +#define CAM_CC_PLL2_OUT_EVEN					84
> +#define CAM_CC_PLL3						85
> +#define CAM_CC_PLL3_OUT_EVEN					86
> +#define CAM_CC_PLL4						87
> +#define CAM_CC_PLL4_OUT_EVEN					88
> +#define CAM_CC_PLL5						89
> +#define CAM_CC_PLL5_OUT_EVEN					90
> +#define CAM_CC_PLL6						91
> +#define CAM_CC_PLL6_OUT_EVEN					92
> +#define CAM_CC_PLL6_OUT_ODD					93
> +#define CAM_CC_PLL7						94
> +#define CAM_CC_PLL7_OUT_EVEN					95
> +#define CAM_CC_QDSS_DEBUG_CLK					96
> +#define CAM_CC_QDSS_DEBUG_CLK_SRC				97
> +#define CAM_CC_QDSS_DEBUG_XO_CLK				98
> +#define CAM_CC_SLEEP_CLK					99
> +#define CAM_CC_SLOW_AHB_CLK_SRC					100
> +#define CAM_CC_TFE_0_BAYER_CLK					101
> +#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				102
> +#define CAM_CC_TFE_0_CLK_SRC					103
> +#define CAM_CC_TFE_0_MAIN_CLK					104
> +#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				105
> +#define CAM_CC_TFE_1_BAYER_CLK					106
> +#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				107
> +#define CAM_CC_TFE_1_CLK_SRC					108
> +#define CAM_CC_TFE_1_MAIN_CLK					109
> +#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				110
> +#define CAM_CC_TFE_2_BAYER_CLK					111
> +#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				112
> +#define CAM_CC_TFE_2_CLK_SRC					113
> +#define CAM_CC_TFE_2_MAIN_CLK					114
> +#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				115
> +#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				116
> +#define CAM_CC_XO_CLK_SRC					117
> +
> +/* CAM_CC power domains */
> +#define CAM_CC_IPE_0_GDSC					0
> +#define CAM_CC_OFE_GDSC						1
> +#define CAM_CC_TFE_0_GDSC					2
> +#define CAM_CC_TFE_1_GDSC					3
> +#define CAM_CC_TFE_2_GDSC					4
> +#define CAM_CC_TITAN_TOP_GDSC					5
> +
> +/* CAM_CC resets */
> +#define CAM_CC_DRV_BCR						0
> +#define CAM_CC_ICP_BCR						1
> +#define CAM_CC_IPE_0_BCR					2
> +#define CAM_CC_OFE_BCR						3
> +#define CAM_CC_QDSS_DEBUG_BCR					4
> +#define CAM_CC_TFE_0_BCR					5
> +#define CAM_CC_TFE_1_BCR					6
> +#define CAM_CC_TFE_2_BCR					7
> +
> +#endif
> 


