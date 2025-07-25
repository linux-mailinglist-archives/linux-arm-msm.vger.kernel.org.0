Return-Path: <linux-arm-msm+bounces-66731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CBB124AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 21:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2B91CC20F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A592459FA;
	Fri, 25 Jul 2025 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DFNUPj2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B51205E2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753470994; cv=none; b=t7TpLKuSjXvSkUM309/alya9OMIcEb56K+VXTxElO68x32/kcd5cWPuM+GkYuDUa/VOqMGORyflrQUIKU+23QwE72060hu1vke+bl89okXaT3GwyOzsQf6Ct1BeQxKFer95UMuO9blrgebxl4ffAfVhTCul2H8ePbmhjWjChPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753470994; c=relaxed/simple;
	bh=t9FrhtQpYgn6vS+BcC1pt2nWbNWPMHh+SQZ1IZX19Zk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JdJKtfWvpH41N3PHml1dlCJ2wnnRXKyUOGtl92p80YPvEm3ItG5IqFLKLQtTYA1MI79wUlMn5/tZSMXe04zGHqfg+ZYfSmweZlMTfZCmCTQh4WbRFR34YzOuZTi7dj2htXzNFq1gxDVFbBM+zh3JiRAPnCfdceySza642Pmacw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DFNUPj2z; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74927be2ec0so3764473b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753470993; x=1754075793; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WlSKTdQJz4BcWRlFGcWGmeAyhSggOtqFKeQJDFCZ8k=;
        b=DFNUPj2zqyHQIoDLJDea4UyjOniDa1OLiMkE3mvtwatrDC+Ridj1VEsWtqvVatwPNW
         U4kR/EHXx4kdpBmh5j+REhClZQy7t9ogbH/KQvtOs2cuW2q/8gXDbS0lTF53bmtd5bw4
         lJ8OuQ6kR2PkK/ylzHOWq1BabauEaWyRl3KX2jnyLd5EpQjGu94Goy+AMwkeu5JKDil+
         DIYrpT5Tuaw7/XwXqVlc6GPsjo/zSZSCuNd0MInEVAcbPl6UbMinFYGQxAt8ykEXbjpG
         cbdjFJ8uK6iuhj99qcqxzBEoblMH3yWRgVkGAM0UZUB9jzkT5mNEAwCt31c4a91dxBzm
         WA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753470993; x=1754075793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WlSKTdQJz4BcWRlFGcWGmeAyhSggOtqFKeQJDFCZ8k=;
        b=dxOEB+bZnBLhNrspAU+byHmxJ3l8SufXMIhba6dDhK0SBo2j/+eUbnUHebdolMrCL4
         Bk8TKM93ayIt4uCvoKByhxpXAVeC11ic9NrHC0b+pHAH4QseEmvBD0Lx6nE0n2/hFcjJ
         9CBV1lIjRKa2n5qAIJPIa+D2NqtKIEo77mq/Xl3tLRKwd5Xl1IdnQgUWMgJZQknJNhCX
         2u7IJSg19CzSpr56uR053shxWXhtYj1eHuMTgh1s9JRMgz2kZegU2dY5Cd3k5Md9axKK
         0vFW7Kzwq9fJ+LtKeR9Yviz7rm5sweJbOKW6q5cLc628ST1cihnH9VSw5avswaCTWpjD
         Ow2A==
X-Forwarded-Encrypted: i=1; AJvYcCULwPCRNE9TrhG6lGMfYdQZEdZzNwSMt/Crf8ElI04D6JSBfzQTSScwLOrI/tQHRl/I1K1qNHCq6nPyXh7b@vger.kernel.org
X-Gm-Message-State: AOJu0YzvcO2RDb19GwXM3408m/yW7PgxnFE7sOH39qeMTrTe+5KVBkTA
	OWHGjq2UretYlIcmDsB8kCQwDJAVE4JOL0BS+JHMOE2PyheK9b7ygsAbrB68+fJyuEqkXbGLkFQ
	sCbm+m1D9fd85uG60Z1qDURxftg==
X-Google-Smtp-Source: AGHT+IG5yikix3DRNgEwYyvsz70LuAraxRVgFySsHgY92IzME9+2iJeI2z0Py1tuIkdALoYNsqefn1ymxFcNG6k/Uw==
X-Received: from pfbmd15.prod.google.com ([2002:a05:6a00:770f:b0:746:279c:7298])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:70c8:b0:21e:f2b5:30de with SMTP id adf61e73a8af0-23d700afbc9mr4649670637.12.1753470992563;
 Fri, 25 Jul 2025 12:16:32 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:16:31 -0700
In-Reply-To: <aIO90h_oJsvyxR45@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-15-tabba@google.com>
 <1ff6a90a-3e03-4104-9833-4b07bb84831f@intel.com> <aIK0ZcTJC96XNPvj@google.com>
 <diqzcy9pdvkk.fsf@ackerleytng-ctop.c.googlers.com> <diqz7bzxduyv.fsf@ackerleytng-ctop.c.googlers.com>
 <aIOVNcp7p2hU-YHM@google.com> <aIO90h_oJsvyxR45@google.com>
Message-ID: <diqzv7ngcc8g.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v16 14/22] KVM: x86/mmu: Enforce guest_memfd's max order
 when recovering hugepages
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jul 25, 2025, Sean Christopherson wrote:
>> On Thu, Jul 24, 2025, Ackerley Tng wrote:
>> I also don't want to effectively speculatively add kvm_gmem_mapping_order() or
>> expand kvm_gmem_get_pfn(), e.g. to say "no create", so what if we just do this?
>> 
>> 	/* For faults, use the gmem information that was resolved earlier. */
>> 	if (fault) {
>> 		pfn = fault->pfn;
>> 		max_level = fault->max_level;
>> 	} else {
>> 		/* TODO: Call into guest_memfd once hugepages are supported. */
>
> Aha!  Even better, we can full on WARN:
>
> 		WARN_ONCE(1, "Get pfn+order from guest_memfd");
>
> Because guest_memfd doesn't yet support dirty logging:
>
> 	/* Dirty logging private memory is not currently supported. */
> 	if (mem->flags & KVM_MEM_GUEST_MEMFD)
> 		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;
>
> which kills off the kvm_mmu_recover_huge_pages() call from kvm_mmu_slot_apply_flags().
> And if KVM ever supports in-place recover for kvm_recover_nx_huge_pages() (which
> is doubtful given that mitigation shouldn't be required going forward), lack of
> hugepage support means any guest_memfd-based shadow page can't be a possible NX
> hugepage.

Thanks, this sounds good!

