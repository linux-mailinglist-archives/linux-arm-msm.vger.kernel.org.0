Return-Path: <linux-arm-msm+bounces-45440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4434A1544C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CFEE3A644A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFFF19E83E;
	Fri, 17 Jan 2025 16:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ym/gy1Ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E22F1A073F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131420; cv=none; b=U5rP1UWSt5IoQRckOMtIZ4+y8tGKnS1BB8ruDOQeP/Jmrv3LHu+G+gljHL7E5MXG+tRf0Y9dHvIwlisePrGtepBAGuIE+yquUmbVPcyWgTitXvxE67J2YptTwrBNw/s18fULBewLOXKXOka9McmNTYW1gEXfIByTdYQCvFyE+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131420; c=relaxed/simple;
	bh=q1BiAA47FV7G2OCGBsOtQ65Yj8ch18Yc/bT2djl7jR4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QIWJluW2/pD3O7gmxovkdLFwFTSiLOmFTjdhUTyf0yxN5GbaQ8JOlhuhDhA12EZ73eB4oULeH5SHfyJvIb5YDrCwPq1bWubfmh1NbEkOjlGkmZtUqB2yGYGPKwMymBaUpg+2b+qZ6YjZnCd4Pe8e3YYn8xiEycmSUG09CLIalpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ym/gy1Ye; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436289a570eso19046655e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131416; x=1737736216; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qs5nf37zcwmaOIZ9951hFlwOisjQG4rTL5i8c6zaQ+w=;
        b=ym/gy1Yega6yZu9uububH1vT4r7rPt/7sSs4xTVESk2ZGly9tNc1f64QMGoh4wQx3Z
         eGlJxV6Q0JukNeeMAK7wm51ND9ZeoaMFPT4b1XOoApZVVRE0PKkIuT/ZsmKLaIcTHSQj
         w7qzepDkiK+e5c0fNT5v5r4DPlPeNUiqu7sMJhZQ472bnElfwusZVLMVOq9QUuymkZB7
         5gbFI7/a3gclaXTrj/hlBlWR20T34yJiNw5ZabjgFL6inEIaugjso2KQ2anuY9+hcFP4
         WxO3fa6GnywLnrjgLpw/7OGSV8rveDMftP7noxY208RDVMiFMT5vx1OHz5XwBhSl32Ix
         5mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131416; x=1737736216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qs5nf37zcwmaOIZ9951hFlwOisjQG4rTL5i8c6zaQ+w=;
        b=vKFZosr7qfxCRibb8Xv3nJpqWlmuWIXZ2enuvpen4B+CFMdxlpwfyTrCYnTjSncLTT
         1H96wKAuwPyIvdi6EUfmE/Jwe5+lBual9jM0Z9CqNtfg1Bce0g/fiQ9wqnyj0SSOQBph
         4j/KEJtd2TfiWUUqUWkddeGfJh2LWHWDgJEM/CWSxqAiKhc2+vULgewBUyiYA3RnZ9TQ
         CbGzHzKx/6W69Z3H5GchnIY2eflkxxFdkNhPQUUU7OB7i7pZ7O/FEffUav9HoIeAT2A+
         DGsUBYVghmNhO0oK7rrbTkAusnj7Ssz0RVDQHQIkeA+XqFaSz7XN8/ce/ckbpUo55GRu
         q1tg==
X-Forwarded-Encrypted: i=1; AJvYcCUNuvLw7ZYjpIVBmFKD730xmocPogoEkaboPY4XN+aQgsAQRQHYjvQ+RcdXunryjqxquzBd8UUsj98lpCzb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41OidLqB3J7tONQcRjdlcE2oY2vPyO18VUPyu/a7RpwhbGknr
	5UbExKx9SCEo1cONTk1uPKdT3XVHK6Iuc9r+fg5xez/R++FA3kkUJSsHmwQGlrKDNhnlyppRGQ=
	=
X-Google-Smtp-Source: AGHT+IFheEUtlIt1ATVto/VUlbQijnnQ4cyUB/ujy7iW3r3fDB6NNV0j355jsd6xDd1kNpmbUluyV4STMw==
X-Received: from wmrn39.prod.google.com ([2002:a05:600c:5027:b0:436:e748:58a3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fd1:b0:428:d31:ef25
 with SMTP id 5b1f17b1804b1-438913e3369mr37880265e9.12.1737131416570; Fri, 17
 Jan 2025 08:30:16 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:52 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-7-tabba@google.com>
Subject: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put() of
 guestmem pages
From: Fuad Tabba <tabba@google.com>
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
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Before transitioning a guest_memfd folio to unshared, thereby
disallowing access by the host and allowing the hypervisor to
transition its view of the guest page as private, we need to be
sure that the host doesn't have any references to the folio.

This patch introduces a new type for guest_memfd folios, and uses
that to register a callback that informs the guest_memfd
subsystem when the last reference is dropped, therefore knowing
that the host doesn't have any remaining references.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
The function kvm_slot_gmem_register_callback() isn't used in this
series. It will be used later in code that performs unsharing of
memory. I have tested it with pKVM, based on downstream code [*].
It's included in this RFC since it demonstrates the plan to
handle unsharing of private folios.

[*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/guestmem-6.13-v5-pkvm
---
 include/linux/kvm_host.h   |  11 +++
 include/linux/page-flags.h |   7 ++
 mm/debug.c                 |   1 +
 mm/swap.c                  |   4 +
 virt/kvm/guest_memfd.c     | 145 +++++++++++++++++++++++++++++++++++++
 5 files changed, 168 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 84aa7908a5dd..63e6d6dd98b3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2574,6 +2574,8 @@ int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot, gfn_t start,
 				 gfn_t end);
 bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
+int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn);
+void kvm_gmem_handle_folio_put(struct folio *folio);
 #else
 static inline bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end)
 {
@@ -2615,6 +2617,15 @@ static inline bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot,
 	WARN_ON_ONCE(1);
 	return false;
 }
+static inline int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+static inline void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	WARN_ON_ONCE(1);
+}
 #endif /* CONFIG_KVM_GMEM_MAPPABLE */
 
 #endif
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 6615f2f59144..bab3cac1f93b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -942,6 +942,7 @@ enum pagetype {
 	PGTY_slab	= 0xf5,
 	PGTY_zsmalloc	= 0xf6,
 	PGTY_unaccepted	= 0xf7,
+	PGTY_guestmem	= 0xf8,
 
 	PGTY_mapcount_underflow = 0xff
 };
@@ -1091,6 +1092,12 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
 FOLIO_TEST_FLAG_FALSE(hugetlb)
 #endif
 
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+FOLIO_TYPE_OPS(guestmem, guestmem)
+#else
+FOLIO_TEST_FLAG_FALSE(guestmem)
+#endif
+
 PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
 
 /*
diff --git a/mm/debug.c b/mm/debug.c
index 95b6ab809c0e..db93be385ed9 100644
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
index 6f01b56bce13..15220eaabc86 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -37,6 +37,7 @@
 #include <linux/page_idle.h>
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
+#include <linux/kvm_host.h>
 
 #include "internal.h"
 
@@ -103,6 +104,9 @@ static void free_typed_folio(struct folio *folio)
 	case PGTY_offline:
 		/* Nothing to do, it's offline. */
 		return;
+	case PGTY_guestmem:
+		kvm_gmem_handle_folio_put(folio);
+		return;
 	default:
 		WARN_ON_ONCE(1);
 	}
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index d1c192927cf7..722afd9f8742 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -387,6 +387,28 @@ enum folio_mappability {
 	KVM_GMEM_NONE_MAPPABLE	= 0b11, /* Not mappable, transient state. */
 };
 
+/*
+ * Unregisters the __folio_put() callback from the folio.
+ *
+ * Restores a folio's refcount after all pending references have been released,
+ * and removes the folio type, thereby removing the callback. Now the folio can
+ * be freed normaly once all actual references have been dropped.
+ *
+ * Must be called with the filemap (inode->i_mapping) invalidate_lock held.
+ * Must also have exclusive access to the folio: folio must be either locked, or
+ * gmem holds the only reference.
+ */
+static void __kvm_gmem_restore_pending_folio(struct folio *folio)
+{
+	if (WARN_ON_ONCE(folio_mapped(folio) || !folio_test_guestmem(folio)))
+		return;
+
+	WARN_ON_ONCE(!folio_test_locked(folio) && folio_ref_count(folio) > 1);
+
+	__folio_clear_guestmem(folio);
+	folio_ref_add(folio, folio_nr_pages(folio));
+}
+
 /*
  * Marks the range [start, end) as mappable by both the host and the guest.
  * Usually called when guest shares memory with the host.
@@ -400,7 +422,31 @@ static int gmem_set_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
 
 	filemap_invalidate_lock(inode->i_mapping);
 	for (i = start; i < end; i++) {
+		struct folio *folio = NULL;
+
+		/*
+		 * If the folio is NONE_MAPPABLE, it indicates that it is
+		 * transitioning to private (GUEST_MAPPABLE). Transition it to
+		 * shared (ALL_MAPPABLE) immediately, and remove the callback.
+		 */
+		if (xa_to_value(xa_load(mappable_offsets, i)) == KVM_GMEM_NONE_MAPPABLE) {
+			folio = filemap_lock_folio(inode->i_mapping, i);
+			if (WARN_ON_ONCE(IS_ERR(folio))) {
+				r = PTR_ERR(folio);
+				break;
+			}
+
+			if (folio_test_guestmem(folio))
+				__kvm_gmem_restore_pending_folio(folio);
+		}
+
 		r = xa_err(xa_store(mappable_offsets, i, xval, GFP_KERNEL));
+
+		if (folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+
 		if (r)
 			break;
 	}
@@ -473,6 +519,105 @@ static int gmem_clear_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
 	return r;
 }
 
+/*
+ * Registers a callback to __folio_put(), so that gmem knows that the host does
+ * not have any references to the folio. It does that by setting the folio type
+ * to guestmem.
+ *
+ * Returns 0 if the host doesn't have any references, or -EAGAIN if the host
+ * has references, and the callback has been registered.
+ *
+ * Must be called with the following locks held:
+ * - filemap (inode->i_mapping) invalidate_lock
+ * - folio lock
+ */
+static int __gmem_register_callback(struct folio *folio, struct inode *inode, pgoff_t idx)
+{
+	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
+	void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
+	int refcount;
+
+	rwsem_assert_held_write_nolockdep(&inode->i_mapping->invalidate_lock);
+	WARN_ON_ONCE(!folio_test_locked(folio));
+
+	if (folio_mapped(folio) || folio_test_guestmem(folio))
+		return -EAGAIN;
+
+	/* Register a callback first. */
+	__folio_set_guestmem(folio);
+
+	/*
+	 * Check for references after setting the type to guestmem, to guard
+	 * against potential races with the refcount being decremented later.
+	 *
+	 * At least one reference is expected because the folio is locked.
+	 */
+
+	refcount = folio_ref_sub_return(folio, folio_nr_pages(folio));
+	if (refcount == 1) {
+		int r;
+
+		/* refcount isn't elevated, it's now faultable by the guest. */
+		r = WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, idx, xval_guest, GFP_KERNEL)));
+		if (!r)
+			__kvm_gmem_restore_pending_folio(folio);
+
+		return r;
+	}
+
+	return -EAGAIN;
+}
+
+int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	unsigned long pgoff = slot->gmem.pgoff + gfn - slot->base_gfn;
+	struct inode *inode = file_inode(slot->gmem.file);
+	struct folio *folio;
+	int r;
+
+	filemap_invalidate_lock(inode->i_mapping);
+
+	folio = filemap_lock_folio(inode->i_mapping, pgoff);
+	if (WARN_ON_ONCE(IS_ERR(folio))) {
+		r = PTR_ERR(folio);
+		goto out;
+	}
+
+	r = __gmem_register_callback(folio, inode, pgoff);
+
+	folio_unlock(folio);
+	folio_put(folio);
+out:
+	filemap_invalidate_unlock(inode->i_mapping);
+
+	return r;
+}
+
+/*
+ * Callback function for __folio_put(), i.e., called when all references by the
+ * host to the folio have been dropped. This allows gmem to transition the state
+ * of the folio to mappable by the guest, and allows the hypervisor to continue
+ * transitioning its state to private, since the host cannot attempt to access
+ * it anymore.
+ */
+void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	struct xarray *mappable_offsets;
+	struct inode *inode;
+	pgoff_t index;
+	void *xval;
+
+	inode = folio->mapping->host;
+	index = folio->index;
+	mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
+	xval = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
+
+	filemap_invalidate_lock(inode->i_mapping);
+	__kvm_gmem_restore_pending_folio(folio);
+	WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, index, xval, GFP_KERNEL)));
+	filemap_invalidate_unlock(inode->i_mapping);
+}
+
 static bool gmem_is_mappable(struct inode *inode, pgoff_t pgoff)
 {
 	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
-- 
2.48.0.rc2.279.g1de40edade-goog


