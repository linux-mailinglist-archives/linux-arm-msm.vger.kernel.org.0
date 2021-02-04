Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35E430FF23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 22:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBDVPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 16:15:21 -0500
Received: from so15.mailgun.net ([198.61.254.15]:55094 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229681AbhBDVPU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 16:15:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612473296; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Q0Z2ooCutv+Sy4ASqZ6ylHm5V+ET74643XcJtaloPtg=; b=UjQskntqbQuCOZX2G1j3zt/q7G95WlOAgXs1XMHPQetpkBo/hhvFUZf7PFynDB6UtBKh/53a
 wWCj8c02+Ia0epDi7NJfYyk6Zy+PBHOTECJ1M5Y61iItvZQjM8BVKPtrI+duzBp0sPHhMEC/
 AGMS4kvnQCHHKVYcyXTgLuOuLa8=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 601c63b3f112b7872cecc4f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 21:14:27
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59A9DC433C6; Thu,  4 Feb 2021 21:14:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3558BC433CA;
        Thu,  4 Feb 2021 21:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3558BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Thu, 4 Feb 2021 13:14:24 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210204211424.GH37557@stor-presley.qualcomm.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
 <20210204001354.GD37557@stor-presley.qualcomm.com>
 <20210204194831.GA567391@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210204194831.GA567391@rowland.harvard.edu>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 04 2021 at 11:48 -0800, Alan Stern wrote:
>On Wed, Feb 03, 2021 at 04:13:54PM -0800, Asutosh Das wrote:
>> Thanks Alan.
>> I understand the issues with the current ufs design.
>>
>> ufs has a wlun (well-known lun) that handles power management commands,
>> such as SSUs. Now this wlun (device wlun) is registered as a scsi_device.
>> It's queue is also set up for runtime-pm. Likewise there're 2
>> more wluns, BOOT and RPMB.
>>
>> Currently, the scsi devices independently runtime suspend/resume - request driven.
>> So to send SSU while suspending wlun (scsi_device) this scsi device should
>> be the last to be runtime suspended amongst all other ufs luns (scsi devices). The
>> reason is syncronize_cache() is sent to luns during their suspend and if SSU has
>> been sent already, it mostly would fail.
>
>The SCSI subsystem assumes that different LUNs operate independently.
>Evidently that isn't true here.
>
>> Perhaps that's the reason to send SSU during platform-device suspend. I'm not
>> sure if that's the right thing to do, but that's what it is now and is causing
>> this deadlock.
>> Now this wlun is also registered to bsg and some applications interact with rpmb
>> wlun and the device-wlun using that interface. Registering the corresponding
>> queues to runtime-pm ensures that the whole path is resumed before the request
>> is issued.
>> Because, we see this deadlock, in the RFC patch, I skipped registering the
>> queues representing the wluns to runtime-pm, thus removing the restrictions to
>> issue the request until queue is resumed.
>> But when the requests come-in via bsg, the device has to be resumed. Hence the
>> get_sync()/put_sync() in bsg driver.
>
>Does the bsg interface send its I/O requests to the LUNs through the
>block request queue?
>
>
>> The reason for initiating get_sync()/put_sync() on the parent device was because
>> the corresponding queue of this wlun was not setup for runtime-pm anymore.
>> And for ufs resuming the scsi device essentially means sending a SSU to wlun
>> which the ufs platform device does in its runtime resume now. I'm not sure if
>> that was a good idea though, hence the RFC on the patches.
>>
>> And now it looks to me that adding a cb to sd_suspend_runtime may not work.
>> Because the scsi devices suspend asynchronously and the wlun suspends earlier than the others.
>>
>> [    7.846165]scsi 0:0:0:49488: scsi_runtime_idle
>> [    7.851547]scsi 0:0:0:49488: device wlun
>> [    7.851809]sd 0:0:0:49488: scsi_runtime_idle
>> [    7.861536]sd 0:0:0:49488: scsi_runtime_suspend < suspends prior to other luns
>> [...]
>> [   12.861984]sd 0:0:0:1: [sdb] Synchronizing SCSI cache
>> [   12.868894]sd 0:0:0:2: [sdc] Synchronizing SCSI cache
>> [   13.124331]sd 0:0:0:0: [sda] Synchronizing SCSI cache
>> [   13.143961]sd 0:0:0:3: [sdd] Synchronizing SCSI cache
>> [   13.163876]sd 0:0:0:6: [sdg] Synchronizing SCSI cache
>> [   13.164024]sd 0:0:0:4: [sde] Synchronizing SCSI cache
>> [   13.167066]sd 0:0:0:5: [sdf] Synchronizing SCSI cache
>> [   17.101285]sd 0:0:0:7: [sdh] Synchronizing SCSI cache
>> [   73.889551]sd 0:0:0:4: [sde] Synchronizing SCSI cache
>>
>> I'm not sure if there's a way to force the wlun to suspend only after all other luns are suspended.
>> Is there? I hope Bart/others help provide some inputs on this.
>
>I don't know what would work best for you; it depends on how the LUNs
>are used.  But one possibility is to make sure that whenever the boot
>and rpmb wluns are resumed, the device wlun is also resumed.  So for
>example, the runtime-resume callback routines for the rpmb and boot
>wluns could call pm_runtime_get_sync() for the device wlun, and their
>runtime-suspend callback routines could call pm_runtime_put() for the
>device wlun.  And of course there would have to be appropriate
>operations when those LUNs are bound to and unbound from their drivers.
>
>Alan Stern
>
Thanks Alan.
CanG & I had some discussions on it as well the other day.
I'm now looking into creating a device link between the siblings.
e.g. make the device wlun as a supplier for all the other luns & wluns.
So device wlun (supplier) wouldn't suspend (runtime/system) until all of the other
consumers are suspended. After this linking, I can move all the
pm commands that are being sent by host to the dedicated suspend routine of the device
wlun and the host needn't send any cmds during its suspend and layering
violation wouldn't take place.

-asd

