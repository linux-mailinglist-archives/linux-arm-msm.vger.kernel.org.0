Return-Path: <linux-arm-msm+bounces-65515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45877B091BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C443B4862
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD11F2FCFFB;
	Thu, 17 Jul 2025 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z0AE2OH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F12FD591
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769661; cv=none; b=YCmPurmGiLGBFBRISM3XAH1JdGNwt0GyXzaum+ivgwUVBLV0w15uLSNDviv7F+OTVEBRvzNUn7rYoXW52WQnoGnuSq+PYfKRb+QGAJlb8bP3/VyxKx2aFc7Kk+119Tq+NmiUI33yL5AESNaM0yfi0INLQvm9wYt2dCV+MujKDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769661; c=relaxed/simple;
	bh=eCkEMmkV7zuOHj76xDUG2iiUIlXUTmKzU3RtBkBbfBQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EZ1Xk7UyEPb2pdb9pV3/VsrcPMpobFXfGFGACesgz9VHaHg1zw1Qq2Vat5ugztZektBwJOYkP5QqqQuBXoFmNqsFR+dmAutgwQ5N5Ws6nThGDlZ2w+gLWiAFc4Zpp/m4FUOF70Lfqa+H3v4pMxsbAcbC7fvvwrBZoswDWzVjI0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z0AE2OH1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4562985ac6aso12235315e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769658; x=1753374458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EsHZSymGf6YpoJB6CYjmGKtG3qfnN0nRO5q9kqA6+Ic=;
        b=z0AE2OH1OK/iW/JqqW7nb453jjg4AeVUm/Ofg5Xc1x69DUv3lVQkSzSu/eK0XlTFUg
         EXIHLJTbvDmgkJRTsPk8lfQN3l0iBWpZemCAPV5oVbZo6MgEbpMJLuQTSa3N9sBxRx3T
         Ah78YxJG9btt56amziI6RvMWERe/LJBLt/cZudYBOlCkqZxjbGMypsBl3J2GaVRiznGH
         np1H8iFn4ldVFvWtO4qaLjnjczKUbBNl/Sq1UKK8H7pY0TbqLwYG+Fr0jx3HGCsqzOOD
         rHI4rq/n4VXQSSka3e0/kUV+XzvHUvFCRNLV+xkxPTuRyIVsvWSZrnyscLmL/fwrn4AF
         v0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769658; x=1753374458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsHZSymGf6YpoJB6CYjmGKtG3qfnN0nRO5q9kqA6+Ic=;
        b=aNKLwD5oEd4I2HYg+fi5jnQ26tPIZyFrGrexiazgMB3zgXy/ApZR+AYbmTTQuMR5T9
         7Bnc4Euu+e+Z1rfuUiT6mJvqqQiboQZNnRPnuQNmmZbFm9xc72ftpCv1SSQ7y32lvp42
         7hvsPdkKRl0vUgMxwMFy7jIHafYsF8dv9WqPwmr84U5D30zz0PF5BdXCXpXxK7LYvna+
         ieO7FNr4HQ8QKqKH/+JJVIwa1lDowEtJHrpIoDXII78oW9TmdXBrQ2nI+LBGW8MVAkSl
         VJCCe7iDsyb0U8DhKXbWsxyyE7MDnKG1VyrKK1R9yqyl7XcmuytEDlhEBwJD0wcW2+SR
         bz+g==
X-Forwarded-Encrypted: i=1; AJvYcCVCA+e1RA5HNu9JUDs12F85QBWwS9Xp1PTd8bEy0nI7FvuengwVFRvNjxEwP0gh2nFtEux0att0pBnOekqK@vger.kernel.org
X-Gm-Message-State: AOJu0YyHc3bXsD3K1nr8tZfj6NoVsTylm6fOVvEAogyMeuIUx89BtVXL
	iw/iF0sqYBhjgjiw/Itlq82R18RHEdpRd/1h5xYJIhsvnN07tBjOOC5YRRHVV2JAiausrlqeza4
	c8w==
X-Google-Smtp-Source: AGHT+IHF5lWSGh9WVYXpPoz50NAiXW+TxYfluQK9b17X5f+I+q79c8QlWYxgL++Ahdcq7iS1BIfk280OVw==
X-Received: from wmby19.prod.google.com ([2002:a05:600c:c053:b0:456:1b6f:c878])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ed3:b0:43c:fe5e:f03b
 with SMTP id 5b1f17b1804b1-4562e3cac86mr80404015e9.30.1752769658462; Thu, 17
 Jul 2025 09:27:38 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:16 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-7-tabba@google.com>
Subject: [PATCH v15 06/21] KVM: Fix comments that refer to slots_lock
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

Fix comments so that they refer to slots_lock instead of slots_locks
(remove trailing s).

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ed00c2b40e4b..9c654dfb6dce 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -870,7 +870,7 @@ struct kvm {
 	struct notifier_block pm_notifier;
 #endif
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
-	/* Protected by slots_locks (for writes) and RCU (for reads) */
+	/* Protected by slots_lock (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
 	char stats_id[KVM_STATS_NAME_SIZE];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 162e2a69cc49..46bddac1dacd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -331,7 +331,7 @@ void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * All current use cases for flushing the TLBs for a specific memslot
 	 * are related to dirty logging, and many do the TLB flush out of
 	 * mmu_lock. The interaction between the various operations on memslot
-	 * must be serialized by slots_locks to ensure the TLB flush from one
+	 * must be serialized by slots_lock to ensure the TLB flush from one
 	 * operation is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-- 
2.50.0.727.gbf7dc18ff4-goog


