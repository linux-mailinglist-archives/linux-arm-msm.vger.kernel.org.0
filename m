Return-Path: <linux-arm-msm+bounces-58902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA06ABF5CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECCAF1BC3AC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7C025A2B3;
	Wed, 21 May 2025 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tI/pj7x4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823C23C51E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833379; cv=none; b=fk2qxSGOiD4u9JL7bdXWoqZXeVhqfAOAu3RnXPQPFOq1DVER0rXUlocC9VYqWxC5eLAVHWYj53XvruACND5vOHp6ULvzXkiejWc9v8XQSU8+kj2AvVxXx0KVTvTrty6UtRjtsA4xfAomDASuTstQt3HlmIt/cNvkOLSSQn5V98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833379; c=relaxed/simple;
	bh=dCuZzYyzWXXNyRdo5fKQmYinQoiNViuzddj0LCm3WQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg0g+eRuKTxmIjA2J5IgHXTXhCDjf+n8TI1ij1g2Z6X1kmo39EEg1t5g6QJQgFKuFxXriDMZQ71vhlmlPkjZKdFPjL7YCK8KL/1R5BU3OlwXtue06oyzga2GMYsWe9EW89o756AV6eC4OZm8LVoqvH93JhXwBPG3msQDaARd0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tI/pj7x4; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4774611d40bso1132061cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747833375; x=1748438175; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VuCBq1LHvUmn2odvLxgs6fG8yadlcthuxdGwDQ52u/Q=;
        b=tI/pj7x4PrGEXvOpYLt863Ow0BjpzBZ1mQA8LewWXqOYkzOJMbPeJpL5DUu/X2vOSJ
         QIqF2J1usv4JPgpx9JZgWU6j1XgV9/+fNMO9syZtOmMIFvzjmYOnWICTY23NXOrxChTG
         RfXa3OiI8D663TPLWW9hVAFxUyfdcKbbSmUPskwKQrAvArhwnVW86HwhBMiM/rKCvSPd
         9jq7OibGM/RxfCpcZApslHiQlstmGdg7hD9pJAB6GYkjOtVW2Mqj7LWyqnRSs49YbTtY
         8MZu/W/0rSGvnlbzAhMNz3tjtHXfrTM7U3jwMLLrrqlU80JnYD8KLfM7rsh/PpoqtKo/
         deHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833375; x=1748438175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuCBq1LHvUmn2odvLxgs6fG8yadlcthuxdGwDQ52u/Q=;
        b=s8lYjGZ8BOtyL9XRgXtaJQliWnW2DCs/H+ZHsLM6+hiSl5JRFyCxUYgeTTAepweeWU
         Y+h2Sdh4Py72gDhBBm8asHAPQATbuO8+lrjTxB/Q141EkYMvFQFv/ZKGC1eC9VHH552r
         lFCMaOWKU1oHZ+LsUHUMj5rOegd6LHzLCdEHo4//7wesmgpGgSRs/1yOs9rJ/rCFA79n
         tngRCnu7r+y0iliMOPxC95ZStGtvEvYkPNOximh+0YVg+75R0mSJgFroMOGg/yVzEJLS
         XhfsDGfQL8ZWQdVRTbIZK3g4qiYdX2qQQo86ruta0Udo/f9yREHxpthfQ0Stw3oE/dIO
         Soow==
X-Forwarded-Encrypted: i=1; AJvYcCXrmFN3MH4FE/NhZPER5MS2T7UTb+hMlZo/YwT6wq+E3yzROq6eFk7+GbheNdnQUXfvTUujw/3EOL1JDRzU@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZ9ChAYlfo/0zJrwpjbZl3tnxHoE633UH+2Uhz0DvtPq/Z6PO
	SktZ3iLqgfOvUTd+DRA8xREkb3O/14O+TmtroNUsV0dhbGnv95O+Ij9EbX2xfKIgky3YGETW09f
	afqsfc4WTZLODOIZ0t1a0ud+NZZZ3BR9Q+1bnjmPX
X-Gm-Gg: ASbGncvo/lh+fqUWkW4L3uNVU5xHJcfoUkvjvrLhKAfLjA8AzGsElQZFqJ/3PZKTtuW
	glxS+Y1ai8CZdsF2uMrSAzu0/kXdqwhNDMPIdt+e4KiKrY9cegxLBmmtT7xf8lAcPY8ogtdQuFc
	yobVmGWXkekGqz03kFThxS/HD2pYb2NoLPu/qtkkkpKoBIxdu8iDA+j07a5y+RBA+HMrbHjBzM
X-Google-Smtp-Source: AGHT+IEsY2DOtm1j/Iq7ToPRPKFUK44RMpFOS6HXHhjjXESPM2QyWtg5spoCOXC+/wyZDrMNwUIEeO5eVeLwGbiQRsA=
X-Received: by 2002:a05:622a:50d:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-49600b8a607mr14222661cf.11.1747833375019; Wed, 21 May 2025
 06:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-15-tabba@google.com>
 <2084504e-2a11-404a-bbe8-930384106f53@redhat.com> <CA+EHjTyz4M4wGCTBzFwHLB_0LUJHq6J135f=DVOhGKQE4thrtQ@mail.gmail.com>
 <d5983511-6de3-42cb-9c2f-4a0377ea5e2d@redhat.com> <CA+EHjTxhirJDCR4hdTt4-FJ+vo9986PE-CGwikN8zN_1H1q5jQ@mail.gmail.com>
 <f6005b96-d408-450c-ad80-6241e35c6d26@redhat.com>
In-Reply-To: <f6005b96-d408-450c-ad80-6241e35c6d26@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 14:15:38 +0100
X-Gm-Features: AX0GCFsmElpyNGMgXEQvTVnqujAJSPexfnVcxsSJstUdYpKnZ4NFaqnN9_U6nGg
Message-ID: <CA+EHjTzaE_vGPsB20eJ99fG4_gck9Gb7iaVQ3ie5YUnNe5wHgw@mail.gmail.com>
Subject: Re: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
To: David Hildenbrand <david@redhat.com>
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
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 21 May 2025 at 13:44, David Hildenbrand <david@redhat.com> wrote:
>
> On 21.05.25 12:29, Fuad Tabba wrote:
> > On Wed, 21 May 2025 at 11:26, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 21.05.25 12:12, Fuad Tabba wrote:
> >>> Hi David,
> >>>
> >>> On Wed, 21 May 2025 at 09:05, David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>> On 13.05.25 18:34, Fuad Tabba wrote:
> >>>>> Enable mapping guest_memfd in arm64. For now, it applies to all
> >>>>> VMs in arm64 that use guest_memfd. In the future, new VM types
> >>>>> can restrict this via kvm_arch_gmem_supports_shared_mem().
> >>>>>
> >>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>>>> ---
> >>>>>     arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
> >>>>>     arch/arm64/kvm/Kconfig            |  1 +
> >>>>>     2 files changed, 11 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> >>>>> index 08ba91e6fb03..2514779f5131 100644
> >>>>> --- a/arch/arm64/include/asm/kvm_host.h
> >>>>> +++ b/arch/arm64/include/asm/kvm_host.h
> >>>>> @@ -1593,4 +1593,14 @@ static inline bool kvm_arch_has_irq_bypass(void)
> >>>>>         return true;
> >>>>>     }
> >>>>>
> >>>>> +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
> >>>>> +{
> >>>>> +     return IS_ENABLED(CONFIG_KVM_GMEM);
> >>>>> +}
> >>>>> +
> >>>>> +static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
> >>>>> +{
> >>>>> +     return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
> >>>>> +}
> >>>>> +
> >>>>>     #endif /* __ARM64_KVM_HOST_H__ */
> >>>>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> >>>>> index 096e45acadb2..8c1e1964b46a 100644
> >>>>> --- a/arch/arm64/kvm/Kconfig
> >>>>> +++ b/arch/arm64/kvm/Kconfig
> >>>>> @@ -38,6 +38,7 @@ menuconfig KVM
> >>>>>         select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >>>>>         select SCHED_INFO
> >>>>>         select GUEST_PERF_EVENTS if PERF_EVENTS
> >>>>> +     select KVM_GMEM_SHARED_MEM
> >>>>>         help
> >>>>>           Support hosting virtualized guest machines.
> >>>>>
> >>>>
> >>>> Do we have to reject somewhere if we are given a guest_memfd that was
> >>>> *not* created using the SHARED flag? Or will existing checks already
> >>>> reject that?
> >>>
> >>> We don't reject, but I don't think we need to. A user can create a
> >>> guest_memfd that's private in arm64, it would just be useless.
> >>
> >> But the arm64 fault routine would not be able to handle that properly, no?
> >
> > Actually it would. The function user_mem_abort() doesn't care whether
> > it's private or shared. It would fault it into the guest correctly
> > regardless.
>
>
> I think what I meant is that: if it's !shared (private only), shared
> accesses (IOW all access without CoCo) should be taken from the user
> space mapping.
>
> But user_mem_abort() would blindly go to kvm_gmem_get_pfn() because
> "is_gmem = kvm_slot_has_gmem(memslot) = true".

Yes, since it is a gmem-backed slot.

> In other words, arm64 would have to *ignore* guest_memfd that does not
> support shared?
>
> That's why I was wondering whether we should just immediately refuse
> such guest_memfds.

My thinking is that if a user deliberately creates a
guest_memfd-backed slot without designating it as being sharable, then
either they would find out when they try to map that memory to the
host userspace (mapping it would fail), or it could be that they
deliberately want to set up a VM with memslots that not mappable at
all by the host. Perhaps to add some layer of security (although a
very flimsy one, since it's not a confidential guest).

I'm happy to a check to prevent this. The question is, how to do it
exactly (I assume it would be in kvm_gmem_create())? Would it be
arch-specific, i.e., prevent arm64 from creating non-shared
guest_memfd backed memslots? Or do it by VM type? Even if we do it by
VM-type it would need to be arch-specific, since we allow private
guest_memfd slots for the default VM in x86, but we wouldn't for
arm64.

We could add another function, along the lines of
kvm_arch_supports_gmem_only_shared_mem(), but considering that it
actually works, and (arguably) would behave as intended, I'm not sure
if it's worth the complexity.

What do you think?

Cheers,
/fuad

>
> --
> Cheers,
>
> David / dhildenb
>

