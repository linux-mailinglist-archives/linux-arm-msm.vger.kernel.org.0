Return-Path: <linux-arm-msm+bounces-87762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38264CFBF7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F7D3030DB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602BC242D67;
	Wed,  7 Jan 2026 04:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0NDdT+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0222A4EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760040; cv=none; b=Wahzbo6jHIMnPYozDCPq6nwITcTDE0d+JWyDxawRAv/pc+gEeBqGXOOpBZ09ke+pTLRo08GQRMh0NujvVIjm/B64pCJ6SjFQdL+arBCRq+LAO67Kx0UN67Uii1d8V+lO9pFrh+vZEHkdaO/EygauJ+MPp43cP/wrNX6qRG8zZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760040; c=relaxed/simple;
	bh=piSehSDmE1J5QYtNOJHnlef8sfhUD2kJbIeqpKVVcKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lza0yY+u/Sf05PWXWvfgx738HTWWFS76UHUwtgdyszPGwWnGSP0mo4v9emjbaY8tr3xhkcN0u0UQ1yAANMoUTL+qLo9c3KX3MQ/7XDqupqRcYJACWZlCP3jKUtV8ZdSuxnXsLaf573rUg0YsPqZC2jhpmPqAzySp/ulaSfdOKd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0NDdT+7; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-382fc524cf3so1394041fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760036; x=1768364836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/GmMP8nrQC1hfCtu8mHAhdt4VRVlDbgu8rN0Ly8gUA=;
        b=Q0NDdT+7cZ9+Mqh1QZHn1x8vH7H8jAxSTmY+MSFFNuCYIvNuSmEgFqVp3GeTnB5MSj
         lL53itWk63ZZUq28LXrhkGzBzQZ7nJxvBC1E7NlDM7ZDBJTArIZw5kFnkT3ZhMQ+0YPs
         2Pp6vIqeayXLUSd0SGtmYYAtpBLTbpnON1JINzMqG48S04MizCkHlZ0M/ogKjLsyjxWr
         ur6GCMrkooULonTLA+JS7MFcKOkc16YK+6FIEyolim9kNF+vrjqNjrMZDd+i9KMH5BzX
         6ueC1CfX4XwHZcfiP67S2SfH37MHEaTuzNfI1yqQYBst3p8zLatuQg8GnVdQ6/nLog1h
         DS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760036; x=1768364836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/GmMP8nrQC1hfCtu8mHAhdt4VRVlDbgu8rN0Ly8gUA=;
        b=iW2nQcM2dHnlxEJd0Uccz9k0r7aEXFHfUl/XKeLBuNhoaQdGvVcqshyJBB6MNxMSuj
         4aBWci0ljJq7dk6kHWqu9E4J7jRdm743v1phkHBeGvpjqJsN6x+Dvo+fgTJKFoIEVMyh
         is7vgT+GHc4es3funuxJxbt1NxpTrkAo+zwJif7yGX2Kv8KIi/BIk+QAEitKpkuoLHS9
         rYpdGea6o1R+lnA933+PGFH51omuhn/+zCT3yhBuLQAtwc4qcirOn6qkbpnGXOg4mxO/
         pv6RF3TJDFFNa0mqTd2Lu9kMNTaQyuDWGQlqmN6LmCQ8DzyGfM+KkpPEs8yNZzPVBLMN
         KTeA==
X-Forwarded-Encrypted: i=1; AJvYcCVy38LRIxp/KJqelP38/B8rA+56tgfpdIFclMTLjoXNxmYS0fo971fX0+XTpbtzzK+T9vN9brSrV4zYLFUl@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzgF35CtqGofh7lTiJZSs/nBbvCTRpFUI9SBHsXXGk+CCX3l3
	siab4+LyydJnNTz/8ra2jPXMukOocMQPGVmUFoff8Rkxu+iB/saKp8CzyyVfDPZDoaY=
X-Gm-Gg: AY/fxX70pFi5qCFtKGTJaEetnD6Bxzcs5Ob1zrz39KwsjXSgB+1XbsV3BDVzNnFLXfi
	IvKF1EU+Wjogj4D9ApVgQWSRnDvBTyo1vuKPaqG/bv/twvXsnr3FPWIQj5rLD7UbllbZAmy7Ia5
	KuFq9dggnhkZN+eERUpXX6urmvlxMoBwr9diWqcYPOMBjwS2Rg8OGE78rFhIhetKHp9XPm3Xb+R
	UihUTclGecaJ9dhpagelmBgqFfKcyFR4f42EI5yOToH1PqU6Wg1OcJqDqz+s1Oijv5JzJMw5/ZX
	W9JfZRbgVBxjlPk51AcxfE9AoQaBscDkZJtogq9d7e3r7DFipdQ24KAMFzYitNPZeae+gRabnjy
	okBC1oyjc4TVY7oP75fflGoZAmCXtdyIbNshBULhZNIZdM9zhslakHR+PoG/ZIJeJaJaZnzHD7H
	+6dGaW9K2BfREgxIQzF3nsYrL9fJuWJAdCMPbzaJfK0cxnm6m9Y+2/fmqj6lD4hN1DLg==
X-Google-Smtp-Source: AGHT+IEGzLXnBc24vjmCmiFUscHl2WnDfpA2MZDZ1qBws5ysoDEqtjI0ZpUgvn6eyNtW2hRKVd9R5w==
X-Received: by 2002:a05:6512:3d86:b0:594:2a33:ac17 with SMTP id 2adb3069b0e04-59b6ef08358mr224542e87.2.1767760035577;
        Tue, 06 Jan 2026 20:27:15 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eaacsm83852e87.40.2026.01.06.20.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:27:15 -0800 (PST)
Message-ID: <cc8f93b6-0fc8-42f1-bda5-fae20d576673@linaro.org>
Date: Wed, 7 Jan 2026 06:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:39, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
>                 - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
> @@ -263,6 +264,23 @@ allOf:
>               - const: cpas_ahb
>               - const: cci
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6150-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: soc_ahb
> +            - const: cpas_ahb
> +            - const: cci
> +
>   additionalProperties: false
>   
>   examples:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

