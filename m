Return-Path: <linux-arm-msm+bounces-51789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331BA6793B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE83189A106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109A121146B;
	Tue, 18 Mar 2025 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kTeCcvX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86A212D6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314862; cv=none; b=RAXgSlciIT+/E/Z+LMDNsGc5gfYoXIxN3omC6xEjAPbKY3sou52sa8ZRCDGJoiVepY37oGoweFMUoimW+U4GtH26tORnf8oNVZY+zYqfEqdLux5lUQ+UEG6c005HQhbqamRsPZb/oJfH08H34s8NU9TnrBRogfMCjerswXluoF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314862; c=relaxed/simple;
	bh=nukMnpo5hy9oJe7htxSYLAXzKXNYRN9Nkodg1PhI/fU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gd+kCQmHWYL6erYfpkplQbj028vUCD9naORXFcwBo4ku36P87UtGgcJHZbqiMlWxAHbbBcWrTHqNgIN27Hri5deh/aZIX55Q3vg94auoV+FSLAcr0rH9AY5yF3aKPHDQt4W0wulpO7qTW5liAm455l8KbtINJ7ddpog9fxtkKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kTeCcvX9; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43947a0919aso24738565e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314860; x=1742919660; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9KWHi/KBkZHmOxvUg1u2dLw8hruOCqp8/fshelQJPQ=;
        b=kTeCcvX9F0zulynzjuz71s38neWEGV/QOas8kjqCcl8hlPdwMjWMYu6U2HNui60A9d
         asPN6896fjAzN42Tco++6JL1Gcd/4Vt5Dhs/iq4AfApaKdVok5vQ5tVZRb5ZEFQfUd6U
         rDZ2Rhl40Tjcx0CWUs6U6OMLhAH9cO0meoCTCQbj4jTJ4zcH92L1wT2555LR8PPx0D7n
         XeX75K730KzTZTr8UUpND3/E6Y4KUJyZ2mq6quC4lebvyiWJTio05Bq9GdNwL36cOPpo
         i9YpLavnx7GsD8huMBaZFo4YJUN7TTWz5lmZdtxD2Y60LQFj2cDryxPvRevARkmPiijn
         vMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314860; x=1742919660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9KWHi/KBkZHmOxvUg1u2dLw8hruOCqp8/fshelQJPQ=;
        b=H5XW1fKUkUuL4gZy1C9TX54D1PL/zlauRtU2IuMMHLchejvs6X6CjWjxj3bDGYav2F
         3Mo4swDSvKcE3rC3/jWn//jAl0tjnXKIgT7PPR69h04KU70tjIcwPx5Laq81TOJN7Go1
         ipeDccw5M08xTmZhHW17nvw8xNKx+YKuHxUk+A45bNKJLf/t3DM1fGk70Jmln+UXPbiV
         IV7zIdiO1UuB3j85Sb/MuQHE8UF5b3qWte+LVCtp84dy0+GeNUSSOrh32QEMWf2SVV4n
         MytV5oCvGM5PRXjq88k21BOfq0p2KfhgCvOQH7q6ePby4gApGZ5C/yvGRRHga5+lIqKe
         2A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuOC6I++gwv2qAtiL/s6UuLsYeQ+TV7/MBSDWp5cQVAj1+frYmu4Yrz2uy7jDWEdjeOsug9Y27fWhUl+Br@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUZfWkQHg2N3u5Ogh83BZHZ3prN6owCGCpfWni2aI6LwJMZc8
	Nh6LcI2+Ckhpwc87anpJKUo5Sh6lf3bnk7I/MLlg5YUmRJV4E92Q1jDTR//YFCxtpXdnWSUVIw=
	=
X-Google-Smtp-Source: AGHT+IEh2X4kUYxpJwUkKLEJgfMN+mg0RefgQxFOkAM1n9rRoUkko5MREaX9qI+5+A7CeT0+SuksFzPCZg==
X-Received: from wmqe11.prod.google.com ([2002:a05:600c:4e4b:b0:43d:4038:9229])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:848d:b0:43d:94:cff0
 with SMTP id 5b1f17b1804b1-43d3b9dc3b0mr24262095e9.19.1742314859735; Tue, 18
 Mar 2025 09:20:59 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:20:45 +0000
In-Reply-To: <20250318162046.4016367-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318162046.4016367-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162046.4016367-7-tabba@google.com>
Subject: [PATCH v6 6/7] KVM: guest_memfd: Handle invalidation of shared memory
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

When guest_memfd backed memory is invalidated, e.g., on punching holes,
releasing, ensure that the sharing states are updated and that any
folios in a transient state are restored to an appropriate state.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 virt/kvm/guest_memfd.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 4fd9e5760503..0487a08615f0 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -117,6 +117,16 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
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
@@ -126,6 +136,7 @@ static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
 	unsigned long index;
 
 	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
+		struct file *file = READ_ONCE(slot->gmem.file);
 		pgoff_t pgoff = slot->gmem.pgoff;
 
 		struct kvm_gfn_range gfn_range = {
@@ -145,6 +156,16 @@ static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
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
@@ -509,6 +530,41 @@ static int kvm_gmem_offset_clear_shared(struct inode *inode, pgoff_t index)
 	return r;
 }
 
+/*
+ * Callback when invalidating memory that is potentially shared.
+ *
+ * Must be called with the filemap (inode->i_mapping) invalidate_lock held.
+ */
+static void kvm_gmem_offset_range_invalidate_shared(struct inode *inode,
+						    pgoff_t start, pgoff_t end)
+{
+	struct xarray *shared_offsets = &kvm_gmem_private(inode)->shared_offsets;
+	pgoff_t i;
+
+	rwsem_assert_held_write_nolockdep(&inode->i_mapping->invalidate_lock);
+
+	for (i = start; i < end; i++) {
+		/*
+		 * If the folio is NONE_SHARED, it indicates that it is
+		 * transitioning to private (GUEST_SHARED). Transition it to
+		 * shared (ALL_SHARED) and remove the callback.
+		 */
+		if (xa_to_value(xa_load(shared_offsets, i)) == KVM_GMEM_NONE_SHARED) {
+			struct folio *folio = folio = filemap_lock_folio(inode->i_mapping, i);
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
2.49.0.rc1.451.g8f38331e32-goog


