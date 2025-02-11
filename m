Return-Path: <linux-arm-msm+bounces-47560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B245A30B6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DB13AB9F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A03221DAB;
	Tue, 11 Feb 2025 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r2KswsQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F221E091
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275899; cv=none; b=BYqSd+M+fKdyIxqsRfVnTL2X6JSckZx/feYQihGq4ORQxyT3YAoXB2PG93QzMKJhYLgggv14dkOD1lq1f22XbhTSX5LDehq+wcP6zO3DJwmbL+PxYKPeAiH63dZptKhk/PqWkXvpaZf2m9TkarDPNFnxtb0JBI0KdeaN3l6gJ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275899; c=relaxed/simple;
	bh=/jq9wIAl0mpZ1a+FL0vch5bwDNTa3/JN51KjdveFuAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yr1DUJy2mQLbdcLYIBNbMlfxE2egvsbuYkZrXNHwFG6JdJhBMP9evOxWQTb1gfo6J2xTR5jf5MCse1jZlx72xyq0SPKsLS/zcuCeO32VWRsCj7HrnRYcu8XPKPBfbYzMkvh69Ya7km71A4CBx1roEeCZfSDJvybA6SdFaGQ/ErE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r2KswsQg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43935bcec0aso22507755e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275896; x=1739880696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kAdYjo7w1XuCwrHZHSlpYdtLm3u9gqqV2MfDowlzC6o=;
        b=r2KswsQgfhQ1APHK6Z8rVNmRmf02OZJE5AnOpbXdHZyuNVIeMuTXGp/UuPvk+sMpS1
         fQtRP4jd2mOzes/Nrj0qydnrYaA39Zi51Osmblww2FQbTorOlHx85Oc4GuU+Gk3JeN4u
         nEhh5K4dmxRKqi7/6+u/S4EvXGdpb3UW2JupqzB13sbU2fcqFl3ekhnTFIO1wBXC9m27
         n+5i1nWjiPxSQc2w9Nz6xg15tG+q2GgVfNbjMJRVY7ip8npK5cjLg7WtcNIf47H7My4G
         PCOKkRtO1p4rYFmZwCyq5mVLCvX6Ee8AmQrZQbQWMocUwpZPWMlZDm/wBVxf0UGCH6Dv
         3oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275896; x=1739880696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAdYjo7w1XuCwrHZHSlpYdtLm3u9gqqV2MfDowlzC6o=;
        b=mNzOVSOnQkYBuUxaLl2yzPxymxyVYcCixDRdnJmcuMLd5Wy90F9T3WemSNs7Yc8aPP
         AZe9hZJRzq7M0QSCeCGiAYIJrs/U/iX06YaX+GNwK/Lzn4d4YH+WwnR4ufKLe9b31dU2
         Uc5YEEYkhQ5gWcbeOEqqxcbh8iE+hoUCvRSZu252R6MrG2NVHDAH+U86waYT0SqWYWiA
         p3b34RcvYVrjXB8nYwrxlCdUQ1Wn1jdDX5AaFA7oC7xSKWddUd2OPhwxoXfG5RHBhr8w
         CfA1vGG2HMumuXaLQ0eKbVqE+KMlZDfUQEi8+cDlHVLGntcrp+1DWg+u69O0P9B0UiVO
         VvAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZP7v+4tqv0iZ4Gr2+NTGb1PffoLsoT9Lu+ROLiCX6KinFYBYbWL3XOOsa6k0su5Spspi73Ki7EJUgP4St@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5l77KWimtahBom46QjSRTMQEWFEbjiXEwkS2LpasHZBHdSNBz
	xGLmpStuDT1zIodDupYlA2Byga1oviYWQH5gOwKIg7st9xENz4eF2ODThH3zkYak4APoeYOt4A=
	=
X-Google-Smtp-Source: AGHT+IGhAIxPnSIYxIYDciFwkjwU21RN+iHch2esUCoX8117xYYfDRohfxX77fPgyaVseOuJnCqxQyk9YA==
X-Received: from wmpz19.prod.google.com ([2002:a05:600c:a13:b0:439:468e:a94b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1da7:b0:439:34e2:455f
 with SMTP id 5b1f17b1804b1-43934e24665mr117723345e9.12.1739275896121; Tue, 11
 Feb 2025 04:11:36 -0800 (PST)
Date: Tue, 11 Feb 2025 12:11:19 +0000
In-Reply-To: <20250211121128.703390-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250211121128.703390-4-tabba@google.com>
Subject: [PATCH v3 03/11] KVM: guest_memfd: Allow host to map guest_memfd() pages
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

Add support for mmap() and fault() for guest_memfd backed memory
in the host for VMs that support in-place conversion between
shared and private (shared memory). To that end, this patch adds
the ability to check whether the VM type has that support, and
only allows mapping its memory if that's the case.

Additionally, this behavior is gated with a new configuration
option, CONFIG_KVM_GMEM_SHARED_MEM.

Signed-off-by: Fuad Tabba <tabba@google.com>

---

This patch series will allow shared memory support for software
VMs in x86. It will also introduce a similar VM type for arm64
and allow shared memory support for that. In the future, pKVM
will also support shared memory.
---
 include/linux/kvm_host.h | 11 +++++
 virt/kvm/Kconfig         |  4 ++
 virt/kvm/guest_memfd.c   | 93 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8b5f28f6efff..438aa3df3175 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 }
 #endif
 
+/*
+ * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
+ * private memory is enabled and it supports in-place shared/private conversion.
+ */
+#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
+static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
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
index c6f6792bec2a..85467a3ef8ea 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -317,9 +317,102 @@ void kvm_gmem_handle_folio_put(struct folio *folio)
 {
 	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
 }
+
+static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
+{
+	struct kvm_gmem *gmem = file->private_data;
+
+	/* For now, VMs that support shared memory share all their memory. */
+	return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
+}
+
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
+	/* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
+	if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_folio;
+	}
+
+	/*
+	 * Only private folios are marked as "guestmem" so far, and we never
+	 * expect private folios at this point.
+	 */
+	if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
+		ret = VM_FAULT_SIGBUS;
+		goto out_folio;
+	}
+
+	/* No support for huge pages. */
+	if (WARN_ON_ONCE(folio_test_large(folio))) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_folio;
+	}
+
+	if (!folio_test_uptodate(folio)) {
+		clear_highpage(folio_page(folio, 0));
+		kvm_gmem_mark_prepared(folio);
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
+	if (!kvm_arch_gmem_supports_shared_mem(gmem->kvm))
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
 #endif /* CONFIG_KVM_GMEM_SHARED_MEM */
 
 static struct file_operations kvm_gmem_fops = {
+	.mmap		= kvm_gmem_mmap,
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
 	.fallocate	= kvm_gmem_fallocate,
-- 
2.48.1.502.g6dc24dfdaf-goog


