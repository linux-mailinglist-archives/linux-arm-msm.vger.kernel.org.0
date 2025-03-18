Return-Path: <linux-arm-msm+bounces-51777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 814E7A6790D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E331890077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161B8211488;
	Tue, 18 Mar 2025 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fL0CIlCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761E520E32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314716; cv=none; b=D1jtlxGqUmSNiz6FrEfN6/zaijQzgbjks1X/S/1Qfa4R4XKs4ZnO0/XHGJgtMBUDCHRv6oUPTj0FeQa/v6dWd+YcDCQGzux59MAXqZUxplgGREFkeKPr1VIWk9gmHrr/KGDcCTMYmfSzUHBK+5xLCaEU4lCRsN9pl7FVE8qjKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314716; c=relaxed/simple;
	bh=yGIyXmpROQXRZi4dKEjioa5P2A7mpPxTdx1fHqRVjvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NNXSmbWYFHwVbsaQxJEP1IFGILTAZogavY8gCLCMfCLpjZ7x/WBBtjBjbTIrjREgL/eZUm48Kz0Afn/Vp/nfktmBx7uQUR7Ljyhx8/7qqGsCnw0XRjzJU2bYSLM4W9u+hCjdFg/WiYUpEcMX9kNSu4b5s0M87zjTMEmx87UbQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fL0CIlCh; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912a0439afso2631406f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314709; x=1742919509; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f04fIvPqKRtI5t7f5B+Wihfsf/K5ZsIQslP/ug4gI5c=;
        b=fL0CIlCh/MOUwCG3OhBFuzospc9Ogdx/lERQzYDvnKzJCb3tUm29UL5wYaRqNu4CuZ
         FAn1KnvGf/DOG2yWOtF2VRn3dNFrDrY4KjWH2tyAWO6mFxfPSe5hBGqTQoniXegyULkr
         RNUFvhDJ3NVBeap6Eb4C0siXr0F3Arnsmes0B7lOtuD5hJehsGo1nNmBmjfFQvLydC1T
         I+TyDDljREOk6dULtlLP99ImjwOMAKlJvVh4WfotngQsc276VeTpRbzPHSSxbqksbMnB
         3RmxD6MmK0EjLb1szk7tVM/u/F62fJwasI/esg5wV5+net7Ca9csMlA7EX4jM5rWdqxt
         AZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314709; x=1742919509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f04fIvPqKRtI5t7f5B+Wihfsf/K5ZsIQslP/ug4gI5c=;
        b=pKsNudaOp3OKCqnZ3aJO7KR8cIg7nGexzJUmlUvRShS7+LX3t2k7S6gm5AO5dpacEQ
         BXJmxeQv6bDuxDhDcXvEENbySjfGhKVaoPrIcdzZsFfQQ08UqI0v1bfE3OA0h+mx/AYx
         tXV3dL+perEF8Ffhdzt+r6eFWouZJILboL/DtY5NzmdB+kOnMkh8RTi9mCVSjJFkSUl3
         U1L5SVYXF15r9Z0JzLbvHA2YCjnuMbhlIcuY9smdULSfFDulFXLX+X91zrqeXAzVL38s
         fKMw9WBHvlWQW893rKRayjUPX8jRv0sjZhMb8ghIlx4EZBTesqG85bSoMZXKqNzFvNV0
         0CKA==
X-Forwarded-Encrypted: i=1; AJvYcCWi1pkZJjxIMatGL5YEXy7VzMGz+GpBakHZMd5mCpaDuYkss6xBg9nUAEYa2ty7IhVsrusXgnXYYPpIw4h6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34ENb7mRS3LJGvRbuwOZjAkHhv2DzEUkRjFNOHQLdKI0zbjem
	YXIXA1F+rjH2Tvrxko1mJBPXVfmGaGShx4ZAXw7p58lb0YH5cgltBqfaBH+4KU3k09FwGaHT/w=
	=
X-Google-Smtp-Source: AGHT+IHKjyvE9aXNEsQehi7vFGlwHXvPcmdq406eUxRhHnas0MMzqCwbpt157B52I+uti71hU+p9WZ7i0w==
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43c:fc61:959c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6d81:0:b0:397:8ef9:9952
 with SMTP id ffacd0b85a97d-3996b499a00mr4539610f8f.38.1742314708814; Tue, 18
 Mar 2025 09:18:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:18:16 +0000
In-Reply-To: <20250318161823.4005529-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318161823.4005529-3-tabba@google.com>
Subject: [PATCH v7 2/9] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Before transitioning a guest_memfd folio to unshared, thereby
disallowing access by the host and allowing the hypervisor to
transition its view of the guest page as private, we need to be
sure that the host doesn't have any references to the folio.

This patch introduces a new type for guest_memfd folios, which
isn't activated in this series but is here as a placeholder and
to facilitate the code in the subsequent patch series. This will
be used in the future to register a callback that informs the
guest_memfd subsystem when the last reference is dropped,
therefore knowing that the host doesn't have any remaining
references.

This patch also introduces the configuration option,
KVM_GMEM_SHARED_MEM, which toggles support for mapping
guest_memfd shared memory at the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/kvm_host.h   |  4 ++++
 include/linux/page-flags.h | 16 ++++++++++++++++
 mm/debug.c                 |  1 +
 mm/swap.c                  | 29 +++++++++++++++++++++++++++++
 virt/kvm/Kconfig           |  4 ++++
 virt/kvm/guest_memfd.c     |  8 ++++++++
 6 files changed, 62 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f34f4cfaa513..3ad0719bfc4f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2571,4 +2571,8 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+void kvm_gmem_handle_folio_put(struct folio *folio);
+#endif
+
 #endif
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 6dc2494bd002..daeee9a38e4c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -933,6 +933,7 @@ enum pagetype {
 	PGTY_slab	= 0xf5,
 	PGTY_zsmalloc	= 0xf6,
 	PGTY_unaccepted	= 0xf7,
+	PGTY_guestmem	= 0xf8,
 
 	PGTY_mapcount_underflow = 0xff
 };
@@ -1082,6 +1083,21 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
 FOLIO_TEST_FLAG_FALSE(hugetlb)
 #endif
 
+/*
+ * guestmem folios are used to back VM memory as managed by guest_memfd. Once
+ * the last reference is put, instead of freeing these folios back to the page
+ * allocator, they are returned to guest_memfd.
+ *
+ * For now, guestmem will only be set on these folios as long as they  cannot be
+ * mapped to user space ("private state"), with the plan of always setting that
+ * type once typed folios can be mapped to user space cleanly.
+ */
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+FOLIO_TYPE_OPS(guestmem, guestmem)
+#else
+FOLIO_TEST_FLAG_FALSE(guestmem)
+#endif
+
 PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
 
 /*
diff --git a/mm/debug.c b/mm/debug.c
index 8d2acf432385..08bc42c6cba8 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -56,6 +56,7 @@ static const char *page_type_names[] = {
 	DEF_PAGETYPE_NAME(table),
 	DEF_PAGETYPE_NAME(buddy),
 	DEF_PAGETYPE_NAME(unaccepted),
+	DEF_PAGETYPE_NAME(guestmem),
 };
 
 static const char *page_type_name(unsigned int page_type)
diff --git a/mm/swap.c b/mm/swap.c
index 47bc1bb919cc..d8fda3948684 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -38,6 +38,10 @@
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+#include <linux/kvm_host.h>
+#endif
+
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
@@ -94,6 +98,26 @@ static void page_cache_release(struct folio *folio)
 		unlock_page_lruvec_irqrestore(lruvec, flags);
 }
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+static void gmem_folio_put(struct folio *folio)
+{
+	/*
+	 * Perform the callback only as long as the KVM module is still loaded.
+	 * As long as the folio mapping is set, the folio is associated with a
+	 * guest_memfd inode.
+	 */
+	if (folio->mapping)
+		kvm_gmem_handle_folio_put(folio);
+
+	/*
+	 * If there are no references to the folio left, it's not associated
+	 * with a guest_memfd inode anymore.
+	 */
+	if (folio_ref_count(folio) == 0)
+		__folio_put(folio);
+}
+#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
+
 static void free_typed_folio(struct folio *folio)
 {
 	switch (folio_get_type(folio)) {
@@ -101,6 +125,11 @@ static void free_typed_folio(struct folio *folio)
 	case PGTY_hugetlb:
 		free_huge_folio(folio);
 		return;
+#endif
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	case PGTY_guestmem:
+		gmem_folio_put(folio);
+		return;
 #endif
 	default:
 		WARN_ON_ONCE(1);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..4e759e8020c5 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config KVM_GMEM_SHARED_MEM
+       select KVM_PRIVATE_MEM
+       bool
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2aa6bf24d3a..5fc414becae5 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -13,6 +13,14 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
+}
+EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
+#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
-- 
2.49.0.rc1.451.g8f38331e32-goog


