Return-Path: <linux-arm-msm+bounces-45437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8CA15446
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E603A643C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C671A01D4;
	Fri, 17 Jan 2025 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YfwETm/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271219F43A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131413; cv=none; b=FE1B+cLcKfEmptbMYgRU8W+vJIJ02X4zHoxw4BUP56uLFiXwZwTSu+k3dS3IkPCdOQ0ymUO9Ub91NsUaE/0cnKtQ3anvlH10KQ0zfUqNJaubfTdWsrGf8i4ATxDN91ldn3paNaqOS9HdqcLk7JbpYKPsl4i1z0ttBpKQs4JPyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131413; c=relaxed/simple;
	bh=wJDTqTYb5qOVkruyLS6xy0+CGJ+ccVuPegwnSapcTDg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dyh38FwAyMcxgBBJ5aHqSbFx4Y+XkmEqqqenHWOQJ/lKH/6q2woUnVENuin5HU1UDp2JYbAVHhoUIusvENKdcL4qjJA2yzTRRx4fKlVoypYYp9J7b+ZKtzvtd9culdXouEJJqUv8VQx0KBjB7YfPhXIDyd1Xci+NNQPlMAK8sLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YfwETm/S; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361efc9d1fso16508355e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131410; x=1737736210; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i68yYctGbzvQYlSdS0p+4WdM6JfkNAVslQef6pXRQ/Y=;
        b=YfwETm/SA5T8WNoGUbIvHyj5UuJLzov81HyU0b248O2jLI/K6aqkN7ZCFYatTJBgfG
         6oHkPoYzTVXf1G2e6KAkTauf2ZHRIQUSRb+fpnOWsuQhcvEa5HNVovaahMIvQ0KawAyd
         imIFyibWF7OJ74mkp28Tc5mkyrKt2lje9445mmQODhkxz8+XmyCwwLu/n7jrxTt6XxR7
         YjFz16CDwXq4OV5/uBDL8gnI9MVge1JmvUFIL3un0zThFRo+wDNtLvUgIDJqapP8MR4n
         IFJUXyW3rhpvHJNEQM6yII5O0JWevuh2KwMY0dRrKCBXD3cQATP+zcuxzp8s8uYa/cik
         xP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131410; x=1737736210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i68yYctGbzvQYlSdS0p+4WdM6JfkNAVslQef6pXRQ/Y=;
        b=ectjXlVl8JZBAfyMKaysPDRf5JrLN5err013AZ/ZDFHJhKAYpGfrUM4Q/hqfA8L24D
         aXswdQ9zZJITLADlEUdVaMdl6YMEdfcnL7r8KsmsGH4YO4P8kv1d6nRuBsBSktzWDPhh
         KM4aS6grFa0C43cYhP8qPClmIYczI5+lPZXOxlHlVVReK3sfMOf4kswa0dsUEOzpI5zh
         7WEHZCp2TGsi4LxV6VEiJiI1xhbcEJ8f5lXDOUOrtS/6RAZyOGnFGha762A55egqkip4
         DE4Jx91rE75qk9alNfnRYcJVIb/C/zkChoqtxB2/PFmQhA3z9f9x4GISUfV86m+N3MhH
         5brw==
X-Forwarded-Encrypted: i=1; AJvYcCWQuw2Yqyzx9B1HeB3bsSyA2dri2z5pA/D48/cyA7QsRAke3TbVrnAwM6aIXoHbpgex0kvN5dpMD3IjgrVn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99jXwcU3rDc5mcP8Pe2H6BwsoQgxwNf3YnlGX1LF+U/sH1MMY
	GKnExffYE2txWglekfXIH2kU5fWiKxqeF9Im4i6X5NQP5ve3rxUIxd7wumAJWLYryv4pt756GA=
	=
X-Google-Smtp-Source: AGHT+IGdZ+elMcO0tC2o/blUEAO2sesjnET5jVfx30pYB41ogtDO4dGi3tBo1ONh1MJc7o8U8tLatcsfwg==
X-Received: from wmbhc13.prod.google.com ([2002:a05:600c:870d:b0:42c:bfc2:aa72])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b88:b0:436:488f:4d8
 with SMTP id 5b1f17b1804b1-438913cdba3mr42250775e9.11.1737131410248; Fri, 17
 Jan 2025 08:30:10 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:49 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-4-tabba@google.com>
Subject: [RFC PATCH v5 03/15] KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(),
 which retains the folio lock
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Create a new variant of kvm_gmem_get_pfn(), which retains the
folio lock if it returns successfully. This is needed in
subsequent patches in order to protect against races when
checking whether a folio can be mapped by the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/guest_memfd.c   | 27 ++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..cda3ed4c3c27 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2500,6 +2500,9 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
 		     int *max_order);
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			    int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
@@ -2509,6 +2512,14 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
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
index 198554b1f0b5..6453658d2650 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -672,9 +672,9 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
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
@@ -694,17 +694,30 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
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
2.48.0.rc2.279.g1de40edade-goog


