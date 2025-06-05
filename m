Return-Path: <linux-arm-msm+bounces-60328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54EACF332
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54B73AC876
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E3A21C177;
	Thu,  5 Jun 2025 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPlDbY/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC3213236
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137899; cv=none; b=L888uKAT37XAzX+wjyzlCy0A/eG/nTysu11gtCSkEB3wu1EVcqDZ4dPgfEW5DGlHpRrrchW3JP3aoV0dpD0uOwkq44h0gO99HvZlK2Rms/nyU0x26jy88KjBCApPZPst5IIHDPNVbnvmOu5aLjb/xoNQSOgN/mm3HzhFTmEBv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137899; c=relaxed/simple;
	bh=x+fQBWn0/0ardBRy78HzYroQyc4L59a6RPCtPgDdFMw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=itHoG2xgxB+MHX0gUMUTBVG6HKtt0HfZ+UNyTv9XvNTIxMOmBYXrIWkwuLQdSGiBjl4m85yWa/t5zm6ABI1JszoSdrarCI540Mpe/i0120sOixVO3tOGuyfxv7T4yi1mZORYhb+KNQdv6ESYIDOhTJh+6iHpY7OB3wV+ZEmPYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPlDbY/8; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so506530f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137895; x=1749742695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bX7rVYDFpCzF6sNW2Lfy2882XEAhzLwmJkPHB1Upz9o=;
        b=lPlDbY/8hqnrTZTe6gJmLH4hiHcH76n7mp2dKpbG2LLjIPMvPn1KqcD+sKDeg09h2R
         cKXt/LXy0RS6u7jeCbJWh8AuNkhFK6DbehbistUC0DK7xhFqUpxExHRj81ust6siqx7r
         erZBmn0tWx3FcGErXL3orhYVSDNXF1igvWAh0YJjE7T6PEOQLd9fxI7Wvh6Ra02OGW5Z
         3gM3Rc4449oisAZWEj1ixfqB9qhgL+WW2ZfqXzRPONvPn8BjljwHFN3a1pe7WHPuSDPA
         Gqi1UVhhUr23RbT10NiEUjUMEI1/Zywlmm3ZGks8WKvnzfTwFjnQFWeg+KPKM1qDrM7k
         +Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137895; x=1749742695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bX7rVYDFpCzF6sNW2Lfy2882XEAhzLwmJkPHB1Upz9o=;
        b=WEor0dx8wChSf77pp4wGOqVKkw7AlWd9GYomOgbe1dk/TRfnK3jNLcaG+teU9iRUWO
         CZH2B0RvJEsnRqYlW7CTsnVj8+Uu4W8F5PB75B9T2IEBoQJGI/q1jBed7yCsSzFnH/CK
         sAx6YVyO1a0Bx0BytVWDbwp232j4pN0MhPvJMuB0MOSduvxM1n7TwZrwaCc8ra4B34l0
         iq/Ohuyx/NNGFsHDAi/gHuCYJOFmNOALpFJ6uEhESZoC+TWHQaBU99su+3rfbj4CLJt0
         5n6Dd3L1EhXJiZlNeepPEupiuuGDL01RkADCy7NoRRsCpqYcPj8zgf5rJNmKsH22IA08
         37gw==
X-Forwarded-Encrypted: i=1; AJvYcCXxQv3M+fU4XNfNDxUnx+Te0t6KW/ked0vVdBffo7TjZkvhxpIujyMphD1OJaN8ONa+ElBFHAvImaxpILGU@vger.kernel.org
X-Gm-Message-State: AOJu0YwBXuE8bArQcT9gxXwzGMBFcVN4XnVWytwUvbO4Pio7GbC9sE4u
	wjMTkTftqmxGx8Ai2nqdHagJyV467uXvK/89DTq3At7u8aMXRPV0AMgWv092hou776QPMWal6Uc
	hyQ==
X-Google-Smtp-Source: AGHT+IGx/NxvkfS2OFg1baPqeoVFV4d0bcEnAR0ITEv4+pM80ouDhmtSHUvc8cTeZfEpmvTkRzfFHQzWbQ==
X-Received: from wmbji6.prod.google.com ([2002:a05:600c:a346:b0:442:f4a3:b8f5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f53:0:b0:3a4:e002:5f97
 with SMTP id ffacd0b85a97d-3a51d8ef871mr6732462f8f.1.1749137894915; Thu, 05
 Jun 2025 08:38:14 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:48 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-7-tabba@google.com>
Subject: [PATCH v11 06/18] KVM: Fix comments that refer to slots_lock
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
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d9616ee6acc7..ae70e4e19700 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -859,7 +859,7 @@ struct kvm {
 	struct notifier_block pm_notifier;
 #endif
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
-	/* Protected by slots_locks (for writes) and RCU (for reads) */
+	/* Protected by slots_lock (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
 	char stats_id[KVM_STATS_NAME_SIZE];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2468d50a9ed4..6289ea1685dd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -333,7 +333,7 @@ void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * All current use cases for flushing the TLBs for a specific memslot
 	 * are related to dirty logging, and many do the TLB flush out of
 	 * mmu_lock. The interaction between the various operations on memslot
-	 * must be serialized by slots_locks to ensure the TLB flush from one
+	 * must be serialized by slots_lock to ensure the TLB flush from one
 	 * operation is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-- 
2.49.0.1266.g31b7d2e469-goog


