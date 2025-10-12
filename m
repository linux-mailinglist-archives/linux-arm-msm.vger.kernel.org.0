Return-Path: <linux-arm-msm+bounces-76851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3ABCFF95
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 08:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC71B3B8E87
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 06:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27C621146C;
	Sun, 12 Oct 2025 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="iojdxx85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51972AD32
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249220; cv=none; b=g5zcClzQ07vfAkEE8epLlJMsslLc8i8GmHJ0lI3/JXd8Gq859/tTKmHgTPOYvNv8e3iJ/vi0QGFNZ+SoS3pg3DEax6zsRzwl97RqjU/KF5gDLJvQHdtt/PLZnEXhx9WwlFevLh1riMb+zfrVAvcdrvuu4fzeMNGoS0h/4weF5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249220; c=relaxed/simple;
	bh=J4GE7EyQXEOo3w5bDh2vhnigRy0tlpj7MlJXIT6c3eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf3uLJhsi1oxt6nYRdzhPRkUp7QNY8RkQHAKP6KqR4Y8wgBdCg96LqqDESPtViIVrf64Dcp+o8ZlxjbOL/YHmta23QUfvSHUzuMfJnWE7uvZIoRkQnRWyvXSW5U38SiV0G5CFjXo1OBWianfm5hqSBhy+mm/47icJHDF2utKFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=iojdxx85; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-854cfde0ca2so629315285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1760249218; x=1760854018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=;
        b=iojdxx854spNBqH/HxnpIPwpC/h7rVVJCPnjnb+tpWTJwstzlc78XyyT61COZ+gBry
         gNJpEijjsakKSXbee13g3nnlo1X3ZdfmwNdbyTBEn2/e7On60E+J21s3c3E2fg+tJj5Z
         YgjySyNIXXZ4jRBmVxraHVHwkJfL4tNn5M/P3Jij/vfpPRK/09KamSLr4pg19I/C0ONY
         YvzaGftOSKNIlbhnZZz86H8m7AKorFDZgnGzeQ6fH8qDpqU5CSinYEAePRDw4PYb2539
         Lyx+3Cbicbba+T7jL2eg/3tsWGs1ByUo+3Qg1z3gjXdOxlzwlc2J5OjvV4X3nZwovWjk
         fKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249218; x=1760854018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=;
        b=gNjoTuE3j5RpNEJ6HJ+EN5K5znlOJ5SY9jdAd3bCgSWvQCqTjxmoFf+9qTCk+pz/Qy
         hmZrAaMFlMbWqboVE9lVwkdOdAvd3zrGGtfwJOmyjiOq7uqbAeKMGqaJLKACTp9s0uDm
         ruwdrzez5Opc76SV1APydz9n2GoQz4OjEEIHx8LPw/Jqv9ExfxUR1RaBO2gHPzvj6zKg
         vHn64SB68J+2B5tgMDxTi+TTrtRoInwucbuXK4eli4CAbi6pWYGeQxuHfnNj2AOjk2I7
         RqMNiqx5FjvNhRyGRGE46Hm4+N2NpwYBLX7/MszXfgnRT3mWGcPJRNpDe7lBH5vOlNC9
         r/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYJMFG8J8D0b5eLteVFomZkG1vuvdFMwiz3U8UsY38anY8KOr3Cl3aq/UecSsvwdCl7P4hsRfdp3u5fB3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgOVyy3Rdml8WgkSmJphq/g9PpuYLXlVZnPKkaNwrwxkHc6Ud
	/LtTeSG25HZKX8ZSvuh5krX6VIo58VFZYIfefrrpZY6eIHIGSjdXerjYyk160Dp8lYA=
X-Gm-Gg: ASbGncuGj26hvUZ9VYdtweVM8M77GXQ/R2oNxPhsDisL61Dy/KChRV4wQy/RVKU0ZNr
	86spavHybeED7rYeRpFGh0CqzVFv1y7RAPO/79h9XLqqpPSJUfhISdvqnkLJicuWACCljlgbg7M
	4J5621zpowunwp4uSo0Rbew2qc/txXH/ULjiBrNEiIziuTk1efuMfNG/iBGklZcWXLIgecjlTRb
	KG2sNZOgtcMGNdsZDWh9P+6ybzt8rmqnei8Er+Z4mFYtCsCrrjFLbjFkXrs4gaK5dB5GAU3TKEo
	ylYbI/h0WP8g4qsITfI9qyuv7KuVBL4S/azneo+pAenExIqdd3d1ftD8BaTbgqizb/jxU5H1+HJ
	b7dYDgl0v2yLb+BfV2RbkclIQb6OLUzZFA+hUKAWMm98CBgeD9/MxpadA0zxNKdmJ/LNUnouQrC
	/l40LJ2raYS756TTS+GR1bzo8UkNTP13z6fcoycLgFihCBoFrksQ==
X-Google-Smtp-Source: AGHT+IEMl4hzF79Bq4DCeP0JM3aR8UtTQq0FlGDLXT7cxwwHa5K+nkf//3379/x4FHU0neaf3KpzLg==
X-Received: by 2002:a05:620a:a901:b0:886:17fb:9436 with SMTP id af79cd13be357-88617fb9445mr508393185a.71.1760249217775;
        Sat, 11 Oct 2025 23:06:57 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca17dcsm738639285a.36.2025.10.11.23.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:06:56 -0700 (PDT)
Message-ID: <458ba722-ab52-4b30-b020-30039102ce57@me.ssier.org>
Date: Sun, 12 Oct 2025 02:06:55 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
 <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
 <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-09 05:30, Konrad Dybcio wrote:
> On 10/9/25 7:50 AM, Alexandre Messier wrote:
>> On 2025-10-07 06:04, Konrad Dybcio wrote:
>>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>>> From: Alexandre Messier <alex@me.ssier.org>
>>>>
>>>> Add the touchscreen device node for the HTC One (M8).
>>>>
>>>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>>>> ---
>>>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>>>  1 file changed, 36 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> index 36eb42f0f3d9..040a256f9465 100644
>>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>>>  	};
>>>>  };
>>>>  
>>>> +&blsp1_i2c2 {
>>>> +	clock-frequency = <384000>;
>>>
>>> This is not a valid I2C frequency
>>>
>>> You're looking for 100/400/1000 kHz
>>
>> Hello Konrad,
>>
>> This frequency value is used in the vendor kernel [1], hence why I used it.
>>
>> I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
>> other patch) are still detected, with basic functions still working.
>>
>> Let me know if I should still update to use 400 kHz. I would prefer to keep
>> the value from the vendor kernel (and in that case, I will update the commit
>> message to add that information).
> 
> Hm, I grepped around in old vendor trees, and it seems like there was
> a period of horrid wild west wrt this..
> 
> I see 355 kHz, 384 kHz, next to "normal" values of 100/400..
> 
> Let's just keep it as-is, but please note in the commit message that this
> is intended and that's what the downstream sets too

Got it, for V2, I will add a note in the commit message, for this patch and the
other one (for the NFC support).

> 
> Konrad


