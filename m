Return-Path: <linux-arm-msm+bounces-64552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D24B01A52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B302F541F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC95B288C3E;
	Fri, 11 Jul 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wE3+qMbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2E288C0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752232175; cv=none; b=dRok8tdbCdzDxRMJkjH9qNzRVXhXk27OlwV49KmskoT2dwVZt/chbGUCU98fzck51SEl3ZUKtc0qfLlGgVH/2KsEXB/r5tX2oUR5mK165mO8IS6ZvMO6klnoazaAHiFAWOPPZLZ02FMYs7JzwVPJ1GG6B9UtV09Q55X1pW9u8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752232175; c=relaxed/simple;
	bh=pEbsbZRW72uqAMiY+GWSPB3tnRE4dYbX0ZSg/zik3CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbX61n8GWBx6/7Y4/QPPPP2waiNobztV5lOFQgRHnVbslWEaVXR65lwyJqWCzx9JtR8m13BbLABXKlj+Zzu2SOzqAuWyio98aOK3lltgB1ABbIwUifnCAwUNqT8IHfqiaubkSr4SWH2lErf3LhcfMHZ2N9MX48Mr6bNhVD+PSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wE3+qMbi; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4aaf43cbbdcso98461cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752232173; x=1752836973; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YtL2RY30FqQCse8pZRhypsMK1Ug1daCGyP2jBjuiKck=;
        b=wE3+qMbizN8X/mDoh8cIWnDGvuwBTzvFFjajouOToSxs04BNz4lzpIAdxKSXH9/8bh
         EWY7E7ZwUZXZqIHEsraQm/pJ5lqKAVK+sYa6CzWyaSV2mXrIHN3xWa8UXOkx3FK2Desu
         e+pH/HCuOL1rEIv5oohwjVa9mK3IMzI1Wj7XqxoTQRf9rtMMeTZKWU2gxuHHiqJfG+ay
         xDwMT6qEgxNWtUA71f8h99vPmkB4M3OTwO7gKNBAb9SBDdmWCteeLRQ9bh4arOyFYqKT
         Vi2rhOgIMkQvol8vclnGpMifuI0XmB8piw4/hImFQxNL9FMbM+UACgRlqB1J5tyxRUfF
         fomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752232173; x=1752836973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtL2RY30FqQCse8pZRhypsMK1Ug1daCGyP2jBjuiKck=;
        b=neQygAdBGk12UNk6mnPOGJIIPmcu0uSeU5sMsL+l79pm4Pm0P08i0ZT4drh+axMfIc
         PQAIMW2bjrg0Xob4iTxylmkbEKcxSz3t8PvR/D1k5XssW6vNp50A+SqrzOmFX6dh7G2u
         kFR/EkdYnty7MyikxtqK8hZIiktzqI5RuD2TH2zgVy/yjf3u6aZhLoEZvSXvDhatsNU+
         gi/5v/atoeOl5z5dhYvr3jOpGyVVnFCGDq7kSSZ/h7eeMxKfkI8SL/saIkGI84dzLzu4
         HovGq6diOOZq1b/rFwZ9JPeylwIeBN0gB63XFLgiYQlZ6wiQEzAHfl/ec3s/pYS0goyj
         rhfw==
X-Forwarded-Encrypted: i=1; AJvYcCVSyHkGlkMMKs4qrmH7//ejKIvmp3B3HZFilYZs54A+6J5iGGX0u+Ah/bZwBXIq56sBbgURN/RVF5N9fQAr@vger.kernel.org
X-Gm-Message-State: AOJu0YwMxjuFxQ1D1oRFV3fK6er1sFOV/m77atADPEGFXNr/VJQvAOF1
	tyJRgRy69xNh5TOefQaL+eW0qjpGZIJtqga3+iLLtWKObxJ6fYWYth1vVZ0Qwh7uip47gnkhu/a
	cdHZ5ztf6Qug4gjfkjTfqET0E1/Tj7XQKLQaN7Y3Z
X-Gm-Gg: ASbGncs04gCyPs/6nWQNU1yoF8ej740enlFTS+XqTonkw6ltGGWfJTHZz6dAQfvfkAu
	BDlgb2ExbllE/c2wHuzBvWRCvoQCoudPqHVqb8kAaXY9d5Il57mz1NZKQRGrH13ATwKukNy5BmK
	qfiUuSGhTpn0clr9/5SXy6RQYnDkvBAZrjWE1QH4G4rSQDK4X7/a2T5ogd217dt7psFYtyKkMGK
	KBrts9o3Exy8WMaHg==
X-Google-Smtp-Source: AGHT+IERmXIWH70IswPePcnTHu8w/geAIcWqwjz0lTJocB7rOcnLO6OtVHZyap867obl3kpAHCdb6bS3TpHBmI7izYE=
X-Received: by 2002:ac8:7d4e:0:b0:4a5:9af6:8f84 with SMTP id
 d75a77b69052e-4a9fbe8344fmr3522001cf.14.1752232172426; Fri, 11 Jul 2025
 04:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709105946.4009897-17-tabba@google.com> <20250711095937.22365-1-roypat@amazon.co.uk>
In-Reply-To: <20250711095937.22365-1-roypat@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 11 Jul 2025 12:08:55 +0100
X-Gm-Features: Ac12FXy7m-zlvbmjUHarQqtRk7cRzn7RmdIcZj367UfAD88hqnMBvOGnU1eJgFc
Message-ID: <CA+EHjTz8nC-_904=N==B=SJ0sb8AV047LbnA8x6gqZr3cRONPQ@mail.gmail.com>
Subject: Re: [PATCH v13 16/20] KVM: arm64: Handle guest_memfd-backed guest
 page faults
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "ackerleytng@google.com" <ackerleytng@google.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "amoorthy@google.com" <amoorthy@google.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"brauner@kernel.org" <brauner@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	"dmatlack@google.com" <dmatlack@google.com>, "fvdl@google.com" <fvdl@google.com>, 
	"hch@infradead.org" <hch@infradead.org>, "hughd@google.com" <hughd@google.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "james.morse@arm.com" <james.morse@arm.com>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "jthoughton@google.com" <jthoughton@google.com>, 
	"keirf@google.com" <keirf@google.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "maz@kernel.org" <maz@kernel.org>, 
	"mic@digikod.net" <mic@digikod.net>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"peterx@redhat.com" <peterx@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"quic_cvanscha@quicinc.com" <quic_cvanscha@quicinc.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, 
	"quic_mnalajal@quicinc.com" <quic_mnalajal@quicinc.com>, 
	"quic_pderrin@quicinc.com" <quic_pderrin@quicinc.com>, 
	"quic_pheragu@quicinc.com" <quic_pheragu@quicinc.com>, 
	"quic_svaddagi@quicinc.com" <quic_svaddagi@quicinc.com>, 
	"quic_tsoni@quicinc.com" <quic_tsoni@quicinc.com>, "rientjes@google.com" <rientjes@google.com>, 
	"seanjc@google.com" <seanjc@google.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "wei.w.wang@intel.com" <wei.w.wang@intel.com>, 
	"will@kernel.org" <will@kernel.org>, "willy@infradead.org" <willy@infradead.org>, 
	"xiaoyao.li@intel.com" <xiaoyao.li@intel.com>, "yilun.xu@intel.com" <yilun.xu@intel.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,


On Fri, 11 Jul 2025 at 10:59, Roy, Patrick <roypat@amazon.co.uk> wrote:
>
>
> Hi Fuad,
>
> On Wed, 2025-07-09 at 11:59 +0100, Fuad Tabba wrote:> -snip-
> > +#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
> > +
> > +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > +                     struct kvm_s2_trans *nested,
> > +                     struct kvm_memory_slot *memslot, bool is_perm)
> > +{
> > +       bool write_fault, exec_fault, writable;
> > +       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
> > +       enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> > +       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> > +       struct page *page;
> > +       struct kvm *kvm = vcpu->kvm;
> > +       void *memcache;
> > +       kvm_pfn_t pfn;
> > +       gfn_t gfn;
> > +       int ret;
> > +
> > +       ret = prepare_mmu_memcache(vcpu, true, &memcache);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (nested)
> > +               gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
> > +       else
> > +               gfn = fault_ipa >> PAGE_SHIFT;
> > +
> > +       write_fault = kvm_is_write_fault(vcpu);
> > +       exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> > +
> > +       if (write_fault && exec_fault) {
> > +               kvm_err("Simultaneous write and execution fault\n");
> > +               return -EFAULT;
> > +       }
> > +
> > +       if (is_perm && !write_fault && !exec_fault) {
> > +               kvm_err("Unexpected L2 read permission error\n");
> > +               return -EFAULT;
> > +       }
> > +
> > +       ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> > +       if (ret) {
> > +               kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> > +                                             write_fault, exec_fault, false);
> > +               return ret;
> > +       }
> > +
> > +       writable = !(memslot->flags & KVM_MEM_READONLY);
> > +
> > +       if (nested)
> > +               adjust_nested_fault_perms(nested, &prot, &writable);
> > +
> > +       if (writable)
> > +               prot |= KVM_PGTABLE_PROT_W;
> > +
> > +       if (exec_fault ||
> > +           (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
> > +            (!nested || kvm_s2_trans_executable(nested))))
> > +               prot |= KVM_PGTABLE_PROT_X;
> > +
> > +       kvm_fault_lock(kvm);
>
> Doesn't this race with gmem invalidations (e.g. fallocate(PUNCH_HOLE))?
> E.g. if between kvm_gmem_get_pfn() above and this kvm_fault_lock() a
> gmem invalidation occurs, don't we end up with stage-2 page tables
> refering to a stale host page? In user_mem_abort() there's the "grab
> mmu_invalidate_seq before dropping mmap_lock and check it hasnt changed
> after grabbing mmu_lock" which prevents this, but I don't really see an
> equivalent here.

You're right. I'll add a check for this.

Thanks for pointing this out,
/fuad

> > +       ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
> > +                                                __pfn_to_phys(pfn), prot,
> > +                                                memcache, flags);
> > +       kvm_release_faultin_page(kvm, page, !!ret, writable);
> > +       kvm_fault_unlock(kvm);
> > +
> > +       if (writable && !ret)
> > +               mark_page_dirty_in_slot(kvm, memslot, gfn);
> > +
> > +       return ret != -EAGAIN ? ret : 0;
> > +}
> > +
> > -snip-
>
> Best,
> Patrick
>
>

