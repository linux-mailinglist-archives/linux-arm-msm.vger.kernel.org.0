Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CB935104D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 09:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhDAHpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 03:45:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:2550 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhDAHpK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 03:45:10 -0400
IronPort-SDR: AozoHmkV2Kuj+SszmoaH6YXXMfIzJA/FuY+l0a7przeTicEXJZvrqRkd8WN52X6FhSm4Ms9Ir5
 nBKnyh3W3xqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="256160553"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="256160553"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 00:45:07 -0700
IronPort-SDR: lsbWgO8aRTgEJJiGUMpmyaRbtmcauxhMmNapB9ei3jfvohdyrNPtGYFBZQe67fxtzdYtxYWhU7
 9g+tDZ9olIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="377598402"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga003.jf.intel.com with ESMTP; 01 Apr 2021 00:45:00 -0700
Subject: Re: [PATCH v14 1/2] scsi: ufs: Enable power management for wlun
To:     "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
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
        Yue Hu <huyue2@yulong.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
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
References: <cover.1617143113.git.asutoshd@codeaurora.org>
 <16f1bcf76ff411c70fe0e3e13f84e4b0fa7d9063.1617143113.git.asutoshd@codeaurora.org>
 <a385141d-324b-680e-a19c-ab6121bd6c5d@intel.com>
 <dbac8ce8-83c6-49a5-9f4d-f5ea19d7a883@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <612d0f35-89a2-947b-9fa4-608624c4c032@intel.com>
Date:   Thu, 1 Apr 2021 10:45:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dbac8ce8-83c6-49a5-9f4d-f5ea19d7a883@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/04/21 4:40 am, Asutosh Das (asd) wrote:
> On 3/31/2021 11:19 AM, Adrian Hunter wrote:
>> On 31/03/21 1:31 am, Asutosh Das wrote:
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
>>>   __switch_to+0x174/0x2c4
>>>   __schedule+0x478/0x764
>>>   schedule+0x9c/0xe0
>>>   blk_queue_enter+0x158/0x228
>>>   blk_mq_alloc_request+0x40/0xa4
>>>   blk_get_request+0x2c/0x70
>>>   __scsi_execute+0x60/0x1c4
>>>   ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>>   ufshcd_suspend+0x208/0x83c
>>>   ufshcd_runtime_suspend+0x40/0x154
>>>   ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>>   pm_generic_runtime_suspend+0x28/0x3c
>>>   __rpm_callback+0x80/0x2a4
>>>   rpm_suspend+0x308/0x614
>>>   rpm_idle+0x158/0x228
>>>   pm_runtime_work+0x84/0xac
>>>   process_one_work+0x1f0/0x470
>>>   worker_thread+0x26c/0x4c8
>>>   kthread+0x13c/0x320
>>>   ret_from_fork+0x10/0x18
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
>>
> Hi Adrian
> Thanks for the comments.
>> Looks good but still doesn't seem to based on the latest tree.
>>
> Umm, it's based on the below:
> git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
> Branch: refs/heads/for-next
> 
> The top most change is e27f3c8 on 27th March'21.
> Which tree are you referring to that'd be latest?

Dunno, but that seems to be missing:

  commit aa53f580e67b49ec5f4d9bd1de81eb9eb0dc079f
  Author: Can Guo <cang@codeaurora.org>
  Date:   Tue Feb 23 21:36:47 2021 -0800

    scsi: ufs: Minor adjustments to error handling

which is in v5.12-rc3

> 
>> Also came across the issue below:
>>
>> <SNIP>
>>
>>> +#ifdef CONFIG_PM_SLEEP
>>> +static int ufshcd_wl_poweroff(struct device *dev)
>>> +{
>>> +    ufshcd_wl_shutdown(dev);
>>
>> This turned out to be wrong.  This is a PM op and SCSI has already
>> quiesced the sdev's.  All that is needed isOk. I'll fix it in the next version.
> 
>>
>>     __ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
>>
>>> +    return 0;
>>> +}
>>> +#endif
> 
> 

