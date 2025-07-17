Return-Path: <linux-arm-msm+bounces-65520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6DB091C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D36137ACD1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000272FE38F;
	Thu, 17 Jul 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJiQRIfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BF2FE337
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769666; cv=none; b=KJdH0g7YJ8TXG+QhpJNSjYlRx9KbEHoSHow4yFMQDG7GHj7rde3V25OVPZNv8T8/LwLQGyq8WyPeaREMV5yA6z8JmXCvGjxAbJveJd4PKeTKvmVUwEymOQPAJGFgmyq6FvBIWBAi7gd3mnCBGAgT5RU+gq8+ZKoFZJ/17cdoNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769666; c=relaxed/simple;
	bh=5SFcmIaZT18BqEoeZQIYRV1Aqypru/hVXQDtZkdpxP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l1fvWsIXaKiZCk3T7eKMHNGHWlGYx466nXlcdRDkYzPloX6u/t4LSF0url4md9dYU+kar/sTWPD3dJ7aW/1/zfP8Mz2YhMo/N8g8hGBM6VzTgG914lVlcUiU816ffQggILPjuYBFvpPPDbr+moA8zc5WgMVA4qxU7YvaKOat6BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJiQRIfI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so8575715e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769663; x=1753374463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NswHrgkdcqxmOhQmg+I1ZftODzAqq/smUBNc/8jSsg0=;
        b=AJiQRIfIRfVBQqcUwtwO1dK/uIQorpjb/b5bVtdTY6N2ukzJy/1Bd7kGhwgEoGG1qM
         m/HU8XS5PZjF1WrVJJRACXbCzoWpeeKSL1Aht6utrVKzV8NQJQCxI/RfYHZrThdT9MHT
         rdQEeKSpaShe3vF6qcgjn6cNTwi6caJcSWlMLixFX8GrV3pqZB56Kp05/JFgYImtRhBl
         UesyQvM2vMSMfb2boRercyQHB2wgzUCOGtrkNXvTqdXFeRRZyEtqOHcI3vWLVrRSdxNY
         Uuek8Yfo0ZzptoJwXVlJj56ilM4bUjNyKMoZXHkvNiYeGkCW7+jKg0LUGAy5YD4sKv24
         hK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769663; x=1753374463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NswHrgkdcqxmOhQmg+I1ZftODzAqq/smUBNc/8jSsg0=;
        b=em+TXjdLeGMfK6AXTNZDJmEGKvoQs7MDszay6soFNYqIXUuVj+E9I8J9/jrriDV8fW
         7tHq4pBgMcj9V+ZzpuBEAMCSbX9Kb+GKUz3KO3urZLFC4acsKNvgBcPV2itqKc6wuHBT
         cb5vHUA2FP57dT3h1VaHJweK9Jb4Bs3EdIovv6xq7yGzb34Tkmmq0npVBz/ioUX7qf0P
         lRvSU0j+/Te/6ACU+HhrPYk/tLYiNvuO/XIQTTyRyM7ymf2nZrSfG3Miusxmi79WfUTK
         2Apo/9bq+x3ET9vrEwGNKBLBNPIoZivBUxw5KGf0B1RUsiPZMQNhEni3coow+4pN6+7s
         dB9A==
X-Forwarded-Encrypted: i=1; AJvYcCU2FX/0R2bhh4z+gtjaWcwQxGAqQfgWuLRE+B0j7TQPGnWiBHMVTSizQK/tQbJW6ei3ztiMsef7VzHMGUaz@vger.kernel.org
X-Gm-Message-State: AOJu0YzeoLzSQPdDKVZX9euYnX1r8W+oMYJNjYn1UKAxu5BwMsonbhIW
	LLo8+AJrsXlmIJl6r1A4S64LoXVvfdGFhvhk236cTDV2qG/wHe8RXIQoKmJvftJZS6wftuJOs1e
	big==
X-Google-Smtp-Source: AGHT+IFgMT0SNfYFF6wTIOhI0LgfBaX0JYI2vvKy+B/T/ROVKWlCDpvfTeMqXVsxiyrC4q2xBnylePD55Q==
X-Received: from wmbdq15.prod.google.com ([2002:a05:600c:64cf:b0:456:1518:6d6e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b9d:b0:456:26a1:a0c1
 with SMTP id 5b1f17b1804b1-4562e274a82mr91598805e9.17.1752769663500; Thu, 17
 Jul 2025 09:27:43 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:21 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-12-tabba@google.com>
Subject: [PATCH v15 11/21] KVM: x86/mmu: Allow NULL-able fault in kvm_max_private_mapping_level
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

From: Ackerley Tng <ackerleytng@google.com>

Refactor kvm_max_private_mapping_level() to accept a NULL kvm_page_fault
pointer and rename it to kvm_gmem_max_mapping_level().

The max_mapping_level x86 operation (previously private_max_mapping_level)
is designed to potentially be called without an active page fault, for
instance, when kvm_mmu_max_mapping_level() is determining the maximum
mapping level for a gfn proactively.

Allow NULL fault pointer: Modify kvm_max_private_mapping_level() to
safely handle a NULL fault argument. This aligns its interface with the
kvm_x86_ops.max_mapping_level operation it wraps, which can also be
called with NULL.

Rename function to kvm_gmem_max_mapping_level(): This reinforces that
the function's scope is for guest_memfd-backed memory, which can be
either private or non-private, removing any remaining "private"
connotation from its name.

Optimize max_level checks: Introduce a check in the caller to skip
querying for max_mapping_level if the current max_level is already
PG_LEVEL_4K, as no further reduction is possible.

Acked-by: David Hildenbrand <david@redhat.com>
Suggested-by: Sean Christoperson <seanjc@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index bb925994cbc5..6bd28fda0fd3 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4467,17 +4467,13 @@ static inline u8 kvm_max_level_for_order(int order)
 	return PG_LEVEL_4K;
 }
 
-static u8 kvm_max_private_mapping_level(struct kvm *kvm,
-					struct kvm_page_fault *fault,
-					int gmem_order)
+static u8 kvm_gmem_max_mapping_level(struct kvm *kvm, int order,
+				     struct kvm_page_fault *fault)
 {
-	u8 max_level = fault->max_level;
 	u8 req_max_level;
+	u8 max_level;
 
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
-
-	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
+	max_level = kvm_max_level_for_order(order);
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
@@ -4513,7 +4509,9 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
-	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault, max_order);
+	if (fault->max_level >= PG_LEVEL_4K)
+		fault->max_level = kvm_gmem_max_mapping_level(vcpu->kvm,
+							      max_order, fault);
 
 	return RET_PF_CONTINUE;
 }
-- 
2.50.0.727.gbf7dc18ff4-goog


