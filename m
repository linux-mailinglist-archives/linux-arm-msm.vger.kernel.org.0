Return-Path: <linux-arm-msm+bounces-51787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0456A67944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEF453AD98A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E362D20E70B;
	Tue, 18 Mar 2025 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6NE0H9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840A210F5A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314858; cv=none; b=YE5nj6a3IbjkUQNuyuqhk2PoxL+pxwnV+Me5y3dbmxm7soovVpQ9Dk8Y8w1Y3CjMx+9m2CgJgRDPq7FNP358f5UDHGGuQLHjA+p57KXOPjOLVPjroCmKqfEuRr5Z5UKp7iK1ftVaLJX1neRBO3+klKopK5tSBt+7G2WA6VwMuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314858; c=relaxed/simple;
	bh=ZUn2qEyVEu13Wirg+1ah/shBPJIBQ0RhDgdACeIp8YM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WcO+qQGmHD8x5Bmd8xFEfNAnE/KGoW/lFftj5ukvLPa+V4ZGd6PqSzvtePnDHbCMa3ghXUPKrox+D1FGH2TBbBWl1ladSGq7laLdnhd2luDjMjLsX3yTPQETFox9jTBqEH5IeGvl1bLIxzxO8QzwcIJl4iT6ow+9hwMn4wcChjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6NE0H9s; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceed237efso28903935e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314852; x=1742919652; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rIMCAizGZejWtu7P2Nd20c3m6UoVLaxoQ99DBpyfZ/M=;
        b=m6NE0H9s3btCA0iEmLMmgYJjcpx0wc9mE/rkvXb2GFXtQuD+aytTZPk+n6Fe2xjUBM
         YoDIqT1aytlHfBcAvd6AtDKrjuFaaj1bmWGYIE7XXEwfqo6zpdfLRWxpGn3TbpIi9tLu
         dO9dfquCyHzMMY+776HEHPtprUIWPVcBnu1kk04bKgQRyipBlmvsRmC6QQ5icwcALl/6
         FZ/0U05JUG2wMbxBLbP9lyRfp6W+rnJmAOq5R9AGseYmhWLFzHrDKzfx6QdwDAXBIZBH
         iJnPOWUJkVWC1jcacJvZzUHnOsDqJpjUEuNGVJMYYTwUXsJU8TecS1Mi0D51exWtWy1r
         jW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314852; x=1742919652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIMCAizGZejWtu7P2Nd20c3m6UoVLaxoQ99DBpyfZ/M=;
        b=byvePRuhvDMUgmF2S1BWRYETpdETLhgXa9qaYoUX6yjTi3t1uibfKVQFFZn1DKVRxl
         bs53Ih9+b4GvZb+aPNZhFvj6QduRGrSHYuaiJF6uXdkGPPO91P22iDwGe8eZWBHrs7xc
         ifslYzPgNe3RlHC2vjNNp3gEWoaXDw20Kig1mOKv+HkI1pq44xJei3USxwN/q9/oVdPv
         qUk0bKnQF/eynq1GCm0TyhsEiU4Fg1IM/7cMY3gykYqsL05ZPj4ujRYQRJhbPW+2Wd0E
         JUp8oWMs6xiwmBDYo05ylvgzfIIOSsrv5krP62p7/EYAs8Kd0dHnG74+9I4TagYMWckk
         7yUw==
X-Forwarded-Encrypted: i=1; AJvYcCVfN0E5Ml9Wnqjer6HKGmaniCrVDvMpmjmXHt3B6h9RD42dZtr7DApAJOL5qowxzMtGytPj9M8eA8NveGjA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5wdbvGUyQBCff/0wi9Ez5AbYGny01qUJxDFmVFrclF4t3P9U
	Guki8/27ZY/ivE+7Rnye+PnJLroxAZqIDeEINjHtC9gzSg79qaGYkswsqZR/yY+njlOD84/35Q=
	=
X-Google-Smtp-Source: AGHT+IFmHd9CyHM8TklDJLl/Zwd2hd7SSZMAwOsu5I2BqW7wDeKi1D4jAZf4EsiqIdJLp0CMxLUAq5zQDw==
X-Received: from wmcn4.prod.google.com ([2002:a05:600c:c0c4:b0:43c:fae1:8125])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5103:b0:43d:fa:1f9a
 with SMTP id 5b1f17b1804b1-43d3ba2971emr26297695e9.30.1742314852121; Tue, 18
 Mar 2025 09:20:52 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:20:41 +0000
In-Reply-To: <20250318162046.4016367-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318162046.4016367-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162046.4016367-3-tabba@google.com>
Subject: [PATCH v6 2/7] KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(),
 which retains the folio lock
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

Create a new variant of kvm_gmem_get_pfn(), which retains the folio lock
if it returns successfully. This is needed in subsequent patches to
protect against races when checking whether a folio can be shared with
the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/guest_memfd.c   | 27 ++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ec3bedc18eab..bc73d7426363 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2535,6 +2535,9 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
 		     int *max_order);
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			    int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
@@ -2544,6 +2547,14 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
+static inline int kvm_gmem_get_pfn_locked(struct kvm *kvm,
+					  struct kvm_memory_slot *slot,
+					  gfn_t gfn, kvm_pfn_t *pfn,
+					  struct page **page, int *max_order)
+{
+	KVM_BUG_ON(1, kvm);
+	return -EIO;
+}
 #endif /* CONFIG_KVM_PRIVATE_MEM */
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 844e70c82558..ac6b8853699d 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -802,9 +802,9 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 	return folio;
 }
 
-int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
-		     int *max_order)
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			    int *max_order)
 {
 	pgoff_t index = kvm_gmem_get_index(slot, gfn);
 	struct file *file = kvm_gmem_get_file(slot);
@@ -824,17 +824,30 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!is_prepared)
 		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
 
-	folio_unlock(folio);
-
-	if (!r)
+	if (!r) {
 		*page = folio_file_page(folio, index);
-	else
+	} else {
+		folio_unlock(folio);
 		folio_put(folio);
+	}
 
 out:
 	fput(file);
 	return r;
 }
+EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn_locked);
+
+int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order)
+{
+	int r = kvm_gmem_get_pfn_locked(kvm, slot, gfn, pfn, page, max_order);
+
+	if (!r)
+		unlock_page(*page);
+
+	return r;
+}
 EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
 
 #ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
-- 
2.49.0.rc1.451.g8f38331e32-goog


