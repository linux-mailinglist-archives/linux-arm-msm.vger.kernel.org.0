Return-Path: <linux-arm-msm+bounces-61242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5FAD8F9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D3D17E00C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CC2149DE8;
	Fri, 13 Jun 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yz5MBPn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5098318DB0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825208; cv=none; b=NQ+a7IdRhNzBxYeoRsAdtZOCo+GuAOoPzVPA9ZpsQFw2vyTIwIYdfU12/fV6lsExNjLPV3qkIrU64xP46t9rv2j9vfZNfBHa+mQzGMNmcw9ZQQndD036okrhzFai7s03bzp7X/PWOlyrWlBsTCTFIsoCriTZVis88WFF1wEjeQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825208; c=relaxed/simple;
	bh=WVPjwsbvnCLJBSObgDBQFwcWD+X0aMggdJGhkqv1wBA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HMV23svtmlpjIbJW5Bs2ZgrYarwIsZrHveuJQaCSyesH78SyUo8nBzfrxQ470DQUMGlfFC/3FN0QchJU937vi2NNsCYYWrQ49aKJ7n0v3Kp0jheiBw1OZKyQXc3ZW46k4JTWUeIhG9GxEA6z4REgYZdSgIUCu6RdsfKL/TXtKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yz5MBPn5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d54214adso18278155e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749825205; x=1750430005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=;
        b=yz5MBPn5jUlyoLXOCs0LxX/cxZF9wUHfZs4dw/QqAw37A9FRmmJTjfM3dIgQUYMIXQ
         BYby5abjy7njkXV5VQjDdlx7pvCuEylNTRbkdRyzRl5SnMBacc5m+Sfnuh8EkGNF6LhS
         yA2Vq8xqQv5WWKJeK8U+T2MuhyUBpWXgQHs1ZEfCRIhn1uDdwd26TECKQuToWCxeWdVT
         qIjLsIe5TwUCAVIVcPpyZTaodnSDzOQcZZAlT93A/6Fvt0gBsyDgA6Cjtf3u0hQkX+DO
         2fL1HcHj1ghL9WJ1SDaew//d+nTgFF3NtkdS6j9SuTDFwku+XP9c0OlkGvZeF2igAmID
         q6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825205; x=1750430005;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=;
        b=qVTn/kIUbSseXJu26J1XejVpqwjQsjt23rqf6I1dBLCtMU02KxeTDJVlRN0xGijSAz
         3Tr310qhESVxKgCb7dbruXyDMQqkg/dgaAWmRAU8tq5f1JdfBzIRk7V571dV1a8B0YVI
         pBwyzSYj2R/BV3LJHZdmDoDrVPI2lXAoJEbi6hpTIUDJdgnGluVX6/Fk/Eyy8v1IkAmr
         gB8NCccNe9c7MptOvKwEiWtUhKwng6fZbq0k1zq7eBsf06Wj/Na0b63NnoxHZAchD7jK
         9XXQTs+teSvptc9ueSpeEzUGy78GR0auZbzsnbfhJvCUl8+Kew5JNbWdXmadp4gPvCFo
         cD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTIyu3agMmm4+ibjOJOE1U80YTr3dc8PMTn9+xEMOweWk03tl3rn1wiUxX31hOx89Kb3QXOzEraYvu0bcx@vger.kernel.org
X-Gm-Message-State: AOJu0YwEChWODEAqxKdDI6XYWI9aWqpbhkG5kltxyJVi+nKVjfgFwzYD
	vaUUlOyC6MLT+orNu4Si7tYc/4TjGPaKRiCSdkwubpfO4zQD5kzWlEGD6S4v1Etx0WY=
X-Gm-Gg: ASbGnctMg5nqaoC2tWLV6jyJ4a9rdNb8aV8i3kFGVK++rMiMnvOJtxIe2NoG0M/FwX3
	DbqO+2Yq2nkaIFDjybF4uapT4ZwYc/tyDdCtDx7xr/sn5iJbd+4ejW8sOHKcMLwM68aqXH2bpH1
	ttvaaPioK4Q4F+7ziwOGRLorvymujmWt63KbBnNDeuRUyROoo/Ii/p4fcHxDwBjW3I9Z43EiVZA
	grCb6DBOXo8oYDj/vizHYl/2EMzWHFDktUdoeZKaxp5Q30TIdPz6hzVB3UFD+dc71iBVvIE637h
	k5b2opVzYGCnfPjVL5ij8zP5MBPHCLv8JgJDaGRim7WwkRtT9Au+EgokLmR82yOIPut0rxrI+lx
	dalaeXAteAAB30Gsq0DSMr4bBeAPegJItAdlB11E=
X-Google-Smtp-Source: AGHT+IHaqiDiPxrZkJtlgp01dU1UfqfhmbQn8nOwH2pzxfHuCnqJZ61g8lNlq6CgU9ZCy4LVF+0kjQ==
X-Received: by 2002:a05:600c:4f56:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-45334b153aamr39047735e9.13.1749825204341;
        Fri, 13 Jun 2025 07:33:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:1aa:e900:b5a7:96eb:d1b6:fda? ([2a01:cb1d:1aa:e900:b5a7:96eb:d1b6:fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm2516759f8f.100.2025.06.13.07.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:33:24 -0700 (PDT)
Message-ID: <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
Date: Fri, 13 Jun 2025 17:33:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
From: Eugen Hristev <eugen.hristev@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Content-Language: en-US
In-Reply-To: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/25 13:27, Eugen Hristev wrote:
> 
> 
> On 5/7/25 13:18, Thomas Gleixner wrote:
>>
>> $Subject: ... See
>>
>> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
>>
>> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>>> Add function to register irq info into kmemdump.
>>
>> What is irq info? Please explain explicitly which information is exposed
>> and why.
>>
>>>  
>>> +void irq_kmemdump_register(void)
>>> +{
>>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>>> +}
>>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
>>
>> Are you going to slap a gazillion of those register a single variable
>> functions all over the place?
>>
>> That's a really horrible idea.
>>
>> The obvious way to deal with that is to annotate the variable:
>>
>> static unsigned int nr_irqs = NR_IRQS;
>> KMEMDUMP_VAR(nr_irqs);
>>
>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>> kmemdump specific section and then kmemdump can just walk that section
>> and dump stuff. No magic register functions and no extra storage
>> management for static/global variables.
>>
>> No?
> 
> Thank you very much for your review ! I will try it out.

I have tried this way and it's much cleaner ! thanks for the suggestion.

The thing that I am trying to figure out now is how to do something
similar for a dynamically allocated memory, e.g.
void *p = kmalloc(...);
and then I can annotate `p` itself, it's address and size, but what I
would also want to so dump the whole memory region pointed out by p. and
that area address and size cannot be figured out at compile time hence I
can't instantiate a struct inside the dedicated section for it.
Any suggestion on how to make that better ? Or just keep the function
call to register the area into kmemdump ?

Thanks again,
Eugen
> 
> Eugen
>>
>> Thanks,
>>
>>         tglx
> 


