Return-Path: <linux-arm-msm+bounces-64202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A55AFE6DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FF93B4166D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B82B294A04;
	Wed,  9 Jul 2025 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IqSblKL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E2293C57
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058828; cv=none; b=sJ8STkh9MMm8vlWXg5fjgt04a3FwivfeOFB3zMnb4dgoDEjMuNLHRJEbtAFJpbaTodweHpzS4Hj6EZuta2Jow0FTT9uUOkpt9cZCNs73z+L9ttillLfineac5hvl4YNLcZhzkl1x+xPa8bEpDiUsWgPSnppS7tpuhzPR+qRmz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058828; c=relaxed/simple;
	bh=i1677ulQ+FpX23BeUODESVUylvYUsyZh0fRA+XWc+Qc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KnFnQA0hhf7TegR+FS6cs1yMHCd4qVTqLcXYLW4sHDkLcMk+RO1SIEaBY+RYYqGyWEe62xzWc1zA7P5nVUqqYi8+FZM6dlxafTteSMsatkKgS7TPjfM3IOVIz1pxO1xs9idRhesyRkkXIkrm5CI8n3hDvfJi0gKx3Qdu98L8UD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IqSblKL0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450d64026baso27286935e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058825; x=1752663625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8CqTX/re2H78xoOHzX7zO0o4O1lOtYkxCnG9hu+yv8=;
        b=IqSblKL0x9FFskjPdgxw6RgKK+mKuetkHu2mKKdy0r3JBxaVAoyCrkk9lyLScSd1cM
         ojYmStCkSIkAeSvk6UC5rd1vLlGYbbOXfBpzDl2UpuIFpN5QFKimO+NkHbfkZS9XcoOC
         wF0qKttKSR2SPOeJ0b1I0jpU5aTxoqbJLlJCVlEA0dzlXxSEDN/9ZSdGfvn60UzFOH7R
         7ePAsIhpvFSCBfdf/Q/a0hSVKqDKIlmUzWbcMKTkJik7w1DNs0blnaBFFrYKRnYMm/g0
         RCp45KIAiiv9j8KYjf0PDlkOWRU53hoN04DR8JvH6d0H2eVAaO5Yj8ozVviJRB2rDoFS
         CuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058825; x=1752663625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8CqTX/re2H78xoOHzX7zO0o4O1lOtYkxCnG9hu+yv8=;
        b=hEkfgtNIq6epVORYummmTJIQcUVaPNUgwy16kGRNIt4LFD0JvHhtYgpWldd8WfjgXG
         U68pt7FTUAT+1bMzUNzgGKBIWsWlAet3G4HvU2HpzFfI4dzU4X3S+7AQaW6pdsbAMt30
         oGv/kuQIA4G6VPYvKktPAXR4hYr4qlKSqoaJ5Uoei+h+WVmBZq1j2vQi/AvzBckwKP9V
         pf7wM8w6WSUnYTeb2IrLRM+sQ+AOxIp0tx5U3sfvbkAqIfijpw7cWZ+SyG5nqRSbPd5u
         ih51AeLd56/1J4CXMCYqR66+Jpa/FzcmpJpnpWsqzvBjvYQLE+bqrw/niq7eYPIwC7tW
         Kzjw==
X-Forwarded-Encrypted: i=1; AJvYcCUhoSgu+qxReFp8OSYP+3mHCYp2tWT3MPb3wPU82/sVA9JGF3nWvnJgEbySdfKDDGQNfk2daVPm2sHpCz+0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyte0QHltRHG4nr1FkrTL7tjQ2iObdv/A4s3QXJ6qKgmNFoAL7s
	nyVwN2BVyDDXWcxNasUL0/3l8YrTzTyOztzT0LSBQwjbjfEzWel4aaS+Aicl+lU68UnU2g+bRZy
	WHw==
X-Google-Smtp-Source: AGHT+IEHnvYYUOmRrnCbtHPzW+od4gurhsCdgI0yOzILiG8n/NWLWOC3y08BZEdPiw1VxjNfEp1TbYfLTQ==
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:442:ea0c:c453])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46cc:b0:451:dee4:cd08
 with SMTP id 5b1f17b1804b1-454d53d5ec2mr16682175e9.23.1752058824847; Wed, 09
 Jul 2025 04:00:24 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:43 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-18-tabba@google.com>
Subject: [PATCH v13 17/20] KVM: arm64: Enable host mapping of shared
 guest_memfd memory
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

Enable host userspace mmap support for guest_memfd-backed memory on
arm64. This change provides arm64 with the capability to map guest
memory at the host directly from guest_memfd:

* Define kvm_arch_supports_gmem_mmap() for arm64: The
  kvm_arch_supports_gmem_mmap() macro is defined for arm64 to be true if
  CONFIG_KVM_GMEM_SUPPORTS_MMAP is enabled. For existing arm64 KVM VM
  types that support guest_memfd, this enables them to use guest_memfd
  with host userspace mappings. This provides a consistent behavior as
  there are currently no arm64 CoCo VMs that rely on guest_memfd solely
  for private, non-mappable memory. Future arm64 VM types can override
  or restrict this behavior via the kvm_arch_supports_gmem_mmap() hook
  if needed.

* Select CONFIG_KVM_GMEM_SUPPORTS_MMAP in arm64 Kconfig.

* Enforce KVM_MEMSLOT_GMEM_ONLY for guest_memfd on arm64: Compile and
  runtime checks are added to ensure that if guest_memfd is enabled on
  arm64, KVM_GMEM_SUPPORTS_MMAP must also be enabled. This means
  guest_memfd-backed memory slots on arm64 are currently only supported
  if they are intended for shared memory use cases (i.e.,
  kvm_memslot_is_gmem_only() is true). This design reflects the current
  arm64 KVM ecosystem where guest_memfd is primarily being introduced
  for VMs that support shared memory.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++++
 arch/arm64/kvm/Kconfig            | 1 +
 arch/arm64/kvm/mmu.c              | 8 ++++++++
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d27079968341..bd2af5470c66 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1675,5 +1675,9 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
 void check_feature_map(void);
 
+#ifdef CONFIG_KVM_GMEM
+#define kvm_arch_supports_gmem(kvm) true
+#define kvm_arch_supports_gmem_mmap(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP)
+#endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e0..28539479f083 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_SUPPORTS_MMAP
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 71f8b53683e7..b92ce4d9b4e0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2274,6 +2274,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
 		return -EFAULT;
 
+	/*
+	 * Only support guest_memfd backed memslots with mappable memory, since
+	 * there aren't any CoCo VMs that support only private memory on arm64.
+	 */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_KVM_GMEM) && !IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP));
+	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
+		return -EINVAL;
+
 	hva = new->userspace_addr;
 	reg_end = hva + (new->npages << PAGE_SHIFT);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


