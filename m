Return-Path: <linux-arm-msm+bounces-65421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53289B0886E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 266204A8AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1537E288C9B;
	Thu, 17 Jul 2025 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vpLa3o+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF258286D5E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752742237; cv=none; b=PD5a33WhwKPIj1hCpKpdP66gl4XPhYd+niFBDDfSkCkktjyr7uDXrkSyU4QlSFQ8Onc9cBc8uDp2MNATi7qYxv5ObQ18zbJnHJvtireiEPl5zjiZpX5scFZ5vRAxwQZKqvQL8hR2sC8iraSB4I/+ElQW3T67+HSEOxeH1CAQHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752742237; c=relaxed/simple;
	bh=fx1JuSGB5ku3XgYVMYRTc/eMvpZ5Y30SL8s3qhNbUrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZXht1TQLSgdJS2uRQ/Pez5zTRajVtwANPCdHNZIqZG26aOg25oggkkRhZi9ba/bSJyNJ0HvWQ8PoFEMyW1Qx/j34Og+PE3cL7FLpY5ux0pKni8qPFgOzIhfb09Km0pFJJn1fkg9BP8v30UPQL1Mf/JeBkpqxk03yiqnlgxjCLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vpLa3o+4; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso277511cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752742234; x=1753347034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fx1JuSGB5ku3XgYVMYRTc/eMvpZ5Y30SL8s3qhNbUrI=;
        b=vpLa3o+4lrK8Pq97imlhP8LBg8wwowk/eSFt2Vp5PcFpB0wNUPXaFvlHxn8aT/nggE
         u9pRXaGRrjfEOEtEa7te5dZA82bdZ0yuHs9AzQQU3DXu6a4tlrdCo4O6FexIxw+zU7tL
         vZGu18gPV/EvrVnZYP2BG1tQXnen2dI9brxnPK7Lq8yKjn9XrgpJrVGEJbWZnxRmgmDO
         87M/Dw7bpS6qRNCLS4nCzC3ro9LBiLbQMMPqNRnmH6aL9GUVLF7iH9KMMYDMJlfj1wzn
         /K1L0s4f0RujlA1C0TDSVjCP013mHORXXh3/bkE1jnffYToKUGzHU2cWy7l/s+28duWW
         nuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752742234; x=1753347034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fx1JuSGB5ku3XgYVMYRTc/eMvpZ5Y30SL8s3qhNbUrI=;
        b=D+Fo95ImcMHPax8CTDXNdoBYpsX2ni//WdkD1iy4+wG0JTcnlMJz5zr+7lmo3k135j
         BkLJYpebmrVyMz0c6j1b0TOiHm/7QcAse4QlZ7qmmpUxs5pOz9v9yESTT9rAjUdIE0Vl
         rAC9MnPOilBLLMVEBUr9wFcUbgBEFN41oP1s+BOdYB2oD0sZZEGjje7g/sWzEr/zFwPq
         laBN8J3HZ6oxC3YNqfNSGk8A9RigWFXmXpCZC/D04ZVthxeuayUzuPtehuXHvv/I06Iy
         +o5CMCWA3ssbXwBvrBWrF9X5ZhDPvtU6wXfqvUnphTIqme5uL5Q7mrcoA+nznK5Yn1rK
         ThPA==
X-Forwarded-Encrypted: i=1; AJvYcCXVi7sfEdNs3f0/g8GLKVuvkj+9RO9VfdVR13kUB7skW8GnkF2kzyP8hIC8u1YjFTpn/xJ3C52P6WhNvvg9@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpSvKnXC+UltLk2oLJstNGwHRvsJ0kS6L+niWMOJ25d8HbVRe
	pclLUr1txWgH0g7cFlMF2Ju6yOyBjfTz3YTQnrKz+eLI4Ef7R/V7zdxuS+a+woYxFqJcl6cQGLD
	OXC2vU72eU5jYDVFSgWGZb2OvFKYyw+TnsSPwB3an
X-Gm-Gg: ASbGncvABUh88z1mBSW9aC5S4x7Im3s6EFbZLj6TJjrcUBgRK1hMV31kMGk+QWT+FqZ
	td5BIwfxLfRqFPzxP2mmC6BpNNx8n2GyM360xOVipn5G1QbAFqgNSWvjPQChPidD/tcar68ZZR9
	uv5ZqHozJ8tnEfx5pTdFZrS/PIs1aLmCPj1PKckJEVKi5ZJnuSidHCiYfhbn9zv2DIAVhD0CXo1
	dg+m6E=
X-Google-Smtp-Source: AGHT+IFJBjuZkaiMWobXRfRh9pmhDTYS+xIxMCNkviUrQydZTRd7jIJNkT2lW8gpa/i0jfk07s7YUC00WwCYYsXC4qM=
X-Received: by 2002:a05:622a:1f85:b0:4a9:d3e7:56bf with SMTP id
 d75a77b69052e-4aba4adbb61mr2533831cf.27.1752742233129; Thu, 17 Jul 2025
 01:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com> <20250715093350.2584932-5-tabba@google.com>
 <b5fe8f54-64df-4cfa-b86f-eed1cbddca7a@intel.com> <diqzwm87fzfc.fsf@ackerleytng-ctop.c.googlers.com>
 <fef1d856-8c13-4d97-ba8b-f443edb9beac@intel.com>
In-Reply-To: <fef1d856-8c13-4d97-ba8b-f443edb9beac@intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Jul 2025 09:49:56 +0100
X-Gm-Features: Ac12FXxkRhY2UmJu3hO9xLioH89YY6t8CrSg4iy4xmUp0dV0rsQQHNL4_tw_xsk
Message-ID: <CA+EHjTzZH2NN31ZfTg0NX_o3dryqbkmR4s8Y47eFJ1TcO1kiDA@mail.gmail.com>
Subject: Re: [PATCH v14 04/21] KVM: x86: Introduce kvm->arch.supports_gmem
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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
Content-Type: text/plain; charset="UTF-8"

Hi Xiaoyao,

On Thu, 17 Jul 2025 at 02:48, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>
> On 7/17/2025 8:12 AM, Ackerley Tng wrote:
> > Xiaoyao Li <xiaoyao.li@intel.com> writes:
> >
> >> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
> >>> Introduce a new boolean member, supports_gmem, to kvm->arch.
> >>>
> >>> Previously, the has_private_mem boolean within kvm->arch was implicitly
> >>> used to indicate whether guest_memfd was supported for a KVM instance.
> >>> However, with the broader support for guest_memfd, it's not exclusively
> >>> for private or confidential memory. Therefore, it's necessary to
> >>> distinguish between a VM's general guest_memfd capabilities and its
> >>> support for private memory.
> >>>
> >>> This new supports_gmem member will now explicitly indicate guest_memfd
> >>> support for a given VM, allowing has_private_mem to represent only
> >>> support for private memory.
> >>>
> >>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> >>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >>> Reviewed-by: Shivank Garg <shivankg@amd.com>
> >>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >>> Co-developed-by: David Hildenbrand <david@redhat.com>
> >>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>
> >> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> >>
> >> Btw, it seems that supports_gmem can be enabled for all the types of VM?
> >>
> >
> > For now, not really, because supports_gmem allows mmap support, and mmap
> > support enables KVM_MEMSLOT_GMEM_ONLY, and KVM_MEMSLOT_GMEM_ONLY will
> > mean that shared faults also get faulted from guest_memfd.
>
> No, mmap support is checked by kvm_arch_supports_gmem_mmap() which is
> independent to whether gmem is supported.

It is dependent on gmem support:

kvm_arch_supports_gmem_mmap(kvm) depends on
CONFIG_KVM_GMEM_SUPPORTS_MMAP, which in turn selects KVM_GMEM.


> > A TDX VM that wants to use guest_memfd for private memory and some other
> > backing memory for shared memory (let's call this use case "legacy CoCo
> > VMs") will not work if supports_gmem is just enabled for all types of
> > VMs, because then shared faults will also go to kvm_gmem_get_pfn().
>
> This is not what this patch does. Please go back read this patch.
>
> This patch sets kvm->arch.supports_gmem to true for
> KVM_X86_SNP_VM/tdx/KVM_X86_SW_PROTECTED_VM.
>
> Further in patch 14, it sets kvm->arch.supports_gmem for KVM_X86_DEFAULT_VM.
>
> After this series, supports_gmem remains false only for KVM_X86_SEV_VM
> and KVM_X86_SEV_ES_VM. And I don't see why cannot enable supports_gmem
> for them.

It's not that we can't, it's just that we had no reason to enable it.
When the time comes, it's just a matter of setting a boolean.

Thanks,
/fuad

> > This will be cleaned up when guest_memfd supports conversion
> > (guest_memfd stage 2). There, a TDX VM will have .supports_gmem = true.
> >
> > With guest_memfd stage-2 there will also be a
> > KVM_CAP_DISABLE_LEGACY_PRIVATE_TRACKING.
> > KVM_CAP_DISABLE_LEGACY_PRIVATE_TRACKING defaults to false, so for legacy
> > CoCo VMs, shared faults will go to the other non-guest_memfd memory
> > source that is configured in userspace_addr as before.
> >
> > With guest_memfd stage-2, KVM_MEMSLOT_GMEM_ONLY will direct all EPT
> > faults to kvm_gmem_get_pfn(), but KVM_MEMSLOT_GMEM_ONLY will only be
> > allowed if KVM_CAP_DISABLE_LEGACY_PRIVATE_TRACKING is true. TDX VMs
> > wishing to use guest_memfd as the only source of memory for the guest
> > should set KVM_CAP_DISABLE_LEGACY_PRIVATE_TRACKING to true before
> > creating the guest_memfd.
> >
> >> Even without mmap support, allow all the types of VM to create
> >> guest_memfd seems not something wrong. It's just that the guest_memfd
> >> allocated might not be used, e.g., for KVM_X86_DEFAULT_VM.
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > p
>

