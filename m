Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76B229DAB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390459AbgJ1X26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:28:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4913 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390331AbgJ1X1G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:27:06 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2020 04:20:46 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 28 Oct 2020 04:20:44 -0700
X-QCInternal: smtphost
Received: from vbadigan1-linux.qualcomm.com ([10.206.25.77])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Oct 2020 16:50:23 +0530
Received: by vbadigan1-linux.qualcomm.com (Postfix, from userid 76677)
        id 9FEE9213D0; Wed, 28 Oct 2020 16:50:22 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Jens Axboe <axboe@kernel.dk>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Peng Hao <richard.peng@oppo.com>
Subject: [PATCH] mmc: block: Prevent new req entering queue while freeing up the queue
Date:   Wed, 28 Oct 2020 16:49:42 +0530
Message-Id: <1603883984-24333-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit bbdc74dc19e0 ("mmc: block: Prevent new req entering queue
after its cleanup") has introduced this change but it got moved after
del_gendisk() with commit 57678e5a3d51 ("mmc: block: Delete gendisk
before cleaning up the request queue").

It is blocking reboot with below Call stack().

INFO: task reboot:3086 blocked for more than 122 seconds.
     __schedule
     schedule
     schedule_timeout
     io_schedule_timeout
     do_wait_for_common
     wait_for_completion_io
     submit_bio_wait
     blkdev_issue_flush
     ext4_sync_fs
     __sync_filesystem
     sync_filesystem
     fsync_bdev
     invalidate_partition
     del_gendisk
     mmc_blk_remove_req
     mmc_blk_remove
     mmc_bus_remove
     device_release_driver_internal
     device_release_driver
     bus_remove_device
     device_del
     mmc_remove_card
     mmc_remove
     mmc_stop_host
     mmc_remove_host
     sdhci_remove_host
     sdhci_msm_remove
     sdhci_msm_shutdown
     platform_drv_shutdown
     device_shutdown
     kernel_restart_prepare
     kernel_restart

So bringing this change back.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---

I'm observing this issue 100% of the time with shutdown callback added to sdhci-msm driver.
I'm trying on 5.4 kernel with ChromeOS.

Please let me know if this can be fixed in a better way.
---

 drivers/mmc/core/block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 8d3df0be0355..76dbb2b8a13b 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2627,6 +2627,7 @@ static void mmc_blk_remove_req(struct mmc_blk_data *md)
 		 * from being accepted.
 		 */
 		card = md->queue.card;
+		blk_set_queue_dying(md->queue.queue);
 		if (md->disk->flags & GENHD_FL_UP) {
 			device_remove_file(disk_to_dev(md->disk), &md->force_ro);
 			if ((md->area_type & MMC_BLK_DATA_AREA_BOOT) &&
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

