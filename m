Return-Path: <linux-arm-msm+bounces-46595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42426A23C84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 11:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31AD167A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 10:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5711B87D4;
	Fri, 31 Jan 2025 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJeHLBXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C71B6D11
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320809; cv=none; b=h9e+rD77rMohkoOl/w7ruKvc3Ejd81DCNUzPLdi+Oen3UW0h9dk3Zm6oUxXZ42k23ke6BuDUWCIXS2CchGKDQf3690Y1Y5CebVJnqaYm11CwAyTS+MxswnRjm+hmlZirSDjmDSh0pwBqlHBDiwLDTyGSPc0KqbPAB0v8zGzgVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320809; c=relaxed/simple;
	bh=zEAI6wqxFiFSme+Oa+LCjOIU5RX47W2joo/3qRV1tA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CURgEgfdKQWACCxZK+X840vUP0Zv3Q8XTC0nqgQl9Lt9eEsP78e7ZWf7ztOq1nj9d2oKnJiJDGYbu1roVbyEo6iioo2DHedkLlTxKPD6u9omilBhcOXGOHVYxtHWWnMsphxRvC0yQLCfNCIVNRpdGIzT247rZ7HbDbOlggpIHic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJeHLBXS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738320806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EBOeMd/Uw84ugc+90pxaNmttHpWVqjhi2vJvmo6LbbQ=;
	b=YJeHLBXSpC4cDjmutRf3CF65UlnaJN0aB3UdGeN4Ge+cqlbPE3/9q/Us9bdZrrQ7V1WnUN
	ZPynv7lVO9aXjO3BDkxN0co4amp9j6z1xdUx8YmeWgJ6eyUIkzryIumEbuVHiN5YhsnHoi
	0pGmIdDfv8dYX2ljzBJKYeMpKqwIZzA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-yno0XfpPMeeQXAIblVGdhw-1; Fri, 31 Jan 2025 05:53:23 -0500
X-MC-Unique: yno0XfpPMeeQXAIblVGdhw-1
X-Mimecast-MFC-AGG-ID: yno0XfpPMeeQXAIblVGdhw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e3cbf308so790980f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 02:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320802; x=1738925602;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EBOeMd/Uw84ugc+90pxaNmttHpWVqjhi2vJvmo6LbbQ=;
        b=aEIYFGkmVzJb6x2eXpd1Qb6Tzw6ZCnK1mmNxZ4BevaFDmBh5k27LGIk2OtNmctYU0u
         t3PLmVmb17rEATTFGGvcApKyPub0re/My6lM7QrfIzu1mnMDdpMthW/n2i6ODJsJ6j32
         VpzkxkxMkk8NDIyMSBoBoJpR6RJgB7NIR9MYSYvi8jyY7niosjgLsqgDfteMlejLIQWl
         2Xk0wD0ai5YLmL76qxw2xMH0OMAZSkVMy+Jz+H3r9v8NTBA508nk8a7A15xtatxIi2sG
         NAcPGQ9VvGtuw/8xuimg+YUevl5SpHv3owUj3p+nN0ISCYBZbjoPs8c1K42RCyanYoSI
         GwIA==
X-Forwarded-Encrypted: i=1; AJvYcCUtuhthNLTD4z6n2r7iCOykuLNFWapP4VX5cPA96CRkp2B2t0viGwlNh5c7NofXI358WHIHazV0KZHS2HyU@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnUdjZUw0JprvbY87QCvI1Bnx/j/Cjhgf2xxAw9dr8crRQ6UA
	7o0kAaaWwfPPDpCgnk8SOA/AXneAxbDqpktmA51V/k73HEf10V9NBqCo6RaOF/qU73saJXAS/lf
	3ndRgKff8shKVCGZi9jJbnQWshO3+YuN4SU87QCCS15kdoVIVuitiHD2kN6ICkcw=
X-Gm-Gg: ASbGnct6GtnTecM1AG81eCrcah3jpsPqYJw81d/vQWavfUQ8aRPzQwwbTTFOmNG91bk
	+n2CMfW1KQ1fV3Koik8lSn4xw5jD+w81lwYFG82d82zSbMcpJzbEt/lD4vDAdrEmLWBI3uoUWpy
	zyzJXROEhNY/EKJz64+HSIUKHpvoP+3K/MjlbSyww4Uz4Nm8Toqh6ckgVIEBhPYTqtUpK0AWiZC
	qt282Iqp2BNGz+aAVcdbVkY5vSaY6EGdmweZCnzncfo1Jiph9boGDg70WRx3VpgmbTPzCHmI1TB
	gYv+kMNe053miCNEj79D8PeTpRHUudi10Di+ggd0ocZqIaXE3+HMy23UhI1dLUV+gueMNJKV/uZ
	oqN82qker1kSycrtj9MYSUwYUcGmqYHe6
X-Received: by 2002:a5d:6952:0:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38c52097015mr8037636f8f.46.1738320802041;
        Fri, 31 Jan 2025 02:53:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOcJIHOsjy097++YR3Moup2HvJer0xLkIF+W/DHf3drFPLam8Bv2f+8i19U9MgQ9V+2wGuOg==
X-Received: by 2002:a5d:6952:0:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38c52097015mr8037579f8f.46.1738320801616;
        Fri, 31 Jan 2025 02:53:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e? (p200300cbc70a1c00b8d4bc62e7edec0e.dip0.t-ipconnect.de. [2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23dea58sm50657605e9.15.2025.01.31.02.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 02:52:47 -0800 (PST)
Message-ID: <1ce8fd8e-893b-4867-b690-298bb3048d75@redhat.com>
Date: Fri, 31 Jan 2025 11:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/11] KVM: guest_memfd: Add KVM capability to
 check if guest_memfd is shared
To: Fuad Tabba <tabba@google.com>
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
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
References: <20250129172320.950523-1-tabba@google.com>
 <20250129172320.950523-5-tabba@google.com>
 <dec9250c-aec5-43c4-aaf4-736b14fc3186@redhat.com>
 <CA+EHjTxNPRSVQj3rewnbRvr+=4LPVFkxgUrru7saTDtJ+ghCdg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTxNPRSVQj3rewnbRvr+=4LPVFkxgUrru7saTDtJ+ghCdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.01.25 10:52, Fuad Tabba wrote:
> Hi David,
> 
> On Fri, 31 Jan 2025 at 09:11, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 29.01.25 18:23, Fuad Tabba wrote:
>>> Add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which indicates
>>> that the VM supports shared memory in guest_memfd, or that the
>>> host can create VMs that support shared memory. Supporting shared
>>> memory implies that memory can be mapped when shared with the
>>> host.
>>>
>>> For now, this checks only whether the VM type supports sharing
>>> guest_memfd backed memory. In the future, it will be expanded to
>>> check whether the specific memory address is shared with the
>>> host.
>>>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>    include/uapi/linux/kvm.h |  1 +
>>>    virt/kvm/guest_memfd.c   | 13 +++++++++++++
>>>    virt/kvm/kvm_main.c      |  4 ++++
>>>    3 files changed, 18 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>>> index 502ea63b5d2e..3ac805c5abf1 100644
>>> --- a/include/uapi/linux/kvm.h
>>> +++ b/include/uapi/linux/kvm.h
>>> @@ -933,6 +933,7 @@ struct kvm_enable_cap {
>>>    #define KVM_CAP_PRE_FAULT_MEMORY 236
>>>    #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>>>    #define KVM_CAP_X86_GUEST_MODE 238
>>> +#define KVM_CAP_GMEM_SHARED_MEM 239
>>>
>>>    struct kvm_irq_routing_irqchip {
>>>        __u32 irqchip;
>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>> index 86441581c9ae..4e1144ed3446 100644
>>> --- a/virt/kvm/guest_memfd.c
>>> +++ b/virt/kvm/guest_memfd.c
>>> @@ -308,6 +308,13 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>>>    }
>>>
>>>    #ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>> +static bool kvm_gmem_is_shared(struct file *file, pgoff_t pgoff)
>>
>> I assume you want to call this something like:
>>
>> kvm_gmem_folio_is_shared
>> kvm_gmem_offset_is_shared
>> kvm_gmem_range_is_shared
>> ...
>>
>> To make it clearer that you are only checking one piece and not the
>> whole thing.
>>
>> But then, I wonder if that could be handled in kvm_gmem_get_folio(),
>> and e.g., specified via a flag?
>>
>> kvm_gmem_get_folio(inode, vmf->pgoff, KVM_GMEM_GF_SHARED);
>>
>> Maybe existing callers would want to pass KVM_GMEM_GF_PRIVATE, and the
>> ones that "don't care" don't pas anything?
> 
> I agree that naming this function to make it clearer would be a good
> idea. That said, I think with the patches I removed, it doesn't even
> need to be exposed at all, even looking at future patches --- it has
> no callers other than kvm_gmem_fault(). Therefore, I don't think we
> need to add a flag to kvm_gmem_get_folio().
> 
> I'll have a closer look while preparing the respin and fix it either way.

Okay, having some indication in the name that we only want a shared 
folio etc. might make sense.

-- 
Cheers,

David / dhildenb


