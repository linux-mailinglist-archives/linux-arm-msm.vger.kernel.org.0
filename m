Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2520A1640AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 10:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgBSJpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 04:45:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26424 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726297AbgBSJpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 04:45:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582105507; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VAvh5XCQx9dzzw+9nGUpw/8x4szB+5O8PLNIQXRSMas=; b=OGXdVyAlL1FU0A3H0SrDMmjHBJbGl8sxIVxy+ywCrOdb1mm6ONGPXld229TA2pY24QGK3RG8
 n0uTScYa9YaCzDs35+9kqy0+lDz8kh4qB6murtHoH+83u0X6U3w58ogNNFms3/XQnylkPitj
 YBtJRoiAVLmBGQG79SB/w4qKrws=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d039d.7f1099010490-smtp-out-n02;
 Wed, 19 Feb 2020 09:45:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD918C43383; Wed, 19 Feb 2020 09:45:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB876C433A2;
        Wed, 19 Feb 2020 09:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB876C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, dianders@google.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2] mmc: mmc_test: Pass different sg lists for non-blocking requests
Date:   Wed, 19 Feb 2020 15:14:31 +0530
Message-Id: <1582105474-27866-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
References: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
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

---
Changes since V1:
	- Freeing-up sg_areq memory.
	- Added check to ensure sg length is equal for both the sg-lists
	  supplied in case of non-blocking requests.
---
 drivers/mmc/core/mmc_test.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index 492dd45..f8f884a 100644
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
@@ -836,7 +838,9 @@ static int mmc_test_start_areq(struct mmc_test_card *test,
 }
 
 static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
-				      struct scatterlist *sg, unsigned sg_len,
+				      struct scatterlist *sg,
+				      struct scatterlist *sg_areq,
+				      unsigned int sg_len,
 				      unsigned dev_addr, unsigned blocks,
 				      unsigned blksz, int write, int count)
 {
@@ -867,6 +871,7 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
 			prev_mrq = &rq2->mrq;
 
 		swap(mrq, prev_mrq);
+		swap(sg, sg_areq);
 		dev_addr += blocks;
 	}
 
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
@@ -1458,15 +1480,16 @@ static int mmc_test_area_io_seq(struct mmc_test_card *test, unsigned long sz,
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
+		ret = mmc_test_nonblock_transfer(test, t->sg, t->sg_areq,
+				 t->sg_len, dev_addr, t->blocks, 512, write,
+				 count);
 	else
 		for (i = 0; i < count && ret == 0; i++) {
 			ret = mmc_test_area_transfer(test, dev_addr, write);
@@ -1525,6 +1548,7 @@ static int mmc_test_area_cleanup(struct mmc_test_card *test)
 	struct mmc_test_area *t = &test->area;
 
 	kfree(t->sg);
+	kfree(t->sg_areq);
 	mmc_test_free_mem(t->mem);
 
 	return 0;
@@ -1584,6 +1608,12 @@ static int mmc_test_area_init(struct mmc_test_card *test, int erase, int fill)
 		goto out_free;
 	}
 
+	t->sg_areq = kmalloc_array(t->max_segs, sizeof(*t->sg), GFP_KERNEL);
+	if (!t->sg_areq) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
 	t->dev_addr = mmc_test_capacity(test->card) / 2;
 	t->dev_addr -= t->dev_addr % (t->max_sz >> 9);
 
@@ -2468,7 +2498,7 @@ static int __mmc_test_cmds_during_tfr(struct mmc_test_card *test,
 	if (!(test->card->host->caps & MMC_CAP_CMD_DURING_TFR))
 		return RESULT_UNSUP_HOST;
 
-	ret = mmc_test_area_map(test, sz, 0, 0);
+	ret = mmc_test_area_map(test, sz, 0, 0, use_areq);
 	if (ret)
 		return ret;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
