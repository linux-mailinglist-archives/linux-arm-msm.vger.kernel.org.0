Return-Path: <linux-arm-msm+bounces-25916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FEC92E1B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39B321F23D15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F273144D00;
	Thu, 11 Jul 2024 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0HG5tTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810B15572D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685487; cv=none; b=f4YmpfV8sjLd6p6j0TnaHDqcO0q82Vjkn9ROXicJZvxvDfu+G0WURdYe2kWw0fbTllo+maEX8J91ILMt8vdPT7TFCMLHZ9/j+QsL+dT9+9MWT4h2TT3N90tvcvjniplHtETIMKFVPV3FWxQeqxJnfQZh5BRfurmxFSJPFebpfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685487; c=relaxed/simple;
	bh=iMythZ4spO/Biytde4szQyz9mOqQV14m2Oq8g1bV+7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyscL89DTmuGt3U4OogngxQ9MqQ1qREfG5NadB0gyGqLNs8nvPGd7g9feUDmw9U5a3uJKKH99MME3I6nVvq/PwaXjXKjOOgOxB1sjKM0HmY+N0wA+Veq6c+cxR3I7ySlZCd3tY7v+yMqfoo5Cmpw4Tiy/7Tv7aqkvnyTg8QMY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0HG5tTc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58c947a6692so813641a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720685484; x=1721290284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=niV9tiL6rOGPpfZ78pXyNB0mnEQ5mdtyyxgz613qVhg=;
        b=t0HG5tTcc3jIPg+a4bSZEBR0x3540kF57HKW8nrt7ES6NMn2MLGIG+QKEUKnEHJql3
         Gn8MWXDZJnmK5Dn/rWpMVDjf/1PpFIcpkV5VVYA7U5MSJ07b3t3xRnQJQrPlrkuqhdT3
         e7vgB/XLgsiZDRUnSDyU7LTbIsw4pdIaEqE6rUn61eX1UoRoCjsbI8tvvv1/bQ82QQen
         vRl6cGwavgTniYNLvdbUe2/ntznhdKQjtyDwQdgxBOwG0izBmIfG8dYNWEf3XGdjstCk
         Rgl1syuC6uAo7ZMwSeEDh0txP28DPbBLGKq7curHM1vDBZV8WlpoCVz096c3BYd/HPgK
         VhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720685484; x=1721290284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niV9tiL6rOGPpfZ78pXyNB0mnEQ5mdtyyxgz613qVhg=;
        b=iZ+91VKfx444bw0lGU53rXtNVDxBzKhiuMH533daAB5EJrMNx9/4/FlTqfKlJYGWhB
         oCbu3CNaXUkxAh6tXzF56ECT2u3xraZRk4kIvaDwT6TDIoQZO79bYewQ6dmBgcvV5yCG
         RNHdr4DoxmxCxGX/V/MQWjG0v46QwjxJEYm3RnvfWbALsGnNKrXmaqXqSGpIReAhY9+f
         Gwec/mCnxkQ+emtDjylOyFM9um41FicSSWwp9eujYr3ut+VvUrtSkpPUFDWACCN5ELBN
         tA8bMQRVVuhnTjp+w8ksSqLnt9rkkesGCxKlrL+c6aK2g3lMkyn7FQL+KgnIDsJ8zN9Q
         oDsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNHhn7x4wfFMn+IXrdsHUm42416TjU8ue/oRFMfMh86Z90/71bDyp6+z3xt43Sob59UdxgRx3m5ukjL7wP/JuD8jhOQVQKGCXR8f+ykw==
X-Gm-Message-State: AOJu0YyYAm8PaAgQM9be5QEjW3ivnzlE/71NqE3voym5es700XFAN1VE
	Pim7/dGXFUNcssryhKD0i/gItXb1PIVM3bSpDfAmX1JiZsNcofMbFvRCLv4JuG0=
X-Google-Smtp-Source: AGHT+IEKGmaUdNaP04QM8miENIIqwunFVuB1MExZb969pIftcWttIu+vtOokzcG5ZkocnPhmEzsF8A==
X-Received: by 2002:aa7:df82:0:b0:58a:f747:15b with SMTP id 4fb4d7f45d1cf-594bbe2cdc6mr3570847a12.42.1720685483542;
        Thu, 11 Jul 2024 01:11:23 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc4e8255sm3156923a12.48.2024.07.11.01.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:11:23 -0700 (PDT)
Message-ID: <793b70b2-d6c1-4e4b-96a5-8a257837eafb@linaro.org>
Date: Thu, 11 Jul 2024 10:11:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/clocksource/qcom: Add missing iounmap() on error
 when reading clock frequency.
To: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710110813.GA15351@bnew-VirtualBox>
 <2a3561cc-c6b3-4823-b488-fc8ebc53e1a6@linaro.org>
 <20240711054934.GA37910@bnew-VirtualBox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240711054934.GA37910@bnew-VirtualBox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2024 7:49 AM, Ankit Agrawal wrote:
> On Wed, Jul 10, 2024 at 01:54:01PM +0200, Konrad Dybcio wrote:
>> On 10.07.2024 1:08 PM, Ankit Agrawal wrote:
>>> Add the missing iounmap() when clock frequency fails to get read by the
>>> of_property_read_u32() call.
>>>
>>> Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
>>> ---
>>
>> Or even better, you can extract:
>>
>> drivers/platform/x86/intel/pmc/core_ssram.c
>> 32:DEFINE_FREE(pmc_core_iounmap, void __iomem *, iounmap(_T));
>>
>> into a common header, call it something less intel-specific and use
>> it with __free() here
> 
> Can you please give a place where adding it would be appropriate? I am
> new to contributing here, so any guidance on where to add the
> DEFINE_FREE would be really helpful!

I'd say include/linux/io.h sounds alright, but worst case scenario the
maintainer of that file will ask you to move it somewhere else

> Also, just trying to think out loud. Will the cpu0_base pointer (and
> also the source_base pointer) be required once this function exits? If
> so, I think I will also need to use no_free_ptr() to ensure that the
> memory doesn't get iounmap-ed once the function exits.

Ohh right source_base is a global variable.. perhaps the original patch
here makes more sense given we definitely don't wanna unmap that..

So I'd say let's go with this one after all

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

