Return-Path: <linux-arm-msm+bounces-66730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65453B122F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 19:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E4D1CE0363
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 17:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8F72EF9CB;
	Fri, 25 Jul 2025 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2CQmeVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C72EF9BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753464278; cv=none; b=JhW6Y5GOe5JNzpHq+OcgWbQ6eYj2baXouQak3HGHZZam69On3IOOPuOy70+0VncidO2jtmmxi9JnS+HLoGq82i59vcYRrXYpsdfQDBLgklTfunTSLAyC+ta38DcSOQqkgTp+n8iQ2dfQgO8ILNC2kekHttkEtVtiDpavlmDTW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753464278; c=relaxed/simple;
	bh=J0guUM/h767F9xI8bVmCra3qNjsxNCxFgAUQKA7tg4s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iY7LqGYBALg2fNsg+I26oHfs1G3uHB7lN0+Tc5JESvgwskY8PoQGA72Arq6LzWlmiiW5JyEqJkAcZrmP6ieqIAbdqFYJx++o3dlmQkWV1qDHQpR+hwVtkhqR4f8h2IKAFZUd4T2YVI5PKfMFRig3R3oIJEZVHzUwZpfeophvTmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2CQmeVu; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so2508651a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753464276; x=1754069076; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouGvu65qiGg+JqadVNKAxhqDIWS7jmV1hkTAAApCoHU=;
        b=l2CQmeVuYFLesYDkb4R/CUMmPPGtWtirKtUULsYmVrB6iWPYNhYh2VY8B8grRjBiby
         QELcrN+kIywgoPAq4491RVteHk39FPxKCUH1XFwMhAoETF6341x0W/6+aUU0VNBm/OV+
         Y/Sxf2v5cFZOsdWkBddnIdct3j/8q2iGNXd99qjdYwBw3uVAiMdBkBJI1if7QK/BOTMO
         eoqVEOZ9UzryXUzX3k5D2vc74DfTinOHNnFA+TFnKZSoR9XGhTjN0oXq1aJ4wqrvJDSX
         66PoUouXT51l3ywSyEdCdTF+ZjpBJUhwm/CbfAny8xXRRmcnCUZrRnVfF+cD5R59gAkJ
         T4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753464276; x=1754069076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouGvu65qiGg+JqadVNKAxhqDIWS7jmV1hkTAAApCoHU=;
        b=IskttVcOoodQWQGRufeuNj3nQ+k0bb9EDPvPrLUhv8ab9GcDyJm2+Mz6UXh5dZhi6M
         WU7lfuJtQT53UdfyAi8a7/G072I2dXStGWizwOSBufW4Ge6uqDZnEAdSTFKaKinQhplG
         JtkKNTg/xZyn0vbtVTNxVQGryHL4peS0Vru8fZhlOLvhee1Z0J5MwuZ6Tf7cy/9e53rm
         r93sU8aq70rRqUwogbnor9kRAkW6UyYBY05I3GeorJRMtYC0H2TONshlcesihviElYsc
         ciD6FsS9iMT6urnpRyzaPI/7ehIQ8Ko4rTCM7pr4NEgrM4LxTsEgwJ6sjFlABGRaKQTq
         7cdA==
X-Forwarded-Encrypted: i=1; AJvYcCVB9Vt9Dri8wYGbU4zkKB4rm8qapKD/04QaFu20wIgADI+MfuY+VTueg3l2VHBlfkgKiMK0jh/6IBmQglMF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6+ziYKuaMeY70c7vqW0dBbjQyRnyVXiMMtsx7dOG5HnIOdad3
	xpdFWJge+BvdlinZajU+QHw9ZxB1TSNZWD29GG9TCBVIO2cRE79EvRJ78yASNus56JN272TRBbH
	RiBnslg==
X-Google-Smtp-Source: AGHT+IHbAz/eKQpxYLnv3UzRDiNfzFQyWZ03GI8G+wp5sD4kBBYyUq+g8Y0WEpcjXQKRT5uv4bipYXGp6JQ=
X-Received: from pjbsf1.prod.google.com ([2002:a17:90b:51c1:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:514e:b0:312:25dd:1c86
 with SMTP id 98e67ed59e1d1-31e778f7879mr4767541a91.18.1753464276017; Fri, 25
 Jul 2025 10:24:36 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:24:34 -0700
In-Reply-To: <aIOVNcp7p2hU-YHM@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-15-tabba@google.com>
 <1ff6a90a-3e03-4104-9833-4b07bb84831f@intel.com> <aIK0ZcTJC96XNPvj@google.com>
 <diqzcy9pdvkk.fsf@ackerleytng-ctop.c.googlers.com> <diqz7bzxduyv.fsf@ackerleytng-ctop.c.googlers.com>
 <aIOVNcp7p2hU-YHM@google.com>
Message-ID: <aIO90h_oJsvyxR45@google.com>
Subject: Re: [PATCH v16 14/22] KVM: x86/mmu: Enforce guest_memfd's max order
 when recovering hugepages
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
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

On Fri, Jul 25, 2025, Sean Christopherson wrote:
> On Thu, Jul 24, 2025, Ackerley Tng wrote:
> I also don't want to effectively speculatively add kvm_gmem_mapping_order() or
> expand kvm_gmem_get_pfn(), e.g. to say "no create", so what if we just do this?
> 
> 	/* For faults, use the gmem information that was resolved earlier. */
> 	if (fault) {
> 		pfn = fault->pfn;
> 		max_level = fault->max_level;
> 	} else {
> 		/* TODO: Call into guest_memfd once hugepages are supported. */

Aha!  Even better, we can full on WARN:

		WARN_ONCE(1, "Get pfn+order from guest_memfd");

Because guest_memfd doesn't yet support dirty logging:

	/* Dirty logging private memory is not currently supported. */
	if (mem->flags & KVM_MEM_GUEST_MEMFD)
		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;

which kills off the kvm_mmu_recover_huge_pages() call from kvm_mmu_slot_apply_flags().
And if KVM ever supports in-place recover for kvm_recover_nx_huge_pages() (which
is doubtful given that mitigation shouldn't be required going forward), lack of
hugepage support means any guest_memfd-based shadow page can't be a possible NX
hugepage.

