Return-Path: <linux-arm-msm+bounces-64196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F12BAFE6C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A0033B9CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBA7288539;
	Wed,  9 Jul 2025 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KoaAriru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96482292B4C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058815; cv=none; b=i8w3mTap7sBamLDDpY1ltr+7DLXbT8wppJKojVLcAUEW1/qkNDDLFTbZsfW+n7Yp16mGzsQoPqizXs4HKG9VmLAgkm1sPxOaMXQ6P6g0FUb5jzBPRg6okWps0WRXORzg5AeaYRBIsCE60m6mfz/gkuTr8phCgiLRjQj9orBeuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058815; c=relaxed/simple;
	bh=fnBHlQaIaKmvu5+hck0Rmd7IjKt+m56uo5UueV+jRQs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G4cVtU3l5hUyQ48p0JUBD8BvzCWYpCii52+hKFkFemFgeK49fn1wUM68l2V1+UFbN30GkQFgip6v6XEDkxe1gWGD7KMt1O/ssvKysq+JNAU2U8NJSu8NO5HVpE8L1uERQyGd7ZniBBQW8OAxTeVp1BITo5We+DYrpRJzUmmxmKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KoaAriru; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso3564123f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058812; x=1752663612; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Auu8uvlzSKOU324XIVBTX5mUMTIARGkUiREXwmkL04g=;
        b=KoaAriruKTlNbXAQqEW3O3m9f6n73wle/oy4hAnN7VlIOi1jUgOGcX0GnefyCUyYfT
         14q+I6v4ezSLImqq7zWbk0ZnzC4R3KUYfwo7SmrI0/lRQ4tsLR8LAer2OCw6KeUshINM
         yb9yxvGZ37UA+lwv6vU3Jbg938C0xPYrHSYihoEWmkgKnnN4QTQBuC+Si69naGkwGeph
         caZ0gzQqEyMykAudlGYcbJp/0SbBnphaiAIgVwJtjfUe2txadvPh9pdFB/FEbFAmlW7Z
         Vaqb6YHvLcFIQ2HTcFfFbV7wiwmwHK/Fd2JMd6LhQ+9nbVED41khda0kyP6MpjcfGfIS
         I5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058812; x=1752663612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Auu8uvlzSKOU324XIVBTX5mUMTIARGkUiREXwmkL04g=;
        b=ht6TFEFg2v/zpDTyDyolpSeAMpTFaABPRWJMIHS2D7o/v8ctSEqHMTMcviUFDzF16J
         OHpw1CEm9J8YnLSfkhM1RNR9TIlpkQ0rP0uZen6bR5UoxrvgeWwoBftaspWbTblRIs89
         uYTJy1zJKSvsW2UVKnkoc87XgUB4v9iVAAa5YIqJqHl3VgzHAVIvzTSYjDoXT+UvliUF
         JhV6VL2QvueKHUJXwwz+iwPcU/FQpoEzc0h4haphM4h+RStcBkSq41wQEd4+O+SpnNZa
         GJy9JQ+34Tgi53FluAzAlT2xxqsiVe9m7erEAXQvTwwvXRic4lDKBqQ1JdAstg3+KVVp
         uIxA==
X-Forwarded-Encrypted: i=1; AJvYcCX7+5Dtv/zSokzmu9KU+HwcyWcz8lt7PrvWl9nILAA0qL0jgxNUEGzcaYTluLYrtkJWGnYG86jlXwS5PXW/@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqXyc8TK6rVMuPE2n3lHiNb62VX/k1PJKBCE+xZO1uDo4hz95
	8c1Q50U/374z+GFz46bRDnobFdWKqSFE4IPCU9ZeUa00d/scLLTCQdjYa3J5ZWD4VFgwlUSvhBB
	xqg==
X-Google-Smtp-Source: AGHT+IFPeiRjT/hk2eJKjjXIwZ7MAsw5CZ9JjPkhCk3imTKy+4sECTwl7nHXrtoS7dfr9P6aVkCK1zl5Ww==
X-Received: from wmbha11.prod.google.com ([2002:a05:600c:860b:b0:453:b96:8ef9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3c9:b0:3a4:f787:9b58
 with SMTP id ffacd0b85a97d-3b5e454249emr1500559f8f.58.1752058811734; Wed, 09
 Jul 2025 04:00:11 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:37 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-12-tabba@google.com>
Subject: [PATCH v13 11/20] KVM: x86/mmu: Allow NULL-able fault in kvm_max_private_mapping_level
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

Suggested-by: Sean Christoperson <seanjc@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index bb925994cbc5..495dcedaeafa 100644
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
 
@@ -4513,7 +4509,10 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
-	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault, max_order);
+	if (fault->max_level >= PG_LEVEL_4K) {
+		fault->max_level = kvm_gmem_max_mapping_level(vcpu->kvm,
+							      max_order, fault);
+	}
 
 	return RET_PF_CONTINUE;
 }
-- 
2.50.0.727.gbf7dc18ff4-goog


