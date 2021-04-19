Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD483649E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 20:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238150AbhDSShu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 14:37:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:8975 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233002AbhDSSht (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 14:37:49 -0400
IronPort-SDR: 4W4bPLyASgMg3ho1a6daVwzrhtAe7RcSbWsHn/KGiKfyO81M2EQ6ifOhDlMWGG1yfvfq86qC0I
 GqbO8QCIR6qg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="280702532"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
   d="scan'208";a="280702532"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 11:37:18 -0700
IronPort-SDR: mVnC+7o/ux30dgipxuCPMQsRxirpqDL70m7B/udEKgj4RQEgeyqfuV8cNyuXo9lVBQPOv0TWk1
 HU6sC2AH2gvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
   d="scan'208";a="420108005"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 11:37:12 -0700
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
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
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
Date:   Mon, 19 Apr 2021 21:37:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/21 10:49 pm, Asutosh Das wrote:
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
> ---

I came across 3 issues while testing.  See comments below.

<SNIP>

> @@ -5753,12 +5797,13 @@ static void ufshcd_clk_scaling_suspend(struct ufs_hba *hba, bool suspend)
>  
>  static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>  {
> -	pm_runtime_get_sync(hba->dev);
> -	if (pm_runtime_status_suspended(hba->dev) || hba->is_sys_suspended) {
> +	ufshcd_rpm_get_sync(hba);

hba->sdev_ufs_device could be NULL.
Need to add a check for that in ufshcd_err_handling_should_stop()

> +	if (pm_runtime_status_suspended(&hba->sdev_ufs_device->sdev_gendev) ||
> +	    hba->is_sys_suspended) {
>  		enum ufs_pm_op pm_op;
>  
>  		/*
> -		 * Don't assume anything of pm_runtime_get_sync(), if
> +		 * Don't assume anything of resume, if
>  		 * resume fails, irq and clocks can be OFF, and powers
>  		 * can be OFF or in LPM.
>  		 */
> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>  	if (ufshcd_is_clkscaling_supported(hba))
>  		ufshcd_clk_scaling_suspend(hba, false);
>  	ufshcd_clear_ua_wluns(hba);

ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
if sdev_rpmb is suspended and sdev_ufs_device is suspending.
e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
is running, at which point sdev_rpmb has already suspended.

> -	pm_runtime_put(hba->dev);
> +	ufshcd_rpm_put(hba);
>  }

<SNIP>

> +void ufshcd_resume_complete(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +
> +	ufshcd_rpm_put(hba);
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_resume_complete);
> +
> +int ufshcd_suspend_prepare(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +	struct device *ufs_dev = &hba->sdev_ufs_device->sdev_gendev;
> +	enum ufs_dev_pwr_mode spm_pwr_mode;
> +	enum uic_link_state spm_link_state;
> +	unsigned long flags;
> +	bool rpm_state_ok;
> +
> +	/*
> +	 * SCSI assumes that runtime-pm and system-pm for scsi drivers
> +	 * are same. And it doesn't wake up the device for system-suspend
> +	 * if it's runtime suspended. But ufs doesn't follow that.
> +	 * The rpm-lvl and spm-lvl can be different in ufs.
> +	 * However, if the current_{pwr_mode, link_state} is same as the
> +	 * desired_{pwr_mode, link_state}, there's no need to rpm resume
> +	 * the device.
> +	 * Refer ufshcd_resume_complete()
> +	 */
> +	pm_runtime_get_noresume(ufs_dev);
> +
> +	spin_lock_irqsave(&ufs_dev->power.lock, flags);
> +
> +	spm_pwr_mode = ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl);
> +	spm_link_state = ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl);
> +
> +	rpm_state_ok = pm_runtime_suspended(ufs_dev) &&
> +		hba->curr_dev_pwr_mode == spm_pwr_mode &&
> +		hba->uic_link_state == spm_link_state &&
> +		!hba->dev_info.b_rpm_dev_flush_capable;
> +
> +	spin_unlock_irqrestore(&ufs_dev->power.lock, flags);
> +
> +	if (!rpm_state_ok) {
> +		int ret = pm_runtime_resume(ufs_dev);
> +
> +		if (ret < 0 && ret != -EACCES) {
> +			pm_runtime_put(ufs_dev);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}

Unfortunately this does not work because SCSI PM forcibly sets
the sdevs to runtime active after system resume.  Really we should
change SCSI PM to call the driver's .prepare / .complete then we could
use direct complete, but let's leave that for now and go back to
before, but allowing for errors and !hba->sdev_ufs_device. e.g.

void ufshcd_resume_complete(struct device *dev)
{
	struct ufs_hba *hba = dev_get_drvdata(dev);

	if (hba->complete_put) {
		hba->complete_put = false;
		ufshcd_rpm_put(hba);
	}
}
EXPORT_SYMBOL_GPL(ufshcd_resume_complete);

int ufshcd_suspend_prepare(struct device *dev)
{
	struct ufs_hba *hba = dev_get_drvdata(dev);
	int ret;

	if (!hba->sdev_ufs_device)
		return 0;

	ret = ufshcd_rpm_get_sync(hba);
	if (ret < 0 && ret != -EACCES) {
		ufshcd_rpm_put(hba);
		return ret;
	}
	hba->complete_put = true;
	return 0;
}
EXPORT_SYMBOL_GPL(ufshcd_suspend_prepare);

