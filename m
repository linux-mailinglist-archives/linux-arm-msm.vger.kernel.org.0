Return-Path: <linux-arm-msm+bounces-45441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69407A1544D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67273A68D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86361A238B;
	Fri, 17 Jan 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oGThVS7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AF1A08AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131422; cv=none; b=buZZB2Xf8Da8hyK2s+hlR6YHxQQpwtHu2187HhNni8k/iXmDdIeeRiEGpUoO16JL+rZQf7MPrgujDnXQqUMj0O//b7C2w9CJmJ8uZlvv6+vGEdViWN7akF0jM9KGRLeNWJYSVtjMpFZHQs8tzcTkUc+6QRHb14WPd4rvKD66SKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131422; c=relaxed/simple;
	bh=6/+Ug9uyKpVUjARK6pkltQPUgRaBwds3muKvMKao4FU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=If1hE1tFk39eaicxA1faqfeu6MaclnGI4LYtECrDQ4OhEaeFZB6/TECL7PEtVJu+UqIyiYt4kKSNgUzhD2I1mkZWK4y7WrXmfp8A1xsVqgwRmqwPBEz+eZx84lTK4asNhxZ2hbaZm9E+PlaIR2mgByQAK2Jj1PBqeSuwF/orvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oGThVS7a; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-385d7611ad3so1438853f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131419; x=1737736219; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdAdQseomovuuCB1UMT0wPLl0A/JMqD3/SFKXOl1KPs=;
        b=oGThVS7aO4tLyCF8sHUdvOVbIPYpjKBT4n7/kIj1Rfc5kuu1Ikcvj4mcDi4/8/o2Sv
         pi/63mDHOIRqSmqr2hJG+n+rKnR9HMjHWP3wQNKX+Ht1tko4NrLFBNZmL4naite/VzO+
         cndIchTAv3/v2Inca0cTITv2qtduRMN9pkll+XC9lAgW6JVt+dMR4rIXaOs1QwGXETsL
         clzqid3gK26DpJwpEPv0AOPwli6hKy3E+/9fKbDPF7NXwPed/NloYYJq5rteMd7Rbje1
         Ixxc5bll73UKB6/VZBDz2sgJqIiWCb6fC//wUqSmDTznc0BkqBM2jOxZq+UATVI0e5/O
         kldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131419; x=1737736219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdAdQseomovuuCB1UMT0wPLl0A/JMqD3/SFKXOl1KPs=;
        b=OWcBmbwN85lM17YW80dYgvZ3JVVHqLQ9ADKEaEv9XYV4Nvpz3gtEMLutHt5GR/Q0Wt
         2ZCZt66u4TdGShEG8lgL7PY49kg74PxcUfUxcrZTn07AoRC6Qn3/JcGLwbZaczsP8gta
         xgcJWOqE/6vwxFH1X4zSj9seDVMopIZUlGZVw2PtCVzMhIV3Ayde4jGPjmrYRqApKrJZ
         Io4a7so9Y641gTnu3PqmobwvUzj9OhfhwCEFDDUIo/2u8NH68ipwThclijk3ih6myxVZ
         t26c1VuB+headcSq0p+YEAZQFofpespTLRe0EIif4KcShVznE57KAq5oP/QnQF6jzT6Z
         Rs5g==
X-Forwarded-Encrypted: i=1; AJvYcCWli7LA0rn60XpJlb7oPnLcitUUlgXpq6MhnlQysjT5Ix+ECW2s9pAhhecT0suv4HEK5Zxf3j1BhtnXOlCZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+/2P8uvIKqE/aIXFLm5FB58OfEA9fyeqRmWRTO7SLhSk5gD/
	iiS2fI05XPSLxYiO6kPt90OczacKcq2lNMmdAsu/5eM+Kv91LBFSG5HC+NvBBvXdE2KlpV67ow=
	=
X-Google-Smtp-Source: AGHT+IGoCiOpQZ+XPGh3+m7uM/r7mJz3ngOqFFIWL6Sni4tqd4XQp6adGu7aEk+5zToL2X1ioL4lGzVu/A==
X-Received: from wmbjh12.prod.google.com ([2002:a05:600c:a08c:b0:434:f5f3:3314])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1a8c:b0:38b:ed6f:f00f
 with SMTP id ffacd0b85a97d-38bf56635a1mr2878108f8f.17.1737131418732; Fri, 17
 Jan 2025 08:30:18 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:53 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-8-tabba@google.com>
Subject: [RFC PATCH v5 07/15] KVM: guest_memfd: Allow host to mmap
 guest_memfd() pages when shared
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

Add support for mmap() and fault() for guest_memfd in the host.
The ability to fault in a guest page is contingent on that page
being shared with the host.

The guest_memfd PRIVATE memory attribute is not used for two
reasons. First because it reflects the userspace expectation for
that memory location, and therefore can be toggled by userspace.
The second is, although each guest_memfd file has a 1:1 binding
with a KVM instance, the plan is to allow multiple files per
inode, e.g. to allow intra-host migration to a new KVM instance,
without destroying guest_memfd.

The mapping is restricted to only memory explicitly shared with
the host. KVM checks that the host doesn't have any mappings for
private memory via the folio's refcount. To avoid races between
paths that check mappability and paths that check whether the
host has any mappings (via the refcount), the folio lock is held
in while either check is being performed.

This new feature is gated with a new configuration option,
CONFIG_KVM_GMEM_MAPPABLE.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Fuad Tabba <tabba@google.com>

---
The functions kvm_gmem_is_mapped(), kvm_gmem_set_mappable(), and
int kvm_gmem_clear_mappable() are not used in this patch series.
They are intended to be used in future patches [*], which check
and toggle mapability when the guest shares/unshares pages with
the host.

[*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/guestmem-6.13-v5-pkvm

---
 virt/kvm/Kconfig       |  4 ++
 virt/kvm/guest_memfd.c | 87 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

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
index 722afd9f8742..159ffa17f562 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -671,9 +671,88 @@ bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot, gfn_t gfn)
 
 	return gmem_is_guest_mappable(inode, pgoff);
 }
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
+	if (!gmem_is_mappable(inode, vmf->pgoff)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out_folio;
+	}
+
+	if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
+		ret = VM_FAULT_SIGBUS;
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
+static int gmem_set_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+#define kvm_gmem_mmap NULL
 #endif /* CONFIG_KVM_GMEM_MAPPABLE */
 
 static struct file_operations kvm_gmem_fops = {
+	.mmap		= kvm_gmem_mmap,
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
 	.fallocate	= kvm_gmem_fallocate,
@@ -860,6 +939,14 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_gmem;
 	}
 
+	if (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE)) {
+		err = gmem_set_mappable(file_inode(file), 0, size >> PAGE_SHIFT);
+		if (err) {
+			fput(file);
+			goto err_gmem;
+		}
+	}
+
 	kvm_get_kvm(kvm);
 	gmem->kvm = kvm;
 	xa_init(&gmem->bindings);
-- 
2.48.0.rc2.279.g1de40edade-goog


