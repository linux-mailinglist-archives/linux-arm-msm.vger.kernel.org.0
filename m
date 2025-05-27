Return-Path: <linux-arm-msm+bounces-59594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA4AC59CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABD5B1BA82A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8F5280CC1;
	Tue, 27 May 2025 18:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2G13VHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E5F283CB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368994; cv=none; b=rEqG2qktjoYyYP5LWqXxnpZBxZrO5Q4FDq0gahSuwc4fnYIjl4p0BaDz8NG66n7WUdEqTa4Nt4YoRkgbGH29LoOO0o/lSeUBbEm8mJvJWU6jk5seP72UhVk8R1BZFVEYJbhsg1S58kSIpvXjyrQgKxMrgylE5Lo1WLkB2LPhlDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368994; c=relaxed/simple;
	bh=7rh9zHe9AHahelF9NuSt3/K+8lnfoR+09S3klGg3nGo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c78YMljvlaBv1Js3lLCZNm/Na72eRfGXAqYxifUi77N/UcLclxs+ph+an6avvqX/bSAw4xgJJaLbCOynQJJ+W8e1l2ZwOJRxDLcoBc/S73mGDo3lN0RkfiXZoQ75x5vhQDh5ZR1dD4bQqApUNyma1fGjlwy1Fl8L+EutcNmJGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2G13VHF; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442fa43e018so576125e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368991; x=1748973791; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALrz1sRb+zGk6S8awUKMjvdNktsAjzmIkhXrUj3xTdE=;
        b=u2G13VHF7QiNZHMevArkNdwn1Rm5kPnAQdTdAV/KUwLGoWZMyDHRV/5a4yfD5bvhms
         vpMWj3a1ew+3tYvX4W4edRtYbB2JZLux0fAHPjPAQNSvtSRkAC6klSSP6FsAG73t3l8q
         xjGKEwYNKkjzMqu2xr+bg7h+9WH5KfeId2nU7L5F8z6OgnMWh+2ogP9lo4Zmott9XC/C
         GJ7zBnkwthHkwjYraqZWDf/TWP4fnBv1BVe9TkaEaAmecOJuldO8jKODPQ2Ew1T35kgX
         AJOL6f04i4WsfETf0lYtiq/MRCb1dnnPAiDAN2X7JLto44+wJRuJK3iSZBgkrczziqDU
         ij1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368991; x=1748973791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALrz1sRb+zGk6S8awUKMjvdNktsAjzmIkhXrUj3xTdE=;
        b=jWbGiWZ5/HW3HeAyh6AkR4RBjpd1ZA0dn7vE4EmAOaV6+d0DueUvsNZrNU5MRkC1j8
         PH/QI7gtYSmno6kTjQjIJT5LKK3j1E/cxgwF7e2kg4pv86dYQKxmeAdPmTSZeezgZTd8
         nXzEdjDOh/4dd9pdOd6aUiRFXqP5XqnjICDwZEbvk5Go2eDPlQlFAE7N/7hN7NyFhrfo
         8+6ARGv7UlonuEEHIQxENG2wLN4d5kgbhcKkprFJeumv8RfvG47ZV9zWuv3ZyKFdqFjO
         AT6+TzZIflvNLiQMK+fj4bNAgtaBVY9v3gubtQDEKOc8N4DJjCtDocmQGc0qPAdCtpR4
         W49w==
X-Forwarded-Encrypted: i=1; AJvYcCXHwTFUMgkjd/NRH8y2ArYcCQxuuyTOKVXqH+0vUP8T0Uhk9Moa4k+JsYleIadyAK/fM5WoMgXYReroXMv5@vger.kernel.org
X-Gm-Message-State: AOJu0YyDM9Tnk79WUMHDI5zPtF4wqjl8we/a8g3EggvKUo/TnMlvFcaa
	AoUZneAA4GCSoAogaDgX4499sJJwplrh/XoMLZPtdzksTpeHbH1iVZ+m+Ko2sxni4rKgmVqRMJr
	+zg==
X-Google-Smtp-Source: AGHT+IEodZ07aGUSN9lzHx1HTAUjm24ip1XDGKBVDKeoRhMm1kFvEgr3NfTUnNAICPpNgKbsF/l/u8jzeg==
X-Received: from wmcn17-n2.prod.google.com ([2002:a05:600c:c0d1:20b0:44a:3354:5dfd])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64ce:0:b0:3a3:76e2:ccb7
 with SMTP id ffacd0b85a97d-3a4e5e447eemr1432544f8f.5.1748368991350; Tue, 27
 May 2025 11:03:11 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:41 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-13-tabba@google.com>
Subject: [PATCH v10 12/16] KVM: arm64: Refactor user_mem_abort() calculation
 of force_pte
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
2.49.0.1164.gab81da1b16-goog


