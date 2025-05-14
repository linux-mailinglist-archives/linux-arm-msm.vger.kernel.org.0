Return-Path: <linux-arm-msm+bounces-57788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026BAB6251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46FEF1891658
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 05:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8621E834B;
	Wed, 14 May 2025 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVihJdk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6141A3EA98
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200509; cv=none; b=YlZlDNOxNfB7EFco++9XB9D5ohV622r+r9LM1RZfH+L7FHO9OJuTLPC/ZjLwlSEMcR+l60xsRPaVs6+TNsp+bTzEopPMSBSKllIZYWcTqbaRNXLyPBu1RepjVjCnaseF54tSBbEpYknSeONu8Sa+iu8iN/W5oHirvKjHnStTrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200509; c=relaxed/simple;
	bh=JkeFk5JvtELodwEn2MQCcvDJk93HA88o+taJ9J75Wvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1ipJ6uJpc08fFV1tmIvXmi6m9kB0qnLbk/AnWjXjSvGxCun1JesSEZH+GuxUPsolTgvhK5jtL+0zPZHeN64lLNAQtI3rIaWALzeYKVh4yIXVnomVHrrow4idhgdgkSj9ngzMNWl3pZ6QZDIkIjErqrcHy12Gkn27x1z616J9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVihJdk+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso12169605e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 22:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200506; x=1747805306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=dVihJdk+ifDgF3QyP8rRJJzBytMIYTapriOYoM6ZnyTuWmSF9CQhG4Y58jNjQKeI7f
         XvjQ3XBLfV3pq2TG9L7oFn91xIfnX5ijcey5ajzes8LcebC0CPRlziYwkdp+E2Ya7P2U
         OivLsOZeUx6v+eTBFXLwSIaZwi1gU/AjeKeqc6k87HbEnID4mlPTdGvpg874bzXh1XXP
         npceKV8lSYqFWgdu0afboQMPVWMfoFOwN02kNhOKp+kifGZWOsPMFWDHJkdC5uXaFLAQ
         RAlNBR1BOF3Q/2bSLJIZda0z7LqT3SkqFqwiYt4lE4ROWzDyNpYP25K5hgUby7suEnti
         jaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200506; x=1747805306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=HlkML8lf2pKUfAdo4JMxBJdHCBL32FxTPaGXVm52ZAwdQROUUUEKkIrU0cjKW0mHVQ
         8d2QpNeiwTaDr4zoRE6AQiM74QSJGFYjZEQl+qC5qatS3FWomBhCpZL77wf+Lem/zwZk
         xAhxybFNPbgAspPkSztt4n9h/V4gCXvkTjjWP+rjjBfqjvNTQcq5RnWWZfmxN36mdJWZ
         M5JNZ7oBPlVLlzYKAwpQlJC/kJsORBXAIFdEOUCvON3wER+lXSpNu8Lx8mH40Coj8q4a
         6DFCFkrNAAg6kcibXVfsVQgsg4GjfIZcaDJY5kI3RzCxU5saHiyWfDzl2t//2fOOSDTe
         j8Vw==
X-Gm-Message-State: AOJu0YwNeasBHqN00OZHvO8KqF5fziu89ef/zF7uJhQ22WS1EWk83SwC
	HqWVVpNLAN+wcXezrqF0A1xCOyOAw4XkGkLshfCCFyeuAbLUw9//64JtM2IPf8s=
X-Gm-Gg: ASbGncvnHg9bs3NILoGEcNa5yCjI9Ke8aat4l8JTxZl07AACPcbn3BrPMfbA6/kXr0X
	tlv/5SRODxN5lUMzWOC0evoAz47cjnitQmcILDMNaoCIpBF/yv4JFSG2ltHxfMYPpwtMa4tohqz
	Y4ooXAHmANRvCwGgtvUGQJca/Ym0qFUDq6471+gZ0RjyvQYFSC7jn+H2C0VkjcqTN4f9BRvKqDL
	HEiwL//SEiQfOugz9l6oKm/cqoUaKXbtz4kDjkZIsCwlMfR2o+YzQ9G3n8uxEQzpKPL9IMYnwa9
	DWmfIKtngAZDUrtnPZUgV6IVHTs5Uqco2+KDySSwuuHVzjmO6al+bY0W1q+xYFJcBru2ocMwT7e
	mO3FnDRfNFRlK
X-Google-Smtp-Source: AGHT+IGR8fcXwr8UrIba7uq3uRKgiVAoO7flrB6Ax66vVZKivN1s8Mt+EFttdNMqYIyUx78KHccYtQ==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1286717f8f.22.1747200505555;
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2e9sm18279823f8f.75.2025.05.13.22.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Message-ID: <017682c3-76c6-47fc-81f2-1da2a22a9d34@linaro.org>
Date: Wed, 14 May 2025 06:28:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: camss: Add supplies for
 qcom,sa8775p-camss binding
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add supplies bindings for qcom,sa8775p-camss.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 083e1193c474265edb445dd30717360de57ff986..aba46c0bc11faa062199f563602494bd2f62367c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -125,6 +125,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -164,6 +172,8 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -343,6 +353,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;
> 

You can drop this from your next submission.

We are fixing the PHY schema to give a 1:1 relationship between PHYs and 
their associated rails.

---
bod

