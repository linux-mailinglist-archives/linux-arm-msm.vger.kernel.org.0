Return-Path: <linux-arm-msm+bounces-66246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD57B0F042
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38B93AA6E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783102E06DC;
	Wed, 23 Jul 2025 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2IugSIPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1472DE71E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267648; cv=none; b=hcFX95j1XXmabvAdnQyxrMlBL+0B0sowpe43V5mtupiJjq82PXXbuP8g7T+4xgDWVn7pbYsNgp4bkPuip+iTySixTWiwUMqx+gJcl5WFK0jujTHUxePQBvU2NDiDp/zk13P7zS7AMURSmQAyBphgrE5i+MrC85/234et1UkBncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267648; c=relaxed/simple;
	bh=38ygdCilX8dT54YYL9NC1BWienHMT1RxG0kEfn+M4gk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e7Dq78oC7ahgrgcdV+OKjz/MOTJbkdMRC9erPRpyE3WU3tFAHuBpIWoiNYiVrlArwsVMu9WO/mh2Y0atjn4BXEDG8eOoGaQ+j/fFAxSioGK1ZTU/IoMTcuKPd2XKEptnn6GMXAxriTLRJ8gqb8wq5yjxl/a4ViLUbphugy+u6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2IugSIPT; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so2783145f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267645; x=1753872445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVZMjpRm02pM+s1bH/p5kOhiKIrqbu4P3W/nBYdl9H0=;
        b=2IugSIPTI5hjvCXu/jmsj1Gil9BZOyh2SoEwSfYR50d5DffrW7unywblOc8TcaoCZQ
         /WCmCZcsuDMzZeJ0CRvhJtisATJ0tBZTRjID51+SaP4aXFef2CPH30VlfbROWKmzSRzF
         FMntMPEjYqnF8qs9S89dB6cW095rdgDqXv9nsk3Bbf09TnjNLVcEkMGlbRcoxTJvgYYP
         OF4JtKqq/IkGbAO1miNZL9I7xQ4nsRg+uvTE19PluoWwHZDD0uUobfXeuC6UgD33H1IU
         FxpeysdrhURU+3ISPITJhswUhI/Q61SqgQ3snxvy+yN3iBK/cMjA5ysZr4z+Dz4fK1SX
         w36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267645; x=1753872445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVZMjpRm02pM+s1bH/p5kOhiKIrqbu4P3W/nBYdl9H0=;
        b=QecIjV2jMK2rOGnPlijj77QxxUoXBvUKKS4X4evG/dQ+MNwqfZQjf+TqmlvjRnb5ti
         Zn9oL+Gxx7L2hVy/cDfxDUhNd3C9H4Cvl6RnFSwyGP4aTWSDksnYGAbhpypGAZtUSEe4
         RNqtMNu/UoOmk9gMhywKT+hhohFQ2Z1k9jpexsKyn14yvlI6fC2Kljgf2MAYkmHZuOcE
         EQdJUyCFxPnyxoSb5rvTEA+sP8YFMIB1WzrU/QRLeLsrEbhIv6WugV/3XYiT2rWLTIGz
         z3NwAdvqMcvvc/Sj9YmxsRuosNs0Br0pP0meni2JXaP8anWyroOcTwxOSKk2ZQhF2O8k
         zq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRqFja6LfShlJa5Ce4xfsD9VT+JtxHffnW+WWgvaUorYSBpfRL1W6VRxhg66ibaTi+ujma3TLh8qZo+bFL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlw3UTSF4+ikLpGX55yb6T/pupjpU/w6lLLAulqZWzkjGmMmy8
	DBunFgoVn0J0hW1Vapp750KzWnj4N0MP7XINK4kny6u02aWXXv69A4dbNI0SO63c0LUP4DXfab2
	E8g==
X-Google-Smtp-Source: AGHT+IHLzuLINdJSWTguMGiWOg3ozLl75dp1Qprfo0bHjzS8AWsGSIsnNSxbTc+BmMB/sQkP4J6w00TZ8w==
X-Received: from wrjb12.prod.google.com ([2002:adf:e30c:0:b0:3a4:e3a1:4e8e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64c5:0:b0:3a5:5270:a52c
 with SMTP id ffacd0b85a97d-3b768c6cbf4mr2019207f8f.0.1753267644477; Wed, 23
 Jul 2025 03:47:24 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:47:01 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-10-tabba@google.com>
Subject: [PATCH v16 09/22] KVM: x86: Enable KVM_GUEST_MEMFD for all 64-bit builds
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

Enable KVM_GUEST_MEMFD for all KVM x86 64-bit builds, i.e. for "default"
VM types when running on 64-bit KVM.  This will allow using guest_memfd
to back non-private memory for all VM shapes, by supporting mmap() on
guest_memfd.

Opportunistically clean up various conditionals that become tautologies
once x86 selects KVM_GUEST_MEMFD more broadly.  Specifically, because
SW protected VMs, SEV, and TDX are all 64-bit only, private memory no
longer needs to take explicit dependencies on KVM_GUEST_MEMFD, because
it is effectively a prerequisite.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 +---
 arch/x86/kvm/Kconfig            | 12 ++++--------
 include/linux/kvm_host.h        |  9 ++-------
 virt/kvm/kvm_main.c             |  4 ++--
 4 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7b0f2b3e492d..50366a1ca192 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2276,10 +2276,8 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		       int tdp_max_root_level, int tdp_huge_page_level);
 
 
-#ifdef CONFIG_KVM_GUEST_MEMFD
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
-#else
-#define kvm_arch_has_private_mem(kvm) false
 #endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index c763446d9b9f..4e43923656d0 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -47,6 +47,7 @@ config KVM_X86
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_WERROR if WERROR
+	select KVM_GUEST_MEMFD if X86_64
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
@@ -79,16 +80,11 @@ config KVM_WERROR
 
 	  If in doubt, say "N".
 
-config KVM_X86_PRIVATE_MEM
-	select KVM_GENERIC_MEMORY_ATTRIBUTES
-	select KVM_GUEST_MEMFD
-	bool
-
 config KVM_SW_PROTECTED_VM
 	bool "Enable support for KVM software-protected VMs"
 	depends on EXPERT
 	depends on KVM_X86 && X86_64
-	select KVM_X86_PRIVATE_MEM
+	select KVM_GENERIC_MEMORY_ATTRIBUTES
 	help
 	  Enable support for KVM software-protected VMs.  Currently, software-
 	  protected VMs are purely a development and testing vehicle for
@@ -138,7 +134,7 @@ config KVM_INTEL_TDX
 	bool "Intel Trust Domain Extensions (TDX) support"
 	default y
 	depends on INTEL_TDX_HOST
-	select KVM_X86_PRIVATE_MEM
+	select KVM_GENERIC_MEMORY_ATTRIBUTES
 	select HAVE_KVM_ARCH_GMEM_POPULATE
 	help
 	  Provides support for launching Intel Trust Domain Extensions (TDX)
@@ -162,7 +158,7 @@ config KVM_AMD_SEV
 	depends on KVM_AMD && X86_64
 	depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
 	select ARCH_HAS_CC_PLATFORM
-	select KVM_X86_PRIVATE_MEM
+	select KVM_GENERIC_MEMORY_ATTRIBUTES
 	select HAVE_KVM_ARCH_GMEM_PREPARE
 	select HAVE_KVM_ARCH_GMEM_INVALIDATE
 	select HAVE_KVM_ARCH_GMEM_POPULATE
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 56ea8c862cfd..4d1c44622056 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -719,11 +719,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 }
 #endif
 
-/*
- * Arch code must define kvm_arch_has_private_mem if support for guest_memfd is
- * enabled.
- */
-#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_GUEST_MEMFD)
+#ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
@@ -2505,8 +2501,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return IS_ENABLED(CONFIG_KVM_GUEST_MEMFD) &&
-	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
+	return kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
 }
 #else
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index aa86dfd757db..4f57cb92e109 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1588,7 +1588,7 @@ static int check_memory_region_flags(struct kvm *kvm,
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
-	if (kvm_arch_has_private_mem(kvm))
+	if (IS_ENABLED(CONFIG_KVM_GUEST_MEMFD))
 		valid_flags |= KVM_MEM_GUEST_MEMFD;
 
 	/* Dirty logging private memory is not currently supported. */
@@ -4917,7 +4917,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #endif
 #ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CAP_GUEST_MEMFD:
-		return !kvm || kvm_arch_has_private_mem(kvm);
+		return 1;
 #endif
 	default:
 		break;
-- 
2.50.1.470.g6ba607880d-goog


