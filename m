Return-Path: <linux-arm-msm+bounces-54514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1AA8B966
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E831D7A4C12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E55A3FB0E;
	Wed, 16 Apr 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LDIpmlYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F170807
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807289; cv=none; b=FKILdBPaEkc2KbD7DXuAqvKIyR/x1dLe9mw7UMGi7mWjMUvCqc91MFbs5cnzP/vsI5QfCS/VIuG63C/lsJ+Czv5ZgAbSMkQ0JW3UkUIM5Wg6imlaN1uTu5RTzyF0JMpPlUtsLVmU0PiO/y1nirhT/UaCqtouQY1v2k2VGuqEGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807289; c=relaxed/simple;
	bh=QQ5A69eYzGXV/R/nv7hjtUG0ucXNO0xd03F3DvBR410=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIDwTRS+gmzzSnfYIhbqrP5fGg2VwzRBF9ce/ZcqHKyr5dXpvqlXW3SSmyn3KkdhI7um9zq9sn1Ii/9rc3rxBv1TWW101Ieo+Yz5Zd/TuwPnv9ykHBbThBkkyk/8fUQbYAJ7kI3oDfAaCvbb7bpM/Hgaw5Iyx4E9IOoyXSd0UvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LDIpmlYU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XszJTjivT+QmGREmU7+W0/Ngd+GXu9t7/IAPcQ4RCQw=;
	b=LDIpmlYUu4E8teJhI4Sieo80guRBDjwfugfBN3Dx5s7E/YRnL942RKUAwPshDzjeMMQ+A3
	dgqBwXWOLd2PmjwlqVzdqBvxDN7G3Bjb2g77EBDm1/6ICuhcyEB8DQ/58U1uC5DD52GCvL
	MQAGHvVwYeXt6z5FDoKLcWdHo+YHc6o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-GjDqoY2uMzi9RJTr7ixm-g-1; Wed, 16 Apr 2025 08:41:22 -0400
X-MC-Unique: GjDqoY2uMzi9RJTr7ixm-g-1
X-Mimecast-MFC-AGG-ID: GjDqoY2uMzi9RJTr7ixm-g_1744807281
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so36192375e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744807281; x=1745412081;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XszJTjivT+QmGREmU7+W0/Ngd+GXu9t7/IAPcQ4RCQw=;
        b=WiLVJeUx+d43jvMq8vgV2XW3TPuSiowHWNCNZKwNsiBbkhlIHpWYDgXgu5EDIzTtJl
         Y0Bk87QljUJjyhlaW342TLGyBgdiHvbqbbr6HNuwyvgTXx8X9s0dFMtmi/TrbhEdSqpX
         KeJwpgix9vzCiI5tndHj+5vhB8r13vvs9H5BZRVe6RQJBwtC9b5aTv4Y12RQ/pRDRXIg
         Eq+vF7udbnTOIZW8G3JduIK4ZRzrKfNQjVhs0hVPgjHlGxAnpcDLjYUWT08XIKkSfuMb
         5Jih/Yj6V2nvUjw1kDkws+fjNTeWUUzgiUJYec0KGlJ8lBVxEq4Nh1Cx2PljB03xGq02
         xr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQX84cZvccQdCFHOtStYdxOzr9Up5JSTyDE9MXwJ5rIQViTG4L6fqFcB+o1IesFHfJTnakSPAn9nu0fglc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8KynjanoKDDgaZRz32txMVdMm+/VQICLhcsVdL15VE+fRgJ6p
	0KIhOSvwG3sUEGw20I6hsrbtfAgvOK+7NU5MU6HHYQSU0JO1B3bzoMYBHPFBV6MVfxIy2lwyHXT
	Nrj8m3YZ+PLey0wuTyvob/47tgIc0OGhB36CvQ3SPzN9vpKOkIJHwp9nnN7zsXho=
X-Gm-Gg: ASbGncuA8dV0aUN3ojZXUwwG4u+2vDvKtViHhufLtKS2qj6mNzppi9V+kHb0jsbCbtI
	tIBdNu02ihHhWfVAlMfRX+fvB8p2FxNu66Chsd51+/OoXrZURphxZgu5zwLwQkYnRxROydATenA
	QkephQLqRwKkvVrdmef+r/zY2Zb+PLatxPNJmdAwq6/psQgcbBnZxyVcnM+nYqXA2q4QnnXFiaG
	GKdJTN4cZftJ0vexx5gCPv1EAAwlksuKxTFjAlG330qap2cHpa53YIX5p8Q1Xb+CAHbbpXYDa1U
	QX7RXdI+4qye2y7ilyLphaF3H5dgS7CwWZU503N9tHFPBBIxkaWirNP0EfWIvx+gB8z5QfyjnI5
	uOR0jrGU+L2XQQE8auXMadtQp248hmX/WK7ikjw==
X-Received: by 2002:a05:600c:1d2a:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-4405d62506bmr15374875e9.13.1744807281038;
        Wed, 16 Apr 2025 05:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt0tQxm9WYeFwZs6LF0xakcfpCDBQ64xorUkib6XcR7i/2gtcJz/+BZ8RWrcvYl2gwsTPbiw==
X-Received: by 2002:a05:600c:1d2a:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-4405d62506bmr15371625e9.13.1744807276522;
        Wed, 16 Apr 2025 05:41:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2444sm20160495e9.17.2025.04.16.05.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:41:15 -0700 (PDT)
Message-ID: <db1dd4e9-de22-46a3-a427-13ff35e9b1dd@redhat.com>
Date: Wed, 16 Apr 2025 14:41:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] KVM: guest_memfd: Handle in-place shared memory as
 guest_memfd backed memory
To: Patrick Roy <roypat@amazon.co.uk>, Fuad Tabba <tabba@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
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
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com
References: <20250318161823.4005529-1-tabba@google.com>
 <20250318161823.4005529-5-tabba@google.com>
 <8ebc66ae-5f37-44c0-884b-564a65467fe4@redhat.com>
 <392fc76a-5d2a-441d-99c8-532c0bbb052b@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <392fc76a-5d2a-441d-99c8-532c0bbb052b@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 14:30, Patrick Roy wrote:
> Hi!
> 
> On Mon, 2025-04-14 at 12:51 +0100, David Hildenbrand wrote:
>>
> 
> [...]
> 
>> On top of that, I was wondering if we could look into doing something like
>> the following. It would also allow for pulling pages out of gmem for
>> existing SW-protected VMs once they enable shared memory for GMEM IIUC.
>>
>>
>> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
>> index 08eebd24a0e18..6f878cab0f466 100644
>> --- a/arch/x86/kvm/mmu/mmu.c
>> +++ b/arch/x86/kvm/mmu/mmu.c
>> @@ -4495,11 +4495,6 @@ static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
>>   {
>>          int max_order, r;
>>
>> -       if (!kvm_slot_has_gmem(fault->slot)) {
>> -               kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
>> -               return -EFAULT;
>> -       }
>> -
>>          r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
>>                               &fault->refcounted_page, &max_order);
>>          if (r) {
>> @@ -4518,8 +4513,19 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
>>                                   struct kvm_page_fault *fault)
>>   {
>>          unsigned int foll = fault->write ? FOLL_WRITE : 0;
>> +       bool use_gmem = false;
>> +
>> +       if (fault->is_private) {
>> +               if (!kvm_slot_has_gmem(fault->slot)) {
>> +                       kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
>> +                       return -EFAULT;
>> +               }
>> +               use_gmem = true;
>> +       } else if (kvm_slot_has_gmem_with_shared(fault->slot)) {
>> +               use_gmem = true;
>> +       }
>>
>> -       if (fault->is_private)
>> +       if (use_gmem)
>>                  return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
>>
>>          foll |= FOLL_NOWAIT;
>>
>>
>> That is, we'd not claim that things are private when they are not, but instead
>> teach the code about shared memory coming from gmem.
>>
>> There might be some more missing, just throwing it out there if I am completely off.
> 
> I think I arrived at the need for this as well while experimenting with
> building a Firecracker version that works with my direct map removal
> patches.
> 
> With this patch series, on ARM, as soon as a memslot has a guest_memfd
> associated with it, all guest faults go through kvm_gmem_get_pfn, but on
> x86, they go through slot->userspace_addr by default, as
> CONFIG_KVM_SW_PROTECTED_VM selects CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
> There's no real difference between these if slot->userspace_addr can be
> GUP'd, but if its a VMA of a guest_memfd without direct map entries,
> faulting through slot->userspace_addr wont work. So on x86 Firecracker
> has to formally set the memory attributes to private, while on ARM it
> doesn't [1], which is a bit awkward.

Exactly. I proposed all that (especially the interactions/expectations 
regarding KVM memory slots) as a topic for tomorrow's meeting. See below 
on my current idea.

> 
> David, I couldn't find an implementation of
> kvm_slot_has_gmem_with_shared() in the branch you shared, but would it
> be something like "slot->userspace_addr points to a gmem VMA,
> particularly to a VMA of the gmem that's associated with this memslot,
> mapped at the same offset"?

That's open for discussion, and the implementation of that will have to 
be clarified in the concept of this series.

I would have made the KVM slot setup by user space a requirement:

If we enabled "gmem allows for shared memory / mmap" for a MM, then user 
space *must* provide a mmap() of that guest_memfd in slot->userspace_addr.

(we might also be able to use a new slot flag to specify that)

With that, we can just say
* In the MMU etc, avoid walking the page tables and just grab the page
   from guest_memfd.
* Where not possible (e.g., emulator access as discussed) we can just
   access the page in the user space mapping

Does that sound reasonable?

-- 
Cheers,

David / dhildenb


