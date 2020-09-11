Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2592668A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 21:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgIKTRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 15:17:09 -0400
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:36832
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725817AbgIKTRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 15:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599851824;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=3WsGh4k1/vDYdpwChY4cQkQgPgI0Dix7ehSHrqOmbLg=;
        b=hmBqoOMyOycrE7TB7AxYMas7iVA4aWRIrhvuU7OQFT7gYtBG1aveEuHgZTA4tv8V
        vDVvvGkN718JBEl9HTo/ESoXxfIpDaRdCtDktyVzGBjJax/uoNvtUrtyWhikydN8IIa
        RLVvOLXH989k2+ta6ivAJv4r5/IJ0BZFlRMCiang=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599851824;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=3WsGh4k1/vDYdpwChY4cQkQgPgI0Dix7ehSHrqOmbLg=;
        b=jzfh+RFWjixqav5feZrW/wN08PRXTWocA14lnRI3HpvLAgvk7E0LpQLf4Rb+Lsay
        UJbxfH7ngiM0vfANfFjp2ErJ4y0QN0oMk72lllN3wkjH4FjquS2zdRDBO9/Ya8/H9ge
        LlPaWlSeAvWqSoooZ0Z+tpseLiy5Pd/NDsBsoAAw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65A69C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=cgoldswo@codeaurora.org
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com, linux-arm-msm-owner@vger.kernel.org,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Vinayak Menon <vinmenon@codeaurora.org>
Subject: [PATCH v2] mm: cma: indefinitely retry allocations in cma_alloc
Date:   Fri, 11 Sep 2020 19:17:04 +0000
Message-ID: <010101747e9985ab-785157c3-24c9-4e62-ab39-133d7736c4e8-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
 <1599851809-4342-1-git-send-email-cgoldswo@codeaurora.org>
X-SES-Outgoing: 2020.09.11-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
retries indefinitely, with sleeps, to give the system an opportunity to
unpin any pinned pages.

Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
Co-developed-by: Vinayak Menon <vinmenon@codeaurora.org>
Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
---
 mm/cma.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 7f415d7..90bb505 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -32,6 +32,7 @@
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
+#include <linux/delay.h>
 #include <trace/events/cma.h>
 
 #include "cma.h"
@@ -442,8 +443,28 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 				bitmap_maxno, start, bitmap_count, mask,
 				offset);
 		if (bitmap_no >= bitmap_maxno) {
-			mutex_unlock(&cma->lock);
-			break;
+			if (ret == -EBUSY) {
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
+				continue;
+			} else {
+				/*
+				 * ret == -ENOMEM - all bits in cma->bitmap are
+				 * set, so we break accordingly.
+				 */
+				mutex_unlock(&cma->lock);
+				break;
+			}
 		}
 		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
 		/*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

