Return-Path: <linux-arm-msm+bounces-65937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421DEB0C925
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 18:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF5EA7A9441
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78882E091D;
	Mon, 21 Jul 2025 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tu8VirSv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228862DEA60
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117001; cv=none; b=ZTHeSgomkdUVEwF337FCCKSaNjuVtcFJZfM8ehKqe7jMA/FxvUhCTdceh8vP+JHqOoIK0c7RRqvP8oXJyDtaIXwZUourVEl8obGkVF0JoL/yDT2s38LhvwOEniNwmV85mf/dYoDh7H2WCyXwDIOZAtctZ6sOYZZWhRfnlOyOrqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117001; c=relaxed/simple;
	bh=GZWMVgrSUKEKBGuwg9R/osmV4nS3gmyVSRor5N4D7dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPFLLvu93MWFyv2hN+y+FZHGflwxceqrcfZt1GcjQdzhwJeovO3z4DcK63ShFFRqJv0erSQIC/NmGfSIMHnXDyFLlhJ/qeYaIC+YB62aqgcKSAgjYpAa0EQgjPyNAnjwMI2ZzR36RSqnK6DK4n4uCL7Y40Msl9DC+t1sqRUt4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tu8VirSv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso22111cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753116999; x=1753721799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vKM6AvsA9Y3YwBsR3x4mie39GKynDf2YD9Y+tfOPdI=;
        b=Tu8VirSvtzB6Ip9rBMgjyjH17zhtxpI1JDTIstqqQpHQVuEDrPyiiQHFUuT0CWX/OV
         ebaPvww6hhn6kR+863tV3J0DiAtUXkLW7h9+96dJpDUDH7tYFOYSdnQBT3gyTETPl+R7
         5kAn2rTYexjEom5jXSeAkl4SBBfpZP6D4xCsQ8505tt3lAOgrffQqGMIMa08q+geW3Aq
         4SOIjE22EYBjUQwQ19xmPFODMxqTf+KqhJer0k0wtBpM1KjyFKyBXolUFYKy5DgH4dyY
         cdq2Ppa9sDDF05QyERT9+KoJVUsSuYueGAu8q+RfpHvSl2AgGrIb59AFoe2Xd/Rf0xwO
         xU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753116999; x=1753721799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vKM6AvsA9Y3YwBsR3x4mie39GKynDf2YD9Y+tfOPdI=;
        b=XxXHqK+83p3XuCnsvHfH/Rc+DKcvUJ3yMza3HEz9L/ydr/8Z5qSgWbZ8Lz7FBJNA4t
         4HZCP2KWD1FK7QLXSiZ+inogHVo5tSsW0fBhwJ0mWSEKFmy9KiC1Gx9/Xpr4ZelhfZ2Y
         1brgN6NHRdf0ZUbwED+0o8Gr3NRt8PBxV6emd2wCQSr6DskIZU7O+eA5Z0Xjaf3h1XYF
         5DscfEDJZHACaLFk6J+U8xOVihg9ehyTBcG7uQfxORpRsw9IR2/swcaogoX4oMp6pNb9
         WM5JJYmRq8fuVfH16HLLE5s+G3rCMR8gUeLp49kXPF6ETfegXuXhbV9eODP1NrqvhbTa
         v6tg==
X-Forwarded-Encrypted: i=1; AJvYcCXSd8Qq2KzM/GtYx5dwKOX5Z/duveB2J3e478iMLX3sfEo64uM8wIiJubAg4MzxognSO5Gg9/AHnEKGPG1g@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwRnVai2ozLFVIHjGGqYRFJekeetFSrn+rV/r6U/PXNUAFA/P
	dP5WpG4YWt4rNB13af7FudxbVPeTttlwXeNa3ko9koR3CbuZGSn9LOaGXUNLsZdb6vR5gBH5iY1
	ICB0dJEivfhlZu4xq/zo9YRmHV4mq2mmsxnzkV5n2
X-Gm-Gg: ASbGnctvVCx8PMWhrqIwbjuwgG3q4OlLH42TU/n8lT7gjL+4+xCZR1LrVIwyXrzzpOP
	x0DduHexnAJ7CaTyvz5GTEvCxpczDhrmGYJf4QC6SCMpxDdrFoTFJEyIfWXXrfpOkSkIrGI1ujs
	DDjVQPt4wR1MmewwWsZ+YSjw/tdDhivGgkGnrMdjFVK9STxDtp69kbrYleWoVQl7seb4Jncdy5f
	BL8Zas=
X-Google-Smtp-Source: AGHT+IGgrjTvrPK9P3TS4lLZ8wE2lXlXTwd3sGct4UbwYyHLNBIv72yU2tsfIEw1OuaYcbv/aKSNeOsfq6NLKb3VZkI=
X-Received: by 2002:ac8:5756:0:b0:4a5:9b0f:a150 with SMTP id
 d75a77b69052e-4ae5b7bd536mr404521cf.16.1753116998305; Mon, 21 Jul 2025
 09:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-14-tabba@google.com>
 <aH5vNqPrUFgtZCqU@google.com>
In-Reply-To: <aH5vNqPrUFgtZCqU@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 21 Jul 2025 17:56:01 +0100
X-Gm-Features: Ac12FXwfcBSTsqXm-o6oPVt5T-88WCwPmRjt4OeCKsUE5_mbRL4h4uTl6xq_Qmc
Message-ID: <CA+EHjTwRSPhC5JQs3nMG_OWevNuDGTtz-ZJNWHt4qwTWLV7Ovw@mail.gmail.com>
Subject: Re: [PATCH v15 13/21] KVM: x86/mmu: Handle guest page faults for
 guest_memfd with shared memory
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Jul 2025 at 17:47, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Jul 17, 2025, Fuad Tabba wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > Update the KVM MMU fault handler to service guest page faults
> > for memory slots backed by guest_memfd with mmap support. For such
> > slots, the MMU must always fault in pages directly from guest_memfd,
> > bypassing the host's userspace_addr.
> >
> > This ensures that guest_memfd-backed memory is always handled through
> > the guest_memfd specific faulting path, regardless of whether it's for
> > private or non-private (shared) use cases.
> >
> > Additionally, rename kvm_mmu_faultin_pfn_private() to
> > kvm_mmu_faultin_pfn_gmem(), as this function is now used to fault in
> > pages from guest_memfd for both private and non-private memory,
> > accommodating the new use cases.
> >
> > Co-developed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Co-developed-by: Fuad Tabba <tabba@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 94be15cde6da..ad5f337b496c 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4511,8 +4511,8 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
> >                                r == RET_PF_RETRY, fault->map_writable);
> >  }
> >
> > -static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > -                                    struct kvm_page_fault *fault)
> > +static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
> > +                                 struct kvm_page_fault *fault)
> >  {
> >       int max_order, r;
> >
> > @@ -4536,13 +4536,18 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
> >       return RET_PF_CONTINUE;
> >  }
> >
> > +static bool fault_from_gmem(struct kvm_page_fault *fault)
>
> Drop the helper.  It has exactly one caller, and it makes the code *harder* to
> read, e.g. raises the question of what "from gmem" even means.  If a separate
> series follows and needs/justifies this helper, then it can/should be added then.

Ack.

Cheers,
/fuad

> > +{
> > +     return fault->is_private || kvm_memslot_is_gmem_only(fault->slot);
> > +}
> > +
> >  static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
> >                                struct kvm_page_fault *fault)
> >  {
> >       unsigned int foll = fault->write ? FOLL_WRITE : 0;
> >
> > -     if (fault->is_private)
> > -             return kvm_mmu_faultin_pfn_private(vcpu, fault);
> > +     if (fault_from_gmem(fault))
> > +             return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
> >
> >       foll |= FOLL_NOWAIT;
> >       fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >

