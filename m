Return-Path: <linux-arm-msm+bounces-60970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A74AD5721
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7A833A1939
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F9828935F;
	Wed, 11 Jun 2025 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGaC3ukC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABC28A1F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648815; cv=none; b=g1pDbM0E9dtkCBY8t92vgPrufF3eSA2XD62JK4WGYe87Lchc8kjhwx9/vkyj/nHspFSHhWb1QlHqucVcGgfkH4qtiMOI2h2aOTwq1u5PdpZ+3HL9B/VVXJ1Jd/eokKHNAbujKefFEqvWjJJXFtCdhebOSpoZVbAUqrNLdnjPCv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648815; c=relaxed/simple;
	bh=r+XqC7uGn13lAp3H+wBcGZnLyvGZSd2YBfaeiZv4mds=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ew2vx0qoaGT7B5LhRW4auadY6QzvMONRIpCYWa5uCY9swZmByL1LygxjxmHhg6iE2McS+R8wxCpKKc/Zkf3plWnnp9zUP7tGndZw8ledua9Rm+J5CzT4BfBOw7pSncmCdf4gZCiLAhSRFGWbnY4v3tCWGGrQgo6xp7UvU7KKjgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGaC3ukC; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso4083357f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648812; x=1750253612; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rSsJgXVmQFLNXrSUPRm9zqOBDde8bKjGO9WdZWsvbm0=;
        b=uGaC3ukC/B4e24d7XRJuLl5QdWk8iH+7cr0PulXnGtPFz9xR8mb9Rsth4x0EEP15vj
         haLs6UaS/vI9nsZdI5lfJ6EsRz4WItvP5wWNP6qbRjBWAScPrrW7LTXZd6w7Kv0z7z9w
         St/gZ+p4u/rn5aOWJi4KKm6UVU90YfxcBgeGZKgqejsUt/DWW3/6PWeHFWqze2uem0vu
         UeNFoK083jTcL9b6+xhcem52038/in3QJpXiELfXlMl4IL6MhckpI0LPevbuKSkoiGZ/
         ht9d8nxNKjgZyccruDqZPmVjWpkLY+V5GQjLhX+Ht4mdrR7z90drkmfkiigpSXI/pnby
         aqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648812; x=1750253612;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSsJgXVmQFLNXrSUPRm9zqOBDde8bKjGO9WdZWsvbm0=;
        b=v48lpb1RhYUgYp3nWqitZXgvu0TzJ+80iSqeSYsLfAWJw70JpClRlhPZzcrKeHBvNB
         g6HBzkr9vdWGexgx5bR2LiCTayfxc+bAYeXD14Q9qnVDaK3dkGkEza0cAuXI1sJvr2Do
         oVrn1otj75JKKR+clyClDeXwShzhd9B7aoohy0xigUisutAbN9/a11jQuWpQ9aDZC8qj
         clvqCkb3tVIL+VB1NngfeicgU6agP6r4EX9pbJ+JwHAVouwJZoC+mNZh7SowS5jSs8Ft
         gkOsfR7Zqp6JBI8VtMasN7A0I2numNFtdFqRnUhjmK6v5ezHpMpRLwFjptS5jZb9/bcP
         s8aw==
X-Forwarded-Encrypted: i=1; AJvYcCX/6iintyLMJnPfV3E5vdzMLzIznufTds3UqR+Ij4bfQLFI8meX6hNa59DBNV4IKmjJo3ed+cYHFpFEWsQk@vger.kernel.org
X-Gm-Message-State: AOJu0YynbqXhWmm4dUCI825nW9CpE1dj2JXE0XSR1nfQrmAdBjzyLtL7
	0SH2kNi7pc4iyUOf7L+bs6k51vPIfjRo+Ua2orGFzzh1DFJ07Z6IqDGjEDt/KbJRdHtBNBqX4+Y
	QmQ==
X-Google-Smtp-Source: AGHT+IGEi4Njnn/PJTVKY9QV/QZh9cv9Pk+XkVMH4dPXzSBVTZZ2YPR7bte2KhD8R7o+Ouq1GEzt+pIysg==
X-Received: from wrs3.prod.google.com ([2002:a05:6000:643:b0:3a5:271e:ad7d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:24c8:b0:3a4:d83a:eb4c
 with SMTP id ffacd0b85a97d-3a558a43cb0mr2865406f8f.57.1749648812045; Wed, 11
 Jun 2025 06:33:32 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-1-tabba@google.com>
Subject: [PATCH v12 00/18] KVM: Mapping guest_memfd backed memory at the host
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

Main changes since v11 [1]:
- Addressed various points of feedback from the last revision.
- Rebased on Linux 6.16-rc1.

This patch series enables mapping of guest_memfd backed memory in the
host. This is useful for VMMs like Firecracker that aim to run guests
entirely backed by guest_memfd [2]. When combined with Patrick's series
for direct map removal [3], this provides additional hardening against
Spectre-like transient execution attacks.

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
that uses the new features, please refer to the instructions in v8 [5],
but use the updated kvmtool for 6.16 (KVM_CAP_GMEM_SHARED_MEM number has
changed) [6].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250605153800.557144-1-tabba@google.com/
[2] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[3] https://lore.kernel.org/all/20250221160728.1584559-1-roypat@amazon.co.uk/
[4] https://lore.kernel.org/all/20250328153133.3504118-1-tabba@google.com/
[5] https://lore.kernel.org/all/20250430165655.605595-1-tabba@google.com/
[6] https://android-kvm.googlesource.com/kvmtool/+/refs/heads/tabba/guestmem-basic-6.16

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
  KVM: x86: Enable guest_memfd shared memory for non-CoCo VMs
  KVM: arm64: Refactor user_mem_abort()
  KVM: arm64: Handle guest_memfd-backed guest page faults
  KVM: arm64: Enable host mapping of shared guest_memfd memory
  KVM: Introduce the KVM capability KVM_CAP_GMEM_SHARED_MEM
  KVM: selftests: Don't use hardcoded page sizes in guest_memfd test
  KVM: selftests: guest_memfd mmap() test when mapping is allowed

 Documentation/virt/kvm/api.rst                |   9 +
 arch/arm64/include/asm/kvm_host.h             |   4 +
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          | 189 ++++++++++++----
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
 virt/kvm/guest_memfd.c                        |  91 +++++++-
 virt/kvm/kvm_main.c                           |  16 +-
 virt/kvm/kvm_mm.h                             |   4 +-
 19 files changed, 630 insertions(+), 169 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.50.0.rc0.642.g800a2b2222-goog


