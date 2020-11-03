Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7632A465F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 14:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgKCN2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 08:28:37 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:62865 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729143AbgKCN2g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 08:28:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604410116; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gCMQzXqxVATbZltihWPug0xwxDJnW/aK5mmtdzr6c14=; b=adwTOq8e1yKSKBZg0qa2cg/+XbmS2boiJPWT1wI8BXBdFLpN/zFjNRGB2ndjbG+7VYExxGea
 rn8iOS6qR49ndPOE08MwcBo47SgQyrUFzDw5YPxw0Xsfnl2LS9rCyF8tt9iFCQpDJIl5Kg16
 enkX71T99ZfpGNfPOM6jxtRNNI8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa15af79f889442bbd11624 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 13:28:23
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F106C384F8; Tue,  3 Nov 2020 06:42:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.205.245.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34CB7C433B1;
        Tue,  3 Nov 2020 06:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34CB7C433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH] mmc: block: Prevent new req entering queue while freeing
 up the queue
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Peng Hao <richard.peng@oppo.com>
References: <1603883984-24333-1-git-send-email-vbadigan@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <99b758d8-0fd5-2ee2-a12f-c09e71ec470b@codeaurora.org>
Date:   Tue, 3 Nov 2020 12:11:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1603883984-24333-1-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ulf, Adrian,

Gentle reminder. Can you share your comments on this issue and change?

Thanks

On 10/28/2020 4:49 PM, Veerabhadrarao Badiganti wrote:
> The commit bbdc74dc19e0 ("mmc: block: Prevent new req entering queue
> after its cleanup") has introduced this change but it got moved after
> del_gendisk() with commit 57678e5a3d51 ("mmc: block: Delete gendisk
> before cleaning up the request queue").
>
> It is blocking reboot with below Call stack().
>
> INFO: task reboot:3086 blocked for more than 122 seconds.
>       __schedule
>       schedule
>       schedule_timeout
>       io_schedule_timeout
>       do_wait_for_common
>       wait_for_completion_io
>       submit_bio_wait
>       blkdev_issue_flush
>       ext4_sync_fs
>       __sync_filesystem
>       sync_filesystem
>       fsync_bdev
>       invalidate_partition
>       del_gendisk
>       mmc_blk_remove_req
>       mmc_blk_remove
>       mmc_bus_remove
>       device_release_driver_internal
>       device_release_driver
>       bus_remove_device
>       device_del
>       mmc_remove_card
>       mmc_remove
>       mmc_stop_host
>       mmc_remove_host
>       sdhci_remove_host
>       sdhci_msm_remove
>       sdhci_msm_shutdown
>       platform_drv_shutdown
>       device_shutdown
>       kernel_restart_prepare
>       kernel_restart
>
> So bringing this change back.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>
> I'm observing this issue 100% of the time with shutdown callback added to sdhci-msm driver.
> I'm trying on 5.4 kernel with ChromeOS.
>
> Please let me know if this can be fixed in a better way.
> ---
>
>   drivers/mmc/core/block.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 8d3df0be0355..76dbb2b8a13b 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -2627,6 +2627,7 @@ static void mmc_blk_remove_req(struct mmc_blk_data *md)
>   		 * from being accepted.
>   		 */
>   		card = md->queue.card;
> +		blk_set_queue_dying(md->queue.queue);
>   		if (md->disk->flags & GENHD_FL_UP) {
>   			device_remove_file(disk_to_dev(md->disk), &md->force_ro);
>   			if ((md->area_type & MMC_BLK_DATA_AREA_BOOT) &&
