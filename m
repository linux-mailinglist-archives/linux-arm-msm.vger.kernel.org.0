Return-Path: <linux-arm-msm+bounces-37240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD09C05AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0501F23BCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4899020371D;
	Thu,  7 Nov 2024 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsW5RuK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE74200B93
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982320; cv=none; b=F2agiRCAqkyTRefVGdBV7adLUO3RT3a0cc8DayzQqjjYOe2Q8GYboGk/jDuecMUqqS70ax76qPimH3yZ8WxcrtoiNEzD3+9NPEv3IK2Nkf1MqqFQd0RNiEiMZ5Xb9sbHKcqi8871Ip5nWnlw77SFwnA2DM9S1ZbXzYaLlQhwJVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982320; c=relaxed/simple;
	bh=uOHtoOGSDgDkow1wLA2awmZ3A8Qe3ptAdpnofZDjgqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuLBItW0mFQr/X+//XWgYwuSeFUYOyRhfq5axhAD0bvbvnCCgj2nZDpUZ3PHpW4ojD09KNivy7RmddlWdfYSE3o1mM885/Xz5wGe4z4pOBnPyu0O5F7mSSFbKNWrvjimf4yLIJGEJ3GRQObQ724B5LjPgg0i8Qxjvb1hnYGKdEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsW5RuK/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3807e72c468so134410f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 04:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730982317; x=1731587117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzbdXmjU7p6o20uBK8Vs/ZUnlHfeyC3jV0YTi+RLdZs=;
        b=gsW5RuK/QVDvjg+NYAX3GtP5VTunCSDJIGe0M5t3ED9PufbRLLGCEYp7BKtAoIoKwg
         k1ziHzQxjJWkq1QgynrKATcUyjVCu1Go/r2KFM6XGhaLgvojxIIQf0p4SjpMfUQe6OaZ
         wcQ9AaE6to2Q20J8bZ1KwaH0UF2SvBRTS98XRch6vxmxABwXhwQ6FfB5kBPVnBiRgN5t
         mrrh3HOoDTBkDfOXi9aMAsXe/LlfUZsYsm8KWLbNHlTlwkLlQhtT03MtZcw3VqGRHl4N
         1GqjAi7hrdDOsFWtq0So6qjnNZWVHBO8fGAcInoOtr6wvsptaQ1VQZpFBOQg8ZJn9NRt
         TDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982317; x=1731587117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzbdXmjU7p6o20uBK8Vs/ZUnlHfeyC3jV0YTi+RLdZs=;
        b=rXIH1CMHRnKiDllPcfBhAS97+vQPvKr30dwRSafhXJxkGQbUQyL5jVH8XYe+NAR4+6
         +14Chl6oksyUVVzb7AU0MFX9EWPoN15ltJjfXswzEAOOLH4bM+eTt7iy8fP0MTDGCb81
         AZxLL2h6aF28UXlb+tflcTb91v9rYJ59/3ydOnNf6j20xbOZIHmByEhG62634m/vLoXR
         AFtt1woZJI5Mkw9fnK66WLNs7OI5wrrHBAWybwcpRKjAz5LEiBMLttxvU4y/oQIItT7H
         O4YO3RhHNnmizEgmUp6SCQpboV83FQMe7aQR8EFZNL9hyPEixnz3wrVi7ajaHw8KNwYf
         KfqA==
X-Forwarded-Encrypted: i=1; AJvYcCWXvlXgoU49Cm2WiXASQqvrpUmSGUghmqlkFUSy/WQnIOhxNT6ST0khf20Si+7v17U+10xGPnPJl9TrBgYB@vger.kernel.org
X-Gm-Message-State: AOJu0YypoWBvZ3gLC+3iT3Xhe9jr4SjijXiRFlUKKdSFIx1Pfq/OHgKM
	kUqI7erdap33Id9rSixzcJ7D7R2QJr9JhfzrX9V+t+4PQyWwqoIlk1ZlO75C+mY=
X-Google-Smtp-Source: AGHT+IFOgPssWZsDH1j5T86iLoVp1PjuAQf1YJ308gU5MuuoGMyMeA0iydRzzX36J0FJAIprsNb+6w==
X-Received: by 2002:a05:6000:400b:b0:37e:d940:a9fe with SMTP id ffacd0b85a97d-381ef746475mr362301f8f.13.1730982316616;
        Thu, 07 Nov 2024 04:25:16 -0800 (PST)
Received: from [172.20.144.41] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea5c1sm1625361f8f.81.2024.11.07.04.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:25:16 -0800 (PST)
Message-ID: <0ce2df56-85be-44da-af23-cc5bee98e14d@linaro.org>
Date: Thu, 7 Nov 2024 12:25:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
To: Imran Shaik <quic_imrashai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
 <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/24 11:51, Imran Shaik wrote:
> The QCS8300 camera clock controller is mostly identical to SA8775P, but
> QCS8300 has one additional clock and minor differences. Hence, reuse the
> SA8775P camera bindings and add additional clock required for QCS8300.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>   .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml    |  6 +++++-
>   include/dt-bindings/clock/qcom,qcs8300-camcc.h           | 16 ++++++++++++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 36a60d8f5ae3..81623f59d11d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -8,16 +8,20 @@ title: Qualcomm Camera Clock & Reset Controller on SA8775P
>   
>   maintainers:
>     - Taniya Das <quic_tdas@quicinc.com>
> +  - Imran Shaik <quic_imrashai@quicinc.com>
>   
>   description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
>     domains on SA8775p.
>   
> -  See also: include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +  See also:
> +    include/dt-bindings/clock/qcom,qcs8300-camcc.h
> +    include/dt-bindings/clock/qcom,sa8775p-camcc.h
>   
>   properties:
>     compatible:
>       enum:
> +      - qcom,qcs8300-camcc
>         - qcom,sa8775p-camcc
>   
>     clocks:
> diff --git a/include/dt-bindings/clock/qcom,qcs8300-camcc.h b/include/dt-bindings/clock/qcom,qcs8300-camcc.h
> new file mode 100644
> index 000000000000..fc535c847859
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,qcs8300-camcc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_QCS8300_CAM_CC_H
> +#define _DT_BINDINGS_CLK_QCOM_QCS8300_CAM_CC_H
> +
> +#include "qcom,sa8775p-camcc.h"
> +
> +/* QCS8300 introduces below new clocks compared to SA8775P */
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK				86
> +
> +#endif
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

