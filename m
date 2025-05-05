Return-Path: <linux-arm-msm+bounces-56874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0DAAB435
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD6A5021D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3331474755;
	Tue,  6 May 2025 00:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zGCRuh7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F12D269E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486604; cv=none; b=bWfIPo0WD5lPFt8VqDw7JSUrsWz52ALjEY7Ri/w+Ptvwxn9aR0taElCoguGt2L/CK3Cl+15ZSkHjt04KUoFmehdXyp5vsFlt/WJb7VqXJUrqyL4qiJrOmQTASfZbriN0bs6xNrNoeRvsnhxstAbMM++pl6m63KUol7ZJPw4QRN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486604; c=relaxed/simple;
	bh=RONzCBKEJXsibO821H3QXKTMTcGq3jA6Qh5Dz6t2q8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AUGAuWFtE91MHSKM3PZGN5Z6GRtew/FgQg1hgw511twAofi/rfqbaJ7pqQKM900z+HI8/plb5y4JeFgV712NOVvRe9yNQAUPfTrhEMbtHJW+eX0IGAgdXXUSwTMW13RSpGPVMlFfz76WxQPHrwTwfOS0+5jQiiAoz77v66K/aTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zGCRuh7a; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4114807b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 16:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746486601; x=1747091401; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QKDIrUmShBenn7oyPXZBGKMvZgIcDdiYuAx6vvvr0uk=;
        b=zGCRuh7aYzqX4ZTXG36/Upqvf3NBSQ5ZbsN+pFrFgPWFADmf2yTrvgs8Lgi/7RxiyF
         rSfG7c/MPjgbAwefUcug7Txlm2ueqF32DLcJuwJvDLXlKR1I45d2HVYAFuvmrMbJb88e
         zwQABPE8GOnaclAgiCB9bZNXaskKEQ4oVNttUImFZZtBUlyVPhOCFUmZ33GKHQbqopsu
         zpZgExvnC25zi5HIsdco8tvFcdqUp6VrMQG1B1tlP0jb6UfMcbg21j0jX1nCYAwNRf5J
         R4kT1zj4nKFbeX/X1yIMAxEv1Jv365WXvCcKlXzUfjOiOPfhwuw8dxXBe9mBTJXT8XJo
         RkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746486601; x=1747091401;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKDIrUmShBenn7oyPXZBGKMvZgIcDdiYuAx6vvvr0uk=;
        b=LUeS6LI5uzpXZul7IFR9MSyB3PX8DJyM9zbbKDfI3oWzDP1TbDZLhH+sXRgCqoknzY
         QfSPQlrLSD2VH7po2eI77W3ZTE0WIamWUiKGZXnyvTXyiNNuJbGrhJ9DEnEHduSLdQlL
         vv97qcsMn/K0S8ScQ4RSwCZXf3N/QlnkEybWFw/Vrr/elxzYha6cMwBsHcVy0qUDWWVz
         gU3eJloEaC4j5stWidVvzmFwuLbt8pkkC7/KfPO7Le7mi2QfN2W0N9VmylABua3T0H2d
         CRyMQj9FWLOWwkJUmU1m3+riXmsKvgDDRiuKVRQP3SuiGur0u4snbI6Q4sVSPGvAZnkH
         rLOA==
X-Forwarded-Encrypted: i=1; AJvYcCWUxWuluxlPaiPuFIP/0RVhwS39gzDQ5KkldYScbePp8/PA7Ro4V1bo+ffFZaCCbwwyVIPijyq9SaDQRPHL@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjDiZQuG3GtPZzF4RZbgcWGFUmYbt7ZVTIlgrkMCpjwxpkzt6
	QpKbfvL8oocK9b7hLA2lEJE3nl2TbBDx80eiFgYzeswfnkZtgPAFSQdD08LCCf5le07kJnwoMix
	pbgU0V5diqNNAruCKcfvwRw==
X-Google-Smtp-Source: AGHT+IH8nRtKZdcXRNW5pHePDqwjVYLFx8dauinck+p9OIy/5vnrG+4KpoUHfGGyuxJRstUfMIhSpCGvhSjtLgsvJw==
X-Received: from pfst35.prod.google.com ([2002:aa7:8fa3:0:b0:736:86e0:8dee])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:aa8d:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-74091a963c7mr1411673b3a.24.1746486600519;
 Mon, 05 May 2025 16:10:00 -0700 (PDT)
Date: Mon, 05 May 2025 16:09:58 -0700
In-Reply-To: <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com> <aBTxJvew1GvSczKY@google.com>
 <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com> <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
Message-ID: <diqzfrhik62h.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand <david@redhat.com> writes:

> On 03.05.25 00:00, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>>> On Fri, May 02, 2025, David Hildenbrand wrote:
>>>> On 30.04.25 20:58, Ackerley Tng wrote:
>>>>>> -	if (is_private)
>>>>>> +	if (is_gmem)
>>>>>>    		return max_level;
>>>>>
>>>>> I think this renaming isn't quite accurate.
>>>>
>>>> After our discussion yesterday, does that still hold true?
>>>
>>> No.
>>>
>>>>> IIUC in __kvm_mmu_max_mapping_level(), we skip considering
>>>>> host_pfn_mapping_level() if the gfn is private because private memory
>>>>> will not be mapped to userspace, so there's no need to query userspace
>>>>> page tables in host_pfn_mapping_level().
>>>>
>>>> I think the reason was that: for private we won't be walking the user space
>>>> pages tables.
>>>>
>>>> Once guest_memfd is also responsible for the shared part, why should this
>>>> here still be private-only, and why should we consider querying a user space
>>>> mapping that might not even exist?
>>>
>>> +1, one of the big selling points for guest_memfd beyond CoCo is that it provides
>>> guest-first memory.  It is very explicitly an intended feature that the guest
>>> mappings KVM creates can be a superset of the host userspace mappings.  E.g. the
>>> guest can use larger page sizes, have RW while the host has RO, etc.
>> 
>> Do you mean that __kvm_mmu_max_mapping_level() should, in addition to
>> the parameter renaming from is_private to is_gmem, do something like
>> 
>> if (is_gmem)
>> 	return kvm_gmem_get_max_mapping_level(slot, gfn);
>
> I assume you mean, not looking at lpage_info at all?
>

My bad. I actually meant just to take input from guest_memfd and stop
there without checking with host page tables, perhaps something like
min(kvm_gmem_get_max_mapping_level(slot, gfn), max_level);

> I have limited understanding what lpage_info is or what it does. I 
> believe all it adds is a mechanism to *disable* large page mappings.
>

This is my understanding too.

> We want to disable large pages if (using 2M region as example)
>
> (a) Mixed memory attributes. If a PFN falls into a 2M region, and parts
>      of that region are shared vs. private (mixed memory attributes ->
>      KVM_LPAGE_MIXED_FLAG)
>
>   -> With gmem-shared we could have mixed memory attributes, not a PFN
>      fracturing. (PFNs don't depend on memory attributes)
>
> (b) page track: intercepting (mostly write) access to GFNs
>

Could you explain more about page track case? 

>
> So, I wonder if we still have to take care of lpage_info, at least for
> handling (b) correctly [I assume so]. Regarding (a) I am not sure: once 
> memory attributes are handled by gmem in the gmem-shared case. IIRC, 
> with AMD SEV we might still have to honor it? But gmem itself could 
> handle that.
>

For AMD SEV, I believe kvm_max_private_mapping_level() already takes
care of that, at least for the MMU faulting path [1], where guest_memfd
gives input using max_order, then arch-specific callback contributes input.

>
> What we could definitely do here for now is:
>
> if (is_gmem)
> 	/* gmem only supports 4k pages for now. */
> 	return PG_LEVEL_4K;
>
> And not worry about lpage_infor for the time being, until we actually do 
> support larger pages.
>
>

Perhaps this is better explained as an RFC in code. I'll put in a patch
as part of Fuad's series if Fuad doesn't mind.

>> 
>> and basically defer to gmem as long as gmem should be used for this gfn?
>> 
>> There is another call to __kvm_mmu_max_mapping_level() via
>> kvm_mmu_max_mapping_level() beginning from recover_huge_pages_range(),
>> and IIUC that doesn't go through guest_memfd.
>> 
>> Hence, unlike the call to __kvm_mmu_max_mapping_level() from the KVM x86
>> MMU fault path, guest_memfd didn't get a chance to provide its input in
>> the form of returning max_order from kvm_gmem_get_pfn().
>
> Right, we essentially say that "this is a private fault", likely 
> assuming that we already verified earlier that the memory is also private.
>
> [I can see that happening when the function is called through 
> direct_page_fault()]
>
> We could simply call kvm_mmu_max_mapping_level() from 
> kvm_mmu_hugepage_adjust() I guess. (could possibly be optimized later)
>
> -- 
> Cheers,
>
> David / dhildenb

[1] https://github.com/torvalds/linux/blob/01f95500a162fca88cefab9ed64ceded5afabc12/arch/x86/kvm/mmu/mmu.c#L4480

