Return-Path: <linux-arm-msm+bounces-50036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA8A4C97A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 18:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FBC017E49B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840BC22E410;
	Mon,  3 Mar 2025 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RdYlOTPR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416624CEE3
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021825; cv=none; b=P3aD5SmqEKjx3jhwxzTg0EZoIlrU8OvcBN4AdU1VuRRmJjHLmop+cUy60xt6WNPyHYwC8dHirwqFOQxl1JXVHcNIFostU6fBAiQ9yQDIB1B/zgjs+dz5wps3ruj/OqTe4lQwPsBZFgi3dMJglust4NNQIqH5nR3dbcZrzt8pqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021825; c=relaxed/simple;
	bh=5q3op/vr/0aA73x90j/SW+hw8Vc/Uz7wBgQMLMPuxSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QQJDjfIJ+s0qJsPOLjxkHrPB5gOoQkIuBKOvNDj/F07igpekqSTsyy8yJXCdEeAl4iWnBu1VIWq9QMF6DhHIrq6d/F6I6QnYCMc8y3pfGwW5FJ/W+o/tRKuZXrkV4BdAAZlovSVzytKPXIDbIUY2uLoSfZ1J27OWqhNlxAbmkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RdYlOTPR; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-390ddebcbd1so2920187f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741021822; x=1741626622; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEl5LoBVGArZ0Hko7f7NcM1d/VPAiCytVB+FzStXmAM=;
        b=RdYlOTPRfrgeZME3BJZFJJWwJlHtD8li/HPNM/WYlSrnEWzDx7UIMKNvyK6UQK9zeY
         2DmOYj7W1FYJXG+woijRyyHpPEfknWpU2Y2mZ/b3dtVuQY/CdRVh66+IitjJlwifVvc2
         ZSOjphiu0YvK/XatPiyl7jqEg8zjMDX3N7MrUX3J9B2y/ine7CwsUfzczd8QmE52hf5B
         K4880r1V6VeGo9AMQTwWGjKpCFJMRv/YZKT5HxF0PuyKW47Iu/7wM4rC+VPFwpXg+yV9
         YoRFs4jU/t0xJrT0FXJXEMCIrmhD5CoRs5Rjg8tGXo5tC0dLaGtKV+ptv7eDH6a0hteL
         OCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021822; x=1741626622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEl5LoBVGArZ0Hko7f7NcM1d/VPAiCytVB+FzStXmAM=;
        b=AtZCdreQKmXjATvuDZfRFFRDcdS999zfHrL02LzVS7qFRmOqkOHMlBjw+2c9fpyA5Y
         KK5p+WjaYn7mA54CpbCVO0cq0YTpVNj/GR9KH4VhoIWQT9PsiVVMte2AmdJjQ4d7FfeF
         FzJZjEvkdSKBTqKqB/Qb4cTPbPThtFEYHbC2hHMmo0YvLFqRgwT9hS9MuHSxcUo+trs0
         /I2d4PMgTfMQdLI3fAR8rGL+GSjy9+ZbVOpXxDk09sxrrWRIxl5kStwtrkd33h3kQHsr
         XU8m1UTh5EtSbqM4J3ddxbJ3N3cLMZP0YY5ZpxHRE5jyFmrS9pyfkNuwQ7H2Np5YMwju
         2nIg==
X-Forwarded-Encrypted: i=1; AJvYcCV5AtkqPQxu5WUKjbXq8genNXx0oAfDDs2i+B+juz++tbdiiqYPSpkj6zQfUJB2KZNOL4VL0OaapWwYuSwO@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnNON8bOTSf142+9NbcFzxpMP41x23WvrLLSi7+EdUcvDovoE
	Gu0iHesRs2vivb7if9jvHpq2TP1CaMQzu4wFy5bpwxl7qxrm+cR3qVoCuVWYW0J1DRUnVhQ8hw=
	=
X-Google-Smtp-Source: AGHT+IHgoYpjT7qfoJb2A88YneKFoylvHGn17OMTHx97hw2eQNXCP3h043pd8jbo3m8XgXFe11agjUZICw==
X-Received: from wmgg5.prod.google.com ([2002:a05:600d:5:b0:43b:c99a:4af8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1ac9:b0:391:13ef:1b1b
 with SMTP id ffacd0b85a97d-39113ef1e57mr1340632f8f.30.1741021821960; Mon, 03
 Mar 2025 09:10:21 -0800 (PST)
Date: Mon,  3 Mar 2025 17:10:07 +0000
In-Reply-To: <20250303171013.3548775-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303171013.3548775-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250303171013.3548775-4-tabba@google.com>
Subject: [PATCH v5 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
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

Add support for mmap() and fault() for guest_memfd backed memory
in the host for VMs that support in-place conversion between
shared and private. To that end, this patch adds the ability to
check whether the VM type supports in-place conversion, and only
allows mapping its memory if that's the case.

Also add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
indicates that the VM supports shared memory in guest_memfd, or
that the host can create VMs that support shared memory.
Supporting shared memory implies that memory can be mapped when
shared with the host.

This is controlled by the KVM_GMEM_SHARED_MEM configuration
option.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h |  11 ++++
 include/uapi/linux/kvm.h |   1 +
 virt/kvm/guest_memfd.c   | 105 +++++++++++++++++++++++++++++++++++++++
 virt/kvm/kvm_main.c      |   4 ++
 4 files changed, 121 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7788e3625f6d..2d025b8ee20e 100644
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
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 45e6d8fca9b9..117937a895da 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -929,6 +929,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_GMEM_SHARED_MEM 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2aa6bf24d3a..4291956b51ae 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -312,7 +312,112 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
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
+		switch (PTR_ERR(folio)) {
+		case -EAGAIN:
+			ret = VM_FAULT_RETRY;
+			break;
+		case -ENOMEM:
+			ret = VM_FAULT_OOM;
+			break;
+		default:
+			ret = VM_FAULT_SIGBUS;
+			break;
+		}
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
+#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
+
 static struct file_operations kvm_gmem_fops = {
+	.mmap		= kvm_gmem_mmap,
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
 	.fallocate	= kvm_gmem_fallocate,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ba0327e2d0d3..38f0f402ea46 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4830,6 +4830,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	case KVM_CAP_GMEM_SHARED_MEM:
+		return !kvm || kvm_arch_gmem_supports_shared_mem(kvm);
 #endif
 	default:
 		break;
-- 
2.48.1.711.g2feabab25a-goog


