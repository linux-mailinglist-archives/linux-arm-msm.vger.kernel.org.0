Return-Path: <linux-arm-msm+bounces-14463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E677F87F6A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 06:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165691C21753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 05:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD6E4436D;
	Tue, 19 Mar 2024 05:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7bI3Drr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8440871
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 05:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710825755; cv=none; b=UDQiI0XLjMy148QZFxs0Wx+N6yLBJTFaMS8gwimb6ct21rqDLb0+/QsvmSbIfayq8/p31OAvXAo/b9rmnFn1XbKwhHm6LwROsKnU8HPGVCr7MWz93zZ8uq8VTHcdBj6tSqglzfL++cILnFKId9HNnedVfyvJ1U4PP5uAVi1bvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710825755; c=relaxed/simple;
	bh=dakUAomHM3mI4Ar32yzINJG3dvyX3c/5nBdxwHWkLTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcESaiIGKxueJ2unE53JEp1P2IA4TbdUxDKA9wx0LcKHjxwKXu5jgr7k0YHC2nfto80tqUqbGEDiZLLQvhWJ6PIpBCj4kJG6mbGzYgNakSg2hH3M9RD3GYKk01BixKaODRt05CXiwhSGuYjWzRMGPrJuNt8ACmesBmPCX1pe+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p7bI3Drr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so6399828a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 22:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710825752; x=1711430552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8X8XA8ugz+VoL9vJzAf5guKYiNdpgnUbOGlQvkOg63Q=;
        b=p7bI3DrrG8wKg087V0jc8xj8IrrZcuIAMe0nyZYmCRXqHdFEwYstohb98ufGk4g7W9
         SVS7IazHPV7ctLIGk1qK3I7oKRjkE7Tiy+DHex2Ztdwq6Xv3LjpS3tB30YlmdeeItM3J
         0ofBVMFeL6kZhvBxgL7R6NfdIj11eqhM60QB/OGCStyVYvOT0B/60tLVAiO7aMkswGcM
         lSdJ6BSo61TvOogXI4ykORG7Dqjf5sy0HC9lnwbBGExvqSzMzTty5qRWqQiCVLvBgGxC
         AQFhc8DfTWm5T2SHeH89gINnPQPvpBoTo1208dhHN7QLrIh83qFWJxuAv7mbbzUA2Zcy
         wywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710825752; x=1711430552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X8XA8ugz+VoL9vJzAf5guKYiNdpgnUbOGlQvkOg63Q=;
        b=AA4mlfJPxqfcwm442ggYuXWJ+wMZBW65WNSVS7Sf9A/UPEC53EVKSZUvW7DET9q9zs
         OeOA9l4moyjFX8km27OLo4Feh5b7jp4culpMaiDEEvE87bBR2qB9LBqcOb27Zn4bHgSV
         o575zODV6H38YgqpikQ7QR7RxFNKIFH9wMWIxQ4Rf6uUHAKFQd9mSkz7T3zlkKEPVVwh
         RShAhB5Pr3v+WvjhbgIu5GX8cgrSyjfs9r7bkaR/yxbKq6dtdacMf8NcBlcHi8brnK7F
         AJk+BRzmdDnhTCF9L254aDNQhi3oKzLctH5piMUkM0MjqIhp8XjFpQxzPdL+eRLcPdPq
         W8MQ==
X-Gm-Message-State: AOJu0YwtKp/rTGWOBe5Q2U8sZALF1QJcCLKpMLiKNZuf9NrDHMy9fiH/
	4brP9Jt787+eg3cUiMuTNS1S0pO0oS/jmNtOFmY5JeDubz450ybIbTDtZ5NmP3o=
X-Google-Smtp-Source: AGHT+IFJpcINqeLcciVN4YPO+LjPsNJ7L2ktDfLEJgPktjH5qYsw5hy8zP0COUT4GcTgH8tfp6c6ig==
X-Received: by 2002:a05:6402:b34:b0:568:32cc:f808 with SMTP id bo20-20020a0564020b3400b0056832ccf808mr7388204edb.15.1710825751985;
        Mon, 18 Mar 2024 22:22:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g19-20020aa7c593000000b005689a4b250fsm5471099edq.48.2024.03.18.22.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 22:22:31 -0700 (PDT)
Message-ID: <d6a49d18-51cb-49ad-ba81-b162cb742fb0@linaro.org>
Date: Tue, 19 Mar 2024 06:22:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIH010x
 and PMD802x binding
Content-Language: en-US
To: Anjelique Melendez <quic_amelende@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_subbaram@quicinc.com, quic_collinsd@quicinc.com,
 quic_jprakash@quicinc.com
References: <20240314200419.4733-2-quic_amelende@quicinc.com>
 <20240314200419.4733-6-quic_amelende@quicinc.com>
 <5e317ad1-d473-423a-b85e-2f64a37f7d0d@linaro.org>
 <72a066f9-864d-deb4-7880-781558d59d6f@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <72a066f9-864d-deb4-7880-781558d59d6f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2024 04:57, Anjelique Melendez wrote:
> 
> 
> On 3/14/2024 2:20 PM, Krzysztof Kozlowski wrote:
>> On 14/03/2024 21:04, Anjelique Melendez wrote:
>>> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
>>> to include compatible strings for PMIH010x and PMD802x PMICs.
>>>
>>> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
>>> ---
>>>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 20 +++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>> index 2b17d244f051..5cc04c016b25 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>> @@ -57,10 +57,12 @@ properties:
>>>            - qcom,pma8084-gpio
>>>            - qcom,pmc8180-gpio
>>>            - qcom,pmc8180c-gpio
>>> +          - qcom,pmd802x-gpio
>>
>> Is the "x" some sort of wildcard or actual PMIC model/version name?
>> Wildcards are in general discouraged.
>>
> 
> "x" is being used as a wildcard here so can update with actual PMIC version
> in next version.
> 

Then please drop it also in all future submissions, as asked by writing
bindings.

Best regards,
Krzysztof


