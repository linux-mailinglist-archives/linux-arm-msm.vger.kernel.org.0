Return-Path: <linux-arm-msm+bounces-44648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D541CA07DAE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0BB7188742D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9938222571;
	Thu,  9 Jan 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YFSXa7bN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0432721B192
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440522; cv=none; b=uTbB+ooVfg9YeM8dyb70bHBex+iTgYt2yiUlKcrTYx2hTdtsz7ACMMgHcDyY+bXIUgdAdS4mWDIDTwwGhWvp4GZexyeCuMzbcMrrd6eRol2opGr9leNRYepB2zRPykQBXt4m9gsaHjQKBj5gmOunyGk5BSmsGn6IcImxt8NrClc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440522; c=relaxed/simple;
	bh=CXQv/d/ryKD1V15TOdPA3c2hC2cQSek84MTW/PXYPlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr03uVFh/rN5mIGKQvdEEU6gafScX2QZAbQJvFX8w1fXA32N2vOb3LDTI4aTYS5wYFiYlfflbpwSFIRd4CN676BKG5i6RvDuf91BKjHjYWO+Wp5GQ5y36V0TyzjP7o850ODYtCHM8MjSn/+GqElt7CY8SPaiaGWn3XgNUg2g+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YFSXa7bN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso65305e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 08:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736440519; x=1737045319; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=baUKr168OOAaPISTC82PBM16R+vBD3PnUmTKM1n0mko=;
        b=YFSXa7bNloFvqpFYe+KqsAHHd9nHG5OaYb5RkhGXTObxeFiYwAkhhNl58weotRn3G3
         WOIN+n7BqwKMimciCra/oLvN4nLY7U8qajV71u1Q8mNTDHAHIt2Ee9/8XlvjgG8SqUaZ
         /D2HlfnPKAX3IyDCRGP10mxZXkGx9m5vFYiTyAxBhKp4ha4k4zfbuuNQQhTnREU5095A
         jJUQnqTxFe9vU5OtRhpC/keudpLOK1FeuG+D7LgtVMTyA5zXslby5yJCt19/kV0Yg0U1
         ptDagc+dHGu8jfO7/m+kEbEuEymgEj67zjd+9mFh3LL/+0ThA1yR42MpYYi2/qgfy5Ry
         yf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736440519; x=1737045319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baUKr168OOAaPISTC82PBM16R+vBD3PnUmTKM1n0mko=;
        b=jj8XSRCptj8q9qH5ndsrWHlyqbEhbUBaiN1zFYWZiLRX43Zv42T8NFI0K/8ffqn/cn
         O9Fzdz/6wjYCpFahhX8MTD3gao1IYn70T1LgQmqcRPNXnMDPI83qUATAvvdbB9Rk83rr
         ByidpPLhUQFXlVIW2QyBEM4xHv4wwV/HKboRQxFxg8MpHlkHe9q/S+E9JrLPmyr+IAOI
         ZMz07n4QaYKX5/ZKluWUgDmUKpCrufwG8tpZ3D4TNocecdXVX0pkJRnt/f0qnwpXWh46
         GMRZX5HHpwGhGEFuaGu8HaEnhRfNqDt5wLptdopTomVgoWJw+kRn1ZeNKnHgJ5sS5imX
         h2YA==
X-Forwarded-Encrypted: i=1; AJvYcCU4TDFWuxX9t+zxJCvyXf7lVKIJZ5Ur36NyLTR8v5yRktgcmBxVFOPPHxMttPxWNABEg8RXAKXCyYqb72mk@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSy3ZZQ74adLLV6U0bh1jkLkynFaVVxTn5UaRjvnBJQiH38JY
	cur6ScoqiqsNtfeApkHSio7BCyXznp4Tl3Mz66nkHrDq+r82lvfkd9TqzOCgALpkVJ1z0IGvE1O
	PHsLFJDdRt1dIMDIGH/tT9BJ06kVNCbbRL4xX
X-Gm-Gg: ASbGnculzfjoJI63Tq1GKDIv/IcsWsFuCE3Q0P2zeqi9AaMTYyMzryxmyzw8AAx4JbQ
	IxfkCuAJ4YhstcWKG2nyYLSE519eFLRAYf+pe
X-Google-Smtp-Source: AGHT+IFv0P2PeWbqF1YSBzg+TWGRgPHYK/TQ1vBRRVO50fQW5HLnFqB94TvYMz9y+LQS6PAgTWSV97KjtJt4QPa3b+U=
X-Received: by 2002:a05:600c:1c89:b0:436:51cf:285b with SMTP id
 5b1f17b1804b1-436e8e34745mr1290225e9.4.1736440519033; Thu, 09 Jan 2025
 08:35:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 9 Jan 2025 16:34:42 +0000
X-Gm-Features: AbW1kvYn98mIpWwaDWDfzqXeleucds2C1o-ePw1uKVi8SN1keW_ixb8bDBYEyig
Message-ID: <CA+EHjTzcx=eXSERSANMByhcgRRAbUL3kPAYkeu-uUgd0nPBPPA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/14] KVM: Restricted mapping of guest_memfd at
 the host and arm64 support
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi,

As mentioned in the guest_memfd sync (2025-01-09), below is the state
diagram that uses the new states in this patch series, and how they
would interact with sharing/unsharing in pKVM:

https://lpc.events/event/18/contributions/1758/attachments/1457/3699/Guestmemfd%20folio%20state%20page_type.pdf

This patch series doesn't necessarily impose all these transitions,
many of them would be a matter of policy. This just happens to be the
current way I've done it with pKVM/arm64.

Cheers,
/fuad

On Fri, 13 Dec 2024 at 16:48, Fuad Tabba <tabba@google.com> wrote:
>
> This series adds restricted mmap() support to guest_memfd, as
> well as support for guest_memfd on arm64. It is based on Linux
> 6.13-rc2.  Please refer to v3 for the context [1].
>
> Main changes since v3:
> - Added a new folio type for guestmem, used to register a
>   callback when a folio's reference count reaches 0 (Matthew
>   Wilcox, DavidH) [2]
> - Introduce new mappability states for folios, where a folio can
> be mappable by the host and the guest, only the guest, or by no
> one (transient state)
> - Rebased on Linux 6.13-rc2
> - Refactoring and tidying up
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20241010085930.1546800-1-tabba@google.com/
> [2] https://lore.kernel.org/all/20241108162040.159038-1-tabba@google.com/
>
> Ackerley Tng (2):
>   KVM: guest_memfd: Make guest mem use guest mem inodes instead of
>     anonymous inodes
>   KVM: guest_memfd: Track mappability within a struct kvm_gmem_private
>
> Fuad Tabba (12):
>   mm: Consolidate freeing of typed folios on final folio_put()
>   KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(), which retains
>     the folio lock
>   KVM: guest_memfd: Folio mappability states and functions that manage
>     their transition
>   KVM: guest_memfd: Handle final folio_put() of guestmem pages
>   KVM: guest_memfd: Allow host to mmap guest_memfd() pages when shared
>   KVM: guest_memfd: Add guest_memfd support to
>     kvm_(read|/write)_guest_page()
>   KVM: guest_memfd: Add KVM capability to check if guest_memfd is host
>     mappable
>   KVM: guest_memfd: Add a guest_memfd() flag to initialize it as
>     mappable
>   KVM: guest_memfd: selftests: guest_memfd mmap() test when mapping is
>     allowed
>   KVM: arm64: Skip VMA checks for slots without userspace address
>   KVM: arm64: Handle guest_memfd()-backed guest page faults
>   KVM: arm64: Enable guest_memfd private memory when pKVM is enabled
>
>  Documentation/virt/kvm/api.rst                |   4 +
>  arch/arm64/include/asm/kvm_host.h             |   3 +
>  arch/arm64/kvm/Kconfig                        |   1 +
>  arch/arm64/kvm/mmu.c                          | 119 +++-
>  include/linux/kvm_host.h                      |  75 +++
>  include/linux/page-flags.h                    |  22 +
>  include/uapi/linux/kvm.h                      |   2 +
>  include/uapi/linux/magic.h                    |   1 +
>  mm/debug.c                                    |   1 +
>  mm/swap.c                                     |  28 +-
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../testing/selftests/kvm/guest_memfd_test.c  |  64 +-
>  virt/kvm/Kconfig                              |   4 +
>  virt/kvm/guest_memfd.c                        | 579 +++++++++++++++++-
>  virt/kvm/kvm_main.c                           | 229 ++++++-
>  15 files changed, 1074 insertions(+), 59 deletions(-)
>
>
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

