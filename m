Return-Path: <linux-arm-msm+bounces-50039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA317A4C9D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 18:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F27E3ABA05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AC724E4BC;
	Mon,  3 Mar 2025 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z60HpV93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0BA24E4CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021831; cv=none; b=kOXLzkEytBiTkmx4AqQ40cIsh6gftDFHGrQw3tRVHKBZSaYcBjlPFRfgwoBOhLKbr2Bm7NjRSMPqWugHO1WqDyxe9t9OmCtOLt4OpMLUYxdFavKbXpxwG1faZrXYdN8ocRz1Qrg8QoBFHj3J47HbZB+rq/1oQsGBrgtuGFjg//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021831; c=relaxed/simple;
	bh=1cHCATkOU7kAcjbAu4EXi1pUFvndj0xVj7tS8IfkgcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YzvPbJfMEneFrPYRKcq0Kvl1Xi4q2of9I565l4o8qr+S6VcIDWjeDVVQSsePOawtbZuMPJCnlRootBfobMdQY2b4ub5xVEYT7FzXMzP2KjO8Gbk7lq0J2584Egss79G9JbBBi/p2u0GjUviychd+I1smBe5DHDzi1Nuv/Ij/11Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z60HpV93; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ba50406fcso27986095e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 09:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741021828; x=1741626628; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGgo65KrsUc27GFmFSac9JDxcDr3yyxu9F6SQNqcVKk=;
        b=Z60HpV93AI72bzjhXmrcLinDSRBoylc2W/jPfxAdYN0Pi1M6x6e2bzC6WRQbUwpukF
         tLIvACkbFbbsSnT9U1HRgyaq0N8qA1t6nTXOkER/sFnkeUBmAew8Bi1nTjnG8o6SQZxS
         A/sfNGOO+g2ywT7GZ8z+Ol48BYzNOlrVhwFWGqVlFLAKkaBWF6WyRt3EBKvNmL2WnW2K
         qxTgzRaFuQD5R0hzjElknmu/yRCql3/6QvEhVEBKNkULRhfw0256C9nuMuMe0AlNiPdA
         SQxZBlPFdXoN1dQTlKuPSbi0j2xuDD8FUYCjeG17IfmLoutF/HTyYaSEE7xN6t3JpTOS
         bDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021828; x=1741626628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGgo65KrsUc27GFmFSac9JDxcDr3yyxu9F6SQNqcVKk=;
        b=Wy9UL//ddaX0Hg6veB+u7dwRQsS8Q7A+YkVXAPwdGvKRlPobhxbSoiBAzucs+Aa3Vj
         X9H5e7NbZHz4MN9oILxdX9AHk+4JXS+9WKOptloVijDD1RMHnsxGPABh8T4xWEElKN7L
         0ZAlZ47T41FcZ4/5/oHX0o8ck3IKOWVqvKh/CPPXt+hjjlskIc4pvToOfN53L/aH03js
         s9kFq8sksXAfGJFmoUJaCpgpYnhgRpoSG5jPtNqXgxcY5a6Eb4wuCpRcPNeqI4I8o/te
         WSTkZ5s+LkOEyibnBg4K7nFmbTcoaup+6qZ6jqXi4o6jCLTtT1K9X5QCJFrU9hiHpSQQ
         c8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPglu0lFhouqsIMCxJ1e2fBysWgqxqmd8dZxIV2IE23Vdvz+xXVtkpaKku3JzsFCXPtZ2W5CvMhqC+2fud@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwZgrjtok1BdUD6GqyLwFfbf8rqsP7eHoIpPy2uYq5VGHcdyq
	8hRbdsIQn5BHo4eZqGxR94VREH7bY3fDef+gYr9CsndO5jRVtEu3CPR+NOdAICd8CtHtOUSBzw=
	=
X-Google-Smtp-Source: AGHT+IEzTL2DCjgOiyb3Cw1M14HJjX54cJX0QrxcjGlJF7HY9SJWIHrxMRrLYT+9PiOpxfffVqhEaRBMeg==
X-Received: from wmbbd15.prod.google.com ([2002:a05:600c:1f0f:b0:43b:c4f0:4c2f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5122:b0:439:8ef6:5782
 with SMTP id 5b1f17b1804b1-43ba6703c4amr121624595e9.10.1741021828083; Mon, 03
 Mar 2025 09:10:28 -0800 (PST)
Date: Mon,  3 Mar 2025 17:10:10 +0000
In-Reply-To: <20250303171013.3548775-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303171013.3548775-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250303171013.3548775-7-tabba@google.com>
Subject: [PATCH v5 6/9] KVM: arm64: Refactor user_mem_abort() calculation of force_pte
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

To simplify the code and to make the assumptions clearer,
refactor user_mem_abort() by immediately setting force_pte to
true if the conditions are met. Also, remove the comment about
logging_active being guaranteed to never be true for VM_PFNMAP
memslots, since it's not technically correct right now.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..887ffa1f5b14 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1460,7 +1460,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1472,6 +1472,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active || is_protected_kvm_enabled();
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1521,16 +1522,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
2.48.1.711.g2feabab25a-goog


