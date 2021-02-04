Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EFD30E85E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 01:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbhBDAPD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 19:15:03 -0500
Received: from so15.mailgun.net ([198.61.254.15]:38399 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232762AbhBDAPD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 19:15:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612397674; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=mIWDcktWE1L+2IoeFld5kV4QUY0VJKRFwi2eot29egk=; b=B8So56ZZ9gSc53JQNumEB25RCrLXSMIn0SEw1GHhWgbz5u/4lRBwCRNsrmi0RR+YNDjNjD4T
 Pm4Iy2+V0Lv6aKd9m5xFM4flWMVEG/YUGMV6qcraJcbFP27p5QhNzgGjlsDCKtXs00K+E4Uk
 OycWBArJ7c0FCMEq3rHHftbcBYU=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 601b3c47a60dd1dcb159734d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 00:13:59
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 571B9C433CA; Thu,  4 Feb 2021 00:13:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7299C433CA;
        Thu,  4 Feb 2021 00:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7299C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Wed, 3 Feb 2021 16:13:54 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210204001354.GD37557@stor-presley.qualcomm.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210202220536.GA464234@rowland.harvard.edu>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 02 2021 at 14:05 -0800, Alan Stern wrote:
>On Tue, Feb 02, 2021 at 12:52:45PM -0800, Asutosh Das wrote:
>> On Mon, Feb 01 2021 at 13:48 -0800, Alan Stern wrote:
>> > On Mon, Feb 01, 2021 at 12:11:23PM -0800, Asutosh Das (asd) wrote:
>> > > On 1/27/2021 7:26 PM, Asutosh Das wrote:
>> > > > v1 -> v2
>> > > > Use pm_runtime_get/put APIs.
>> > > > Assuming that all bsg devices are scsi devices may break.
>> > > >
>> > > > This patchset attempts to fix a deadlock in ufs.
>> > > > This deadlock occurs because the ufs host driver tries to resume
>> > > > its child (wlun scsi device) to send SSU to it during its suspend.
>> > > >
>> > > > Asutosh Das (2):
>> > > >    block: bsg: resume scsi device before accessing
>> > > >    scsi: ufs: Fix deadlock while suspending ufs host
>> > > >
>> > > >   block/bsg.c               |  8 ++++++++
>> > > >   drivers/scsi/ufs/ufshcd.c | 18 ++----------------
>> > > >   2 files changed, 10 insertions(+), 16 deletions(-)
>> > > >
>> > >
>> > > Hi Alan/Bart
>> > >
>> > > Please can you take a look at this series.
>> > > Please let me know if you've any better suggestions for this.
>> >
>> > I haven't commented on them so far because I don't understand them.
>>
>> Merging thread with Bart.
>>
>> > Against which kernel version has this patch series been prepared and
>> > tested? Have you noticed the following patch series that went into
>> > v5.11-rc1
>> > https://lore.kernel.org/linux-scsi/20201209052951.16136-1-bvanassche@acm.org/
>> Hi Bart - Yes this was tested with this series pulled in.
>> I'm on 5.10.9.
>>
>> Thanks Alan.
>> I've tried to summarize below the problem that I'm seeing.
>>
>> Problem:
>> There's a deadlock seen in ufs's runtime-suspend path.
>> Currently, the wlun's are registered to request based blk-pm.
>> During ufs pltform-dev runtime-suspend cb, as per protocol needs,
>> it sends a few cmds (uac, ssu) to wlun.
>
>That doesn't make sense.  Why send commands to the wlun at a time when
>you know the wlun is already suspended?  If you wanted the wlun to
>execute those commands, you should have sent them while the wlun was
>still powered up.
>
>> In this path, it tries to resume the ufs platform device which is actually
>> suspending and deadlocks.
>
>Because you have violated the power management layering.  The platform
>device's suspend routine is meant to assume that all of its child
>devices are already suspended and therefore it must not try to
>communicate with them.
>
>> Yes, if the host doesn't send any commands during it's suspend there wouldn't be
>> this deadlock.
>> Setting manage_start_stop would send ssu only.
>> I can't seem to find a way to send cmds to wlun during it's suspend.
>
>You can't send commands to _any_ device while it is suspended!  That's
>kind of the whole point -- being suspended means the device is in a
>low-power state and therefore is unable to execute commands.
>
>> Would overriding sd_pm_ops for wlun be a good idea?
>> Do you've any other pointers on how to do this?
>> I'd appreciate any pointers.
>
>I am not a good person to answer these questions, mainly because I know
>so little about this.  What is the relation between the wlun and the sd
>driver?  For that matter, what does the "w" in "wlun" stand for?
>
>(And for that matter, what do "ufs" and "bsg" stand for?)
>
>You really need to direct these questions to the SCSI maintainers; I am
>not in charge of any of that code.  I can only suggest a couple of
>possibilities.  For instance, you could modify the sd_suspend_runtime
>routine: make it send the commands whenever they are needed.  Or you
>could add a callback pointer to a routine that would send the commands.
>
>Alan Stern
>

Thanks Alan.
I understand the issues with the current ufs design.

ufs has a wlun (well-known lun) that handles power management commands,
such as SSUs. Now this wlun (device wlun) is registered as a scsi_device.
It's queue is also set up for runtime-pm. Likewise there're 2
more wluns, BOOT and RPMB.

Currently, the scsi devices independently runtime suspend/resume - request driven.
So to send SSU while suspending wlun (scsi_device) this scsi device should
be the last to be runtime suspended amongst all other ufs luns (scsi devices). The
reason is syncronize_cache() is sent to luns during their suspend and if SSU has
been sent already, it mostly would fail.
Perhaps that's the reason to send SSU during platform-device suspend. I'm not
sure if that's the right thing to do, but that's what it is now and is causing
this deadlock.
Now this wlun is also registered to bsg and some applications interact with rpmb
wlun and the device-wlun using that interface. Registering the corresponding
queues to runtime-pm ensures that the whole path is resumed before the request
is issued.
Because, we see this deadlock, in the RFC patch, I skipped registering the
queues representing the wluns to runtime-pm, thus removing the restrictions to
issue the request until queue is resumed.
But when the requests come-in via bsg, the device has to be resumed. Hence the
get_sync()/put_sync() in bsg driver.
The reason for initiating get_sync()/put_sync() on the parent device was because
the corresponding queue of this wlun was not setup for runtime-pm anymore.
And for ufs resuming the scsi device essentially means sending a SSU to wlun
which the ufs platform device does in its runtime resume now. I'm not sure if
that was a good idea though, hence the RFC on the patches.

And now it looks to me that adding a cb to sd_suspend_runtime may not work.
Because the scsi devices suspend asynchronously and the wlun suspends earlier than the others.

[    7.846165]scsi 0:0:0:49488: scsi_runtime_idle
[    7.851547]scsi 0:0:0:49488: device wlun
[    7.851809]sd 0:0:0:49488: scsi_runtime_idle
[    7.861536]sd 0:0:0:49488: scsi_runtime_suspend < suspends prior to other luns
[...]
[   12.861984]sd 0:0:0:1: [sdb] Synchronizing SCSI cache
[   12.868894]sd 0:0:0:2: [sdc] Synchronizing SCSI cache
[   13.124331]sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   13.143961]sd 0:0:0:3: [sdd] Synchronizing SCSI cache
[   13.163876]sd 0:0:0:6: [sdg] Synchronizing SCSI cache
[   13.164024]sd 0:0:0:4: [sde] Synchronizing SCSI cache
[   13.167066]sd 0:0:0:5: [sdf] Synchronizing SCSI cache
[   17.101285]sd 0:0:0:7: [sdh] Synchronizing SCSI cache
[   73.889551]sd 0:0:0:4: [sde] Synchronizing SCSI cache

I'm not sure if there's a way to force the wlun to suspend only after all other luns are suspended.
Is there? I hope Bart/others help provide some inputs on this.

-asd


