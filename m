Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2692AF6A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 17:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgKKQhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 11:37:39 -0500
Received: from z5.mailgun.us ([104.130.96.5]:32864 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbgKKQhj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 11:37:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605112658; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0MTZNm0gtvDrGwPQUJrq8djAu9H1QIhfhQ6Ri7dD6yI=; b=VsdWryEju7XIQEVEJ9muEzbc7Boxi+EVlzWtHvLdt7pLLtV0hK+4PVN+GevYEJN80m7bntR6
 Mi/hg43Ji2MK4qZ5DEzKxflRPQtoYvvPmV2Uu/f5xQE1S89RmiKhR/gP4ymdyALAxIQt4aSi
 sguiy4/G3CSlKu/mXcahqiXxe9o=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fac0fe71b0f99048360dbf1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 16:22:48
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2402AC43385; Wed, 11 Nov 2020 16:22:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.105] (unknown [49.205.245.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34773C433C6;
        Wed, 11 Nov 2020 16:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34773C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH] mmc: block: Prevent new req entering queue while freeing
 up the queue
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Peng Hao <richard.peng@oppo.com>
References: <1603883984-24333-1-git-send-email-vbadigan@codeaurora.org>
 <CAPDyKFq0zikjeps36=Mq-Y9MuyiOHZyGVELV+Eh56evu8b8D2A@mail.gmail.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <4f27eecd-3d10-796c-6b6c-594770502037@codeaurora.org>
Date:   Wed, 11 Nov 2020 21:52:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq0zikjeps36=Mq-Y9MuyiOHZyGVELV+Eh56evu8b8D2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/3/2020 8:55 PM, Ulf Hansson wrote:
> On Wed, 28 Oct 2020 at 12:20, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>> The commit bbdc74dc19e0 ("mmc: block: Prevent new req entering queue
>> after its cleanup") has introduced this change but it got moved after
>> del_gendisk() with commit 57678e5a3d51 ("mmc: block: Delete gendisk
>> before cleaning up the request queue").
> This isn't the first time we have spotted errors in this path. Seems
> like a difficult path to get correct. :-)
>
>> It is blocking reboot with below Call stack().
>>
>> INFO: task reboot:3086 blocked for more than 122 seconds.
>>       __schedule
>>       schedule
>>       schedule_timeout
>>       io_schedule_timeout
>>       do_wait_for_common
>>       wait_for_completion_io
>>       submit_bio_wait
>>       blkdev_issue_flush
>>       ext4_sync_fs
>>       __sync_filesystem
>>       sync_filesystem
>>       fsync_bdev
>>       invalidate_partition
>>       del_gendisk
>>       mmc_blk_remove_req
>>       mmc_blk_remove
>>       mmc_bus_remove
>>       device_release_driver_internal
>>       device_release_driver
>>       bus_remove_device
>>       device_del
>>       mmc_remove_card
>>       mmc_remove
>>       mmc_stop_host
>>       mmc_remove_host
>>       sdhci_remove_host
>>       sdhci_msm_remove
> Why do you call sdhci_msm_remove() from the shutdown callback? What
> specific operations do you need to run in the shutdown path for sdhci
> msm?
I was suggested to add shutdown callback by memory team to gracefully 
de-register with smmu driver
during reboot/shutdown. So tried adding it. Since SMMU team.

I just need to ensure that controller is not active anymore and not 
accessing memory related to any
requests and de-register with smmu driver during shutdown.
>
> The important part should be to do a graceful shutdown of the card
> (and the block device) - is there anything else?
>
> Or you are just using the shutdown callback as a simple way to trigger
> this problem? Could unbinding the driver trigger the same issue?
>
>>       sdhci_msm_shutdown
>>       platform_drv_shutdown
>>       device_shutdown
>>       kernel_restart_prepare
>>       kernel_restart
>>
>> So bringing this change back.
>>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> ---
>>
>> I'm observing this issue 100% of the time with shutdown callback added to sdhci-msm driver.
>> I'm trying on 5.4 kernel with ChromeOS.
>>
>> Please let me know if this can be fixed in a better way.
> I don't know yet, but I will have a closer look. Let's also see if
> Adrian has some thoughts.
>
> Kind regards
> Uffe
>
>> ---
>>
>>   drivers/mmc/core/block.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
>> index 8d3df0be0355..76dbb2b8a13b 100644
>> --- a/drivers/mmc/core/block.c
>> +++ b/drivers/mmc/core/block.c
>> @@ -2627,6 +2627,7 @@ static void mmc_blk_remove_req(struct mmc_blk_data *md)
>>                   * from being accepted.
>>                   */
>>                  card = md->queue.card;
>> +               blk_set_queue_dying(md->queue.queue);
>>                  if (md->disk->flags & GENHD_FL_UP) {
>>                          device_remove_file(disk_to_dev(md->disk), &md->force_ro);
>>                          if ((md->area_type & MMC_BLK_DATA_AREA_BOOT) &&
>> --
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>>
