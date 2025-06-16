Return-Path: <linux-arm-msm+bounces-61453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF93ADB3D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE971887FE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5313B1ADC69;
	Mon, 16 Jun 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5f0/ICj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB391A83F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083936; cv=none; b=nSfVerI2j8gUlEB68d4fY2+tgurIlcPMHZASiKkxx4SKraZIKUOcodicBqBgBlmjAJ6GfUV0nj/zPqoFdwf3BiM+XA0DljAdOklRyocrumhMVUeAxlAzvIp/bGTuutyITljB7DEU/1E21+28M1Xq3PB/W1MM0W+wwCutObzbu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083936; c=relaxed/simple;
	bh=q8xT4zST8yMeRRrwF9VKKX+1CMty1YAM2j4dj7AI8Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0SXTGTnoXXDy+xXCPHmPNEtCrhm873F8njY1+ziKiX98PnOlr4HN2dqv40ZCiURcGFR9Y1ZlnoV3FF9HxRKNz9UwjjRx1/x+7kIT9uhr2/+1qrAVO9Kxv/bNnQWEPynDhdvnXhwELpXACj/0BwAKFTqTg7CFk8q+gzCs/6HdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5f0/ICj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750083933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VchIogTAAiQO6tZgkgIlGLiJZdtAWlf+rF0f2UhX7kc=;
	b=e5f0/ICjd7usmKC3Zc0JWQWO3Ef9YumvSZH6hQ0e7yoWYea3r3jOrDkv6jfaj8Ju3kHKrC
	6FzVii3SfnrDLjrGl9kYJP+6FCxJ3OZrQsMlNjCqUGzK3t+UIXnqlZbVCaVrb89zfiTsxZ
	b1wkUufzq89bKFO77BsePQfBLLfC3SY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-7p__6jHSMIeGbnatZ3YqQQ-1; Mon, 16 Jun 2025 10:25:32 -0400
X-MC-Unique: 7p__6jHSMIeGbnatZ3YqQQ-1
X-Mimecast-MFC-AGG-ID: 7p__6jHSMIeGbnatZ3YqQQ_1750083931
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a52cb5684dso2632195f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083931; x=1750688731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VchIogTAAiQO6tZgkgIlGLiJZdtAWlf+rF0f2UhX7kc=;
        b=H+4KvouGusvW7XidikvOHYtt8iraMYcSnLlgjeum2oyTw5xkr5PJaDyD3BVti9EE7I
         O6rHuhGQsngXEjoRk5hGf+zwZeeM5iLO48P04lNiUzS3xvz8z8jGnPfJp6IbJCIYZY/q
         td4VxZnPKjVnnxtSg5EoMGjIVifHI+WaMzlCaviZzWcCtXopNu9Pd0My3KmPVvEA9EdC
         TiLI6Z0JLsTIOC62CRLNZ/iS8AMV0VxB1yQ5Vp6QsGdE0AwWBrLG739OEH/8woW2h/z3
         Vq6wUjwMI3VWYVJAqJrSemgyuUBmGt4iZFbKQK9uYac6Ghn1GR65mdqUX602FPK9ck0a
         f51A==
X-Forwarded-Encrypted: i=1; AJvYcCUI9P814VG8wb70Y1s27MkHNF7OVyFnD2V9EAcvCv5JJUVLcxwF3uhGKaf1IJK63GrMa5gM4RF10lz9YLwA@vger.kernel.org
X-Gm-Message-State: AOJu0YzCGytTTEydncvRx3enSv1/mGMMzcCB1qBnmqJytHwrIhVKz6Ps
	MNsrflGt/ngUqLmmwYQAn3a4CgEtngW6GmLPgvxs8k0hDGd3vgeVg4gLiwtv8atigkCFXCriNO4
	nBSF9C9XHnrjmrj6yCNdhkhJ6ezHQjOYKpNaudolUoO/BS53Yvoz5QHt7XNGON9IcvRg=
X-Gm-Gg: ASbGncu8AAZfNL8Qpk9WjUjJ3Yj+cIiorieI3Wr/clwibBvzXVX1iVwywzlYVsuUfJA
	xYkjsPxuMVvr7ame/2mM/hhIEqsGZ0z3c/g4S7Xp4C/bT9/JCFxUy5bk+NQpGF+5qlSpSe34nOL
	2ScrOkaO3AXHzCT7t++iWw8/VvzM2RpoDXXZDhqE2s5B3VTmTAU93HyB+0Flbvaq88JrXHMGOT2
	NJIZtE/ZRTRlRoQYY7BgiXYxtJxh7izZxYmijf3Hv7dXGzXwQrkdo4ThBNMNdbDSlCJwCOpuVW5
	rGTQp/z01p8mx9hQGZiBYBQPobilbA+JBvRM7PLCgCazKwrkAq3SR1vfkjBodW/jKqJVFctxe5k
	GwtrucEzRs0UQnFLBMCQkSVhL2s/9VfUmg8YNOG1xPQItCJk=
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr8795330f8f.58.1750083930603;
        Mon, 16 Jun 2025 07:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEHI9FM1CwYzfZ4H0vgfD9yhDMwbP5yPxeXA/GzgSyZu8zcp6wKlGzchmV6vwo8tEx90yfjA==
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr8795306f8f.58.1750083930132;
        Mon, 16 Jun 2025 07:25:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b18f96sm11366180f8f.66.2025.06.16.07.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:25:29 -0700 (PDT)
Message-ID: <701c8716-dd69-4bf6-9d36-4f8847f96e18@redhat.com>
Date: Mon, 16 Jun 2025 16:25:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/18] KVM: guest_memfd: Allow host to map guest_memfd
 pages
To: Fuad Tabba <tabba@google.com>
Cc: Ira Weiny <ira.weiny@intel.com>, Sean Christopherson <seanjc@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com,
 isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
 suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com,
 quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
 quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com,
 james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
 maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com,
 roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
 rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
References: <20250611133330.1514028-1-tabba@google.com>
 <20250611133330.1514028-9-tabba@google.com> <aEySD5XoxKbkcuEZ@google.com>
 <68501fa5dce32_2376af294d1@iweiny-mobl.notmuch>
 <bbc213c3-bc3d-4f57-b357-a79a9e9290c5@redhat.com>
 <CA+EHjTxvqDr1tavpx7d9OyC2VfUqAko864zH9Qn5+B0UQiM93g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTxvqDr1tavpx7d9OyC2VfUqAko864zH9Qn5+B0UQiM93g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 16:16, Fuad Tabba wrote:
> On Mon, 16 Jun 2025 at 15:03, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 16.06.25 15:44, Ira Weiny wrote:
>>> Sean Christopherson wrote:
>>>> On Wed, Jun 11, 2025, Fuad Tabba wrote:
>>>>> This patch enables support for shared memory in guest_memfd, including
>>>>
>>>> Please don't lead with with "This patch", simply state what changes are being
>>>> made as a command.
>>>>
>>>>> mapping that memory from host userspace.
>>>>
>>>>> This functionality is gated by the KVM_GMEM_SHARED_MEM Kconfig option,
>>>>> and enabled for a given instance by the GUEST_MEMFD_FLAG_SUPPORT_SHARED
>>>>> flag at creation time.
>>>>
>>>> Why?  I can see that from the patch.
>>>>
>>>> This changelog is way, way, waaay too light on details.  Sorry for jumping in at
>>>> the 11th hour, but we've spent what, 2 years working on this?
>>>>
>>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>>>>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>>> ---
>>>>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>>>>> index d00b85cb168c..cb19150fd595 100644
>>>>> --- a/include/uapi/linux/kvm.h
>>>>> +++ b/include/uapi/linux/kvm.h
>>>>> @@ -1570,6 +1570,7 @@ struct kvm_memory_attributes {
>>>>>    #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>>>>>
>>>>>    #define KVM_CREATE_GUEST_MEMFD    _IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
>>>>> +#define GUEST_MEMFD_FLAG_SUPPORT_SHARED    (1ULL << 0)
>>>>
>>>> I find the SUPPORT_SHARED terminology to be super confusing.  I had to dig quite
>>>> deep to undesrtand that "support shared" actually mean "userspace explicitly
>>>> enable sharing on _this_ guest_memfd instance".  E.g. I was surprised to see
>>>>
>>>> IMO, GUEST_MEMFD_FLAG_SHAREABLE would be more appropriate.  But even that is
>>>> weird to me.  For non-CoCo VMs, there is no concept of shared vs. private.  What's
>>>> novel and notable is that the memory is _mappable_.  Yeah, yeah, pKVM's use case
>>>> is to share memory, but that's a _use case_, not the property of guest_memfd that
>>>> is being controlled by userspace.
>>>>
>>>> And kvm_gmem_memslot_supports_shared() is even worse.  It's simply that the
>>>> memslot is bound to a mappable guest_memfd instance, it's that the guest_memfd
>>>> instance is the _only_ entry point to the memslot.
>>>>
>>>> So my vote would be "GUEST_MEMFD_FLAG_MAPPABLE", and then something like
>>>
>>> If we are going to change this; FLAG_MAPPABLE is not clear to me either.
>>> The guest can map private memory, right?  I see your point about shared
>>> being overloaded with file shared but it would not be the first time a
>>> term is overloaded.  kvm_slot_has_gmem() does makes a lot of sense.
>>>
>>> If it is going to change; how about GUEST_MEMFD_FLAG_USER_MAPPABLE?
>>
>> If "shared" is not good enough terminology ...
>>
>> ... can we please just find a way to name what this "non-private" memory
>> is called? That something is mappable into $whatever is not the right
>> way to look at this IMHO. As raised in the past, we can easily support
>> read()/write()/etc to this non-private memory.
>>
>>
>> I'll note, the "non-private" memory in guest-memfd behaves just like ...
>> the "shared" memory in shmem ... well, or like other memory in memfd.
>> (which is based on mm/shmem.c).
>>
>> "Private" is also not the best way to describe the "protected\encrypted"
>> memory, but that ship has sailed with KVM_MEMORY_ATTRIBUTE_PRIVATE.
>>
>> I'll further note that in the doc of KVM_SET_USER_MEMORY_REGION2 we talk
>> about "private" vs "shared" memory ... so that would have to be improved
>> as well.
> 
> To add to what David just wrote, V1 of this series used the term
> "mappable" [1].  After a few discussions, I thought the consensus was
> that "shared" was a more accurate description --- i.e., mappability
> was a side effect of it being shared with the host.
> 
> One could argue that non-CoCo VMs have no concept of "shared" vs
> "private". A different way of looking at it is, non-CoCo VMs have
> their state as shared by default.

All memory of these VMs behaves similar to other memory-based shared 
memory backends (memfd, shmem) in the system, yes. You can map it into 
multiple processes and use it like shmem/memfd.

I'm still thinking about another way to call non-private memory ... no 
success so far. "ordinary" or "generic" is .... not better.

-- 
Cheers,

David / dhildenb


