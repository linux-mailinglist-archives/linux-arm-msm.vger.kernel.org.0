Return-Path: <linux-arm-msm+bounces-64186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4581AFE6A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8D25812C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0429028DB5D;
	Wed,  9 Jul 2025 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1k7sNQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0906287275
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058795; cv=none; b=Ug0JgIJU3Wcai/tLENATc9xqFIO74ktoRXlZ7nud7/vd8mEI97r+oB42C3kl6i9VZvO+/ONdnkZflR/jP6rI6/NgvTe8Dar3v38M+C6mWGLHbb1m3Qrvkv6dW6c3CWzv1JeU88sNN4sJR2USDLpFgQS/MEZHGwJ+uE85/zevP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058795; c=relaxed/simple;
	bh=pOgp5kfy6Trevibm1vZxMm+xBgQqptKJeINPRonF46I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sEkknjtSyl9KhdB6dL+igjO7ub0tUeINrdp/nGwo64vo+I2xr796tcrKnrjEWjZ84cBRMQSbsQtbuH40SVJtrYtVpCeWsB1hbEnnk3+MFQjn14zpmOOESC9nv9G/+0xlW/DELZyB6F+YHx0KnTz1WFpdwBVrzUCtSmt6MBcaDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1k7sNQV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45311704cdbso38051525e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058791; x=1752663591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODqNCnDrv2hxPSFvQJ0Qi3d14QqgH9rtduTo0dWEY3M=;
        b=a1k7sNQV92lwna6zJBhhR9ktYvw1iK+A/k5LBTxBSLA2iz/OFKrDCSGV/1mxPnmm8J
         DVfHlDHvZ+vpBM+wHxTBrKNK2UzcogjgZJEQ9F1zl+f5XOuPzE9x5sBOUBpbiLTgqvfp
         H+7zZQVHyIFleENQXd85+LNspN8qYl/P1DZaem/LnP7RuIuyaallqP7XzRqOl0db+G+7
         jDoCqxM9KeOAwth5WSDgEBeR1CN3FrxNBaX2zznmhT/lggEpbdJhbSmDwL1KxcSZyFnK
         c4QjuvrxGWtCL/Om13lbaUVUTHfSTjErzBjsDYqCp3Q6+3MvgGdVIh8CKbZeKPowP/nQ
         MdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058791; x=1752663591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODqNCnDrv2hxPSFvQJ0Qi3d14QqgH9rtduTo0dWEY3M=;
        b=rO4lpM39K+2VjLzhoKrKCtqo754dKDFA00YCdnKSOt5sdwP8E8psgs4BKbNAqBJH1X
         v0SVcZ4FJusslyqf0mk0g1n/AyqnmVS42dD/aplBpdQzvX+x2z/rwWH3aKw1q7fnEcde
         fLYlr7eVAw362tc+73vcIJ+iAuWpzPijKq8AeY6PHa6BIsk2ZkvNCXpbOCB79Kd6iwWY
         9tkAQb6k17i5tFYyY1dSkdHxQ0fIRJrelhizbWjstr3bJjC+G9/ZhU03Hq9OhnlWvyng
         8nzuUnwvleX447QX5Ciwj277RvTjp0UAT7MQx7kxRFL+Lq+Q7fC/XGKZ481r/igkH3M3
         ltNg==
X-Forwarded-Encrypted: i=1; AJvYcCUbDtbH4W0oL4HivYvMP4BclbHlDmaXNJpRLxr5kdFOqUkCGGY6ewiMQi85ByVhxp8+cx59cqvZMZD/lmSN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Ekn2pbTeAdiTykioLryblbcjSLOlXZ9KnP8d+m+ZYgl+h298
	oCDfCYzFukqZL8Qsi+GNUIWCVltBFbKAkFvwBLBe+EwHchjt7v+7XcRoLCV4sLprQ5LJsLa6U8h
	XVw==
X-Google-Smtp-Source: AGHT+IEeKDjutdNgcR4v8/9dsP1g7M1veEQ88rCgvj0YpYpfwjC5+Ke0ARTVhhCO6Vol6hYTw801EW3rdg==
X-Received: from wmbfa21.prod.google.com ([2002:a05:600c:5195:b0:450:dcf2:1c36])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f07:b0:43c:fda5:41e9
 with SMTP id 5b1f17b1804b1-454d53ed101mr21724725e9.31.1752058791050; Wed, 09
 Jul 2025 03:59:51 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:27 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-2-tabba@google.com>
Subject: [PATCH v13 01/20] KVM: Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GMEM
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

Rename the Kconfig option CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GMEM. The
original name implied that the feature only supported "private" memory.
However, CONFIG_KVM_PRIVATE_MEM enables guest_memfd in general, which is
not exclusively for private memory. Subsequent patches in this series
will add guest_memfd support for non-CoCo VMs, whose memory is not
private.

Renaming the Kconfig option to CONFIG_KVM_GMEM more accurately reflects
its broader scope as the main Kconfig option for all guest_memfd-backed
memory. This provides clearer semantics for the option and avoids
confusion as new features are introduced.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
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
index 639d9bcee842..66bdd0759d27 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2269,7 +2269,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		       int tdp_max_root_level, int tdp_huge_page_level);
 
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GMEM
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
 #else
 #define kvm_arch_has_private_mem(kvm) false
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..755b09dcafce 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -601,7 +601,7 @@ struct kvm_memory_slot {
 	short id;
 	u16 as_id;
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GMEM
 	struct {
 		/*
 		 * Writes protected by kvm->slots_lock.  Acquiring a
@@ -719,10 +719,10 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 #endif
 
 /*
- * Arch code must define kvm_arch_has_private_mem if support for private memory
- * is enabled.
+ * Arch code must define kvm_arch_has_private_mem if support for guest_memfd is
+ * enabled.
  */
-#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
+#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_GMEM)
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
@@ -2527,7 +2527,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
+	return IS_ENABLED(CONFIG_KVM_GMEM) &&
 	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
 }
 #else
@@ -2537,7 +2537,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GMEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
 		     int *max_order);
@@ -2550,7 +2550,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
-#endif /* CONFIG_KVM_PRIVATE_MEM */
+#endif /* CONFIG_KVM_GMEM */
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
 int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 727b542074e7..49df4e32bff7 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -112,19 +112,19 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
        depends on KVM_GENERIC_MMU_NOTIFIER
        bool
 
-config KVM_PRIVATE_MEM
+config KVM_GMEM
        select XARRAY_MULTI
        bool
 
 config KVM_GENERIC_PRIVATE_MEM
        select KVM_GENERIC_MEMORY_ATTRIBUTES
-       select KVM_PRIVATE_MEM
+       select KVM_GMEM
        bool
 
 config HAVE_KVM_ARCH_GMEM_PREPARE
        bool
-       depends on KVM_PRIVATE_MEM
+       depends on KVM_GMEM
 
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
-       depends on KVM_PRIVATE_MEM
+       depends on KVM_GMEM
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..8d00918d4c8b 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -12,4 +12,4 @@ kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
-kvm-$(CONFIG_KVM_PRIVATE_MEM) += $(KVM)/guest_memfd.o
+kvm-$(CONFIG_KVM_GMEM) += $(KVM)/guest_memfd.o
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..898c3d5a7ba8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4910,7 +4910,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_MEMORY_ATTRIBUTES:
 		return kvm_supported_mem_attributes(kvm);
 #endif
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GMEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
 #endif
@@ -5344,7 +5344,7 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_GET_STATS_FD:
 		r = kvm_vm_ioctl_get_stats_fd(kvm);
 		break;
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GMEM
 	case KVM_CREATE_GUEST_MEMFD: {
 		struct kvm_create_guest_memfd guest_memfd;
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index acef3f5c582a..ec311c0d6718 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -67,7 +67,7 @@ static inline void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
 }
 #endif /* HAVE_KVM_PFNCACHE */
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GMEM
 void kvm_gmem_init(struct module *module);
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
 int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
@@ -91,6 +91,6 @@ static inline void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 {
 	WARN_ON_ONCE(1);
 }
-#endif /* CONFIG_KVM_PRIVATE_MEM */
+#endif /* CONFIG_KVM_GMEM */
 
 #endif /* __KVM_MM_H__ */
-- 
2.50.0.727.gbf7dc18ff4-goog


