Return-Path: <linux-arm-msm+bounces-57740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21034AB5A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59ACC3A561C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6745C2BE7AC;
	Tue, 13 May 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGGMAc5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B72BF3E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154106; cv=none; b=oBfMvxK4r1wLP7nUOUBDQtiZRrY1nWDcvFxsxBuHqrd5ILXZ5ZNZy5IC/jPrJghnd2JkGT39y0Ttc1F7l1pThdXvtvlOL5kJzmE+JY5vaeHP5Xsd6LxaXcQ2JK3FTNVeXLeRZxN44J9IMyekVpBhuPLjCikos3i7QKJvqnicGuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154106; c=relaxed/simple;
	bh=faPYAvc+1RBRk7FWuAC9vwWWbM/MAQ1n7IIIiB1A4fw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oFKxvGEFO7JGAQ4kdq9qj44kTcZ65xbyC6w8GLhh5e7ePS6XtSVxQ6QSZIv/BxiA3zOMEBdbQqFI3EqImKFOjIARONZX5YFWrm4n9T73SXKpyJVkLRPLNu7/tOLCsygXKT2XKQ/E/WSsEzHfO19OeOXtd8bJI5Y0LxvbVwjN9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGGMAc5t; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso30011755e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154103; x=1747758903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mw5Aq9liTvfBW6lDsmXdp3t+4bJEbgWE1aVwHCss4lo=;
        b=BGGMAc5tzi3G7NeNSiVgAlGGLudK3/KfPSv92VGXOXnnlQck68PhOT0qnYYpXeSGiv
         ZW1Dfv8ApdLUzjTHpUslGJvvQVsNDAuMvbCAw1LOOEXQhwM5YT0wel3Cys49tX7IiH+Z
         arSmbj/IAdyYsUM/OwTQdjx05mT65I0w2NiN6CdG0PWXhpnswKDSQPyXccsBeVHp85t1
         cXEUJEDl4hfE+jhpjpUPiNRqPeK+jgYemoacwlbj709dZ9o4KHVMu/5/eOf1fTxNxYGH
         vrNEsPuzj3rdsQelf1WUYHIKM9NydT/cGTty1bE29ktjVtbPtNtZ74JpdV2+HLAjtrTe
         uSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154103; x=1747758903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mw5Aq9liTvfBW6lDsmXdp3t+4bJEbgWE1aVwHCss4lo=;
        b=vlkIGgeAKGz+wfb9lWcjAKmYdhAZwd2zq9a6cQ2b3zYBgi39jIHsBb3V3FzqreIjrq
         kXKVkqY1BhOiaoVg0sn5WJdcR89BRpcLlav1ukcbTelxuUSi5VBaPkriLXDTza0MvhIX
         DZCnagZNpQHYuRrtspsrxAzjZfufmto7/pvxAo7lw8kmSEcAee2VtQt91HQlvmtbCCbo
         rVlqD2a6sVEOy4kZuCU9Cjgnx126g79372ZOJ9QxCMF2iSre8TmHOSPOZWQ63Rjpwnwf
         8FcBQN0+0gF3OgGwmMcgQHN+360XK0/laJ7Q4uLJkR+zyH44Nnkm3lDiDerhnwk788hf
         t0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWIfpqkFH5z4gmeqZXCXRGsFTD37wdvMozJxPbpyddESpFywGpvHC15lcFUwdPoEO3cqj/3qUqPUwBG2Dkv@vger.kernel.org
X-Gm-Message-State: AOJu0YxpagAtjDqd9WNY3Qc9HIdt54lfDObAlHJRF9Am/5RE+0kIQbH4
	b30nrsw3CAxRhKCAhgITxzUbzBxjzFxGJMM6omSvfcBmcrh+9yl/5/arhwMCU2mV5rfb02caeg=
	=
X-Google-Smtp-Source: AGHT+IGSpDrcEpe7uNDVI+souhz0v7v+9RHjQC1tc7Aljkmth6DLnm0zlJcclwS/YNY3iQUF+yig/Y2hJg==
X-Received: from wmqe12.prod.google.com ([2002:a05:600c:4e4c:b0:442:cd42:1f7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e46:b0:441:b3f0:e5f6
 with SMTP id 5b1f17b1804b1-442d6dd2276mr134034145e9.25.1747154103042; Tue, 13
 May 2025 09:35:03 -0700 (PDT)
Date: Tue, 13 May 2025 17:34:32 +0100
In-Reply-To: <20250513163438.3942405-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513163438.3942405-12-tabba@google.com>
Subject: [PATCH v9 11/17] KVM: arm64: Refactor user_mem_abort() calculation of force_pte
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

To simplify the code and to make the assumptions clearer,
refactor user_mem_abort() by immediately setting force_pte to
true if the conditions are met. Also, remove the comment about
logging_active being guaranteed to never be true for VM_PFNMAP
memslots, since it's not actually correct.

No functional change intended.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index eeda92330ade..9865ada04a81 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1472,7 +1472,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1484,6 +1484,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active || is_protected_kvm_enabled();
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1536,16 +1537,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
-	/*
-	 * logging_active is guaranteed to never be true for VM_PFNMAP
-	 * memslots.
-	 */
-	if (logging_active || is_protected_kvm_enabled()) {
-		force_pte = true;
+	if (force_pte)
 		vma_shift = PAGE_SHIFT;
-	} else {
+	else
 		vma_shift = get_vma_page_shift(vma, hva);
-	}
 
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
-- 
2.49.0.1045.g170613ef41-goog


