Return-Path: <linux-arm-msm+bounces-48743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F561A3E21C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B734254BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E012139A6;
	Thu, 20 Feb 2025 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bMcQu5a+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C1212B22
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071533; cv=none; b=Ofd9TjgSoSzyGGZe7hP4y5AOhuGriN3DLN7DePgpY2E3mcBCotWYbVAt1zyGXK9qdrkZl0g868HUaBU1Hh8m4VtlJp/eU+sNqYPMYUnXL5QLaPUonkmXv3HiB4knnZq5GApOCTsDy3XStgGM1HqAQ2bvrae+/I8Q2Xb8OxP7b0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071533; c=relaxed/simple;
	bh=HQEno4F0dQNeF0JqNJsDYj1eD+cfH9/d+WXGWwnT9wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9a4f31Wf+DXAUPjiJRRI/wpcufdrK7LS09lr4toxnrRgmUlhIhrZkL3JXibTJ9BojA4CM0EObrFN71DzLHM8DPxoltCVRFaED+fePlL12BczjdcGvHMZ4GEilc3R3E11mCJq1978rIulDJmwgo+MgSxo7JWRkRlaAMDz0tq1BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bMcQu5a+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740071531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U5P+rFsd1PPk8wtZkirahTWayqsFxSqkTLxXBs4CM+0=;
	b=bMcQu5a+ctQ3MgtK68PV9Ax0fIUZmEa9ps7x/Fgs47dnSUT31sqVMH5tBz5TIXbRL/m6Ao
	UPj2MvCJ3Aa+Ip50ZdqTvYIeNLaCxjYBP4TXfjX6T7BwdPUTR1CcyAN+DrCMv7pzcOhsg2
	lXqn0ikBihbgPEw1K4M1JnV3Wp4ltU0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-GPjnSa4uO3WM5HmqchKp3g-1; Thu, 20 Feb 2025 12:12:09 -0500
X-MC-Unique: GPjnSa4uO3WM5HmqchKp3g-1
X-Mimecast-MFC-AGG-ID: GPjnSa4uO3WM5HmqchKp3g_1740071529
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f2c0aa6d6so1071531f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071529; x=1740676329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U5P+rFsd1PPk8wtZkirahTWayqsFxSqkTLxXBs4CM+0=;
        b=f1355w9ekzIokY0JKtTRfdRtJmC6DGgionSt70wJyicRS/fprBB9XxdD7EVndBQ8Df
         7z+kuPlrB3TBO1n13TR9u3SOnBkv7bCJlwCnUmNQ8rFZdodrCFgqsJzWfQEHMyvwfARc
         SJdaA0RlUG8G6zWQXvs42Ze8DpErqtPbczKWkAZqTveLMSFE2AWDaRXCsUMn+eIxfBIW
         Z1gLBcq3Ja2eaDFLdQ4GAxBQ/hm3zoU585D5s6pUEqa25KTKcsSCIrL+THIGGCzcJ1Os
         z8X/gskWvUfO6Z9t7XWL2OjalQeKcseLfvqyCgiAY3LcPenUunxXroU6GZ1PvtyEwJRi
         acrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrhOEHJ7z1ns408hl0wgOhqsZJvTiR7p7zFnyY0l1T5be3Rmk1iXP2XOy7ECPRAsx9TaEOrW326qE8x7gA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DODDL/USEN9XIv28/YtMKjW6o4lw/YYyKaV46svuO88qy2Fp
	N/a2p59dC/mOypihppZwIJZwM/wZvGA6FaszUJTAeegldE0fianOMd9AV+McyQYxBXedQA0xv+c
	BSTEyokcWOccsfKEY58HRm/0JJSSyaZTw8BaHlZyypue29jkmVf0EJ6+ZD/vXVA4=
X-Gm-Gg: ASbGnctdzCeEE7Xksen4es62t/Fd9Zl6hffwX9IsstEujnysYVX2fo8gyVxmUCtfNj/
	DTksOf31aDlG10xXzNhcdOxoc5jBVilW3gkHYAZ1XHC0e002qXJ4s63j/Jfn3RK/OluVi/dzcUe
	I6r5GyjaPo6fBlmXx5Dd+yICrxhh+Lyh+lUZu3Cgb6RyDDNHNleP7Z64xcs2kWcjDvZUZrr9/cl
	BUW7Krr1s8TSko6Iu0kpWHpT65m/4aK38CSsgYM4c/9QyeVtCL6RjcqpFOa3SRVv6CiojJfR4ix
	kPdTTJpf6zUXpZC53DiFbSV3xOOQt34qxC1/hajlaqP5HynjW8aJ7ZzHogPu2yfhOPigtvhEASi
	qOaUAqhXuovCOPFwbK/aVkkS/Hb57YA==
X-Received: by 2002:a05:6000:2a5:b0:38d:d533:d9a2 with SMTP id ffacd0b85a97d-38f615be1bamr3752570f8f.13.1740071528508;
        Thu, 20 Feb 2025 09:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOH4O4q4Rjybh5/4swvMnObrM5hyoH6XGZevfPiz8agG55TMdz5eLP40RuQUM8k/7y/gd/Hw==
X-Received: by 2002:a05:6000:2a5:b0:38d:d533:d9a2 with SMTP id ffacd0b85a97d-38f615be1bamr3752503f8f.13.1740071528023;
        Thu, 20 Feb 2025 09:12:08 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:2000:e44c:bc46:d8d3:be5? (p200300cbc7062000e44cbc46d8d30be5.dip0.t-ipconnect.de. [2003:cb:c706:2000:e44c:bc46:d8d3:be5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f64b0f565sm2341513f8f.51.2025.02.20.09.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:12:06 -0800 (PST)
Message-ID: <404807ee-a5d0-4409-a0d4-f475a6eb39ac@redhat.com>
Date: Thu, 20 Feb 2025 18:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
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
 jthoughton@google.com
References: <20250218172500.807733-1-tabba@google.com>
 <20250218172500.807733-4-tabba@google.com>
 <2cdc5414-a280-4c47-86d5-4261a12deab6@redhat.com>
 <CA+EHjTxh9GB93BHr7ymJ5j8c27Lka2cBjEgfNRXY9pYL25utfg@mail.gmail.com>
 <CA+EHjTyyXEMuQrg8yFo=+SVuM+ZfvZJksS9Z4DAOr2KsuO5M-Q@mail.gmail.com>
 <69467908-17a5-4700-b5da-efc0446b8663@redhat.com>
 <CA+EHjTz0RpD7wA4dF79zh85w3nzQ0Y4GAuTa+=zyOw66i0O9WA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTz0RpD7wA4dF79zh85w3nzQ0Y4GAuTa+=zyOw66i0O9WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.02.25 18:10, Fuad Tabba wrote:
> On Thu, 20 Feb 2025 at 15:58, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 20.02.25 16:45, Fuad Tabba wrote:
>>> Hi David,
>>>
>>> On Thu, 20 Feb 2025 at 12:04, Fuad Tabba <tabba@google.com> wrote:
>>>>
>>>> On Thu, 20 Feb 2025 at 11:58, David Hildenbrand <david@redhat.com> wrote:
>>>>>
>>>>> On 18.02.25 18:24, Fuad Tabba wrote:
>>>>>> Add support for mmap() and fault() for guest_memfd backed memory
>>>>>> in the host for VMs that support in-place conversion between
>>>>>> shared and private. To that end, this patch adds the ability to
>>>>>> check whether the VM type supports in-place conversion, and only
>>>>>> allows mapping its memory if that's the case.
>>>>>>
>>>>>> This behavior is also gated by the configuration option
>>>>>> KVM_GMEM_SHARED_MEM.
>>>>>>
>>>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>>>> ---
>>>>>>     include/linux/kvm_host.h |  11 +++++
>>>>>>     virt/kvm/guest_memfd.c   | 103 +++++++++++++++++++++++++++++++++++++++
>>>>>>     2 files changed, 114 insertions(+)
>>>>>>
>>>>>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>>>>>> index 3ad0719bfc4f..f9e8b10a4b09 100644
>>>>>> --- a/include/linux/kvm_host.h
>>>>>> +++ b/include/linux/kvm_host.h
>>>>>> @@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>>>>>     }
>>>>>>     #endif
>>>>>>
>>>>>> +/*
>>>>>> + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
>>>>>> + * private memory is enabled and it supports in-place shared/private conversion.
>>>>>> + */
>>>>>> +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
>>>>>> +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
>>>>>> +{
>>>>>> +     return false;
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>>     #ifndef kvm_arch_has_readonly_mem
>>>>>>     static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>>>>>>     {
>>>>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>>>>> index c6f6792bec2a..30b47ff0e6d2 100644
>>>>>> --- a/virt/kvm/guest_memfd.c
>>>>>> +++ b/virt/kvm/guest_memfd.c
>>>>>> @@ -317,9 +317,112 @@ void kvm_gmem_handle_folio_put(struct folio *folio)
>>>>>>     {
>>>>>>         WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
>>>>>>     }
>>>>>> +
>>>>>> +static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
>>>>>> +{
>>>>>> +     struct kvm_gmem *gmem = file->private_data;
>>>>>> +
>>>>>> +     /* For now, VMs that support shared memory share all their memory. */
>>>>>> +     return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
>>>>>> +}
>>>>>> +
>>>>>> +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
>>>>>> +{
>>>>>> +     struct inode *inode = file_inode(vmf->vma->vm_file);
>>>>>> +     struct folio *folio;
>>>>>> +     vm_fault_t ret = VM_FAULT_LOCKED;
>>>>>> +
>>>>>> +     filemap_invalidate_lock_shared(inode->i_mapping);
>>>>>> +
>>>>>> +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
>>>>>> +     if (IS_ERR(folio)) {
>>>>>> +             switch (PTR_ERR(folio)) {
>>>>>> +             case -EAGAIN:
>>>>>> +                     ret = VM_FAULT_RETRY;
>>>>>> +                     break;
>>>>>> +             case -ENOMEM:
>>>>>> +                     ret = VM_FAULT_OOM;
>>>>>> +                     break;
>>>>>> +             default:
>>>>>> +                     ret = VM_FAULT_SIGBUS;
>>>>>> +                     break;
>>>>>> +             }
>>>>>> +             goto out_filemap;
>>>>>> +     }
>>>>>> +
>>>>>> +     if (folio_test_hwpoison(folio)) {
>>>>>> +             ret = VM_FAULT_HWPOISON;
>>>>>> +             goto out_folio;
>>>>>> +     }
>>>>>> +
>>>>>> +     /* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
>>>>>> +     if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
>>>>>> +             ret = VM_FAULT_SIGBUS;
>>>>>> +             goto out_folio;
>>>>>> +     }
>>>>>> +
>>>>>> +     /*
>>>>>> +      * Only private folios are marked as "guestmem" so far, and we never
>>>>>> +      * expect private folios at this point.
>>>>>> +      */
>>>>>> +     if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
>>>>>> +             ret = VM_FAULT_SIGBUS;
>>>>>> +             goto out_folio;
>>>>>> +     }
>>>>>> +
>>>>>> +     /* No support for huge pages. */
>>>>>> +     if (WARN_ON_ONCE(folio_test_large(folio))) {
>>>>>> +             ret = VM_FAULT_SIGBUS;
>>>>>> +             goto out_folio;
>>>>>> +     }
>>>>>> +
>>>>>> +     if (!folio_test_uptodate(folio)) {
>>>>>> +             clear_highpage(folio_page(folio, 0));
>>>>>> +             kvm_gmem_mark_prepared(folio);
>>>>>> +     }
>>>>>
>>>>> kvm_gmem_get_pfn()->__kvm_gmem_get_pfn() seems to call
>>>>> kvm_gmem_prepare_folio() instead.
>>>>>
>>>>> Could we do the same here?
>>>>
>>>> Will do.
>>>
>>> I realized it's not that straightforward. __kvm_gmem_prepare_folio()
>>> requires the kvm_memory_slot, which is used to calculate the gfn. At
>>> that point we have neither, and it's not just an issue of access, but
>>> there might not be a slot associated with that yet.
>>
>> Hmm, right ... I wonder if that might be problematic. I assume no
>> memslot == no memory attribute telling us if it is private or shared at
>> least for now?
>>
>> Once guest_memfd maintains that state, it might be "cleaner" ? What's
>> your thought?
> 
> The idea is that this doesn't determine whether it's shared or private
> by the guest_memfd's attributes, but by the new state added in the
> other patch series. That's independent of memslots and guest addresses
> altogether.
> 
> One scenario you can imagine is the host wanting to fault in memory to
> initialize it before associating it with a memslot. I guess we could
> make it a requirement that you cannot fault-in pages unless they are
> associated with a memslot, but that might be too restrictive.

Okay, just what I thought, thanks!

-- 
Cheers,

David / dhildenb


