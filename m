Return-Path: <linux-arm-msm+bounces-74590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F0B99F00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01B54322EBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469E62DECD3;
	Wed, 24 Sep 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k95mLvNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691752E54CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718527; cv=none; b=iVhIurKEQzqaOmryVSy4TMPiwfIX5YYEg60OQYBv7GB1v4ZK9iSdXiPN+hlRduDJmFcybiC6uB1MW4pKDpigU0tpMB8Qgq94e8BGyjtJSwo/ZCNl7Ol3KMt8W7BJT51h4Uh0kuCqLWiaPjZxQrgiLT0x/uhASmEdHg/SzVPAiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718527; c=relaxed/simple;
	bh=TgIS3F4fu+5GLaBeSa56IMHsY+9VBhabTxpQcu2fLug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3RIRrwFMf9aO7r/IJ5A8TTPtIVMyxYRH9WYgJsnNNk3lWgF1InaA3T6gWlEGQ+/RbCVWVJeapPGJ9NnBiFSNhPHdydHSKoHH2i51OZ0ytk1ov6yPuMYbC+TNoyFrxCqzosakjhk0EZg9dG88MMAot7ZM0Bcwle9Qf4sgQMCw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k95mLvNx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3eebc513678so4759251f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758718524; x=1759323324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqmhFOqyL/jn+0ySn6gfhyPKZz2/xOxFYy9KMMhl77g=;
        b=k95mLvNxCmkIF17/EWNs78r6DauIM8nKfwbTyb2rXsMA4AAHFC3bSBPNGkzHfhNbso
         zwZCK8oNflO5/Z6z5JX2MXt31hF7+ltTWRreorzq7viqPCGapr958V6P2djz2Z9XLtzm
         lNBdPorY1uCzBpcmOnjULE7UGJcgkG+fm2/fAGyDAJB658c9vpufQ2ULbf8Yk0LTb1J0
         XduLlVKOvsh6Kky8vP29UJ/PBwBWMB7m9a3FNaZ60XTnkBDTHTVpJoUSvsP7HeSpjaAN
         XsudC3yohIcygwyKUtG0TUVyzT2C2MWufUspkEs5JWebGvwbS6euMN1i3XgAYrN0rxVT
         9lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718524; x=1759323324;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqmhFOqyL/jn+0ySn6gfhyPKZz2/xOxFYy9KMMhl77g=;
        b=B8bkdVOLViOhYc5TSH+RgY67mNoDfYwneLnmA2oqbs4dzGVuWPg2RW8l+v9d9FKoBD
         nzhfV0TgU2Ylr1CgZLOYxt3OVHBkTA9U1Ymz8F2f+o+lIJmCqqhSN9W7KqmzyYEAiAGT
         9b/c92vYpnkYDiLpHKrcZ5hyB1dgmWuEDeu7akWIFa3k0oQf9huAOaY5UCbjALbrbk8E
         CwmIyEfb6dCEEZgxHLk7UYTKXfuxHsgzLeYbrgBD+9nUVnFvP/TEl9QEnUZrbNcFOM8L
         8xGcFDDbs0vAttf31tR93GMvLT0T7S8AFF8VwfXBXuqCwMQQFbz1lPCSC2B1TGJ79OrD
         Zxuw==
X-Forwarded-Encrypted: i=1; AJvYcCUZyISxklvgXZcvBhbwakmHQfi6a0wxZoXBwZwRZyZ9Um0wsrM5VmgaxqjipMxWln5xS82hrBTUMmAldrq2@vger.kernel.org
X-Gm-Message-State: AOJu0YxPSDI+ULW/j8CV1pm/w/ToHgMlf4tqRiYYdGZ7WoIa12s8XRMu
	tebPk0bVmNewz4ksWguah4w+oQgSN1fKn+r9bDAsrlWt9qvH6V8KwnYw5jlDOC8aJcs=
X-Gm-Gg: ASbGncv17xgSQA1xLiT59HkqrfoHdizKTiL8G4/vxdMwoAlvGXQ8HWhwXJfICWBuEGB
	tR0tHSktUP5khgyIMC9kFIBGmUZUiHrFBdeO2r+V8O8qMjksrE2AF7aFJ58WTNaV/55xLOghFal
	2MooLKoGdZTnmmtNziT99TjwzSiIrBeRaHU5M1SOiK8Q9M5ixk1tZfsAx7wARrtizzM+OvbHGqA
	Jz4DUEc0M4a07moTbYWA74htFJvypj6mgG+SpVAVnLe9jZLUSTzYODhtwtS8rwnX64aH3Q9hwcj
	30O9qp4qVC9DTLHc9QG5+1KciMhOJXMOM7p/z6YiGoLScYg4OfWOxrXq41nzksp2Gv44E9fqzac
	/7DmEjgP75fdpxCVwnDcEvMhya/nwujcL1jQQIE1OgYjXzFNOmRAfWvgKX+WjyS3fv+M/y8p1Da
	TD6pU/fj23s4XE1Lo7uatY
X-Google-Smtp-Source: AGHT+IH9718UuPsUK5u6R5hy08pX7IR2e1ms5hjKq5Yk/4EjPOc8rqGkBmfzSKvfGCHCWlsehtpUnQ==
X-Received: by 2002:a05:6000:2406:b0:3ec:a76e:95d6 with SMTP id ffacd0b85a97d-405ccbd713fmr4359848f8f.55.1758718523662;
        Wed, 24 Sep 2025 05:55:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1ce0f87csm37971815e9.0.2025.09.24.05.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:55:23 -0700 (PDT)
Message-ID: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Date: Wed, 24 Sep 2025 13:55:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2025 11:43, Dikshita Agarwal wrote:
>>> I understand your concern. To clarify, we are not removing support for the
>>> existing Gen1 firmware, so backward compatibility remains intact.
>>>
>>> We are simply adding support for Gen2 firmware for this architecture. As a
>>> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
>>> Gen2 firmware (via Qualcomm's video driver [1]).

I agree with Dmitry here.

Its not possible to disjunct upstream HFI6xx @ the firmware level 
between Venus and Iris because the DTS would have to point to a 
particular firmware depending on which driver you wanted to run, which 
would make the DT dependent on the driver, which is not allowed.

>>> Additionally, as part of our plan to transition all Venus-supported targets
>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
>>> to maintain backward compatibility.
>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
>> interchangeable for the hardware they both support, until the venus
>> driver drops support for V6 hardware. At that point it's expected that
>> there will be no V6 support in Venus driver.
>>
>> You can not simply upgrade to Gen2 firmware as if nothing happened.
>> Consider a device node on SC7280 / QCS6490 with the firmware-name
>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
>> happily consume the device node and try to work with it. One will work,
>> another one will fail. This is definitely not what we have agreed upon,
>> when you started adding Iris driver.
> @Vikash, could you please chime in?

It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a 
new SoC that doesn't appear upstream yet but, that's not the case with 
7280/6490.

---
bod

