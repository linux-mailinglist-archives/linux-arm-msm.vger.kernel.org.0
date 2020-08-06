Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0CF23D59A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 04:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgHFC4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 22:56:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39270 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbgHFC4i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 22:56:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596682596; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GSqGnDAtFz2eN+4a/6d10DfESlZhpkDU0wGAOPxxqGE=; b=tr0jNjnevfsB2VkW/M3/bgkfPLY67SyvGagUl7yn1WjRQIxB6hZkD/O1/4+EFtMZ8lz35NWN
 8LwvSa8e/+a243nMKluJFbt7JQCH9C9derkSKM5hIWt5rM8LjUVMNBNKLWOUYwa29+bd+rlq
 Hew+bfVH9YZc2bg0ja6L/sb2W28=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f2b71646372cee9a8eba3db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 02:56:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3A64C43391; Thu,  6 Aug 2020 02:56:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from cgoldswo-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37839C433CA;
        Thu,  6 Aug 2020 02:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37839C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cgoldswo@codeaurora.org
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Susheel Khiani <skhiani@codeaurora.org>,
        Vinayak Menon <vinmenon@codeaurora.org>
Subject: [PATCH] mm: cma: retry allocations in cma_alloc
Date:   Wed,  5 Aug 2020 19:56:22 -0700
Message-Id: <1596682582-29139-2-git-send-email-cgoldswo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596682582-29139-1-git-send-email-cgoldswo@codeaurora.org>
References: <1596682582-29139-1-git-send-email-cgoldswo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CMA allocations will fail if 'pinned' pages are in a CMA area, since we
cannot migrate pinned pages. The _refcount of a struct page being greater
than _mapcount for that page can cause pinning for anonymous pages.  This
is because try_to_unmap(), which (1) is called in the CMA allocation path,
and (2) decrements both _refcount and _mapcount for a page, will stop
unmapping a page from VMAs once the _mapcount for a page reaches 0.  This
implies that after try_to_unmap() has finished successfully for a page
where _recount > _mapcount, that _refcount will be greater than 0.  Later
in the CMA allocation path in migrate_page_move_mapping(), we will have one
more reference count than intended for anonymous pages, meaning the
allocation will fail for that page.

One example of where _refcount can be greater than _mapcount for a page we
would not expect to be pinned is inside of copy_one_pte(), which is called
during a fork. For ptes for which pte_present(pte) == true, copy_one_pte()
will increment the _refcount field followed by the  _mapcount field of a
page. If the process doing copy_one_pte() is context switched out after
incrementing _refcount but before incrementing _mapcount, then the page
will be temporarily pinned.

So, inside of cma_alloc(), instead of giving up when alloc_contig_range()
returns -EBUSY after having scanned a whole CMA-region bitmap, perform
retries with sleeps to give the system an opportunity to unpin any pinned
pages.

Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
Co-developed-by: Susheel Khiani <skhiani@codeaurora.org>
Signed-off-by: Susheel Khiani <skhiani@codeaurora.org>
Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
---
 mm/cma.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 7f415d7..7b85fe6 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -32,6 +32,7 @@
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
+#include <linux/delay.h>
 #include <trace/events/cma.h>
 
 #include "cma.h"
@@ -418,6 +419,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	size_t i;
 	struct page *page = NULL;
 	int ret = -ENOMEM;
+	int num_attempts = 0;
+	int max_retries = 5;
 
 	if (!cma || !cma->count || !cma->bitmap)
 		return NULL;
@@ -442,8 +445,25 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 				bitmap_maxno, start, bitmap_count, mask,
 				offset);
 		if (bitmap_no >= bitmap_maxno) {
-			mutex_unlock(&cma->lock);
-			break;
+			if ((num_attempts < max_retries) && (ret == -EBUSY)) {
+				mutex_unlock(&cma->lock);
+
+				/*
+				 * Page may be momentarily pinned by some other
+				 * process which has been scheduled out, e.g.
+				 * in exit path, during unmap call, or process
+				 * fork and so cannot be freed there. Sleep
+				 * for 100ms and retry the allocation.
+				 */
+				start = 0;
+				ret = -ENOMEM;
+				msleep(100);
+				num_attempts++;
+				continue;
+			} else {
+				mutex_unlock(&cma->lock);
+				break;
+			}
 		}
 		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
 		/*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

