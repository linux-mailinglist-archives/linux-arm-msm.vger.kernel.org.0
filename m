Return-Path: <linux-arm-msm+bounces-52120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45AA6B011
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 22:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D46188A1A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 21:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044AD227EBE;
	Thu, 20 Mar 2025 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcDeJcgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2D221733
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742506992; cv=none; b=sF1xSHW1jVM3mEqHVBW/bf54AWLHF8LAagx/WziJ/DZOJrluGx6IqY6OvqzgJpXrEHbNfw613tryesO5z7x4BnUR88oRSh5NcGrQhIdC5rbyngOiub/pBLv5pA6Is+JcUN1G7hlsjeCPT6993LhEJjJCpWDMXA1XjERBjNMiY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742506992; c=relaxed/simple;
	bh=mOnDqgj0BSZmK+Rt4jod6O1D9Yk05JHk1R77dSq+p8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzlK49/T6parJCJZy86jbU3IIziqI/iuHsDkvRi9SMsxRaP/F6hh0AauxQnjSd72lYCGq9bJ7HgcgPupkHLtrQ6UjTqyMAAGaIFdhNiae++863XaUh0olKg1Y8bdEUVj8ns3CcvsB2y+awKX1PClr2l2dTOrTibJWy4jnr7Wbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcDeJcgR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso7482735e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742506988; x=1743111788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=LcDeJcgRK/37MHc62RdAnHClLMYusE5uKEMsicsMNd5mLfpjBaBmpHKP72M/iNu9Xt
         C/8uhLWqJ1D4kvhcS1PDswtXVe7YlWTV7eT2GbVD5MhuX3zYq6i808HZjf6z9JZ7XAn/
         YE8YDJHKnNSiw8VE5jaZ39pnrYDfLWR0XYilRJXFNirwU+B1WwHelz/v6hB1g+Pq4MKm
         38pcP9IrrKmwH2FnIZS7RFTm3170ySP6IDBjmHCUkIDK8TKwzxvT9RqGDQAwSHsNxq39
         C7cP6+8dLoLxqbB3b1h3AuDayyZ5PoZPjgFQIjtGO6yacCCQC5ZZzT+k3Fn/yafddI+d
         kktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742506988; x=1743111788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=urKnHsxSURGxlYOm8A5jL5bKAGw4qYlw67KHa42fr4AJaQcAYqA0ASA9Q4EuHLIbMY
         Yxqq6kyNjV7CJL8Md/kY0Sy0gPdSYG1cEN1/vWvCOEL8ns66TwpLCQCuacefXSCpAiBN
         uy3PMIlqQ6yqjBIOz9qC+LyqA6mogdx/chXLKX8ADMI8Q8Y2z8Y5+FyFuasMFxk7Es/f
         3XToTuNCcfgaC8DFaAVY2iVxkjI1REOUwTIOKqOXBGRCXZU5gj7/c9BhIOpEo3daV5Kh
         dS+KoIOvbGou2bDPDYWfkasj8uVo8cIwvt63/lE1YL4ZWSUZ5mQgDk5Tl8RpCEiloRg7
         k22g==
X-Gm-Message-State: AOJu0Ywhs7lth4WS6rmmQT+a6jULFw3aYM7A+miAenFTM34R8XI5Y04b
	Hfda1NY9e1BAGikIdJBnYu6LXFxfzl/m+O9j78eqObgx8XHdrydtHPM6yx4WF+g=
X-Gm-Gg: ASbGncuIjybLZiI/YsLIsloPShB9Osqnu63oOjpgGky3VI13FiEHk7XnV8MQ0MjE80L
	C9EDO90EZHWkWOUt+l6pdJbf7XZ+1BOM6J7VZgdOQS4lL5zqq9S6xFIA7M1HBFgMXXJ1o5PdvfZ
	drFZc3ssXLrihZCfZuCdC+gKrlsNwEc60taWIJfur2FYKVpE1WvfL0BNd1fjjQNHPkLiyVXfx0k
	wtaQU+aTMQ/bwCFh8CGWBQRKzjRubSWOTdhoSMNZ5IIsTlYGvmiX+uJC6nABdwLzSSiMCM0DCeH
	fX4NpwDPbEmIJFJBRoCqFpa/1OsqVFWJng8jfqnM1ll7EKeOvHyTMoQZwt3kfnIiztXOiD+WTsQ
	XKhy0JEKkFA==
X-Google-Smtp-Source: AGHT+IG2v9hD+qLxQZ7dB2qhp9psuK3BMaWVUIJWRBgogDgcd+kbFyDF5hYm0wlh8L7Kn30Jqwwm2Q==
X-Received: by 2002:a05:600c:1d85:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43d50a218bcmr7262695e9.19.1742506988494;
        Thu, 20 Mar 2025 14:43:08 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm61164645e9.40.2025.03.20.14.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 14:43:08 -0700 (PDT)
Message-ID: <fa4a62c8-8373-4dd7-ad4c-e8668d142e67@linaro.org>
Date: Thu, 20 Mar 2025 21:43:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 sumit.garg@oss.qualcomm.com
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <uD9su4uJAo1PBanhrBSliY8k1KZvid_UHJJu8OYLgugkOMHBgQaYSpv93UpTrJoAzgsUMH-HomFg78fes-aqQA==@protonmail.internalid>
 <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2025 02:54, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
> bindings, hence SA8775p is made fallback to SM8550.
> QCS8300 is a downscaled version of irisv3 and have different hardware
> capabilities. SM8650 is an irisv3 with different (higher) number of
> reset lines compared to SM8550. QCS8300 is yet to come in future
> posting, while SM8650 is posted as
> https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index e424ea84c211f473a799481fd5463a16580187ed..6a89e9e3808758cfdbf6a51dfb9fc6559864253a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -19,7 +19,12 @@ allOf:
> 
>   properties:
>     compatible:
> -    const: qcom,sm8550-iris
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,sa8775p-iris
> +          - const: qcom,sm8550-iris
> +      - const: qcom,sm8550-iris
> 
>     power-domains:
>       maxItems: 4
> 
> --
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

