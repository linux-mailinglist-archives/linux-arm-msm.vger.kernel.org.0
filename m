Return-Path: <linux-arm-msm+bounces-60322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A97ACF328
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D1D1894B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811001A5B8A;
	Thu,  5 Jun 2025 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NY1py0e7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E357D2FB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137886; cv=none; b=gPnWO1Klm3aRCSU9k3zTvNb3+ShqAWxDVMncG6ALALkrPS9gPEJxEebihK1D/jqRCV3uYgB4nO2BvmIW7An+JsjStEaghQLFix2J/GgB9iS/Ai39I0LgLgVP09j3e5zd902KAXUpY4YJvsUbGlOqT1f9BET4xbh+feNV2CsYYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137886; c=relaxed/simple;
	bh=XXdU7d2aoGriCttRQYf9cf4PaMrm4W3ZIpw2jeRJskM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oQ3SCMv5vLMGtGE+Pr/iWn1FPoJ5j00cFZWm7PEOpUdr3jzHo0C7We/M5aMebvCULn63ok/NWluRMHYYNWGf/b6tWRugkgqXs8kNdg0mlTa6gQWw6k+nPDfxN0xCjE6f6v2jOaKrWs1aptSrBbFZGtKznKBRO7qZN+1BJo1XE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NY1py0e7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450df53d461so8791615e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137883; x=1749742683; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uzZwmaIb5Q3S6rwd1Y5eQskBWdwscTYR6n2srAsi1As=;
        b=NY1py0e7p2eZ/n+Mek+uYlKeUeyEDvubq3oHFBp+j7iR3Wc6jBrzPSXjcmyv8bTQ+h
         rdsLRjhbA/iQd4JJMVMBNIaVHkzbDGaWymLFkX61scPH8jU6L/jBKaiYFkE1xO+A/SZt
         +45me6dLBrfbKHWiz8zbi3sRvOyfHEC8hJOs8qPRloqFOItc0MqZhHVOC4fqYSr0Y85H
         Glkr3tCq9ZFsIH+r8Wv2kW5OBfHq5IIQJQ9gt2olmD4cnDgK2hVzEJsNEXBXEX4GKNr3
         0aJLY/FEITzEJqFy6lyLPMutZePLL8FVPiARv8kJkBOSRWfdmAPFrmvtYJ8ze1VexVhl
         i2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137883; x=1749742683;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzZwmaIb5Q3S6rwd1Y5eQskBWdwscTYR6n2srAsi1As=;
        b=emNlrGJlbXTTb2wln1IpXFyzgu/H/sn5sVGdxZ3uF4aarm/BBqyCkS7vw8pX1Jo5Yq
         DVFs0DuNzu31kpmTXqttNqD++jESR2/gEnJOZRm/uNDffchnB2+E+PJPY7+jDhS1e8Js
         kaKtnNjklF5AVN4yjzw8pdau5D0LxGpv8U1AczbhM8ty1IvRWXNCnVvo65IeBKvTCBoa
         m1LJxiw+/kZknemlnWm67lKydcvK35WUMekbDPzVeFlxfdKzTtZzJJ6Xacj6jRpOOmjK
         Fo9qlk2fgw5jS3E4cjfqISrw7DnO2qID1Hdaf4XlBLfkbgZm8rxP4QGhFGH+DerjjuKl
         BFGA==
X-Forwarded-Encrypted: i=1; AJvYcCVynvSegcCm7nDckt7iEsUQnHt65YkjCzDbjwxxtEGwMljvZfR+nGvSPvyhajMSqCGqyoOPtjfbVXcBCxv1@vger.kernel.org
X-Gm-Message-State: AOJu0YxQg8PpkijDmwiiszjajTMtAh2XncLPoyQNYu5g3CuWYA+4wMBr
	L0L43t3JyXU2xkNTJDNe6hEqtyCsbaoIF921Nxe5EPLFaaZyhBXxxMa8rhSIsb1QtLsxguhYkyH
	7Vw==
X-Google-Smtp-Source: AGHT+IFlDy6s6kQCZomObt0nTeQZmuxDFTFV7AArwjZO0+GiEINiw46lQ2nFqVLQxSki9vjaGD00Noog+g==
X-Received: from wmsr8.prod.google.com ([2002:a05:600c:8b08:b0:43d:56fa:9b95])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45cf:b0:442:cd03:3e2
 with SMTP id 5b1f17b1804b1-451f0a650f0mr75236925e9.2.1749137882808; Thu, 05
 Jun 2025 08:38:02 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-1-tabba@google.com>
Subject: [PATCH v11 00/18] KVM: Mapping guest_memfd backed memory at the host
 for software protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
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
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Main changes since v10 [1]:
- Added bounds checking when faulting a shared page into the host, along
  with a selftest to verify the check.
- Refactored KVM/arm64's handling of guest faults (user_mem_abort()).
  I've dropped the Reviewed-by tags from "KVM: arm64: Refactor
  user_mem_abort()..." since it has changed significantly.
- Handled nested virtualization in KVM/arm64 when faulting guest_memfd
  backed pages into the guest.
- Addressed various points of feedback from the last revision.
- Still based on Linux 6.15

This patch series enables the mapping of guest_memfd backed memory in
the host. This is useful for VMMs like Firecracker that aim to run
guests entirely backed by guest_memfd [2]. When combined with Patrick's
series for direct map removal [3], this provides additional hardening
against Spectre-like transient execution attacks.

This series also lays the groundwork for restricted mmap() support for
guest_memfd backed memory in the host for Confidential Computing
platforms that permit in-place sharing of guest memory with the host
[4].

Patch breakdown:

Patches 1-7: Primarily refactoring and renaming to decouple the concept
of guest memory being "private" from it being backed by guest_memfd.

Patches 8-9: Add support for in-place shared memory and the ability for
the host to map it. This is gated by a new configuration option, toggled
by a new flag, and advertised to userspace by a new capability
(introduced in patch 16).

Patches 10-15: Implement the x86 and arm64 support for this feature.

Patch 16: Introduces the new capability to advertise this support and
updates the documentation.

Patches 17-18: Add and fix selftests for the new functionality.

For details on how to test this patch series, and on how to boot a guest
that uses the new features, please refer to v8 [5].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250527180245.1413463-1-tabba@google.com/
[2] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[3] https://lore.kernel.org/all/20250221160728.1584559-1-roypat@amazon.co.uk/
[4] https://lore.kernel.org/all/20250328153133.3504118-1-tabba@google.com/
[5] https://lore.kernel.org/all/20250430165655.605595-1-tabba@google.com/

Ackerley Tng (2):
  KVM: x86/mmu: Handle guest page faults for guest_memfd with shared
    memory
  KVM: x86: Consult guest_memfd when computing max_mapping_level

Fuad Tabba (16):
  KVM: Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GMEM
  KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
    CONFIG_KVM_GENERIC_GMEM_POPULATE
  KVM: Rename kvm_arch_has_private_mem() to kvm_arch_supports_gmem()
  KVM: x86: Rename kvm->arch.has_private_mem to kvm->arch.supports_gmem
  KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
  KVM: Fix comments that refer to slots_lock
  KVM: Fix comment that refers to kvm uapi header path
  KVM: guest_memfd: Allow host to map guest_memfd pages
  KVM: guest_memfd: Track shared memory support in memslot
  KVM: x86: Enable guest_memfd shared memory for SW-protected VMs
  KVM: arm64: Refactor user_mem_abort()
  KVM: arm64: Handle guest_memfd-backed guest page faults
  KVM: arm64: Enable host mapping of shared guest_memfd memory
  KVM: Introduce the KVM capability KVM_CAP_GMEM_SHARED_MEM
  KVM: selftests: Don't use hardcoded page sizes in guest_memfd test
  KVM: selftests: guest_memfd mmap() test when mapping is allowed

 Documentation/virt/kvm/api.rst                |   9 +
 arch/arm64/include/asm/kvm_host.h             |   5 +
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          | 200 +++++++++++++----
 arch/x86/include/asm/kvm_host.h               |  22 +-
 arch/x86/kvm/Kconfig                          |   5 +-
 arch/x86/kvm/mmu/mmu.c                        | 135 ++++++-----
 arch/x86/kvm/svm/sev.c                        |   4 +-
 arch/x86/kvm/svm/svm.c                        |   4 +-
 arch/x86/kvm/x86.c                            |   4 +-
 include/linux/kvm_host.h                      |  80 +++++--
 include/uapi/linux/kvm.h                      |   2 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 212 +++++++++++++++---
 virt/kvm/Kconfig                              |  14 +-
 virt/kvm/Makefile.kvm                         |   2 +-
 virt/kvm/guest_memfd.c                        |  94 +++++++-
 virt/kvm/kvm_main.c                           |  16 +-
 virt/kvm/kvm_mm.h                             |   4 +-
 19 files changed, 645 insertions(+), 169 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.49.0.1266.g31b7d2e469-goog


