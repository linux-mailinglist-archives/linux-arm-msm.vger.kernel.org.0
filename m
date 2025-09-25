Return-Path: <linux-arm-msm+bounces-75026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60410B9E2DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD6D1BC2A01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819F526A0EB;
	Thu, 25 Sep 2025 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tAvmyMHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C1D257844
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790941; cv=none; b=TNrfBpSxWQZlsD63RfYk1Sgnd8lr9NANh08RCefdm14LoLqa/5rjrxrTYlCmhlN45eDRlvvcdsXGBwUOb8UaqSzG9vFTmYl2cQSPih5yb36lt3Tu8czRiMzU7y3z2NSoOn0J+8njrD9GUbDG8Jh5YCahqNLi3R0ggMxZcsuMKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790941; c=relaxed/simple;
	bh=TmD6NzhQIklOOJTQVpmQteSOnmmHjADGWKhNTP93vnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeFruxvg6oPLXu8qBwNiUm6WJs22Y83v8lfkNG/+LXJ3AW492DZE9Jz/TJOyEV55P9Hsrz+/X75FwqY8nLX9D0zU8Ya+x/8ZJbuEDDN1/I7rxL6Oqe/DAfizujY7bM0LuG1v0+7gZYk+0qSc/ktolS3JcTIbk++/jqhXydf2iA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tAvmyMHk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso563594f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758790938; x=1759395738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=;
        b=tAvmyMHkou0jqZn9MMiTAJqjDCGfxVmd/e1a1FvpkZdHfEKHJSERV8jLnZbuydHXov
         aiD+MWOC/8tdUsvD4iVaHcBq5W+KB7wAU3MfNdudSZIq045nOHSxmgPDMFhMkTxIuExZ
         rKr4AllHfqtUD0WoWf5mqvwnKDrFJifyKULIDalJLnl6iYlBC6XSqm72eIQuV07ct+qV
         Jj24rsT/UaXDc7G/0ceqV8T47A7BtxjnIEElfmMPZ9oogNI9pLsOF2lm4HIdMW25GRld
         ymvuctR6pdPeQGnCRiHQDZ0kXVug0GgQMUT/BZ7os9qACRmejVIJHB5vRSP8El+AcQB7
         FOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790938; x=1759395738;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=;
        b=e5lvkHyt+ATz+GEB9ewMCgVsKz1rJ5PClRKnat66Lj5tgBb+rbUAJXZnl1oBCYwmmL
         IZpsRfrBXubvzuYQINPHspegd/z2PFzXMA5N3THAuCtqU9iBBdFJM8+HAdKy4coIQwGp
         V4v+R2ZI3qBVOdrUX8Ebq+2HymnfcUyOYxU8dY7NP2TmEzRtEa2eoxlKunokfjIGYT0F
         sN64J9rSz5qerSOLDfMi1EYP6Wt92Qygb2gP9nQ1KzrntDNIVyJfzlLwHpw5UdnwYm/O
         KsEEOQuilvtu9JhrL5q4zUM5LdVsCvy1LVa5qVRqyc33xrZhShGYYVE2nC0WgxSm8F/2
         FMXg==
X-Gm-Message-State: AOJu0YzflOKcp/njerL9pYd3eq+egnMx5VFWbMjwAJbwPUMOqTp0DcAQ
	ZRLoy8d8/BAO0BgzszGqwDKQSrect3XXlO2MC4LyhnMMSVnG2ePOhaZ/eVCE2jF9fgc=
X-Gm-Gg: ASbGncuaC6lLON4v3CumeIWzqQLCJdv+tzRcv/LSJ0jG12NTZ9wSEZCTVxHBvleGEPG
	zOU+HYbkXea+khsmLbf96exd1gRhwI9itivgKqhn1gxeyGO5NP30nSlkSQ2pwhs0hQ0Sk7U7UbV
	6laZJ+juk4S7GLVl5PKX4JCslun++ETSYGo+IHrPp+qxtcBRPeGLkTx7n4a9v9Zo4n4waB11q+Z
	R+UmyHX9Q0ouRIvSTIa04l3g3RWAlGkQVFij3SLVlLhGqF7rSjy9Ig3HlJ2q+aRDh8DC4KJnV5P
	GjwEinLhHSea6tMyTrdmP5ndkc/oM/gL9iS7UpHm/i3XPz9BokXMMwQzggy/n+Wyex/19X8pc9R
	ODkQnYuXqGoD5EaSmm0ij9Pho8UBTkQxF6NBpkson1EGVhH4J48vw5VfqHxjBz34q/zWegpgrXk
	K5iKVtMz8IwWatoGG7TKrL
X-Google-Smtp-Source: AGHT+IG6omy3mi4l5IjwhwiD+yQndxiCA+tBSpwYG7hEz4IaSuBeLRkN2eEbLT+qy6PzJRqtHh6D9g==
X-Received: by 2002:a05:6000:2dc1:b0:3d0:e221:892e with SMTP id ffacd0b85a97d-40f6617670dmr1826060f8f.27.1758790937794;
        Thu, 25 Sep 2025 02:02:17 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm2143861f8f.24.2025.09.25.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:02:17 -0700 (PDT)
Message-ID: <69e8c15d-108e-4832-849e-a23c7ddfe625@linaro.org>
Date: Thu, 25 Sep 2025 10:02:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: clock: qcom: Add Kaanapali video clock
 controller
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
 <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add device tree bindings for the video clock controller on Qualcomm
> Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>   include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b31bd8335529..e6beebd6a36e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -15,6 +15,7 @@ description: |
>     domains on SM8450.
>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-videocc.h
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h
>       include/dt-bindings/clock/qcom,sm8750-videocc.h
> @@ -22,6 +23,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-videocc
>         - qcom,sm8450-videocc
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
> @@ -61,6 +63,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-videocc
>                 - qcom,sm8450-videocc
>                 - qcom,sm8550-videocc
>                 - qcom,sm8750-videocc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
> new file mode 100644
> index 000000000000..cc0d41b895c9
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_AHB_CLK					0
> +#define VIDEO_CC_AHB_CLK_SRC					1
> +#define VIDEO_CC_MVS0_CLK					2
> +#define VIDEO_CC_MVS0_CLK_SRC					3
> +#define VIDEO_CC_MVS0_FREERUN_CLK				4
> +#define VIDEO_CC_MVS0_SHIFT_CLK					5
> +#define VIDEO_CC_MVS0_VPP0_CLK					6
> +#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
> +#define VIDEO_CC_MVS0_VPP1_CLK					8
> +#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
> +#define VIDEO_CC_MVS0A_CLK					10
> +#define VIDEO_CC_MVS0A_CLK_SRC					11
> +#define VIDEO_CC_MVS0A_FREERUN_CLK				12
> +#define VIDEO_CC_MVS0B_CLK					13
> +#define VIDEO_CC_MVS0B_CLK_SRC					14
> +#define VIDEO_CC_MVS0B_FREERUN_CLK				15
> +#define VIDEO_CC_MVS0C_CLK					16
> +#define VIDEO_CC_MVS0C_CLK_SRC					17
> +#define VIDEO_CC_MVS0C_FREERUN_CLK				18
> +#define VIDEO_CC_MVS0C_SHIFT_CLK				19
> +#define VIDEO_CC_PLL0						20
> +#define VIDEO_CC_PLL1						21
> +#define VIDEO_CC_PLL2						22
> +#define VIDEO_CC_PLL3						23
> +#define VIDEO_CC_SLEEP_CLK					24
> +#define VIDEO_CC_TS_XO_CLK					25
> +#define VIDEO_CC_XO_CLK						26
> +#define VIDEO_CC_XO_CLK_SRC					27
> +
> +/* VIDEO_CC power domains */
> +#define VIDEO_CC_MVS0A_GDSC					0
> +#define VIDEO_CC_MVS0_GDSC					1
> +#define VIDEO_CC_MVS0_VPP1_GDSC					2
> +#define VIDEO_CC_MVS0_VPP0_GDSC					3
> +#define VIDEO_CC_MVS0C_GDSC					4
> +
> +/* VIDEO_CC resets */
> +#define VIDEO_CC_INTERFACE_BCR					0
> +#define VIDEO_CC_MVS0_BCR					1
> +#define VIDEO_CC_MVS0_VPP0_BCR					2
> +#define VIDEO_CC_MVS0_VPP1_BCR					3
> +#define VIDEO_CC_MVS0A_BCR					4
> +#define VIDEO_CC_MVS0C_CLK_ARES					5
> +#define VIDEO_CC_MVS0C_BCR					6
> +#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
> +#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
> +#define VIDEO_CC_XO_CLK_ARES					9
> +
> +#endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

