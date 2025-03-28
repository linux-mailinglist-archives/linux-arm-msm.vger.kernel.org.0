Return-Path: <linux-arm-msm+bounces-52786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B659BA74DD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120AF188EC16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73801D88D7;
	Fri, 28 Mar 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lfIR6uGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D21DA0E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175909; cv=none; b=J3u0dJRlHLbZVgzI7LL8o3Gru3biZeASHpO6dfZPNBFG/C6KVQ6FUtuWYiBfz16+jxPDoEOV3gYSu8NC3kw5cyMkjRL12uwt8ToKpDrWm+PNOX8yCA6Z33Itvzub8XwwDyDriPpBcAfWdYpUelPMT9495pBPd0pBQhRln0h2+SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175909; c=relaxed/simple;
	bh=ywIBAiOIC5j43YjmiU9xRCcK2knCGG5rRQ+rKgEbt1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cc5XvyfFKisZWGfOcy2ixeS68GTfwBO8H88xGD7LhefmJmLVCQXBOfs2Q/xdH5lQbMiDX+zF8yqQzSexQNVpa9jGLRaE80xtl5qY+XrmGYJplyo9fgsCGvwMvo+dfnVl+r4ZNSq74hHaoGuzfouEXSKsguuwtX2u5JYYQhUbTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lfIR6uGP; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d08915f61so14529665e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743175906; x=1743780706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3RfnojiUTVQNcoqz4Ca2o/3ssUHr85YnTpv1JDxiLk=;
        b=lfIR6uGPfN2HOTgxBayHKok3VaXEvBPAySJRHP9nep9xHAxnjHA8EjNXO958ZFmkRo
         TTOhptQQoZIl+nXOMT58OJKWuS3oua26LqeF6VAcZ3F7AkDG/UqkvRnhlsTR6gyPUGUE
         7uh99DPOIAht2Qvp6v85vsP697K5SkuBccOYxv9UPaR1gt1jJorqGnTqcrLUYOLMpqBC
         Ak1q0shoC+4X+oTwLGc2rHDLPUhgcQ9vJW0qTkkO1w+u+6QeyogVnsr2yQxN4NsBWepT
         CffPfPTds3uc//bA4rWMQKahHcGsqcrRmYSquhBa4aBZecAA8QPZ/iIhVcVQXLxhKvAZ
         nRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175906; x=1743780706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3RfnojiUTVQNcoqz4Ca2o/3ssUHr85YnTpv1JDxiLk=;
        b=O5crVb99bh6iegXFSmI55kmmyFiepaCZqm0lv7zVzoOjQZt3SRl5pwgk9Y4JRJPRZO
         0nwpc8A7gecwtATk4613AZzzYH40Tzkg7Kx+SN9wb5gAZdpMk/p8P0x1KzBOqEOFmx2a
         eFcqMocgxjBxxdolLNwRuXet092Dg6jGDGaLwtCsoIOk8FLRnKk2yAOx9jdc5/Ybh+d2
         AiOxG7fj0yUl9Le6hbMqByJjdOUJexlaFeyOLuS5n8x3NDavR9HmWd3+rfvv0M69jDc0
         eLTOD1dlKl0ef8kscXCzgde+E34ADAA61LblfwAHy76uW7dPS9fHUBnOY2Nk8ytQL5RK
         vlYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXctMQL0tOZplB7TXyR5+YfetGG3iVLTZ0KVKqZOd95LywOVvUFhPiwVX/NjPgvDOyRx+TAwNzOcgE5SKM@vger.kernel.org
X-Gm-Message-State: AOJu0YzfwHw26ghWY4ZNLA65aj2ul0Jp/bOCbz6mgllF5hL4VbtwYKsQ
	VcMyiLeZWwP4m0YWcYfUW4jEVn9VYq8Dl9lUSsgs8qh0ozSkaszJf8PlxW5sP2+q7GvaBZtQ+g=
	=
X-Google-Smtp-Source: AGHT+IH5o8XkmQE16RpA7JAnMr7kPBXwGpQkyy1fEQJArMIbsDhiWMuAir53k+JzjSmedSowM4jfKUSd+w==
X-Received: from wmbay1.prod.google.com ([2002:a05:600c:1e01:b0:43d:9f1:31a9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e52:b0:43c:fc04:6d34
 with SMTP id 5b1f17b1804b1-43d9489777emr25843765e9.20.1743175906450; Fri, 28
 Mar 2025 08:31:46 -0700 (PDT)
Date: Fri, 28 Mar 2025 15:31:32 +0000
In-Reply-To: <20250328153133.3504118-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328153133.3504118-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328153133.3504118-7-tabba@google.com>
Subject: [PATCH v7 6/7] KVM: guest_memfd: Handle invalidation of shared memory
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

When guest_memfd backed memory is invalidated, e.g., on punching holes,
releasing, ensure that the sharing states are updated and that any
folios in a transient state are restored to an appropriate state.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 virt/kvm/guest_memfd.c | 57 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index ce19bd6c2031..eec9d5e09f09 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -118,6 +118,16 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 	return filemap_grab_folio(inode->i_mapping, index);
 }
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+static void kvm_gmem_offset_range_invalidate_shared(struct inode *inode,
+						    pgoff_t start, pgoff_t end);
+#else
+static inline void kvm_gmem_offset_range_invalidate_shared(struct inode *inode,
+							   pgoff_t start, pgoff_t end)
+{
+}
+#endif
+
 static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
 				      pgoff_t end)
 {
@@ -127,6 +137,7 @@ static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
 	unsigned long index;
 
 	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
+		struct file *file = READ_ONCE(slot->gmem.file);
 		pgoff_t pgoff = slot->gmem.pgoff;
 
 		struct kvm_gfn_range gfn_range = {
@@ -146,6 +157,16 @@ static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
 		}
 
 		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
+
+		/*
+		 * If this gets called after kvm_gmem_unbind() it means that all
+		 * in-flight operations are gone, and the file has been closed.
+		 */
+		if (file) {
+			kvm_gmem_offset_range_invalidate_shared(file_inode(file),
+								gfn_range.start,
+								gfn_range.end);
+		}
 	}
 
 	if (flush)
@@ -512,6 +533,42 @@ static int kvm_gmem_offset_clear_shared(struct inode *inode, pgoff_t index)
 	return r;
 }
 
+/*
+ * Callback when invalidating memory that is potentially shared.
+ *
+ * Must be called with the offsets_lock write lock held.
+ */
+static void kvm_gmem_offset_range_invalidate_shared(struct inode *inode,
+						    pgoff_t start, pgoff_t end)
+{
+	struct xarray *shared_offsets = &kvm_gmem_private(inode)->shared_offsets;
+	rwlock_t *offsets_lock = &kvm_gmem_private(inode)->offsets_lock;
+	pgoff_t i;
+
+	lockdep_assert_held_write(offsets_lock);
+
+	for (i = start; i < end; i++) {
+		/*
+		 * If the folio is NONE_SHARED, it indicates that it's
+		 * transitioning to private (GUEST_SHARED). Transition it to
+		 * shared (ALL_SHARED) and remove the callback.
+		 */
+		if (xa_to_value(xa_load(shared_offsets, i)) == KVM_GMEM_NONE_SHARED) {
+			struct folio *folio = filemap_lock_folio(inode->i_mapping, i);
+
+			if (!WARN_ON_ONCE(IS_ERR(folio))) {
+				if (folio_test_guestmem(folio))
+					kvm_gmem_restore_pending_folio(folio, inode);
+
+				folio_unlock(folio);
+				folio_put(folio);
+			}
+		}
+
+		xa_erase(shared_offsets, i);
+	}
+}
+
 /*
  * Marks the range [start, end) as not shared with the host. If the host doesn't
  * have any references to a particular folio, then that folio is marked as
-- 
2.49.0.472.ge94155a9ec-goog


