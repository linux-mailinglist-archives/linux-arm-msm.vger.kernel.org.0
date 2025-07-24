Return-Path: <linux-arm-msm+bounces-66574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35EB10C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63E7D1D00506
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB312DE710;
	Thu, 24 Jul 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iClEbVMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D832EA16D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365408; cv=none; b=LngDACKF1rwKlzcsnNsDMohWWfEz4Cu0cDEfMKZuwHBRZNYelE6M9CWy+0pBr3kgJ+YRiRwvJyM/zHu//PmkWSw7y4ipVsFBdF36wE0hSeZch4118fMIKh1WVTigTMbH/6L0O8j7S8WnAyUbCEfNh28d6XDdHDnOiwnzV3x7tUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365408; c=relaxed/simple;
	bh=4mzNhzQY8HFx0bk+CHpi6+2DgmZYfQ8vHH6EB20MlrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMxjK+eRLnJNpS/T15GfYNxVyBBXGTLyezZjBAHdU8vtNlQkJx6GAe91+2FKv9yF9POi90qpRRGB+dlqnDykNhUZKb/M1YbdxIbpMWQoRTgGB0IbEiY9S9YRaKuTpFrqexknBp+ye83DdmBL8NZluyYXKo2j43nZr53xZ/BGWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iClEbVMJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so7222915e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365403; x=1753970203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5mN880WCISqsqqypOE0OCrYzPzbEuiPZ0HVDAJk/kA=;
        b=iClEbVMJGbk/PyxXaSMMcxMAAqWn6IMjOCGbXGY4SbpO6tWlrOvED9WZH1STFKee6Y
         hHtDKSjj9AXb/itAOMfu+NlNgcBkRokxFC5lEdIpCJJ+u0F3wh8ftd0RFHgtT2YaraSq
         ketGNDB0x/WxBU3SwLV8Obj3mnpIWnW4qIcuRREvISdg4EGUpwQhA4rQRanVEWxhschX
         QLhS77NmD3AasXN5Yqd1WPeHDUyi4MJVAtLajTy+fiY3NdBPLN5juxw4sHLap8dmWM+E
         K4f+4lYqgXd1aplpdLav6VbqVnXZ3qrRTthuhfvreR8lU17u+Vsgb2/2AhqcfcZPWSjc
         BIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365403; x=1753970203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5mN880WCISqsqqypOE0OCrYzPzbEuiPZ0HVDAJk/kA=;
        b=p/P37dwXJR73aQt5Y2OmIpGVHZmnEXe3+n8FEQrpJsgljOsIvhfw52ozW0PITC/BKQ
         ldm66WpO5q4NlVdU/rkIvE8DarLE44XFi9Dn+TxMWQ2fN64pB3sSMIleXWQVJxDUeYuZ
         TWxhfYpV5jS+oy0dAr52zGgo7bow5rvLREPCwP0a3NWO3N6bfAkSgq/Aa6B1IG6x6O5U
         3h6YLnYR+WmVb6iUUMRVtDIbLLJZgXQsoP2qUWkkTvRNqlmQV3W2ebbJqsa+yl+TZItw
         WUZ8o4n/BAWXR7PTYn4urrHj3X2l8t0IKuRhMv5qSTuWBeMS2bK06MEzotrz/icy9lf1
         cXPg==
X-Forwarded-Encrypted: i=1; AJvYcCUputoTXYC2G3efEBz18MqXH0I29GgTEYByAul9bbdpa2lZ50IpbZggpa2mwlGXz10PIGyKhRPd+WLAiVDU@vger.kernel.org
X-Gm-Message-State: AOJu0YxycVwbXDvltdnMKNhMHApgrL/ile4sXbU3o1fEaTNKqX7xx7LD
	Wl/vIeiD/6zgyK6UQBlsXuHABETFrjr9WWZKWdoU2JT2fUXLuu92/H55mFx3IEpHGSs/UgEkqTj
	Ly/JyEQY=
X-Gm-Gg: ASbGncu0yGNGLKplMN/d82PAtaXlmLrFndJR2rbxRPmNoukov/pcZiBu8WUWlJ68yQD
	UNbed8IkXZZLpL5B5NfpqjIYtD7jVtkCrL7K+CZGZdbInmef+lW8aXNi9yGd34N31GuKHs2jUdq
	fCyEEhPJwagC8Ey6tTgoVJFgIidISF+9RoIhtLdtpDzx1ZD6P8c4P9lHKMseom/E1R04937JPvn
	urzO6pu845e/RwIh1sC4OpXzEssOuifDHT+ZzjoAw2uSH6nkUBb5x7+aNkWCN7G3Kw7muw5L3Rz
	UZevNcR7XlYgkB1ajZy3Rm7hBf5fzeBkadGAWk4CZ7rwX8ot4Qf+px0JQdE+xr+VvK2PJMV2N6q
	L7mpfXheHv3y7up4bTeFaelIsyTCSVpduTSEE+3aPQ3kKTKef0xt//NKFU1UMrOKh2dqJGrRWVf
	y56VbRu/tgGgJhvx+aMBgVfcU=
X-Google-Smtp-Source: AGHT+IF4egT06XIAWuc0TJnVdNpe1wQ7sn3xvEGeH8Rc0pzDJnMJjBpN4GYnZW+sz3u5f7Eq0JGLQw==
X-Received: by 2002:a05:6000:3103:b0:3b5:dc05:79b with SMTP id ffacd0b85a97d-3b768cb0f15mr6041122f8f.14.1753365402888;
        Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 23/29] mm/sparse: Register information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:06 +0300
Message-ID: <20250724135512.518487-24-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into kmemdump:
 - mem_section

Information on these variables is stored into dedicated kmemdump section.

Register dynamic information into kmemdump:
 - section
 - mem_section_usage

This information is being allocated for each node, so call
kmemdump_alloc_size that will allocate an unique kmemdump uid, and
register the address.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/sparse.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 3c012cf83cc2..04b1b679a2ad 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/kmemdump.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+KMEMDUMP_VAR_CORE(mem_section, sizeof(mem_section));
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -67,10 +69,11 @@ static noinline struct mem_section __ref *sparse_index_alloc(int nid)
 				   sizeof(struct mem_section);
 
 	if (slab_is_available()) {
-		section = kzalloc_node(array_size, GFP_KERNEL, nid);
+		section = kmemdump_alloc_size(array_size, kzalloc_node,
+					      array_size, GFP_KERNEL, nid);
 	} else {
-		section = memblock_alloc_node(array_size, SMP_CACHE_BYTES,
-					      nid);
+		section = kmemdump_alloc_size(array_size, memblock_alloc_node,
+					      array_size, SMP_CACHE_BYTES, nid);
 		if (!section)
 			panic("%s: Failed to allocate %lu bytes nid=%d\n",
 			      __func__, array_size, nid);
@@ -252,7 +255,9 @@ static void __init memblocks_present(void)
 
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
-		mem_section = memblock_alloc_or_panic(size, align);
+		mem_section = kmemdump_alloc_id_size(KMEMDUMP_ID_COREIMAGE_MEMSECT,
+						     size, memblock_alloc_or_panic,
+						     size, align);
 	}
 #endif
 
@@ -338,7 +343,8 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 	limit = goal + (1UL << PA_SECTION_SHIFT);
 	nid = early_pfn_to_nid(goal >> PAGE_SHIFT);
 again:
-	usage = memblock_alloc_try_nid(size, SMP_CACHE_BYTES, goal, limit, nid);
+	usage = kmemdump_alloc_size(size, memblock_alloc_try_nid, size,
+				    SMP_CACHE_BYTES, goal, limit, nid);
 	if (!usage && limit) {
 		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
 		goto again;
-- 
2.43.0


