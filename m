Return-Path: <linux-arm-msm+bounces-25177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ADF926488
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 17:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B4F1F21AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 15:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C14817E46A;
	Wed,  3 Jul 2024 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmKWp556"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2317DA25
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019537; cv=none; b=ioGrELb4FZmgMI0FqQZb1hdX210w04Nrj5v5EwmZkFMsBMrth26Aky0EwzQ446vb/CjGnM6S1yY0CUyY+QPcKc6IQa2i5/OOF44m74MH2KqPi13tyE/E/u2KcUdCqRBv0E11DwE/rOZ1KFFVE1PVHo9XqxOe0ibR/LjR2ieYTmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019537; c=relaxed/simple;
	bh=bvCK0w6pEBun5yXlbvybJvpOQqqTLo2EHx1hpAZm8Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVeeFO9zr7QP5PzwbHYMiVB4GdtmwcW9lnC2pH36bPOr9X3sSgiacZ6XIKRDADOgVWBtBG9DD8gbY+fnNY7fR4+TX+BYihwoi6FsxdfZ3L0xr3AqqziLv1xeZZUhk3JcQDk4/Hr8ollA18f/z8ktOG5IKic965J+fzL8iOpZ1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmKWp556; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4256aee6d4fso33893265e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720019533; x=1720624333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1FBE/phOqlt/mt0C2kNHxxiftuxkoc0MD4S1IpTeCw=;
        b=jmKWp556hMVckFahLA8tFWwthUd3Y6vHmcle06tL4r7saS2l01pDbaFrX+8iHH4TyR
         SFuBcpcRH/q+hhBb7VEdIYbRG6xF5pzoPeCqM15/NtmbZeq7BHtbw68rS+EGXH33LgQ1
         Jiq9k/fesZ1qG0+YjXjL0InMGr48AiH69xLXdo+aj5OXJlcQSYQ5ub7yIWvZUmb26gYd
         Gr4t9cgN2u8PBEizhKYogeMc6iKsXgfJ6MjaZj5+b3FhsfOCvbNJKXv6knOzN8+8VEac
         TTMT9giBelWNwm+d8/03PRIjheaRNBfEbL+woQMJWFEZKIDkEwq1M5ANc4Isdyc6ST5S
         SRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720019533; x=1720624333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1FBE/phOqlt/mt0C2kNHxxiftuxkoc0MD4S1IpTeCw=;
        b=gBsSmAItMhHKL4Chwk9GyaMPmrFtjiVEbrtIyyxt7y2Sl1ZZiQj1wWwauFq8uynMFB
         dwWvH8RGxv1BAnQX0pB55i0uyXOz5e6r5CGxx8Te2lC9HNedFOJmfXR7WCwQodFTudFo
         UhMozdVTRLac3kataNNhlAoc9Dwk7IMpHQlNq+P/s4zBXpZTQCdJdY9P8JtnnsOGl1sU
         gFF9jACe6hvLSJE9X8fsQbYquIi1M4kqj3aVilaJBuQ014R0zfWPKVMdHVXSXu87NxYJ
         61WuPVwWSEe0cPR5+JsJAjdLWbXKWmQQN/d1e3FJvnprvyQsdEVUq98MzKCuwpXRYBvk
         pkAg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8PD1P11HUTej0gqQ5FBk+GzaR1ajYmm1WKVT6ER5IYq+W08rgW0T4FwxrlayhAGKIgS2/5f+3jFKII2b+IrAnCXnCvNJ+sCYg3Ay9w==
X-Gm-Message-State: AOJu0Yz/KpELC8MOEmUCGkB2VSgXunUMteeAmDoivu5lpkMrSYdcq5nP
	yrXp8k2PW5Rb8WT/nRRFJ1cr8bERb/CecyfgFMBjsXx0ipDHp9u8N90aHUcYSPg=
X-Google-Smtp-Source: AGHT+IE7vw1r/9Y7G9J0ix6309xiLeagBgiZBiVv+LE/k4h7o5oLFCLiI/O9L56xF3fZG44ACc7p6g==
X-Received: by 2002:adf:ef11:0:b0:367:9718:5792 with SMTP id ffacd0b85a97d-367971859f4mr786905f8f.18.1720019533577;
        Wed, 03 Jul 2024 08:12:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367961a507csm1346306f8f.77.2024.07.03.08.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 08:12:13 -0700 (PDT)
Message-ID: <0c4b401e-86b8-4169-af88-475433012d67@linaro.org>
Date: Wed, 3 Jul 2024 17:12:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal: core: Call monitor_thermal_zone() if zone
 temperature is invalid
To: neil.armstrong@linaro.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2764814.mvXUDI8C0e@rjwysocki.net>
 <2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org>
 <8d91a3c1-018f-495b-83be-979b795b5548@linaro.org>
 <12c5c133-9519-4a26-b9a3-2da1d3466e94@linaro.org>
 <15b67ce6-3238-435d-ad28-7c06efbe9153@linaro.org>
 <ce6c2e8a-65a7-4cb2-a91d-fbcaeef6edc1@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ce6c2e8a-65a7-4cb2-a91d-fbcaeef6edc1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/07/2024 16:42, neil.armstrong@linaro.org wrote:
> On 03/07/2024 16:00, Daniel Lezcano wrote:
>> On 03/07/2024 14:43, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 03/07/2024 14:25, Daniel Lezcano wrote:
>>>>
>>>> Hi Neil,
>>>>
>>>> it seems there is something wrong with the driver actually.
>>>>
>>>> There can be a moment where the sensor is not yet initialized for 
>>>> different reason, so reading the temperature fails. The routine will 
>>>> just retry until the sensor gets ready.
>>>>
>>>> Having these errors seem to me that the sensor for this specific 
>>>> thermal zone is never ready which may be the root cause of your 
>>>> issue. The change is spotting this problem IMO.
>>>
>>> Probably, but it gets printed every second until system shutdown, but 
>>> only for a single thermal_zone.
>>>
>>> Using v1 of Rafael's patch makes the message disappear completely.
>>
>> Yes, because you have probably the thermal zone polling delay set to 
>> zero, thus it fails the first time and does no longer try to set it up 
>> again. The V1 is an incomplete fix.
>>
>> Very likely the problem is in the sensor platform driver, or in the 
>> thermal zone description in the device tree which describes a non 
>> functional thermal zone.
>>
> 
> It was at 0 but the delay was removed recently:
> https://lore.kernel.org/all/20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org/

Yes, these changes are because another change did:

commit 488164006a281986d95abbc4b26e340c19c4c85b
Author: Konrad Dybcio <konrad.dybcio@linaro.org>

     thermal/of: Assume polling-delay(-passive) 0 when absent

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c

> That doesn't explain it because only the last platforms have this error 
> message printed.

Let me recap.

It has been reported if a thermal-zone with zero delay fails to 
initialize because the sensor returns an error, then there is no more 
attempt to initialize it and the thermal zone won't be functional.

The provided fix will periodically read the sensor temperature until 
there is a valid temperature. When there is a valid temperature, then 
the interrupts are set for the previous and the next temperature 
thresholds. That leads to the end of the routine of initializing the 
thermal zone and cancels the timer.

The platforms you reported, the delay is zero (before and after the 
'polling cleanup').

My hypothesis is the following:

The thermal-zone29 describes a sensor which does not operate.

Before the patch:

First attempt to initialize it, the temperature is invalid, then because 
the delay is zero, the routine stops, and there is no more attempts to 
initialize it. Nothing will happen to this thermal zone and it will stay 
stuck silently. So at this point, the thermal zone is broken and you 
don't notice it.

After the patch:

The initialization routine is constantly retrying to init the thermal zone.

-------------------

If you revert the fix and you try to read the thermal zone 29, it should 
always fail to return an error.

If I'm correct, then I suggest to identify what thermal zone is 29 (type 
file), identify the node name in the DT, find the tsens channel and 
double check if it really describes an existing sensor



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


