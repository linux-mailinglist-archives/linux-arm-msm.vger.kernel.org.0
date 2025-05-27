Return-Path: <linux-arm-msm+bounces-59591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB9AC59C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6C281BC0B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E4C28368B;
	Tue, 27 May 2025 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmePf3YE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97DB28033B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368988; cv=none; b=T3McJ10yIb52Vp1d5ZrH8HWQyuvHeNtYXjoJGL07sm4AuSlts+W8Lsj+HkN5jAzxBWlld0DX8RKzmwbuziwpAvmLiKia+ZMg0JRwoaxjCZ4DgHklxF5EGPBfbvHKCO0qiKxcQQSBusPqEHmip2j0MZAhyYQ18mXSR3E4Y3/er8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368988; c=relaxed/simple;
	bh=ToeqWmtFdT7WRUcr7H559dqp9JvTbbU7zFXWYMbde+A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sEWRcxEd5uuQGK8mCFDntxAqJZ0AjAi8aantT09FLVl3HoxynHSmcQh1f551ykPJRMXj1xFsGqs5luTJx38G9PFa9b0kdi3+SO2IDKFF1X4SbmMgZA2UKPEI7os7otKji1D9Ff11BqqW3uJOrvg3cAJcFHz8XkLh9BattDs93XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmePf3YE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ea256f039so29029105e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368985; x=1748973785; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vX7z/HyuGmtzDlVVFq4xd5F5VW4gqdbtxi0TML5OdT8=;
        b=OmePf3YEKWaba2hBegrE4uXQXJHGEODThC29svQswBGFDZtLK+SZ7/keAf01fIiUcN
         0bc8zC4ulzWDjOVkJBE+GBEtw8u3Yc4RExjBYDGudlHX32g81bXNte2aHGAbmFfTYCav
         x4VEGYrkAx5H5/phsY0ysK3dDzlR7dYKQ0U4ByHhUYTbtp62bLqAygfqISAspwk4pcFu
         fHDjAbpFUi0Li6ConUnfxCWu5yCkJKxdcVlv5AQzV7WAGvUNdSessN/LE0QPXeBqhBU0
         AHubtqosPkJiIECJNT6YWXZL+XrqMwavw3yXvqFl6JFO90doqeJpqFypauCDBWT/G0zc
         Tp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368985; x=1748973785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX7z/HyuGmtzDlVVFq4xd5F5VW4gqdbtxi0TML5OdT8=;
        b=YNBCNcrdfMtYNrUxri6h4iA4Br8eCEWnThRI2jrG0WviVrrbMHUVXwPjsJGyBQ9AiX
         x5ptRyDYioMfXVn+7xwA6IchD6tu/togf4LUBCh25T7X4i46D+C44odq/cwLs9lhjm6C
         BUF2m+jXZmJsDa5y8bVtho3LjeFtJDmmzOmGvkceMnvdpJ2Fbw7f7r1hokKCK4JW0zLw
         zinHvZa8eFrYHCz4RmEp36/Qxl0lsFtoYTS6RY9Y8X8Uq/jmrOSJ30JVV/OHbxq5gRbB
         3v7tfCsiIgO/4JwlsAR2SBQNOTMO4RxrY3pgoKQHb6a3TfGu5WRlvBBonYVYT8Ud8qN7
         Yo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQNZp57oHZ3ImD08/HhozsR/olsDrQ7Rq24aI8TTyBuLfZ180sVJaiA3yH7GXuHaeumosKXQeNp8DIIttC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Lqq3l7QOuEPLHMivzI65Icc9NNPSIneHiRpO5F9gUg2tPaoh
	zIPUnC4AIqhdyMIjZHRkhokJSUS2YU1L+1tBWO9e8S1k8dk8aUThk8A/7jn3yP338DaozU2fjD7
	1Tw==
X-Google-Smtp-Source: AGHT+IHm2QpLuppopnrLbiEdYMpqiHL9Z+DX8uPYQe0kFHM4Ap6KdDfZYYe7oYWFnkWPUHOflJMK8/QPyw==
X-Received: from wmbbi21.prod.google.com ([2002:a05:600c:3d95:b0:43c:ebbe:4bce])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f43:b0:442:e0e0:250
 with SMTP id 5b1f17b1804b1-44c933ed7efmr124297415e9.29.1748368984939; Tue, 27
 May 2025 11:03:04 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:38 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-10-tabba@google.com>
Subject: [PATCH v10 09/16] KVM: guest_memfd: Track shared memory support in memslot
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
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Track whether a guest_memfd-backed memslot supports shared memory within
the memslot itself, using the flags field. The top half of memslot flags
is reserved for internal use in KVM. Add a flag there to track shared
memory support.

This saves the caller from having to check the guest_memfd-backed file
for this support, a potentially more expensive operation due to the need
to get/put the file.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 ++++++++++-
 virt/kvm/guest_memfd.c   |  8 ++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ba83547e62b0..edb3795a64b9 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -54,7 +54,8 @@
  * used in kvm, other bits are visible for userspace which are defined in
  * include/uapi/linux/kvm.h.
  */
-#define KVM_MEMSLOT_INVALID	(1UL << 16)
+#define KVM_MEMSLOT_INVALID		(1UL << 16)
+#define KVM_MEMSLOT_SUPPORTS_SHARED	(1UL << 17)
 
 /*
  * Bit 63 of the memslot generation number is an "update in-progress flag",
@@ -2502,6 +2503,14 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
 
+static inline bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
+{
+	if (!IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
+		return false;
+
+	return slot->flags & KVM_MEMSLOT_SUPPORTS_SHARED;
+}
+
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
 {
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 5d34712f64fc..9ded8d5139ee 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -555,6 +555,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	loff_t size = slot->npages << PAGE_SHIFT;
 	unsigned long start, end;
 	struct kvm_gmem *gmem;
+	bool supports_shared;
 	struct inode *inode;
 	struct file *file;
 	int r = -EINVAL;
@@ -578,8 +579,9 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	    offset + size > i_size_read(inode))
 		goto err;
 
-	if (kvm_gmem_supports_shared(inode) &&
-	    !kvm_arch_supports_gmem_shared_mem(kvm))
+	supports_shared = kvm_gmem_supports_shared(inode);
+
+	if (supports_shared && !kvm_arch_supports_gmem_shared_mem(kvm))
 		goto err;
 
 	filemap_invalidate_lock(inode->i_mapping);
@@ -600,6 +602,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 */
 	WRITE_ONCE(slot->gmem.file, file);
 	slot->gmem.pgoff = start;
+	if (supports_shared)
+		slot->flags |= KVM_MEMSLOT_SUPPORTS_SHARED;
 
 	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
-- 
2.49.0.1164.gab81da1b16-goog


