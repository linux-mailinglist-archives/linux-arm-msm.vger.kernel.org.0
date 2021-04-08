Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7FB357F73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 11:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhDHJiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 05:38:00 -0400
Received: from mga03.intel.com ([134.134.136.65]:32279 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhDHJiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 05:38:00 -0400
IronPort-SDR: PHOHjWaTwQxnYoNMfngO473e1wU5NJYAOYjE9cxopWxg+Wbxjiv/be5oKrour3Vsnkg2eLG8S8
 w6lS3Z14qjNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193543909"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="193543909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 02:37:48 -0700
IronPort-SDR: BFpXzI0RXUfZATcKxM7hFx64JBR7Vk2GquUS4EhpRUOdB/vQoJXx3E7ConT8Lwt/z83n9oxCQn
 yC8CBijdMkrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="458753841"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga001.jf.intel.com with ESMTP; 08 Apr 2021 02:37:42 -0700
Subject: Re: [PATCH v16 1/2] scsi: ufs: Enable power management for wlun
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
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
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yue Hu <huyue2@yulong.com>,
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
References: <cover.1617818557.git.asutoshd@codeaurora.org>
 <7be92c0bc3e5f07d5e17bd3b78c01496686ef31e.1617818557.git.asutoshd@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <d30c2dc2-6334-1515-b548-a898939ec9ee@intel.com>
Date:   Thu, 8 Apr 2021 12:38:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7be92c0bc3e5f07d5e17bd3b78c01496686ef31e.1617818557.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/04/21 9:08 pm, Asutosh Das wrote:
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
> hba resumes.
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---

<SNIP>

> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_poweroff(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);

Should be:

	struct scsi_device *sdev = to_scsi_device(dev);
	struct ufs_hba *hba = shost_priv(sdev->host);

> +
> +	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
> +	return 0;
> +}
> +#endif
