Return-Path: <linux-arm-msm+bounces-26313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC0932453
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25BD81C21CDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFB71422D4;
	Tue, 16 Jul 2024 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJ/R3dx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B2B42070
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721126894; cv=none; b=F7+3S4IoJl9On5Cx2qkhpfa+f8uogHADvIF/mlFZjtgi6+ag69zXwn++Mu0/uHDdcMzJ0cej2Rx7sPjVH/39AzJiFd79g8tRVHOn2KcwexXSGbKQ/X4ZEBWqNCZ34FM5dKv+6b6Tk0do1daIMw0C6r/LPwROXSZyQyS3rUq6Fng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721126894; c=relaxed/simple;
	bh=k2TvcEmB/ryg67XMa4uZcyZDgHRRsoDA8kgAOqbSvUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CK6n/bJ/D/qQi/+18pIpZre/6dvyOmC2Ddsdda4k2Srkw4N6ErCNH5WZKKutXk6gzdeOcILZnmLjg9Gu2IhUtYJyn0YydPb3oUq0ZndrL1vHb/jM1JSiNYZ0mq7OwKzezV4T5/a53L/0cANVxdCAn3WNt8MOBNsdMHafgaPBj8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJ/R3dx0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-595850e7e11so6627726a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721126891; x=1721731691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b9+AqXcsl/weoU0tXvtP0PfAHHj6VzC16r+Lg+jKwkc=;
        b=PJ/R3dx0ljeYKeLAAIfGYVgAGtXlPY+sDOCdOpyGYma8BH7trNMTkYSgkVbqyTeL8N
         hMYeodYUs3gxWXxHHcok1HaAUtia3j+tNbUsdY/zgKyPS5CzcprWhry7xvVHjngkjwn7
         UMwGxv6QWbc6JLAfK2mTG8GJnWMg1z292P53yZBpyX/j4SB0VSEi1M2eE8QasXPHquy8
         iMCpxAZYRreIHyprp0MohifOeNYc6b1lsXV/gTW9kI5XltCIlIEUQYgb8yW9hrcr6aIg
         1eD8a+X5ZAIVTb2I7zIEZRxPD0/oXZH8iiNRVi3QNdRt7lP9LvVtYmjEhUEsNH0lljuk
         yLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721126891; x=1721731691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9+AqXcsl/weoU0tXvtP0PfAHHj6VzC16r+Lg+jKwkc=;
        b=RxMEI4pxFSmUGFC7r4mcB9VHUc+A2zG6lVTaj/WACfFL3NR6EjjCtDfiEzbAcgaqxo
         Dpmf0f8A/kqdx6PY2vrN7+MUlwkRdVk0w4COI9KPxps2gzZRC4/tDHiQoZoU9GBz6L49
         Bd8osWWhxFpCwdl6Ev5UrRY6yyY8zPSMQSOUYTxL1Cljt3buZdSfdo15cr5ZUlz4vAp3
         0yRoA5uRCuIJvxV8ztA8Z70RiTz56watRjP85yrOsWbB53m06i447qXlAfYM0nVJHyGC
         KhnCNgg63mtpZL0+/HmSoAkn+JuztdFkWF4SvWlQCl8nYV5EK5ge+Ao3COsG3eCG7ly+
         rE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJeeJg9qe9vv+fh4z1ZK1pE3OseeOoDZXVeVw9lu9guW3rvxSmvVhK/chIaJNH6w07czd6zWIYw6iClDJAUHExCyzMASMaRyiCmCcrhQ==
X-Gm-Message-State: AOJu0Yxofh5JEoElECEzvDGMmAoaAqqb4wZKp55SLmbQN5J8g5voMZUM
	g7ooVI3VApdJQXSnhZninYpPPPG+Qacwnj9nxqDa/HdITeG8sd3wpHLFeo/UvC1l4xyjaoR3rWv
	e
X-Google-Smtp-Source: AGHT+IFAVo8y981VQPV3hpAJCUplw06/VqfD6UbO92mSt28qGEgJ4Ny7ShTjrKxPUIV+N/iISlTYYA==
X-Received: by 2002:a17:906:b891:b0:a77:cb7d:f359 with SMTP id a640c23a62f3a-a79eaa40bdbmr112391266b.58.1721126890557;
        Tue, 16 Jul 2024 03:48:10 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b8387sm293656466b.66.2024.07.16.03.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 03:48:10 -0700 (PDT)
Message-ID: <00fb0782-0afc-4744-ad93-437712a9fcd9@linaro.org>
Date: Tue, 16 Jul 2024 12:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: qcom: Add missing iounmap() on errors in
 msm_dt_timer_init()
To: Ankit Agrawal <agrawal.ag.ankit@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240713095713.GA430091@bnew-VirtualBox>
 <20240713102820.GA430622@bnew-VirtualBox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240713102820.GA430622@bnew-VirtualBox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.07.2024 12:28 PM, Ankit Agrawal wrote:
> On Sat, Jul 13, 2024 at 03:27:13PM +0530, Ankit Agrawal wrote:
>> Add the missing iounmap() when clock frequency fails to get read by the
>> of_property_read_u32() call, or if the call to msm_timer_init() fails.
>>
>> Fixes: 6e3321631ac2 ("ARM: msm: Add DT support to msm_timer")
>> Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Changes in v3:
>> - Update patch commit message
>> - Link to v2: https://lore.kernel.org/linux-arm-msm/20240712082747.GA182658@bnew-VirtualBox/
>>
>> Changes in v2:
>> - Add iounmap() if msm_timer_init() fails
>> - Update patch commit message
>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20240710110813.GA15351@bnew-VirtualBox/
>> ---
>>  drivers/clocksource/timer-qcom.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
>> index b4afe3a67..eac4c95c6 100644
>> --- a/drivers/clocksource/timer-qcom.c
>> +++ b/drivers/clocksource/timer-qcom.c
>> @@ -233,6 +233,7 @@ static int __init msm_dt_timer_init(struct device_node *np)
>>  	}
>>  
>>  	if (of_property_read_u32(np, "clock-frequency", &freq)) {
>> +		iounmap(cpu0_base);
>>  		pr_err("Unknown frequency\n");
>>  		return -EINVAL;
>>  	}
>> @@ -243,7 +244,11 @@ static int __init msm_dt_timer_init(struct device_node *np)
>>  	freq /= 4;
>>  	writel_relaxed(DGT_CLK_CTL_DIV_4, source_base + DGT_CLK_CTL);
>>  
>> -	return msm_timer_init(freq, 32, irq, !!percpu_offset);
>> +	ret = msm_timer_init(freq, 32, irq, !!percpu_offset);
>> +	if (ret)
>> +		iounmap(cpu0_base);
>> +
>> +	return ret;
>>  }
>>  TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
>>  TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
>> -- 
>> 2.25.1
> 
> Hello maintainers, 
> 
> Could you please suggest the next steps that should be taken to move
> this patch further. From what I understand, the merge-window for the
> next stable kernel release (v6.11) is open, and I would be very much
> grateful if I could get help on moving this patch further.
> 
> Also, please let me know if I need to make any changes to the patch in
> order to finalize it :)

The merge window is named very confusingly.. it's when your patches are
NOT merged, but rather the patches accumulated in the maintainer trees
are sent to Linus Torvalds, where he merges each one of them and runs
some tests to make sure nothing broke. Your patches will be picked up
after 6.11-rc1 drops, and (unless they're fixes) will be scheduled for
6.12

Konrad

