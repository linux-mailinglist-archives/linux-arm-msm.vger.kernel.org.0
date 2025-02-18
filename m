Return-Path: <linux-arm-msm+bounces-48406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A1A3A438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69B751663B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E6D270EA1;
	Tue, 18 Feb 2025 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gh/Zk4Bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082726FA77
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899509; cv=none; b=FvZX4MbWdVr2Ca6Jr9UrydaKcK/bH/9z4cmmn5ZcmiQwR+OW3vRO0YrtKeW5tRbZtanWJ5+unq30kFWEhrCNJGjIzX99m8pZeI6q9w4PqD+bd8TdakAFXSe0sMeXmfULf0yfyKQnoNtjOe5O4xvISWF7mnZ2ndBwfblJZF6n8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899509; c=relaxed/simple;
	bh=43rNizzSVgdeItdPhdTWXMFw0SBkzpnXAqvvl1tjk9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uMl3C8BC4r7GmkSIlx7aptuQhjM1RdCiX9Se5Nm3VyFuVFUlX/4UWMEFTLWDzVH6rwVVrcWDtiGecg1HfzQBi5Uo2wS/CSbMYoeOuEy+iuz7CSBfkdTGe0EBBOcMEsMAb63PgIdeKQI3rfHi/qP74gMkvKjIzWtnGKdcg7mQDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gh/Zk4Bl; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43947a0919aso47366475e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739899505; x=1740504305; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uH+fBcfhHBnIgnx24Za2RqEfoW93YGim4l7wHxezgLs=;
        b=gh/Zk4Bla1GzFHkYWJJyKSVBd9Z7NKOPGstHeZ+cUsLftDBLrBT3HSFW7T5GxViEFf
         0N9b5F0q4hHKFXvIPtAxkGMv/mV7uHpAJJ2A8qvpexEXnvr9dbc97fHYHZc74kvw0YYN
         WGpifiqP3u9OACMp0bIG7lDI+n71/X4XZ4qvEHQF8MazIzl+9eJKPVZZbEvtP3PsmA+/
         snphWv8qF6ssD11C4XZujuGnkdZmX+JLOCmr1cxnTUUCXnPa7NqOb2hKJO72gMvdrtfp
         E7wVc+sESFbrmVU3T7VoCjtxC2tg3KDck1BIU8NmgNH31oj9IZQT/u0B3kj3M0EpHgyi
         HfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899505; x=1740504305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uH+fBcfhHBnIgnx24Za2RqEfoW93YGim4l7wHxezgLs=;
        b=aLsc29ZzFhnH0O/TmJLwoJxl5KkEYua8YoX/AiUeUS9WaKKvISqAkTGsmALmIT6oaY
         G2U7A5/94lS01FpEMYoJS93QprHYZ00Z3qLphydITlfbM+Ope5UkLOTxW29yejC1evGa
         +0D0fM1I0/om11CvLcYpU38uzd2wPWFEcwOrGVIl1ZB7KxZWkwNMJeNRYHVD2VAEFlro
         /uqm2+i6hcaCS94znNpSB6fWNEDpJu40j0L+qvWHnxmjEoRVPo3yScsJa6DwoyB+ezxm
         /qZ8M7pQgv5CuhAoeDoKlSs1TAa5lIrKBeFvhPDpimNLCS35ucXuv4w6mHetPxErZVer
         G91A==
X-Forwarded-Encrypted: i=1; AJvYcCUjJ66Ly6raaj3ACrhIwmV6Q1KUru3BMjhF+29hYTvNRmUCuC5jUucK7ygToaEY4VyKa54ChUwbak0Zntc3@vger.kernel.org
X-Gm-Message-State: AOJu0YzAljxT5U3cps0T1mkSHzigp7EQhiKIEu1Qls3u0LbaWDljHjQU
	5sO4S6U6/iGBqX5vrRk5iDgGq8zHDC3pZOeRG241/rh2a+9jsYKvN1uYCp5frSwC2l4NpEdD8A=
	=
X-Google-Smtp-Source: AGHT+IEO+Q4R/pkJYt43fJfT5ZiB8RQT6Y+1MuFVz/324xaxqgmgHccN+PjmLq2lzd6582it0nkgtuGjWw==
X-Received: from wmsd12.prod.google.com ([2002:a05:600c:3acc:b0:439:9541:1cf5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6547:0:b0:38f:2073:14a7
 with SMTP id ffacd0b85a97d-38f33f56437mr10419463f8f.47.1739899504782; Tue, 18
 Feb 2025 09:25:04 -0800 (PST)
Date: Tue, 18 Feb 2025 17:24:51 +0000
In-Reply-To: <20250218172500.807733-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218172500.807733-2-tabba@google.com>
Subject: [PATCH v4 01/10] mm: Consolidate freeing of typed folios on final folio_put()
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
Acked-by: Vlastimil Babka <vbabka@suse.cz>
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
2.48.1.601.g30ceb7b040-goog


