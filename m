Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5B7368505
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 18:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237829AbhDVQjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 12:39:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31945 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236668AbhDVQju (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 12:39:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619109555; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/mm9WV2bjsZbhbPwSCfsNxlMTHiCooMD2kmhdaXn4IY=; b=oJH+i321gmOShtYGApGnmIDLfCr0KMVShTv+OgHoO80a0CP8HuWJp6WzSSr5L4svc9NzstUn
 pjUSeO1U0liDSnBrTgg46lP2VFo3w1CYM2onR1nzhnExd61wlrnPPQd2UDQvb9Lxbk8CaxhJ
 2KjEkyTOQwCGQgFnKIbq+pF2CJM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6081a6a9c39407c3270294f9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 16:39:05
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40B86C43146; Thu, 22 Apr 2021 16:39:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 71B2FC433F1;
        Thu, 22 Apr 2021 16:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 71B2FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
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
        Lee Jones <lee.jones@linaro.org>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Colin Ian King <colin.king@canonical.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yue Hu <huyue2@yulong.com>,
        Bart van Assche <bvanassche@acm.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1618600985.git.asutoshd@codeaurora.org>
 <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
 <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
 <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
 <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
 <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <651f5d8a-5ab7-77dd-3fed-05feb3fd3e1a@codeaurora.org>
Date:   Thu, 22 Apr 2021 09:38:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/20/2021 12:42 AM, Adrian Hunter wrote:
> On 20/04/21 7:15 am, Adrian Hunter wrote:
>> On 20/04/21 12:53 am, Asutosh Das (asd) wrote:
>>> On 4/19/2021 11:37 AM, Adrian Hunter wrote:
>>>> On 16/04/21 10:49 pm, Asutosh Das wrote:
>>>>>
>>>>> Co-developed-by: Can Guo <cang@codeaurora.org>
>>>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>>>> ---
>>>>
>>>> I came across 3 issues while testing.  See comments below.
>>>>
>>> Hi Adrian
>>> Thanks for the comments.
>>>> <SNIP>
>>>>
>>>>> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>>>>>        if (ufshcd_is_clkscaling_supported(hba))
>>>>>            ufshcd_clk_scaling_suspend(hba, false);
>>>>>        ufshcd_clear_ua_wluns(hba);
>>>>
>>>> ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
>>>> if sdev_rpmb is suspended and sdev_ufs_device is suspending.
>>>> e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
>>>> is running, at which point sdev_rpmb has already suspended.
>>>>
>>> Umm, I didn't understand this deadlock.
>>> When you say, sdev_rpmb is suspended, does it mean runtime_suspended?
>>> sdev_ufs_device is suspending - this can't be runtime_suspending, while ufshcd_err_handling_unprepare is running.
>>>
>>> If you've a call-stack of this deadlock, please can you share it with me. I'll also try to reproduce this.
>>
>> Yes it is system suspend. sdev_rpmb has suspended, sdev_ufs_device is waiting on host_sem.
>> ufshcd_err_handler() holds host_sem. ufshcd_clear_ua_wlun(UFS_UPIU_RPMB_WLUN) gets stuck.
>> I will get some call-stacks.
> 
Hi Adrian,

Thanks for the call stacks.
 From the current information, I can't say for sure why it'd get stuck 
in blk_queue_enter().

I tried reproducing this issue on my setup yesterday but couldn't.
Here's what I did:
1. sdev_rpmb is RPM_SUSPENDED, checked before initiating system suspend
2. sdev_ufs_device is RPM_RESUMED
3. I triggered system suspend (echo mem > /sys/power/state) and 
scheduled the error handler from ufshcd_wl_suspend().
4. Waited until error handler ran and then ufshcd_wl_suspend() blocks on 
host_sem.
5. The ufshcd_clear_wa_wlun(UFS_UPIU_RPMB_WLUN) went through fine.

Do you've some specific steps to reproduce this or a script, perhaps? If 
so, please can you share it with me. I will try again.
My test environment is in 5.10 kernel with Android, I suppose that 
should be ok though.

Thanks
-asd

> Here are the call stacks
> 
> [   34.094321] Workqueue: ufs_eh_wq_0 ufshcd_err_handler
> [   34.094788] Call Trace:
> [   34.095281]  __schedule+0x275/0x6c0
> [   34.095743]  schedule+0x41/0xa0
> [   34.096240]  blk_queue_enter+0x10d/0x230
> [   34.096693]  ? wait_woken+0x70/0x70
> [   34.097167]  blk_mq_alloc_request+0x53/0xc0
> [   34.097610]  blk_get_request+0x1e/0x60
> [   34.098053]  __scsi_execute+0x3c/0x260
> [   34.098529]  ufshcd_clear_ua_wlun.cold+0xa6/0x14b
> [   34.098977]  ufshcd_clear_ua_wluns.part.0+0x4d/0x92
> [   34.099456]  ufshcd_err_handler+0x97a/0x9ff
> [   34.099902]  process_one_work+0x1cc/0x360
> [   34.100384]  worker_thread+0x45/0x3b0
> [   34.100851]  ? process_one_work+0x360/0x360
> [   34.101308]  kthread+0xf6/0x130
> [   34.101728]  ? kthread_park+0x80/0x80
> [   34.102186]  ret_from_fork+0x1f/0x30
> 
> [   34.640751] task:kworker/u10:9   state:D stack:14528 pid:  255 ppid:     2 flags:0x00004000
> [   34.641253] Workqueue: events_unbound async_run_entry_fn
> [   34.641722] Call Trace:
> [   34.642217]  __schedule+0x275/0x6c0
> [   34.642683]  schedule+0x41/0xa0
> [   34.643179]  schedule_timeout+0x18b/0x290
> [   34.643645]  ? del_timer_sync+0x30/0x30
> [   34.644131]  __down_timeout+0x6b/0xc0
> [   34.644568]  ? ufshcd_clkscale_enable_show+0x20/0x20
> [   34.645014]  ? async_schedule_node_domain+0x17d/0x190
> [   34.645496]  down_timeout+0x42/0x50
> [   34.645947]  ufshcd_wl_suspend+0x79/0xa0
> [   34.646432]  ? scmd_printk+0x100/0x100
> [   34.646917]  scsi_bus_suspend_common+0x56/0xc0
> [   34.647405]  ? scsi_bus_freeze+0x10/0x10
> [   34.647858]  dpm_run_callback+0x45/0x110
> [   34.648347]  __device_suspend+0x117/0x460
> [   34.648788]  async_suspend+0x16/0x90
> [   34.649251]  async_run_entry_fn+0x26/0x110
> [   34.649676]  process_one_work+0x1cc/0x360
> [   34.650137]  worker_thread+0x45/0x3b0
> [   34.650563]  ? process_one_work+0x360/0x360
> [   34.650994]  kthread+0xf6/0x130
> [   34.651455]  ? kthread_park+0x80/0x80
> [   34.651882]  ret_from_fork+0x1f/0x30
> 
> 
> 
>>
>>>
>>> I'll address the other comments in the next version.
>>>
>>>
>>> Thank you!
>>>
>>>>> -    pm_runtime_put(hba->dev);
>>>>> +    ufshcd_rpm_put(hba);
>>>>>    }
>>>>
>>>> <SNIP>
>>>>
>>>>> +void ufshcd_resume_complete(struct device *dev)
>>>>> +{
>>>
>>
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
