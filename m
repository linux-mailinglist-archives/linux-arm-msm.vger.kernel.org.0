Return-Path: <linux-arm-msm+bounces-47558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E43AA30B69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4013AAF0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACE321D5B4;
	Tue, 11 Feb 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYNY547d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224D215067
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275895; cv=none; b=VYYqUQRbphumAekHzbm+9PzfkP8Y7XY52EFc9TCp5+U3qvr+lNzNHfn24mPAlHj0AqVA8uBHarn+kevfQ8cf6upNsedk/jH8xVv3YjE4zwvM45tkVqRhvxLIaRQ1WdfXUXFd52rIN4dx8DbJDwfiF7WyDLQp6N5zEOiWfpfugD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275895; c=relaxed/simple;
	bh=bdQ2+JsekwSNsQJcwdpbPIshgmTpGmjqg9MUbSATwio=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OUhgN0Gh23HF49c7Fbbaj3sAhSkk9t+8lVtug3aeq0bdarIDJ/FNV5/BtgvDPx6pnwzxv97eYL0VPST4b4xGcdexuOgNiVWFYgTklkvs3n+L1t2YRaRTPpr8nr4LlbkaWJSpsSOfcVcm0Bdb4mTsI2Og4iDFqUrLTfVj+eRIkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYNY547d; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43947979ce8so9215845e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275892; x=1739880692; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVWwkw4l/C0CQ72V45uYNbZ5qQP6QRpYAD9vOGg0YN8=;
        b=bYNY547dtEqXHHKR+V+G9HnAGZmtwc+UZTMUmmt2TzVK4KliLQhl9g7HQYZb3yQTfi
         fNm4ASFxur1lwuoNuQvt4y2Brmjsn1LoD4tgxB0jt3MdaJAZu3ImYiftngOpqSWMtXIJ
         JtTCfZDdNCBl8IIcxFOC+a+kKYfXrL8OGjtI+GLaUIn1SaX7BNBThGSHa3RH0CtByV+L
         emmADGDhx8vtjIjm/erdkC2Nn5/hBbWoCeQ5mdsanA9szEMciSHK414FlMlISDCb3Qdy
         Dy1AqDMUuAAQfyFgen93dGYG8hcuI3+z2usWjvC0SHslYL4d90Cx4+KtnvX5cC3VXyw6
         q9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275892; x=1739880692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVWwkw4l/C0CQ72V45uYNbZ5qQP6QRpYAD9vOGg0YN8=;
        b=GmU0GS867WxQFHR9hmvnkFenpu11QxsBK6+WjtS5k2n6unIbMgpw2x8afcNZYPM7gs
         wu//k5VKDt6pcvn3uYfKXV9P/mJle9MLRaPjuRcORlYI9wS1yM7EwVg86HMKet0roM5W
         Zjl7Q2e6CfSwh/VcTwj1WIXZ+AIowbCVSP+ONxM6tNRpG9wlIz9SdMIvAZMZGA72YWdP
         V60Sj5wwLuR7tkNcWFXLLO7zFk7cpcMdD+xnKDHVESirDtuAw5Izd5rM648v+Z+qJJ9z
         MeUbg93IYm25279+rxDQl8GfBnJ8SIsDyo9hsOtnm+k+rwnrvXz017K7I5k3EU1BC8K/
         CEAw==
X-Forwarded-Encrypted: i=1; AJvYcCXcm+mjLwbF2DtIehLPdy427FZygAW5Co0gVKkt9B9Znlv7n3Qdhpl1FXtp3UYWRnRlZsTx/yeoVrY4Nvvr@vger.kernel.org
X-Gm-Message-State: AOJu0YzEV6qzHCDeCFuP3xurgfb59a+ys5dMJhFs0epv9PN+48hI7mbz
	5JTSZeyuB/mAo1KFPYEgEArUmMQA7+soNAbJ2yE+N319RF7RWzRWQmx7P5IHcebbhlE5Vyld6A=
	=
X-Google-Smtp-Source: AGHT+IG10/vN0gzRGJ08Wn/qWLjVjCNkXjXTKTCGAHZrBJMQnayK6w5tSeoK7viwOkkpLU5EQQeSBy5Iyw==
X-Received: from wmbhc10.prod.google.com ([2002:a05:600c:870a:b0:439:4cf6:9186])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4589:b0:434:f609:1af7
 with SMTP id 5b1f17b1804b1-4394c808849mr36671125e9.4.1739275892079; Tue, 11
 Feb 2025 04:11:32 -0800 (PST)
Date: Tue, 11 Feb 2025 12:11:17 +0000
In-Reply-To: <20250211121128.703390-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250211121128.703390-2-tabba@google.com>
Subject: [PATCH v3 01/11] mm: Consolidate freeing of typed folios on final folio_put()
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
2.48.1.502.g6dc24dfdaf-goog


