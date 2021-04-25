Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD8F36A717
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Apr 2021 14:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhDYMU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Apr 2021 08:20:57 -0400
Received: from mga06.intel.com ([134.134.136.31]:63546 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhDYMU5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Apr 2021 08:20:57 -0400
IronPort-SDR: hXMMJBpyXQYbj/nwX+ke0zvw8TQmmHfjvc2iHvABgg/+6NJTt8CDJPHxh1qbMWufkDJpXE7z/Y
 QgMYZ5VcQduA==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="257536042"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257536042"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 05:20:15 -0700
IronPort-SDR: GxK5WXx/z622EJjt1X62nNHOczMp0htXHT9ESudgp9qLN//i2ptdHbhzT+AjYbgA8YexELGMTf
 p+sz0c6acvZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="422296359"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2021 05:20:06 -0700
Subject: Re: [PATCH v21 1/2] scsi: ufs: Enable power management for wlun
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
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
References: <cover.1619223249.git.asutoshd@codeaurora.org>
 <4662c462e79e3e7f541f54f88f8993f421026d83.1619223249.git.asutoshd@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9e0655c3-42cf-d090-8aa5-2cb644b2e93c@intel.com>
Date:   Sun, 25 Apr 2021 15:20:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4662c462e79e3e7f541f54f88f8993f421026d83.1619223249.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/04/21 3:20 am, Asutosh Das wrote:
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU (START_STOP_UNIT) to wlun
> during its runtime-suspend.
> During the process blk_queue_enter checks if the queue is not in
> suspended state. If so, it waits for the queue to resume, and never
> comes out of it.
> The commit
> (d55d15a33: scsi: block: Do not accept any requests while suspended)
> adds the check if the queue is in suspended state in blk_queue_enter().
> 
> Call trace:
>  __switch_to+0x174/0x2c4
>  __schedule+0x478/0x764
>  schedule+0x9c/0xe0
>  blk_queue_enter+0x158/0x228
>  blk_mq_alloc_request+0x40/0xa4
>  blk_get_request+0x2c/0x70
>  __scsi_execute+0x60/0x1c4
>  ufshcd_set_dev_pwr_mode+0x124/0x1e4
>  ufshcd_suspend+0x208/0x83c
>  ufshcd_runtime_suspend+0x40/0x154
>  ufshcd_pltfrm_runtime_suspend+0x14/0x20
>  pm_generic_runtime_suspend+0x28/0x3c
>  __rpm_callback+0x80/0x2a4
>  rpm_suspend+0x308/0x614
>  rpm_idle+0x158/0x228
>  pm_runtime_work+0x84/0xac
>  process_one_work+0x1f0/0x470
>  worker_thread+0x26c/0x4c8
>  kthread+0x13c/0x320
>  ret_from_fork+0x10/0x18
> 
> Fix this by registering ufs device wlun as a scsi driver and
> registering it for block runtime-pm. Also make this as a
> supplier for all other luns. That way, this device wlun
> suspends after all the consumers and resumes after
> hba resumes. This also registers a new scsi driver for rpmb wlun.
> This new driver is mostly used to clear rpmb uac.
> 
> Fixed smatch warnings:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

Note we don't use regulators, clocks, clock scaling or gating.
Although those things do look OK.
Notwithstanding that:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
