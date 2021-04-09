Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D2E35A477
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 19:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbhDIRPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 13:15:55 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63399 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbhDIRPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 13:15:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617988541; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Q3jf/kUjs0jPspuB07nQ+W7pnLmva3qwq9uX7xtxT/c=; b=D804KUoMJJJ3Lfq97GEmFHWt4LDD5unj0v8ZvuPacXxTBzZ5rghl6LOxKKbV1xIXilbTg0dV
 VhViaEVe2bjwCA3QZzi2nPW6+AeMQt3wmL1dUQyNjloD819sr5+40g9vpbAwpNkHJmDDikby
 XRVu+nik6E4NgVBlDkqaXlOZerw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60708bb59a9ff96d9576630d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 17:15:33
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86A76C433CA; Fri,  9 Apr 2021 17:15:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CE24C433CA;
        Fri,  9 Apr 2021 17:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CE24C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v17 1/2] scsi: ufs: Enable power management for wlun
To:     Adrian Hunter <adrian.hunter@intel.com>, daejun7.park@samsung.com,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        ALIM AKHTAR <alim.akhtar@samsung.com>,
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
        Wei Yongjun <weiyongjun1@huawei.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Yue Hu <huyue2@yulong.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
References: <1b3d53dad245a7166f3f67a4c65f3a731e6600b3.1617893198.git.asutoshd@codeaurora.org>
 <cover.1617893198.git.asutoshd@codeaurora.org>
 <CGME20210408145007epcas2p1accfbd653b2e1318b2722c1f5661c1e0@epcms2p1>
 <1891546521.01617937981650.JavaMail.epsvc@epcpadp4>
 <32b2327f-a34f-03ac-a110-e683ae416fdc@intel.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <8e8bd375-ed27-d1aa-430d-4f1d3d00cb9a@codeaurora.org>
Date:   Fri, 9 Apr 2021 10:15:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32b2327f-a34f-03ac-a110-e683ae416fdc@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/9/2021 3:07 AM, Adrian Hunter wrote:
> On 9/04/21 5:27 am, Daejun Park wrote:
>> Hi Asutosh Das,
>>
>>> During runtime-suspend of ufs host, the scsi devices are
>>> already suspended and so are the queues associated with them.
>>> But the ufs host sends SSU (START_STOP_UNIT) to wlun
>>> during its runtime-suspend.
>>> During the process blk_queue_enter checks if the queue is not in
>>> suspended state. If so, it waits for the queue to resume, and never
>>> comes out of it.
>>> The commit
>>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>>> adds the check if the queue is in suspended state in blk_queue_enter().
>>>
>>> Call trace:
>>> __switch_to+0x174/0x2c4
>>> __schedule+0x478/0x764
>>> schedule+0x9c/0xe0
>>> blk_queue_enter+0x158/0x228
>>> blk_mq_alloc_request+0x40/0xa4
>>> blk_get_request+0x2c/0x70
>>> __scsi_execute+0x60/0x1c4
>>> ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>> ufshcd_suspend+0x208/0x83c
>>> ufshcd_runtime_suspend+0x40/0x154
>>> ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>> pm_generic_runtime_suspend+0x28/0x3c
>>> __rpm_callback+0x80/0x2a4
>>> rpm_suspend+0x308/0x614
>>> rpm_idle+0x158/0x228
>>> pm_runtime_work+0x84/0xac
>>> process_one_work+0x1f0/0x470
>>> worker_thread+0x26c/0x4c8
>>> kthread+0x13c/0x320
>>> ret_from_fork+0x10/0x18
>>>
>>> Fix this by registering ufs device wlun as a scsi driver and
>>> registering it for block runtime-pm. Also make this as a
>>> supplier for all other luns. That way, this device wlun
>>> suspends after all the consumers and resumes after
>>> hba resumes.
>>>
>>> Co-developed-by: Can Guo <cang@codeaurora.org>
>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>> ---
>>> drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
>>> drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
>>> drivers/scsi/ufs/ufs-debugfs.c     |   6 +-
>>> drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
>>> drivers/scsi/ufs/ufs-exynos.c      |   2 +
>>> drivers/scsi/ufs/ufs-hisi.c        |   2 +
>>> drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
>>> drivers/scsi/ufs/ufs-qcom.c        |   2 +
>>> drivers/scsi/ufs/ufs_bsg.c         |   6 +-
>>> drivers/scsi/ufs/ufshcd-pci.c      |  36 +--
>>> drivers/scsi/ufs/ufshcd.c          | 642 ++++++++++++++++++++++++++-----------
>>> drivers/scsi/ufs/ufshcd.h          |   6 +
>>> include/trace/events/ufs.h         |  20 ++
>>> 13 files changed, 509 insertions(+), 231 deletions(-)
>>
>> In this patch, you changed pm_runtime_{get, put}_sync to scsi_autopm_{get, put}_device.
>> But, scsi_autopm_get_device() calls pm_runtime_put_sync() in case of error
>> of pm_runtime_get_sync(). So, pm_runtime_put_sync() can be called twice if
>> scsi_autopm_get_device has error.
> 
> Also it might be tidy to make wrappers e.g.
> 
> static inline int ufshcd_rpm_get_sync(struct ufs_hba *hba)
> {
>      return pm_runtime_get_sync(&hba->sdev_ufs_device->sdev_gendev);
> }
>     
> static inline int ufshcd_rpm_put(struct ufs_hba *hba)
> {
>      return pm_runtime_put(&hba->sdev_ufs_device->sdev_gendev);
> }
> 
> static inline int ufshcd_rpm_put_sync(struct ufs_hba *hba)
> {
>      return pm_runtime_put_sync(&hba->sdev_ufs_device->sdev_gendev);
> }
> 
> And also consider matching: e.g.
> 
> 	pm_runtime_put(hba->dev)	to	ufshcd_rpm_put(hba)
> 	pm_runtime_put_sync(hba->dev)	to	ufshcd_rpm_put_sync(hba)
> 
> 
> 

Ok, I'll push the changes shortly.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
