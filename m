Return-Path: <linux-arm-msm+bounces-64193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F4BAFE6C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6E13BCB0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3D3290D94;
	Wed,  9 Jul 2025 11:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2gxHKIhR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5328FFDA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058809; cv=none; b=sS7Ca25i00IIrATfCx2t24C+yj/krSTfxTQ8N6BcoyDjXZmhMTQ6vAA6sVpTxJpPay6E2ZbtBU6LY9lQGEH9E9xBxX+cuVMsYshpUVtBtKGwijJ/fntIrBo72PyikFggElCafs2zyL0rA5VBrpM7qsdieJJsRcFrs726GFbGI34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058809; c=relaxed/simple;
	bh=Wn5IYA6iQzAfA5V86iaR1MTpw7yqM6EGup8ZXLDjc8E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TPYuZx/Tzex/May93ekLq4SqjR5vYfQMoY9p7epi1NqNwrZeCBAPBeBiMhaOWYcEDNJjCtcgd0P5wZZ5kOshFgFq76pHleJYvevd7DoVsmTwSeuv2uQjyW9k7u1b+ixdcx0ty7OJPuVdaJJCXeA8IacQ3xrUvsLpzKJDM1f28HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2gxHKIhR; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45311704d22so31591985e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058805; x=1752663605; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad7Mm+6p+u6M0V7ZHUKz/9Le+c/L7LqCq7GeLa1zflU=;
        b=2gxHKIhRL6ZQ7f3Yc/1WimFH+U3kkhVioPRZw234fMlvFrnzX/DGjc8Xq8jJfHS7gP
         +V+GkUJRhP9L2F/laA0DgRFZof6zhgLZUZRBg3Glfj+Ghl5JWlwp2zF3AZVragomW3yf
         1PRtlIkIJ3Pa9N04KVdRKQc9j5ds28RrZWYiwpE5Q/xHd/If/PAZ6umKCKQe0SZPZZo1
         bkSQXj3/98w9VfdcW/IiJcqJOClCnr/vEY1LViGl0QqeVO8gY+EjUCjojQ5ljVIbr1cl
         YXxgHkyxgyVwR4uL3iXzEC2RqsXdRAp9ERJ4uEsVXCjAjj9P/1ZjQ7Dnm4jz0UgDETBg
         VBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058805; x=1752663605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad7Mm+6p+u6M0V7ZHUKz/9Le+c/L7LqCq7GeLa1zflU=;
        b=Lc3lYIIk4nWS43AJHVn6nQ/QMYmWQYUwZeqrG11uJQXng6do9bU/HSG1XLCRb2a54X
         l5bVU7kCyK56O/cpgcmGhzkdXrMRwKSDWNmluRfz7SnBRoYuyq+uvX2U6NlP5ih6amlC
         izv3ZbOmbQxKkSMHEcaVGFC6NK+KZSeVXthQiBPGcnE1dcNaAWxEtC2mptvI9rixxP+4
         q7zKuZZPDqN8JB78RiAAYGc3ShtOpZWrw/YvkcrJ2N7EzlKY5hGgjJczJtEnMyPjjk8Q
         WZe5y3vz9wrNOAvy9Z/yWiIFQLCFGijC7sqBdSV7NWzhFxzoO4C/wIlAzZ0w2ThRhnLe
         Buaw==
X-Forwarded-Encrypted: i=1; AJvYcCVqBPZwkdufitz7njH23LvW5W42lyJhFTr7uMI3rctXlzPAiiG8UiEPUH0NKTky6GnyH8YVH6mqOu9QtS3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzSye6OoqlvXoqt/kmXvdqumCIiTRVjLfD0NvMTyZLAHooi28MN
	LGNiufKfFfAFUFE65uF2yADVSzdC29+tuAcVCargIe78a0b/tjbPGO/YhjB1VDtLNQkxs13PTUF
	gXw==
X-Google-Smtp-Source: AGHT+IGh+wnQIadg6Z+OkUHfxqW5PAvwOn8c3zjiDCy2vBs+5Oj5lp5BjdDYCMOWgxyqCITvvo4f4KsLcw==
X-Received: from wmben10.prod.google.com ([2002:a05:600c:828a:b0:43d:1f28:b8bf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c9e:b0:43e:bdf7:7975
 with SMTP id 5b1f17b1804b1-454d60f20e1mr13785845e9.32.1752058805470; Wed, 09
 Jul 2025 04:00:05 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:34 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-9-tabba@google.com>
Subject: [PATCH v13 08/20] KVM: guest_memfd: Allow host to map guest_memfd pages
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev
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

Introduce the core infrastructure to enable host userspace to mmap()
guest_memfd-backed memory. This is needed for several evolving KVM use
cases:

* Non-CoCo VM backing: Allows VMMs like Firecracker to run guests
  entirely backed by guest_memfd, even for non-CoCo VMs [1]. This
  provides a unified memory management model and simplifies guest memory
  handling.

* Direct map removal for enhanced security: This is an important step
  for direct map removal of guest memory [2]. By allowing host userspace
  to fault in guest_memfd pages directly, we can avoid maintaining host
  kernel direct maps of guest memory. This provides additional hardening
  against Spectre-like transient execution attacks by removing a
  potential attack surface within the kernel.

* Future guest_memfd features: This also lays the groundwork for future
  enhancements to guest_memfd, such as supporting huge pages and
  enabling in-place sharing of guest memory with the host for CoCo
  platforms that permit it [3].

Therefore, enable the basic mmap and fault handling logic within
guest_memfd. However, this functionality is not yet exposed to userspace
and remains inactive until two conditions are met in subsequent patches:

* Kconfig Gate (CONFIG_KVM_GMEM_SUPPORTS_MMAP): A new Kconfig option,
  KVM_GMEM_SUPPORTS_MMAP, is introduced later in this series. This
  option gates the compilation and availability of this mmap
  functionality at a system level. While the code changes in this patch
  might seem small, the Kconfig option is introduced to explicitly
  signal the intent to enable this new capability and to provide a clear
  compile-time switch for it. It also helps ensure that the necessary
  architecture-specific glue (like kvm_arch_supports_gmem_mmap) is
  properly defined.

* Per-instance opt-in (GUEST_MEMFD_FLAG_MMAP): On a per-instance basis,
  this functionality is enabled by the guest_memfd flag
  GUEST_MEMFD_FLAG_MMAP, which will be set in the KVM_CREATE_GUEST_MEMFD
  ioctl. This flag is crucial because when host userspace maps
  guest_memfd pages, KVM must *not* manage the these memory regions in
  the same way it does for traditional KVM memory slots. The presence of
  GUEST_MEMFD_FLAG_MMAP on a guest_memfd instance allows mmap() and
  faulting of guest_memfd memory to host userspace. Additionally, it
  informs KVM to always consume guest faults to this memory from
  guest_memfd, regardless of whether it is a shared or a private fault.
  This opt-in mechanism ensures compatibility and prevents conflicts
  with existing KVM memory management. This is a per-guest_memfd flag
  rather than a per-memslot or per-VM capability because the ability to
  mmap directly applies to the specific guest_memfd object, regardless
  of how it might be used within various memory slots or VMs.

[1] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[2] https://lore.kernel.org/linux-mm/cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com
[3] https://lore.kernel.org/all/c1c9591d-218a-495c-957b-ba356c8f8e09@redhat.com/T/#u

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Acked-by: David Hildenbrand <david@redhat.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 13 +++++++
 include/uapi/linux/kvm.h |  1 +
 virt/kvm/Kconfig         |  4 +++
 virt/kvm/guest_memfd.c   | 73 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1ec71648824c..9ac21985f3b5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -740,6 +740,19 @@ static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
 }
 #endif
 
+/*
+ * Returns true if this VM supports mmap() in guest_memfd.
+ *
+ * Arch code must define kvm_arch_supports_gmem_mmap if support for guest_memfd
+ * is enabled.
+ */
+#if !defined(kvm_arch_supports_gmem_mmap)
+static inline bool kvm_arch_supports_gmem_mmap(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 37891580d05d..c71348db818f 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1592,6 +1592,7 @@ struct kvm_memory_attributes {
 #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
+#define GUEST_MEMFD_FLAG_MMAP	(1ULL << 0)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 559c93ad90be..fa4acbedb953 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -128,3 +128,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_GMEM
+
+config KVM_GMEM_SUPPORTS_MMAP
+       select KVM_GMEM
+       bool
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 6db515833f61..07a4b165471d 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -312,7 +312,77 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+static bool kvm_gmem_supports_mmap(struct inode *inode)
+{
+	const u64 flags = (u64)inode->i_private;
+
+	if (!IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP))
+		return false;
+
+	return flags & GUEST_MEMFD_FLAG_MMAP;
+}
+
+static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
+{
+	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct folio *folio;
+	vm_fault_t ret = VM_FAULT_LOCKED;
+
+	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
+		return VM_FAULT_SIGBUS;
+
+	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
+	if (IS_ERR(folio)) {
+		int err = PTR_ERR(folio);
+
+		if (err == -EAGAIN)
+			return VM_FAULT_RETRY;
+
+		return vmf_error(err);
+	}
+
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
+	return ret;
+}
+
+static const struct vm_operations_struct kvm_gmem_vm_ops = {
+	.fault = kvm_gmem_fault_user_mapping,
+};
+
+static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	if (!kvm_gmem_supports_mmap(file_inode(file)))
+		return -ENODEV;
+
+	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
+	    (VM_SHARED | VM_MAYSHARE)) {
+		return -EINVAL;
+	}
+
+	vma->vm_ops = &kvm_gmem_vm_ops;
+
+	return 0;
+}
+
 static struct file_operations kvm_gmem_fops = {
+	.mmap		= kvm_gmem_mmap,
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
 	.fallocate	= kvm_gmem_fallocate,
@@ -463,6 +533,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (kvm_arch_supports_gmem_mmap(kvm))
+		valid_flags |= GUEST_MEMFD_FLAG_MMAP;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-- 
2.50.0.727.gbf7dc18ff4-goog


