Return-Path: <linux-arm-msm+bounces-60336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD9ACF342
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10AA5175286
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3521F09A1;
	Thu,  5 Jun 2025 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OVteEr8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55906274FD4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137915; cv=none; b=n7A5v0/anuytojfS2DGZVW925AY0u1nXY1U8Pb7usDhpdmfnpac7Y88Q6JDVZ7bSnQIxsvtZFLOBu3knrDWlWmwFXt03E2geCQYE7G5VOiNK3IAlyTVP1TOIS/uqk0GHiuUSCKUNNXGwBjKeSsw5xuBBKWdHBm7574qbmfyDukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137915; c=relaxed/simple;
	bh=j3r7Coku7j3Jd+pKg8DvBXPHSPEHnnoo2Ks6Ban0GCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U/Bfb0vB9O2Q0bEkDcT7zcVW5X/iZMXSAWBz0+rAU0Xs0TYL2oL62M6yT7+H3hf4udAS5E3xi87TErl3QNXw7ZcN+Aw4x65uUtEV5GqFj2Qsln0mGpjdr9jtEfIUvLm/x2EpQ23CZsFFVFs+hGLhkeVDPQYS/9b32vlJUN4fyJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OVteEr8W; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso7162215e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137912; x=1749742712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPZBE5PTGW9kWBzPk02s4iKZXmTT2aIVBFlSN4SanJw=;
        b=OVteEr8WEg1jvWpzKTBOWDRM8nzZ6CeV44z4oQC+QNSFN7ET8oawMZIQaPv0DTq4+f
         coiF4xbhASZpVIa4XyAZYwc1fvOM/bFEuzoeOLr9Io+/9jh9vo+vvYDf5IBehkej8NZ4
         MzESHAMdw6sIcZYBZbkCcJDvHR7jPwytw0h9pQUw86kCmEfJpV+5zAwrhqillygJiaos
         ABrPavgshxuSeGt5nBq0kQlA5t3DveFNMrYTSIVEr0dpCgyVLxQqJOXIHPnhZV1QGy3s
         XTA5RvR2OKmIjDWsMhnCh+ueQTDCWSAwrGB3gejjZ/VDnIOHFucIQUrKSh3l+53bnIER
         40zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137912; x=1749742712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPZBE5PTGW9kWBzPk02s4iKZXmTT2aIVBFlSN4SanJw=;
        b=ZN7mwWfVjJYPldECLr8/SOBSmFJKWqgE9NS9ZZOptO+q+oNABM7naQCGZIQyLMrbyu
         VTiZQy2vlftMciCbXy4KthicsSZnb0Q0I6+y+tnK/fvN870FkeW4St49Ph7glrGl1dHF
         qgkFFAbhLEvQFe8dFUBze9eQVT+WiGydxgpoL00rv5k6qugaZueMR+EqxN4+lz63509q
         9lGPqnWMwF6dBnFSEpRlzpWZBAUJwpeHCIZSv/HJn3Rzw7lwTdOrZEUHoQMmPlTUGV5a
         dZJjjv4aII2A1IkHlHqoOpzlRNZI3cuZ/JpzhS6IXQs0/cGhbo3fhZTowt1b8/3NGyfe
         S4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVuNtAZdRDM4WeIZ30f3b4hvOZOAmf48lKHBpqNKQvodNbtdf2gVmaP6W2hTHcxiqQeLMsp+OYVmJwXJfOV@vger.kernel.org
X-Gm-Message-State: AOJu0YwvU4IN1vcf35C+QOITUy3Y34U5Jwjr/k+EQagpYw6HRpPYmVCo
	7bYYqewU3aGs/ulXNVFZ1OBj2G7dBM1eyxuUQiF7ii7wbVKGhXhz7K7wDo+qwKIkSEZxh7DxDN3
	YAw==
X-Google-Smtp-Source: AGHT+IGMJty4mR+w6Q7W1YmFTUSwU16vv8WAlkYUzsCh1k98WN49+HkHCW9IHOZiu4FjckwQZIFoRzzqew==
X-Received: from wmbdt15.prod.google.com ([2002:a05:600c:630f:b0:440:595d:fba9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3595:b0:43d:7588:667b
 with SMTP id 5b1f17b1804b1-451f0a88e69mr92705785e9.10.1749137911624; Thu, 05
 Jun 2025 08:38:31 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:56 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-15-tabba@google.com>
Subject: [PATCH v11 14/18] KVM: arm64: Handle guest_memfd-backed guest page faults
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

Add arm64 support for handling guest page faults on guest_memfd backed
memslots. Until guest_memfd supports huge pages, the fault granule is
restricted to PAGE_SIZE.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 93 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ce80be116a30..f14925fe6144 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1508,6 +1508,89 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
 	*prot |= kvm_encode_nested_level(nested);
 }
 
+#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
+
+static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+		      struct kvm_s2_trans *nested,
+		      struct kvm_memory_slot *memslot, bool is_perm)
+{
+	bool logging, write_fault, exec_fault, writable;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
+	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct page *page;
+	struct kvm *kvm = vcpu->kvm;
+	void *memcache;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
+	int ret;
+
+	ret = prepare_mmu_memcache(vcpu, !is_perm, &memcache);
+	if (ret)
+		return ret;
+
+	if (nested)
+		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
+	else
+		gfn = fault_ipa >> PAGE_SHIFT;
+
+	logging = memslot_is_logging(memslot);
+	write_fault = kvm_is_write_fault(vcpu);
+	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+
+	if (write_fault && exec_fault) {
+		kvm_err("Simultaneous write and execution fault\n");
+		return -EFAULT;
+	}
+
+	if (is_perm && !write_fault && !exec_fault) {
+		kvm_err("Unexpected L2 read permission error\n");
+		return -EFAULT;
+	}
+
+	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
+	if (ret) {
+		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
+					      write_fault, exec_fault, false);
+		return ret;
+	}
+
+	writable = !(memslot->flags & KVM_MEM_READONLY) &&
+		   (!logging || write_fault);
+
+	if (nested)
+		adjust_nested_fault_perms(nested, &prot, &writable);
+
+	if (writable)
+		prot |= KVM_PGTABLE_PROT_W;
+
+	if (exec_fault ||
+	    (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
+	     (!nested || kvm_s2_trans_executable(nested))))
+		prot |= KVM_PGTABLE_PROT_X;
+
+	kvm_fault_lock(kvm);
+	if (is_perm) {
+		/*
+		 * Drop the SW bits in favour of those stored in the
+		 * PTE, which will be preserved.
+		 */
+		prot &= ~KVM_NV_GUEST_MAP_SZ;
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
+	} else {
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
+					     __pfn_to_phys(pfn), prot,
+					     memcache, flags);
+	}
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
+	kvm_fault_unlock(kvm);
+
+	if (writable && !ret)
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
+
+	return ret != -EAGAIN ? ret : 0;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1532,7 +1615,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	struct page *page;
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1959,8 +2042,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 	}
 
-	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
-			     esr_fsc_is_permission_fault(esr));
+	if (kvm_slot_has_gmem(memslot))
+		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
+				 esr_fsc_is_permission_fault(esr));
+	else
+		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
+				     esr_fsc_is_permission_fault(esr));
 	if (ret == 0)
 		ret = 1;
 out:
-- 
2.49.0.1266.g31b7d2e469-goog


