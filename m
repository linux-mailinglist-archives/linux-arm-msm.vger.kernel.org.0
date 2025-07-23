Return-Path: <linux-arm-msm+bounces-66250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6662B0F04B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFDF5810FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161C12E2EFD;
	Wed, 23 Jul 2025 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yQjbFhnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C562E174B
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267652; cv=none; b=I80NFC1VO7mCMPsJ7E0o68oTG43kwYd+l1viKo+vcvqrn93WJ+qgTwWeBqCcltQaQE77wV4xtP94tKYOFHnwa58dvf5GTPJRqkbSa32QmbGJzVCR2cTwyMfysmkTQoN41Ir6L8uxh8bLr5MM/qCjsbdUNWPTwxDcdACLmi+0UZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267652; c=relaxed/simple;
	bh=vWGb/tkcV81zBUADrzxzfuQ/Gkz9tsdMTYCoMZexBv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EYRv4rTEgcNUhFJh9g4vcY+VfRC9NIoszit1RBnAMSKdEbeeabM0cs68TaeCT2prl71X5diTlECBkBJKKRFKyHSA+X5i2lWmyAWnwNvtUdQgOOedWM0tWXEnCl6PfCvcxZnoIRmFxJELeby5IWmxGnLEKyV+3+ux1bqL7VnuO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yQjbFhnL; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ae3c8477f1fso581015266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267649; x=1753872449; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQQDV4zydkRfplEEJZqHClNg8epmyuBAYmjUZ8gGwtc=;
        b=yQjbFhnLUYPNoiAEONpft0FAt9iHlr92kKdWIGpEjIGrDusL1e0sSFXM//dTx5QlCG
         uX0LXtldP1gBqPdHVLKf+BMDboZuMoZQk//ZJndocqKfzbHRZgZd3xGAUSQBAtcDP1c2
         DHGkL/RgSz3/oVTxyg7cgr1Ehipf7QQPlaqBm21KmGWdM6Y1RD4sYlimud1QRX6HKj4d
         Q6tABoIur4y0H4oYcLd54A3JdOHW63AVtM1cSefTtlQUZgc4t/lvIJVHnIQfjwtMxAI9
         Am8A55mrQXF5CnM09SAPvNYVbT3xnSeWntwgHsd/RZdFoDsAxb/F3RKdIHiem1ETdRxx
         iGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267649; x=1753872449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQQDV4zydkRfplEEJZqHClNg8epmyuBAYmjUZ8gGwtc=;
        b=J3S0pQnHLUoIZWvBMX8PV0u+xeW2EEzqRkVZVdBeM+GXFtn7YTwgJ3s5CeadIRFFoA
         Tpf62cgXl8C6Xesd5KGb/dWHfA1uW2A6OeE+1hRNaBmLmJ+drbB5cyaFonN8RPiCjrY3
         MXWuJqdTYSwm2roBI4vkZ6yPKdGG69Mh0UgeqsL8jW3Mxwriah36LRU36qubF7D7gn6a
         vIPX5sKPCEFY3ZUUb00SwXt/RJaf4oOOkptY0QGyJq+vPx2KYSoqo6V3pqXhyyiO1Txw
         Q63zG9UTyWbYWuj1PhEAQjogyU+PbaY7zKG0+bJQXN7yOjZs1KFKyHcUqT9zoS4B8Ouk
         9EMw==
X-Forwarded-Encrypted: i=1; AJvYcCU/psOnmC0DH1a5h1p9+P88pk6VFZVJpMhiMrQxQS0GpkOCqLZ/YxJfOSNlWnvBDsLGWPMAIQWlD+t6GFh1@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKf/YweZZ2vF8xEJbjbKo2o21JFmg1eZ87/02JmyUk/tWo92R
	ZCIcLuPhDID3WwROAfFzDYZ4xCfQd/7vg6J92mykuVLLxCVWv6hq9JY3lB1NXuadmdhOt96+wp4
	m/g==
X-Google-Smtp-Source: AGHT+IHUARfg6/5ZFJQc2SIXy/3Rb3LhLodoPi1Lw4aDiFctD3VlOj53YvljiGL2HPFj4hs52zuLJqVWPg==
X-Received: from ejczi1.prod.google.com ([2002:a17:907:e981:b0:ae3:c5c3:8b1f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:934e:b0:af1:1dfd:30f4
 with SMTP id a640c23a62f3a-af2f8d4b141mr169166366b.47.1753267648787; Wed, 23
 Jul 2025 03:47:28 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:47:05 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-14-tabba@google.com>
Subject: [PATCH v16 13/22] KVM: x86/mmu: Hoist guest_memfd max level/order
 helpers "up" in mmu.c
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

From: Sean Christopherson <seanjc@google.com>

Move kvm_max_level_for_order() and kvm_max_private_mapping_level() up in
mmu.c so that they can be used by __kvm_mmu_max_mapping_level().

Opportunistically drop the "inline" from kvm_max_level_for_order().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 72 +++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b735611e8fcd..20dd9f64156e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3285,6 +3285,42 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	return level;
 }
 
+static u8 kvm_max_level_for_order(int order)
+{
+	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
+
+	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
+			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
+			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
+
+	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
+		return PG_LEVEL_1G;
+
+	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
+		return PG_LEVEL_2M;
+
+	return PG_LEVEL_4K;
+}
+
+static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
+					u8 max_level, int gmem_order)
+{
+	u8 req_max_level;
+
+	if (max_level == PG_LEVEL_4K)
+		return PG_LEVEL_4K;
+
+	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
+	if (max_level == PG_LEVEL_4K)
+		return PG_LEVEL_4K;
+
+	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
+	if (req_max_level)
+		max_level = min(max_level, req_max_level);
+
+	return max_level;
+}
+
 static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 				       const struct kvm_memory_slot *slot,
 				       gfn_t gfn, int max_level, bool is_private)
@@ -4503,42 +4539,6 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
 		vcpu->stat.pf_fixed++;
 }
 
-static inline u8 kvm_max_level_for_order(int order)
-{
-	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
-
-	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
-			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
-			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
-
-	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
-		return PG_LEVEL_1G;
-
-	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
-		return PG_LEVEL_2M;
-
-	return PG_LEVEL_4K;
-}
-
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
-					u8 max_level, int gmem_order)
-{
-	u8 req_max_level;
-
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
-
-	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
-
-	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
-	if (req_max_level)
-		max_level = min(max_level, req_max_level);
-
-	return max_level;
-}
-
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-- 
2.50.1.470.g6ba607880d-goog


