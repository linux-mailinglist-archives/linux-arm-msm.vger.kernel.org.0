Return-Path: <linux-arm-msm+bounces-66633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA3B1143B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 00:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42AC21C26E11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 22:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD423BF8F;
	Thu, 24 Jul 2025 22:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ePUFLyFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842123ABB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753397089; cv=none; b=WkTA/YjL/jvpv1To+XRJFLizUxbSmQx9NxGzENNdu3/E4hWRj1Hp691XjC1ecC9D1NYFXJq75UB1FGMyOC3W4RRo3sE15DRx1pyFG/HdUrGR2E0PLF1EM7n8abbIUFXcdtigQV1kLyWYEE6Gqh7YMXMghLPJ8/8OJgcQwWc94/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753397089; c=relaxed/simple;
	bh=6azhUsHsH58e3lEd1I2Fl0REPpv57pMkQWJrp2kPK/Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EfpgkmfwICXuQ3mBjmR3UEVvWS4Cr9qaF6oAh2ixlI8wc7CKdwM+/ZhL5PBKENSyjqM1JyhqF3HdEIDvsAXupP6Z6kH8INNJ2W2Ew13AzutfzYnMeHZezRA0qj9jkOlpw4n0XgiVz1Ts6/Jtlt+z+BWi9gVEDREfgVaowqxRK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ePUFLyFa; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso2413065a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753397087; x=1754001887; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrK1nEYl8f9oxCi1PiXZSrMC6WHPAwC1TRayidWzx6U=;
        b=ePUFLyFagJUmfpA3D7No30X3YkdrRJbOInOlGbTZrQCDNFb5FiW3Xd5ru2CqSl0q27
         zBG/NtPKoyv5RNdxgyN8kgi6R1P6w+vJybLq2tjus6PyULI5+tMYIFYukg7jxjRururt
         61TRZrR78nQUqI4uwybJ2mxY2dqg6zIhtjdBiZsoRRN5O7Rfk2DIjTXIk5yVwG10vTN/
         4WX2BMxn1D9wtQz9Tf/dBfAF5umhWA6izOib/sCs+/F4vf/W9wWRsHxjAoz9STiGT45f
         fH2KY8pBqSqxZfz2xkm+4sajF5WI+dvtNPrknr/goaZ3cHWBeEiSWB+G2otD+fe3MjnU
         Mk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753397087; x=1754001887;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrK1nEYl8f9oxCi1PiXZSrMC6WHPAwC1TRayidWzx6U=;
        b=Y9FSODk+tD/1hnE/WxvqD6uiHppu6tHpoL65GMNppNo3+j1k6qOuxEu9WAY4HNBk/j
         aN4I8SaTfMzBL7jtVdDQRJ5nceTaEc7+M/PWqfY9ghzPnNoegun2RgWs6iveWf7c0qDZ
         ekB0s5t1Zgk+wfPLYvQIiWwwxzKeX4qrkzMbcDA6ltCzABrR4zWGVrb8KItTG8ALQXE9
         a4ma1Qf9T+MyUocQ76PJBM19UNhFUyqyOzld2gYRJ3QDpyy9nnhpnjPmKKfryIrF+S+P
         8VqxETAa8EddY8GXqF7JwXw5gZKDoH1UK6Yb3cjL7CWhE3yohkPVAhLG7jewchE2aukP
         zBCw==
X-Forwarded-Encrypted: i=1; AJvYcCXEYrZrTFQb549sqPfDAa7wjs9YoFn8f0vIJf4sLt8Dc6OYTTslg4DQg7+qIZrHQu3cu3EWSyrsDHIRCx28@vger.kernel.org
X-Gm-Message-State: AOJu0YzAKInRxkicFWM6n0/i2LbDqTiqxZDMo+UFdR2C+MfjwsI0RoBi
	x2Wjgwbc/Ulk/rVHsgrRm3DkzAHlp2+3ADyQmOdSJcc+2Cfw1NxLGor+8lCb8NYvEUVHgCfA3HP
	Hb31tew==
X-Google-Smtp-Source: AGHT+IGkiU3HYlKz/oDr9suUmMNrF5QXoOj0MoEs/x9E0W6ja+0hEb122R/Wpx0j3kxF2BD1pc55AGtEMgQ=
X-Received: from pjz5.prod.google.com ([2002:a17:90b:56c5:b0:31c:4c97:bf9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3809:b0:31e:4e36:bfcf
 with SMTP id 98e67ed59e1d1-31e507e729bmr10178567a91.30.1753397087358; Thu, 24
 Jul 2025 15:44:47 -0700 (PDT)
Date: Thu, 24 Jul 2025 15:44:45 -0700
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
Message-ID: <aIK3XQ6rGEo4cQ4V@google.com>
Subject: Re: [PATCH v16 00/22] KVM: Enable host userspace mapping for
 guest_memfd-backed memory for non-CoCo VMs
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 23, 2025, Fuad Tabba wrote:
> Ackerley Tng (1):
>   KVM: x86/mmu: Rename .private_max_mapping_level() to
>     .gmem_max_mapping_level()
> 
> Fuad Tabba (15):
>   KVM: Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GUEST_MEMFD
>   KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
>     CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
>   KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
>   KVM: Fix comments that refer to slots_lock
>   KVM: Fix comment that refers to kvm uapi header path
>   KVM: x86: Enable KVM_GUEST_MEMFD for all 64-bit builds
>   KVM: guest_memfd: Add plumbing to host to map guest_memfd pages
>   KVM: guest_memfd: Track guest_memfd mmap support in memslot
>   KVM: arm64: Refactor user_mem_abort()
>   KVM: arm64: Handle guest_memfd-backed guest page faults
>   KVM: arm64: nv: Handle VNCR_EL2-triggered faults backed by guest_memfd
>   KVM: arm64: Enable support for guest_memfd backed memory
>   KVM: Allow and advertise support for host mmap() on guest_memfd files
>   KVM: selftests: Do not use hardcoded page sizes in guest_memfd test
>   KVM: selftests: guest_memfd mmap() test when mmap is supported
> 
> Sean Christopherson (6):
>   KVM: x86: Have all vendor neutral sub-configs depend on KVM_X86, not
>     just KVM
>   KVM: x86: Select KVM_GENERIC_PRIVATE_MEM directly from
>     KVM_SW_PROTECTED_VM
>   KVM: x86: Select TDX's KVM_GENERIC_xxx dependencies iff
>     CONFIG_KVM_INTEL_TDX=y
>   KVM: x86/mmu: Hoist guest_memfd max level/order helpers "up" in mmu.c
>   KVM: x86/mmu: Enforce guest_memfd's max order when recovering
>     hugepages
>   KVM: x86/mmu: Extend guest_memfd's max mapping level to shared
>     mappings

AFAICT, I've run out of things to complain about. :-D

I say wait one more day just in case the peanut gallery comes alive, then spin a
hopefully-final v17 early next week.  Or holler if you want me to tidy things up
and send v17, most of the goofs that necessitate v17 are mine :-)

