Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DAE324350
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 18:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhBXRrQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 12:47:16 -0500
Received: from z11.mailgun.us ([104.130.96.11]:20645 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhBXRrM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 12:47:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614188807; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WAFHMhDviNgazdoyHLOnjKjtFroHVRcONHq8aRYAeDI=;
 b=lmsM+eXIGiAamJLDuSOgHX0S3W21SL6AwumFp/B5/ziMLS3BvjqUAjfyUbSD/o2if7xyj4lc
 3R23WTmQ90PBQPfEaxIBJLTXIb+nf51sWcMeDD1SXL7gkXhOlJ0lx5dzZttR1GfpDSn5hhUw
 bT5Iu2LIgdm2RB1ZGLjYSulrxjM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60369104e9080d5ff781f90d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 17:46:44
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B92CBC43461; Wed, 24 Feb 2021 17:46:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E550C433ED;
        Wed, 24 Feb 2021 17:46:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Feb 2021 09:46:43 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state
 workqueue
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210224102516.GW27945@work>
References: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
 <20210224102516.GW27945@work>
Message-ID: <e6a1b0b928dbd2b9addd617e9c72e80f@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-24 02:25 AM, Manivannan Sadhasivam wrote:
> On Wed, Feb 24, 2021 at 11:18:50AM +0100, Loic Poulain wrote:
>> A recent change created a dedicated workqueue for the state-change 
>> work
>> with WQ_HIGHPRI (no strong reason for that) and WQ_MEM_RECLAIM flags,
>> but the state-change work (mhi_pm_st_worker) does not guarantee 
>> forward
>> progress under memory pressure, and will even wait on various memory
>> allocations when e.g. creating devices, loading firmware, etc... The
>> work is then not part of a memory reclaim path...
>> 
>> Moreover, this causes a warning in check_flush_dependency() since we 
>> end
>> up in code that flushes a non-reclaim workqueue:
>> 
>> [   40.969601] workqueue: WQ_MEM_RECLAIM 
>> mhi_hiprio_wq:mhi_pm_st_worker [mhi] is flushing !WQ_MEM_RECLAIM 
>> events_highpri:flush_backlog
>> [   40.969612] WARNING: CPU: 4 PID: 158 at kernel/workqueue.c:2607 
>> check_flush_dependency+0x11c/0x140
>> [   40.969733] Call Trace:
>> [   40.969740]  __flush_work+0x97/0x1d0
>> [   40.969745]  ? wake_up_process+0x15/0x20
>> [   40.969749]  ? insert_work+0x70/0x80
>> [   40.969750]  ? __queue_work+0x14a/0x3e0
>> [   40.969753]  flush_work+0x10/0x20
>> [   40.969756]  rollback_registered_many+0x1c9/0x510
>> [   40.969759]  unregister_netdevice_queue+0x94/0x120
>> [   40.969761]  unregister_netdev+0x1d/0x30
>> [   40.969765]  mhi_net_remove+0x1a/0x40 [mhi_net]
>> [   40.969770]  mhi_driver_remove+0x124/0x250 [mhi]
>> [   40.969776]  device_release_driver_internal+0xf0/0x1d0
>> [   40.969778]  device_release_driver+0x12/0x20
>> [   40.969782]  bus_remove_device+0xe1/0x150
>> [   40.969786]  device_del+0x17b/0x3e0
>> [   40.969791]  mhi_destroy_device+0x9a/0x100 [mhi]
>> [   40.969796]  ? mhi_unmap_single_use_bb+0x50/0x50 [mhi]
>> [   40.969799]  device_for_each_child+0x5e/0xa0
>> [   40.969804]  mhi_pm_st_worker+0x921/0xf50 [mhi]
>> 
>> Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority 
>> workqueue")
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

> 
> Fix looks good to me but I want Bhaumik to share his review since he
> authored the offending patch.
> 
We have seen this internally as well. I agree this patch needs to go in.

We had previously seen issues using global workqueue hence decided to 
move to a
dedicated one with WQ_HIGHPRI in order to speed up execution of the 
worker when
a certain task is queued. For example, handling SBL or power down needs 
to be
done promptly.

> Thanks,
> Mani
> 
>> ---
>>  drivers/bus/mhi/core/init.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 32eb90f..03ddd6e 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -890,8 +890,7 @@ int mhi_register_controller(struct mhi_controller 
>> *mhi_cntrl,
>>  	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
>>  	init_waitqueue_head(&mhi_cntrl->state_event);
>> 
>> -	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
>> -				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
>> +	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue("mhi_hiprio_wq", 
>> WQ_HIGHPRI);
>>  	if (!mhi_cntrl->hiprio_wq) {
>>  		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
>>  		ret = -ENOMEM;
>> --
>> 2.7.4
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
