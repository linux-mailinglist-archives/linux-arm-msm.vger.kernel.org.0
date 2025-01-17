Return-Path: <linux-arm-msm+bounces-45435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27FA15442
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE779188C282
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FE419F419;
	Fri, 17 Jan 2025 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KA9Exixe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EFF19DF77
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131409; cv=none; b=UU71oIqFJblJrk4Zu4ZgZp7QKTaJiro8QaAgKhFBy6df9BkC5LtygsVcXSNqacpcrTjdXGILN9MC8y7cjDJgSNDPCCT73r+arXamt+BdwQKuMxvUkidBFBjpzgEDwIznuGqzIJaa9R1xWD4buAN01p/AR9Otw0FQtOeuaVXfpxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131409; c=relaxed/simple;
	bh=b+j8O1fpySwBHjRCH9MHnwAqg83B8SsV5VqTyV6rv9Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bdj3mQ2U6eC6JJbvvv6syQN+7p07gGaizL1VcvftyR5Hbmwj1qwEVkrKsxh2UqdsYu2KIDH7YZ52ql3g78hAXK8swVyt6ZOUCsGR1KGnZL+mTwh6LDugXsC5e4W9xz9gt78oFLgmahoaSrkBgc2T7wNN8b7nsRDanzjRPvKW59A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KA9Exixe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so16615895e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131405; x=1737736205; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MygWVLHFA/Ogghouk9TRsaDRRHDK/dBL9FKQqgrSGb0=;
        b=KA9ExixeviYHkk4jhPhmuHGp+sucGHBbI7lp1KCxMw/yGi6vbyAW1Awx7uTbQDr9vy
         MmuK1ahfWFL24rR9bCmQcFBFZK3gnMkTIFu5XUMA6+6JRsqESYUXXqWLU+/ZSjbwzR9Q
         /L0E3jqLPtp+Y82vWsdcuty8mDVIaak7v012UJLY7CEQtl0qKLeVMBCwzXIJTWm2lTVD
         DKZiq4mO+sieUwyTu3uhmbTsbJDNwK8TAgJPu+IqSm5ehyVzng5JjDhiZMyK4Hk72RJN
         xdTL+5GLXaCiaYvXF78xMOVr8T6fCLYs3FJ1QEOkRA3AIf5nV+SOjF0YVWalfNUUY/rJ
         bUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131405; x=1737736205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MygWVLHFA/Ogghouk9TRsaDRRHDK/dBL9FKQqgrSGb0=;
        b=FgyWFNKj7HEe/C3PQRqVQ7n8aIbaSaQtWRVdB/Ko8g3qboYvEpg+cUGe+nffGxjluZ
         GdNu1t+M/YR4Zdr3GOkFU5zFLAx4I45/g7+8ez7VfJ8b+CEAO8NEKrH6/QW9lICtLzJo
         ALGmV15JJVKix54pd64Z1K4tuowLcifXfXad3jjGrZjrKCD8veLjinG7yU3LHmgybKUx
         cMXd8dM8DStaf62k0OmYYENP85zyML8kG+bRh8Q6YCrxLDl/UK74EneWLOaUfrE0YebN
         XPjStXTm2Pd5fiP7/5m8NnV+xUcsMDOTmXjp6Q6YlznYVBRh2aq71zSbKievwI4w/NeL
         e7xA==
X-Forwarded-Encrypted: i=1; AJvYcCW/W7ZfgCQYIep58w9rwV851XE41yGGLTqkTF/4FfqSlnhdDzrKrHBBV8ZDZ4bZy5wnY/Kts8LXD/Ehg37M@vger.kernel.org
X-Gm-Message-State: AOJu0YxbScVhItpjjW/nmRDWGLEc5S3CzlOPjPeZE9xM4P2C2EaVLxFq
	DwBbe+BT801EhekpPD8Ej2tQ34ew10GX8X+8rmTy7QTDaHKzP9CGMxGCYPQv9sftnwsYWg8hUQ=
	=
X-Google-Smtp-Source: AGHT+IEHuE0O1Pmu3qZGQgThvn78WhmP89neBbw/jiEtDzguRVKTsO5hOjuvNpTFKXWiuoSlKkap9d2uOA==
X-Received: from wmsp9.prod.google.com ([2002:a05:600c:1d89:b0:434:9da4:2fa5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:524c:b0:432:7c08:d0ff
 with SMTP id 5b1f17b1804b1-4389143768fmr35144945e9.23.1737131405542; Fri, 17
 Jan 2025 08:30:05 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:47 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-2-tabba@google.com>
Subject: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on final folio_put()
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
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/page-flags.h | 15 +++++++++++++++
 mm/swap.c                  | 24 +++++++++++++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 691506bdf2c5..6615f2f59144 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -962,6 +962,21 @@ static inline bool page_has_type(const struct page *page)
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
index 10decd9dffa1..6f01b56bce13 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -94,6 +94,20 @@ static void page_cache_release(struct folio *folio)
 		unlock_page_lruvec_irqrestore(lruvec, flags);
 }
 
+static void free_typed_folio(struct folio *folio)
+{
+	switch (folio_get_type(folio)) {
+	case PGTY_hugetlb:
+		free_huge_folio(folio);
+		return;
+	case PGTY_offline:
+		/* Nothing to do, it's offline. */
+		return;
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+
 void __folio_put(struct folio *folio)
 {
 	if (unlikely(folio_is_zone_device(folio))) {
@@ -101,8 +115,8 @@ void __folio_put(struct folio *folio)
 		return;
 	}
 
-	if (folio_test_hugetlb(folio)) {
-		free_huge_folio(folio);
+	if (unlikely(folio_has_type(folio))) {
+		free_typed_folio(folio);
 		return;
 	}
 
@@ -934,13 +948,13 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
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
2.48.0.rc2.279.g1de40edade-goog


