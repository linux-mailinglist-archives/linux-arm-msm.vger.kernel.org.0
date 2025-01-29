Return-Path: <linux-arm-msm+bounces-46536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A74A222C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F562165BD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D3F1E0DCA;
	Wed, 29 Jan 2025 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mpt5VL/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD591E0B86
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171412; cv=none; b=lCJlOQ3oWe+VXXbvyGk4iCOYyi3KBxJpAJ0sjXzpjJ7rZHFcszEhnxamRRs1klm56H3oDASC2X3jVjcxX1aGX0L8gWPtTAHFA45uChxP0kUBcOylOb5Dd0nDnQfpYRRmiVXH4ZQKCruiAaInvyYCnsTNi/ozpfnDbm3ChqfQ6Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171412; c=relaxed/simple;
	bh=HVcVTHFmQT/fykHPy7CdMOtBYayqFUquU8jKqytzw4Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uOqMr/hgs8jrEbcefBpXTaJr9aOL/EZcIDbVnxfI9bXRZZniw5KEat4zHaxWPxgdApmfIuL2SnlB130J0MCwcGDOe+EgfeuUzP0ai2NKXcDrqwfdAsYChyyyCV7KvEo0E9Fk/KVXp/lclHhAUxdqjy3j1KdXonvYd5QVPVSc0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mpt5VL/s; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3862a49fbdaso2559630f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171408; x=1738776208; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoVkPwaMvkLCkrMEK45Vw1CTJ2upgTYFUQnx7UT1Wys=;
        b=Mpt5VL/sAWIVG2jl/7zFkxU/sYgBW5Y8beCHy/fSIUow1OT446fLxA96qHilqUdOlZ
         H7ZbFSjxuLQtIbkO4eC6Ui3ysQOxowG/duNWseMRh/kmUL27uIqDK+qFCspnUcMg9Zit
         szTBXvnwTZ1Cxlx3eOPoHeFc4NhIB3h9UN0HUAhU2foNc4gptK8dffUugX9G+/21qKua
         abjnCg7B58Z9EJrkysZZy7oIyQga/eWkyzh0IrFLPDIBTDai7plLjw2XwzCzQdty9i9L
         HxIWCwmRf7wqSTbMmwcrSvgfnMZTVfejGQ61Av4WNgKDe1Uczxl6V1nlP515FKbgvaRt
         ogGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171408; x=1738776208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoVkPwaMvkLCkrMEK45Vw1CTJ2upgTYFUQnx7UT1Wys=;
        b=L/DIRwTOrOL+3m2K2uyIVQVeHtZIi1I30sPmAAaV79oCU2cSUAHnBeu6j0dXo+mzTd
         sIMH3ibgexD54MmxY9uqML78neR87BMliXLJ1pzmUeUyBOrg6TXpuiXkBpcJ7KV1F7Z8
         MBOVomat+Cb5HkagiibOFzhwTWsD5VWwpq7KzAnjsOFPiBYU7Pcnqu0I3HX/pe9+BSb2
         6sgjoed/M6OLuFeZo8ApaaR0FLc5W0aGUfiUT8z3WZQYdAtdBhErdPLYPnzFahiNXKAn
         dPTeZEsWklSjINA+iVkCFDlKbCN1z69robO0oQrjv5PFlgcp+bM3ICFgZZ35F/VJvyfn
         WIfg==
X-Forwarded-Encrypted: i=1; AJvYcCXEupCkdZefQOSidJTC/Iyzh2FWWaX5qdAVUnuYrkEeAQuDp7nB2y42iwvEYJXXIfmQlxWVPka2lD9HQFxc@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqqrcEmHnBSr48M88xuaSC//VQHpGBj4l8fOSSINBqg1bN0S+
	xIVNjvL0xSbWyRliqpgprZmJW5ouaiNUx2Xxcy1fwdiOFKL8n902xOCI35TEcJZMuECJDug2jQ=
	=
X-Google-Smtp-Source: AGHT+IFhvEin4XE4wsGkRNdDKMzEHI3B5ItG8XmtbU1PM70tgZsQHYBr2xJu8rB4jweNCcCb7JB0XXISUQ==
X-Received: from wmbez5.prod.google.com ([2002:a05:600c:83c5:b0:434:f9da:44af])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:154c:b0:38a:39ad:3e2f
 with SMTP id ffacd0b85a97d-38c5194c9femr3444938f8f.2.1738171408672; Wed, 29
 Jan 2025 09:23:28 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:12 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-4-tabba@google.com>
Subject: [RFC PATCH v2 03/11] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
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
 include/linux/kvm_host.h | 11 ++++++
 virt/kvm/Kconfig         |  4 +++
 virt/kvm/guest_memfd.c   | 77 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..408429f13bf4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -717,6 +717,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
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
index 47a9f68f7b24..86441581c9ae 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -307,7 +307,84 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
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
+	if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
+		ret = VM_FAULT_SIGBUS;
+		goto out_folio;
+	}
+
+	/* No support for huge pages. */
+	if (WARN_ON_ONCE(folio_nr_pages(folio) > 1)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_folio;
+	}
+
+	if (!folio_test_uptodate(folio)) {
+		clear_highpage(folio_page(folio, 0));
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
-- 
2.48.1.262.g85cc9f2d1e-goog


