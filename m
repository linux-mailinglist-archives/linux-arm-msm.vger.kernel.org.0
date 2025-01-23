Return-Path: <linux-arm-msm+bounces-45993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627AA1A5A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A41A3A0716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F31B20F96B;
	Thu, 23 Jan 2025 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3JBfVso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304113212A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737642077; cv=none; b=ty1/zeGL1eHW0lwhlUxGqI60rl1qcwtnl2rLQ51/k7HcunIN9O7u5DB6VHdVXfRmqL+X9tYCcHrmg46RlJY60RmeA1A/aDDDaMRk+XAPpU0OwOtNyJR3+lXZsijm47pNqJ1YYiNFj7gh7o+8wTljABD6H9MIvDg35GAlPQ5RxB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737642077; c=relaxed/simple;
	bh=edExXHj4EXXA1tjmMiVt7oy0Pb4MlX8UyN24aZKJcp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jT4a+ucc9lCb4lQIaJuW9gPyGzP7+OMMx79MBijMI1Jgo9v4SzYNJudHYIX+HdCdA3U+w3+iK0hTboEqvs0H+gGIR1PuFrlW7R54zgaLcQpQoq7FHW+wwDTVIAymLyZRLk/ONtSHMvVsLYazXuQUoGATf4ysno3zJLFoqh0EviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3JBfVso; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737642074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5MrmQK9w/1z5lvjGW1AtjnA4JrdWWyhd7SksuBzXv5g=;
	b=S3JBfVsoNs4grnKvl460R7L2zUYGCUANh/tlWOH6FwITc6TQ4Yl0PKAdvVSMNp/sA4cIdu
	22rviA+wT+Sy4UGryQhSpNrM//yH0kJP6NIg7TJzub71JcqYq0ycSGESkuyDsAlTzKSJr9
	/OnsjWgVXimt2/TvSzuGOlJIubHeI+0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-7Dp5GuFKMKy5bbceSmV7ew-1; Thu, 23 Jan 2025 09:21:13 -0500
X-MC-Unique: 7Dp5GuFKMKy5bbceSmV7ew-1
X-Mimecast-MFC-AGG-ID: 7Dp5GuFKMKy5bbceSmV7ew
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436225d4389so10262505e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 06:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737642072; x=1738246872;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MrmQK9w/1z5lvjGW1AtjnA4JrdWWyhd7SksuBzXv5g=;
        b=beNIZwq6mHcIl6kbaq2Qvd6Dt2qyYCle/MoKHX+3yKOTUILN9gq1erAXZUjdETiLmZ
         46h6cyJRI9ilcoFuVonNKdEO2NU+18J8sQ+AJVvA9OlJ28vVvDSmL6/xf6zwQbDz1rnt
         XQQ+RRZJKYW3vM/QxknFZeI87jEQsl20Ub8aXyL2i7GYL6bKsOESaX1OuWqAj8OMFZa/
         YvXcKSO7pV5gjvHqQbcNgwad50bnibx0LofMcqep3cP6SPnHlAc89OY0as0dff3FiAWk
         5qFDLm4XAbc6bcIxuv68RBgKCuj8KMuHAMQPm4f34GuxiNkHLoCu4thP+3EvFq7KbElv
         2Dtg==
X-Forwarded-Encrypted: i=1; AJvYcCVU3LwX39yu9/3JC4Pv6XrlfD9TnAwlRs+Lnd7rfBGflETD4yNesX+fLSZ+bTmJHscOhuLfUmYDb8y02QdA@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3Mq+lEcb6JRK9Zakal/FZgzmM4jjSkgMoTcyx38J9KEB/NOV
	tGy5erLNsLwxqYz2KT5WMdyoLEUlPGe7vjRpqrEcGCg2cK5PqDNvR/w0O3zX/l3NiHv6m9hoWnQ
	JYLJ4+bDoGVoq90ozYdh2PDALatY+8BEtsnM8k0CvH3ImFPcuzDoXR/y8hGjxvJ4TFTF1aogd9Q
	==
X-Gm-Gg: ASbGncsYgGr6i3uei9G3qdRpFZBOnZImVFxzFOQ8q6hHBmMxlu5neTVFlhFApk9eJJh
	5ysdut6g3jgHoy8AK0KQKDPS5+DKfKNGsym+i2z3Dxc2mp66h3GccpRlWRYcMh5fhTdAXz/RAnb
	r6BUPwUite9GrF9XhZxT2Z1THRjlzXVuFf3lQnv8kneEax2fhPOPgfGQpcqrO9UafXHGMjA1p/w
	PF+qkGW9MyQLEtKkY7ZwyBVU3D9XF1w/UmaMYqpxL7il42GupK8yu3IA2xi2LpRkdDRiEB2Jptx
	tJpxONWjpWr3tiqUZUr5JSIEr6AxL8VwK/SeTrxPKMCoo6bwUwsNw0+tQ7BM6ydsjSNpnR3Cy5V
	c0CMoalhp1WCYZYYlQsU7Yg==
X-Received: by 2002:a05:600c:3ba9:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-438b883eccfmr34069145e9.2.1737642071863;
        Thu, 23 Jan 2025 06:21:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzA/kVcfU1Nvmt+fPOYVsEAXLug0LaBWZ86dBgJXTmu4qHIOWDkHqTONVlCbE7dTT/KD8Z9g==
X-Received: by 2002:a05:600c:3ba9:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-438b883eccfmr34068805e9.2.1737642071390;
        Thu, 23 Jan 2025 06:21:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d? (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de. [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31adbccsm66208405e9.19.2025.01.23.06.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 06:21:10 -0800 (PST)
Message-ID: <164e9d74-2f1f-4557-afda-06712e8415b0@redhat.com>
Date: Thu, 23 Jan 2025 15:21:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/9] KVM: guest_memfd: Add guest_memfd support to
 kvm_(read|/write)_guest_page()
To: Patrick Roy <roypat@amazon.co.uk>, Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
 vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
 mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, shuah@kernel.org,
 hch@infradead.org, jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com,
 fvdl@google.com, hughd@google.com, jthoughton@google.com
References: <20250122152738.1173160-1-tabba@google.com>
 <20250122152738.1173160-3-tabba@google.com>
 <e6ea48d2-959f-4fbb-a170-0beaaf37f867@redhat.com>
 <CA+EHjTxNEoQ3MtZPi603=366vxt=SmBwetS4mFkvTK2r6u=UHw@mail.gmail.com>
 <82d8d3a3-6f06-4904-9d94-6f92bba89dbc@redhat.com>
 <ef864674-bbcf-457b-a4e3-fec272fc2d8a@amazon.co.uk>
 <CA+EHjTxc0AwX2=htwC9to7+fYbFJsfVGT5d+BtEYVPncMgq1Mw@mail.gmail.com>
 <bc59a2ec-7467-4a4e-8d73-9c4126b1c98b@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bc59a2ec-7467-4a4e-8d73-9c4126b1c98b@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.01.25 14:57, Patrick Roy wrote:
> 
> 
> On Thu, 2025-01-23 at 12:28 +0000, Fuad Tabba wrote:
>> Hi Patrick,
>>
>> On Thu, 23 Jan 2025 at 11:57, Patrick Roy <roypat@amazon.co.uk> wrote:
>>>
>>>
>>>
>>> On Thu, 2025-01-23 at 11:39 +0000, David Hildenbrand wrote:
>>>> On 23.01.25 10:48, Fuad Tabba wrote:
>>>>> On Wed, 22 Jan 2025 at 22:10, David Hildenbrand <david@redhat.com> wrote:
>>>>>>
>>>>>> On 22.01.25 16:27, Fuad Tabba wrote:
>>>>>>> Make kvm_(read|/write)_guest_page() capable of accessing guest
>>>>>>> memory for slots that don't have a userspace address, but only if
>>>>>>> the memory is mappable, which also indicates that it is
>>>>>>> accessible by the host.
>>>>>>
>>>>>> Interesting. So far my assumption was that, for shared memory, user
>>>>>> space would simply mmap() guest_memdd and pass it as userspace address
>>>>>> to the same memslot that has this guest_memfd for private memory.
>>>>>>
>>>>>> Wouldn't that be easier in the first shot? (IOW, not require this patch
>>>>>> with the cost of faulting the shared page into the page table on access)
>>>>>
>>>>
>>>> In light of:
>>>>
>>>> https://lkml.kernel.org/r/20250117190938.93793-4-imbrenda@linux.ibm.com
>>>>
>>>> there can, in theory, be memslots that start at address 0 and have a
>>>> "valid" mapping. This case is done from the kernel (and on special s390x
>>>> hardware), though, so it does not apply here at all so far.
>>>>
>>>> In practice, getting address 0 as a valid address is unlikely, because
>>>> the default:
>>>>
>>>> $ sysctl  vm.mmap_min_addr
>>>> vm.mmap_min_addr = 65536
>>>>
>>>> usually prohibits it for good reason.
>>>>
>>>>> This has to do more with the ABI I had for pkvm and shared memory
>>>>> implementations, in which you don't need to specify the userspace
>>>>> address for memory in a guestmem memslot. The issue is there is no
>>>>> obvious address to map it to. This would be the case in kvm:arm64 for
>>>>> tracking paravirtualized time, which the userspace doesn't necessarily
>>>>> need to interact with, but kvm does.
>>>>
>>>> So I understand correctly: userspace wouldn't have to mmap it because it
>>>> is not interested in accessing it, but there is nothing speaking against
>>>> mmaping it, at least in the first shot.
>>>>
>>>> I assume it would not be a private memslot (so far, my understanding is
>>>> that internal memslots never have a guest_memfd attached).
>>>> kvm_gmem_create() is only called via KVM_CREATE_GUEST_MEMFD, to be set
>>>> on user-created memslots.
>>>>
>>>>>
>>>>> That said, we could always have a userspace address dedicated to
>>>>> mapping shared locations, and use that address when the necessity
>>>>> arises. Or we could always require that memslots have a userspace
>>>>> address, even if not used. I don't really have a strong preference.
>>>>
>>>> So, the simpler version where user space would simply mmap guest_memfd
>>>> to provide the address via userspace_addr would at least work for the
>>>> use case of paravirtualized time?
>>>
>>> fwiw, I'm currently prototyping something like this for x86 (although
>>> not by putting the gmem address into userspace_addr, but by adding a new
>>> field to memslots, so that memory attributes continue working), based on
>>> what we talked about at the last guest_memfd sync meeting (the whole
>>> "how to get MMIO emulation working for non-CoCo VMs in guest_memfd"
>>> story). So I guess if we're going down this route for x86, maybe it
>>> makes sense to do the same on ARM, for consistency?
>>>
>>>> It would get rid of the immediate need for this patch and patch #4 to
>>>> get it flying.
>>>>
>>>>
>>>> One interesting question is: when would you want shared memory in
>>>> guest_memfd and *not* provide it as part of the same memslot.
>>>
>>> In my testing of non-CoCo gmem VMs on ARM, I've been able to get quite
>>> far without giving KVM a way to internally access shared parts of gmem -
>>> it's why I was probing Fuad for this simplified series, because
>>> KVM_SW_PROTECTED_VM + mmap (for loading guest kernel) is enough to get a
>>> working non-CoCo VM on ARM (although I admittedly never looked at clocks
>>> inside the guest - maybe that's one thing that breaks if KVM can't
>>> access gmem. How to guest and host agree on the guest memory range
>>> used to exchange paravirtual timekeeping information? Could that exchange
>>> be intercepted in userspace, and set to shared via memory attributes (e.g.
>>> placed outside gmem)? That's the route I'm going down the paravirtual
>>> time on x86).
>>
>> For an idea of what it looks like on arm64, here's how kvmtool handles it:
>> https://github.com/kvmtool/kvmtool/blob/master/arm/aarch64/pvtime.c
>>
>> Cheers,
>> /fuad
>   
> Thanks! In that example, kvmtool actually allocates a separate memslot for
> the pvclock stuff, so I guess it's always possible to simply put it into
> a non-gmem memslot, which indeed sidesteps this issue as you mention in
> your reply to David :D

Does that work on CC where all memory defaults to private first, and the 
VM explicitly has to opt into marking it shared first, or how exactly 
would the flow of operations be in the cases of the non-gmem ("good 
old") memslot?

-- 
Cheers,

David / dhildenb


