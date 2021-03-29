Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A3C34DC0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 00:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhC2Wsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 18:48:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14600 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhC2WsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 18:48:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617058090; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=E8U/p0YUCQ19hXMs982l3kIBDR50pE0cs5ppK/R+zKE=; b=orZNlm9JJ3qE5bvGgSRRhcMaT23EY177d3MxS3Lclgl2LFqcwh/ls5LZzPSu5U2QjOsOZIDi
 3QtKTkd8rvzXd5nr5LlX2egvKbqbwJIlORBhRmbkIoPdY2ZyciQVjOYwOM9+YcVgW/0LvAgH
 3yrCfQo/ggxUUIsuiCQChoW980s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6062592887ce1fbb56437d70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 22:48:08
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5F75C43465; Mon, 29 Mar 2021 22:48:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 895E1C433ED;
        Mon, 29 Mar 2021 22:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 895E1C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v13 0/2] Enable power management for ufs wlun
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        adrian.hunter@intel.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
References: <cover.1616633712.git.asutoshd@codeaurora.org>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <e2aec2ba-b0ed-a478-7c01-1784f755a805@codeaurora.org>
Date:   Mon, 29 Mar 2021 15:48:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cover.1616633712.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/24/2021 6:39 PM, Asutosh Das wrote:
> This patch attempts to fix a deadlock in ufs while sending SSU.
> Recently, blk_queue_enter() added a check to not process requests if the
> queue is suspended. That leads to a resume of the associated device which
> is suspended. In ufs, that device is ufs device wlun and it's parent is
> ufs_hba. This resume tries to resume ufs device wlun which in turn tries
> to resume ufs_hba, which is already in the process of suspending, thus
> causing a deadlock.
> 
> This patch takes care of:
> * Suspending the ufs device lun only after all other luns are suspended
> * Sending SSU during ufs device wlun suspend
> * Clearing uac for rpmb and ufs device wlun
> * Not sending commands to the device during host suspend
> 
> v12 -> v13:
> - Addressed Adrian's comments
>    * Paired pm_runtime_get_noresume() with pm_runtime_put()
>    * no rpm_autosuspend for ufs device wlun
>    * Moved runtime-pm init functionality to ufshcd_wl_probe()
> - Addressed Bart's comments
>    * Expanded abbrevs in commit message
> 

Hi Adrian
I did a limited testing on your fix in the pm framework along with this 
v13 patchset. I couldn't reproduce the issue.

I'd appreciate if you can please take a look at the v13 changes.
If all looks good in that, I'd do an extensive testing.

Thanks,
-asd

> v11 -> v12:
> - Addressed Adrian's comments
>    * Fixed ahit for Mediatek driver
>    * Fixed error handling in ufshcd_core_init()
>    * Tested this patch and the issue is still seen.
> 
> v10 -> v11:
> - Fixed supplier suspending before consumer race
> - Addressed Adrian's comments
>    * Added proper resume/suspend cb to ufshcd_auto_hibern8_update()
>    * Cosmetic changes to ufshcd-pci.c
>    * Cleaned up ufshcd_system_suspend()
>    * Added ufshcd_debugfs_eh_exit to ufshcd_core_init()
> 
> v9 -> v10:
> - Addressed Adrian's comments
>    * Moved suspend/resume vops to __ufshcd_wl_[suspend/resume]()
>    * Added correct resume in ufs_bsg
> 
> v8 -> v9:
> - Addressed Adrian's comments
>    * Moved link transition to __ufshcd_wl_[suspend/resume]()
>    * Fixed the other minor comments
> 
> v7 -> v8:
> - Addressed Adrian's comments
>    * Removed separate autosuspend delay for ufs-device lun
>    * Fixed the ee handler getting scheduled during pm
>    * Always runtime resume in suspend_prepare()
>    * Added CONFIG_PM_SLEEP where needed
>    
> v6 -> v7:
>    * Resume the ufs device before shutting it down
> 
> v5 -> v6:
> - Addressed Adrian's comments
>    * Added complete() cb
>    * Added suspend_prepare() and complete() to all drivers
>    * Moved suspend_prepare() and complete() to ufshcd
>    * .poweroff() uses ufhcd_wl_poweroff()
>    * Removed several forward declarations
>    * Moved scsi_register_driver() to ufshcd_core_init()
> 
> v4 -> v5:
> - Addressed Adrian's comments
>    * Used the rpmb driver contributed by Adrian
>    * Runtime-resume the ufs device during suspend to honor spm-lvl
>    * Unregister the scsi_driver in ufshcd_remove()
>    * Currently shutdown() puts the ufs device to power-down mode
>      so, just removed ufshcd_pci_poweroff()
>    * Quiesce the scsi device during shutdown instead of remove
> 
> v3 RFC -> v4:
> - Addressed Bart's comments
>    * Except that I didn't get any checkpatch failures
> - Addressed Avri's comments
> - Addressed Adrian's comments
>    * Added a check for deepsleep power mode
>    * Removed a couple of forward declarations
>    * Didn't separate the scsi drivers because in rpmb case it just sends uac
>      in resume and it seemed pretty neat to me.
> - Added sysfs changes to resume the devices before accessing
> 
> Asutosh Das (2):
>    scsi: ufs: Enable power management for wlun
>    ufs: sysfs: Resume the proper scsi device
> 
>   drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
>   drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
>   drivers/scsi/ufs/ufs-debugfs.c     |   2 +-
>   drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
>   drivers/scsi/ufs/ufs-exynos.c      |   2 +
>   drivers/scsi/ufs/ufs-hisi.c        |   2 +
>   drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
>   drivers/scsi/ufs/ufs-qcom.c        |   2 +
>   drivers/scsi/ufs/ufs-sysfs.c       |  30 +-
>   drivers/scsi/ufs/ufs_bsg.c         |   6 +-
>   drivers/scsi/ufs/ufshcd-pci.c      |  36 +--
>   drivers/scsi/ufs/ufshcd.c          | 627 ++++++++++++++++++++++++++-----------
>   drivers/scsi/ufs/ufshcd.h          |   6 +
>   include/trace/events/ufs.h         |  20 ++
>   14 files changed, 513 insertions(+), 238 deletions(-)
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
