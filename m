Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F2E359B41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 12:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbhDIKIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 06:08:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:37432 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231772AbhDIKHO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 06:07:14 -0400
IronPort-SDR: XKQmBepFoPcwpvuLMhnTJ+Tqc8Rlcg+FruzIMtKwTFCq/51CaQ/2VBSRT/8udronkXLn9tBZZe
 28qzDq5k9R2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193280158"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="193280158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 03:07:00 -0700
IronPort-SDR: fngypfKpYZec60v34J0j5vhTHsF3/7Uo7iJjIsS7rKNvfb6Yh+v5KoJuSeDTTX9l/o4zKDJ5RB
 +o9IG4AzjJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="459180029"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga001.jf.intel.com with ESMTP; 09 Apr 2021 03:06:54 -0700
Subject: Re: [PATCH v17 1/2] scsi: ufs: Enable power management for wlun
To:     daejun7.park@samsung.com,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
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
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <32b2327f-a34f-03ac-a110-e683ae416fdc@intel.com>
Date:   Fri, 9 Apr 2021 13:07:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1891546521.01617937981650.JavaMail.epsvc@epcpadp4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/04/21 5:27 am, Daejun Park wrote:
> Hi Asutosh Das,
> 
>> During runtime-suspend of ufs host, the scsi devices are
>> already suspended and so are the queues associated with them.
>> But the ufs host sends SSU (START_STOP_UNIT) to wlun
>> during its runtime-suspend.
>> During the process blk_queue_enter checks if the queue is not in
>> suspended state. If so, it waits for the queue to resume, and never
>> comes out of it.
>> The commit
>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>> adds the check if the queue is in suspended state in blk_queue_enter().
>>
>> Call trace:
>> __switch_to+0x174/0x2c4
>> __schedule+0x478/0x764
>> schedule+0x9c/0xe0
>> blk_queue_enter+0x158/0x228
>> blk_mq_alloc_request+0x40/0xa4
>> blk_get_request+0x2c/0x70
>> __scsi_execute+0x60/0x1c4
>> ufshcd_set_dev_pwr_mode+0x124/0x1e4
>> ufshcd_suspend+0x208/0x83c
>> ufshcd_runtime_suspend+0x40/0x154
>> ufshcd_pltfrm_runtime_suspend+0x14/0x20
>> pm_generic_runtime_suspend+0x28/0x3c
>> __rpm_callback+0x80/0x2a4
>> rpm_suspend+0x308/0x614
>> rpm_idle+0x158/0x228
>> pm_runtime_work+0x84/0xac
>> process_one_work+0x1f0/0x470
>> worker_thread+0x26c/0x4c8
>> kthread+0x13c/0x320
>> ret_from_fork+0x10/0x18
>>
>> Fix this by registering ufs device wlun as a scsi driver and
>> registering it for block runtime-pm. Also make this as a
>> supplier for all other luns. That way, this device wlun
>> suspends after all the consumers and resumes after
>> hba resumes.
>>
>> Co-developed-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
>> drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
>> drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
>> drivers/scsi/ufs/ufs-debugfs.c     |   6 +-
>> drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
>> drivers/scsi/ufs/ufs-exynos.c      |   2 +
>> drivers/scsi/ufs/ufs-hisi.c        |   2 +
>> drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
>> drivers/scsi/ufs/ufs-qcom.c        |   2 +
>> drivers/scsi/ufs/ufs_bsg.c         |   6 +-
>> drivers/scsi/ufs/ufshcd-pci.c      |  36 +--
>> drivers/scsi/ufs/ufshcd.c          | 642 ++++++++++++++++++++++++++-----------
>> drivers/scsi/ufs/ufshcd.h          |   6 +
>> include/trace/events/ufs.h         |  20 ++
>> 13 files changed, 509 insertions(+), 231 deletions(-)
> 
> In this patch, you changed pm_runtime_{get, put}_sync to scsi_autopm_{get, put}_device.
> But, scsi_autopm_get_device() calls pm_runtime_put_sync() in case of error
> of pm_runtime_get_sync(). So, pm_runtime_put_sync() can be called twice if
> scsi_autopm_get_device has error.

Also it might be tidy to make wrappers e.g.

static inline int ufshcd_rpm_get_sync(struct ufs_hba *hba)
{
    return pm_runtime_get_sync(&hba->sdev_ufs_device->sdev_gendev);
}
   
static inline int ufshcd_rpm_put(struct ufs_hba *hba)
{
    return pm_runtime_put(&hba->sdev_ufs_device->sdev_gendev);
}

static inline int ufshcd_rpm_put_sync(struct ufs_hba *hba)
{
    return pm_runtime_put_sync(&hba->sdev_ufs_device->sdev_gendev);
} 

And also consider matching: e.g.

	pm_runtime_put(hba->dev)	to	ufshcd_rpm_put(hba)
	pm_runtime_put_sync(hba->dev)	to	ufshcd_rpm_put_sync(hba)



