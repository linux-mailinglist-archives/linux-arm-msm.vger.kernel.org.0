Return-Path: <linux-arm-msm+bounces-47153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C762A2C537
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AA921884ACC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 14:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F0423ED75;
	Fri,  7 Feb 2025 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ft6ssc/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928C23ED6A
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938513; cv=none; b=kEMo3MqRp8Vabw/09+zcSYTFAGDuiQaHh1sihyu2H/mnpNhyWMYwy188/qBapMlOgNFc/hzErM/YclkKgjLIagpOYhaGpz1tjqGgDcLkLvURnOHeFNIQiZiFdNcT4LholaMFcHWoJEUn2s4ChOojQhC/Y21Bh+4UOcJEdOpS7KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938513; c=relaxed/simple;
	bh=kF2P7UJ2/6y3WpPSV8krYxKM9u/ytAMh+5ZbfbGrSUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nO5g4JOWgwB7oBlwTIIxjtZ3UDDgvD4PIaGJedNv0kW0aytWssO5OYseUNJJwCT5N3a9JelLFBAqFrlDQCymEH/QeIcFEqECcr5dHYBj3kCqb/CaL1UC8LAJReb1syZb2gUbVc2auJYdW6u+szPES/hTQFij5xgcJFQWtIp7oMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ft6ssc/8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so506942f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 06:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738938509; x=1739543309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+0Zo3Irfm0awqNsA05CYxKrUZTvTNWuRwnsqK1TruQ=;
        b=Ft6ssc/8uwCzTavZHq5mPvaMfPkQaJ9VeaiJloD1FOpqmZ32mc/wrhxYVruMBoRyKQ
         ITtGl9vQ20biwszH7P4chd8DxlPZyS2UlA+5MP+RzTb6L2WkdStSO6toh7fJtJdyY2l9
         OHfmBfCj87J5ISb8NtMMkDl3LfMf1OBBEfbeM/hSttrmY/Oxv/ffuwPMZLkZKrIn9V8b
         OhtQZjHZtxfuUYFMfoYq9XOfCfd4n36ypTMtjMer2C0TGle66l4+XoLLPsTPPNCdqjfk
         iRPYri6rwNwOOS95F8ryNwQPiqAx6/d9y3jf/iOaLPPBzIayTRxHk1iBkdjSgVbcgatk
         fskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938509; x=1739543309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+0Zo3Irfm0awqNsA05CYxKrUZTvTNWuRwnsqK1TruQ=;
        b=FRMA/1DvykttVtrOSWBHBiyErnt0AOlZJDbZjOyjYC0VSvZUn9hPbjK44m8rQNeQ/+
         lcCL5rQwf3JDm80RctIMrnaVTDkqls7dWN8g823KOLE3UxjmNEpiPPlc/bCamASMTOWJ
         PRKaKF4aC+zAGVgaSNJ9XTU77V5nkgUZZYuK76r70ZphuOesX0Ji+/CwtyuAFo0QyZ5y
         Cw3QNPm9qjJFKG+u6cI9jX0CzcdkEvWQrrj3DcgGKr+K45KLcDVjjLF2PEbEG8ixX929
         RlyhxpE5xfSbioM4u1XHRWMY2DDgV56dY3G2epNDTyNJ4Xtu7UGfoV24N23rTDLPG+wK
         /ybA==
X-Forwarded-Encrypted: i=1; AJvYcCWSZhNe4XpeJNr5rKgRI8gXGRFa2IPJT7pzf1CYhnw6xLJa3QPd+mirY6/allmkmzl5/6r03ByrFvjxZu95@vger.kernel.org
X-Gm-Message-State: AOJu0YwcF/ps+0r5uqT3UZE2NRVqnvpelv0j/T4l4yqWK0VHpWrp8kT5
	M+N+Piyfw99+gPRyx6jNCgnEBLLvOLopxyjyk9nPvKzGOGeNloUFaARqsM/fED8=
X-Gm-Gg: ASbGnctm07bk7XZFjeISGhQYTFeI0Zr1nC6fl8n5fniSBgXTdMzuM1haIFbinNHhzYA
	/ii6QqpSh/GdBuB3jiWOzWEScbPjtXlLTZKaaoyjfXJBVNfUl1aeadzeZ5uZeIkHjI8sUbCC41n
	lb7MkbN+ODZyfmxmvA75Ac4/7hGSc5oH5ZA3s86YLs0oLxGKPeDY1RpUGwGbCok9mmL/76CEvul
	Rc9Qe9cok3eoNL6VSvbUDpcX/btP5Tz5fvmTQJAWuSKVuqU+dRqxy1i3ZoSBZbZHyeNTytfG5Pr
	oZmtjKQqzH6l6j5jhDnl2wDtQvGbopiD0/jXzLvkKexL+u6b1ltrZip0TcuJOyRjyQo=
X-Google-Smtp-Source: AGHT+IHSnYPi+VWB/koCvYMuqaAx5V9VQ7n5+TgMSkPW4LwkB6qLvvpt94L5/SXneb5V5Wf0IhKm8w==
X-Received: by 2002:a05:6000:1562:b0:38a:88bc:d57d with SMTP id ffacd0b85a97d-38dc8d9bd18mr2597698f8f.2.1738938509314;
        Fri, 07 Feb 2025 06:28:29 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:88:c96c:f11d:1729? ([2a0a:ef40:1d11:ab01:88:c96c:f11d:1729])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fa72sm4631167f8f.74.2025.02.07.06.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:28:28 -0800 (PST)
Message-ID: <1f82ad2a-fdb0-41e6-a9cd-02f7ad2978de@linaro.org>
Date: Fri, 7 Feb 2025 15:28:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] soc: qcom: pmic_glink: Fix device access from worker
 during suspend
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
 <8aef8331-662d-49ee-a918-8a4a5000d9ec@kernel.org>
 <7nce4if7gowtbvenqhwzw6bazgfcgml6enwufomqxs4uruj3vs@sgagkj3zpx4t>
 <Z5nq3Y7YOyxwqcmg@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <Z5nq3Y7YOyxwqcmg@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/29/25 09:46, Abel Vesa wrote:
> On 25-01-11 13:22:12, Bjorn Andersson wrote:
>> On Sat, Jan 11, 2025 at 04:35:09PM +0100, Krzysztof Kozlowski wrote:
>>> On 10/01/2025 16:29, Abel Vesa wrote:
>>>> The pmic_glink_altmode_worker() currently gets scheduled on the system_wq.
>>>> When the system is suspended (s2idle), the fact that the worker can be
>>>> scheduled to run while devices are still suspended provesto be a problem
>>>> when a Type-C retimer, switch or mux that is controlled over a bus like
>>>> I2C, because the I2C controller is suspended.
>>>>
>>>> This has been proven to be the case on the X Elite boards where such
>>>> retimers (ParadeTech PS8830) are used in order to handle Type-C
>>>> orientation and altmode configuration. The following warning is thrown:
>>>>
>>>> [   35.134876] i2c i2c-4: Transfer while suspended
>>>> [   35.143865] WARNING: CPU: 0 PID: 99 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
>>>> [   35.352879] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
>>>> [   35.360179] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>>>> [   35.455242] Call trace:
>>>> [   35.457826]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
>>>> [   35.463086]  i2c_transfer+0x98/0xf0 [i2c_core]
>>>> [   35.467713]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
>>>> [   35.473502]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
>>>> [   35.478659]  _regmap_raw_write_impl+0x780/0x944
>>>> [   35.483401]  _regmap_bus_raw_write+0x60/0x7c
>>>> [   35.487848]  _regmap_write+0x134/0x184
>>>> [   35.491773]  regmap_write+0x54/0x78
>>>> [   35.495418]  ps883x_set+0x58/0xec [ps883x]
>>>> [   35.499688]  ps883x_sw_set+0x60/0x84 [ps883x]
>>>> [   35.504223]  typec_switch_set+0x48/0x74 [typec]
>>>> [   35.508952]  pmic_glink_altmode_worker+0x44/0x1fc [pmic_glink_altmode]
>>>> [   35.515712]  process_scheduled_works+0x1a0/0x2d0
>>>> [   35.520525]  worker_thread+0x2a8/0x3c8
>>>> [   35.524449]  kthread+0xfc/0x184
>>>> [   35.527749]  ret_from_fork+0x10/0x20
>>>>
>>>> The solution here is to schedule the altmode worker on the system_freezable_wq
>>>> instead of the system_wq. This will result in the altmode worker not being
>>>> scheduled to run until the devices are resumed first, which will give the
>>>> controllers like I2C a chance to resume before the transfer is requested.
>>>>
>>>> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
>>>> Cc: stable@vger.kernel.org    # 6.3
>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>
>>> This is an incomplete fix, I think. You fix one case but several other
>>> possibilities are still there:
>>>
>>
>> I agree, this whacks only one mole, but it's reasonable to expect that
>> there are more hidden here.
>>
>>> 1. Maybe the driver just lacks proper suspend/resume handling?
>>> I assume all this happens during system suspend, so what certainty you
>>> have that your second work - pmic_glink_altmode_pdr_notify() - is not
>>> executed as well?
>>>
>>> 2. Follow up: all other drivers and all other future use cases will be
>>> affected as well. Basically what this patch is admitting is that driver
>>> can be executed anytime, even during suspend, so each call of
>>> pmic_glink_send() has to be audited. Now and in the future, because what
>>> stops some developer of adding one more path calling pmic_glink_send(),
>>> which also turns out to be executed during suspend?
>>>
>>> 3. So qcom_battmgr.c is buggy as well?
>>>
>>> 4. ucsi_glink.c? I don't see handling suspend, either...
>>>
>>> Maybe the entire problem is how pmic glink was designed: not as proper
>>> bus driver which handles both child-parent relationship and system suspend.
>>
>> The underlying problem is that GLINK register its interrupt as
>> IRQF_NO_SUSPEND (for historical reasons) and as such incoming messages
>> will be delivered in late suspend and early resume. In this specific
>> case, a specific message is handled by pmic_glink_altmode_callback(), by
>> invoking schedule_work() which in this case happens to schedule
>> pmic_glink_altmode_worker before we've resumed the I2C controller.
>>
>> I presume with your suggestion about a pmic_glink bus driver we'd come
>> up with some mechanism for pmic_glink to defer these messages until
>> resume has happened?
> 
> So is the suggestion here to rework the entire pmic_glink into a bus
> driver? (I like the sound of that)
> 
> I'd assume the new bus driver will have to queue the messages until it
> has resumed, which is fine.
> 
> But still doesn't solve the fact that we can't filter out when to
> wake-up or not. What am I missing here?

Some kind of mechanism for devices on the GLINK bus to either:

* Have a callback which gets called even in suspend to "peek" messages 
and either drop them, defer until resume, or trigger a wakeup. This 
could call all the way into battmgr which could determine if a power 
cable was just plugged in for example.

* More ideally, if the message format is consistent/simple enough they 
could just tell the GLINK bus to wake up if certain bytes have certain 
values in a message, not sure if the firmware is nice enough to make 
this viable though.

> 
>>
>> As you suggest, I too suspect that we have more of these hidden in other
>> rpmsg client drivers.
>>
>>
>> In the discussions leading up to this patch we agreed that a better
>> solution would be to change GLINK (SMEM) to not deliver messages when
>> the system is suspended. But as this has an impact on how GLINK may or
>> may not wake up the system, Abel's fix is a reasonable stop-gap solution
>> while we work that out.
>>
>> That said, this backstory, the description of the actual underlying
>> problem, the planned longevity (shortgevity?) of this fix are missing
>> from the commit message. As written, we could expect a good Samaritan to
>> come in and replicate this fix across all those other use cases,
>> contrary to the agreed plans.
>>
>>
>> @Abel, can you please make sure that your commit message captures those
>> aspects as well?
> 
> Sure, will through the backstory and the reason this is a temporary fix
> with the hope that this is all going to be reworked soon.
> 
>>
>> Regards,
>> Bjorn
> 
> Thanks for reviewing,
> 
> Abel

-- 
Caleb (they/them)


