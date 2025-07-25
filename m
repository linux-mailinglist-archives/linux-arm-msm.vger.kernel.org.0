Return-Path: <linux-arm-msm+bounces-66741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F31B12667
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 00:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AADE81C8099C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 22:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922821DE892;
	Fri, 25 Jul 2025 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TB2GmU0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5242561D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 22:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753480879; cv=none; b=Ygq8trV6b8/a8YGcPwkZh4qh/0YoyuU75NAwVydjoU79Cd6K8ZD7GROvvLNkhBImHyk3u/mLB8DKK4CO+zLMRjyTuFXbkMaX7mtnLkwuuwHhW3nCsb8R+8lJl34B0VvFT/7UE/1Pk3YbQPHl7eYITD3qxobD4Qls6G7uJfcCTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753480879; c=relaxed/simple;
	bh=ZVkE0eW5WS3kJhFfMGAaiYj5nZ5KOR05VaGSZwLtIr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H+XST5ppT9/kdm4TyeN2BRwzWE0/s8TDabnd+q273EmkkNXpz62qaWdUOOLdHYdCRAkmf5e8VKjUQUp+xqx4BIcVZzuIo8Lfy/Xnby0We39dYxaZh6iBSdoUPjQeAB1k2kSvNionG6wuhCql+wBE8gUwAkIVRGsFQftdURdwlu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TB2GmU0+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso2993709a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 15:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753480875; x=1754085675; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+zp+aFgZ7sosVHgE1JVBc/YF4k2nO+/CVzJ2Y2OlSXk=;
        b=TB2GmU0+VbRnbJ/bYc6EfPpMZYz0DGPlUbCVvE5RUp33GGsaVT7jyPVv4g16mLW4jc
         /atZ07Dsj2pM2AichrjhCpTk+Bpqgc6fmDDCqFt/YD79Pi92+pgs/7QNskPJCadTuSfK
         xwfafifBoazz1vSfqR+IabDPfgPzjXh+wZg2IawhgSIqxajwrWmeJWGzAsQ/qod5GXKE
         RjinwDS+xzqmpjAsDTORRem1Y04Nny7WZAI4lSDcKBBMS/Ge5rpY6r4A6sDsXgYkF9MY
         HooRYZoeH7PNLmfBwoSIgVf8ctnt+6FYPg5L5fZTByKkam1V+oH3uvgusuC7N3DV4o+6
         jjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753480875; x=1754085675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zp+aFgZ7sosVHgE1JVBc/YF4k2nO+/CVzJ2Y2OlSXk=;
        b=FR/nEMr/1pMi7ZiW3U5w6pJKDEpzgwz/fqfPkNP7UsyMn7NbnN4luL3DcViDD0ss+1
         6WSh1J75VBiQ2sU5NKWfMkRLz9hI3nQ5ViS5PBs6aAYvE2YP7QAH81G1VVluwtQiYxdK
         qpVIgPyofv6JWTyqA+ABbPGpH4cDZLLu0vI0YRH7UGNjfLHVmGEdkFPe4tkNPtfHqBHO
         xlt9MQqXQL9JDWSQ7DFaq/Gcyc9QqgWX5SmurFiGyRMvzaE2RSsMDY9FMwRjnptY6ox4
         aH3yhMBL4BlxEJ2AQv08G6gvgMOtS0GtUnco6cqsHAtfILbAFwk0x0KrrcypemIZvWjE
         mICw==
X-Forwarded-Encrypted: i=1; AJvYcCW7BmJocDdGJr8DqWuUuIq9XVtI4gRivVxKGhP8yMFiqpIrLp5vEMxliOlwJyYUWSl+1+iEt3seeiZ7kN/f@vger.kernel.org
X-Gm-Message-State: AOJu0YwGx91bxzgez0Itlw/6B/xaX1x5+GldbXx2tsU7uAi0kqpn4E1R
	PRP9+kmrV18M99cqpEKp59782VVQIEyWFqZHwCimL2mHl8rfLOmakryjX7LjKT7UxBR3JNyPmFD
	47gPaVA==
X-Google-Smtp-Source: AGHT+IFPjkF2xrZ/Gp6FwQl6jvIg14serRXFzYz5L/ExU8zpV9XgePnP6vcF1X9qmhlTmOaX+wV3Tt+ZntY=
X-Received: from pjvf3.prod.google.com ([2002:a17:90a:da83:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7c7:b0:31c:15d9:8aa
 with SMTP id 98e67ed59e1d1-31e77a45647mr3874947a91.34.1753480875031; Fri, 25
 Jul 2025 15:01:15 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:01:13 -0700
In-Reply-To: <diqzpldoc5yq.fsf@ackerleytng-ctop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-16-tabba@google.com>
 <diqza54tdv3p.fsf@ackerleytng-ctop.c.googlers.com> <aIOMPpTWKWoM_O5J@google.com>
 <diqzy0sccjfz.fsf@ackerleytng-ctop.c.googlers.com> <aIO7PRBzpFqk8D13@google.com>
 <diqzseikcbef.fsf@ackerleytng-ctop.c.googlers.com> <aIPgjOLq8erW06gK@google.com>
 <diqzpldoc5yq.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <aIP-qSnH1jjuykmP@google.com>
Subject: Re: [PATCH v16 15/22] KVM: x86/mmu: Extend guest_memfd's max mapping
 level to shared mappings
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 25, 2025, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Fri, Jul 25, 2025, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> > Invoking host_pfn_mapping_level() isn't just undesirable, it's flat out wrong, as
> >> > KVM will not verify slot->userspace_addr actually points at the (same) guest_memfd
> >> > instance.
> >> >
> >> 
> >> This is true too, that invoking host_pfn_mapping_level() could return
> >> totally wrong information if slot->userspace_addr points somewhere else
> >> completely.
> >> 
> >> What if slot->userspace_addr is set up to match the fd+offset in the
> >> same guest_memfd, and kvm_gmem_max_mapping_level() returns 2M but it's
> >> actually mapped into the host at 4K?
> >> 
> >> A little out of my depth here, but would mappings being recovered to the
> >> 2M level be a problem?
> >
> > No, because again, by design, the host userspace mapping has _zero_ influence on
> > the guest mapping.
> 
> Not trying to solve any problem but mostly trying to understand mapping
> levels better.
> 
> Before guest_memfd, why does kvm_mmu_max_mapping_level() need to do
> host_pfn_mapping_level()?
> 
> Was it about THP folios?

And HugeTLB, and Device DAX, and probably at least one other type of backing at
this point.

Without guest_memfd, guest mappings are a strict subset of the host userspace
mappings for the associated address space (i.e. process) (ignoring that the guest
and host mappings are separate page tables).

When mapping memory into the guest, KVM manages a Secondary MMU (in mmu_notifier
parlance), where the Primary MMU is managed by mm/, and is for all intents and
purposes synonymous with the address space of the userspace VMM.

To get a pfn to insert into the Secondary MMU's PTEs (SPTE, which was originally
"shadow PTEs", but has been retrofitted to "secondary PTEs" so that it's not an
outright lie when using stage-2 page tables), the pfn *must* be faulted into and
mapped in the Primary MMU.  I.e. under no circumstance can a SPTE point at memory
that isn't mapped into the Primary MMU.

Side note, except for VM_EXEC, protections for Secondary MMU mappings must also
be a strict subset of the Primary MMU's mappings.  E.g. KVM can't create a
WRITABLE SPTE if the userspace VMA is read-only.  EXEC protections are exempt,
so that guest memory doesn't have to be mapped executable in the VMM, which would
basically make the VMM a CVE factory :-)

All of that holds true for hugepages as well, because that rule is just a special
case of the general rule that all memory must be first mapped into the Primary
MMU.  Rather than query the backing store's allowed page size, KVM x86 simply
looks at the Primary MMU's userspace page tables.  Originally, KVM _did_ query
the VMA directly for HugeTLB, but when things like DAX came along, we realized
that poking into backing stores directly was going to be a maintenance nightmare.

So instead, KVM was reworked to peek at the userspace page tables for everything,
and knock wood, that approach has Just Worked for all backing stores.

Which actually highlights the brilliance of having KVM be a Secondary MMU that's
fully subordinate to the Primary MMU.  Modulo some terrible logic with respect to
VM_PFNMAP and "struct page" that has now been fixed, literally anything that can
be mapped into the VMM can be mapped into a KVM guest, without KVM needing to
know *anything* about the underlying memory.

Jumping back to guest_memfd, the main principle of guest_memfd is that it allows
_KVM_ to be the Primary MMU (mm/ is now becoming another "primary" MMU, but I
would call KVM 1a and mm/ 1b).  Instead of the VMM's address space and page
tables being the source of truth, guest_memfd is the source of truth.  And that's
why I'm so adamant that host_pfn_mapping_level() is completely out of scope for
guest_memfd; that API _only_ makes sense when KVM is operating as a Seconary MMU.

