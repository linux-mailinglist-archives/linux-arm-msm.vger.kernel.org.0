Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27C3486DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 03:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbhCYCPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 22:15:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49796 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhCYCO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 22:14:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616638498; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FGpXY2NdzTsPPbXNozOx92efrSaEJvejPaySL2FCurA=; b=ItvOmDW+5K1cr+4e7f4Y+rbwp6GcyccopcL49vi81jn+wRt9zvEniVH716SKvqDdfSXzUNIk
 JJHRAi7NRTuvrxgSX0/IwTOl3TFSDuqJEjxR8eq7c5Fji7IdutGMR4lDySyDrTvT+sOVE3du
 RXxDwXJK1wvxj2D8wmyRTJa54G4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 605bf2222b0e10a0ba467788 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 02:14:58
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13C06C43464; Thu, 25 Mar 2021 02:14:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19158C433CA;
        Thu, 25 Mar 2021 02:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19158C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
To:     Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
 <88730ac9-d9c5-d758-d761-8c549c488aab@intel.com>
 <3268f1d9-03ae-17dd-87be-04bd6531334b@codeaurora.org>
 <e324d78e-f383-30e2-1a08-b98d442df206@intel.com>
 <834cec94-f4fc-606e-df69-853644f3d88e@codeaurora.org>
 <c92bec14-8457-7992-6714-398b467b67e3@intel.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <974c14d9-fbeb-0106-0f8a-9293e7db85bf@codeaurora.org>
Date:   Wed, 24 Mar 2021 19:14:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c92bec14-8457-7992-6714-398b467b67e3@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/23/2021 12:19 PM, Adrian Hunter wrote:
> On 23/03/21 5:13 pm, Asutosh Das (asd) wrote:
>> On 3/22/2021 11:12 PM, Adrian Hunter wrote:
>>> On 22/03/21 9:53 pm, Asutosh Das (asd) wrote:
>>>> On 3/19/2021 10:47 AM, Adrian Hunter wrote:
>>>>> On 19/03/21 2:35 am, Asutosh Das wrote:
>>>>>> During runtime-suspend of ufs host, the scsi devices are
>>>>>> already suspended and so are the queues associated with them.
>>>>>> But the ufs host sends SSU to wlun during its runtime-suspend.
>>>>>> During the process blk_queue_enter checks if the queue is not in
>>>>>> suspended state. If so, it waits for the queue to resume, and never
>>>>>> comes out of it.
>>>>>> The commit
>>>>>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>>>>>> adds the check if the queue is in suspended state in blk_queue_enter().
>>>>>>
>>>>>> Call trace:
>>>>>>     __switch_to+0x174/0x2c4
>>>>>>     __schedule+0x478/0x764
>>>>>>     schedule+0x9c/0xe0
>>>>>>     blk_queue_enter+0x158/0x228
>>>>>>     blk_mq_alloc_request+0x40/0xa4
>>>>>>     blk_get_request+0x2c/0x70
>>>>>>     __scsi_execute+0x60/0x1c4
>>>>>>     ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>>>>>     ufshcd_suspend+0x208/0x83c
>>>>>>     ufshcd_runtime_suspend+0x40/0x154
>>>>>>     ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>>>>>     pm_generic_runtime_suspend+0x28/0x3c
>>>>>>     __rpm_callback+0x80/0x2a4
>>>>>>     rpm_suspend+0x308/0x614
>>>>>>     rpm_idle+0x158/0x228
>>>>>>     pm_runtime_work+0x84/0xac
>>>>>>     process_one_work+0x1f0/0x470
>>>>>>     worker_thread+0x26c/0x4c8
>>>>>>     kthread+0x13c/0x320
>>>>>>     ret_from_fork+0x10/0x18
>>>>>>
>>>>>> Fix this by registering ufs device wlun as a scsi driver and
>>>>>> registering it for block runtime-pm. Also make this as a
>>>>>> supplier for all other luns. That way, this device wlun
>>>>>> suspends after all the consumers and resumes after
>>>>>> hba resumes.
>>>>>>
>>>>>> Co-developed-by: Can Guo <cang@codeaurora.org>
>>>>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>>>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>>>>
>>>>> I have some more comments that may help straighten things out.
>>>>>
>>>>> Also please look at ufs_debugfs_get_user_access() and
>>>>> ufs_debugfs_put_user_access() that now need to scsi_autopm_get/put_device
>>>>> sdev_ufs_device.
>>>>>
>>>>> It would also be good if you could re-base on linux-next.
>>>>>
>>>>
>>>> Hi Adrian
>>>> Thanks for the comments.
>>>>
>>>> I agree moving the code to wlun probe and other changes.
>>>> But it looks to me that it may not fully solve the issue.
>>>>
>>>> Please let me explain my understanding on this:
>>>>
>>>> (Please refer to the logs in v10)
>>>> scsi_autopm_*() are invoked on a sdev.
>>>> pm_runtime_get_suppliers()/rpm_put_suppliers() are on the supplier device.
>>>>
>>>> For the device wlun:
>>>>       slave_configure():
>>>>           - doesn't set the rpm_autosuspend
>>>>           - pm_runtime_getnoresume()
>>>>       scsi_sysfs_add_sdev():
>>>>           - pm_runtime_forbid()
>>>>           - scsi_autopm_get_device()
>>>>           - device_add()
>>>>               - ufshcd_wl_probe()
>>>>           - scsi_autopm_put_device()
>>>>
>>>> For all other scsi devices:
>>>>       slave_alloc():
>>>>           - ufshcd_setup_links()
>>>> Say all link_add: pm_runtime_put(&hba->sdev_ufs_device->sdev_gendev);
>>>
>>> With DL_FLAG_RPM_ACTIVE, links will 'get' not 'put'
>>>
>> I'm referring to the pm_runtime_put(sdev_ufs_device) after all the links are setup, that you suggested to add.
> 
> Ok
> 
>>>>       slave_configure():
>>>>           - set rpm_autosuspend
>>>>       scsi_sysfs_add_sdev():
>>>>           - scsi_autopm_get_device()
>>>>           - device_add() -> schedules an async probe()
>>>>           - scsi_autopm_put_device() - (1)
>>>>
>>>> Now the rpm_put_suppliers() can be invoked *after* pm_runtime_get_suppliers() of the async probe(), since both are running in different contexts.
>>>
>>> Only if the sd device suspends.
>>>
>> Correct. What'd stop the sd device from suspending?
>> We should be stopping the sd device from suspending here - imho.
> 

Hi Adrian,
Thanks for the comments.

> You mean for performance reasons.  That is something we can
> look at, but let's get it working first.
> 
Not for performance reasons. I meant to say that this issue can be fixed 
if we stop the sd devices from suspending until the sd_probe() is completed.
>>
>>>> In that case, the usage_count of supplier would be decremented until rpm_active of this link becomes 1.
>>>
>>> Right, because the sd device suspended.
>>>
>>>> Now the pm_runtime_get_suppliers() expects the link_active to be more than 1.
>>>
>>> Not sure what you mean here. pm_runtime_*put*_suppliers() won't do anything if the link count is 1.
>> I'm referring to the logs that I pasted before:
>> [    6.941267][    T7] scsi 0:0:0:4: rpm_put_suppliers: [BEF] Supp (0:0:0:49488) usage_count: 4 rpm_active: 3
>>
>> ------ T196 Context comes in while T7 is running ----------
>> [    6.941466][  T196] scsi 0:0:0:4: pm_runtime_get_suppliers: (0:0:0:49488): supp: usage_count: 5 rpm_active: 4
>> --------------------------------------------------------------
>>
>> [    7.788397][    T7] scsi 0:0:0:4: rpm_put_suppliers: [AFT] Supp (0:0:0:49488) usage_count: 2 rpm_active: 1
>>
>> I meant to say that, if the rpm_put_suppliers() is invoked after the pm_runtime_get_suppliers() as is seen above then the link_active may become 1 even *after* pm_runtime_get_suppliers() is invoked.
>>
>> I'm referring to the pm_runtime_get_suppliers() invoked from:
>> driver_probe_device() - say for, sd 0:0:0:x
>>      |- pm_runtime_get_suppliers() - for sd 0:0:0:49488
> 
> I am hoping that was the problem that Rafael's revert dealt with.
> 
I think the issue is in the sequence of events.
If rpm_put_suppliers() runs after pm_runtime_get_suppliers() this issue 
can occur.

>>>
>>>> Now then, there comes a time, that when sd_probe() schedules a suspend, the supplier usage_count becomes 0 and the link_active becomes 1.
>>>> And the supplier suspends before the consumer.
>>>
>>> sd probe first resumes the sd device which will resume the supplier.
>>>
>> Correct, but it'd again schedule a suspend (since autosuspend is enabled now) at the end of the sd_probe().
>> Thereafter, pm_runtime_put_suppliers()(sd 0:0:0:49488) is invoked from driver_probe_device() which had actually invoked sd_probe().
>> That'd make the link_active to 1 even when sd 0:0:0:x is active.
> 
> If sd 0:0:0:x is active then rpm_get_suppliers() still has +1 rpm_active. pm_runtime_get_suppliers() also has +1 rpm_active.
> i.e. rpm_active is 3. If rpm_put_suppliers() is called, it means sd 0:0:0:x has really runtime suspended (not just waiting for autosuspend.  Otherwise when the probe ends pm_runtime_put_suppliers() will drop rpm_active from 3 to 2.
In the good case it'd drop from 3 to 2. But in the bad case, I see that 
it drops to 1. That's when the supplier suspends before the consumer.
That would happen when rpm_put_suppliers() runs after the 
pm_runtime_get_suppliers() is completed and decrements the usage_count 
of supplier until link_active is 1. At that point yes, sd 0:0:0:x has 
really runtime-suspended. sd_probe() would resume it and schedule a 
suspend at the end of probe.

IIUC, below is the sequence of events that can lead to this issue:
1. sd 0:0:0:x schedules an async probe
2. sd 0:0:0:x invokes scsi_autopm_put_device()
3. async probe completes pm_runtime_get_suppliers() increments the 
rpm_active.
4. suspend of sd 0:0:0:x is invoked and rpm_put_suppliers() is invoked 
which decrements the link_active (this was incremented in 3 above)
5. sd_probe() is invoked which resumes it and schedules a suspend
6. pm_runtime_put_suppliers() is invoked which decreases the link_active 
to 1 and supplier suspends before the consumer.

So my solution was to stop sd 0:0:0:x from runtime suspending until the 
sd_probe() is done.

> 
> But it is a bit theoretical.  Let's try it and see.
> 
>>
>>>>
>>>> So I was wondering, what'd make sure that the pm_runtime_get_suppliers() from driver_probe_device() is invoked after scsi_autopm_put_device() (1) finishes the rpm_put_suppliers().
>>>>
>>>> Am not sure if I'm missing something in this.
>>>> Do you think, the current changes alone can fix the above issue?
>>>
>>> Yes, but let's see.
>>>
>> Essentially, we should stop the sd device from runtime suspending until it's probe is done. Then allow the same. Does it make sense?
>> Please let me know what you think.
> 
> I really think it would be good to try the changes that have been identified and see how it behaves.
> 
> Then go from there.
> 
Sure, I've pushed the changes v13 today.
I will test it after the changes are finalized.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
