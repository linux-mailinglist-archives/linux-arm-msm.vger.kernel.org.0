Return-Path: <linux-arm-msm+bounces-51180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C39A5E341
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FAEE3B5784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A19253B73;
	Wed, 12 Mar 2025 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y66iuVne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FFE25744D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802314; cv=none; b=nZ/6Yt2wj4YR6j8Zaff23egKiVgmGcmHZkui/jBzlJN/lLD/wMi688Qrky4pTn06Z1VnETqi2MhiZfb07MsmUqYd6J9cw+HDNnECAnUBbuAEOIs7cCy+3R73d4u3sSJYPRdYg/DbmSCZXTTWhgSbOplRJjxgrChgTP4CoCNFKgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802314; c=relaxed/simple;
	bh=3FS0AjD6bP0RaVtYsMwEFCHIRnAMnaOeO0UFnDNd6iI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VnOuaANyeTeHZV16WVu6QlIimhTUgejbH0KR8u+eBblxGGw1w8NB1Z2onDKNON7ZwVw35m4Yr2JUNgP8DECRVs/QNyCKKr3JRWyrCXFMSM/grhR/H76/wXO16uxM1HLLcy8YOINwl5rRaa57qM9hV9fnx2Q8nPfQPFBEYWJgn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y66iuVne; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912580843fso81278f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741802311; x=1742407111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R85+vuKuEEUS0jeCyrC0DyFve/WtnRZfc0oDmfyiJIQ=;
        b=Y66iuVneY6rtnVjbdhjsRoe1vbHBW3LPkhqIJUE4drpZCe8iQI8mruva9Q9Ks0YgcV
         y3quLskRJRbWTJtDDk3+fHpfkJF/DzZ1rK/YwvBf4ZpjcHer4v6ZueicG4eJFSM5iyvA
         sWsh6uI89N3zEyJuYp39OO+s+JBMkGhOKCtrGBtFJ8FYJceGj9gJ95qoV1LfKFuG3tQB
         BRCVSYbhmhRgajEK0P+aPiKiWhwo5S0Goooj6g3AqsjnC3oDJPg7hO6dMQ7RyytTuq6w
         u8YB7QUX6Bbd0X2U+fZWAzmCZhTt3c+NE1WtVGtoCgavnKAdYQpz67PTegMdVS6pzV1c
         0TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802311; x=1742407111;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R85+vuKuEEUS0jeCyrC0DyFve/WtnRZfc0oDmfyiJIQ=;
        b=nGmyUhZ3L1Zf6f5JlNsUuM2FKcwIgF90cmI2YiYtH+sS6kTZBg2qKNccj6rcXTViO/
         MmrSL1gRC19NvJUP+wkxGJUgLA4hcsXkg5IsqaTplBxjbS4Aeb3HWSZkUGlBq4Ld540C
         xyB2Dba0LSF1HEjEc7ZK9Ejk+EQkWq2/cX8BB7k+yfj1N5S0jNlsHkps9KDA31zHm66S
         VKuOFsuLLhSmlrg4EH+gFIKli2Sn8H9wxvNkEmS2QHQK6V70BcIZv3wKo+gKrbtKpuUG
         ycA6SRwUYJ/rsunOVPiaHqcdwmFOWnaBpSZjscPA5BULHs2MnadLdctECf7J7ZNZblUI
         bnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWraNnUEfsTDzjNC0wYeV+xRWr+wPsF40cgIxAE2wQv3JcTHE6UHL2xl6VbSu2gAGBOZWjVTrvsqskBYHeK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97crD6JKtfynDNc7Zb/5OsAbFhb8BESgDRvA88/D9Jq/pmCl0
	tQzI6oedFEMolei8Bux+BLrRHvUAxFwGer3KyXL9DVg2XrhtHuUxn6E/+hIkm3Xpgm89Xhwgaw=
	=
X-Google-Smtp-Source: AGHT+IEjA25qbz56/ZivYmOA/8CzIw+8OnvV/Ld9F8g5Xe1iEl9v0x7DnaQxJbHqJscC5/DJshWP+7a2dg==
X-Received: from wrbgx5.prod.google.com ([2002:a05:6000:4705:b0:391:3c12:d0cb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:178c:b0:391:3768:f448
 with SMTP id ffacd0b85a97d-3926c5a51cemr8018324f8f.49.1741802311548; Wed, 12
 Mar 2025 10:58:31 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:58:16 +0000
In-Reply-To: <20250312175824.1809636-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250312175824.1809636-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312175824.1809636-4-tabba@google.com>
Subject: [PATCH v6 03/10] KVM: guest_memfd: Handle kvm_gmem_handle_folio_put()
 for KVM as a module
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

In some architectures, KVM could be defined as a module. If there is a
pending folio_put() while KVM is unloaded, the system could crash. By
having a helper check for that and call the function only if it's
available, we are able to handle that case more gracefully.

Signed-off-by: Fuad Tabba <tabba@google.com>

---

This patch could be squashed with the previous one of the maintainers
think it would be better.
---
 include/linux/kvm_host.h |  5 +----
 mm/swap.c                | 20 +++++++++++++++++++-
 virt/kvm/guest_memfd.c   |  8 ++++++++
 3 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7788e3625f6d..3ad0719bfc4f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2572,10 +2572,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 #endif
 
 #ifdef CONFIG_KVM_GMEM_SHARED_MEM
-static inline void kvm_gmem_handle_folio_put(struct folio *folio)
-{
-	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
-}
+void kvm_gmem_handle_folio_put(struct folio *folio);
 #endif
 
 #endif
diff --git a/mm/swap.c b/mm/swap.c
index 241880a46358..27dfd75536c8 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -98,6 +98,24 @@ static void page_cache_release(struct folio *folio)
 		unlock_page_lruvec_irqrestore(lruvec, flags);
 }
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+static void gmem_folio_put(struct folio *folio)
+{
+#if IS_MODULE(CONFIG_KVM)
+	void (*fn)(struct folio *folio);
+
+	fn = symbol_get(kvm_gmem_handle_folio_put);
+	if (WARN_ON_ONCE(!fn))
+		return;
+
+	fn(folio);
+	symbol_put(kvm_gmem_handle_folio_put);
+#else
+	kvm_gmem_handle_folio_put(folio);
+#endif
+}
+#endif
+
 static void free_typed_folio(struct folio *folio)
 {
 	switch (folio_get_type(folio)) {
@@ -108,7 +126,7 @@ static void free_typed_folio(struct folio *folio)
 #endif
 #ifdef CONFIG_KVM_GMEM_SHARED_MEM
 	case PGTY_guestmem:
-		kvm_gmem_handle_folio_put(folio);
+		gmem_folio_put(folio);
 		return;
 #endif
 	default:
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2aa6bf24d3a..5fc414becae5 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -13,6 +13,14 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
+}
+EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
+#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


