Return-Path: <linux-arm-msm+bounces-64199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA956AFE6B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3DE588246
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6958292B3E;
	Wed,  9 Jul 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kDVyUgU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC6B28D8C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058821; cv=none; b=VeqEDAinNO69Cv3v3LBBl/QiVdQjiX+7RQAFlg7nVnrwghbQguARV+WBu9hNn1JPVz0cIfKPDpFUsvJZ8AZjXODze7NK8W91cQPyBl2BnktbjgigBP4+1YDjD5Fhc1FDeNAWPGEgueDlXywRW1NCrI63/TSaBT3Vyw7acWvs1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058821; c=relaxed/simple;
	bh=kinPDc7HtAYPx5khxZsF2f1P/fjG77CLc7x5v6an+Tk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T6pIAGabtfsgyyPs+gPVJi+0WuK+C8PKZE52eMdK6w2RUjqtMlG37BL7iH1E+dAmtLipGQhwgL9k49NDRwZqOJs5o0MBCE7Tscl2EdVh6wl5iTzNfHZIHJvy8qh87FhtVfYTI12uGaP06/KeWRDyi71iLR5/joy/P7SdBd3qn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kDVyUgU/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4538a2f4212so28975545e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058818; x=1752663618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WhXJV0NOaZfsKzvuJvoXjTAaVcvXAEjprzCfGc9Cqs=;
        b=kDVyUgU/Dou5/j+pbiCSlVYvqrSHmZNX3KDiAsIBiNgQnfL078K077rB4E4vRmedIi
         7u9YekYIreBM3K8iYT+evcXtDw8KFuBMxtIabgBxMH1x0JiQ0LLEPUNkLKnzaiq4CIcR
         pyFTh8EJjKBzoHmxko1f9YcpnE0EQPF3s/MIhyrfwlew2+llMB6/kOKN/yd3btmciF81
         VBDYkGOrB2UHwm08A8s22mQIbAXWns/0jsRx1Bg8wl0PeiFMVMQsbxVqlvGV+QVcvShP
         1Md4+4ZiEm4OyFf5D156tNwt3dDkdUWhX+xLftPbtF43JFDwHskf9jlIczdYnVIx6TTY
         Zyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058818; x=1752663618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WhXJV0NOaZfsKzvuJvoXjTAaVcvXAEjprzCfGc9Cqs=;
        b=E7WIZqopUr2J5KCjNkj0ewu5YcD8wBA2/lw8uW+W9f028UTiSxo/BxGzSQ5yD6tO5N
         Zzn29wlQWa/Zdq+RJdkWSdAIj4ApdInYZvpz2uDQA5lhi/yGJiASjaBBDdDrE4kmbEF0
         frCB/f/a7VFeUwUQEOIgJ5sxAY9SyDdBZDdBY7jnVLpN6GI0nFWDHgCCwiGzZlB9hLxF
         doRKYYPj9w11m/FsEXwa5dEUx+R9IIk4MaeTXYi7WPPzlW554/Snn9EsZqAKgjD0ze6P
         B67gHGgEXQd22AJ8DBJ48dyt7kJ6owkiyMSy6apPupBwojGcP+CTlUKdCnjEBDk+g7+U
         Szyg==
X-Forwarded-Encrypted: i=1; AJvYcCUDha+217+GjjS+VGcvdPOQCllg0+JhpW+uARn9o+FUtss5mQPTt3n89L5AOOd0D2OIHri+VAuyM+FO7IsR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UoEMyZHxunHYvGXHldEPAFzjJasAACbcPzdoVsG91beWw2i3
	DaNnGggrqC6udZVOhCbV/7GawhZN9v63PbQEbNSECu4NpvaOgEBaWQ5UOB12IvsBenHibJ6PHOA
	dkA==
X-Google-Smtp-Source: AGHT+IFRmfwj1tVW2Pf/313OFdTAH8ocG2uS68MVPRpJjtbT1vysRBtfwXvD7KGwdqirymBMHgojj2PaXg==
X-Received: from wmos4.prod.google.com ([2002:a05:600c:45c4:b0:440:60ac:3f40])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548d:b0:454:ac5d:3919
 with SMTP id 5b1f17b1804b1-454d530eb35mr17786035e9.2.1752058818488; Wed, 09
 Jul 2025 04:00:18 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:40 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-15-tabba@google.com>
Subject: [PATCH v13 14/20] KVM: x86: Enable guest_memfd mmap for default VM type
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

Enable host userspace mmap support for guest_memfd-backed memory when
running KVM with the KVM_X86_DEFAULT_VM type:

* Define kvm_arch_supports_gmem_mmap() for KVM_X86_DEFAULT_VM: Introduce
  the architecture-specific kvm_arch_supports_gmem_mmap() macro,
  specifically enabling mmap support for KVM_X86_DEFAULT_VM instances.
  This macro, gated by CONFIG_KVM_GMEM_SUPPORTS_MMAP, ensures that only
  the default VM type can leverage guest_memfd mmap functionality on
  x86. This explicit enablement prevents CoCo VMs, which use guest_memfd
  primarily for private memory and rely on hardware-enforced privacy,
  from accidentally exposing guest memory via host userspace mappings.

* Select CONFIG_KVM_GMEM_SUPPORTS_MMAP in KVM_X86: Enable the
  CONFIG_KVM_GMEM_SUPPORTS_MMAP Kconfig option when KVM_X86 is selected.
  This ensures that the necessary code for guest_memfd mmap support
  (introduced earlier) is compiled into the kernel for x86. This Kconfig
  option acts as a system-wide gate for the guest_memfd mmap capability.
  It implicitly enables CONFIG_KVM_GMEM, making guest_memfd available,
  and then layers the mmap capability on top specifically for the
  default VM.

These changes make guest_memfd a more versatile memory backing for
standard KVM guests, allowing VMMs to use a unified guest_memfd model
for both private (CoCo) and non-private (default) VMs. This is a
prerequisite for use cases such as running Firecracker guests entirely
backed by guest_memfd and implementing direct map removal for non-CoCo
VMs.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 9 +++++++++
 arch/x86/kvm/Kconfig            | 1 +
 arch/x86/kvm/x86.c              | 3 ++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4c764faa12f3..4c89feaa1910 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2273,9 +2273,18 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 #ifdef CONFIG_KVM_GMEM
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
 #define kvm_arch_supports_gmem(kvm)  ((kvm)->arch.supports_gmem)
+
+/*
+ * CoCo VMs with hardware support that use guest_memfd only for backing private
+ * memory, e.g., TDX, cannot use guest_memfd with userspace mapping enabled.
+ */
+#define kvm_arch_supports_gmem_mmap(kvm)		\
+	(IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP) &&	\
+	 (kvm)->arch.vm_type == KVM_X86_DEFAULT_VM)
 #else
 #define kvm_arch_has_private_mem(kvm) false
 #define kvm_arch_supports_gmem(kvm) false
+#define kvm_arch_supports_gmem_mmap(kvm) false
 #endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index df1fdbb4024b..239637b663dc 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -47,6 +47,7 @@ config KVM_X86
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_GENERIC_GMEM_POPULATE if KVM_SW_PROTECTED_VM
+	select KVM_GMEM_SUPPORTS_MMAP
 	select KVM_WERROR if WERROR
 
 config KVM
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b34236029383..17c655e5716e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12779,7 +12779,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	kvm->arch.vm_type = type;
 	kvm->arch.has_private_mem = (type == KVM_X86_SW_PROTECTED_VM);
-	kvm->arch.supports_gmem = (type == KVM_X86_SW_PROTECTED_VM);
+	kvm->arch.supports_gmem =
+		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
 	/* Decided by the vendor code for other VM types.  */
 	kvm->arch.pre_fault_allowed =
 		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
-- 
2.50.0.727.gbf7dc18ff4-goog


