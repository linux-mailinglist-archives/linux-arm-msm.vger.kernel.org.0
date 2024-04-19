Return-Path: <linux-arm-msm+bounces-17903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E024E8AA653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 02:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 101171C20AEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 00:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6E463E;
	Fri, 19 Apr 2024 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoHeQSpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08D64A
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713487603; cv=none; b=ajQr09eN+1xrdzMoMINqDsn5rvyeBsIu/huMh+cTacA+9gwd70jt4OEV/oNFlBoArYqpRJzv9zvURFMCFICbuj9aA2kMi7UplQboon2gX5pDE8//HHIa90Xz71mg6ma1nGuZnl9WQ6EWYIqgktOBjYXaDDuz8a5r7vWxyr/4wQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713487603; c=relaxed/simple;
	bh=SAxwfbUODKuVZAjbg4c/ynrHR8AgFFORXQJplr0LD0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U74guHJTkaZeE5FoKbgXYPqPMrA6AlLfG/W6RsQrK6CRCDvM5MZdPeDxzBe5bT4H2TdTLtQvopwYWJyI9zXtTok3ndmbhJeyudiXql9AgMATlUYKijD8sxObJrmTO6RLFcnpVYQ3s0sCl/X//8KTtpJ4ulLi4vi5H8xqd7yiwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aoHeQSpw; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61ac183ee82so22524227b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 17:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713487601; x=1714092401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pc2K8oSIkotNB7jJyCQuIZXRU6et6cxNtG+X9+wOPdo=;
        b=aoHeQSpwvAlLt95baNIHl+F8Ul2uCXeMaX47VKhkcnpvawVmACbeFstUt0KTes1vlT
         P9zbq54ubf9x8dTy08faGjpYN2zE5s7WMRFI3h8cEqx0DosPFnEb7UOuUNmHoJSkPqvb
         OazrqAKCt4oD/q6JAlw3FeqxcL2+zuxzPPJrA7kYSx3T5vtuWPhgkqnvnTr81PZpGWP1
         KMM8pKjhGam3sOCB6DwKup0Smm4aP+hmAi3rDnUKf2lkKaHpuU9jp8MmO3FioCTghG4I
         +L/jpFH38MBpsTYq72LnRLBmWDSCoxZSwu8+d63dgkAdPR+5VLrHhRfJUxIDUErbEv+v
         jaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713487601; x=1714092401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pc2K8oSIkotNB7jJyCQuIZXRU6et6cxNtG+X9+wOPdo=;
        b=wzgFkEgpyRcrsiCrxFb1IgYyB4hR+T9yoRr7LuN6A07W9DU2rCQHwCM299K2pFPhDQ
         bEdbQ9Q4uCuM4hu6ng6TkAM7HLemgzaInunVMwLjRKSWK/f/owEM4mZD8FVE5w7WJMYk
         ZjsBz4HyWmPyTk+LkgPnLrmCpIf+CPFwdd0qC4a6zxbGQfjkiI7Nk7GsPOOv0Em0UTKt
         4DqKIpxR+bs94pEnk2gEy3hv8A9nM8//sRebW3zoXYLZz3ZOTiUhI3y0vAXDEm2/aYY0
         sr1TQ6O+3ClQ93yxugyqcE3SP9I2HcyBmtQ6NaNnV9dqjdrYP7zMA3nLSPNN8F8+q2Rg
         Kzyg==
X-Forwarded-Encrypted: i=1; AJvYcCWWX2sVF3BgWKK40LIno8Zxf7m6BvVIPF7GKg0cYAS6lbX83nvijzLJ3BAusgnH1jR9ips8agfTX71nCCW/oMVqwwzdysbCVx4d8oddSg==
X-Gm-Message-State: AOJu0Yz6Ws68EsKcyc5fhiD/+Nz/bEmlUSr7AtMC1UpfV1oGQZUGuQiQ
	z7B5UEL8eTQpZyYIfMNM0mFGQAgA76hyv/tJekLSzJWcb9Z6RlSEDOcbvCfO5TQ=
X-Google-Smtp-Source: AGHT+IF9ox7XbuwU6pn2xh/zYYuFHCg4Tx9H6JkTzr7/7WPL8AC/fAwnxlf8VeYoxCBjnfRBP9KNDA==
X-Received: by 2002:a0d:cc87:0:b0:61a:e7db:5f81 with SMTP id o129-20020a0dcc87000000b0061ae7db5f81mr3097958ywd.18.1713487601185;
        Thu, 18 Apr 2024 17:46:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id t192-20020a0deac9000000b0061accf6a37esm561363ywe.131.2024.04.18.17.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 17:46:40 -0700 (PDT)
Message-ID: <b675810d-d06b-454e-9726-c987603453e7@linaro.org>
Date: Thu, 18 Apr 2024 19:46:38 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/8] net: ipa: maintain bitmap of suspend-enabled
 endpoints
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: mka@chromium.org, andersson@kernel.org, quic_cpratapa@quicinc.com,
 quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
 quic_subashab@quicinc.com, elder@kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240418204729.1952353-1-elder@linaro.org>
 <20240418204729.1952353-2-elder@linaro.org>
 <2614c8b3-ee7f-4ac0-9b43-20905759756e@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@linaro.org>
In-Reply-To: <2614c8b3-ee7f-4ac0-9b43-20905759756e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/24 6:52 PM, Bryan O'Donoghue wrote:
> On 18/04/2024 21:47, Alex Elder wrote:
>> Keep track of which endpoints have the SUSPEND IPA interrupt enabled
>> in a variable-length bitmap.  This will be used in the next patch to
>> allow the SUSPEND interrupt type to be disabled except when needed.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>   drivers/net/ipa/ipa_interrupt.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ipa/ipa_interrupt.c 
>> b/drivers/net/ipa/ipa_interrupt.c
>> index c44ec05f71e6f..0e8d4e43275ea 100644
>> --- a/drivers/net/ipa/ipa_interrupt.c
>> +++ b/drivers/net/ipa/ipa_interrupt.c
>> @@ -37,11 +37,13 @@
>>    * @ipa:        IPA pointer
>>    * @irq:        Linux IRQ number used for IPA interrupts
>>    * @enabled:        Mask indicating which interrupts are enabled
>> + * @suspend_enabled:    Bitmap of endpoints with the SUSPEND 
>> interrupt enabled
>>    */
>>   struct ipa_interrupt {
>>       struct ipa *ipa;
>>       u32 irq;
>>       u32 enabled;
>> +    unsigned long *suspend_enabled;
>>   };
>>   /* Clear the suspend interrupt for all endpoints that signaled it */
>> @@ -211,6 +213,7 @@ static void ipa_interrupt_suspend_control(struct 
>> ipa_interrupt *interrupt,
>>           val |= mask;
>>       else
>>           val &= ~mask;
>> +    __change_bit(endpoint_id, interrupt->suspend_enabled);
>>       iowrite32(val, ipa->reg_virt + offset);
>>   }
>> @@ -246,7 +249,16 @@ int ipa_interrupt_config(struct ipa *ipa)
>>       interrupt->ipa = ipa;
>> -    /* Disable all IPA interrupt types */
>> +    /* Initially all IPA interrupt types are disabled */
>> +    interrupt->enabled = 0;
>> +    interrupt->suspend_enabled = bitmap_zalloc(ipa->endpoint_count,
>> +                           GFP_KERNEL);
> 
> why not use devm_bitmap_zalloc() instead and skip managing the cleanup ?

I don't use the devm_*() variants in the IPA driver.

I know I can, but if I'm make the switch I want to
do it everywhere.  Not now.

Thanks for the review.

					-Alex

>> +    if (!interrupt->suspend_enabled) {
>> +        ret = -ENOMEM;
>> +        goto err_kfree;
>> +    }
>> +
>> +    /* Disable IPA interrupt types */
>>       reg = ipa_reg(ipa, IPA_IRQ_EN);
>>       iowrite32(0, ipa->reg_virt + reg_offset(reg));
>> @@ -254,7 +266,7 @@ int ipa_interrupt_config(struct ipa *ipa)
>>                      "ipa", interrupt);
>>       if (ret) {
>>           dev_err(dev, "error %d requesting \"ipa\" IRQ\n", ret);
>> -        goto err_kfree;
>> +        goto err_free_bitmap;
>>       }
>>       ret = dev_pm_set_wake_irq(dev, irq);
>> @@ -270,6 +282,8 @@ int ipa_interrupt_config(struct ipa *ipa)
>>   err_free_irq:
>>       free_irq(interrupt->irq, interrupt);
>> +err_free_bitmap:
>> +    bitmap_free(interrupt->suspend_enabled);
>>   err_kfree:
>>       kfree(interrupt);
> 
> You could also use devm_kzalloc() and do away with the kfree()s you have 
> here on the probe path.
> 
>> @@ -286,6 +300,7 @@ void ipa_interrupt_deconfig(struct ipa *ipa)
>>       dev_pm_clear_wake_irq(dev);
>>       free_irq(interrupt->irq, interrupt);
>> +    bitmap_free(interrupt->suspend_enabled);
>>   }
>>   /* Initialize the IPA interrupt structure */
> 
> Just suggestions though.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


