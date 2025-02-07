Return-Path: <linux-arm-msm+bounces-47209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D314A2D1C3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC05188ED3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA29F1C75E2;
	Fri,  7 Feb 2025 23:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkwApY7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040E1C700F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 23:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738972203; cv=none; b=UhUpiESqLJKdGvpo6q9kY5mpoHiqbnv0sYU/DCCsirpoN/c3kt9dhFtKQPsHXR+goKLx7o63yQO0Zg9MXrmXOigiUIfdOyuFS285dB08YmB3tovqhT15c1Z+hvzg0wZFXgLVqgJ/Poh1dMdBhkldaBCvP0wg6lH2sHmGwbIOSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738972203; c=relaxed/simple;
	bh=8ACIYWoqGk3U4VYRz5tDjXeMR9/oAC3lfhPx+Efnv8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Un4A7OYt1KPSwJ6eFqnem5KeRbWrSO09+asQk7+mfUA3R/K4ANHpH7cIViQhL2pAm82CP7Lx35NnYpXgHXfAZIRgdNTtcziui/FGo1ESlRlN7lkegwVKiKuThkvCI1sZ9YvNKYN/LYqBzp5HL1sXFKLunwTc7Hzxwcqp3QIobwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkwApY7T; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso17764675e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 15:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738972200; x=1739577000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPeZcwASPgFFoWm3U6sdFbL9zCYU4rEILtPd8B2AQBg=;
        b=NkwApY7TtbZnjKogW2vfZokYvTjCiASkkBjSUH2VIrY+wlQ15W5WWefh2iJZUI/uu8
         Z8w1FNlVXqXUs4K3SysxsbPjCqO2+EQZwybDc2gyEeAGPyhrmedJ8QQ9LIe93ZTjguOW
         /U1nu+7ooyDyEFDqHcHis+nd66Z7rGsQG0iUdvR+BtNpBQK99850Yv56JgBtD+acGXKt
         9jupQxxqn/xqwiv2LECNnWrh7s/FgM0KXTypozfdRBVaxU5Br6znLB9OZRlXQ5RGUoIf
         KeVDp5c8McTejNq3uQMGTKDRQa8jZ1omgMivIvYNYtbKcrS6sfBRaRSdbydQmpTN2i4q
         244A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738972200; x=1739577000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPeZcwASPgFFoWm3U6sdFbL9zCYU4rEILtPd8B2AQBg=;
        b=wxM6tG8rvgqCibphqY3Blx6q6uDIWVQ4t4TKckoJFRno4l5n46pEA9h/iJyT7ZMvS1
         AP66goBYofoLqQ/8u482OUSOAJ7EROMluEIsq3Fy/z/tOFIecnQue61O4M/ug5R4tvrP
         wN7Njz2s3WdXa/zbVBXQ9NKNs07F7lFw7n5CqFDI3ypTJnkjUtncOej8YUqcMATYpdF7
         7ysdv9NDFxu05TTGdU4tELG9vPL1S4LZ8dX1L8hHDETL+rfB9kWVoGXftmkwITFW5tI4
         TzYgbfpBumna1Z5F0yW6BnVUfjypV+JPBhS4bu8IcIzrqvBaUBqi+BoWhGRAZjl0FMDG
         cfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn4VrewLDH1PVI6Fb5u5K7pZlx1qjQ2DWZMRwazKgaV3yfIBQNAG7DWkhWZe3a46Dz8tCSI0X8w9QEXslq@vger.kernel.org
X-Gm-Message-State: AOJu0YzmE4D+xM2NH2/EU8B/4Pser7K9km0mzbFFWhsOYnWX+2BqRRgA
	UZlOWozFXZ0G1m0QjfNnWYfpwIYrgmVAIlwemaQVEPP6TTMZ0jUZWf6gB98NaZs=
X-Gm-Gg: ASbGncsjibbmg4/4s7VRzR2Y0ylKGgHIL7BNm3WI+w56MPLhGAusD/mGiyS/m4S6rZ+
	cYrppDoGcjt0imvNYB+kUJK8b1rr7lo9Q5ICM2Wf0NQrcmQSvDA2LhR1CPL/QRB6ydY/IGmPFWR
	8pwdULQgulTRvhck/Pyos978TQ01D/jqGGBJRZkp36Ji0IjuFaiE0D3WhU+iPQjE9kKmQnxoJ0K
	iQQlSMIWLnj4v7wDsZYdQMRlPUPzQ+BoN/59N1ajuVQrsiTAgbuIbHsDCQQQuH67AuA1xE8mVNy
	SqFkWiOYK6F8aEnmW0Vsl2ZVRObLwy9NFPQlbsdCJZ7vHe/fw9AFRpAuY4NgCzurKIA=
X-Google-Smtp-Source: AGHT+IG+y80FejGBBHTdW2M8Gwb5cSEiV0eYucxbfrROEnQ4LdFmSm6RxkIQPbvdHBVK3HejWlS61A==
X-Received: by 2002:a05:600c:1d90:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-43924991f5dmr43454255e9.13.1738972199765;
        Fri, 07 Feb 2025 15:49:59 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:88:c96c:f11d:1729? ([2a0a:ef40:1d11:ab01:88:c96c:f11d:1729])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fc71sm5747386f8f.61.2025.02.07.15.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 15:49:58 -0800 (PST)
Message-ID: <a22afa6d-18de-4b83-ab08-6b23b9a1d927@linaro.org>
Date: Fri, 7 Feb 2025 23:49:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: use guard pages
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: "Dr. Git" <drgitx@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250207151706.45031-1-caleb.connolly@linaro.org>
 <85c31e1f-20bc-4e48-b179-e44ee8e1f816@oss.qualcomm.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <85c31e1f-20bc-4e48-b179-e44ee8e1f816@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(resending from not a mobile client, oops)

On 2/7/25 21:20, Konrad Dybcio wrote:
> On 7.02.2025 4:17 PM, Caleb Connolly wrote:
>> From: "Dr. Git" <drgitx@gmail.com>
>>
>> Rather than manually define the guard pages, use the
>> "qcom,use-guard-pages" property for rmtfs.
>>
>> Signed-off-by: "Dr. Git" <drgitx@gmail.com>
> 
> I'm not sure this ID is acceptable


Linus & Greg explicitly allowed for aliases previously. Patches by 
"Asahi Lina" and others have been merged.

Ive spoken with the author several time about this in the previous years 
and they aren't interested in publicising their legal name. So the only 
alternative here is that plagiarise these patches which I didn't write, 
or i have to carry them forever downstream...

Kind regards,
> 
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
> 
> The patch looks good otherwise
> 
> Konrad
> 

-- 
Caleb (they/them)


