Return-Path: <linux-arm-msm+bounces-12997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF886D12C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 18:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66DA81F226D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 17:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD2D70AF7;
	Thu, 29 Feb 2024 17:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n20hxP9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB0757E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709229233; cv=none; b=ECRPQEOwBacB27RCBogGJtdueZ3/6hJ0PeVw/Cyj53EIcFCUrtBTzPz/8YjETPReTXsBoeTV8MvK/dsBuAetj4CFs6urFR0pnUqRZkY4vYW+b+cblPvkX1Og/iSpLa3/54wEeZ+r/oacvJz1wz+7E6uxTCKuaYikOh1788rDqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709229233; c=relaxed/simple;
	bh=zBqfNMYVF5/JiYjN86izYLCeDLHWsfJLi15L0WBi6Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4EEkENt+HQutJ9mlJHLv30WFOIsV8U1ATOhE+vR9rwvTdYzURfpGhY/iQBHAWRGzx3P5FcGWZUFITRU36LmEt1z6mLlTpgPloPI81vjUAi5Q2ZRogaOoKkMmoSAkvpBlejllij04LusLQr289vy+hu5RenwcrAqhnm4wWbWtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n20hxP9m; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so2066473a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 09:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709229230; x=1709834030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfoGmIA3EXLESsnrc37tloaAWUC/7gWzQvgxYQosHz8=;
        b=n20hxP9mtR0yAvDtIAzWv4rAuq9LNlnSWJbUZGhpXGxoxpNkBSrIdQixkm/9optNQB
         TNnhkRmfYbM7A2FR0WvzpjEIu/KG4Jw3e8Yesi/Jzlgcrx+MquZE/LTBNj+6z+VNRZyk
         S/cQutI8uZMhXvUNs3N/4r5tN4cLZj48XyuB1kAUrr8a82DsgGmwu6CO883032/sUdHT
         DbWz2KmizVWl2ddVY+ZQsxzjW2E1PEBWrNU7cl/aCx8SZFx7sXDJiJsnWwG9eQIDeAi7
         PKzwcN5OPtlRomQoUNAEr297nAjYb5UuTG/RLuWr3ZpfxwknAY58O5Wkw5DlySRd0alW
         +QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709229230; x=1709834030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfoGmIA3EXLESsnrc37tloaAWUC/7gWzQvgxYQosHz8=;
        b=AhNzPdj7esgBeZHsfSHr/6U1f9eem4/J/zVPD+2rwLM+7mukGAvIF3ZZv7NTvjtS/C
         Q4To5JIP5yUtXUtalvATyWWOCtMlRxiQuZ2I++8rwIX9ZVaC22mImykBQ2InKWt/rT1Y
         BEudMdopKcUF7LWoNp+jGLVSlNKcvgvrMy5G3el+pQVxnzOjk+J3OVykMik+arJOOiSO
         8MBOdQlvuoZ/GvT9vKCkDTbDO/qwmbWVxS3W8aTXjcVeOe/O8vWRtAFuLUEd+yI0ZTOQ
         Td+1bVhu2AphWCWVq3r5ZviO0+gWOpuhQ5bKDtRl0c3zaggyqgjL4zHcNKoTg1InA3Cm
         HaEw==
X-Forwarded-Encrypted: i=1; AJvYcCXLigPWGPN6HoV00M5RN7bphcvDyEKG+0HQTbZBIA3r0ROzSKGI84pBxqQ5efllX5RYloo1yWvs9ugW46dXw7bhDMQo+7MgKdGzy8zoow==
X-Gm-Message-State: AOJu0YwnSQ2GjYvuIFmolHpB4xx6JOOkhf22apWzpq7HChOw+tQgYDnw
	D0i3/dJZJBCPp/QeyUWNox2SAX/9H6WOATYJceIkO1WdqiO8EiOreBaDH2UhMOc=
X-Google-Smtp-Source: AGHT+IGVLMaC14/+PftipvYzEtNgHcVPIokxbS5gRXWbo8S3+5pXOTZGSppDpuWEK/paubEq7vg70A==
X-Received: by 2002:a05:6402:4494:b0:565:7bca:eebf with SMTP id er20-20020a056402449400b005657bcaeebfmr2313985edb.14.1709229230199;
        Thu, 29 Feb 2024 09:53:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id r15-20020a056402034f00b0056686744752sm809679edw.37.2024.02.29.09.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 09:53:49 -0800 (PST)
Message-ID: <b6215fcd-29fc-4495-999f-b7b03b36c087@linaro.org>
Date: Thu, 29 Feb 2024 18:53:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: iommu: Add Qualcomm TBU bindings
Content-Language: en-US
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robdclark@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cgoldswo@quicinc.com,
 quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com,
 djakov@kernel.org
References: <20240226172218.69486-1-quic_c_gdjako@quicinc.com>
 <20240226172218.69486-2-quic_c_gdjako@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226172218.69486-2-quic_c_gdjako@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2024 18:22, Georgi Djakov wrote:
> The "apps_smmu" on the Qualcomm sdm845 platform is an implementation
> of the SMMU-500, that consists of a single TCU (Translation Control
> Unit) and multiple TBUs (Translation Buffer Units). These TBUs have
> hardware debugging features that are specific and only present on
> Qualcomm hardware. Represent them as independent DT nodes. List all
> the resources that are needed to operate them (such as registers,
> clocks, power domains and interconnects).
> 
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---
>  .../devicetree/bindings/iommu/qcom,tbu.yaml   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/qcom,tbu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,tbu.yaml b/Documentation/devicetree/bindings/iommu/qcom,tbu.yaml
> new file mode 100644
> index 000000000000..6841ca9af21f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/qcom,tbu.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/qcom,tbu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TBU (Translation Buffer Unit)
> +
> +maintainers:
> +  - Georgi Djakov <quic_c_gdjako@quicinc.com>
> +
> +description:
> +  The Qualcomm SMMU500 implementation consists of TCU and TBU. The TBU contains
> +  a Translation Lookaside Buffer (TLB) that caches page tables. TBUs provides
> +  debug features to trace and trigger debug transactions. There are multiple TBU
> +  instances with each client core.
> +
> +properties:
> +  compatible:
> +    const: qcom,qsmmuv500-tbu

Why we don't have SoC specific compatibles? If that's for SDM845, then
it should be qcom,sdm845-tbu or qcom,sdm845-qsmmuv500-tbu


> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  qcom,stream-id-range:
> +    description: Phandle of a SMMU device and Stream ID range (address and size) that is assigned by the TBU

Please wrap it according to coding style, so 80.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of a smmu node
> +          - description: stream id base address
> +          - description: stream id size
> +
> +required:
> +  - compatible
> +  - reg
> +  - qcom,stream-id-range
> +
> +unevaluatedProperties: false

This should be additionalProperties: false

> +
> +examples:
Best regards,
Krzysztof


