Return-Path: <linux-arm-msm+bounces-47799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9319A32D1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F8C1888D01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35F8250C1A;
	Wed, 12 Feb 2025 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pL1GxGpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8428D253F09
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380355; cv=none; b=MxvtrdIg5JQzhfzeRzrTPiCCSWU7dpcNrsUGqQGH2ZKSF/CJnmRNO/BO+DtqopOF0BlXz2vFzi7rcxbCUrITC79pQ7+Rw5/Q33wqxJGOH8HUOOktMx9InUjnjyLgtRrI17C4iD7Izk+Sr21TB6fspJJ4aG1iWr9iKLoQF2teq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380355; c=relaxed/simple;
	bh=TEAn9XEJY37GkNpj6JIBjdfCk5yUerLMnh27Ni0kVlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjZwpvCfMyMa9JjpvuToPaR2Ej2iHoK2m+z0zugIiZlU/Oanu9+NnGIS73e1g4sHMdA1kfOKKu5/oSAzeDKHD9RFhNdO6FWVHvQJ8SwoB/T/Jpqn1jlKlhrh8JSvatbqnR9gmM6rIgEafYWM5ASbHtRBvxDzzxkM/jVgof7ZdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pL1GxGpr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dd91c313bso2368860f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 09:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739380351; x=1739985151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2e3hPQxup0lPwaLwklLsTcmfKILhtXcP5+Sg3+RgTg8=;
        b=pL1GxGprs6iBVK+Im/UAkLK60KS9HQl7xgogLTp6zZ1240G4Iu/Jw4kYc8nb77bl9k
         7Hq9mwG8WCGKVJiWqT4T6kv2nqLA7Xgjn0dfaH2tdPRRNVNYH8zHJ/rG+0laWNcarjlw
         wGaWydniEF6zMjrogHuCwEJ8BtMFmDEKs6pdyMfaEkhGayEEkYdRsESTIo4hdrQnHVCc
         U6VV2jhWmklZOHkUTSKcnDwrOPEIAGSNleBpBSbCgW6FpHI5q6qW8+wzBdt4GLqXAZN6
         +6Ca8L9eCknLdg6YL2JvFrpEVbyvLtoxI6y5dn9rv7a6v8C/40pVLDx510WDpPECpKXd
         uA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380351; x=1739985151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2e3hPQxup0lPwaLwklLsTcmfKILhtXcP5+Sg3+RgTg8=;
        b=kq6ezRWk9I4r70/j7r4Ws9CRJnK+zu9rTfftWnRPP2k6IcfEHTvJG7deUaP8+UQ5R8
         JHFmkfseFjZijySsmUU0VxWhAePs3x8Pp+okxrR8Gb1+tI+HHnU4jonpuDZz/GxFbCw1
         akSRlEvAQDgzvArciCk2SrKW+GbndZ98s3OQCNJWH4HFzeKljtXbNeE1nI39Qry5Gz3k
         P02GXNtL6XXFUinFuXleW3fbSOYshvVu0kDaqn+TDvRKR+WwjKqqIROrTNAnce7oBsPk
         nFePqqOsDN1TMVEu7LBG4+ALIFTreBADeBYPGC0LXD5d0V2tvEYaK/8r727NQrqumYo7
         t7+A==
X-Gm-Message-State: AOJu0YzHw9yRF7uurc/Q2BfjjaXVE5SyDuUV2nnyPKI+Bf80sx5vQOeA
	Hl4InFYuX7hFX81b0ZbbjYVuNfvJBod2ssmwrAwcpoir6MmXgX107RfBbj8r95Y=
X-Gm-Gg: ASbGncumSas2p8M1WKEQXVz8bGkAek5L9H3UhyAX4NWYdxtYs/BImD5ART9Fmm4zHf4
	/ZNNrd6LTnV+DEybpd2Yfg/mgs6xEijd5Fwp7tgHCZonn+wFqJUE1vGRXFCzqQ3rwj440GPds8Q
	NMvhZkqTvNCslw/tRRb/EZBfbuDXCjjEY7xWniJ4lorD7tUibWULCP1OiaUZXizKMvor2jJnEjd
	bRypN2q4qAQ6YbVEXOvnI0h7cDK7NIR3e/8HrGXmngdpNQE2NLmDRz0wKA0s8/OS9b+gMtZivA+
	4jDjxI7YKkHl35AdTiL54e9Ryc1BkQPXbQrUOcMcDBhCvohbUtM6G6OfapU8XX8Y5GAoQQ==
X-Google-Smtp-Source: AGHT+IGDrSl2sPKQZkZ2Wh5gwzUR2MlJ2zSqK8I2dmUQcoKztFuviOtdvDZxLOZdxHedx/bImSwSjg==
X-Received: by 2002:a5d:64a3:0:b0:38d:df70:23cf with SMTP id ffacd0b85a97d-38dea3d00a0mr3564189f8f.16.1739380350759;
        Wed, 12 Feb 2025 09:12:30 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:416b:3913:893e:bb4? ([2a0a:ef40:1d11:ab01:416b:3913:893e:bb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd2ef7efesm13104756f8f.52.2025.02.12.09.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 09:12:30 -0800 (PST)
Message-ID: <acb47522-920d-46aa-8c65-440f7c0b31e2@linaro.org>
Date: Wed, 12 Feb 2025 17:12:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 quic_wcheng@quicinc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
 <20250212010744.2554574-3-james.a.macinnes@gmail.com>
 <fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
 <20250212085609.06e0f949@jamesmacinnes-VirtualBox>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20250212085609.06e0f949@jamesmacinnes-VirtualBox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi James,

On 2/12/25 16:56, James A. MacInnes wrote:
> On Wed, 12 Feb 2025 15:29:54 +0000
> Caleb Connolly <caleb.connolly@linaro.org> wrote:
> 
> 
> Hi Caleb,
> 
>> Hi James,
>>
>> On 2/12/25 01:07, James A. MacInnes wrote:
>>> This patch extends the Qualcomm USB VBUS regulator driver to support
>>> PMI8998 PMIC alongside the existing support for PM8150B.
>>
>> Thanks for the patch!
> 
> Happy to try and contribute. I know that the working Type-C port is
> going to be a misery after the relative simplicity of pushing the VBUS
> upstream.

Yeah, it's hard to get used to the process... I'm happy to hear you're 
trying to get type-c working on this platform though! This will make a 
bunch of folks very happy if it finally lands, folks have been doing all 
sorts of workarounds for this over on 
https://wiki.postmarketos.org/wiki/OnePlus_6_(oneplus-enchilada)#OTG_doesn't_work


>>>
>>> Key changes:
>>> - Added current limit tables specific to PMI8998.
>>
>> I also played around with vbus on PMI8998 before for type-c support
>> (unfortunately didn't make it's way to the lists yet...) and I needed
>> some additional changes for this to work correctly. I found that it
>> was possible for the overcurrent protection to be hit if the type-c
>> port manager allowed the peripheral to pull current too early, and
>> it's necessary to allow 2.5ms enable time.
>>
>> PM8150b doesn't have these limitations (and supports the instant
>> power role switch feature that's part of the type-c PD spec, allowing
>> the power role to be switched without either side losing power e.g.
>> when you unplug the power supply from a dock), hence it's only
>> necessary for PMI8998.
>>
>> I would suggest implementing a proper .is_enabled op to poll the
>> status register for OTG_STATE_ENABLED and configuring
>> qcom_usb_vbus_rdesc.enable_time = 250000;
>>
>> Kind regards,
>>
> 
> Technical question for you in regards to the VBUS overcurrent and
> timing for the PMI8998. I would like to try and reproduce what you have
> seen as my system hasn't had switching issues, but then again the TCPM
> system may be covering the exact bug you are mentioning. I also
> searched for some definite bit in the 4.9 Android driver and was left
> wanting. As of yet, I have not had issues with the overcurrent
> protecction.

I guess there could be differences in our implementations, there is a 
delay after enabling the regulator for pm8150b type-c iirc

I never got around to chasing some of the remaining issues and sending 
this upstream, but maybe my patches will be useful for you:

https://git.codelinaro.org/caleb_connolly/kernel/-/commits/b4/pmi8998-typec/?ref_type=heads

I spent many many hours pouring over the smb2 driver downstream, so feel 
free to reach out if you have some specific questions.
> 
> I will be all too happy to migrate to the PM8150B and its associated
> SoCs and leave the 845 platform to history.

Well I for one am always happy to see SDM845 getting attention, it has a 
special place in my heart :>

And still gets love over here, even if not nearly enough of these 
patches have made it upstream: 
https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845/6.13-release?ref_type=heads

Kind regards,
> 
> Thank you for your feedback and I look forward to narrowing down this
> issue.
> 
> Best wishes,

-- 
Caleb (they/them)


