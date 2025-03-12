Return-Path: <linux-arm-msm+bounces-51178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5DA5E33D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05D8B7A653C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449D32571A6;
	Wed, 12 Mar 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HsKnEIQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD801E8325
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802311; cv=none; b=LbjNHcGZW7QfS6AZBfkeHAGAn6s3Bn+szGLAokivixeWqyGpLtwmYc4SsLfzW71NVNDmW0Y7bfDoAZlnhGJndACVTCf0lv0tqSgDXVAcXjfv3JiF2WemkApkkVodzEqkDffmppScPF7o4skWn17V9r4l7SWRuauwWX7fpNgzDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802311; c=relaxed/simple;
	bh=u+cSBS6/5HVzpl9qyVlXKlFIoi4sTEN5V0QcfIMXDLs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SYM/XPQmctK3IZOGwT/yNHzz1p6m0shLEBifaAfKD2t6trilAXySvEVb4XZKhn5/icTlScozmEezOiFXKANNvtwgvo6jC2kwpBA2lvjktTdGvcSE24LJ1pD0UwWX3eaZ3rNK95BlO4lHVaDGqhCPw7jf0/3HcD5S5y2TJlndDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HsKnEIQ7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43947979ce8so696265e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741802307; x=1742407107; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0XpxYSrLEkx+yIzSfmPSimPPvYP4gD4dCRRx7Mg8GE=;
        b=HsKnEIQ7zBXODMNJ4dJ7IZSwy+GMFFD54NLCTWlb7Fsv5lSV2Er0RpCeDsxkEa1MTw
         53EuDQdlnv+lWQUBAG0rvNGjs6B3vkjyID5MS8hs/Jna2QMGyijroEsZFVA3I56AYSlT
         xS4MoGH1DKzt26l39cbpLl9Gb5piLho/WDfCT5tBqjw3UxWbJeRy71bX98OM6xhYVtXF
         uirLP4zKKzUKra/OBWzhxNJN0eBcXGifrhufzu1LKIUpHRBzu9aSGvMm2vRxtWMcO/I/
         qFv5wqQVpogvKEX8wZ6EaV5ANEAIGCox5VsglEcIXOQgpA45EUu0VZZBmSPRuVeB6mmJ
         xJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802307; x=1742407107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0XpxYSrLEkx+yIzSfmPSimPPvYP4gD4dCRRx7Mg8GE=;
        b=rRO0qDEnYPR16y0klOynvwyQw3r8QEizi7Dy+xRKVHRBRAzTYWyyGrQNy2yCQPZi32
         65MkbwvlPDLi1x1IGKINmeknfgyEmr4lFfYJh5LCnXW5UAjt1iOEy2RrqdDE11dBZOML
         7tCVM4CtVyglpcRwJcEd9yb54WaEB1205HCioH7RkHJkti09fJQUxIc/hmFEenUQBR+c
         TfgWV/Z2taMj7Icr0ewr5Ar+qogAhx6nqh9evjJkfM8ztyABpCw7cXuBMFXohrHT8itW
         2kXwZR/1x+9/h+iY75KpiN5Z+vr9Rde+NVtQIWb1j4yXuDKjlZp1tNdryu6ADZ+g1nDT
         1Uaw==
X-Forwarded-Encrypted: i=1; AJvYcCX+wT3hybez2JoZ/unTLGkOute/TDRUpELkVOjesfRzquLaOks1mo/mY8mFROpxO3//uJF6PFx+wec9hHhT@vger.kernel.org
X-Gm-Message-State: AOJu0YyykRPEJICijJzPzgS+REGH20Z7xiUUnyBBm8xGfekbnA6d+/8V
	xvYrX0t7UZNXs/bzoEjR01ZXzfvJcGiDQU7P6dXy+o6D+YSi4F/T2ADvdFVDwO+TlwBeTGj+4Q=
	=
X-Google-Smtp-Source: AGHT+IE5UDnnh3yo17yLxT5VX1BO5KQAMs8ianrYZo0AfgH0k/k4UkL9Aw8NmMGZsi98ECarhiOo1EOQ4Q==
X-Received: from wmbfp13.prod.google.com ([2002:a05:600c:698d:b0:43c:fb36:c419])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3512:b0:439:8c80:6af4
 with SMTP id 5b1f17b1804b1-43d168d4625mr1074115e9.19.1741802307671; Wed, 12
 Mar 2025 10:58:27 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:58:14 +0000
In-Reply-To: <20250312175824.1809636-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250312175824.1809636-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312175824.1809636-2-tabba@google.com>
Subject: [PATCH v6 01/10] mm: Consolidate freeing of typed folios on final folio_put()
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

Some folio types, such as hugetlb, handle freeing their own
folios. Moreover, guest_memfd will require being notified once a
folio's reference count reaches 0 to facilitate shared to private
folio conversion, without the folio actually being freed at that
point.

As a first step towards that, this patch consolidates freeing
folios that have a type. The first user is hugetlb folios. Later
in this patch series, guest_memfd will become the second user of
this.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/page-flags.h | 15 +++++++++++++++
 mm/swap.c                  | 23 ++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 36d283552f80..6dc2494bd002 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -953,6 +953,21 @@ static inline bool page_has_type(const struct page *page)
 	return page_mapcount_is_type(data_race(page->page_type));
 }
 
+static inline int page_get_type(const struct page *page)
+{
+	return page->page_type >> 24;
+}
+
+static inline bool folio_has_type(const struct folio *folio)
+{
+	return page_has_type(&folio->page);
+}
+
+static inline int folio_get_type(const struct folio *folio)
+{
+	return page_get_type(&folio->page);
+}
+
 #define FOLIO_TYPE_OPS(lname, fname)					\
 static __always_inline bool folio_test_##fname(const struct folio *folio) \
 {									\
diff --git a/mm/swap.c b/mm/swap.c
index fc8281ef4241..47bc1bb919cc 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -94,6 +94,19 @@ static void page_cache_release(struct folio *folio)
 		unlock_page_lruvec_irqrestore(lruvec, flags);
 }
 
+static void free_typed_folio(struct folio *folio)
+{
+	switch (folio_get_type(folio)) {
+#ifdef CONFIG_HUGETLBFS
+	case PGTY_hugetlb:
+		free_huge_folio(folio);
+		return;
+#endif
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+
 void __folio_put(struct folio *folio)
 {
 	if (unlikely(folio_is_zone_device(folio))) {
@@ -101,8 +114,8 @@ void __folio_put(struct folio *folio)
 		return;
 	}
 
-	if (folio_test_hugetlb(folio)) {
-		free_huge_folio(folio);
+	if (unlikely(folio_has_type(folio))) {
+		free_typed_folio(folio);
 		return;
 	}
 
@@ -966,13 +979,13 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 		if (!folio_ref_sub_and_test(folio, nr_refs))
 			continue;
 
-		/* hugetlb has its own memcg */
-		if (folio_test_hugetlb(folio)) {
+		if (unlikely(folio_has_type(folio))) {
+			/* typed folios have their own memcg, if any */
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
-			free_huge_folio(folio);
+			free_typed_folio(folio);
 			continue;
 		}
 		folio_unqueue_deferred_split(folio);
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


