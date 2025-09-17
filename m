Return-Path: <linux-arm-msm+bounces-73968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF58B8097A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B53501C04ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6520E333AA6;
	Wed, 17 Sep 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5VU4cWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263652BEC59
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123168; cv=none; b=Nw3fss6kxjWdbC2QosRRv1IjG2d5dVKZ2fBjgak4J54vc0q9pQBl12NtSgxeDwlh17GEuolAK+4XVHyn5fCUdvNTtHQ7r4XPpn7RFS6APQ9HWl0ZNwYWo3KS/HdasPlmi1iTns4/7HeSdSiHq9MlRQr6XQTiSZOLomiODhWJiDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123168; c=relaxed/simple;
	bh=1PjU7nEeEI5Wf3JTQRVSrCL28uqYi+NS88MtDd4/3b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsOv6o2n2XYJA1Zg3/zekXPr0/Z0fkMibekG3le4AJbMhfAncqi4e4MfIBFILXr6FNzkRLSWTtppkSMqutD4FaFREmpLPOZDLtlfAqpw+jcMNuMf4QIb/LwWgLHE7pvpGl5S+khKjF5EtAX7eFCMwPSS88W/BIVmr4+AxBDhYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5VU4cWL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso8617668a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758123164; x=1758727964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4k5J8VkcsZOGowc/PhE+thWQDtpKbu6223a2JTLS/I=;
        b=u5VU4cWLvJNpz09QCFKrR9WS/+Lra5YUO3vptMugtunB9E6jEgY/OKlWhkOoHc1H1X
         I3qX8hKbQRjdvIWnMFUvC64EgrzeUNY8GkFP82xe54nlukkqHLoKRkrLPX/Ebund1Osr
         Tdwwd+YVGj3F6z3AkC4xk6PkSjAb+clOqjhhe3DegFA9wE6ifxtbQQRIh1VNcY6VvfKp
         h0DIPyhXzi96SvMh5jCO4/yOEs8K8epFO7r4SgjRiI+gO2MhU6rpM6vVixpgjNGtqC+B
         uznB7eCyBPbJ3k5+ihi8YkcrwPYdB2K//2ORlsP4Jm/voVzrESZUFr/XeseP7ntBgyXY
         9KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758123164; x=1758727964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4k5J8VkcsZOGowc/PhE+thWQDtpKbu6223a2JTLS/I=;
        b=KTp7k3uxfES9FzwLbrleRx8qCmpTAf3ongh88/6m7/6xb3N2PZKM3cZiWjCjZ2BjnS
         VSLQhmcxvAuT6cReZFb8ENRSYOfSaFtqsztGFQyWe/4TwxrOdiAKiBjnlWkm/vE2Ek9B
         szPccMWXScGnlpaSL6XkT59qhT2VFi60EheX/81yU2szGjCgA4Qi4B6jEGA0pYOLY/05
         dqjhl1Q3frnNTdYsJnfi0IT5LHxoj2fCFjxodJMwjxB/0T3kZLj3fUVuQ8WooVOk7bn5
         gXALr+zCR6hqkGt5jjnO+iD7DQdw4GkwiHuPNB/JyVltgasPUdzHb1Cg2k1GD+zhUU1F
         ieGw==
X-Forwarded-Encrypted: i=1; AJvYcCVezA+o/nXrnKUrH9OalMZcsGMkq1VXybtowfUYZiAY1gELx4pIdtaJaYT6oY+YpP+ShNU+MLOZ85bfACdS@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdiOVeCgve7JYjtrugZSnFq/YN6xgCKEm2GGhnqiItzTLpaeW
	C8lNgxnfIQMDwNLBifpibpX77Mqzb3razBjlcobmsZhQE4Q+ELvJJlacYLgTDIH8tdE=
X-Gm-Gg: ASbGncs3X8ao5eGPjDAF+5lYBz4pqsD4WpdA14aqlViEIGX9aPnZwx9q7w8IFRXL7df
	Ut3QUX3JLeMMCKnydfhVcrcLzkIaPnqOqHtZ+15o8E1gdchqo4xh3py8jwx4L1M58boQn+Wzqyk
	mTWsvraGZ7cKyO5q0RlSPuJkWuTQ9ERvrEgsCYC0NjiwuAYGs5zfn7cTaY88oUNZ9r8fuYah2YT
	5AXzQdAQu59ZImqFjtGnEdMFQiUd8t0If8PSDte3c81ELL/ex7MviDY5y+U9Ae0Rkw4ESPEfL4P
	amX/337f0vvWi/FyH3LzGuP7ODh0yhBzJCDm11Yv3VcPJSmiZCmgcpOZJdD8XNR/3A9byz1ggqa
	jOR6/xKRT+G6CD6wPVzsdIhwQrpz/eMZEu1s66ep0wgE=
X-Google-Smtp-Source: AGHT+IE8ZMv8HN0yNwSikwv6pMskOhk9zA0LwfuIGCKmhTnIQQy04Vwmljxv3YCiPD4eKH8iHrC6Ug==
X-Received: by 2002:a17:906:6a09:b0:b04:a1a4:4bec with SMTP id a640c23a62f3a-b1bc020111bmr330491066b.58.1758123164384;
        Wed, 17 Sep 2025 08:32:44 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.135.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b317124esm1395390166b.46.2025.09.17.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:32:43 -0700 (PDT)
Message-ID: <10540b3e-09ca-403d-bc20-b9412a7fe28a@linaro.org>
Date: Wed, 17 Sep 2025 18:32:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: David Hildenbrand <david@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/25 18:18, David Hildenbrand wrote:
> On 17.09.25 17:02, Eugen Hristev wrote:
>>
>>
>> On 9/17/25 17:46, David Hildenbrand wrote:
>>> On 17.09.25 16:10, Thomas Gleixner wrote:
>>>> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>>>>> On 17.09.25 07:43, Eugen Hristev wrote:
>>>>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>>>>> I pointed you to a solution for that and just because David does not
>>>>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>>>>> their carefully localized variables.
>>>>>
>>>>> It would have been great if we could have had that discussion in the
>>>>> previous thread.
>>>>
>>>> Sorry. I was busy with other stuff and did not pay attention to that
>>>> discussion.
>>>
>>> I understand, I'm busy with too much stuff such that sometimes it might
>>> be good to interrupt me earlier: "David, nooo, you're all wrong"
>>>
>>>>
>>>>> Some other subsystem wants to have access to this information. I agree
>>>>> that exposing these variables as r/w globally is not ideal.
>>>>
>>>> It's a nono in this case. We had bugs (long ago) where people fiddled
>>>> with this stuff (I assume accidentally for my mental sanity sake) and
>>>> caused really nasty to debug issues. C is a horrible language to
>>>> encapsulate stuff properly as we all know.
>>>
>>> Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs
>>> and relies on sparse IIRC.
>>>
>>>>
>>>>> I raised the alternative of exposing areas or other information through
>>>>> simple helper functions that kmemdump can just use to compose whatever
>>>>> it needs to compose.
>>>>>
>>>>> Do we really need that .section thingy?
>>>>
>>>> The section thing is simple and straight forward as it just puts the
>>>> annotated stuff into the section along with size and id and I definitely
>>>> find that more palatable, than sprinkling random functions all over the
>>>> place to register stuff.
>>>>
>>>> Sure, you can achieve the same thing with an accessor function. In case
>>>> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
>>>
>>> Right, the challenge really is that we want the memory range covered by
>>> that address, otherwise it would be easy.
>>>
>>>> do not expose the information already for real functional reasons adding
>>>> such helpers just for this coredump muck is really worse than having a
>>>> clearly descriptive and obvious annotation which results in the section
>>>> build.
>>>
>>> Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.
>>>
>>> Guess it would all feel less "kmemdump" specific if we would just have a
>>> generic way to tag/describe certain physical memory areas and kmemdump
>>> would simply make use of that.
>>
>> The idea was to make "kmemdump" exactly this generic way to tag/describe
>> the memory.
> 
> That's probably where I got lost, after reading the cover letter 
> assuming that this is primarily to program kmemdump backends, which I 
> understood to just special hw/firmware areas, whereby kinfo acts as a 
> filter.

If there is a mechanism to tag all this memory, or regions, into a
specific section, what we would do with it next ?
It would have a purpose to be parsed and reused by different drivers,
that would be able to actually use it.
So there has a to be some kind of middleman, that holds onto this list
of regions, manages it (unique id, add/remove), and allows certain
drivers to use it.
Now it would be interesting to have different kind of drivers connect to
it (or backends how I called them).
One of these programs an internal table for the firmware to use.
Another , writes information into a dedicated reserved-memory for the
bootloader to use on the next soft reboot (memory preserved).
I called this middleman kmemdump. But it can be named differently, and
it can reside in different places in the kernel.
But what I would like to avoid is to just tag all this memory and have
any kind of driver connect to the table. That works, but it's quite
loose on having control over the table. E.g. no kmemdump, tag all the
memory to sections, and have specific drivers (that would reside where?)
walk it.

> 
>> If we would call it differently , simply dump , would it be better ?
>> e.g. include linux/dump.h
>> and then DUMP(var, size) ?
>>
>> could we call it maybe MARK ? or TAG ?
>> TAG_MEM(area, size)
> 
> I'm wondering whether there could be any other user for this kind of 
> information.
> 
> Like R/O access in a debug kernel to these areas, exporting the 
> ranges/names + easy read access to content through debugfs or something.

One idea I had to to have a jtag script read the table , parse it, and
know where some information resides.
Another idea is to use Uboot in case of persistent memory across reboot,
and Uboot can read all the sections and assemble a ready-to-download
coredump. (sure this doesn't work in all cases)
What can be done in case of hypervisor is to implement there a routine
that would read it, in case the OS is non-responsive, or even in the
secure monitor.
Another suggestion I had from someone was to use a pure software default
backend in which to just keep the regions stored, and it could be
accessed through userspace or read by a crash analyzer.

> 
> Guess that partially falls under the "dump" category.
> 
> Including that information in a vmcore info would probably allow to 
> quickly extract some information even without the debug symbols around 
> (I run into that every now and then).
> 
>>
>> this would go to a separate section called .tagged_memory.
>>
> 
> Maybe just "tagged_memory.h" or sth. like that? I'm bad at naming, so I 
> would let others make better suggestions.
> 
>> Then anyone can walk through the section and collect the data.
>>
>> I am just coming up with ideas here.
>> Could it be even part of mm.h instead of having a new header perhaps ?
>> Then we won't need to include one more.
> 
> I don't really have something against a new include, just not one that 
> sounded like a very specific subsystem, not something more generic.
> 


