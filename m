Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCCFC16FCC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 11:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgBZK6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 05:58:24 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:25979 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727191AbgBZK6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 05:58:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582714703; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OfSsAupTVWfMR/Vnb306EBgKPtREPx2ttnB7Rk8POgc=; b=AU9WY7wvWJF1XkxXQkZ9fkolGbDKrDqlaIr7cO90eANHFmacDhIBSyun2DVar2ZOOYiR5hjE
 pbS5P5bqS3T0sxgmKQnoQ5KxX1OEEQHJmUpIjnbVMvxtA693e/aKqLk23aXLkC/EtIKa513N
 O6zpQ8cHYkj5WCrAXMet2c8GlIA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e564f46.7efdad67db58-smtp-out-n03;
 Wed, 26 Feb 2020 10:58:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 47536C447A0; Wed, 26 Feb 2020 10:58:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E520BC43383;
        Wed, 26 Feb 2020 10:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E520BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V3] mmc: mmc_test: Pass different sg lists for non-blocking requests
Date:   Wed, 26 Feb 2020 16:27:43 +0530
Message-Id: <1582714668-17247-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582105474-27866-1-git-send-email-vbadigan@codeaurora.org>
References: <1582105474-27866-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Supply a separate sg list for each of the request in non-blocking
IO test cases where two requests will be issued at same time.

Otherwise, sg memory may get unmapped when a request is done while
same memory is being accessed by controller from the other request,
and it leads to iommu errors with below call stack:

	__arm_lpae_unmap+0x2e0/0x478
	arm_lpae_unmap+0x54/0x70
	arm_smmu_unmap+0x64/0xa4
	__iommu_unmap+0xb8/0x1f0
	iommu_unmap_fast+0x38/0x48
	__iommu_dma_unmap+0x88/0x108
	iommu_dma_unmap_sg+0x90/0xa4
	sdhci_post_req+0x5c/0x78
	mmc_test_start_areq+0x10c/0x120 [mmc_test]
	mmc_test_area_io_seq+0x150/0x264 [mmc_test]
	mmc_test_rw_multiple+0x174/0x1c0 [mmc_test]
	mmc_test_rw_multiple_sg_len+0x44/0x6c [mmc_test]
	mmc_test_profile_sglen_wr_nonblock_perf+0x6c/0x94 [mmc_test]
	mtf_test_write+0x238/0x3cc [mmc_test]

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
Changes since V2:
	- Simplfied mmc_test_nonblock_transter() function aruguments.

Changes since V1:
	- Freeing-up sg_areq memory.                                        
	- Added check to ensure sg length is equal for both the sg-lists    
	  supplied in case of non-blocking requests.
---
 drivers/mmc/core/mmc_test.c | 52 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index 492dd45..c21b3cb 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -71,6 +71,7 @@ struct mmc_test_mem {
  * @sg_len: length of currently mapped scatterlist @sg
  * @mem: allocated memory
  * @sg: scatterlist
+ * @sg_areq: scatterlist for non-blocking request
  */
 struct mmc_test_area {
 	unsigned long max_sz;
@@ -82,6 +83,7 @@ struct mmc_test_area {
 	unsigned int sg_len;
 	struct mmc_test_mem *mem;
 	struct scatterlist *sg;
+	struct scatterlist *sg_areq;
 };
 
 /**
@@ -836,14 +838,16 @@ static int mmc_test_start_areq(struct mmc_test_card *test,
 }
 
 static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
-				      struct scatterlist *sg, unsigned sg_len,
-				      unsigned dev_addr, unsigned blocks,
-				      unsigned blksz, int write, int count)
+				      unsigned int dev_addr, int write,
+				      int count)
 {
 	struct mmc_test_req *rq1, *rq2;
 	struct mmc_request *mrq, *prev_mrq;
 	int i;
 	int ret = RESULT_OK;
+	struct mmc_test_area *t = &test->area;
+	struct scatterlist *sg = t->sg;
+	struct scatterlist *sg_areq = t->sg_areq;
 
 	rq1 = mmc_test_req_alloc();
 	rq2 = mmc_test_req_alloc();
@@ -857,8 +861,8 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
 
 	for (i = 0; i < count; i++) {
 		mmc_test_req_reset(container_of(mrq, struct mmc_test_req, mrq));
-		mmc_test_prepare_mrq(test, mrq, sg, sg_len, dev_addr, blocks,
-				     blksz, write);
+		mmc_test_prepare_mrq(test, mrq, sg, t->sg_len, dev_addr,
+				     t->blocks, 512, write);
 		ret = mmc_test_start_areq(test, mrq, prev_mrq);
 		if (ret)
 			goto err;
@@ -867,7 +871,8 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
 			prev_mrq = &rq2->mrq;
 
 		swap(mrq, prev_mrq);
-		dev_addr += blocks;
+		swap(sg, sg_areq);
+		dev_addr += t->blocks;
 	}
 
 	ret = mmc_test_start_areq(test, NULL, prev_mrq);
@@ -1396,10 +1401,11 @@ static int mmc_test_no_highmem(struct mmc_test_card *test)
  * Map sz bytes so that it can be transferred.
  */
 static int mmc_test_area_map(struct mmc_test_card *test, unsigned long sz,
-			     int max_scatter, int min_sg_len)
+			     int max_scatter, int min_sg_len, bool nonblock)
 {
 	struct mmc_test_area *t = &test->area;
 	int err;
+	unsigned int sg_len = 0;
 
 	t->blocks = sz >> 9;
 
@@ -1411,6 +1417,22 @@ static int mmc_test_area_map(struct mmc_test_card *test, unsigned long sz,
 		err = mmc_test_map_sg(t->mem, sz, t->sg, 1, t->max_segs,
 				      t->max_seg_sz, &t->sg_len, min_sg_len);
 	}
+
+	if (err || !nonblock)
+		goto err;
+
+	if (max_scatter) {
+		err = mmc_test_map_sg_max_scatter(t->mem, sz, t->sg_areq,
+						  t->max_segs, t->max_seg_sz,
+						  &sg_len);
+	} else {
+		err = mmc_test_map_sg(t->mem, sz, t->sg_areq, 1, t->max_segs,
+				      t->max_seg_sz, &sg_len, min_sg_len);
+	}
+	if (!err && sg_len != t->sg_len)
+		err = -EINVAL;
+
+err:
 	if (err)
 		pr_info("%s: Failed to map sg list\n",
 		       mmc_hostname(test->card->host));
@@ -1440,7 +1462,6 @@ static int mmc_test_area_io_seq(struct mmc_test_card *test, unsigned long sz,
 	struct timespec64 ts1, ts2;
 	int ret = 0;
 	int i;
-	struct mmc_test_area *t = &test->area;
 
 	/*
 	 * In the case of a maximally scattered transfer, the maximum transfer
@@ -1458,15 +1479,14 @@ static int mmc_test_area_io_seq(struct mmc_test_card *test, unsigned long sz,
 			sz = max_tfr;
 	}
 
-	ret = mmc_test_area_map(test, sz, max_scatter, min_sg_len);
+	ret = mmc_test_area_map(test, sz, max_scatter, min_sg_len, nonblock);
 	if (ret)
 		return ret;
 
 	if (timed)
 		ktime_get_ts64(&ts1);
 	if (nonblock)
-		ret = mmc_test_nonblock_transfer(test, t->sg, t->sg_len,
-				 dev_addr, t->blocks, 512, write, count);
+		ret = mmc_test_nonblock_transfer(test, dev_addr, write, count);
 	else
 		for (i = 0; i < count && ret == 0; i++) {
 			ret = mmc_test_area_transfer(test, dev_addr, write);
@@ -1525,6 +1545,7 @@ static int mmc_test_area_cleanup(struct mmc_test_card *test)
 	struct mmc_test_area *t = &test->area;
 
 	kfree(t->sg);
+	kfree(t->sg_areq);
 	mmc_test_free_mem(t->mem);
 
 	return 0;
@@ -1584,6 +1605,13 @@ static int mmc_test_area_init(struct mmc_test_card *test, int erase, int fill)
 		goto out_free;
 	}
 
+	t->sg_areq = kmalloc_array(t->max_segs, sizeof(*t->sg_areq),
+				   GFP_KERNEL);
+	if (!t->sg_areq) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
 	t->dev_addr = mmc_test_capacity(test->card) / 2;
 	t->dev_addr -= t->dev_addr % (t->max_sz >> 9);
 
@@ -2468,7 +2496,7 @@ static int __mmc_test_cmds_during_tfr(struct mmc_test_card *test,
 	if (!(test->card->host->caps & MMC_CAP_CMD_DURING_TFR))
 		return RESULT_UNSUP_HOST;
 
-	ret = mmc_test_area_map(test, sz, 0, 0);
+	ret = mmc_test_area_map(test, sz, 0, 0, use_areq);
 	if (ret)
 		return ret;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
