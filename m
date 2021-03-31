Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71920350627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhCaSTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:19:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:26881 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234872AbhCaSTQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:19:16 -0400
IronPort-SDR: DU7cG7JjQfSkEo6QzxYPMMki9eO6hH25ogPfDxe4MFaHMc9g+5vtndHwRqXOpOUxl8bZthy2AL
 tQb3/ai/ZQrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="212309563"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="212309563"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 11:19:15 -0700
IronPort-SDR: vSE+UHfnln8DPEc+WfQ9eFpbV2ybYU/2+5zCjUOJey4fP6ozlko0sZMmWZW7Xv5ulWPSCl4r1l
 LHupYmGwxxyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="377379108"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga003.jf.intel.com with ESMTP; 31 Mar 2021 11:19:03 -0700
Subject: Re: [PATCH v14 1/2] scsi: ufs: Enable power management for wlun
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
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a385141d-324b-680e-a19c-ab6121bd6c5d@intel.com>
Date:   Wed, 31 Mar 2021 21:19:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16f1bcf76ff411c70fe0e3e13f84e4b0fa7d9063.1617143113.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/21 1:31 am, Asutosh Das wrote:
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

Looks good but still doesn't seem to based on the latest tree.

Also came across the issue below:

<SNIP>

> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_poweroff(struct device *dev)
> +{
> +	ufshcd_wl_shutdown(dev);

This turned out to be wrong.  This is a PM op and SCSI has already
quiesced the sdev's.  All that is needed is:

	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);

> +	return 0;
> +}
> +#endif
