Return-Path: <linux-arm-msm+bounces-64995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CAB0567A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F084A2E5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4EF2D876C;
	Tue, 15 Jul 2025 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdWJHVHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0AF2D7810
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572047; cv=none; b=RpPXFrq9VUZUfhuCMVbDhAMkEJLsBgOGxIsVlE/IuYcpUlHbUYf/IIfn7mh+JsczWVcwC9/x8GvVs5c6y99zQIkGsUmwRMacJPnuSCldvTSifqusGtrOHZbqENbXPxMfoffpbCHICVcySBTDneTjwnA2sczZPr3aMck+xhawtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572047; c=relaxed/simple;
	bh=eAbMIJcHK/F51o9nr4guiznjnDwffZaDRzSajhDolHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n1XzayCrrdFb3rVccVItMyqZgz/kP9jJ5dm3PGsgLz0go1r1dP0ReUeDY0MIv2Z/1BO7N9j9a4YVZTUTk24c4lte5K51xzA+gOswPSm75f9SBxiODVoSX4ZfRTGo2TUZpbdtUOogHvCakxNe8Ddz6AH++hybyij1FXICcH7+sGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdWJHVHr; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so2356068f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572044; x=1753176844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7j61AiDEYKRdqOr/Xh1CHmy2PK2pOlrkOryB4JYpx5E=;
        b=sdWJHVHrnHKeVLXA47K/lYpIUlpRhHREd9dyWQLfQyemdin1HAFKewLCu5WOgc+1Vl
         bwYyTcRt4/KNsCINm5pQHIFatvG6Uyq2XDByMhfUhh5RxeNHniSL2WPl1xSyYt3QLF1A
         LG8C7ruQqNIPNUShKcxwvPzd/B2xchY0EXbPCwtnS1Q/AWrgKjOjuhCw3zF5VUTxiUq/
         unwcnr2klBhJVB8+lPLeNyo5XNBCy06OikDb4Rm6pwIrb0CcOaWqdHIuMNrV1/micHcF
         UHoRuwk8MgtbjKfN1hb6sRzSgD89LeCbsMzhDG9FH7Ty2o2rv7A59aFQQDq0uvCEwVdN
         g9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572044; x=1753176844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7j61AiDEYKRdqOr/Xh1CHmy2PK2pOlrkOryB4JYpx5E=;
        b=LL27efDEqU4p9fm9HAn5COUtp1rKDVrH9aqdjuRDry+GnxwwsdIPQ/ZsOrE6dNWpMb
         wNXzAiV/VJlepD00Hur9DGJHWV/pjRl01wRJCiBkVQj9jSkLFalx7PHyvYmcqXmGZWTY
         9dyUUmEy53FVN0SzOQRA9KaMtQOlvcO3n81x8yNli9cfw7+MVXLvx9XuIr/zo36e74ag
         rO/ZeU4ZCTB95Q5/Htr8z1kncy1BFN+gTBials8U1fj/+UquvGdUICgGJtf01uXyepSK
         EVX1xJMT57uf5v1EoSZYiURTODoc/Ce2cv1tAppUMyxdvH9i18u2+ZXCppH2oUlVEvnf
         2LpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZhISojDNxGggMYG88pmUDwJ8zrOkwW6kbzbHvalbi6388Ey/1F4IfkKCE/RXJlEg5zqUtMQwiUfW+IYwa@vger.kernel.org
X-Gm-Message-State: AOJu0YzlC0st3FEVD8YJWBLJ9Grca2LIf0kJfmuF7EHcHfu7FCwmSfI7
	6NWcTH3mFGA5cnar8mcu1wG7jJGBDS//gxCBks9Mewj6RAUT/UDYXi0zf/3rhoTvxEWFlwdcsIP
	SJA==
X-Google-Smtp-Source: AGHT+IEOvr3wyT4KsjEFui8u47n6x+FVFq3D3Cl0DCM7gD+8djYdie0rM5VY70PS34cmaOF5B34O1xWZrQ==
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:456:43c:dcc3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:200e:b0:3a4:dd16:a26d
 with SMTP id ffacd0b85a97d-3b5f2e0f727mr11480418f8f.38.1752572044316; Tue, 15
 Jul 2025 02:34:04 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:33:35 +0100
In-Reply-To: <20250715093350.2584932-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715093350.2584932-7-tabba@google.com>
Subject: [PATCH v14 06/21] KVM: Fix comments that refer to slots_lock
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


