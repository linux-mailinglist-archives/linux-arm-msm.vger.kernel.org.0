Return-Path: <linux-arm-msm+bounces-58848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C9ABED31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04573B8BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29F612E5B;
	Wed, 21 May 2025 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+uuAZVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906C22B8B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813016; cv=none; b=EdfPQBIhcfIl/PPms+zFVwZbjVnKM3blTkiE2NLFu70XHNCAzzmJCe9ebuZDTYrpWqT2VdboAItwPFczFTvKEQBdrIsnGKOSTH72Y/bbh3YTvoT8OvVt6gH0J9947afbVnqpJLURmi2uh1fvahjuEVuU/h8EizbEj9LT3yGB5q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813016; c=relaxed/simple;
	bh=RaVXbM8NbWfKXl5vs3Umim5AOyZ7sf4lnMQuYtG1rJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9IG2ahvOvKexI0c1Nl0vcS1j2XLanExMLc3OgM4+B88DjNzFW2owWHVyJCKwh+KuWojEIKG6D2Hzz8WUhpyvrc44LVezlZlgNNSoErOuFCEJMJB3MW5JLgRhA7PRidASet+gUay2Yql2TerEwLuYLxHb0PRPDeOqJglDR8qgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+uuAZVW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747813014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NTCPx01WLo/l17Mv9QVXXkZ0t4tJkI9Qr3I/ZeEvz0A=;
	b=i+uuAZVWal5a5iCPZm6tutYCoDUEsyAXAF/wLgZQ3ea3+eJIS3G2KYDfOvSkpfPqCcMmhv
	wu0LU37Ab6jiTSipCQKT3T5xYiFezwIYhSuS/BmeJjGs+WDh6afOS4eDccHxqxcFUjDKwE
	oVBMDhisJl6pXPIfMLLp5ak/eRuX3sY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-A6A8l_TNPYGmFG-ue4JAaA-1; Wed, 21 May 2025 03:36:52 -0400
X-MC-Unique: A6A8l_TNPYGmFG-ue4JAaA-1
X-Mimecast-MFC-AGG-ID: A6A8l_TNPYGmFG-ue4JAaA_1747813011
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43efa869b19so51632555e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747813011; x=1748417811;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NTCPx01WLo/l17Mv9QVXXkZ0t4tJkI9Qr3I/ZeEvz0A=;
        b=upCXlaaNux8E5WrKHMrZ5Lj22joGUN2V38UBTnXh9OaqfuL5DMfBRfnL8KGPfMjttu
         3rlbBJT2fRfnLdv80riEVN92ort+ZHFzPpDrbWyCE53WFNdc9faX/wU7UwImNsVLPGt9
         zxWe4O1yaPRoa6a7Mt/q5QGCHQv7BszBV06RQtjgRYOLvoO8kdVSLkGpdCz2VMBLJdN/
         OG4o7H/8SFpfnoWShaSEFWLscf+/WVp3oDFpE8ZQf5TBVUQu+J2YiOHF0EO9yuemLll8
         wNoQLV7/g34yQ5upch7aAbqD4r1J7KXP4pSRdWtqzDvuys5Ej7vpK/HAy+UUlPodS0Zd
         K7jg==
X-Forwarded-Encrypted: i=1; AJvYcCU4jGp/PohMLEpDwVFAMQZ1zUpuzEpgWFnT0dTDEKAI5HRERmp5ueZ1gTTZPoxyLmPj9nBoa9+bcKNO2t+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9SpM3PsHjmO1JBtORp3jJjwEjTc2ZZcv355zG5tR/CX0sfE2H
	6BA//Bv3Rc5aJynxFttntlMdy8t7ez1qv+lVXaj5MY4LMbILcpjGgpCU4XwVXdI2pXM2UqCiT93
	9LyUOb6uRkUTkXpA7Ynsvhp6CmU/RHKRlKiRtRf0Jz0SdMM2aSIgI9BkeHxBgvrWuGzs=
X-Gm-Gg: ASbGncsDg5H01/5ZBvZ9z0XTq37fh3dkVImhEeDC5QKotvjpLtzABj5krAeOFSTK249
	cSaqFu/qDAF9C159CYkfRIb8CuQpGWlZUSVZlOkWG90Fvg/G2LOqylzq6N1XdQf5ln8nAP0i7VN
	kjdU0M8sc55QtRQRH6PQb3CQTX7uFb4uQdHTyp1TRUgDc4gf98UvmXr/nL4tAuEsy52ozpxeip8
	3u15+qtwODcQw5/d96MfZ9HQl8Qdss83hO7xVD2kIcKSNbUM3G/JPYbgBToXsJ5TMEMOX6Q/E71
	kvQVElRt0CyXqSuTfoBrUbO8sWr87ip1yvR5gUWHJZNAZst/J25gII/u+VrClZeBZbvWO7AL3tn
	2sWG9aDj/wfhUCpyMGggiXvg9SCGmKSSTym3I7Sw=
X-Received: by 2002:a05:600c:1f87:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-442ff031805mr118789905e9.22.1747813011350;
        Wed, 21 May 2025 00:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjVSBzQbNDu0NELwCsu411OIs7trlkkbUtDTGwSOcqlG49hV5j0AUHykrVcDpciZJSEB6S1A==
X-Received: by 2002:a05:600c:1f87:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-442ff031805mr118789565e9.22.1747813010941;
        Wed, 21 May 2025 00:36:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef035csm58086085e9.11.2025.05.21.00.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:36:50 -0700 (PDT)
Message-ID: <3f5574d5-a011-4a14-825f-74b3ddd04573@redhat.com>
Date: Wed, 21 May 2025 09:36:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: Fuad Tabba <tabba@google.com>, James Houghton <jthoughton@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com,
 chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com,
 yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org,
 amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com,
 mic@digikod.net, vbabka@suse.cz, vannapurve@google.com,
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
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, peterx@redhat.com,
 pankaj.gupta@amd.com, ira.weiny@intel.com
References: <20250513163438.3942405-8-tabba@google.com>
 <diqzsel8pdab.fsf@ackerleytng-ctop.c.googlers.com>
 <CADrL8HX4WfmHk8cLKxL2xrA9a_mLpOmwiojxeFRMdYfvMH0vOQ@mail.gmail.com>
 <CA+EHjTz7JzgceGF4ZBTEuj_CidKe=pVcanuFfPMrXhubV7c2ug@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTz7JzgceGF4ZBTEuj_CidKe=pVcanuFfPMrXhubV7c2ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.05.25 17:17, Fuad Tabba wrote:
> Hi James,
> 
> On Fri, 16 May 2025 at 21:22, James Houghton <jthoughton@google.com> wrote:
>>
>> On Tue, May 13, 2025 at 11:37 AM Ackerley Tng <ackerleytng@google.com> wrote:
>>>
>>> Fuad Tabba <tabba@google.com> writes:
>>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>>> index 6db515833f61..8e6d1866b55e 100644
>>>> --- a/virt/kvm/guest_memfd.c
>>>> +++ b/virt/kvm/guest_memfd.c
>>>> @@ -312,7 +312,88 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>>>>        return gfn - slot->base_gfn + slot->gmem.pgoff;
>>>>   }
>>>>
>>>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>>> +
>>>> +static bool kvm_gmem_supports_shared(struct inode *inode)
>>>> +{
>>>> +     uint64_t flags = (uint64_t)inode->i_private;
>>>> +
>>>> +     return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
>>>> +}
>>>> +
>>>> +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)
>>>> +{
>>>> +     struct inode *inode = file_inode(vmf->vma->vm_file);
>>>> +     struct folio *folio;
>>>> +     vm_fault_t ret = VM_FAULT_LOCKED;
>>>> +
>>>> +     filemap_invalidate_lock_shared(inode->i_mapping);
>>>> +
>>>> +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
>>>> +     if (IS_ERR(folio)) {
>>>> +             int err = PTR_ERR(folio);
>>>> +
>>>> +             if (err == -EAGAIN)
>>>> +                     ret = VM_FAULT_RETRY;
>>>> +             else
>>>> +                     ret = vmf_error(err);
>>>> +
>>>> +             goto out_filemap;
>>>> +     }
>>>> +
>>>> +     if (folio_test_hwpoison(folio)) {
>>>> +             ret = VM_FAULT_HWPOISON;
>>>> +             goto out_folio;
>>>> +     }
>>
>> nit: shmem_fault() does not include an equivalent of the above
>> HWPOISON check, and __do_fault() already handles HWPOISON.
>>
>> It's very unlikely for `folio` to be hwpoison and not up-to-date, and
>> even then, writing over poison (to zero the folio) is not usually
>> fatal.
> 
> No strong preference, but the fact the it's still possible (even if
> unlikely) makes me lean towards keeping it.

__do_fault() indeed seems to handle it, so probably best to drop that 
for now.

>>>> +
>>>> +     if (WARN_ON_ONCE(folio_test_large(folio))) {
>>>> +             ret = VM_FAULT_SIGBUS;
>>>> +             goto out_folio;
>>>> +     }
>>
>> nit: I would prefer we remove this SIGBUS bit and change the below
>> clearing logic to handle large folios. Up to you I suppose.
> 
> No strong preference here either. This is meant as a way to point out
> the lack of hugepage support, based on suggestions from a previous
> spin of this series.

Yeah. With in-place conversion, we should never see large folios on this 
path. With shared-only VMs it will be different.

So for now, we can just leave it in and whoever stumbles over it can 
properly reason why it is OK for their use case to remove it.

-- 
Cheers,

David / dhildenb


