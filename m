Return-Path: <linux-arm-msm+bounces-65527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33256B091D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713241651BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884BF2FCFC5;
	Thu, 17 Jul 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c0INOb+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2E2FF473
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769674; cv=none; b=GzKTAQ2NXKeU7fBYxtmhxHYMI+0HhHUUes5RQQb2jfPz3DpfiypxkVIyVZTYztOx6SB/Nz79eU4J7SKR8S/89n3ZUnMxCLF4FOe5epELR6GUIgPDE3upkxHSBufrsJKl11JXPJaKKf/Y9jqNhYkiZb7ok7VYy+ZZ5sp1cVRe6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769674; c=relaxed/simple;
	bh=C3B/tCKG6OjtxxQwarA8/8UYBN4CjZQGHU0NMrczuD4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VlB0TU1LZMUeiz3uCfpPy0/c/JV7Otb0DEtTMge9rEo+YNkptZ46RnXNOHQP8WwN5j4+l6dPGLbyDyMSARan++L9ztmpo/s+e3JrnZ3vdnZ2qzKnqZz81wkhfU9pRwe2agwlY5AdKMqBpSicncC7DoAAsmLrrANQ1F3aBfgeq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c0INOb+r; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so690325f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769671; x=1753374471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=47rVlr8Uc/SdJ5Y2yETdFZUDua/sXacoe643TNgwpkI=;
        b=c0INOb+r6ydH2AES7vz6VQb/KJ57I4nkPi/8j7kIYjSVQjjyRxbiEkSYL/wbx9asWv
         WMWteXaXVdHMdxF+LHxr7/1iMmNcHB5YQPqimuXJ1gfBsAwzQJj0B+RzqbgSrVsJfrT2
         9OiY/P6II5o172pzq+zr/SHKELYBMdvkEkAJzWjH8e5HdZhSJX3dgHbSKqgXVkfIVZxM
         BUx1tOT86n1aA4cGglgsnvG48CaSn034CV0NnFSMAUyIyUOoeUrgZzqu+UErfPIz5aqE
         WSlykx3D3soNrRYhIO4MWMYTuMUYBXJrsCOaiPwdupPW+BP3xJnr2eKmT4vPhjCIjFLc
         DOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769671; x=1753374471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47rVlr8Uc/SdJ5Y2yETdFZUDua/sXacoe643TNgwpkI=;
        b=AZewt3ch1bzEcd2hYTcXG1iqkcu/DAC7imrZcUsnD9ioQvGye6kBdka843805T6wd4
         2D1/mvPRNF95jrhXpUHrDskRUksZRx02kSkwzn0af1LsT2Wprhi1u9+S0SISgVzZPSoD
         q445h3pCXwtRy7NOgX2hMWkZb2V7Xcdi7WA5DI8KkIo0nhsh2a93pkikWRb4UR6P9wGG
         +XZBJ9y90olHdYAeYKnA7QZxt5S7tl6UQvrJ9vokJo3+O51Nnq+Ayz9M/S1ROADdUVM3
         /TfqHszmltxLDFQSP+zL40cmKStbgYulnk0XJfqchS+5yNGdrurGH5f0bybZG4SX65ju
         dg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUecqqiKV17eKoRWPdYKuO2et3ax0SV+OXwKoNT0nKGFlsW9rKfR5v/f9OwTW9eem3Cj5Kr1fxj/C9vglp@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ24r9kP8QiUtkrh/jDKf+kr6JrMN5U1q/2yuZrAGRyNGabMkR
	NsCHSXaGf3Mfzx8A7XQPNRBqYwKnedSEP+olfe4gbpSZ5UihU4a01sWAdYT2sA0X+4O+mptpz+8
	azg==
X-Google-Smtp-Source: AGHT+IFE+Yh1vUPuBTGkmn7aSiu0B0g40KDhnFsxHr96JF67lwRCADpGBuJJ9OSA14pLB/Lgj/5KyihDXQ==
X-Received: from wmbel5.prod.google.com ([2002:a05:600c:3e05:b0:456:e1f:751a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40ce:b0:3b5:e2ca:1c2
 with SMTP id ffacd0b85a97d-3b60e4be28fmr5622341f8f.2.1752769671044; Thu, 17
 Jul 2025 09:27:51 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:28 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-19-tabba@google.com>
Subject: [PATCH v15 18/21] KVM: arm64: Enable host mapping of shared
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

* Enforce KVM_MEMSLOT_GMEM_ONLY for guest_memfd on arm64: Checks are
  added to ensure that if guest_memfd is enabled on arm64,
  KVM_GMEM_SUPPORTS_MMAP must also be enabled. This means
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
 arch/arm64/kvm/Kconfig            | 2 ++
 arch/arm64/kvm/mmu.c              | 7 +++++++
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3e41a880b062..63f7827cfa1b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1674,5 +1674,9 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
 void check_feature_map(void);
 
+#ifdef CONFIG_KVM_GMEM
+#define kvm_arch_supports_gmem(kvm) true
+#define kvm_arch_supports_gmem_mmap(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP)
+#endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e0..323b46b7c82f 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,8 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM
+	select KVM_GMEM_SUPPORTS_MMAP
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8c82df80a835..85559b8a0845 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2276,6 +2276,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
 		return -EFAULT;
 
+	/*
+	 * Only support guest_memfd backed memslots with mappable memory, since
+	 * there aren't any CoCo VMs that support only private memory on arm64.
+	 */
+	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
+		return -EINVAL;
+
 	hva = new->userspace_addr;
 	reg_end = hva + (new->npages << PAGE_SHIFT);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


