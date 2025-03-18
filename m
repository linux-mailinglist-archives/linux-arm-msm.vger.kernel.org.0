Return-Path: <linux-arm-msm+bounces-51842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E11A67F12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C14173FE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC84C205AD6;
	Tue, 18 Mar 2025 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfhtXEwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E71F582C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334526; cv=none; b=ul+L8AlmrGTJLcBvLcFJ4nF66eA+DEGPPzc3mPmnm6/r4NomLX69rSRu+UNk8j5akYfGcq18Sc1HibhIGDu5WBaAsTwUMeZvKtksK0TaAQ5InE3kESilO9Yq3RO8g9E6ecnB+9jfldRJ8gmyihDgnGSLC5GVj/71S2IlTl0vgzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334526; c=relaxed/simple;
	bh=9QWi9Jbu2T/CyKwbiyJQWuyZbY48B9JmNpyjsuhsu70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhwHtqMbIb6tdPLSVzqY/ZqQ1Bt5SO90yrn3fVzf+hZoAmt9ua+WgvX94nKhEdStjvcZVLlxmWkeP3nEMNT+d1faUjXQiPlf/dkNzGcqpLf8qxlPcaszX4YMNBsC92qaRtuUl83U4qE1hSL1WV3gzf9+/FiM8HQTk/Rr3eDq+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfhtXEwu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2aeada833so20952466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742334523; x=1742939323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duoNyUPDpZ35AJzrwQXSbOfWB68wwqzf/wrWJgrnJcc=;
        b=cfhtXEwu2LdGKmKztXYwu9hsns9j6UgYEwbAQuhomB08WLLs8Rk1jQQ75ymRgIpUev
         Ec2lHjJu42hoRduOq0sKg2ZO4kD3lh8FVIqC6qQ74Ca286iZGsg/cgo3cE/Vj/onLc3T
         8iV2an/UN00eyCtRs0JTlY1yvXcbd/Z6MRVlrg1cWlqPCYbnxhU0yy2OjE/QIj1xNvab
         dibQljxjX95KFclCUeSfR3wyNHVEHqiuW7WW8LBOjs4g3UK8rcQri3XxnyjozkuUmX5e
         4g9mwveFRzoYatgZQV6ewoS3+kjulVr7/gTGIH4d6xB03geaVyhoMhf/xAXxDlblzwWL
         5yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334523; x=1742939323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duoNyUPDpZ35AJzrwQXSbOfWB68wwqzf/wrWJgrnJcc=;
        b=AHyWZC2ABwgZa7znCX3WU+My2F+nPyZGKWtQFT9znaFGJNVXpzg7j+zBwZGLlodagC
         69E1DjnQI9q43wHZfH+23XXgZGI1qTpSNso0wTyae4ulWLKrLfjCgPxLA3sa14hLiNF3
         3P3b3zmGffix/NB8pWLSu12hlPHI/hoJXgbiqhlkhe+qC2C0VLxtOgI8PpXVVY42RRlh
         C2EndcbvLzqO/AfsvsgAGhIiISldSTqUhs+ior8bOvkpwG3GTWWGpRmxshY9hMioyMJW
         2s9ALT5OSEFnti1NVTDQ6O5tTDSqbUUg7VsZ1gp3XsC9oov5Xq9NvkLgzLRoJ/bqZFGA
         1lMw==
X-Forwarded-Encrypted: i=1; AJvYcCWs+RlUlx5tOhw5EYIvTaJCdfgvUXGh8CG7jZWTrqZkI1EYE+HU+wO87q1Y7IUUdWbo1EdHz1O8f3B7oQlA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeda42dlf3IR8I4VrY1RW5xFsbRvDSO6gBsTJxSI2mD22+X781
	dW8qKy2czX/GlEW1Fx9wnAj5GZ/g8N5ShNBsksD8zDgbjagRn7MzX4yBH6b9y+4=
X-Gm-Gg: ASbGncsJh39iTByPi/bynZBTUvv2MUzxe4vk6LpPQgDkLL3fGp9sFH2sYrf+8FAM/C5
	PJX84Z5Ysgycv1x2JfcQH87qgR0TIqhJ7l5bgK0O3mkuvZnfHcqxN7ywwu48IrcYWUi50WypQvs
	mNuv4h8r+2AjrkHOrQrRKwnIv+6zJqxziJFTI7kwlcZbvZkd9biEj4Qqa13BCZNEE6ahqv0qq+y
	o5MmBL0p6EO5432+AHCtboyMZmoNeLBJyHvuZkfyVBbIITQlcQsbF4vOHAgd4X3XcU6mnIjSy+n
	2kC+Tri39ShiztdwM3RHuamh2DArwtcGOyorgHyQPEjQFIXA2mSC7YsdfPthRSDBhRhCdNAfcn9
	hJLAul4m5MnWr4CevMVY9ozwyh9LO8abl+aXPA1ghDRI186VhI+yN7rhXvTf6pzUBYZVMwVCXFs
	Wkr+ZrZa3ALm4HFKttvphPKPka5Ef0z8Q=
X-Google-Smtp-Source: AGHT+IF06W/HXbWDQcnvIov2Jj/jxhVUXmUlc3LWIaSEPfb9UpbLNwCGC29SRRaa+u05btkXLemWAA==
X-Received: by 2002:a17:907:f50a:b0:ac3:3e43:f451 with SMTP id a640c23a62f3a-ac3b6abe286mr34843266b.5.1742334522980;
        Tue, 18 Mar 2025 14:48:42 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ef34asm921171966b.68.2025.03.18.14.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 14:48:42 -0700 (PDT)
Message-ID: <b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org>
Date: Tue, 18 Mar 2025 21:48:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,qcs8300-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
 <20250223-observant-auspicious-basilisk-d78ba9@krzk-bin>
 <66c35bce-c657-4c12-ad02-58c995ae385a@quicinc.com>
 <f2899540-f9ac-4013-a703-25800429f97d@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f2899540-f9ac-4013-a703-25800429f97d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 07:16, Krzysztof Kozlowski wrote:
> On 18/03/2025 06:52, Vikram Sharma wrote:
>>
>> On 2/23/2025 5:03 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Feb 14, 2025 at 03:17:46PM +0530, Vikram Sharma wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qcs8300-camss
>>>> +
>>>> +  reg:
>>>> +    maxItems: 21
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: csid_wrapper
>>> Why different order of entries than sm8550?
>>
>> Hi Krzysztof,
>>
>> Thanks for your review.
>> I did this change to address a comment from Bryan on another series.
>> https://lore.kernel.org/linux-arm-msm/e152ff78-caa5-493a-88da-96a6670eb2a2@linaro.org/
>>
>> Please suggest if I should keep the order same as sm8550?
> If you chosen the same order as x1e80100 then it is fine, but that file
> is not merged so it is your responsibility to track any differences and
> be sure whatever you send is always in sync with x1e.
> 
> Best regards,
> Krzysztof

My mistake, I hadn't realised/remembered what we merged for 8550.

Vikram, please follow latest committed example @ 8550.

---
bod

