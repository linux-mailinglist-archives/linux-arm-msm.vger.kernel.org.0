Return-Path: <linux-arm-msm+bounces-46535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D907BA222C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D218165DFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFB11B4141;
	Wed, 29 Jan 2025 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zNQUINif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8681E0DAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171410; cv=none; b=IAm+RmmUQgQkp/B/16sEKfRt6r+YG42I0TpF4E5v8zK99t8b9e84iHuEqbVock4DuoL0KKv0oQWLYiKKOdmpcUUvjNiUtNNvDwRFrBtFhtelJIQr2NnogDeR3EZYlmkZIyN5IFPJUmN5rBEIiryzKzpWtPh2QLiS36eGTGl9biE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171410; c=relaxed/simple;
	bh=q0YYNmpSl5WMN3SXyHQshvfzi443utG7AJofjE+SvQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VtbuXxVGkk/oPp5/653WhgqC8pX073e27sK1dbqO6C38qqxnx6nUX4ErM7wUjb9bGYKpsmWXACoDc5gv5aubjLzPxSwXStc3e5eV989Qvmn6SXWJ5x3tQJmEAjpkNsOa9TnfafFn/zyefXYSNoEsDcU/uA+tJ2FZpLt3n0eJa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zNQUINif; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso38462425e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171406; x=1738776206; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoF+4xfgxTm/p575y9XCqcSYW8AHz4umMJsaklpwUz0=;
        b=zNQUINifB4P7y1BUkdpwto1vYj8vAErCkdWXGIWBs85AgC5ziqqzCJ0UqhAJGxzOZ6
         FRXW4WrEeUlA8GHmtK0k7uDF0nyWep5eCrsZEaoxpDx9i/IlHNP+NW09uveuGSoBpOyF
         Z/NUFZ9/yyzzvlaoqsbi1hjX9geajTpzP2XNpsKgLg8pGzq1XtOVXGZZlXhudvHh4YWQ
         a8GYPF7u6anv3RBOndvAfMesoXQQvNrmFfC4ly2oNmN4C0qqeR7gjOUzMmvZhSf9R1zc
         luOHSmaV2G28ll41Xb7T3MdmNvys2CFid7I+FuOJCwo8plSG7cPQPIsB5NvkxpXcySMy
         lWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171406; x=1738776206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoF+4xfgxTm/p575y9XCqcSYW8AHz4umMJsaklpwUz0=;
        b=mNPGoy5PFILkLukC2VhLGyDpVF7CDJ6ZTmmFjmt0dra9qmj71BtBpoOOBrA1ErwNP+
         4xQ/wTW5nrCPzdzLWUhAulsab3w4GQdV8aBcO91GcIBUzpVhlucEcufX006Zgaki/HR5
         vBQUx1xnodyxw+tbRb8boah8WFxuuGNyaqu+4j4sjzSvODToSfQLiNjr4T8kLV/GLXLq
         8X5zCHSl+d3SFIGz8rLjQQuUjrEAregj9wqpW1NgZDDwdxMW4JEWWwUoZMjQrjGOUavT
         Vmn7jGZq5vgvPZzD0EDwapvo8uEeyyzcfX7Qn7BbVj6uowu586fyKAKYRF1mOBdRAVdB
         yF1g==
X-Forwarded-Encrypted: i=1; AJvYcCWFDp/qqHJMyKRtMxbgxlMFJzFqQoSrjySXsJiamC1VO3RyRMMu9ucniqJRBUrQmHKyGQDkXHmmHXa3vFJR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24y/jCs93IqDe2VNjhbDTDwIjeENA/BeySNUfceGA0l4Mzhb/
	dGoIEpRaZenWgbnrpMsGP2HcJtiYrC1wuluUjT9LnTqd1KIUJ+eEGKwvrg/+qXFb8FzXY8oqZg=
	=
X-Google-Smtp-Source: AGHT+IGJ+0GvDv1cmo5xMm/8jI+35SnN2WajY5bhLqVpw0IOvEaGfT+KLFYF/7jjtxYb3vLecx8RvCq3Tg==
X-Received: from wmaq26.prod.google.com ([2002:a05:600c:6c9a:b0:435:51:727b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e52:b0:434:9dfe:20e6
 with SMTP id 5b1f17b1804b1-438dc3fc2b0mr35391245e9.23.1738171406534; Wed, 29
 Jan 2025 09:23:26 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:11 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-3-tabba@google.com>
Subject: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
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

Before transitioning a guest_memfd folio to unshared, thereby
disallowing access by the host and allowing the hypervisor to
transition its view of the guest page as private, we need to be
sure that the host doesn't have any references to the folio.

This patch introduces a new type for guest_memfd folios, which
isn't activated in this series but is here as a placeholder and
to facilitate the code in the next patch. This will be used in
the future to register a callback that informs the guest_memfd
subsystem when the last reference is dropped, therefore knowing
that the host doesn't have any remaining references.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/page-flags.h | 7 +++++++
 mm/debug.c                 | 1 +
 mm/swap.c                  | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 6615f2f59144..bab3cac1f93b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -942,6 +942,7 @@ enum pagetype {
 	PGTY_slab	= 0xf5,
 	PGTY_zsmalloc	= 0xf6,
 	PGTY_unaccepted	= 0xf7,
+	PGTY_guestmem	= 0xf8,
 
 	PGTY_mapcount_underflow = 0xff
 };
@@ -1091,6 +1092,12 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
 FOLIO_TEST_FLAG_FALSE(hugetlb)
 #endif
 
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+FOLIO_TYPE_OPS(guestmem, guestmem)
+#else
+FOLIO_TEST_FLAG_FALSE(guestmem)
+#endif
+
 PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
 
 /*
diff --git a/mm/debug.c b/mm/debug.c
index 95b6ab809c0e..db93be385ed9 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -56,6 +56,7 @@ static const char *page_type_names[] = {
 	DEF_PAGETYPE_NAME(table),
 	DEF_PAGETYPE_NAME(buddy),
 	DEF_PAGETYPE_NAME(unaccepted),
+	DEF_PAGETYPE_NAME(guestmem),
 };
 
 static const char *page_type_name(unsigned int page_type)
diff --git a/mm/swap.c b/mm/swap.c
index 8a66cd9cb9da..73d61c7f8edd 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -37,6 +37,7 @@
 #include <linux/page_idle.h>
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
+#include <linux/kvm_host.h>
 
 #include "internal.h"
 
@@ -101,6 +102,10 @@ static void free_typed_folio(struct folio *folio)
 		if (IS_ENABLED(CONFIG_HUGETLBFS))
 			free_huge_folio(folio);
 		return;
+	case PGTY_guestmem:
+		if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
+			WARN_ONCE(1, "A placeholder that shouldn't trigger.");
+		return;
 	default:
 		WARN_ON_ONCE(1);
 	}
-- 
2.48.1.262.g85cc9f2d1e-goog


