Return-Path: <linux-arm-msm+bounces-82553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50264C6FC5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 674212415C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA84A3A79D1;
	Wed, 19 Nov 2025 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="topb2Bvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FAC33C1A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567160; cv=none; b=VUwe4mcqt837Z/DxxZS3uUTgD1g/miwZ/wwrvgMgJdUJqaedTqlGVenmoMwidwpT+7fBQmYabwRcTKLrC+V94b1sr3ORA/TB2wBC5EKhmCoNUGE0k3XxhozINPUvBUHmLzSbfjN2a512U3Ro4Y3PbqIsiZi4MA9i+46VezX4SpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567160; c=relaxed/simple;
	bh=UTLUC0zYLNIpIU6hlTY4UtGB00tOu5axyPBTWNkQRLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IG9nHNS82JKCPPk7BxtvgBIMbc10XzJtnk5DoVTCTUDFSjGuNMc2xKtQ+viwfHVaYn2XZdVXOSNhA3uBWEVMffR2kvj0RFElUofQ8SXSCXMjaeidX1ouXpkPRz7kfjLmH0xrB2J7Cn16iyTSIBBZ08sVtsbMPhvOCcXqi8k0n+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=topb2Bvh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so4797451f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567152; x=1764171952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=;
        b=topb2Bvhry0CkWkwgvz5KAsjSApRvdGEL1pk4gMYp+l4C8pvgogsHSnOylyQYtNqmK
         xj7iQtzRUmAd9OItTRZYSMc/IzfCoVaVreqgx/0YEF3wJeXogmRbE18mBN+eLD00CRbY
         iQ7DeBReF3MEWzqmOejNVnppa85e7BV6FTKJYdyxTgm96vEEgfbr1/sNC+CpwzR4u3Br
         fChbO4MWB2+bwmXjYximwr6WjjZcWE4JLslUhK2xGsDrBD7MCbXDaWd71K9ivllolQQp
         zIEgSm+Da5qdhnUixIs7MzqvUebI3nSqy6Lw2+6JzsNBgyLN8jGP+XjoNUVRUMGhXAlZ
         mtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567152; x=1764171952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=;
        b=byjJ+H8JEYU6lpGd5Q4f52XUe4vo0ACEhHWVWMrdIxI21fB0yA9TRkaq24FhGZjK12
         dDo09SQvAyLsFip2KrSxxThEgm9NoWLTWWEjyBCTZNS4CQz4RCX6MKCCh1nl6MaSDr6t
         HwqUrqbpO/vupjTIZsCkV/i5LWesJmDmORLEHTOqCjytu7B0AM0c7XKXBshhdovZ32F9
         BoGPQXCKtcv9Vdo4upKxhH3hVgREpXtLFNyiZcyA2LM/LdBipnzm8ebGiv7q3SNLCMvP
         ODdK95ygsLjQ7hvZoA13KwNYifx9LMBsZjpLbmgX6j+pgAvWOiORJvL+o8dM9CeQbcH7
         o6xA==
X-Gm-Message-State: AOJu0YwzvW/DwCjMMT+3WWe08s8e9FeJbmid9AvYwQ+7eXQmKpO8ws2k
	BnBWmqGlWqQBQ17rgo91+J7j27OSR2RhgWjohcty/ex73ASYg3ODTHQO9OQWoaqVz8olXUj1UM3
	im8Gt9pzfSA==
X-Gm-Gg: ASbGncuklwlQ2TVUH6MqmHUFMdL9xA1lOgHdoLj6LP+JCMyVL5PRZ4wV3x/UpZOtjib
	kDP3E2a4rih3lEimFYfUCob+ah9k+Ei4XIViu7KOJeAzrSB+zH3TuBEqUNyD4/quu59Oj9NjpHA
	EeB2ydCD2EN/pFxr2QOdMeXez3riD0ZIR5/vsHc6ei5IHFYc4NN/7lTRfImYnw0VWzTFiG21N1X
	zCoRhvJyqnX+3GG33pMolHHGciIqjxsaPVSJTqqq1XI6l1FdCs9CDAnRv6t1L0bBO30J7RzXFHC
	EYYLpKkHwIhJ3gRYgsUvtS2DKttrPKZ+pRJ9evE86mLPJTCOucwuVifGznp+FrapSa6UWkmx8Ff
	UrEAA9BoD3uuSNkY60lc5Rx26zm+zOEpXqYJQTUS2zeV/UmXWaWJZloO2LX6FReuZ38qUADwISN
	LL3qnuD1GsF/PqjuEVhguSpslKQtoW5Q==
X-Google-Smtp-Source: AGHT+IGiIxmeqrKKXMpyNCEgyddWcck0X4KYjA7E97PFt6A4ulW3WkSU04Vt6omGLvNuAQXzgiycDA==
X-Received: by 2002:a05:6000:2888:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42b5934db2cmr19180692f8f.20.1763567151698;
        Wed, 19 Nov 2025 07:45:51 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:51 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 20/26] mm/sparse: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:21 +0200
Message-ID: <20251119154427.1033475-21-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into meminspect:
 - mem_section

Information on these variables is stored into inspection table.

Register dynamic information into meminspect:
 - section
 - mem_section_usage

This information is being allocated for each node, so call
memblock_mark_inspect to mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/sparse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index 17c50a6415c2..80530e39c8b2 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+MEMINSPECT_SIMPLE_ENTRY(mem_section);
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -253,6 +255,7 @@ static void __init memblocks_present(void)
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
 		mem_section = memblock_alloc_or_panic(size, align);
+		memblock_mark_inspect(virt_to_phys(mem_section), size);
 	}
 #endif
 
@@ -343,6 +346,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
 		goto again;
 	}
+	memblock_mark_inspect(virt_to_phys(usage), size);
 	return usage;
 }
 
-- 
2.43.0


