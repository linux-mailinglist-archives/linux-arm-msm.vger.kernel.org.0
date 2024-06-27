Return-Path: <linux-arm-msm+bounces-24512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 322AD91AC24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 18:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A63881F223E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FC0198841;
	Thu, 27 Jun 2024 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFcwcPLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019A1386BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504153; cv=none; b=iZoCV53EW3cqt/+7JY2agq0a9Dp5hcwr1K/DUq5WID9pPxyxju9XvxaxLJQnZ0egoSEzVNoKi4KAkgz/K226PMjsnONHGtqXlFKRY2Uz8RyqLJVeV4BLsFsmQgaBM7ksl3GW8A/QZ2X0DtDaS5aIkgtjcUYzdHHxax8sDhVtV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504153; c=relaxed/simple;
	bh=DP/vC+9wBMrqiSR5lkplaBTl/wsmLgsiJYzFttMvKVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qm7uxSoPwOSgubAfbvZhLL+K0td2Qkqv9Hbhw81LlZOxDbGdJedrVgUrbw6qXP+U8M9PrBL43eHwTBmgU2QC9k//b3WYWRnpQJY+8TYN+s8NEVru298RMDLKLKhl5PkhwWdwIawdissNMUOsz2H+6ko4uZfbyZsBSMd64sRS2E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFcwcPLK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7194ce90afso712217166b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719504149; x=1720108949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EXd7vIXAa7C7offwH8kyxByMdH7K1WX1ey1SzaCh7Dg=;
        b=sFcwcPLK+Bmd1C3Dmt1ABcG1MdtRa1KHVZyvdoZjkUC8pejBpxnjPN8bzGa6fsUclc
         1zZqDut5nacsyYqCvCOE/UGNBEi25s6/oSnTcNhb64H0PL/c6SNnZIGvVPMOJZWdP3bB
         7O+WJh7dLJMh8++wCpj3ET/DiBCV36ZRqb7A5JRukxWqTHmskGkp+VYQlhK4NER6AXT4
         vcA4e5fFqcv0SZhvBGJtXIp1vgAd/69bcchxFy3FK+SxixvHJZA75kDcLaPRw3H4uW5E
         zmjSO/ZIzX+CwP+6sY7IXTPGPcubyrs3sAp8AxcMbFix4Wwy9Ec3JL7YR9qjJ7Buwnq0
         AIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719504149; x=1720108949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXd7vIXAa7C7offwH8kyxByMdH7K1WX1ey1SzaCh7Dg=;
        b=o2AuOR7yDQvGRS/DLHnNuOXQoqJhOoL749vafc3fTq1QU3AIJfVvFRiJIvkj9JxgFQ
         /kjC8tz3aHUE4/AG6wpGO+vUi6zTsvspTuird8Oqsh2+O53OFTCi1xQmfyHC+mrF2ysc
         IuCZfXQjahJRydNo9q26CqWJ6sofg0xcEgWeoQhK51g7D8aHMJl/tfMSr9A2DCz8l7Ps
         q+O6d6nC3mT6KD/EcqiJLEKs+rHVhcHh1iPrE8di41Trg1dZk053WgjLz2Ez0YY5r0ST
         RqvIUt3d51Dnf658dpS/DNB4UxN1loAgme1pwT8+lwXFYVv0iM3eiEPQs97ORYRbQZSY
         ZTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIYyiUj6NUGnPyORwOHBxGZoV6DjKhLmSLGzAMX3UXsrvpLu9iiNGof3lMthfhAuPq4b+0FkH6NF4/KTXZII69nLZxAiV2j2y1arPaKw==
X-Gm-Message-State: AOJu0YyMlc8Gp32iWrc8zLMAScz79pu1NK714jpBKBMWNgnyFmdtBRso
	PCRHg7stXbGCkkG3k/DxPx/k/GoozfJ+wTHCEB8bZyKva642OfYr2QXUh5LKfJc=
X-Google-Smtp-Source: AGHT+IF0JSfORtsMrf5PkGOXSDkgqLHnwH/O9l6CuM3kGKRd9JpqWE9Kps+1ahxDjnmzr2W5DuBlRQ==
X-Received: by 2002:a17:906:bc4d:b0:a6f:173d:36b9 with SMTP id a640c23a62f3a-a714d72fe5amr927930166b.16.1719504149168;
        Thu, 27 Jun 2024 09:02:29 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7796afsm72189766b.136.2024.06.27.09.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:02:28 -0700 (PDT)
Message-ID: <911cdfaa-2e05-4fc1-97fe-4984b6e0f3c7@linaro.org>
Date: Thu, 27 Jun 2024 18:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial
 device tree
To: Conor Dooley <conor@kernel.org>
Cc: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240626191829.280611-1-raymondhackley@protonmail.com>
 <20240626191829.280611-3-raymondhackley@protonmail.com>
 <5021ca42-f8d8-4dff-b0e2-21c7f9d680fa@linaro.org>
 <20240627-camera-appeasing-9ec979f1bc7e@spud>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240627-camera-appeasing-9ec979f1bc7e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 6:00 PM, Conor Dooley wrote:
> On Wed, Jun 26, 2024 at 11:52:04PM +0200, Konrad Dybcio wrote:
>> On 26.06.2024 9:18 PM, Raymond Hackley wrote:
>>> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
>>> other Samsung devices based on MSM8226 with only a few minor differences.
>>>
>>> The device trees contain initial support with:
>>>  - GPIO keys
>>>  - Regulator haptic
>>>  - SDHCI (internal and external storage)
>>>  - UART (on USB connector via the TI TSU6721 MUIC)
>>>  - Regulators
>>>  - Touchscreen
>>>  - Accelerometer
>>>
>>> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
>>> ---
>>
>> [...]
>>
>>> +	reserved-memory {
>>
>> 'r' > 'g'
> 
> I assume by this you mean "please the reserved memory node after the
> gpio one, in alphanumerical order?

Correct

Konrad

