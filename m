Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0652A77ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 08:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKEHYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 02:24:20 -0500
Received: from mga02.intel.com ([134.134.136.20]:38784 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgKEHYU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 02:24:20 -0500
IronPort-SDR: P8L6OJ4JKjpleLMErpRXSQS6PX3BxwxPzUBxd6GgJISVSQPve/pdjVB4fuyJy/EgrEE2OD+5Ah
 Lyhn3cUZUeDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="156331669"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="156331669"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 23:24:19 -0800
IronPort-SDR: /386lavZ1vDjUyLV983UWCzxDVLB6YJG3S1fhh9Nd9HZwNZaaTteistXwhJOtfy6ZyYi9CvIjG
 C5mXQfkDrzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="363722399"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2020 23:24:16 -0800
Subject: Re: [PATCH] mmc: block: Prevent new req entering queue while freeing
 up the queue
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Peng Hao <richard.peng@oppo.com>
References: <1603883984-24333-1-git-send-email-vbadigan@codeaurora.org>
 <CAPDyKFq0zikjeps36=Mq-Y9MuyiOHZyGVELV+Eh56evu8b8D2A@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <c10a3578-f8b8-4e08-ad87-acb141ded4f6@intel.com>
Date:   Thu, 5 Nov 2020 09:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq0zikjeps36=Mq-Y9MuyiOHZyGVELV+Eh56evu8b8D2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/11/20 5:25 pm, Ulf Hansson wrote:
> On Wed, 28 Oct 2020 at 12:20, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>>
>> The commit bbdc74dc19e0 ("mmc: block: Prevent new req entering queue
>> after its cleanup") has introduced this change but it got moved after
>> del_gendisk() with commit 57678e5a3d51 ("mmc: block: Delete gendisk
>> before cleaning up the request queue").
> 
> This isn't the first time we have spotted errors in this path. Seems
> like a difficult path to get correct. :-)
> 
>>
>> It is blocking reboot with below Call stack().
>>
>> INFO: task reboot:3086 blocked for more than 122 seconds.
>>      __schedule
>>      schedule
>>      schedule_timeout
>>      io_schedule_timeout
>>      do_wait_for_common
>>      wait_for_completion_io
>>      submit_bio_wait
>>      blkdev_issue_flush
>>      ext4_sync_fs
>>      __sync_filesystem
>>      sync_filesystem
>>      fsync_bdev
>>      invalidate_partition
>>      del_gendisk
>>      mmc_blk_remove_req
>>      mmc_blk_remove
>>      mmc_bus_remove
>>      device_release_driver_internal
>>      device_release_driver
>>      bus_remove_device
>>      device_del
>>      mmc_remove_card
>>      mmc_remove
>>      mmc_stop_host
>>      mmc_remove_host
>>      sdhci_remove_host
>>      sdhci_msm_remove
> 
> Why do you call sdhci_msm_remove() from the shutdown callback? What
> specific operations do you need to run in the shutdown path for sdhci
> msm?

Yes, the problem is that upper layers, like the mmc block driver, have
already shut down, so doing operations like remove will get into deadlocks.

> 
> The important part should be to do a graceful shutdown of the card
> (and the block device) - is there anything else?
> 
> Or you are just using the shutdown callback as a simple way to trigger
> this problem? Could unbinding the driver trigger the same issue?
> 
>>      sdhci_msm_shutdown
>>      platform_drv_shutdown
>>      device_shutdown
>>      kernel_restart_prepare
>>      kernel_restart
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
> 
> I don't know yet, but I will have a closer look. Let's also see if
> Adrian has some thoughts.
> 
> Kind regards
> Uffe
> 
>> ---
>>
>>  drivers/mmc/core/block.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
>> index 8d3df0be0355..76dbb2b8a13b 100644
>> --- a/drivers/mmc/core/block.c
>> +++ b/drivers/mmc/core/block.c
>> @@ -2627,6 +2627,7 @@ static void mmc_blk_remove_req(struct mmc_blk_data *md)
>>                  * from being accepted.
>>                  */
>>                 card = md->queue.card;
>> +               blk_set_queue_dying(md->queue.queue);
>>                 if (md->disk->flags & GENHD_FL_UP) {
>>                         device_remove_file(disk_to_dev(md->disk), &md->force_ro);
>>                         if ((md->area_type & MMC_BLK_DATA_AREA_BOOT) &&
>> --
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>>

