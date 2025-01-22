Return-Path: <linux-arm-msm+bounces-45825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916FDA19526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2233AC227
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB522144C1;
	Wed, 22 Jan 2025 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mv2zG68L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD372144B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559665; cv=none; b=RX77Im6E0zOmUtuRZqBxum+fUZcRfd1AEaXV3+9oHOD1cdMzlX1s3SIayzJRdc7ghLKeVyZxBm+bOr7fej7gLjiyUkbbodwoD/8+chYg50RuzuN61oV92bn+zRjELLKko2dWlb4u3G3pDZPrfeDjoXtQLNTR9OHTwQZnbO8FZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559665; c=relaxed/simple;
	bh=YoLt3jg672qLkVcu7VIEZbT4qXMy3Xl6u3hot8yMq0w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ny47p5X1yPLV0FPejbx1PQTlczcRz9+F298p2X6gaQGZ8GnDWjPEy47dN/Szhq22kCfJavVOHIJB10wGSMfzyy5s7GrNUXkVUDXtXmgotO0r7jKsnuCWoyJcGgTGakdtSd1F8FZRlpETvdAzz0OzI2y0FJ8JsvEhUYYgIvpeOjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mv2zG68L; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so38965775e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737559662; x=1738164462; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDcetJFcXF4ZQue9UQkLlQm0kzILtlW6lFAnbaIvucU=;
        b=Mv2zG68Lw+N7vH2SpI9JFEsSNWgzbH01vusgC6Yc57RaziGQ2vgalOBgWpnS8z/+yY
         JLJdyrfPE5PwLBLkZWc4qbNtPCgean02lrIZP/+xBEI4sLxnyrGYdb3ZqatvIlWTQ6S4
         lGakXwR4hLlr3QoZYMNXox4BlZnaExc7msSSMGCeCiaocMdc4oU7597TZNhNPB7/Ygx9
         kJgKt51YUqD2aETH9oQXWbUeA0VmqOjQyCNubYSkaWzfEkrLrpRRpE5ZPFlu+rkz/bN0
         +1JQPOr+BTGXYc4eCBjtBafVM6IXCuWUtkJkP34Fv6lH0Cq05J+v+UwwamEU6krYV0s7
         ArDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737559662; x=1738164462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDcetJFcXF4ZQue9UQkLlQm0kzILtlW6lFAnbaIvucU=;
        b=cGSlYuhp12mPRCrwEfgHFEOUpaM2aOJYLMqgm3RbBs2yjwzL97qNja1QR5jDKPqimR
         PIBZH7vNE9+Q+qfThIX97Va5B/L8jyVHE8XZSvaMT4yDbQ4TaA7NDL1iKYq170pkZqTy
         2qJva0FaDQDGRQe3l7HxP4x3GRJNG592Ww51nKssoTUIC0Ajwh06Qrly2CJ8R0P3bU3W
         R3pm+SElVK0rAC3pZ4au+J/sKEgbZ6rTDK17uo90bJKtRONrrOCZzDWJ+M+EoQ90Kqqm
         KQJhqjw8B1ECwfYIyPWkbGqJCiVITplOHVqUMHj9KBVpekUJJH220qdhWVcWKRJW6BKf
         xDpA==
X-Forwarded-Encrypted: i=1; AJvYcCU9XZSlGeTei+RtSP2TOmlHzEPJHuDHQBzM0S9HZMHV995UsXcSjCxZly1+V2UIOwY8RfFvY3KL8Ed8BWcE@vger.kernel.org
X-Gm-Message-State: AOJu0YzLpB4MStL2gQ27Gv2vaLxKdDVlu7gDfn3p1pkMSAZc+ZTfoiE0
	P3PfPsqHwiSFzEgQs/g5qXKN5hjnORz7MOpHMEuaxBxgNxgYuK5lVTNfgC/Zphmw1pdmvymq3w=
	=
X-Google-Smtp-Source: AGHT+IF8KsDXB6MILYgdI4bjHbLtTHjfa5HGKAzChHRDB4DnJXkZq0oaXJyTUpB5YHGdtSJAjVRTemZsTA==
X-Received: from wmow21.prod.google.com ([2002:a05:600c:4755:b0:436:e755:a053])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5101:b0:434:f925:f5c9
 with SMTP id 5b1f17b1804b1-438913c85e0mr201044935e9.6.1737559662645; Wed, 22
 Jan 2025 07:27:42 -0800 (PST)
Date: Wed, 22 Jan 2025 15:27:30 +0000
In-Reply-To: <20250122152738.1173160-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250122152738.1173160-2-tabba@google.com>
Subject: [RFC PATCH v1 1/9] KVM: guest_memfd: Allow host to mmap guest_memfd() pages
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

Add support for mmap() and fault() for guest_memfd in the host
for VMs that support in place conversion between shared and
private. To that end, this patch adds the ability to check
whether the architecture has that support, and only allows mmap()
if that's the case.

Additionally, this is gated with a new configuration option,
CONFIG_KVM_GMEM_MAPPABLE.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +
 include/linux/kvm_host.h        | 11 +++++
 virt/kvm/Kconfig                |  4 ++
 virt/kvm/guest_memfd.c          | 71 +++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index e159e44a6a1b..c0e149bc1d79 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2206,6 +2206,8 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 #define kvm_arch_has_private_mem(kvm) false
 #endif
 
+#define kvm_arch_private_mem_inplace(kvm) false
+
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
 
 static inline u16 kvm_read_ldt(void)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..ebca0ab4c5e2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -717,6 +717,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 }
 #endif
 
+/*
+ * Arch code must define kvm_arch_private_mem_inplace if support for private
+ * memory is enabled it supports in-place conversion between shared and private.
+ */
+#if !defined(kvm_arch_private_mem_inplace) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
+static inline bool kvm_arch_private_mem_inplace(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..59400fd8f539 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config KVM_GMEM_MAPPABLE
+       select KVM_PRIVATE_MEM
+       bool
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 47a9f68f7b24..9ee162bf6bde 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -307,7 +307,78 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
+{
+	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct folio *folio;
+	vm_fault_t ret = VM_FAULT_LOCKED;
+
+	filemap_invalidate_lock_shared(inode->i_mapping);
+
+	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
+	if (IS_ERR(folio)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_filemap;
+	}
+
+	if (folio_test_hwpoison(folio)) {
+		ret = VM_FAULT_HWPOISON;
+		goto out_folio;
+	}
+
+	if (!folio_test_uptodate(folio)) {
+		unsigned long nr_pages = folio_nr_pages(folio);
+		unsigned long i;
+
+		for (i = 0; i < nr_pages; i++)
+			clear_highpage(folio_page(folio, i));
+
+		folio_mark_uptodate(folio);
+	}
+
+	vmf->page = folio_file_page(folio, vmf->pgoff);
+
+out_folio:
+	if (ret != VM_FAULT_LOCKED) {
+		folio_unlock(folio);
+		folio_put(folio);
+	}
+
+out_filemap:
+	filemap_invalidate_unlock_shared(inode->i_mapping);
+
+	return ret;
+}
+
+static const struct vm_operations_struct kvm_gmem_vm_ops = {
+	.fault = kvm_gmem_fault,
+};
+
+static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct kvm_gmem *gmem = file->private_data;
+
+	if (!kvm_arch_private_mem_inplace(gmem->kvm))
+		return -ENODEV;
+
+	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
+	    (VM_SHARED | VM_MAYSHARE)) {
+		return -EINVAL;
+	}
+
+	file_accessed(file);
+	vm_flags_set(vma, VM_DONTDUMP);
+	vma->vm_ops = &kvm_gmem_vm_ops;
+
+	return 0;
+}
+#else
+#define kvm_gmem_mmap NULL
+#endif /* CONFIG_KVM_GMEM_MAPPABLE */
+
 static struct file_operations kvm_gmem_fops = {
+	.mmap		= kvm_gmem_mmap,
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
 	.fallocate	= kvm_gmem_fallocate,
-- 
2.48.0.rc2.279.g1de40edade-goog


