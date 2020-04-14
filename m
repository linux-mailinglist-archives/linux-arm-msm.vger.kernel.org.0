Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258661A7AD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 14:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501978AbgDNMbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 08:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730303AbgDNMbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 08:31:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9ECC061A0C;
        Tue, 14 Apr 2020 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=uizMBC4KFq8zXurx9Zz5OqewqR6VP2ZPVfe8F/b2Zxk=; b=V4TpNo1W8TtjYsqTrxUeWFJD/D
        uK3XEeFjEbrTYZqyO+CHQnAKGkuQ34/piSsPTufYLjMXJM4kx6mxvYrrjqEGHTr/nvCiJed3mykTA
        xFRpkzzG/drNZzxjCHAYjo+8PEFoSqvOy0eD/O+XlfnL6WeVPgfcdfZFAZpSBsKJTf1y9zWrNTPI4
        CARgrjUR56ebslQak6Qi/2e8fNzUajAuu2hDwsk4P5BnO8rxvMpFJus8twKL2IPZeNmUwcsf6IbbN
        VHtHJ9zu8rJL0qn7GNH34HyaGR9VxoWTrfDajHLihlNX6qzFsuhp8A37DMMjTrwwTPYbx8LTIT4my
        Ulfueqng==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOKj4-0000j4-8Y; Tue, 14 Apr 2020 12:31:38 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom_scm: fix bogous abuse of dma-direct internals
Date:   Tue, 14 Apr 2020 14:31:36 +0200
Message-Id: <20200414123136.441454-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As far as the device is concerned the dma address is the physical
address.  There is no need to convert it to a physical address,
especially not using dma-direct internals that are not available
to drivers and which will interact badly with IOMMUs.  Last but not
least the commit introducing it claimed to just fix a type issue,
but actually changed behavior.

Fixes: 6e37ccf78a532 ("firmware: qcom_scm: Use proper types for dma mappings")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/firmware/qcom_scm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 059bb0fbae9e..4701487573f7 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -6,7 +6,6 @@
 #include <linux/init.h>
 #include <linux/cpumask.h>
 #include <linux/export.h>
-#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/types.h>
@@ -806,8 +805,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	struct qcom_scm_mem_map_info *mem_to_map;
 	phys_addr_t mem_to_map_phys;
 	phys_addr_t dest_phys;
-	phys_addr_t ptr_phys;
-	dma_addr_t ptr_dma;
+	dma_addr_t ptr_phys;
 	size_t mem_to_map_sz;
 	size_t dest_sz;
 	size_t src_sz;
@@ -824,10 +822,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
 			ALIGN(dest_sz, SZ_64);
 
-	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_dma, GFP_KERNEL);
+	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
-	ptr_phys = dma_to_phys(__scm->dev, ptr_dma);
 
 	/* Fill source vmid detail */
 	src = ptr;
@@ -855,7 +852,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 
 	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
 				    ptr_phys, src_sz, dest_phys, dest_sz);
-	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_dma);
+	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
 	if (ret) {
 		dev_err(__scm->dev,
 			"Assign memory protection call failed %d\n", ret);
-- 
2.25.1

