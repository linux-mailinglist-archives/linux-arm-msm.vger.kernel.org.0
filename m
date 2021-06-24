Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFC73B2510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 04:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFXChC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 22:37:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14639 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhFXChB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 22:37:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624502083; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bjXgfPyoPBtpX9JV4CPMgqPsyGlX5knPjd8Y3L2kfNY=;
 b=T9WnvJTgQvKDLJTVQE/tKQrHQXBIyY1QhFaJPEWf/Yge4O9QFSUbi2R6QkRpj+ZcklGm0OKU
 /xBOgsnF8la3fuFu/BuJMMVT3EriWIXKliVfI2CDD58Betch9oTXnFw89pMW7BPxIZZP+gWv
 MCRSO17hZV4Ml1J5pDtKrntl6KQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60d3ef335d0d101e384b44f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 02:34:27
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5EEDBC43149; Thu, 24 Jun 2021 02:34:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10CF4C433F1;
        Thu, 24 Jun 2021 02:34:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Jun 2021 10:34:25 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
In-Reply-To: <932ce816be805e4cca2c5beee8627918@codeaurora.org>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
 <1c5db457-ee87-2308-15f5-5dad49508f10@acm.org>
 <c7c5d95e-8a69-dfef-44ea-bfcadd6ea5d5@acm.org>
 <932ce816be805e4cca2c5beee8627918@codeaurora.org>
Message-ID: <7d7947536e1b527f58fee47661c5a33b@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Typo fixed.

On 2021-06-24 10:02, Can Guo wrote:
> Hi Bart,
> 
> On 2021-06-24 04:57, Bart Van Assche wrote:
>> On 6/23/21 1:05 PM, Bart Van Assche wrote:
>>> On 6/23/21 12:35 AM, Can Guo wrote:
>>>> Rename pm_op_in_progress and is_sys_suspended to 
>>>> wlu_pm_op_in_progress and
>>>> is_wlu_sys_suspended accordingly.
>>> 
>>> My understanding is that power management operations must be 
>>> submitted
>>> to one particular UFS WLUN (hba->sdev_ufs_device). That makes the 
>>> "wlu_"
>>> part of the new names redundant. In other words, I like the current
>>> names better than the new names. Unless if I missed something, 
>>> consider
>>> dropping this patch.
>> 
>> Hi Can,
>> 
>> Reviewing later patches in this series made me realize that there are
>> two families of suspend/resume functions. One family of functions
>> operates at the platform level while the other family operates at the
>> SCSI LUN level. My comments about the suspend/resume functions are as
>> follows:
>> - It seems redundant to me to have system suspend support at the SCSI
>>   LUN level (__ufshcd_wl_suspend(hba, UFS_SYSTEM_PM)) and also at the
>>   platform level. Since the platform device is a parent of the SCSI
>>   WLUN, can system suspend/resume support be left out from
>>   ufshcd_wl_pm_ops (or in other words, remove the .freeze and .thaw
>>   callbacks)? Do we really need two calls from the power management
>>   subsystem into the UFS driver for every system suspend and every
>>   system resume?
> 
> Asutosh and Adrian should be the right persons to answer this, since
> they've been working together on that huge change for 4 months -
> 
> https://lore.kernel.org/patchwork/patch/1417696/
> 
> In short, we need a dedicated suspend/resume ops for the UFS device
> W-LU because one cannot send requests (not even PM requests) after the
> device is runtime suspended - sending SSU cmds in hba suspend/resume
> cannot pass through blk_queue_enter() as SSU cmd is sent to the UFS
> device W-LU scsi device (by now it is runtime suspended) but not the
> hba device.
> 
> Of course we can keep the old way and send the SSU cmd through a
> request queue without block layer PM initialized (hba->cmd_queue for
> example, by pointing cmd_queue->queuedata to the UFS device W-LU scsi
> device), but that would look like a hack.
> 
>> - Because of the device links (device_link_add()), the ufschd_wl_*()
>>   RPM callbacks are invoked after all LUNs have been suspended. I 
>> would
>>   appreciate it if the "ufshcd_wl_" prefix would be changed into
>>   "ufshcd_lun_" since that would make it more clear that these 
>> callbacks
>>   are associated with all LUNs and not only with the WLUN through 
>> which
>>   power management commands are submitted.
>> 
> 
> Sure, we will do that later.
> 
> Thanks,
> 
> Can Guo.
> 
>> Thanks,
>> 
>> Bart.
