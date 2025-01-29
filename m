Return-Path: <linux-arm-msm+bounces-46534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C81A222C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B324188439B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB76B1E0B7D;
	Wed, 29 Jan 2025 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tL6S0aEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B391DF728
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171407; cv=none; b=EdiqgXWi2uqvAMgUZUF+DoWl5zOjD/NCK30D8Bkwr5RJuLWs8+OuhZX0betWCYrw7LT6DeZnl2kgE2v6Y20S9BWe5k7tMjXOaNhFADfdSSrMLNCcRIg0lbr75U22V5sw8m6x1+9CCWbjiweXrBfybYaSm70+kVo3z2Eg/IrS8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171407; c=relaxed/simple;
	bh=7AlMcFMWzcY1KBVpuAkyCgonVme5/aciBVZa8uL35zs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sjmGe8P36cviVxN0AMClJbEoy8pLYa30jt0HUf2zSM7Jf+tW+qgI8dq4oWDA2iL7+JAt79FvpONBgkRGC9CTlTTv/Feg7+WM4/3Tpr9mQ32PMEvcz26GT99c5vFENGsNgMQMRXLq0YVxyT0jRVi5iTrxUZlUewJPr8zn8YGAAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tL6S0aEI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43673af80a6so50967135e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171404; x=1738776204; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDaVGDLi8mgRhdRmBEo1g3AHoA0NuWvKpi8mcLq23xA=;
        b=tL6S0aEIOa2TEspeIfvXTr7zmNxNvew4FArh/DZqgxQ8WUalZU+TtiCmpVMYNN7riM
         /mPUoIhlE2SosBgm2iBy8HRXYJv3RXVAiUbRvODhbFtMrot3fRU2N80E+iO4jHxLIKH/
         s+pxCZbUtfq74HoPjFm0tdph/krU1SOhLtrcxxKvewu9UWI9FFGjTZtC8EhcMZlwv4v8
         K2HRpbdgV/vseJV3SPWecHiI85nQ6/FidlJyBvo9fvZ/SaaV7UkIfS5aDim1Fvs5Ui8Z
         St0yTvxuC0rgoQuYm9GDCeGQxdKtAvTB3+C5jq9VC6vb8toFraR765EIRyoXWVskvheJ
         2Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171404; x=1738776204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDaVGDLi8mgRhdRmBEo1g3AHoA0NuWvKpi8mcLq23xA=;
        b=nvUyrC6YbfYhI5VMd+otMc3nWMI5AFnLMJar/7qO6q56avZ79oi798Eqogqrg/LTnS
         OvmvROFmRQfLCZr0jQQdZxn++oLC/UUkKuNsVjd0oZDtAPVpyqd+IYOegOe4a/PC1BnT
         YXhW691xtYqgXdAlpTDGDCyISenv418L6ZsBT9Zh3LOXrzaQOo//u5j4w09U2thRWRVc
         21nXhle2S7QPplAeGZ4ph6Y0QO83GyblLSFUW+fJ58zK7KL+EztQsbY26gG+fcyJqDUb
         E75fAkCIQsJq4U9KmO4meN/lSqRdFRtOyk6iWTLxJrVPdc9gYGKiO7cOeHj+bewX8oXW
         sskg==
X-Forwarded-Encrypted: i=1; AJvYcCWhFD/Wr4lDCTzbBY3yDo+Hou2qqsCp3W3fnq6WBtw/OQ8zhEieo72fKyoR7AgeAG/O8k6wm176Fek65Xom@vger.kernel.org
X-Gm-Message-State: AOJu0YwHt/5ZMPMdWGzur9e59rmrnlHVUfYSQT4U4vHyGO+8CS25Tqe0
	dk03xZ8uF0h+6UqywsdOk//d/+Gh2bEewnVEg/R2d161/Wv79KlyYzxcXN7YEwQqfCY5WZctbw=
	=
X-Google-Smtp-Source: AGHT+IG7AAxXO9uUL/TV8lWRjQ0ckYe36dATBMk94k2BjGqrWcfbwhKyc4W7DSJHTwQDQb5yqHpv0ii9Sw==
X-Received: from wmbbh25.prod.google.com ([2002:a05:600c:3d19:b0:434:f173:a51])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d26:b0:42c:b9c8:2bb0
 with SMTP id 5b1f17b1804b1-438dc3aa595mr34124635e9.4.1738171404499; Wed, 29
 Jan 2025 09:23:24 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:10 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-2-tabba@google.com>
Subject: [RFC PATCH v2 01/11] mm: Consolidate freeing of typed folios on final folio_put()
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
 mm/swap.c                  | 22 +++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

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
index 10decd9dffa1..8a66cd9cb9da 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -94,6 +94,18 @@ static void page_cache_release(struct folio *folio)
 		unlock_page_lruvec_irqrestore(lruvec, flags);
 }
 
+static void free_typed_folio(struct folio *folio)
+{
+	switch (folio_get_type(folio)) {
+	case PGTY_hugetlb:
+		if (IS_ENABLED(CONFIG_HUGETLBFS))
+			free_huge_folio(folio);
+		return;
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+
 void __folio_put(struct folio *folio)
 {
 	if (unlikely(folio_is_zone_device(folio))) {
@@ -101,8 +113,8 @@ void __folio_put(struct folio *folio)
 		return;
 	}
 
-	if (folio_test_hugetlb(folio)) {
-		free_huge_folio(folio);
+	if (unlikely(folio_has_type(folio))) {
+		free_typed_folio(folio);
 		return;
 	}
 
@@ -934,13 +946,13 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
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
2.48.1.262.g85cc9f2d1e-goog


