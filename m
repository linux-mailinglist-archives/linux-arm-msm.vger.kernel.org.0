Return-Path: <linux-arm-msm+bounces-45439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E147A1544B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9DEE188C376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F132F1A0BF8;
	Fri, 17 Jan 2025 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rj5Rb+Qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFE149C55
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131419; cv=none; b=rck23emLOq607EIrOeSwqSx6dFrRYi1kzVYSb7tZrwNTBwGA9ozq657oKpOkU8HrOe68PRA5WrPgyYexnb3yyi07zjfOeLyoVbJdb7mDHT5dPGuLTKcuc5O+CHtguCIwC4txBL2f40LRhyFmz+rlvyXCdxTy3Z6XP7W39kJ1bkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131419; c=relaxed/simple;
	bh=sxkOBrj0ypW1SVNf0Fz8Lh/mNZqWYsN7rtpzHBzudrA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HgprQxmYGnKTN04OYt+zkutxbxUMbfkLT1tbwA8sqxinvijhEduu9PxDlA+JpI7vVgnwXK1hFsgPrYA7WP0R8NwMw4FpPgSAbK1AAcqhB+9tLdbm6JxaQ1Hk/7zQco8YIxMPOuK3tBzbj3c+nriT1sbaPTk6jVd868z1u51R+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rj5Rb+Qp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43673af80a6so17314105e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131414; x=1737736214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVZ6/wJnW1NLmDdlnZeeMFjWuJzNbaR38/28aWmB+Ok=;
        b=rj5Rb+QpgatV2a3gIHsQ01X48ufgT3aqUfrGTNVfgNxQTXU+F8OxtaxmsXWjbrumx/
         hiauKsROjGkdJe72pFL+5I8NSLOmZWlY8wmNcM2TuZkNP0cB1s0c+slZdkOwo8lWeuZc
         mTRqaZp3DvvimtRyQmADFsBr2kh8YXZK+Lv1xUDQoSyHGi4j7Hrkp+2cS3v9O7oUBc08
         1PO9WlJJyIoAnwxGqzBRjSCizFB2f7uQuxdYs8mdJhIyz77xICXH8SpKNW3zLiacIHWQ
         0HK/LfZQAM/KR+sIrg2KB1Ipq1UixB4ey+nkZAfGowlZAVx5/qCpBC3LFAiPyp90+Jqa
         6wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131414; x=1737736214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVZ6/wJnW1NLmDdlnZeeMFjWuJzNbaR38/28aWmB+Ok=;
        b=VJ8zKPx3hsywWnscJG8XOomjtW6uahojx9zCk5NLwPddJvq1RQIHhRudkpwp0KoXpw
         ZKYXR5B7sM9rMAzIkI6OTvxSSbLDdmJWd0g/dEpjiT0R2WHPTXf2QwFqVYUhIDCJyOIP
         H8MM9BQqG/g87zWn+biRmtHgHGVWUtkwZ1Ihm4XfiImt0+tDx2Yt3k0BD3RekPYjz+7/
         TOyLScAO0RoIBAKtrqFvSxs5Y4/dGSCxQdM0gTi4EWREsnjez7bKRokegKbHLRwfKSmr
         4ITRHwBp3c84PBQ1aqjDIDjSM7lblVrwaxegHtIB2IWWTNanC4CdlucoXd19hY5NljpL
         l6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWz61eEnnu5orFiHGvUIskByp/AWz6y0svzTPd5cFj3/alnpoHcUhqKXbSOeYAtZhnfUq3ZnR2+ui8lm4f4@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJxHCLjkij/1XDvITAMHppIwIrCWUKzJU/lEUigMTColrPwCB
	3JRWpUYr5ulngwR+IcunE0gc9orN+gzCTtbZ1HXKfYMmp7NVVHr8Zg4QhwhJ/JqgxHJGfyKJXA=
	=
X-Google-Smtp-Source: AGHT+IHCaOLf3AxGrXp3UT2DCvE92fOOg4PnB/FoRBbpczstO0JHX8UoSu03mcJ4e4/3vk20WdvjqLoW7Q==
X-Received: from wmgg21.prod.google.com ([2002:a05:600d:15:b0:434:f271:522e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5027:b0:434:f5c0:3288
 with SMTP id 5b1f17b1804b1-43891430ed1mr33942345e9.29.1737131414416; Fri, 17
 Jan 2025 08:30:14 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:51 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-6-tabba@google.com>
Subject: [RFC PATCH v5 05/15] KVM: guest_memfd: Folio mappability states and
 functions that manage their transition
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

To allow restricted mapping of guest_memfd folios by the host,
guest_memfd needs to track whether they can be mapped and by who,
since the mapping will only be allowed under conditions where it
safe to access these folios. These conditions depend on the
folios being explicitly shared with the host, or not yet exposed
to the guest (e.g., at initialization).

This patch introduces states that determine whether the host and
the guest can fault in the folios as well as the functions that
manage transitioning between those states.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h |  53 ++++++++++++++
 virt/kvm/guest_memfd.c   | 153 +++++++++++++++++++++++++++++++++++++++
 virt/kvm/kvm_main.c      |  92 +++++++++++++++++++++++
 3 files changed, 298 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cda3ed4c3c27..84aa7908a5dd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2564,4 +2564,57 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end);
+int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end);
+int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start, gfn_t end);
+int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot, gfn_t start,
+			       gfn_t end);
+int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot, gfn_t start,
+				 gfn_t end);
+bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
+bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
+#else
+static inline bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end)
+{
+	WARN_ON_ONCE(1);
+	return false;
+}
+static inline int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+static inline int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start,
+					  gfn_t end)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+static inline int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot,
+					     gfn_t start, gfn_t end)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+static inline int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot,
+					       gfn_t start, gfn_t end)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+static inline bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot,
+					     gfn_t gfn)
+{
+	WARN_ON_ONCE(1);
+	return false;
+}
+static inline bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot,
+						   gfn_t gfn)
+{
+	WARN_ON_ONCE(1);
+	return false;
+}
+#endif /* CONFIG_KVM_GMEM_MAPPABLE */
+
 #endif
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 0a7b6cf8bd8f..d1c192927cf7 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -375,6 +375,159 @@ static void kvm_gmem_init_mount(void)
 	kvm_gmem_mnt->mnt_flags |= MNT_NOEXEC;
 }
 
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+/*
+ * An enum of the valid states that describe who can map a folio.
+ * Bit 0: if set guest cannot map the page
+ * Bit 1: if set host cannot map the page
+ */
+enum folio_mappability {
+	KVM_GMEM_ALL_MAPPABLE	= 0b00,	/* Mappable by host and guest. */
+	KVM_GMEM_GUEST_MAPPABLE	= 0b10, /* Mappable only by guest. */
+	KVM_GMEM_NONE_MAPPABLE	= 0b11, /* Not mappable, transient state. */
+};
+
+/*
+ * Marks the range [start, end) as mappable by both the host and the guest.
+ * Usually called when guest shares memory with the host.
+ */
+static int gmem_set_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
+	void *xval = xa_mk_value(KVM_GMEM_ALL_MAPPABLE);
+	pgoff_t i;
+	int r = 0;
+
+	filemap_invalidate_lock(inode->i_mapping);
+	for (i = start; i < end; i++) {
+		r = xa_err(xa_store(mappable_offsets, i, xval, GFP_KERNEL));
+		if (r)
+			break;
+	}
+	filemap_invalidate_unlock(inode->i_mapping);
+
+	return r;
+}
+
+/*
+ * Marks the range [start, end) as not mappable by the host. If the host doesn't
+ * have any references to a particular folio, then that folio is marked as
+ * mappable by the guest.
+ *
+ * However, if the host still has references to the folio, then the folio is
+ * marked and not mappable by anyone. Marking it is not mappable allows it to
+ * drain all references from the host, and to ensure that the hypervisor does
+ * not transition the folio to private, since the host still might access it.
+ *
+ * Usually called when guest unshares memory with the host.
+ */
+static int gmem_clear_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
+	void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
+	void *xval_none = xa_mk_value(KVM_GMEM_NONE_MAPPABLE);
+	pgoff_t i;
+	int r = 0;
+
+	filemap_invalidate_lock(inode->i_mapping);
+	for (i = start; i < end; i++) {
+		struct folio *folio;
+		int refcount = 0;
+
+		folio = filemap_lock_folio(inode->i_mapping, i);
+		if (!IS_ERR(folio)) {
+			refcount = folio_ref_count(folio);
+		} else {
+			r = PTR_ERR(folio);
+			if (WARN_ON_ONCE(r != -ENOENT))
+				break;
+
+			folio = NULL;
+		}
+
+		/* +1 references are expected because of filemap_lock_folio(). */
+		if (folio && refcount > folio_nr_pages(folio) + 1) {
+			/*
+			 * Outstanding references, the folio cannot be faulted
+			 * in by anyone until they're dropped.
+			 */
+			r = xa_err(xa_store(mappable_offsets, i, xval_none, GFP_KERNEL));
+		} else {
+			/*
+			 * No outstanding references. Transition the folio to
+			 * guest mappable immediately.
+			 */
+			r = xa_err(xa_store(mappable_offsets, i, xval_guest, GFP_KERNEL));
+		}
+
+		if (folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+
+		if (WARN_ON_ONCE(r))
+			break;
+	}
+	filemap_invalidate_unlock(inode->i_mapping);
+
+	return r;
+}
+
+static bool gmem_is_mappable(struct inode *inode, pgoff_t pgoff)
+{
+	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
+	unsigned long r;
+
+	r = xa_to_value(xa_load(mappable_offsets, pgoff));
+
+	return (r == KVM_GMEM_ALL_MAPPABLE);
+}
+
+static bool gmem_is_guest_mappable(struct inode *inode, pgoff_t pgoff)
+{
+	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
+	unsigned long r;
+
+	r = xa_to_value(xa_load(mappable_offsets, pgoff));
+
+	return (r == KVM_GMEM_ALL_MAPPABLE || r == KVM_GMEM_GUEST_MAPPABLE);
+}
+
+int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot, gfn_t start, gfn_t end)
+{
+	struct inode *inode = file_inode(slot->gmem.file);
+	pgoff_t start_off = slot->gmem.pgoff + start - slot->base_gfn;
+	pgoff_t end_off = start_off + end - start;
+
+	return gmem_set_mappable(inode, start_off, end_off);
+}
+
+int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot, gfn_t start, gfn_t end)
+{
+	struct inode *inode = file_inode(slot->gmem.file);
+	pgoff_t start_off = slot->gmem.pgoff + start - slot->base_gfn;
+	pgoff_t end_off = start_off + end - start;
+
+	return gmem_clear_mappable(inode, start_off, end_off);
+}
+
+bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	struct inode *inode = file_inode(slot->gmem.file);
+	unsigned long pgoff = slot->gmem.pgoff + gfn - slot->base_gfn;
+
+	return gmem_is_mappable(inode, pgoff);
+}
+
+bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	struct inode *inode = file_inode(slot->gmem.file);
+	unsigned long pgoff = slot->gmem.pgoff + gfn - slot->base_gfn;
+
+	return gmem_is_guest_mappable(inode, pgoff);
+}
+#endif /* CONFIG_KVM_GMEM_MAPPABLE */
+
 static struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..fffff01cebe7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3094,6 +3094,98 @@ static int next_segment(unsigned long len, int offset)
 		return len;
 }
 
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
+{
+	struct kvm_memslot_iter iter;
+	bool r = true;
+
+	mutex_lock(&kvm->slots_lock);
+
+	kvm_for_each_memslot_in_gfn_range(&iter, kvm_memslots(kvm), start, end) {
+		struct kvm_memory_slot *memslot = iter.slot;
+		gfn_t gfn_start, gfn_end, i;
+
+		if (!kvm_slot_can_be_private(memslot))
+			continue;
+
+		gfn_start = max(start, memslot->base_gfn);
+		gfn_end = min(end, memslot->base_gfn + memslot->npages);
+		if (WARN_ON_ONCE(gfn_start >= gfn_end))
+			continue;
+
+		for (i = gfn_start; i < gfn_end; i++) {
+			r = kvm_slot_gmem_is_mappable(memslot, i);
+			if (r)
+				goto out;
+		}
+	}
+out:
+	mutex_unlock(&kvm->slots_lock);
+
+	return r;
+}
+
+int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
+{
+	struct kvm_memslot_iter iter;
+	int r = 0;
+
+	mutex_lock(&kvm->slots_lock);
+
+	kvm_for_each_memslot_in_gfn_range(&iter, kvm_memslots(kvm), start, end) {
+		struct kvm_memory_slot *memslot = iter.slot;
+		gfn_t gfn_start, gfn_end;
+
+		if (!kvm_slot_can_be_private(memslot))
+			continue;
+
+		gfn_start = max(start, memslot->base_gfn);
+		gfn_end = min(end, memslot->base_gfn + memslot->npages);
+		if (WARN_ON_ONCE(start >= end))
+			continue;
+
+		r = kvm_slot_gmem_set_mappable(memslot, gfn_start, gfn_end);
+		if (WARN_ON_ONCE(r))
+			break;
+	}
+
+	mutex_unlock(&kvm->slots_lock);
+
+	return r;
+}
+
+int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
+{
+	struct kvm_memslot_iter iter;
+	int r = 0;
+
+	mutex_lock(&kvm->slots_lock);
+
+	kvm_for_each_memslot_in_gfn_range(&iter, kvm_memslots(kvm), start, end) {
+		struct kvm_memory_slot *memslot = iter.slot;
+		gfn_t gfn_start, gfn_end;
+
+		if (!kvm_slot_can_be_private(memslot))
+			continue;
+
+		gfn_start = max(start, memslot->base_gfn);
+		gfn_end = min(end, memslot->base_gfn + memslot->npages);
+		if (WARN_ON_ONCE(start >= end))
+			continue;
+
+		r = kvm_slot_gmem_clear_mappable(memslot, gfn_start, gfn_end);
+		if (WARN_ON_ONCE(r))
+			break;
+	}
+
+	mutex_unlock(&kvm->slots_lock);
+
+	return r;
+}
+
+#endif /* CONFIG_KVM_GMEM_MAPPABLE */
+
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
 static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
 				 void *data, int offset, int len)
-- 
2.48.0.rc2.279.g1de40edade-goog


