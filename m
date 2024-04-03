Return-Path: <linux-arm-msm+bounces-16210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A308965DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 001611C21F24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8E755E4C;
	Wed,  3 Apr 2024 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ql6c7kxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6958ACE
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 07:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712128566; cv=none; b=gzvxhOfkeAVo+8VABOlRD9IRwmDybYiJ6A4Kc+ML/sBSnAhXoD1J5wH7fs6A9QDJLeXDRR0nU/DBaGLcB6GusZvVDkXrTDbNSBhCbfhPSn/IsMzsEHWIw5IJM+qNZ/tdpb2Sc6VtvQ2Tdvu4lEeT0IJlyyqRscHQscQfp9Ms73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712128566; c=relaxed/simple;
	bh=sfH1fVcpMZaqkAVrXCyMTevsxR23JzU6mwY5iKqTa6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uA5LJ8CjE3BP5RzckZFAN1gIYwIdshdqYCKZTHNghusZHpgvpsLnYe6rGTQNuMMt+0pUdO6Rjs9uTWBINy1bOMbEtPHXeR9RTEL12AiMzL5TqzhzlMx9Dxrv7/mtntlw9s6jHzFTe9GKfNpDwN6dQBHHmpVZfoILnwlIqMk/Shw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ql6c7kxz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56bc8cfc19fso6386023a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 00:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712128553; x=1712733353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CdsWdu2GvTItN5GazbN+3i1C2YVB/RZnYUwLLHX1mNc=;
        b=ql6c7kxzvNH2k4rQbhT67nL2HxunmHkJJm/JaUMFyWOXM/d6hoPl0isrQcr1c3ofCK
         BFxJVtncmEBCWOAZDGgDbTmFw6FriNgW+2QA1yaLj2zCB6O/vx0g+D/aqH+B9bzH34zt
         sheL7PcN05YoQuR2hjqf1wnl7WOM2SVO56SoVQjWXp6ZHNMU2nkB9mTPwedvnvLp/3W4
         EkV84Y88c3RSUDuOTKF7cSzLamdcBEtdB25xLxsKnL/EPNkPfMSq9Q1VB31MNYntTcux
         BAp/mANoOHIe47ZooFX7QUgh1KqocWVXHANyCqOk4v9hkFJO6sAqPCtSVRHRzvqu5ICs
         4AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128553; x=1712733353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdsWdu2GvTItN5GazbN+3i1C2YVB/RZnYUwLLHX1mNc=;
        b=Ky+v+Tl29Bcx8TAue52mSsAQln6OxC2CBf8RkOw0r/eKg89q/C0NibYn0uVN/XyHZC
         inI8jwvcklAHM+rzGy3VyHRkB4Lo2Bf0hiIHxG8F6AUhTHWGccU0hKCq0dnsjL/4RiUm
         FD7JmEGjLwss0OX5Bze1bgwTuclrwb7xHVT5m5h0cju32WeDzHkO+g7OoiEGSQ2MmWpT
         4/Im97UimFxNKTv16fmyNLkaEuxKzxxeqsbhaSZqB2GotjqF2xgcrb45yqho2+bS8cNZ
         6g4aWKB9MOGFY4n7pBjdyyNdaZbjfhIMy6T0qt9KgCHYwtH+aQ46qnOsVObb1DmFyIQR
         69DA==
X-Forwarded-Encrypted: i=1; AJvYcCUKwIClmt9PAqBwl4zM+WpjVjpm0vmNeUd3rwreSm1IRGvW7eEkQy1RNtFyRq5UdfEwtlJg4/JT3gFFJ33ByJ2V8G5+WiXjyWXTD/X7VA==
X-Gm-Message-State: AOJu0YzQYKeTBdOW1cPm7FFMtHIQqETo+y9i8cxD2oxEMxjwkvhX4Ab1
	02GcTczxSnr7DqwliIOsAZ54yXoaqCy77YZUJYIEFtKxAwo/UpucKTfghE7sKOk=
X-Google-Smtp-Source: AGHT+IFZV3jDZkfBaGKYy0xfPr9fpENgSYfKgv0EP3IMvf0ecDDaVbHabuKXU07P352uBWWZJQq3LA==
X-Received: by 2002:a50:9f06:0:b0:56b:9f7c:3c32 with SMTP id b6-20020a509f06000000b0056b9f7c3c32mr1243861edf.12.1712128553425;
        Wed, 03 Apr 2024 00:15:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id fi8-20020a056402550800b0056c509a11acsm7592367edb.33.2024.04.03.00.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:15:52 -0700 (PDT)
Message-ID: <bfcb5df5-79cc-415d-b224-06887cebb6f6@linaro.org>
Date: Wed, 3 Apr 2024 09:15:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] dt-bindings: phy: qcom,ipq8074-qmp-pcie: add ipq9574
 gen3x2 PHY
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ansuelsmth@gmail.com, robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240402192555.1955204-1-mr.nuke.me@gmail.com>
 <20240402192555.1955204-5-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240402192555.1955204-5-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 21:25, Alexandru Gagniuc wrote:
> The IPQ9574 gen3x2 PHY is very similar to IPQ6018. It requires two
> extra clocks named "anoc" and "snoc". Document this, and add a
> new compatible string for this PHY.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 47 +++++++++++++++++--
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> index 634cec5d57ea..b0dbd2726acd 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> @@ -19,19 +19,19 @@ properties:
>        - qcom,ipq6018-qmp-pcie-phy
>        - qcom,ipq8074-qmp-gen3-pcie-phy
>        - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,ipq9574-qmp-gen3x2-pcie-phy
>  
>    reg:
>      items:
>        - description: serdes
>  
>    clocks:
> -    maxItems: 3
> +    minItems: 3
> +    maxItems: 5
>  
>    clock-names:
> -    items:
> -      - const: aux
> -      - const: cfg_ahb
> -      - const: pipe
> +    minItems: 3
> +    maxItems: 5

Just grow the list here to match ipq9574 and keep minItems: 3

>  
>    resets:
>      maxItems: 2
> @@ -61,6 +61,43 @@ required:
>    - clock-output-names
>    - "#phy-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq6018-qmp-pcie-phy
> +              - qcom,ipq8074-qmp-gen3-pcie-phy
> +              - qcom,ipq8074-qmp-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:

> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: pipe

Only maxItems: 3


> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-qmp-gen3x2-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:

> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: pipe
> +            - const: anoc
> +            - const: snoc

minItems: 5


Best regards,
Krzysztof


