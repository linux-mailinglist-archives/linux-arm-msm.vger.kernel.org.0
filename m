Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729823114EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 23:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhBEWS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 17:18:57 -0500
Received: from so15.mailgun.net ([198.61.254.15]:45828 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232692AbhBEOdU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 09:33:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612541492; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=KAzH7tCJId+h5JSCihS+FaheGWIFSeiWWbMU0s2+TME=; b=c006pJXkCwsLGbpFXuMsoS95B4+G4N/9jicPW7rwO4ncChhjcwNQKitvKvWqpi8P/JE9cfAH
 rTC1vKjQUuKC9CTHwZjS4My3w+NaGSGv62M30BS+VnlZqrW+8UDScztvsSjlZmM/ZoCBT+41
 PQ6gmSIiWFmMaHAbw0L91cZAixY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 601d6e1934db06ef79767e9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 16:11:05
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49F4DC433ED; Fri,  5 Feb 2021 16:11:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DADB6C433C6;
        Fri,  5 Feb 2021 16:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DADB6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Fri, 5 Feb 2021 08:11:02 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210205161102.GJ37557@stor-presley.qualcomm.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
 <20210204001354.GD37557@stor-presley.qualcomm.com>
 <20210204194831.GA567391@rowland.harvard.edu>
 <20210204211424.GH37557@stor-presley.qualcomm.com>
 <DM6PR04MB6575692524202EC91E2A5480FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR04MB6575692524202EC91E2A5480FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 05 2021 at 23:56 -0800, Avri Altman wrote:
>>
>> On Thu, Feb 04 2021 at 11:48 -0800, Alan Stern wrote:
>> >On Wed, Feb 03, 2021 at 04:13:54PM -0800, Asutosh Das wrote:
>> >> Thanks Alan.
>> >> I understand the issues with the current ufs design.
>> >>
>> >> ufs has a wlun (well-known lun) that handles power management
>> commands,
>> >> such as SSUs. Now this wlun (device wlun) is registered as a scsi_device.
>> >> It's queue is also set up for runtime-pm. Likewise there're 2
>> >> more wluns, BOOT and RPMB.
>> >>
>> >> Currently, the scsi devices independently runtime suspend/resume - request
>> driven.
>> >> So to send SSU while suspending wlun (scsi_device) this scsi device should
>> >> be the last to be runtime suspended amongst all other ufs luns (scsi devices).
>> The
>> >> reason is syncronize_cache() is sent to luns during their suspend and if SSU
>> has
>> >> been sent already, it mostly would fail.
>> >
>> >The SCSI subsystem assumes that different LUNs operate independently.
>> >Evidently that isn't true here.
>> >
>> >> Perhaps that's the reason to send SSU during platform-device suspend. I'm
>> not
>> >> sure if that's the right thing to do, but that's what it is now and is causing
>> >> this deadlock.
>> >> Now this wlun is also registered to bsg and some applications interact with
>> rpmb
>> >> wlun and the device-wlun using that interface. Registering the
>> corresponding
>> >> queues to runtime-pm ensures that the whole path is resumed before the
>> request
>> >> is issued.
>> >> Because, we see this deadlock, in the RFC patch, I skipped registering the
>> >> queues representing the wluns to runtime-pm, thus removing the
>> restrictions to
>> >> issue the request until queue is resumed.
>> >> But when the requests come-in via bsg, the device has to be resumed. Hence
>> the
>> >> get_sync()/put_sync() in bsg driver.
>> >
>> >Does the bsg interface send its I/O requests to the LUNs through the
>> >block request queue?
>> >
>> >
>> >> The reason for initiating get_sync()/put_sync() on the parent device was
>> because
>> >> the corresponding queue of this wlun was not setup for runtime-pm
>> anymore.
>> >> And for ufs resuming the scsi device essentially means sending a SSU to wlun
>> >> which the ufs platform device does in its runtime resume now. I'm not sure
>> if
>> >> that was a good idea though, hence the RFC on the patches.
>> >>
>> >> And now it looks to me that adding a cb to sd_suspend_runtime may not
>> work.
>> >> Because the scsi devices suspend asynchronously and the wlun suspends
>> earlier than the others.
>> >>
>> >> [    7.846165]scsi 0:0:0:49488: scsi_runtime_idle
>> >> [    7.851547]scsi 0:0:0:49488: device wlun
>> >> [    7.851809]sd 0:0:0:49488: scsi_runtime_idle
>> >> [    7.861536]sd 0:0:0:49488: scsi_runtime_suspend < suspends prior to other
>> luns
>> >> [...]
>> >> [   12.861984]sd 0:0:0:1: [sdb] Synchronizing SCSI cache
>> >> [   12.868894]sd 0:0:0:2: [sdc] Synchronizing SCSI cache
>> >> [   13.124331]sd 0:0:0:0: [sda] Synchronizing SCSI cache
>> >> [   13.143961]sd 0:0:0:3: [sdd] Synchronizing SCSI cache
>> >> [   13.163876]sd 0:0:0:6: [sdg] Synchronizing SCSI cache
>> >> [   13.164024]sd 0:0:0:4: [sde] Synchronizing SCSI cache
>> >> [   13.167066]sd 0:0:0:5: [sdf] Synchronizing SCSI cache
>> >> [   17.101285]sd 0:0:0:7: [sdh] Synchronizing SCSI cache
>> >> [   73.889551]sd 0:0:0:4: [sde] Synchronizing SCSI cache
>> >>
>> >> I'm not sure if there's a way to force the wlun to suspend only after all other
>> luns are suspended.
>> >> Is there? I hope Bart/others help provide some inputs on this.
>> >
>> >I don't know what would work best for you; it depends on how the LUNs
>> >are used.  But one possibility is to make sure that whenever the boot
>> >and rpmb wluns are resumed, the device wlun is also resumed.  So for
>> >example, the runtime-resume callback routines for the rpmb and boot
>> >wluns could call pm_runtime_get_sync() for the device wlun, and their
>> >runtime-suspend callback routines could call pm_runtime_put() for the
>> >device wlun.  And of course there would have to be appropriate
>> >operations when those LUNs are bound to and unbound from their drivers.
>> >
>> >Alan Stern
>> >
>> Thanks Alan.
>> CanG & I had some discussions on it as well the other day.
>> I'm now looking into creating a device link between the siblings.
>> e.g. make the device wlun as a supplier for all the other luns & wluns.
>> So device wlun (supplier) wouldn't suspend (runtime/system) until all of the
>> other
>> consumers are suspended. After this linking, I can move all the
>> pm commands that are being sent by host to the dedicated suspend routine of
>> the device
>> wlun and the host needn't send any cmds during its suspend and layering
>> violation wouldn't take place.
>Regardless of your above proposal, as for the issues you were witnessing with rpmb,
>That started this RFC in the first place, and the whole clearing uac series for that matter:
> "In order to conduct FFU or RPMB operations, UFS needs to clear UNIT ATTENTION condition...."
>
>Functionally, This was already done for the device wlun, and only added the rpmb wlun.
>
>Now you are trying to solve stuff because the rpmb is not provisioned.
>a) There should be no relation between response to request-sense command,
> and if the key is programmed or not. And
>b) rpmb is accessed from user-space.  If it is not provisioned, it should processed the error (-7)
>    and realize that by itself.  And also, It only makes sense that if needed,
>    the access sequence will include  the request-sense command.
>
>Therefore, IMHO, just reverting Randall commit (1918651f2d7e) and fixing the user-space code
>Should suffice.
>
>Thanks,
>Avri
>
Hi Avri

Thanks.

I don't think reverting 1918651f2d7e would fix this.

[   12.182750] ufshcd-qcom 1d84000.ufshc: ufshcd_suspend: Setting power mode
[   12.190467] ufshcd-qcom 1d84000.ufshc: wlun_dev_clr_ua: 0 <-- uac wasn't sent
[   12.196735] ufshcd-qcom 1d84000.ufshc: Sending ssu
[   12.202412] scsi 0:0:0:49488: Queue rpm status b4 ssu: 2 <- sdev_ufs_device queue is suspended
[   12.208613] ufshcd-qcom 1d84000.ufshc: Wait for resume - <-- deadlock!

The issue is sending any command to any lun which is registered for blk
runtime-pm in ufs host's suspend path would deadlock; since, it'd try to resume
the ufs host in the same suspend calling sequence.

-asd
