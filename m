Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8EEF30CD5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 21:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhBBUxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 15:53:49 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:10817 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230002AbhBBUxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 15:53:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612299203; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Kc0BGWO7ac9Fj5088Vazpv6+ZSCVPkzHcUD4b+gryrg=; b=nvk28YNXxjlIQjLIgJWsA3xfTti5wYZNnwAAUdIXVT88/esemzo/GtlpIVC2kpO9zTIpYEzE
 9x3dAHKaxc4uKsg8xETo5ztJInWyzRiasjj8glVlYka5qhWw0SxndZnZ9//SxAyj8ccdMZyU
 rWlIkZroLxmNcbABBb5oRsbMlyU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6019bba4bfd9520723af1852 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 20:52:52
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B274C433C6; Tue,  2 Feb 2021 20:52:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E5D2C433ED;
        Tue,  2 Feb 2021 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E5D2C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Tue, 2 Feb 2021 12:52:45 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210202205245.GA8444@stor-presley.qualcomm.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210201214802.GB420232@rowland.harvard.edu>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 01 2021 at 13:48 -0800, Alan Stern wrote:
>On Mon, Feb 01, 2021 at 12:11:23PM -0800, Asutosh Das (asd) wrote:
>> On 1/27/2021 7:26 PM, Asutosh Das wrote:
>> > v1 -> v2
>> > Use pm_runtime_get/put APIs.
>> > Assuming that all bsg devices are scsi devices may break.
>> >
>> > This patchset attempts to fix a deadlock in ufs.
>> > This deadlock occurs because the ufs host driver tries to resume
>> > its child (wlun scsi device) to send SSU to it during its suspend.
>> >
>> > Asutosh Das (2):
>> >    block: bsg: resume scsi device before accessing
>> >    scsi: ufs: Fix deadlock while suspending ufs host
>> >
>> >   block/bsg.c               |  8 ++++++++
>> >   drivers/scsi/ufs/ufshcd.c | 18 ++----------------
>> >   2 files changed, 10 insertions(+), 16 deletions(-)
>> >
>>
>> Hi Alan/Bart
>>
>> Please can you take a look at this series.
>> Please let me know if you've any better suggestions for this.
>
>I haven't commented on them so far because I don't understand them.

Merging thread with Bart.

>Against which kernel version has this patch series been prepared and
>tested? Have you noticed the following patch series that went into
>v5.11-rc1
>https://lore.kernel.org/linux-scsi/20201209052951.16136-1-bvanassche@acm.org/
Hi Bart - Yes this was tested with this series pulled in.
I'm on 5.10.9.

Thanks Alan.
I've tried to summarize below the problem that I'm seeing.

Problem:
There's a deadlock seen in ufs's runtime-suspend path.
Currently, the wlun's are registered to request based blk-pm.
During ufs pltform-dev runtime-suspend cb, as per protocol needs,
it sends a few cmds (uac, ssu) to wlun.

In this path, it tries to resume the ufs platform device which is actually
suspending and deadlocks.

Yes, if the host doesn't send any commands during it's suspend there wouldn't be
this deadlock.
Setting manage_start_stop would send ssu only.
I can't seem to find a way to send cmds to wlun during it's suspend.
Would overriding sd_pm_ops for wlun be a good idea?
Do you've any other pointers on how to do this?
I'd appreciate any pointers.

>
>> [RFC PATCH v2 1/2] block: bsg: resume platform device before accessing:
>>
>> It may happen that the underlying device's runtime-pm is
>> not controlled by block-pm. So it's possible that when
>> commands are sent to the device, it's suspended and may not
>> be resumed by blk-pm. Hence explicitly resume the parent
>> which is the platform device.
>
>If you want to send a command to the underlying device, why do you
>resume the underlying device's _parent_?  Why not resume the device
>itself?
>
>Why is bsg sending commands to the underlying device in a way that
>evades checks for whether the device is suspended?  Shouldn't the
>device's driver already be responsible for automatically resuming the
>device when a command is sent?
>
>> [RFC PATCH v2 2/2] scsi: ufs: Fix deadlock while suspending ufs host:
>>
>> During runtime-suspend of ufs host, the scsi devices are
>> already suspended and so are the queues associated with them.
>> But the ufs host sends SSU to wlun during its runtime-suspend.
>> During the process blk_queue_enter checks if the queue is not in
>> suspended state. If so, it waits for the queue to resume, and never
>> comes out of it.
>> The commit
>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>> adds the check if the queue is in suspended state in blk_queue_enter().
>>
>> Fix this, by decoupling wlun scsi devices from block layer pm.
>> The runtime-pm for these devices would be managed by bsg and sg drivers.
>
>Why do you need to send a command to the wlun when the host is being
>suspended?  Shouldn't that command already have been sent, at the time
>when the wlun was suspended?
>
>Alan Stern
