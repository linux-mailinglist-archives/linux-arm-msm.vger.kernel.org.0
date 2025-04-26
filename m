Return-Path: <linux-arm-msm+bounces-55821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C3A9DB59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 16:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C21F5A7BEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 14:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED83825C6EB;
	Sat, 26 Apr 2025 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axSbnKP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243A25B699
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745676214; cv=none; b=R5XCUXum+Z4c7LiTGRXG4wKCf16PxOfDLlbLPzxD4FImcgo5Ge8SCHH37tKGxTojbKuzNTzhy9bHktstGygP93/ega9kZLJihWNMsxkN9yS9G2OhdQTl/1rqnALU6vR0NjjYCp6jrr4Y6SA+6LTNs7AJ3arfNGufdj4EoCwyew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745676214; c=relaxed/simple;
	bh=+/XlGJ40QyLJ1yxLqAsymj/3uMv2LvI3xGqt6JlJRkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGm74YtJoJ4pCWu/XP8kp5N1TtYzzDzdbp9WnvV2bmkZdPgWkjCT29g9N4ex3wg8lAy3mP/SwInhKN+CZ58KNDPX/7mm9feEIE97u2MbbKwvR6/JmAA/5Y3efWcqnuKmgNVNLpGe1MwLEucLOx2Sm5Sb77PcwmpVaOnUZAeBNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axSbnKP0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d4ff564c5so502063e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745676211; x=1746281011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw+DsU15ptDiXJLxLZqHIzjz8lENUeO28XhBBnI/KzU=;
        b=axSbnKP0wzkqrG+zVQ4JMEx9nZm/UAJm+bWflfONPHvMKBEks3/n6M8P3IHkF1GTsD
         yRUGnayeerAJ4He7XxhCsDK+FWoel0bpLHpfILKT3nBBdzj0jenAfs65uYGGo6hHtZxS
         Ns6ZJ3SOC6pEvCd4Z8yDsAmIsbtaiEDyKWo3bSC4Xex9D2JN6nEhIk55D9+v3R7f5Xxw
         RrSqqMHpXjJXLBokbDwlOfpynUmtriP5IEjuUJNW5v+ZXM5tL7AzsmsDQz2MMLevGRuh
         Mz8K5kcC5kYuvM0U+zQDIhhqQzr8qDKj5CgehznFpK3/XCUhJJVvjypAYG4p0JADtGXH
         ZF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745676211; x=1746281011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw+DsU15ptDiXJLxLZqHIzjz8lENUeO28XhBBnI/KzU=;
        b=OW9e252sy/DvxnDTbwMDALN/aA8uxVFFek4CYPVFboSf25i95K8HU+ZoC2WDU2uPl7
         9to4774hMDLB8ajNMQQWYyjQvnolZ0EAmh+sFefvx2U+sRzJz8NzvkQ/dwJHXPk1Mmjs
         tgUKww/g95c/3z5aHH12Cln8G+HHb1u+p68nucip0Gat1SE49HLFk3XtSZtxCNzUoyWl
         SAssWIWBWWnowJ9kY6ZosmLPFaRNgTZ2aCIu2iwtlTbI+RriToH/EnbY7AauJpC7mbc6
         RU9/CF8d2SwWQsZtZnMYgGipb+DHSztXU+JDOwiGklUM2QtC9eJf4OU+AXYYQYaNtmaz
         3KbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQB6We1gM+kVwt2Qir1qmMVyOTU9UhqQ33pelKmlzvDTnD3sLwQie19xK8Kb3phqqVq6646bF32C1dxrnH@vger.kernel.org
X-Gm-Message-State: AOJu0YyEncf+1H36aotbl8KqLAk2V1UA/8KgMenPjY1nsVXJ/wKgRYNd
	QELY8Yvd+M7gGBn7cdo6/HNr5oWrbfLF1zjoCA+lHrv3cCMwngt2YhjOnz+T+zo=
X-Gm-Gg: ASbGncul8QngHtZ1X6q7mpsLWOeAS4dfHPDNoT99qkqiP76lPk0Yv8MuWMuNHkm/LWr
	WQobwbFsSNTzRRoMXhSJMXdNFFNan35HZDJRDENfHBarQlHCBcP9pRICFaoNPoha4GTdl/KttIs
	urx1A5BIQ+VZgqZq2m6Zadl0hYo4YOavMlIH/dC9vZzAs4E542NQsTRasp+vrvdxrlsXlKtjf37
	ILfAo+MuX8leqW3di3eiT+kuEgmtAUTVl43TpRVXxxVOFxuku2oVF0P9i9BUbIc+dAUez9GZgKg
	KxgyYuPwLUXZHGE1uAJv4HdYOXdwSQSgybotjjB16aZDbuMHvlq/TXObqNuc6By8vnrCf0ck/UM
	xvcozr3LgjmhrCVtTvk/cH2BY0m+ARg==
X-Google-Smtp-Source: AGHT+IF1Ip7CcXoeKnygcwDIVwoNCBJjRB68C/jdSo6GKg66tIbe4aPB/aVZwdQypXq6CJVRBvutGQ==
X-Received: by 2002:a05:6512:3d9f:b0:549:8b24:9884 with SMTP id 2adb3069b0e04-54e8cbd53d5mr523947e87.4.1745676210813;
        Sat, 26 Apr 2025 07:03:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2633asm1000722e87.10.2025.04.26.07.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 07:03:30 -0700 (PDT)
Message-ID: <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Date: Sat, 26 Apr 2025 17:03:29 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
Content-Language: ru-RU
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
>   2 files changed, 246 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
> +
> +maintainers:
> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> +
> +description: |
> +  Qualcomm camera clock control module provides the clocks, resets and
> +  power domains on SC8180X.
> +
> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sc8180x-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source

 From sc8180x_rpmh_clocks[] in clk/qcom/clk-rpmh.c I get that there is
RPMH_CXO_CLK_A clock also, shall it be added to this list then?

If yes, and taking into account Konrad's ask for GCC_CAMERA_AHB_CLK, it
implies that the new dt bindings can be omitted, instead please consider
to add the 'qcom,sc8180x-camcc' compatible into qcom,sa8775p-camcc.yaml.

However still there is a difference, qcom,sa8775p-camcc and qcom,qcs8300-camcc
does not contain 'required-opps' property, it might be an omission over
there though, please double check it. The ultimate goal would be to get
a shorter list of different camcc dt bindings.

> +      - description: Sleep clock source
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +
> +  required-opps:
> +    maxItems: 1
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - required-opps
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    clock-controller@ad00000 {
> +      compatible = "qcom,sc8180x-camcc";
> +      reg = <0x0ad00000 0x20000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&sleep_clk>;
> +      power-domains = <&rpmhpd SC8180X_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...

--
Best wishes,
Vladimir

