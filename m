Return-Path: <linux-arm-msm+bounces-64191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0590AFE6E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0697C7AE034
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC7628A415;
	Wed,  9 Jul 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2c5eZjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36D28F53F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058805; cv=none; b=B6wZ3YZc8/sUQ1s45mPMzC6MnwT9Iv4dZb0RkxiGTZ/i3EVLy/FBQ7QbdcU3nhA5e5fbHbhp4hf/qCv38gewqRsmNLPz0x3rGpo8FvSpjsrOf1P88WlaJOqzlb8p9Vvb84gngZ/CEw7e7G3EeC18ZeWayUspdBwKenFg0MiJAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058805; c=relaxed/simple;
	bh=JCn1lTzYIPFyvHwsyJ2jgIYxGS7NbJ4eaQ8Duik+pXc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qyJSiGiehuTnYEAb730KwtIhLTCRwGXXzeCpD46Yv3GOJNN07tQtzVeyNA7aDgWJzvBRBqg19jNcbeKDNdvRnPJB0KbsC4TqPtTT0JSzq19vwRfgEex4m+wXGrQE+uKQTCPzb5A+GjWEFels4EKfoLwXv5VZZ6r2HYh1JlCIs3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T2c5eZjn; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4530c186394so20973525e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058801; x=1752663601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTgA0PsTgYLAc78e2afXwU8uZgXh4OcRxe9c8n26j1Q=;
        b=T2c5eZjnKMjUixyzMOtZqjJNp2uHMSy6lFPt9B4rOL4X0Nsmkz4P8+zv+IM3yBshEg
         hsbpdrPLIoYucPQm0x5QHHm2QlDWhU3pNJ/BsrDXacDojt+beUT6kchpYkaGTE9Zt9EQ
         PRiGjyXEbb4ps941SLG1XNAhhIuymvzurokdbetRPaGxQuw7vmbVK1V5+QFdd4LeF9KY
         LlWcjd6Ox8aUMzpzM5VAAwGLiC9fWNiuikE01p4D8JtrkMDWkROppA8PQVD5uyHfwbi4
         l4BYVSBHq3YU5hohKOqmhgnlqI8TruJ8kf8U9Ctn76WRmZDUWAvtSfKnOlao1jYrjQrt
         bGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058801; x=1752663601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTgA0PsTgYLAc78e2afXwU8uZgXh4OcRxe9c8n26j1Q=;
        b=s2YoABUeLKKCs/PMLsCwD7GhtcowtrlP42R5ZyZEkvq/UtsvwuJC1w7WyvkdYEDWyc
         2aD/BjUO8w0yzIAw7naQYch0uiCgqct36GeK9CYdqnQ15eI/rnz/SnSp8PpHaLEBh2DW
         EpZ02sMQ6F1+NbblFaTSr1W96TRqEVsLongbIErHol8N/lhW5cRV7PAP2iXblmObicSY
         UPtYndypn/ezt/5CdlmiOeE1gppx7CmByFbvrY0UGPrnng8IWsflpBd+VLk/XCx+hMgZ
         C30gU7eU1VhS1GY8dIkBTLfOjRPCbxhnTOYV6c2Ht6RO6GiIXQKXcTb8wA0rM3R+S79s
         HP9w==
X-Forwarded-Encrypted: i=1; AJvYcCU3VGSXPF5n48ibB3ClL8iggtH2uxoB42rG4JwrG3dXErFz9g5Bh82IjdW65fnmubpeMfBBDbGwYHRqKfTc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyndz5B4JtBllDoDPsr/siv88+Pxno3WviR6I4uOw+Oo+NmL01w
	N643djz1+ssZt/H7GccNveodV7nxpSHiFXyNuZ/tbioQBHyN34Z6MqBrS4uPNNcQlquP9GSNjQP
	8Sw==
X-Google-Smtp-Source: AGHT+IHmepntDq11YXRLBIOku0QsI7xVin+WFrXXjJmGV1ZmT9B18wyRpgQ41zGx/IWpeOmqxXI7huyApw==
X-Received: from wmqd14.prod.google.com ([2002:a05:600c:34ce:b0:453:86cc:7393])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8705:b0:43c:f6c6:578c
 with SMTP id 5b1f17b1804b1-454d532c4b7mr19454575e9.15.1752058801425; Wed, 09
 Jul 2025 04:00:01 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:32 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-7-tabba@google.com>
Subject: [PATCH v13 06/20] KVM: Fix comments that refer to slots_lock
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
index afbc025ce4d3..81bb18fa8655 100644
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


