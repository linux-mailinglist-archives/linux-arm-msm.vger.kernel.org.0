Return-Path: <linux-arm-msm+bounces-60567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6147AD1A45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 11:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE2887A193B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 09:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E5524DCFB;
	Mon,  9 Jun 2025 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZo0CoPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E638F80
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460000; cv=none; b=nsdE7iH1t2z2rwiGdWILGnYyPrDHi1qGUuaSnv6aySVRL5XvDx/IkOKzKvnWTxQ3k8/MX3kDpa3eF00aNdIhRTFwYrX/JUAqXJcegShmlFQluLJvQorIgMbS2Q9do6vBbQMfN/0mfn1s1tbRuZ+YpXmBEDjuu8N0q6qncB8DWOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460000; c=relaxed/simple;
	bh=M4cXpZ2Wr6E3SWaPSRYtog3F0WkfKTFjCP1vUA3TrVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjGaVav/hV80qAvIur1YbXRjRtPGIpIxy4Qt3YDbBfsh9I7i8UmyseFTGBNYO8De390ixLyppbx1LcDjElicYtwRX9PXy+bSbkcxfBKWZtUji5TuUQsK1MXO1KhWJvYr2lNAFtvJZPODX0cHBwEOLziiAY1Ua0bmVERikwcRgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZo0CoPC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749459997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEEHwqpkGXwZV2216XAk2Y9KxNh7e2DRzC+1fZlQs/w=;
	b=PZo0CoPCPZ9ASdvOAzG71Pw3OM3cCAT/UV6tBjPxYVAVWNrwNeaUPixPukhpRKTe3XzqtY
	uenT20rxtk2CihnoKvFkGlqF6i+6dYQ/DEV+m4IRm2137sw1zzq9MZ2aRE9RJUqxaBRRzg
	egD0hZklOPpYAJhqTTmqHxbTCFQgm1w=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-jPcA567MP4qIcBIGxwKiMA-1; Mon, 09 Jun 2025 05:06:36 -0400
X-MC-Unique: jPcA567MP4qIcBIGxwKiMA-1
X-Mimecast-MFC-AGG-ID: jPcA567MP4qIcBIGxwKiMA_1749459995
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747d29e90b4so3104074b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 02:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749459995; x=1750064795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEEHwqpkGXwZV2216XAk2Y9KxNh7e2DRzC+1fZlQs/w=;
        b=YtfTX8NUUUonU7snO+tBSi88w19/cSxjdhShxwiM2V1XSlaHRMxzRgYCzyz8lFlTwN
         9rjCMoPnpGru/f4hdzsVbAnmMjMLBElTBO1W57ZLZKgkkAqxul2k9DwEJqzc5nTA7Vtj
         zQS71BSAQ3Ht8bWJ1Csa8xGZDYGZYKIdeYQ4q4Bp0BAtoDtANLIjB8HLClhgyWRJSLo0
         44KmUMmX9EGoHjQ5dTqfIIKlDyovu8dy4by0Tf/ayYXG+mwuJ2ETzpUCIXQHthxdH/08
         bQJFS3fpXrzWXGaV1CSpWafVF0fBzR1rzlGjPQHC5pg9uR24nsRRhz86ZDKE74brc2YC
         tHiA==
X-Forwarded-Encrypted: i=1; AJvYcCUwH8Se1Im/bG2IAfod7Sl5A7cvtqzPI5dK69jZdActz+xM9oM3hAlkOtLU8hHsqTD8jp7H5ho2S0vhcVXf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CGUj/Udy5HAOwqFptYlzs1pCM3+96+bLJdcW1XlCapi2oFEb
	4SH+F7MTAph5PXV5YnyCdHOPN/M3XWjQNCAM73sdFH+xIDOkr9EGt9gx8TOEuZSTfquIqekrhUA
	ABb5EYNjTCPdrnZgyqAOSLgz8laCZP1dVoqHtYTGDFuhcgwBnkBQ43t7cBFvz4rQqdPw=
X-Gm-Gg: ASbGncu8/5nTqg6rDMY8kgvPPZSRmPP6/VEQAcBndK8HljkQ48rwObKd/3ryiG7Z3VZ
	a3KZcjasR/chHOH/vJrdFmTeqloeSwQTiJ1P7LxrrAHD95Efodm45dLG1AE28BNrvQusWBrgtGy
	D7su5KA3nmBVRULovsachkGD6W0vARlVKrL12VuUX1C4y0g5h8Ax0r3HRWzWLnppXeIguUXEme8
	qpDj1iWhC2MZTvbDBDboj1Ca8zh16C6C+FfXrrNCcgXW43IW0H3jByZqdi5EUv64cdUr+04DLJ0
	sN6rQRa27CpvfFvnpSVf8GSfaCqpWMxnV8bIwaQIHN9v6dtPtGE=
X-Received: by 2002:a05:6a00:855:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-74827e52592mr16210630b3a.2.1749459994980;
        Mon, 09 Jun 2025 02:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKGPBkTgOwJbD6LOShmxspDJzxpRw6rpArgiEpKcpdDBfYG0pvKVKOm0Fv+3YXAjw3oq1wkw==
X-Received: by 2002:a05:6a00:855:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-74827e52592mr16210573b3a.2.1749459994498;
        Mon, 09 Jun 2025 02:06:34 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b606sm5481711b3a.67.2025.06.09.02.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 02:06:33 -0700 (PDT)
Message-ID: <b3607092-df66-471b-b736-142ab65d35b2@redhat.com>
Date: Mon, 9 Jun 2025 19:06:13 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 14/18] KVM: arm64: Handle guest_memfd-backed guest
 page faults
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com,
 chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
 dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net,
 vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
 mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
 wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250605153800.557144-1-tabba@google.com>
 <20250605153800.557144-15-tabba@google.com>
 <3d9a15ff-fbb2-4e9a-b97b-c0e40eb23043@redhat.com>
 <CA+EHjTzSWbw=Vrc+_4rEs_QsQ=6w44H4pGrJPtZeY8n=s4qZRw@mail.gmail.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CA+EHjTzSWbw=Vrc+_4rEs_QsQ=6w44H4pGrJPtZeY8n=s4qZRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 6/9/25 5:04 PM, Fuad Tabba wrote: 
> On Mon, 9 Jun 2025 at 05:08, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 6/6/25 1:37 AM, Fuad Tabba wrote:
>>> Add arm64 support for handling guest page faults on guest_memfd backed
>>> memslots. Until guest_memfd supports huge pages, the fault granule is
>>> restricted to PAGE_SIZE.
>>>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>    arch/arm64/kvm/mmu.c | 93 ++++++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 90 insertions(+), 3 deletions(-)
>>>
>>
>> One comment below. Otherwise, it looks good to me.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index ce80be116a30..f14925fe6144 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -1508,6 +1508,89 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
>>>        *prot |= kvm_encode_nested_level(nested);
>>>    }
>>>
>>> +#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
>>> +
>>> +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>> +                   struct kvm_s2_trans *nested,
>>> +                   struct kvm_memory_slot *memslot, bool is_perm)
>>> +{
>>> +     bool logging, write_fault, exec_fault, writable;
>>> +     enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
>>> +     enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>>> +     struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
>>> +     struct page *page;
>>> +     struct kvm *kvm = vcpu->kvm;
>>> +     void *memcache;
>>> +     kvm_pfn_t pfn;
>>> +     gfn_t gfn;
>>> +     int ret;
>>> +
>>> +     ret = prepare_mmu_memcache(vcpu, !is_perm, &memcache);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (nested)
>>> +             gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
>>> +     else
>>> +             gfn = fault_ipa >> PAGE_SHIFT;
>>> +
>>> +     logging = memslot_is_logging(memslot);
>>> +     write_fault = kvm_is_write_fault(vcpu);
>>> +     exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>>> +
>>> +     if (write_fault && exec_fault) {
>>> +             kvm_err("Simultaneous write and execution fault\n");
>>> +             return -EFAULT;
>>> +     }
>>> +
>>> +     if (is_perm && !write_fault && !exec_fault) {
>>> +             kvm_err("Unexpected L2 read permission error\n");
>>> +             return -EFAULT;
>>> +     }
>>> +
>>> +     ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
>>> +     if (ret) {
>>> +             kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
>>> +                                           write_fault, exec_fault, false);
>>> +             return ret;
>>> +     }
>>> +
>>
>> -EFAULT or -EHWPOISON shall be returned, as documented in virt/kvm/api.rst. Besides,
>> kvm_send_hwpoison_signal() should be executed when -EHWPOISON is returned from
>> kvm_gmem_get_pfn()? :-)
> 
> This is a bit different since we don't have a VMA. Refer to the discussion here:
> 
> https://lore.kernel.org/all/20250514212653.1011484-1-jthoughton@google.com/
> 

Thanks for the pointer. You're right that we don't have VMA here. To return the
'ret' to userspace seems the practical way to have here.

Thanks,
Gavin

>>
>>> +     writable = !(memslot->flags & KVM_MEM_READONLY) &&
>>> +                (!logging || write_fault);
>>> +
>>> +     if (nested)
>>> +             adjust_nested_fault_perms(nested, &prot, &writable);
>>> +
>>> +     if (writable)
>>> +             prot |= KVM_PGTABLE_PROT_W;
>>> +
>>> +     if (exec_fault ||
>>> +         (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
>>> +          (!nested || kvm_s2_trans_executable(nested))))
>>> +             prot |= KVM_PGTABLE_PROT_X;
>>> +
>>> +     kvm_fault_lock(kvm);
>>> +     if (is_perm) {
>>> +             /*
>>> +              * Drop the SW bits in favour of those stored in the
>>> +              * PTE, which will be preserved.
>>> +              */
>>> +             prot &= ~KVM_NV_GUEST_MAP_SZ;
>>> +             ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
>>> +     } else {
>>> +             ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
>>> +                                          __pfn_to_phys(pfn), prot,
>>> +                                          memcache, flags);
>>> +     }
>>> +     kvm_release_faultin_page(kvm, page, !!ret, writable);
>>> +     kvm_fault_unlock(kvm);
>>> +
>>> +     if (writable && !ret)
>>> +             mark_page_dirty_in_slot(kvm, memslot, gfn);
>>> +
>>> +     return ret != -EAGAIN ? ret : 0;
>>> +}
>>> +
>>>    static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>>                          struct kvm_s2_trans *nested,
>>>                          struct kvm_memory_slot *memslot, unsigned long hva,
>>> @@ -1532,7 +1615,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>>        enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>>>        struct kvm_pgtable *pgt;
>>>        struct page *page;
>>> -     enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
>>> +     enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
>>>
>>>        if (fault_is_perm)
>>>                fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
>>> @@ -1959,8 +2042,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>                goto out_unlock;
>>>        }
>>>
>>> -     ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
>>> -                          esr_fsc_is_permission_fault(esr));
>>> +     if (kvm_slot_has_gmem(memslot))
>>> +             ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
>>> +                              esr_fsc_is_permission_fault(esr));
>>> +     else
>>> +             ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
>>> +                                  esr_fsc_is_permission_fault(esr));
>>>        if (ret == 0)
>>>                ret = 1;
>>>    out:
>>
> 


