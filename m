Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A928361DC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 12:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240097AbhDPKIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 06:08:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:59087 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235180AbhDPKIu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 06:08:50 -0400
IronPort-SDR: e8jSt6xVZKGURDaabAEKpwTgs8nyvgKDh9VpH56q0MCSx5jGNzGEZmyQQKw4WPdQISi83GwHBq
 HHKy2DkF2nNg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174513459"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="174513459"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 03:08:22 -0700
IronPort-SDR: 2NHE6dFPoJopDNLgjraxVzoPpmdNQMZLwLirE3tGsqdB6ozwshofsDuNR9CgQon8++q2DhWaeH
 lut7yczl1yzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="461924450"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2021 03:08:15 -0700
Subject: Re: [PATCH v19 1/2] scsi: ufs: Enable power management for wlun
From:   Adrian Hunter <adrian.hunter@intel.com>
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
        Yue Hu <huyue2@yulong.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
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
References: <cover.1618529652.git.asutoshd@codeaurora.org>
 <48ab92db5b0d3c11b8357f0faa99a4473465099d.1618529652.git.asutoshd@codeaurora.org>
 <d28cb2d4-8f24-c2c4-e87e-bb51ac73af6e@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9ea33def-e2c0-7899-5d47-f9ade59a0dcd@intel.com>
Date:   Fri, 16 Apr 2021 13:08:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d28cb2d4-8f24-c2c4-e87e-bb51ac73af6e@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/21 12:22 pm, Adrian Hunter wrote:
> On 16/04/21 2:36 am, Asutosh Das wrote:
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
>>  __switch_to+0x174/0x2c4
>>  __schedule+0x478/0x764
>>  schedule+0x9c/0xe0
>>  blk_queue_enter+0x158/0x228
>>  blk_mq_alloc_request+0x40/0xa4
>>  blk_get_request+0x2c/0x70
>>  __scsi_execute+0x60/0x1c4
>>  ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>  ufshcd_suspend+0x208/0x83c
>>  ufshcd_runtime_suspend+0x40/0x154
>>  ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>  pm_generic_runtime_suspend+0x28/0x3c
>>  __rpm_callback+0x80/0x2a4
>>  rpm_suspend+0x308/0x614
>>  rpm_idle+0x158/0x228
>>  pm_runtime_work+0x84/0xac
>>  process_one_work+0x1f0/0x470
>>  worker_thread+0x26c/0x4c8
>>  kthread+0x13c/0x320
>>  ret_from_fork+0x10/0x18
>>
>> Fix this by registering ufs device wlun as a scsi driver and
>> registering it for block runtime-pm. Also make this as a
>> supplier for all other luns. That way, this device wlun
>> suspends after all the consumers and resumes after
>> hba resumes.
>> This also registers a new scsi driver for rpmb wlun.
>> This new driver is mostly used to clear rpmb uac.
>> With this design, the driver would always be runtime resumed
>> before system suspend.
> 
> I thought some more about that and I think we can still support
> allowing runtime suspend to work with system suspend, without
> too much difficulty. See ufshcd_suspend_prepare() below.
> 
>>
>> Fixed smatch warnings:
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> Co-developed-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
> 
> <SNIP>
> 
>> -static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>> +static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  {
>>  	int ret;
>> -	enum uic_link_state old_link_state;
>> +	enum uic_link_state old_link_state = hba->uic_link_state;
>>  
>> -	hba->pm_op_in_progress = 1;
>> -	old_link_state = hba->uic_link_state;
>> -
>> -	ufshcd_hba_vreg_set_hpm(hba);
>> -	ret = ufshcd_vreg_set_hpm(hba);
>> -	if (ret)
>> -		goto out;
>> -
>> -	/* Make sure clocks are enabled before accessing controller */
>> -	ret = ufshcd_setup_clocks(hba, true);
>> -	if (ret)
>> -		goto disable_vreg;
>> -
>> -	/* enable the host irq as host controller would be active soon */
>> -	ufshcd_enable_irq(hba);
>> +	hba->pm_op_in_progress = true;
>>  
>>  	/*
>>  	 * Call vendor specific resume callback. As these callbacks may access
>> @@ -8868,7 +8858,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  	 */
>>  	ret = ufshcd_vops_resume(hba, pm_op);
>>  	if (ret)
>> -		goto disable_irq_and_vops_clks;
>> +		goto out;
>>  
>>  	/* For DeepSleep, the only supported option is to have the link off */
>>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
>> @@ -8916,42 +8906,219 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  	if (hba->ee_usr_mask)
>>  		ufshcd_write_ee_control(hba);
>>  
>> -	hba->clk_gating.is_suspended = false;
>> -
>>  	if (ufshcd_is_clkscaling_supported(hba))
>> -		ufshcd_clk_scaling_suspend(hba, false);
>> -
>> -	/* Enable Auto-Hibernate if configured */
>> -	ufshcd_auto_hibern8_enable(hba);
>> +		ufshcd_resume_clkscaling(hba);
> 
> This still doesn't look right. ufshcd_resume_clkscaling()
> doesn't update hba->clk_scaling.is_allowed whereas
> ufshcd_clk_scaling_suspend() does.
> 
>>  
>>  	if (hba->dev_info.b_rpm_dev_flush_capable) {
>>  		hba->dev_info.b_rpm_dev_flush_capable = false;
>>  		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
>>  	}
>>  
>> -	ufshcd_clear_ua_wluns(hba);
>> -
>> -	/* Schedule clock gating in case of no access to UFS device yet */
>> -	ufshcd_release(hba);
>> -
>> +	/* Enable Auto-Hibernate if configured */
>> +	ufshcd_auto_hibern8_enable(hba);
>>  	goto out;
>>  
>>  set_old_link_state:
>>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>>  vendor_suspend:
>>  	ufshcd_vops_suspend(hba, pm_op);
>> -disable_irq_and_vops_clks:
>> +out:
>> +	if (ret)
>> +		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
>> +	hba->clk_gating.is_suspended = false;
>> +	ufshcd_release(hba);
>> +	hba->pm_op_in_progress = false;
>> +	return ret;
>> +}
> 
> <SNIP>
> 
>> +void ufshcd_resume_complete(struct device *dev)
>> +{
>> +	struct ufs_hba *hba = dev_get_drvdata(dev);
>> +
>> +	ufshcd_rpm_put(hba);
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_resume_complete);
>> +
>> +int ufshcd_suspend_prepare(struct device *dev)
>> +{
>> +	struct ufs_hba *hba = dev_get_drvdata(dev);
>> +
>> +	/*
>> +	 * SCSI assumes that runtime-pm and system-pm for scsi drivers
>> +	 * are same. And it doesn't wake up the device for system-suspend
>> +	 * if it's runtime suspended. But ufs doesn't follow that.
>> +	 * The rpm-lvl and spm-lvl can be different in ufs.
>> +	 * Force it to honor system-suspend.
>> +	 * Refer ufshcd_resume_complete()
>> +	 */
>> +	ufshcd_rpm_get_sync(hba);
>> +
>> +	return 0;
>> +}
> 
> I think we can support allowing runtime suspend to work with
> system suspend.  ufshcd_resume_complete() remains the same,
> and ufshcd_suspend_prepare() is like this:
> 
> 
> /*
>  * SCSI assumes that runtime-pm and system-pm for scsi drivers are same, and it
>  * doesn't wake up the device for system-suspend if it's runtime suspended.
>  * However UFS doesn't follow that. The rpm-lvl and spm-lvl can be different in
>  * UFS, so special care is needed.
>  * Refer also ufshcd_resume_complete()
>  */
> int ufshcd_suspend_prepare(struct device *dev)
> {
> 	struct ufs_hba *hba = dev_get_drvdata(dev);
> 	struct device *ufs_dev = &hba->sdev_ufs_device->sdev_gendev;
> 	enum ufs_dev_pwr_mode spm_pwr_mode;
> 	enum uic_link_state spm_link_state;
> 	unsigned long flags;
> 	bool rpm_state_ok;
> 
> 	/*
> 	 * First prevent runtime suspend. Note this does not prevent runtime
> 	 * resume e.g. pm_runtime_get_sync() will still do the right thing.
> 	 */
> 	pm_runtime_get_noresume(ufs_dev);
> 
> 	/* Now check if the rpm state is ok to use for spm */
> 	spin_lock_irqsave(&ufs_dev->power.lock, flags);
> 
> 	spm_pwr_mode = ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl);
> 	spm_link_state = ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl);
> 
> 	rpm_state_ok = pm_runtime_suspended(ufs_dev) &&
> 		       hba->curr_dev_pwr_mode == spm_pwr_mode &&
> 		       hba->uic_link_state == spm_link_state &&
> 		       !hba->dev_info.b_rpm_dev_flush_capable;
> 
> 	spin_unlock_irqrestore(&ufs_dev->power.lock, flags);
> 
> 	/* If is isn't, do a runtime resume */
> 	if (!rpm_state_ok)
> 		pm_runtime_resume(ufs_dev);

But we should return an error if runtime resume
fails.

 	if (!rpm_state_ok) {
 		int ret = pm_runtime_resume(ufs_dev);

		if (ret < 0 && ret != EACCES) {
			pm_runtime_put(ufs_dev);
			return ret;
		}
	}

> 
> 	return 0;
> }
> 

