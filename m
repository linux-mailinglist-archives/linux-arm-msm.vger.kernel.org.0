Return-Path: <linux-arm-msm+bounces-71139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B49DB3A187
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A691882B95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893BB1A23AF;
	Thu, 28 Aug 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqlIZZOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA87C20110B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391084; cv=none; b=pEV1mt2Fv/HLn9SgoGHHQdLWaaPF61n3bGuqJIV4E/MndLK8gD0dUZNsoFUSFcNOSj5VWLHEQET2fDhJnhLtGo4zYb2BsxOfiY9CbPKvZbww+fAYzTPePI8Q+iUoVtpI+ygrGW7j4l2S3IemAo8IOUozVVbHV0VtlDVuM194sPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391084; c=relaxed/simple;
	bh=/FUZ3GPbSoHCMLnSSqyt2z+YmIiFI7VibbClJvvxduQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QdBA8EPRgFMGizzsYCp4kI180kUyZMMpi8gkf5f2LBNQ1IrFlAOzd7P4lWCSZWO61zMHNGyr5k6YXavyzO2XUETzzxvTk/X8OALK1Z7/svo4SFqMATOduFOOMNBgnYKJMF6sNYfYkF2qrUFytzP6Nal6p5HKsC5WfT2GDoPbvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqlIZZOH; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf6fso1852259a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756391081; x=1756995881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zQUneuXaOfUh+xTN94Xip4u0CuKfuimGc68GwyO7co=;
        b=lqlIZZOHTZZ4xnW5Jelr/XU2Km2WfJUvHfQi0emQxM1RN8qSYHX5ZJSsMLfCqfDnwf
         UOMod4sjvwZpd81O/N2etmRRYaOpLPDP1SSMj2g3y82T5ufgvFnDpO7Q53z8DuKtvHI4
         h0o2CGP+gQvZGFUgDG4JI5OEjGKt8knAARZ+NDXoIVQO1vFFb3H122Wx1o5VACwITD8y
         txfvi2kbwdHxwJo2trD2ImvIK+G/2zkmzYfnvsJihtTkjtDT7l7Cc2tda7TcGzvh8TAv
         TZXzzl+bRqR67i3SWJt/pbYx+4eLAMC02yPWqXuAjOs0yC1tfkGOajbCHoYP1EOAYU+/
         RNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756391081; x=1756995881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zQUneuXaOfUh+xTN94Xip4u0CuKfuimGc68GwyO7co=;
        b=BRuLOAzuXmMjcyBcecPBw0NreGPTplQyEwB/mifBOFHimwcoriaMfHw1wr9EnTyAFf
         4PqU4d/Wu1e4VZUEnq2OmVDbed+KQ37ToRwxvPosX9qWjoCEJFCPEe/FEL5jznKwa85V
         kmKYDVw6X4Wc6pNfuVG/sfzC9Jst5mNUfs6198HxHr+DR69YYSjk0KpqRipUqRrHCAuX
         BLG+LT/RnD/kYf/x1+jnTA+WgmAYsmJJVdi/28ExbzCj6K00J7CN8/7zwey9GCcawwMo
         FQxN7qSf5LaQ5lxlZsfgGRB/CDxy7ah7JaziR/wT75K56v4fzCD7RHwOnQeNSJLXmRPn
         n30w==
X-Forwarded-Encrypted: i=1; AJvYcCWYGkUGBohRgkCBzhU/If/pEhVt6vS70jD2k/0gNYUWkspDvFTnYFV4WVILKKDE5rR+ZEj72nzZCmZGGnBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vjfZ2qowtb1z8LcUdWVsECHmsEzeLrbg3h3X5XB2udG7gV/V
	+32JrNpPEpOJMWt4xs6QtxJnTh/z0jsNB4uKP33Ff4q1kh4jXt9d65PQwYKuokxquAE=
X-Gm-Gg: ASbGncvLqWqngxeDowKdFqXuzh9cVismYDNisseKqetTB8w4wYcxbNIqlHFKz9YmoQD
	HTVRuOnPFLc5exdM0sTZN2JolZUOykYvehkchZ6dRyAe5OuE6p2X8qHg8xjmlGT7D3Y2BE8AKJ5
	NW8bzjn+rLelerK0E0hyUGI6J48ISSRRr+PEc23ooLQ83+6MHOzMNE0xaPuvM8aGrGFxT+csu9Q
	76JdNMSLLyTwVkoauzoABxZMdT5AbtrTvSg4O9CyV8WhhUJsV7Uk0uqOx1GvwEaPWgxFYue4S0C
	xdt0ZDsO9FRWMNpZGALofFWBrR9nOXBu10+1bcWzBzGa1e2jYje8iWTxxNAejQxfmLQS7ugzvCi
	glQ/zFmMN0bqCvAbRmQPoMlrPfudsKRBG4ynWo1eXaRmAqSH4ZT/wrK83TscRx4lWvQfgc6EqVh
	UGyQ==
X-Google-Smtp-Source: AGHT+IF1vN7HT36zey49ZEbRrWO4fa06Ex/wR33zWhhQXlp86FpsFXiY/mB0hsHLpGg2OthL7HWsng==
X-Received: by 2002:a17:906:478f:b0:af9:8d61:2651 with SMTP id a640c23a62f3a-afe28ec535emr1937046766b.9.1756391081186;
        Thu, 28 Aug 2025 07:24:41 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afef7489f8asm44327966b.69.2025.08.28.07.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:24:40 -0700 (PDT)
Message-ID: <a9c40b7d-d70d-48fb-b4a0-deb773969936@linaro.org>
Date: Thu, 28 Aug 2025 16:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/2025 17:53, Krzysztof Kozlowski wrote:
> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
> it comes with its own Iris Linux drivers.  These new drivers were
> accepted under condition they actually improve state of afairs, instead
> of duplicating old, legacy solutions.
> 
> Unfortunately binding still references common parts of Venus without
> actual need and benefit.  For example Iris does not use fake
> "video-firmware" device node (fake because there is no actual device
> underlying it and it was added only to work around some Linux issues
> with IOMMU mappings).
> 
> Stop referencing venus-common schema in the new Qualcomm Iris bindings
> and move all necessary properties, except unused "video-firmware" (no
> driver usage, no DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812..320227f437a1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -26,6 +26,9 @@ properties:
>             - qcom,sm8550-iris
>             - qcom,sm8650-iris
>   
> +  reg:
> +    maxItems: 1
> +
>     power-domains:
>       maxItems: 4
>   
> @@ -45,6 +48,12 @@ properties:
>         - const: core
>         - const: vcodec0_core
>   
> +  firmware-name:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
>     interconnects:
>       maxItems: 2
>   
> @@ -69,6 +78,9 @@ properties:
>   
>     dma-coherent: true
>   
> +  memory-region:
> +    maxItems: 1
> +
>     operating-points-v2: true
>   
>     opp-table:
> @@ -85,7 +97,6 @@ required:
>     - dma-coherent
>   
>   allOf:
> -  - $ref: qcom,venus-common.yaml#
>     - if:
>         properties:
>           compatible:
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

