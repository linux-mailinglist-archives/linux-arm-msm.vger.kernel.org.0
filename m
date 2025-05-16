Return-Path: <linux-arm-msm+bounces-58202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE07AB9ACD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83AD81BC3D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C722367D6;
	Fri, 16 May 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZvU68c1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A001FFC77
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393973; cv=none; b=ReW8ECQYcK+LTZIl0BKOdql8tmpz2MlonRJtnYmIAyjjVHsoFdrSZvLk/BV9lzUl4Vth7mZ67ECe/YB7mQDJyOvqwmI1Cn1BYAuohD77wiWwDNNaNSQuYgsjP7cMbenygztLVfYFZUdUsfKoo0cVmNX9rcdmBvNPdhxc2tNDyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393973; c=relaxed/simple;
	bh=BuLoLNIlp6izYQ3sOmImqlPS+DYdxAau/ZMMQMsjkjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re0Eg+UxGR/72CKs/HyEqBt1qYzhz1ut16hzvoWrofGC6u8aNpVeF6yeaX4lYJ4zYgKJIOFVW12oyxIuMc8UHObA3secoUI6X8AA4In/lh6VKvUPx3RZ11EYDdyPDMn3LexenW5Rk9yojT5pHKhoFTePlLDyktkNGkewUK5Reh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZvU68c1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747393969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bKu/W8DU3ij6rwr4JOg/v4VOvnNcQknWHlz00s+AUBg=;
	b=FZvU68c1UluEraohPJyPqwJ9glpiDyh0kxdW4pvwBNRXzs93/cbjQ9CNFhbrv2hfNfzm4B
	1BsXXMy4pJD3MctTZV+zOGkemTsZ/KBYCKDp1s49BZ+sQC0mHLPsI7hJEhcLKhJM9XGHtH
	R9UW4xCWQ4F+pHI1L2GbXZREz0ScO44=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-nrKB6v_6P2ysdh1L8vj-eQ-1; Fri, 16 May 2025 07:12:48 -0400
X-MC-Unique: nrKB6v_6P2ysdh1L8vj-eQ-1
X-Mimecast-MFC-AGG-ID: nrKB6v_6P2ysdh1L8vj-eQ_1747393968
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74255209c4bso3380613b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 04:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747393967; x=1747998767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKu/W8DU3ij6rwr4JOg/v4VOvnNcQknWHlz00s+AUBg=;
        b=rZgz4lSAIKOfTnfpgTgrgtaz4JdlNMLYfRRd8Cp2ji2Mc4iXSh5rmcQMZJISQ1zutr
         L/57foFuZJQjrkB1UqxEhQAKQ+cBS0OZWwvBVIS9QGmwfAtRokn+OuZtElUjvSd09FXY
         Kx51KaWf32GMIQp85LSx0ysPNNGJaea6y3gyS59SpaOGQx07Bo6v0cSfN476Xf5TxzHg
         h2hAJckgUT5K1GLO/nmz1cNc8N2k3URXq+cMR/tJZhZM0aqk7GNtv2YkoMwuY9XxQBEP
         IkgvsVd6N2pipYByhVpORfWgj5M/HS1tcDlwC7ZbntvqS3x8grgVtYOjPr32/O9UsOwg
         J6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVB5e7YFYzuAybuDdFTtb9QWkN2upuZAixLaWmmOQcYsAWv9Szp/hUkZO1tsAJIodR1256Fo0Ox4Vke1HKo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5FI/XQfn9xaGiAF3mlE2wkDQR/XLtWu8zEatx9AksdfDrjxsu
	s25XWd7aoZy/PcJCItkRluGYaGjRxfHVign506wUNNi2GKdvHk7ZjtR9S5BufS4xQUv0lzuo64z
	plZh1YbOq04mpaUEW6NNFf8qW8Tx5aiN7ZpmYw0YmgtX187wTe5LMB5l1heObROb4yFw=
X-Gm-Gg: ASbGncum2E3gbtIija6yGRyYYHf7vVR8xyXKPMgfpGEYZf/NH22DMHPlhm9GDI1UI8V
	/g7BEHqdSE4J7nYqWzycN1eRJI+5BRgwjsK+ziKeeR1905zmzSthWihsSNz5g6qLrTiNfo+bfQM
	H0jm4yWXy3VtU8Bhp0MeN3mdqEUjMW9zPn1uJbKIu0D4xgeDMjmo3lXxI/DFyPDpiITBM0rM/5U
	qeT88NiSLENM/QI0CGuQ867YcxWJlG+Z6fIOWxbtrWaJlytrw6X48EV8sZcilRFABXzRzPSuPJf
	Eq8WgfkBr5SE
X-Received: by 2002:a05:6a20:432b:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-2170ce3c83bmr3582252637.42.1747393967510;
        Fri, 16 May 2025 04:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxpvxHOG99CzRGK2Zc4xi+ExxaRfU8D1erG5H74rgtlSvuPwg5IuG+lL5c4ya8/S7YPRObzQ==
X-Received: by 2002:a05:6a20:432b:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-2170ce3c83bmr3582175637.42.1747393966998;
        Fri, 16 May 2025 04:12:46 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac91b7sm12339915ad.19.2025.05.16.04.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:12:46 -0700 (PDT)
Message-ID: <de375d2e-21ec-4494-8a8e-800e66076647@redhat.com>
Date: Fri, 16 May 2025 21:12:25 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
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
 david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
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
References: <20250513163438.3942405-1-tabba@google.com>
 <20250513163438.3942405-8-tabba@google.com>
 <c48843fb-c492-44d4-8000-705413aa9f08@redhat.com>
 <CA+EHjTwYfZf0rsFa-O386qowRKCsKHvhUjtc-q_+9aKddRVCFQ@mail.gmail.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CA+EHjTwYfZf0rsFa-O386qowRKCsKHvhUjtc-q_+9aKddRVCFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 5/16/25 5:56 PM, Fuad Tabba wrote:
> On Fri, 16 May 2025 at 08:09, Gavin Shan <gshan@redhat.com> wrote:
>> On 5/14/25 2:34 AM, Fuad Tabba wrote:
>>> This patch enables support for shared memory in guest_memfd, including
>>> mapping that memory at the host userspace. This support is gated by the
>>> configuration option KVM_GMEM_SHARED_MEM, and toggled by the guest_memfd
>>> flag GUEST_MEMFD_FLAG_SUPPORT_SHARED, which can be set when creating a
>>> guest_memfd instance.
>>>
>>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>    arch/x86/include/asm/kvm_host.h | 10 ++++
>>>    include/linux/kvm_host.h        | 13 +++++
>>>    include/uapi/linux/kvm.h        |  1 +
>>>    virt/kvm/Kconfig                |  5 ++
>>>    virt/kvm/guest_memfd.c          | 88 +++++++++++++++++++++++++++++++++
>>>    5 files changed, 117 insertions(+)
>>>
>>
>> [...]
>>
>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>> index 6db515833f61..8e6d1866b55e 100644
>>> --- a/virt/kvm/guest_memfd.c
>>> +++ b/virt/kvm/guest_memfd.c
>>> @@ -312,7 +312,88 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>>>        return gfn - slot->base_gfn + slot->gmem.pgoff;
>>>    }
>>>
>>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>> +
>>> +static bool kvm_gmem_supports_shared(struct inode *inode)
>>> +{
>>> +     uint64_t flags = (uint64_t)inode->i_private;
>>> +
>>> +     return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
>>> +}
>>> +
>>> +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)
>>> +{
>>> +     struct inode *inode = file_inode(vmf->vma->vm_file);
>>> +     struct folio *folio;
>>> +     vm_fault_t ret = VM_FAULT_LOCKED;
>>> +
>>> +     filemap_invalidate_lock_shared(inode->i_mapping);
>>> +
>>> +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
>>> +     if (IS_ERR(folio)) {
>>> +             int err = PTR_ERR(folio);
>>> +
>>> +             if (err == -EAGAIN)
>>> +                     ret = VM_FAULT_RETRY;
>>> +             else
>>> +                     ret = vmf_error(err);
>>> +
>>> +             goto out_filemap;
>>> +     }
>>> +
>>> +     if (folio_test_hwpoison(folio)) {
>>> +             ret = VM_FAULT_HWPOISON;
>>> +             goto out_folio;
>>> +     }
>>> +
>>> +     if (WARN_ON_ONCE(folio_test_large(folio))) {
>>> +             ret = VM_FAULT_SIGBUS;
>>> +             goto out_folio;
>>> +     }
>>> +
>>
>> I don't think there is a large folio involved since the max/min folio order
>> (stored in struct address_space::flags) should have been set to 0, meaning
>> only order-0 is possible when the folio (page) is allocated and added to the
>> page-cache. More details can be referred to AS_FOLIO_ORDER_MASK. It's unnecessary
>> check but not harmful. Maybe a comment is needed to mention large folio isn't
>> around yet, but double confirm.
> 
> The idea is to document the lack of hugepage support in code, but if
> you think it's necessary, I could add a comment.
> 

Ok, I was actually nit-picky since we're at v9, which is close to integration,
I guess. If another respin is needed, a comment wouldn't be harmful, but it's
also perfectly fine without it :)

> 
>>
>>> +     if (!folio_test_uptodate(folio)) {
>>> +             clear_highpage(folio_page(folio, 0));
>>> +             kvm_gmem_mark_prepared(folio);
>>> +     }
>>> +
>>
>> I must be missing some thing here. This chunk of code is out of sync to kvm_gmem_get_pfn(),
>> where kvm_gmem_prepare_folio() and kvm_arch_gmem_prepare() are executed, and then
>> PG_uptodate is set after that. In the latest ARM CCA series, kvm_arch_gmem_prepare()
>> isn't used, but it would delegate the folio (page) with the prerequisite that
>> the folio belongs to the private address space.
>>
>> I guess that kvm_arch_gmem_prepare() is skipped here because we have the assumption that
>> the folio belongs to the shared address space? However, this assumption isn't always
>> true. We probably need to ensure the folio range is really belonging to the shared
>> address space by poking kvm->mem_attr_array, which can be modified by VMM through
>> ioctl KVM_SET_MEMORY_ATTRIBUTES.
> 
> This series only supports shared memory, and the idea is not to use
> the attributes to check. We ensure that only certain VM types can set
> the flag (e.g., VM_TYPE_DEFAULT and KVM_X86_SW_PROTECTED_VM).
> 
> In the patch series that builds on it, with in-place conversion
> between private and shared, we do add a check that the memory faulted
> in is in-fact shared.
> 

Ok, thanks for your clarification. I plan to review that series, but not
getting a chance yet. Right, it's sensible to limit the capability of modifying
page's attribute (private vs shared) to the particular machine types since
the whole feature (restricted mmap and in-place conversion) is applicable
to particular machine types. I can understand KVM_X86_SW_PROTECTED_VM
(similar to pKVM) needs the feature, but I don't understand why VM_TYPE_DEFAULT
needs the feature. I guess we may want to use guest-memfd as to tmpfs or
shmem, meaning all the address space associated with a guest-memfd is shared,
but without the corresponding private space pointed by struct kvm_userspace_memory_region2
::userspace_addr. Instead, the 'userspace_addr' will be mmap(guest-memfd) from
VMM's perspective if I'm correct.

Thanks,
Gavin

> Thanks,
> /fuad
> 
>>> +     vmf->page = folio_file_page(folio, vmf->pgoff);
>>> +
>>> +out_folio:
>>> +     if (ret != VM_FAULT_LOCKED) {
>>> +             folio_unlock(folio);
>>> +             folio_put(folio);
>>> +     }
>>> +
>>> +out_filemap:
>>> +     filemap_invalidate_unlock_shared(inode->i_mapping);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>
>> Thanks,
>> Gavin
>>
> 


