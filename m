Return-Path: <linux-arm-msm+bounces-34348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BF99CC71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 16:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41B041C2148C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABAF1A4E98;
	Mon, 14 Oct 2024 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="EDdMuO7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024704A24
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915197; cv=none; b=D19nUzg0JGWAAhnBsSy+6HC73Pj05m3anJaRvylj3i1C+fb6SW5g+ZmsUQCWoCKXNuDIsq6xfCd65TY3I9ho4dBVqvE+kwVfCLJeXykG+voUweOi51KnNl6I2AxaphXLG6BN+EQay+BEgnFG+XDdlhQvSG4oLUgNFiPCuBq2rwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915197; c=relaxed/simple;
	bh=HIrJSO9VytGsY4NZ8isxGDWxrHujSZMQBHLihaQxRJE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lb22bRKYht3b2+alQcfO8bolRQmBrOr5r/KoT6dyyPkyAk0TEz3mfaDeogobXxxHbt2bQlG9b6AHwDsQL993gzjNkH+evoxnSspISv3HjhbmWMptr8HUatNIFKzPz8Uqgc1k/I7wNbPCvNIL3lWcCz1fjCX2HWvufA3sapIgIvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=EDdMuO7t; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e290582301fso4784098276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728915195; x=1729519995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5XPl/lV9Nezw6P2bjfBzxFheufaM+23SwwbgbenMXQ=;
        b=EDdMuO7tFOI8IlxMEWh+a2NQrTIAcf0lrcKoVnjjJlVdc1ewMDJR2B2c0ai9qyVUtg
         ZIQjiesqNiR1suEA/okxSZpWfIo93AGUKw08ZX37yks4O7CcgtmSWkQQPMihn+x36MZL
         ktHJ0VuG7D8cm3cp7Utb4yagNbRsO0G7e3xTHsbFmSS3PPDi0hz5IRwza5ymAT9X5mKx
         4zAWnZmcJ9GG5JaWjZDXn7GDCk1lo9sHT5exq/SEYjCNn5atbwZIVIs4SICg4KQYDsNY
         Y8zNLt8r5HDSF/BIXynlm/bI8kqWpn5E27uN/jgTm3Z9hXsmxO6B2O/sbV4iJAUS5AQd
         IgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915195; x=1729519995;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5XPl/lV9Nezw6P2bjfBzxFheufaM+23SwwbgbenMXQ=;
        b=LnGDKkQ4NMshcZ8gCk3yMialEfVXD+9PV2iii0keyIwid/5J/a1r8cL4HaNjZjK9Oa
         ynJY4HmB6TpP8gPxSIDKowfTk/ZWXapRA7w9+VEsx4EcLtknhzoOXk2/WYv4s7e64boc
         J8gWIwZGcYQUQjp67HbIfuqEXCZ2ndyfk7KxuDaeMOLCQI08tfHa5rodoForvM2TB8Px
         3LeTQUK9Q5OXMpBz/gP56MtxblAYm0MTYbmiK1qkXVuHXqJKEW5eehSUSCHmU6OynGG/
         aUR1PBCoGVr7mOxLirmnvcsDiGPnyKKJHXgx6J65OUri1O3ZWd/ldE40+f1Wlc/XUv8b
         jokw==
X-Gm-Message-State: AOJu0Yy4TbwE0pGE1GdU9EcZSnXK7FRXYbafOZPfum5dRUYKACvweYse
	N9urEUC1bZZxa4zyiaUAaH85z3tDyTvz4M/zaZdKiax1yThgpBPATaXxSEiRxoQ=
X-Google-Smtp-Source: AGHT+IEvN0TJxXXpQh8bD5GRuy8/Xd7aEjsDuiepfJCEFPGQCSchXQ9+wf5e5SjneK2qSPHw0OF/fQ==
X-Received: by 2002:a05:6902:919:b0:e1a:e74a:d910 with SMTP id 3f1490d57ef6-e2919da6429mr10001912276.30.1728915194884;
        Mon, 14 Oct 2024 07:13:14 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b114955fadsm423278185a.93.2024.10.14.07.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:13:14 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] dt-bindings: rtc: qcom-pm8xxx: document no-alarm
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Satya Priya <quic_c_skakit@quicinc.com>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241013051859.22800-1-jonathan@marek.ca>
 <20241013051859.22800-3-jonathan@marek.ca>
 <gpika7a5ho36gx3pz7k5t4rz5spvpnmnvzs277r64z2npdmfmg@4vcmw6x5zvwn>
 <f3b4bb12-d025-1cc9-6dbd-04913b951425@marek.ca>
 <322c44e7-897a-43fb-b617-f4d73c9384a9@kernel.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <a91e4a52-c427-bfdb-0675-f8417dc24006@marek.ca>
Date: Mon, 14 Oct 2024 10:09:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <322c44e7-897a-43fb-b617-f4d73c9384a9@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/14/24 9:38 AM, Krzysztof Kozlowski wrote:
> On 14/10/2024 14:58, Jonathan Marek wrote:
>> On 10/14/24 3:34 AM, Krzysztof Kozlowski wrote:
>>> On Sun, Oct 13, 2024 at 01:15:27AM -0400, Jonathan Marek wrote:
>>>> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
>>>> Thus writing to RTC alarm registers and receiving alarm interrupts is not
>>>> possible.
>>>>
>>>> Add a no-alarm flag to support RTC on this platform.
>>>>
>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>> ---
>>>>    Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>>>> index d274bb7a534b5..210f76a819e90 100644
>>>> --- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>>>> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>>>> @@ -40,6 +40,11 @@ properties:
>>>>        description:
>>>>          Indicates that the setting of RTC time is allowed by the host CPU.
>>>>    
>>>> +  no-alarm:
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +    description:
>>>> +      Indicates that RTC alarm is not owned by HLOS (Linux).
>>>
>>> This is not even properly used/tested, because you disable the RTC
>>> entirely in your DTS.
>>>
>>
>> What? The next patch in this series is enabling RTC on x1e using this flag
> 
> D'oh, right, I must have looked at wrong diff hunks. I had somehow
> impression you add status=reserved, but you just dropped it.
> 
>>
>>> I expect here unified property for all Qualcomm devices for this case.
>>> We already have "remotely-controlled" and other flavors. I don't want
>>> each device to express the same with different name...
>>>
>>> Also: missing vendor prefix.
>>>
>>
>> I don't care what the property is named (as long as its a bool
>> property), if you have a name you prefer I will use it.
>>
>> The existing 'allow-set-time' property (also related to HLOS permissions
>> to the RTC) is also specific to this driver doesn't have a vendor prefix.
> 
> Yeah, that one sneaked in some years ago.
> 
> So you can set time, but not alarm? Some previous platforms could not
> set time, but could set alarm?
> 
> I wonder whether we actually describe the real issue here. It looks like
> group of band-aids.
> 
> Best regards,
> Krzysztof
> 

Firmware can set different permissions for the RTC time (0x61xx) and RTC 
alarm (0x62xx) regions. So it makes sense to have one flag for each region.

RTC time is almost always read-only (not owned by HLOS/Linux), so the 
'allow-set-time' property is almost never used (the driver supports 
using nvmem to store an offset for setting time as a workaround).

The "can set time, but not alarm" combination will probably never be 
used, but the 3 other combinations are possible (the common one is 
"can't set time, but can set alarm").

(in the next patch I deleted the "alarm" region/interrupt from the dts 
but that's wrong, the HW still exists, the patch should be only 
replacing the reserved status with the new flag)

