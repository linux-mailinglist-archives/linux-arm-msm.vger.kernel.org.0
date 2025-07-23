Return-Path: <linux-arm-msm+bounces-66239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45970B0F03D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 603057B780B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9BF29ACC3;
	Wed, 23 Jul 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SiZZ5T9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934862820B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267641; cv=none; b=qB/Z/N/IBB6gUd8D6bhV040vwZt+w0G5o66it0y70swnwA4mxqk8TioqZ93r1geFGoSKKKgEUMrVwgEYAgS1CSK8YxaWdam7n8AUAXU8/HbPaN5xyqoG//tELaP79NQ+PAy3FNpRYJf7MHOUHZlK112SO4BlB9CWJm/3XScFFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267641; c=relaxed/simple;
	bh=KfPrZgqq74D1TM0czCUTGq+ySWD+ixp0rlUzhK82/5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j6vr5bVSssQtXw1qC8fHIst/iyEan9ZF3Kawt8Ma8Dfre4Xek2R8sa6h6/g/qr5YyDNpm+8hdpk5FTL782aMC0DElqjcO/GwhlBas8Aewt1deTicRAKsvgh9PJrHcCpC1woqaVoosox9cVtq5NOlyAgT5YJ2lgo/xWVSUaw0rjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SiZZ5T9n; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f3796779so3806376f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267636; x=1753872436; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZSRmdf1Qs4xkVVhkcvJHkezUtgT+XJ93s4MNrjIOM4=;
        b=SiZZ5T9np3iep6Hal8Bu/zk89JLm+srabgk9GECCXxFyJmPy7sgMActBSIfyG3NDE4
         JqX9Zb5hakcZTSB8UB9jyg7fT8tTktSuiBjfwn8gnRJVYcpT0dt5gqUBuFJXQCTUOGCE
         RHYs6/i5kuCOXYWEelLWNKqoIgw4gspuIC6Uo9fOT+3TdclgjBy/RKpopGIgvIETzn+S
         /sLYFx2cidq/KARB8CUsyfKZRmCk0fymogI6JSv5Z0Pdj58g1Lk+6m8xiHTNJolaONvg
         XBsxag5/kvljF5WLbBpldrHLFk+dKyPbUNJva10SS+BD33MZshyG5FEoUYWKDV7+y8SH
         1iQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267636; x=1753872436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZSRmdf1Qs4xkVVhkcvJHkezUtgT+XJ93s4MNrjIOM4=;
        b=USB3HdcXeL3+on2R3hQJSRR70sL1CBUQCNvgvZ4Mw+pUedqeUHJTMO/62BMYUFMnxm
         wMaGbowbGIOTV8IgM7YZ0i7JA8DexUQNxhDoNZ8kJ22g+Z6UH4+H578IyrXg28/eclPI
         YJbQ+lqPEAhJSUNlitrA3Fvi7tq5f1OvvAUf/mWOq1wGofmHPBRWy6rrAOIBd/A1wkL3
         VlYhHuqqm2etrhaTXBYx/ndd/xq212MCC45cm6JZxhPNgcOtracWbcVxpvBFsFhtH20g
         WIVHa4LQprqTfVdf0TFdKqjFE2FcU6RvYcS1AlYyIZiPWXqpVyTAL4lNJGR9yp1lVR3m
         EbAw==
X-Forwarded-Encrypted: i=1; AJvYcCVsjz+5ldCL77ssWPo0T/H0eBy2spYayrBJr6/z7cpOt+aF9czo2FbB6aS1q9dbRGZWe6CCcS6vOl8NAJgt@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVPR15mMrGZ90my7LG9U61qkVu6iYgz3hk5GhVU5tnFvwXhuZ
	Yx7gw/xRrl146B14RIn+SrF/aghmr+h/3i1MvKWXdZUqBNoLoC2dcCp2oJWVgNvmZo5xHx9SByN
	sjA==
X-Google-Smtp-Source: AGHT+IGKHq0YkjOM3jnj7O/rIJyldYODUZMG9G/AEIG2YoV4TQj6EowfEXg4QShiaMq6zzhKOVJJ0yiVZw==
X-Received: from wrms6.prod.google.com ([2002:adf:ea86:0:b0:3a4:f6b6:15b1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c06:b0:3a5:1222:ac64
 with SMTP id ffacd0b85a97d-3b768ef6c83mr2223885f8f.38.1753267636044; Wed, 23
 Jul 2025 03:47:16 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:46:53 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-2-tabba@google.com>
Subject: [PATCH v16 01/22] KVM: Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GUEST_MEMFD
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

Rename the Kconfig option CONFIG_KVM_PRIVATE_MEM to
CONFIG_KVM_GUEST_MEMFD. The original name implied that the feature only
supported "private" memory. However, CONFIG_KVM_PRIVATE_MEM enables
guest_memfd in general, which is not exclusively for private memory.
Subsequent patches in this series will add guest_memfd support for
non-CoCo VMs, whose memory is not private.

Renaming the Kconfig option to CONFIG_KVM_GUEST_MEMFD more accurately
reflects its broader scope as the main Kconfig option for all
guest_memfd-backed memory. This provides clearer semantics for the
option and avoids confusion as new features are introduced.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 include/linux/kvm_host.h        | 14 +++++++-------
 virt/kvm/Kconfig                |  8 ++++----
 virt/kvm/Makefile.kvm           |  2 +-
 virt/kvm/kvm_main.c             |  4 ++--
 virt/kvm/kvm_mm.h               |  4 ++--
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f19a76d3ca0e..7b0f2b3e492d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2276,7 +2276,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		       int tdp_max_root_level, int tdp_huge_page_level);
 
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
 #else
 #define kvm_arch_has_private_mem(kvm) false
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..8cdc0b3cc1b1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -602,7 +602,7 @@ struct kvm_memory_slot {
 	short id;
 	u16 as_id;
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	struct {
 		/*
 		 * Writes protected by kvm->slots_lock.  Acquiring a
@@ -720,10 +720,10 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 #endif
 
 /*
- * Arch code must define kvm_arch_has_private_mem if support for private memory
- * is enabled.
+ * Arch code must define kvm_arch_has_private_mem if support for guest_memfd is
+ * enabled.
  */
-#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
+#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_GUEST_MEMFD)
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
@@ -2505,7 +2505,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
+	return IS_ENABLED(CONFIG_KVM_GUEST_MEMFD) &&
 	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
 }
 #else
@@ -2515,7 +2515,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
 		     int *max_order);
@@ -2528,7 +2528,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
-#endif /* CONFIG_KVM_PRIVATE_MEM */
+#endif /* CONFIG_KVM_GUEST_MEMFD */
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
 int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 727b542074e7..e4b400feff94 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -112,19 +112,19 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
        depends on KVM_GENERIC_MMU_NOTIFIER
        bool
 
-config KVM_PRIVATE_MEM
+config KVM_GUEST_MEMFD
        select XARRAY_MULTI
        bool
 
 config KVM_GENERIC_PRIVATE_MEM
        select KVM_GENERIC_MEMORY_ATTRIBUTES
-       select KVM_PRIVATE_MEM
+       select KVM_GUEST_MEMFD
        bool
 
 config HAVE_KVM_ARCH_GMEM_PREPARE
        bool
-       depends on KVM_PRIVATE_MEM
+       depends on KVM_GUEST_MEMFD
 
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
-       depends on KVM_PRIVATE_MEM
+       depends on KVM_GUEST_MEMFD
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..d047d4cf58c9 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -12,4 +12,4 @@ kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
-kvm-$(CONFIG_KVM_PRIVATE_MEM) += $(KVM)/guest_memfd.o
+kvm-$(CONFIG_KVM_GUEST_MEMFD) += $(KVM)/guest_memfd.o
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c07dd423458..25a94eed75fd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4915,7 +4915,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_MEMORY_ATTRIBUTES:
 		return kvm_supported_mem_attributes(kvm);
 #endif
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
 #endif
@@ -5352,7 +5352,7 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_GET_STATS_FD:
 		r = kvm_vm_ioctl_get_stats_fd(kvm);
 		break;
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CREATE_GUEST_MEMFD: {
 		struct kvm_create_guest_memfd guest_memfd;
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index acef3f5c582a..31defb08ccba 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -67,7 +67,7 @@ static inline void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
 }
 #endif /* HAVE_KVM_PFNCACHE */
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 void kvm_gmem_init(struct module *module);
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
 int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
@@ -91,6 +91,6 @@ static inline void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 {
 	WARN_ON_ONCE(1);
 }
-#endif /* CONFIG_KVM_PRIVATE_MEM */
+#endif /* CONFIG_KVM_GUEST_MEMFD */
 
 #endif /* __KVM_MM_H__ */
-- 
2.50.1.470.g6ba607880d-goog


