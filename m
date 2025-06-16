Return-Path: <linux-arm-msm+bounces-61413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC7ADAD1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 12:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6272166545
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 10:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3053A273D9F;
	Mon, 16 Jun 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yON3bbUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10F25E450
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068783; cv=none; b=Pq//DWHxnE6N/PsBAUJKzgWnQAx6pRaZLxUFk/igMfr+GNNcke1F2qvUiC/fVmX5yKYn3iJAB6WrokB+tU7BSse9ZYZI+oT150C5IB/2k2XrgLmawMcPx0p2N5MmTtp5lKaDluXwEvUBicnXtAC99ZxqF8aUzkJqR7/LY0HXJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068783; c=relaxed/simple;
	bh=AGLdc8sUlEHbNtvihWlXNY6ZuP0jWSwRkeYw87Ib8XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrEF1EnwKtGdwCjW6x+pTlyp3UGFKVA/wtJl2Y0IjWfe/4efrp3z6cSkK5fWyGYs9PTtSoGPnLI5ABEvazY8EWBQRGJyFjDY7ZpoGllCatBfWBBAdoSUAOwWQmrmTqaxYwLzBuAdabf3GjlgSDoaJjyF55lb15PG67xQ5RU4kqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yON3bbUg; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addda47ebeaso861056666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 03:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750068779; x=1750673579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdiI/smVJOY0cX4ZuH0mmdvKWwyCh8vEN4C+U7z3NJo=;
        b=yON3bbUgP1w5+T6Y/Ni6PASdj4tsCQEDqxhtU9QhVVo6DjgDSAehvo2KAwmvbApth8
         9rcUPSlBFxXoD6r000Y9eiOYvtBF1qXx4QmjGBR0yEA38odxBl7YTuVgh8eUQSx06nRp
         1xATpmwTZ20isOjCuvv7BLyQLxx7f50kwXD4kPzGye1LNkkIbI4MeeBLQawfGDBTRtdX
         qnwT8mvXqISmZSJfWD1acIbD33XH9hMM2ShzxpvI3IOQDXw62KYS+iQOa7D5sWoxg3z9
         dggldSrAvniHeB9kSgoS5Jyy4CRLMiKM/vHFRtn4TGbXGXVBnysIE/j4wzswjCvrVxaI
         PW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068779; x=1750673579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdiI/smVJOY0cX4ZuH0mmdvKWwyCh8vEN4C+U7z3NJo=;
        b=QAmDuCmtTQ2MiPWat2sJTR+fzD+bHs9wjs8Bq4fKFiRnrPGUemvnHmVG6bFtzJQNR4
         HoutEiDTfOeWoh2zNwz+vF+3H/H39oZg+IK7OiirCYILQdJx0w6mKFDFyiEx/ki4tM0o
         ByqMyeZGIpEH+1Acvf3bVuwiI1IS04HfjDxVkSZQfIKS5UesAabzNqvvl9ecd+O+3k5x
         NEuILl8k1nx+XjwHqN9jWI6rL/CfgNOTZ7aoO4iwqFeTlPJvPMf4v06kFSfzoGcGTP2i
         ipnqWofFTfCxSmaJuwsY13vQXIeoW5dP6MGVmm5IXglo2X/4raSMX35o6cEeSfysNJkg
         tz/A==
X-Forwarded-Encrypted: i=1; AJvYcCXAjjBeAHLKyK7L3vjUY9z1mljFOZHSFHIHpd7tmcYQtrUzx4NscWAtOsrnqSoM0aVJBvokHL4OIGehVszo@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAAaOUoVnl9Vr0AT4KfvxWOMuAJa5Nd38fBw1y+gwEUGabaV5
	brBVeBrykfU86/DQLtar1PR/uKQt1+AG0/cYGIuNxsdb07ZYAzcORdUw7ggKWLxTreY=
X-Gm-Gg: ASbGncsupDeRPnEiz5bZPsVuOCNW+kASHQvC506aXlFEVhrPkW4fpTSDQMSGKK0RYCY
	Kzc1tUom9ixmL9wQHeG4wgs6Dr27pqtSwVA8WeYkgzgj3fUnYU9OinUs9oLXXqs4NR2UrURcyuL
	aWD+bgo5F1FJ7n5OtFlnk7e9ck8A1HaLGwB7cmC5WbcdyKRixaATsOR77+zHXW2Vl/ldsivxIHO
	+49nD9Dt97tEseKqPpI7nrQvl15eUEzicJYxYx7Y0kIfoVcWvbFUlVTYZJDuO3u+dn1UscSVz72
	b1sS1Ubizl1HJLCtjloh9g5rijIZnkKkORstM/AgV8c6+SCHG0a9vbW3g6tEXhdqwudtAyD5nTL
	dYj0J
X-Google-Smtp-Source: AGHT+IGarxBcmQbjxtZfqg39/812dZL7oJLKKdvVC7LLX0AVrEROcYWKaHBGWjIfiBnmq6KNQDjrVw==
X-Received: by 2002:a17:907:db15:b0:ad5:8594:652e with SMTP id a640c23a62f3a-adfad469cf2mr788992566b.35.1750068779409;
        Mon, 16 Jun 2025 03:12:59 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897ac3dsm626980266b.155.2025.06.16.03.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:12:59 -0700 (PDT)
Message-ID: <6a493968-744a-4fa2-803c-3f64a8e7225e@linaro.org>
Date: Mon, 16 Jun 2025 13:12:58 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
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
 <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org> <87ikkzpcup.ffs@tglx>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <87ikkzpcup.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/14/25 00:10, Thomas Gleixner wrote:
> On Fri, Jun 13 2025 at 17:33, Eugen Hristev wrote:
>> On 5/7/25 13:27, Eugen Hristev wrote:
>>>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>>>> kmemdump specific section and then kmemdump can just walk that section
>>>> and dump stuff. No magic register functions and no extra storage
>>>> management for static/global variables.
>>>>
>>>> No?
>>>
>>> Thank you very much for your review ! I will try it out.
>>
>> I have tried this way and it's much cleaner ! thanks for the
>> suggestion.
> 
> Welcome.
> 
>> The thing that I am trying to figure out now is how to do something
>> similar for a dynamically allocated memory, e.g.
>> void *p = kmalloc(...);
>> and then I can annotate `p` itself, it's address and size, but what I
>> would also want to so dump the whole memory region pointed out by p. and
>> that area address and size cannot be figured out at compile time hence I
>> can't instantiate a struct inside the dedicated section for it.
>> Any suggestion on how to make that better ? Or just keep the function
>> call to register the area into kmemdump ?
> 
> Right. For dynamically allocated memory there is obviously no compile
> time magic possible.
> 
> But I think you can simplify the registration for dynamically allocated
> memory significantly.
> 
> struct kmemdump_entry {
> 	void			*ptr;
>         size_t			size;
>         enum kmemdump_uids	uid;
> };
> 
> You use that layout for the compile time table and the runtime
> registrations.
> 
> I intentionally used an UID as that avoids string allocation and all of
> the related nonsense. Mapping UID to a string is a post processing
> problem and really does not need to be done in the kernel. The 8
> character strings are horribly limited and a simple 4 byte unique id is
> achieving the same and saving space.
> 
> Just stick the IDs into include/linux/kmemdump_ids.h and expose the
> content for the post processing machinery.
> 
> So you want KMEMDUMP_VAR() for the compile time created table to either
> automatically create that ID derived from the variable name or you add
> an extra argument with the ID.

First of all, thank you very much for taking the time to think about this !

In KMEMDUMP_VAR, I can use __UNIQUE_ID to derive something unique from
the variable name for the table entry.

The only problem with having something like

#define KMEMDUMP_VAR(sym) \
	 static struct entry __UNIQUE_ID(kmemdump_entry_##sym) ...

is when calling it with e.g. `init_mm.pgd` which will make the `.`
inside the name and that can't happen.
So I have to figure a way to remove unwanted chars or pass a name to the
macro.

I cannot do something like
static  void * ptr = &init_mm.pgd;
and then
KMEMDUMP_VAR(ptr)
because ptr's dereferencing can't happen at compile time to add it's
value into the table entry.

> 
> kmemdump_init()
>         // Use a simple fixed size array to manage this
>         // as it avoids all the memory allocation nonsense
>         // This stuff is neither performance critical nor does allocating
>         // a few hundred entries create a memory consumption problem
>         // It consumes probably way less memory than the whole IDR/XARRAY allocation
>         // string duplication logic consumes text and data space.
> 	kmemdump_entries = kcalloc(NR_ENTRIES, sizeof(*kmemdump_entries), GFP_KERNEL);
> 
> kmemdump_register(void *ptr, size_t size, enum kmemdump_uids uid)
> {
>         guard(entry_mutex);
> 
> 	entry = kmemdump_find_empty_slot();
>         if (!entry)
>         	return;
> 
>         entry->ptr = ptr;
>         entry->size = size;
>         entry->uid = uid;
> 
>         // Make this unconditional by providing a dummy backend
>         // implementation. If the backend changes re-register all
>         // entries with the new backend and be done with it.
>         backend->register(entry);
> }
> 
> kmemdump_unregister(void *ptr)
> {
>         guard(entry_mutex);
>         entry = find_entry(ptr);
>         if (entry) {
>                 backend->unregister(entry);
>         	memset(entry, 0, sizeof(*entry);
>         }
> }
> 
> You get the idea.
> 
> Coming back to the registration at the call site itself.
> 
>        struct foo = kmalloc(....);
> 
>        if (!foo)
>        		return;
> 
>        kmemdump_register(foo, sizeof(*foo), KMEMDUMP_ID_FOO);
> 
> That's a code duplication shitshow. You can wrap that into:
> 
>        struct foo *foo = kmemdump_alloc(foo, KMEMDUMP_ID_FOO, kmalloc, ...);
> 
> #define kmemdump_alloc(var, id, fn, ...)				\
> 	({								\
>         	void *__p = fn(##__VA_ARGS__);				\
> 									\
>                 if (__p)						\
>                 	kmemdump_register(__p, sizeof(*var), id);	\
> 		__p;
>         })
> 

I was thinking into a new variant of kmalloc, like e.g. kdmalloc() which
would be a wrapper over kmalloc and also register the region into
kmemdump like you are suggesting.
It would be like a `dumpable` kmalloc'ed memory.
And it could take an optional ID , if missing, it could generate one.

However this would mean yet another k*malloc friend, and it would
default to usual kmalloc if CONFIG_KMEMDUMP=n .
I am unsure whether this would be welcome by the community

Let me know what you think.

Thanks again !
Eugen

> or something daft like that. And provide the matching magic for the free
> side.
> 
> Thoughts?
> 
> Thanks,
> 
>         tglx


