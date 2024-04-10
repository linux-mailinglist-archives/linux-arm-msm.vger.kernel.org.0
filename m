Return-Path: <linux-arm-msm+bounces-17068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A489FBF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8AC1C21C64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517A016F0D4;
	Wed, 10 Apr 2024 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKThYxjC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D06A16EC1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712763964; cv=none; b=tuCA/HyyOh8HmM4Tz7FE0rmgRJDgP+HTxzkfTdX1y/OagGZcyfbS74b4ZbWk3HFhZW+t0xDfCW/58uYhNK4XU2ARGUWwi/BDG0uckeF/g9BYSy98jkKDy4AsfHLDvCbw4sS3leM8ie0QdgW2xrUD4wo1H5pdVDLthrqA/a6qLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712763964; c=relaxed/simple;
	bh=s3d5GTfocV5mY2Zlq7KQ3BlApnCMJ6kcdExQJ0HP7ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAHqyAcYWHC5+P9031XJXEUrBayv4a1nQjx/KHWRC87u02xywpN6EQxBZBVZ95vmDVosbouIkESfNuKhqae4slXxpu+yvobyNwDdzDRl7HHdv2D0eX0vWegsuXrnhWyL6E6Gu1PCp1MfVHTyogQfAeSQ429wbpZhzdse6F4TJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HKThYxjC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343f8fc5c69so3150691f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712763961; x=1713368761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kMSb41Ro1MGCR8DNhZuqmJgnrt1qNZLXyeHX6+ZpN0c=;
        b=HKThYxjCluXVw7h0qJf7XkddA4WNekRYSyIpBphayZIGVLwsyDdDhqMlBgA5UT3H/d
         ksU2F84+9UX/kkYk+QMb9r6fA2qD0NkX8Wepwmhr4EbXjT69FmNBz3BvSvE/t9w6YXr4
         vngiP3P64LcZwPAbzcuvPzNd2uyUsIaWaxZmXe3aKqRvBoYN9eQ5Uicule3u+e3smR79
         185mnPZe+FDeN/NPGwYpPcIcHST6lHdptYnfN9vjAvVwDYtLPDmqTso1P7QHsF99CXwM
         mhPhhnFW+r+pCMZ6HgX0EZh0mmZRO/yvu4gObTEZLq9BTHpg6WwN+Xd6KcWLZKo8tHeT
         ERyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763961; x=1713368761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMSb41Ro1MGCR8DNhZuqmJgnrt1qNZLXyeHX6+ZpN0c=;
        b=hX6WsAjWcpTbuAiFBB7ha1n1Nima1ZYgIX9lzyBYwxZQej+Zpd0mwgj+H9rH3gt64u
         VfEKjSNd4C/9D5ECbHaFA04eDRB2huArjQQWNeEtj+qcN0AqcJaELSjIerMwVAWAq94u
         Lv7HIIrb59HksOFYTAdy7SkaqUXnS8Rs1bOJPb8cwQvNhzR509BFkoqt+DUnrjb5QCNB
         iMRXUxmXBxPD8XA6YIgZ8jLpqXpicjMManj9e/iiUtOcHtIefIaK0AlGpPW30DmvCo8e
         7qSyftZlreCS5Oa4QpiTlkUMAk5ajyqxT7CWfbo8eeJXKrkZjyazKEHlVfzhKJ84f+q6
         yMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr1VtzwPRxb8JGym4L9TITA84fG6pad2RP/SFvbLZ8iKUlgAiJ4pZxzxek3bC9Vj8vAzhu2CW4VUzlmitmYHFRiP2PQpWIfwTtUjPMIA==
X-Gm-Message-State: AOJu0Yzsl2KrzNjBH/1M3FXM4nWgicdAW0yZfogmKZ+4amgxXMnwF+d/
	MYu1H3fF5bnP7MyCh3wGVpo/ZGpVqF8yVr+CuZopwiKNth9qAIib2baFh8AP038=
X-Google-Smtp-Source: AGHT+IF0symX7MBre/8yHxnzDjbqOYY3x1l9Wzi4MUqBDA94Yfii0Mvzcm9Gl+mwzde6Jq79PEtD4g==
X-Received: by 2002:a5d:4804:0:b0:346:758e:5f29 with SMTP id l4-20020a5d4804000000b00346758e5f29mr1201910wrq.60.1712763960700;
        Wed, 10 Apr 2024 08:46:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d4e88000000b003438cc1d2b4sm14027417wru.59.2024.04.10.08.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:46:00 -0700 (PDT)
Message-ID: <be000ce5-0450-44a7-994b-e05d1748ad32@linaro.org>
Date: Wed, 10 Apr 2024 17:45:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
 <d47ce3e8-8ce7-416f-be0f-2283575f24b2@linaro.org>
 <d91239fb-d15c-4984-96e4-1c2bd1361ad2@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d91239fb-d15c-4984-96e4-1c2bd1361ad2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 15:22, Vladimir Zapolskiy wrote:
> On 4/10/24 11:26, Krzysztof Kozlowski wrote:
>> On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
>>> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
>>> connected to each of them.
>>>
>>> The CCI controllers on SM8650 are compatible with the ones found on
>>> many other older generations of Qualcomm SoCs.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>> The change is based and depends on a patch series from Jagadeesh Kona:
>>>
>>>    https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>>
>>> It might be an option to add this change right to the series,
>>> since it anyway requires a respin.
>>>
>>> A new compatible value "qcom,sm8650-cci" is NOT added to
>>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>>> the controller IP description and selection is covered by a generic
>>> compatible value "qcom,msm8996-cci".
>>
>> I do not understand this reasoning. So you introduce known errors
>> because errors are ok?
>>
>> How does it pass dtbs_check validation?
> 
> To continue the technical discussion let me ask you to comment on the
> absolutely identical subject, which has been taken in the past in connection
> to "qcom,sc8280xp-cci" compatible, probably it didn't attact any sufficient
> attention before, so let's continue now.
> 
> https://lore.kernel.org/linux-arm-msm/0a3cd2f3-85e9-4769-9749-62353e842625@linaro.org/

You mix topics. First, you cannot send patch which knowingly introduces
errors, regardless these are build errors or dtbs_check errors.

Plus checkpatch also complains about it.

Second, you linked to a driver discussion, but we talk here about
bindings. Not driver. Each binding must be documented.

Now, about driver, there is no single point nor need to add there
duplicated entry, that's why we don't add.

Best regards,
Krzysztof


