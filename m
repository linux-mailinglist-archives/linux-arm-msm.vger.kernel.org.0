Return-Path: <linux-arm-msm+bounces-60984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A73AD5746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F38188B4B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E2B2BDC3F;
	Wed, 11 Jun 2025 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxuIdf9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B322BD588
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648846; cv=none; b=UJuAiAJQZ+I60oRm8GQ/SIqV8dMCO1XRGBuQPlfCAZeAAAo0ePN0vgMcUojrRCs8bax+k1FTpLPTabtDA5D2FG1NHq2fFWXhg309wE2G19FufgVZEyu60ZTmCe1bpwctoOwVVwsCgI9oms/lT1K9VP8VZTBmdP5xLeyFDBjTgh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648846; c=relaxed/simple;
	bh=hLE89x3YTQ4DTY5U2WYbKmaFGiAV0EEuWKrUIRjgeDA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TY2S3ChnF0QuqXM/T44/awlniE6G85UsvfxiZY4SAn7Vl9sHl+pIaOnYETaJfbkEkt1YkU3hT5MhrldDjlyHUBYLLlfqmeZM0/xZH+U2L14O2Svr/A7JNUPaX9w3kDYk6hDrGTwSJ0OimwApJ80c9J+QmoLogBDgUXwX12106eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxuIdf9D; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451dda846a0so48097685e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648841; x=1750253641; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=29LxTesP+esrl3s+kJyR+R34EjmdYlvjhl4IkCQVBdM=;
        b=gxuIdf9D0VtbCN6E9CXJw9l++cR+BlAoDApf6Ub9LowVC37WcEHZ+SUKiGuIJPZj8T
         DWfWVU+l7WnD2FUsEli6Iauckvc9Jyl/5HF+skEJmkxYnu/phfCfQ1Wd3/LjDu26tQeY
         yUnqschXfdIEC+jhuITmqrcNj3JWkvPgtSjaH9immThrCLxq2j/pbelAZKseeWKJtTwO
         KAB6XoTKcDmtnAxATfFk/pq7nPhqvajkzv/STEY/9L4tg+BynfhhpifLAWHmGix9ndrr
         Ez+1xpHVnca2uBeBcOZJaPRJRtx9tey36CFZp8/gpZc74Z3UX93OaRAHqttfJ/5rhQ8+
         i/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648841; x=1750253641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29LxTesP+esrl3s+kJyR+R34EjmdYlvjhl4IkCQVBdM=;
        b=XTK9Gaovvfa6GpFwXN6RBKr8wvkUAGNsNl898sRU98lqMWrzdJLb/5dhX55BIaGyM2
         L/Z8Fv6vdFEfuKySLX/ZulGB/X29RWWuVu8XNYr9MSjk/zNNoh1ks/0XV0rwwc2wBgDO
         ghnxOzSoe2kNQ4WAnJNofbykZEfydfs0gvKbJRGqq0QrSTVOw3Nt0lX/9d4etK4pd+7i
         R3N/9kD8RST1v+5+94fqAqZMCnrOhbefJTQ8EVibf3Nv/Aj+IXj6bMPxun1uSiYnztp1
         7OcWKK+rBb4eZzJQgLQj74mUBVJ8TU7xrSH1ezYOp6oFJI51Zgo5M1RKa+uasn/DefUU
         A3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU22lg9LgFvKTPBt5BGVGiBFAXpNKLhn6yQBKtKP8/DD5GtOb8aMEvG5hlCMjfuOskB4EswZDu8/XLBdnOb@vger.kernel.org
X-Gm-Message-State: AOJu0YyFaHV/swuJVDk1hjfDiBDZ6ITTeLpAdeWnAHYYKLpQOnnA1qGF
	+/IDEhYrsUHLrJCYIahMYVxBMsNi3TEaFf8uAouT7UT47WFg8WS+a1lm4DyuPHlDtIplx5K3Lwz
	dkQ==
X-Google-Smtp-Source: AGHT+IHGBYLvYqL0QA4258S7dEzkQ3lLJOuhLe7Oixu/fDL5tnHuJueVLFJw+pESXsx9Yw1BzHfTKh4YYA==
X-Received: from wmrm7.prod.google.com ([2002:a05:600c:37c7:b0:451:f443:5948])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1a8f:b0:3a4:cfbf:519b
 with SMTP id ffacd0b85a97d-3a558a31311mr2924191f8f.44.1749648841359; Wed, 11
 Jun 2025 06:34:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:26 +0100
In-Reply-To: <20250611133330.1514028-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-15-tabba@google.com>
Subject: [PATCH v12 14/18] KVM: arm64: Handle guest_memfd-backed guest page faults
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

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 82 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 58662e0ef13e..71f8b53683e7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1512,6 +1512,78 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
 	*prot |= kvm_encode_nested_level(nested);
 }
 
+#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
+
+static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+		      struct kvm_s2_trans *nested,
+		      struct kvm_memory_slot *memslot, bool is_perm)
+{
+	bool write_fault, exec_fault, writable;
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
+	ret = prepare_mmu_memcache(vcpu, true, &memcache);
+	if (ret)
+		return ret;
+
+	if (nested)
+		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
+	else
+		gfn = fault_ipa >> PAGE_SHIFT;
+
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
+	writable = !(memslot->flags & KVM_MEM_READONLY);
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
+	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
+						 __pfn_to_phys(pfn), prot,
+						 memcache, flags);
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
@@ -1536,7 +1608,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	struct page *page;
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1963,8 +2035,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
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
2.50.0.rc0.642.g800a2b2222-goog


