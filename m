Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D1F34E507
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 12:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhC3KER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 06:04:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:25493 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhC3KDq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 06:03:46 -0400
IronPort-SDR: X1mfIWLsFfd8PDrLdnnONMlcngMjraaTjgynljw0noymckshw5YdmXU84V3oqTudHKa+G8MFaV
 dxO9T6He4MsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="171139120"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="171139120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 03:03:45 -0700
IronPort-SDR: rS6Lu8GjxT8eBdJKhpLNkuVV4oDDAU7cT1YBgIyBQu+vO3xpim5YNz8XEE40OBraHALDug9Sld
 tkwkyh8X+S5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="378441571"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2021 03:03:35 -0700
Subject: Re: [PATCH v13 1/2] scsi: ufs: Enable power management for wlun
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
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Colin Ian King <colin.king@canonical.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
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
References: <cover.1616633712.git.asutoshd@codeaurora.org>
 <72b45bb0a8e14662d20e739fa0c1df7cb0fcbb5d.1616633712.git.asutoshd@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <44f9b622-36a3-50aa-1535-4e027bb3d4f4@intel.com>
Date:   Tue, 30 Mar 2021 13:03:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <72b45bb0a8e14662d20e739fa0c1df7cb0fcbb5d.1616633712.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/03/21 3:39 am, Asutosh Das wrote:
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

A few comments below, but also:
	- re-base
	- change ufs_debugfs_get/put_user_access() to use
	scsi_autopm_get/put_device(hba->sdev_ufs_device);

> ---
>  drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
>  drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
>  drivers/scsi/ufs/ufs-debugfs.c     |   2 +-
>  drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
>  drivers/scsi/ufs/ufs-exynos.c      |   2 +
>  drivers/scsi/ufs/ufs-hisi.c        |   2 +
>  drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
>  drivers/scsi/ufs/ufs-qcom.c        |   2 +
>  drivers/scsi/ufs/ufs_bsg.c         |   6 +-
>  drivers/scsi/ufs/ufshcd-pci.c      |  36 +--
>  drivers/scsi/ufs/ufshcd.c          | 627 ++++++++++++++++++++++++++-----------
>  drivers/scsi/ufs/ufshcd.h          |   6 +
>  include/trace/events/ufs.h         |  20 ++
>  13 files changed, 496 insertions(+), 225 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/cdns-pltfrm.c b/drivers/scsi/ufs/cdns-pltfrm.c
> index 149391f..3e70c23 100644
> --- a/drivers/scsi/ufs/cdns-pltfrm.c
> +++ b/drivers/scsi/ufs/cdns-pltfrm.c
> @@ -319,6 +319,8 @@ static const struct dev_pm_ops cdns_ufs_dev_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver cdns_ufs_pltfrm_driver = {
> diff --git a/drivers/scsi/ufs/tc-dwc-g210-pci.c b/drivers/scsi/ufs/tc-dwc-g210-pci.c
> index 67a6a61..b01db12 100644
> --- a/drivers/scsi/ufs/tc-dwc-g210-pci.c
> +++ b/drivers/scsi/ufs/tc-dwc-g210-pci.c
> @@ -148,6 +148,8 @@ static const struct dev_pm_ops tc_dwc_g210_pci_pm_ops = {
>  	.runtime_suspend = tc_dwc_g210_pci_runtime_suspend,
>  	.runtime_resume  = tc_dwc_g210_pci_runtime_resume,
>  	.runtime_idle    = tc_dwc_g210_pci_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static const struct pci_device_id tc_dwc_g210_pci_tbl[] = {
> diff --git a/drivers/scsi/ufs/ufs-debugfs.c b/drivers/scsi/ufs/ufs-debugfs.c
> index dee98dc..06457d5 100644
> --- a/drivers/scsi/ufs/ufs-debugfs.c
> +++ b/drivers/scsi/ufs/ufs-debugfs.c
> @@ -13,7 +13,7 @@ void __init ufs_debugfs_init(void)
>  	ufs_debugfs_root = debugfs_create_dir("ufshcd", NULL);
>  }
>  
> -void __exit ufs_debugfs_exit(void)
> +void ufs_debugfs_exit(void)
>  {
>  	debugfs_remove_recursive(ufs_debugfs_root);
>  }
> diff --git a/drivers/scsi/ufs/ufs-debugfs.h b/drivers/scsi/ufs/ufs-debugfs.h
> index f35b39c..12c2730 100644
> --- a/drivers/scsi/ufs/ufs-debugfs.h
> +++ b/drivers/scsi/ufs/ufs-debugfs.h
> @@ -9,7 +9,7 @@ struct ufs_hba;
>  
>  #ifdef CONFIG_DEBUG_FS
>  void __init ufs_debugfs_init(void);
> -void __exit ufs_debugfs_exit(void);
> +void ufs_debugfs_exit(void);
>  void ufs_debugfs_hba_init(struct ufs_hba *hba);
>  void ufs_debugfs_hba_exit(struct ufs_hba *hba);
>  #else
> diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
> index 267943a1..45c0b02 100644
> --- a/drivers/scsi/ufs/ufs-exynos.c
> +++ b/drivers/scsi/ufs/ufs-exynos.c
> @@ -1268,6 +1268,8 @@ static const struct dev_pm_ops exynos_ufs_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver exynos_ufs_pltform = {
> diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
> index 0aa5813..d463b44 100644
> --- a/drivers/scsi/ufs/ufs-hisi.c
> +++ b/drivers/scsi/ufs/ufs-hisi.c
> @@ -574,6 +574,8 @@ static const struct dev_pm_ops ufs_hisi_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver ufs_hisi_pltform = {
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index c55202b..51c82e3 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -810,12 +810,10 @@ static int ufs_mtk_post_link(struct ufs_hba *hba)
>  	/* enable unipro clock gating feature */
>  	ufs_mtk_cfg_unipro_cg(hba, true);
>  
> -	/* configure auto-hibern8 timer to 10ms */
> -	if (ufshcd_is_auto_hibern8_supported(hba)) {
> -		ufshcd_auto_hibern8_update(hba,
> -			FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, 10) |
> -			FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, 3));
> -	}
> +	/* will be configured during probe hba */
> +	if (ufshcd_is_auto_hibern8_supported(hba))
> +		hba->ahit = FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, 10) |
> +			FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, 3);
>  
>  	ufs_mtk_setup_clk_gating(hba);
>  
> @@ -1097,6 +1095,8 @@ static const struct dev_pm_ops ufs_mtk_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver ufs_mtk_pltform = {
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index f97d7b0..9aa098a 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1546,6 +1546,8 @@ static const struct dev_pm_ops ufs_qcom_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver ufs_qcom_pltform = {
> diff --git a/drivers/scsi/ufs/ufs_bsg.c b/drivers/scsi/ufs/ufs_bsg.c
> index 5b2bc1a..cbb5a90 100644
> --- a/drivers/scsi/ufs/ufs_bsg.c
> +++ b/drivers/scsi/ufs/ufs_bsg.c
> @@ -97,7 +97,7 @@ static int ufs_bsg_request(struct bsg_job *job)
>  
>  	bsg_reply->reply_payload_rcv_len = 0;
>  
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
>  
>  	msgcode = bsg_request->msgcode;
>  	switch (msgcode) {
> @@ -106,7 +106,7 @@ static int ufs_bsg_request(struct bsg_job *job)
>  		ret = ufs_bsg_alloc_desc_buffer(hba, job, &desc_buff,
>  						&desc_len, desc_op);
>  		if (ret) {
> -			pm_runtime_put_sync(hba->dev);
> +			scsi_autopm_put_device(hba->sdev_ufs_device);
>  			goto out;
>  		}
>  
> @@ -138,7 +138,7 @@ static int ufs_bsg_request(struct bsg_job *job)
>  		break;
>  	}
>  
> -	pm_runtime_put_sync(hba->dev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
>  
>  	if (!desc_buff)
>  		goto out;
> diff --git a/drivers/scsi/ufs/ufshcd-pci.c b/drivers/scsi/ufs/ufshcd-pci.c
> index fadd566..5d4ffd2 100644
> --- a/drivers/scsi/ufs/ufshcd-pci.c
> +++ b/drivers/scsi/ufs/ufshcd-pci.c
> @@ -247,29 +247,6 @@ static int ufshcd_pci_resume(struct device *dev)
>  	return ufshcd_system_resume(dev_get_drvdata(dev));
>  }
>  
> -/**
> - * ufshcd_pci_poweroff - suspend-to-disk poweroff function
> - * @dev: pointer to PCI device handle
> - *
> - * Returns 0 if successful
> - * Returns non-zero otherwise
> - */
> -static int ufshcd_pci_poweroff(struct device *dev)
> -{
> -	struct ufs_hba *hba = dev_get_drvdata(dev);
> -	int spm_lvl = hba->spm_lvl;
> -	int ret;
> -
> -	/*
> -	 * For poweroff we need to set the UFS device to PowerDown mode.
> -	 * Force spm_lvl to ensure that.
> -	 */
> -	hba->spm_lvl = 5;
> -	ret = ufshcd_system_suspend(hba);
> -	hba->spm_lvl = spm_lvl;
> -	return ret;
> -}
> -
>  #endif /* !CONFIG_PM_SLEEP */
>  
>  #ifdef CONFIG_PM
> @@ -365,17 +342,14 @@ ufshcd_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  }
>  
>  static const struct dev_pm_ops ufshcd_pci_pm_ops = {
> -#ifdef CONFIG_PM_SLEEP
> -	.suspend	= ufshcd_pci_suspend,
> -	.resume		= ufshcd_pci_resume,
> -	.freeze		= ufshcd_pci_suspend,
> -	.thaw		= ufshcd_pci_resume,
> -	.poweroff	= ufshcd_pci_poweroff,
> -	.restore	= ufshcd_pci_resume,
> -#endif
>  	SET_RUNTIME_PM_OPS(ufshcd_pci_runtime_suspend,
>  			   ufshcd_pci_runtime_resume,
>  			   ufshcd_pci_runtime_idle)
> +	SET_SYSTEM_SLEEP_PM_OPS(ufshcd_pci_suspend, ufshcd_pci_resume)
> +#ifdef CONFIG_PM_SLEEP
> +	.prepare	= ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
> +#endif
>  };
>  
>  static const struct pci_device_id ufshcd_pci_tbl[] = {
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 45624c7..8f8a013 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -16,6 +16,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/blk-pm.h>
>  #include <linux/blkdev.h>
> +#include <scsi/scsi_driver.h>
>  #include "ufshcd.h"
>  #include "ufs_quirks.h"
>  #include "unipro.h"
> @@ -78,6 +79,8 @@
>  /* Polling time to wait for fDeviceInit */
>  #define FDEVICEINIT_COMPL_TIMEOUT 1500 /* millisecs */
>  
> +#define wlun_dev_to_hba(dv) shost_priv(to_scsi_device(dv)->host)
> +
>  #define ufshcd_toggle_vreg(_dev, _vreg, _on)				\
>  	({                                                              \
>  		int _ret;                                               \
> @@ -1556,7 +1559,7 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
>  	if (value == hba->clk_scaling.is_enabled)
>  		goto out;
>  
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
>  	ufshcd_hold(hba, false);
>  
>  	hba->clk_scaling.is_enabled = value;
> @@ -1572,7 +1575,7 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
>  	}
>  
>  	ufshcd_release(hba);
> -	pm_runtime_put_sync(hba->dev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
>  out:
>  	up(&hba->host_sem);
>  	return err ? err : count;
> @@ -2572,6 +2575,17 @@ static inline u16 ufshcd_upiu_wlun_to_scsi_wlun(u8 upiu_wlun_id)
>  	return (upiu_wlun_id & ~UFS_UPIU_WLUN_ID) | SCSI_W_LUN_BASE;
>  }
>  
> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
> +}
> +
> +static inline bool is_device_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun ==
> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
> +}
> +
>  static void ufshcd_init_lrb(struct ufs_hba *hba, struct ufshcd_lrb *lrb, int i)
>  {
>  	struct utp_transfer_cmd_desc *cmd_descp = hba->ucdl_base_addr;
> @@ -4106,11 +4120,11 @@ void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
>  	spin_unlock_irqrestore(hba->host->host_lock, flags);
>  
>  	if (update && !pm_runtime_suspended(hba->dev)) {
> -		pm_runtime_get_sync(hba->dev);
> +		scsi_autopm_get_device(hba->sdev_ufs_device);
>  		ufshcd_hold(hba, false);
>  		ufshcd_auto_hibern8_enable(hba);
>  		ufshcd_release(hba);
> -		pm_runtime_put(hba->dev);
> +		scsi_autopm_put_device(hba->sdev_ufs_device);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_auto_hibern8_update);
> @@ -4808,6 +4822,40 @@ static inline void ufshcd_get_lu_power_on_wp_status(struct ufs_hba *hba,
>  }
>  
>  /**
> + * ufshcd_setup_links - associate link b/w device wlun and other luns
> + * @sdev: pointer to SCSI device
> + * @hba: pointer to ufs hba
> + */
> +static void ufshcd_setup_links(struct ufs_hba *hba, struct scsi_device *sdev)
> +{
> +	struct device_link *link;
> +
> +	/*
> +	 * device wlun is the supplier & rest of the luns are consumers
> +	 * This ensures that device wlun suspends after all other luns.
> +	 */
> +	if (hba->sdev_ufs_device) {
> +		link = device_link_add(&sdev->sdev_gendev,
> +				       &hba->sdev_ufs_device->sdev_gendev,
> +				       DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);
> +		if (!link) {
> +			dev_err(&sdev->sdev_gendev, "Failed establishing link - %s\n",
> +				dev_name(&hba->sdev_ufs_device->sdev_gendev));
> +			return;
> +		}
> +		hba->luns_avail--;
> +		/* Ignore REPORT_LUN wlun probing */
> +		if (hba->luns_avail == 1) {
> +			pm_runtime_put(&hba->sdev_ufs_device->sdev_gendev);
> +			return;
> +		}
> +	} else {
> +		/* device wlun is probed */
> +		hba->luns_avail--;
> +	}
> +}
> +
> +/**
>   * ufshcd_slave_alloc - handle initial SCSI device configurations
>   * @sdev: pointer to SCSI device
>   *
> @@ -4838,6 +4886,8 @@ static int ufshcd_slave_alloc(struct scsi_device *sdev)
>  
>  	ufshcd_get_lu_power_on_wp_status(hba, sdev);
>  
> +	ufshcd_setup_links(hba, sdev);
> +
>  	return 0;
>  }
>  
> @@ -4869,8 +4919,13 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
>  	blk_queue_update_dma_pad(q, PRDT_DATA_BYTE_COUNT_PAD - 1);
>  	if (hba->quirks & UFSHCD_QUIRK_ALIGN_SG_WITH_PAGE_SIZE)
>  		blk_queue_update_dma_alignment(q, PAGE_SIZE - 1);
> -
> -	if (ufshcd_is_rpm_autosuspend_allowed(hba))
> +	/*
> +	 * Block runtime-pm until all consumers are added.
> +	 * Refer ufshcd_setup_links().
> +	 */
> +	if (is_device_wlun(sdev))
> +		pm_runtime_get_noresume(&sdev->sdev_gendev);
> +	else if (ufshcd_is_rpm_autosuspend_allowed(hba))
>  		sdev->rpm_autosuspend = 1;
>  
>  	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
> @@ -4985,15 +5040,9 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>  			 * UFS device needs urgent BKOPs.
>  			 */
>  			if (!hba->pm_op_in_progress &&
> -			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr) &&
> -			    schedule_work(&hba->eeh_work)) {
> -				/*
> -				 * Prevent suspend once eeh_work is scheduled
> -				 * to avoid deadlock between ufshcd_suspend
> -				 * and exception event handler.
> -				 */
> -				pm_runtime_get_noresume(hba->dev);
> -			}
> +			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
> +				/* Flushed in suspend */
> +				schedule_work(&hba->eeh_work);
>  			break;
>  		case UPIU_TRANSACTION_REJECT_UPIU:
>  			/* TODO: handle Reject UPIU Response */
> @@ -5589,8 +5638,8 @@ static void ufshcd_rpm_dev_flush_recheck_work(struct work_struct *work)
>  	 * after a certain delay to recheck the threshold by next runtime
>  	 * suspend.
>  	 */
> -	pm_runtime_get_sync(hba->dev);
> -	pm_runtime_put_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
>  }
>  
>  /**
> @@ -5607,7 +5656,6 @@ static void ufshcd_exception_event_handler(struct work_struct *work)
>  	u32 status = 0;
>  	hba = container_of(work, struct ufs_hba, eeh_work);
>  
> -	pm_runtime_get_sync(hba->dev);
>  	ufshcd_scsi_block_requests(hba);
>  	err = ufshcd_get_ee_status(hba, &status);
>  	if (err) {
> @@ -5623,14 +5671,6 @@ static void ufshcd_exception_event_handler(struct work_struct *work)
>  
>  out:
>  	ufshcd_scsi_unblock_requests(hba);
> -	/*
> -	 * pm_runtime_get_noresume is called while scheduling
> -	 * eeh_work to avoid suspend racing with exception work.
> -	 * Hence decrement usage counter using pm_runtime_put_noidle
> -	 * to allow suspend on completion of exception event handler.
> -	 */
> -	pm_runtime_put_noidle(hba->dev);
> -	pm_runtime_put(hba->dev);
>  	return;
>  }
>  
> @@ -5755,12 +5795,13 @@ static void ufshcd_clk_scaling_suspend(struct ufs_hba *hba, bool suspend)
>  
>  static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>  {
> -	pm_runtime_get_sync(hba->dev);
> -	if (pm_runtime_status_suspended(hba->dev) || hba->is_sys_suspended) {
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
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
> @@ -5789,7 +5830,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>  	ufshcd_release(hba);
>  	if (ufshcd_is_clkscaling_supported(hba))
>  		ufshcd_clk_scaling_suspend(hba, false);
> -	pm_runtime_put(hba->dev);
> +	pm_runtime_put(&hba->sdev_ufs_device->sdev_gendev);
>  }
>  
>  static inline bool ufshcd_err_handling_should_stop(struct ufs_hba *hba)
> @@ -5810,14 +5851,14 @@ static void ufshcd_recover_pm_error(struct ufs_hba *hba)
>  
>  	hba->is_sys_suspended = false;
>  	/*
> -	 * Set RPM status of hba device to RPM_ACTIVE,
> +	 * Set RPM status of wlun device to RPM_ACTIVE,
>  	 * this also clears its runtime error.
>  	 */
> -	ret = pm_runtime_set_active(hba->dev);
> +	ret = pm_runtime_set_active(&hba->sdev_ufs_device->sdev_gendev);
>  	/*
> -	 * If hba device had runtime error, we also need to resume those
> -	 * scsi devices under hba in case any of them has failed to be
> -	 * resumed due to hba runtime resume failure. This is to unblock
> +	 * If wlun device had runtime error, we also need to resume those
> +	 * consumer scsi devices in case any of them has failed to be
> +	 * resumed due to supplier runtime resume failure. This is to unblock
>  	 * blk_queue_enter in case there are bios waiting inside it.
>  	 */
>  	if (!ret) {
> @@ -7253,8 +7294,7 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
>  		hba->sdev_ufs_device = NULL;
>  		goto out;
>  	}
> -	ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
> -	scsi_device_put(hba->sdev_ufs_device);
> +	scsi_device_put(sdev_ufs_device);
>  
>  	hba->sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
>  		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN), NULL);
> @@ -7417,6 +7457,9 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
>  		goto out;
>  	}
>  
> +	hba->luns_avail = desc_buf[DEVICE_DESC_PARAM_NUM_LU] +
> +		desc_buf[DEVICE_DESC_PARAM_NUM_WLU];
> +
>  	ufs_fixup_device_setup(hba);
>  
>  	ufshcd_wb_probe(hba, desc_buf);
> @@ -7892,6 +7935,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool async)
>  	ufshcd_set_ufs_dev_active(hba);
>  	ufshcd_force_reset_auto_bkops(hba);
>  	hba->wlun_dev_clr_ua = true;
> +	hba->wlun_rpmb_clr_ua = true;
>  
>  	/* Gear up to HS gear if supported */
>  	if (hba->max_pwr_info.is_valid) {
> @@ -8475,7 +8519,8 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
>  	 * handling context.
>  	 */
>  	hba->host->eh_noresume = 1;
> -	ufshcd_clear_ua_wluns(hba);
> +	if (hba->wlun_dev_clr_ua)
> +		ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
>  
>  	cmd[4] = pwr_mode << 4;
>  
> @@ -8650,23 +8695,7 @@ static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba)
>  		ufshcd_setup_hba_vreg(hba, true);
>  }
>  
> -/**
> - * ufshcd_suspend - helper function for suspend operations
> - * @hba: per adapter instance
> - * @pm_op: desired low power operation type
> - *
> - * This function will try to put the UFS device and link into low power
> - * mode based on the "rpm_lvl" (Runtime PM level) or "spm_lvl"
> - * (System PM level).
> - *
> - * If this function is called during shutdown, it will make sure that
> - * both UFS device and UFS link is powered off.
> - *
> - * NOTE: UFS device & link must be active before we enter in this function.
> - *
> - * Returns 0 for success and non-zero for failure
> - */
> -static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> +static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	int ret = 0;
>  	int check_for_bkops;
> @@ -8674,7 +8703,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	enum ufs_dev_pwr_mode req_dev_pwr_mode;
>  	enum uic_link_state req_link_state;
>  
> -	hba->pm_op_in_progress = 1;
> +	hba->pm_op_in_progress = true;
>  	if (!ufshcd_is_shutdown_pm(pm_op)) {
>  		pm_lvl = ufshcd_is_runtime_pm(pm_op) ?
>  			 hba->rpm_lvl : hba->spm_lvl;
> @@ -8697,17 +8726,17 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  
>  	if (req_dev_pwr_mode == UFS_ACTIVE_PWR_MODE &&
>  			req_link_state == UIC_LINK_ACTIVE_STATE) {
> -		goto disable_clks;
> +		goto enable_scaling;
>  	}
>  
>  	if ((req_dev_pwr_mode == hba->curr_dev_pwr_mode) &&
>  	    (req_link_state == hba->uic_link_state))
> -		goto enable_gating;
> +		goto enable_scaling;
>  
>  	/* UFS device & link must be active before we enter in this function */
>  	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
>  		ret = -EINVAL;
> -		goto enable_gating;
> +		goto enable_scaling;
>  	}
>  
>  	if (ufshcd_is_runtime_pm(pm_op)) {
> @@ -8719,7 +8748,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  			 */
>  			ret = ufshcd_urgent_bkops(hba);
>  			if (ret)
> -				goto enable_gating;
> +				goto enable_scaling;
>  		} else {
>  			/* make sure that auto bkops is disabled */
>  			ufshcd_disable_auto_bkops(hba);
> @@ -8747,7 +8776,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		if (!hba->dev_info.b_rpm_dev_flush_capable) {
>  			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
>  			if (ret)
> -				goto enable_gating;
> +				goto enable_scaling;
>  		}
>  	}
>  
> @@ -8760,7 +8789,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (ret)
>  		goto set_dev_active;
>  
> -disable_clks:
>  	/*
>  	 * Call vendor specific suspend callback. As these callbacks may access
>  	 * vendor specific host controller register space call them before the
> @@ -8769,28 +8797,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	ret = ufshcd_vops_suspend(hba, pm_op);
>  	if (ret)
>  		goto set_link_active;
> -	/*
> -	 * Disable the host irq as host controller as there won't be any
> -	 * host controller transaction expected till resume.
> -	 */
> -	ufshcd_disable_irq(hba);
> -
> -	ufshcd_setup_clocks(hba, false);
> -
> -	if (ufshcd_is_clkgating_allowed(hba)) {
> -		hba->clk_gating.state = CLKS_OFF;
> -		trace_ufshcd_clk_gating(dev_name(hba->dev),
> -					hba->clk_gating.state);
> -	}
> -
> -	ufshcd_vreg_set_lpm(hba);
> -
> -	/* Put the host controller in low power mode if possible */
> -	ufshcd_hba_vreg_set_lpm(hba);
>  	goto out;
>  
>  set_link_active:
> -	ufshcd_vreg_set_hpm(hba);
>  	/*
>  	 * Device hardware reset is required to exit DeepSleep. Also, for
>  	 * DeepSleep, the link is off so host reset and restore will be done
> @@ -8812,57 +8821,32 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	}
>  	if (!ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE))
>  		ufshcd_disable_auto_bkops(hba);
> -enable_gating:
> +enable_scaling:
>  	if (ufshcd_is_clkscaling_supported(hba))
>  		ufshcd_clk_scaling_suspend(hba, false);
>  
> -	hba->clk_gating.is_suspended = false;
>  	hba->dev_info.b_rpm_dev_flush_capable = false;
> -	ufshcd_clear_ua_wluns(hba);
> -	ufshcd_release(hba);
>  out:
>  	if (hba->dev_info.b_rpm_dev_flush_capable) {
>  		schedule_delayed_work(&hba->rpm_dev_flush_recheck_work,
>  			msecs_to_jiffies(RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS));
>  	}
>  
> -	hba->pm_op_in_progress = 0;
> -
> -	if (ret)
> -		ufshcd_update_evt_hist(hba, UFS_EVT_SUSPEND_ERR, (u32)ret);
> +	if (ret) {
> +		ufshcd_update_evt_hist(hba, UFS_EVT_WL_SUSP_ERR, (u32)ret);
> +		hba->clk_gating.is_suspended = false;
> +		ufshcd_release(hba);
> +	}
> +	hba->pm_op_in_progress = false;
>  	return ret;
>  }
>  
> -/**
> - * ufshcd_resume - helper function for resume operations
> - * @hba: per adapter instance
> - * @pm_op: runtime PM or system PM
> - *
> - * This function basically brings the UFS device, UniPro link and controller
> - * to active state.
> - *
> - * Returns 0 for success and non-zero for failure
> - */
> -static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> +static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	int ret;
> -	enum uic_link_state old_link_state;
> -
> -	hba->pm_op_in_progress = 1;
> -	old_link_state = hba->uic_link_state;
> +	enum uic_link_state old_link_state = hba->uic_link_state;
>  
> -	ufshcd_hba_vreg_set_hpm(hba);
> -	ret = ufshcd_vreg_set_hpm(hba);
> -	if (ret)
> -		goto out;
> -
> -	/* Make sure clocks are enabled before accessing controller */
> -	ret = ufshcd_setup_clocks(hba, true);
> -	if (ret)
> -		goto disable_vreg;
> -
> -	/* enable the host irq as host controller would be active soon */
> -	ufshcd_enable_irq(hba);
> +	hba->pm_op_in_progress = true;
>  
>  	/*
>  	 * Call vendor specific resume callback. As these callbacks may access
> @@ -8871,7 +8855,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	 */
>  	ret = ufshcd_vops_resume(hba, pm_op);
>  	if (ret)
> -		goto disable_irq_and_vops_clks;
> +		goto out;
>  
>  	/* For DeepSleep, the only supported option is to have the link off */
>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
> @@ -8916,31 +8900,147 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		 */
>  		ufshcd_urgent_bkops(hba);
>  
> -	hba->clk_gating.is_suspended = false;
> -
> -	if (ufshcd_is_clkscaling_supported(hba))
> -		ufshcd_clk_scaling_suspend(hba, false);
> -
> -	/* Enable Auto-Hibernate if configured */
> -	ufshcd_auto_hibern8_enable(hba);
> +	if (hba->clk_scaling.is_allowed)
> +		ufshcd_resume_clkscaling(hba);
>  
>  	if (hba->dev_info.b_rpm_dev_flush_capable) {
>  		hba->dev_info.b_rpm_dev_flush_capable = false;
>  		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
>  	}
>  
> -	ufshcd_clear_ua_wluns(hba);
> -
> -	/* Schedule clock gating in case of no access to UFS device yet */
> -	ufshcd_release(hba);
> -
> +	/* Enable Auto-Hibernate if configured */
> +	ufshcd_auto_hibern8_enable(hba);
>  	goto out;
>  
>  set_old_link_state:
>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>  	ufshcd_vops_suspend(hba, pm_op);
> -disable_irq_and_vops_clks:
> +out:
> +	if (ret)
> +		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
> +	hba->clk_gating.is_suspended = false;
> +	ufshcd_release(hba);
> +	hba->pm_op_in_progress = false;
> +	return ret;
> +}
> +
> +static int ufshcd_wl_runtime_suspend(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +	int ret;
> +	ktime_t start = ktime_get();
> +
> +	hba = shost_priv(sdev->host);
> +
> +	ret = __ufshcd_wl_suspend(hba, UFS_RUNTIME_PM);
> +	if (ret)
> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
> +
> +	trace_ufshcd_wl_runtime_suspend(dev_name(dev), ret,
> +		ktime_to_us(ktime_sub(ktime_get(), start)),
> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
> +
> +	return ret;
> +}
> +
> +static int ufshcd_wl_runtime_resume(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +	int ret = 0;
> +	ktime_t start = ktime_get();
> +
> +	hba = shost_priv(sdev->host);
> +
> +	ret = __ufshcd_wl_resume(hba, UFS_RUNTIME_PM);
> +	if (ret)
> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
> +
> +	trace_ufshcd_wl_runtime_resume(dev_name(dev), ret,
> +		ktime_to_us(ktime_sub(ktime_get(), start)),
> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
> +
> +	return ret;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_suspend(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +	int ret;
> +	ktime_t start = ktime_get();
> +
> +	hba = shost_priv(sdev->host);
> +	ret = __ufshcd_wl_suspend(hba, UFS_SYSTEM_PM);
> +	if (ret)
> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__,  ret);
> +
> +	trace_ufshcd_wl_suspend(dev_name(dev), ret,
> +		ktime_to_us(ktime_sub(ktime_get(), start)),
> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
> +
> +	return ret;
> +}
> +
> +static int ufshcd_wl_resume(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +	int ret = 0;
> +	ktime_t start = ktime_get();
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +	hba = shost_priv(sdev->host);
> +
> +	ret = __ufshcd_wl_resume(hba, UFS_SYSTEM_PM);
> +	if (ret)
> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
> +
> +	trace_ufshcd_wl_resume(dev_name(dev), ret,
> +		ktime_to_us(ktime_sub(ktime_get(), start)),
> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
> +
> +	return ret;
> +}
> +#endif
> +
> +static void ufshcd_wl_shutdown(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +
> +	hba = shost_priv(sdev->host);
> +	/* Turn on everything while shutting down */
> +	scsi_autopm_get_device(sdev);
> +	scsi_device_quiesce(sdev);
> +	shost_for_each_device(sdev, hba->host) {
> +		if (sdev == hba->sdev_ufs_device)
> +			continue;
> +		scsi_device_quiesce(sdev);
> +	}
> +	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
> +}
> +
> +/**
> + * ufshcd_suspend - helper function for suspend operations
> + * @hba: per adapter instance
> + *
> + * This function will put disable irqs, turn off clocks
> + * and set vreg and hba-vreg in lpm mode.
> + * Also check the description of __ufshcd_wl_suspend().
> + */
> +static void ufshcd_suspend(struct ufs_hba *hba)
> +{
> +	hba->pm_op_in_progress = 1;
> +
> +	/*
> +	 * Disable the host irq as host controller as there won't be any
> +	 * host controller transaction expected till resume.
> +	 */
>  	ufshcd_disable_irq(hba);
>  	ufshcd_setup_clocks(hba, false);
>  	if (ufshcd_is_clkgating_allowed(hba)) {
> @@ -8948,6 +9048,43 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>  					hba->clk_gating.state);
>  	}
> +
> +	ufshcd_vreg_set_lpm(hba);
> +	/* Put the host controller in low power mode if possible */
> +	ufshcd_hba_vreg_set_lpm(hba);
> +	hba->pm_op_in_progress = 0;
> +}
> +
> +/**
> + * ufshcd_resume - helper function for resume operations
> + * @hba: per adapter instance
> + *
> + * This function basically turns on the regulators, clocks and
> + * irqs of the hba.
> + * Also check the description of __ufshcd_wl_resume().
> + *
> + * Returns 0 for success and non-zero for failure
> + */
> +static int ufshcd_resume(struct ufs_hba *hba)
> +{
> +	int ret;
> +
> +	hba->pm_op_in_progress = 1;
> +
> +	ufshcd_hba_vreg_set_hpm(hba);
> +	ret = ufshcd_vreg_set_hpm(hba);
> +	if (ret)
> +		goto out;
> +
> +	/* Make sure clocks are enabled before accessing controller */
> +	ret = ufshcd_setup_clocks(hba, true);
> +	if (ret)
> +		goto disable_vreg;
> +
> +	/* enable the host irq as host controller would be active soon */
> +	ufshcd_enable_irq(hba);
> +	goto out;
> +
>  disable_vreg:
>  	ufshcd_vreg_set_lpm(hba);
>  out:
> @@ -8962,6 +9099,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   * @hba: per adapter instance
>   *
>   * Check the description of ufshcd_suspend() function for more details.
> + * Also check the description of __ufshcd_wl_suspend().
>   *
>   * Returns 0 for success and non-zero for failure
>   */
> @@ -8987,21 +9125,7 @@ int ufshcd_system_suspend(struct ufs_hba *hba)
>  	     !hba->dev_info.b_rpm_dev_flush_capable)
>  		goto out;
>  
> -	if (pm_runtime_suspended(hba->dev)) {
> -		/*
> -		 * UFS device and/or UFS link low power states during runtime
> -		 * suspend seems to be different than what is expected during
> -		 * system suspend. Hence runtime resume the devic & link and
> -		 * let the system suspend low power states to take effect.
> -		 * TODO: If resume takes longer time, we might have optimize
> -		 * it in future by not resuming everything if possible.
> -		 */
> -		ret = ufshcd_runtime_resume(hba);
> -		if (ret)
> -			goto out;
> -	}
> -
> -	ret = ufshcd_suspend(hba, UFS_SYSTEM_PM);
> +	ufshcd_suspend(hba);
>  out:
>  	trace_ufshcd_system_suspend(dev_name(hba->dev), ret,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
> @@ -9023,7 +9147,6 @@ EXPORT_SYMBOL(ufshcd_system_suspend);
>  
>  int ufshcd_system_resume(struct ufs_hba *hba)
>  {
> -	int ret = 0;
>  	ktime_t start = ktime_get();
>  
>  	if (!hba)
> @@ -9034,22 +9157,18 @@ int ufshcd_system_resume(struct ufs_hba *hba)
>  		down(&hba->host_sem);
>  	}
>  
> -	if (!hba->is_powered || pm_runtime_suspended(hba->dev))
> -		/*
> -		 * Let the runtime resume take care of resuming
> -		 * if runtime suspended.
> -		 */
> +	if (!hba->is_powered)
>  		goto out;
>  	else
> -		ret = ufshcd_resume(hba, UFS_SYSTEM_PM);
> +		ufshcd_resume(hba);
>  out:
> -	trace_ufshcd_system_resume(dev_name(hba->dev), ret,
> +	trace_ufshcd_system_resume(dev_name(hba->dev), 0,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	if (!ret)
> -		hba->is_sys_suspended = false;
> +
> +	hba->is_sys_suspended = false;
>  	up(&hba->host_sem);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(ufshcd_system_resume);
>  
> @@ -9058,12 +9177,12 @@ EXPORT_SYMBOL(ufshcd_system_resume);
>   * @hba: per adapter instance
>   *
>   * Check the description of ufshcd_suspend() function for more details.
> + * Also check the description of __ufshcd_wl_suspend().
>   *
>   * Returns 0 for success and non-zero for failure
>   */
>  int ufshcd_runtime_suspend(struct ufs_hba *hba)
>  {
> -	int ret = 0;
>  	ktime_t start = ktime_get();
>  
>  	if (!hba)
> @@ -9072,12 +9191,12 @@ int ufshcd_runtime_suspend(struct ufs_hba *hba)
>  	if (!hba->is_powered)
>  		goto out;
>  	else
> -		ret = ufshcd_suspend(hba, UFS_RUNTIME_PM);
> +		ufshcd_suspend(hba);
>  out:
> -	trace_ufshcd_runtime_suspend(dev_name(hba->dev), ret,
> +	trace_ufshcd_runtime_suspend(dev_name(hba->dev), 0,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_suspend);
>  
> @@ -9085,26 +9204,14 @@ EXPORT_SYMBOL(ufshcd_runtime_suspend);
>   * ufshcd_runtime_resume - runtime resume routine
>   * @hba: per adapter instance
>   *
> - * This function basically brings the UFS device, UniPro link and controller
> + * This function basically brings controller
>   * to active state. Following operations are done in this function:
>   *
>   * 1. Turn on all the controller related clocks
> - * 2. Bring the UniPro link out of Hibernate state
> - * 3. If UFS device is in sleep state, turn ON VCC rail and bring the UFS device
> - *    to active state.
> - * 4. If auto-bkops is enabled on the device, disable it.
> - *
> - * So following would be the possible power state after this function return
> - * successfully:
> - *	S1: UFS device in Active state with VCC rail ON
> - *	    UniPro link in Active state
> - *	    All the UFS/UniPro controller clocks are ON
> - *
> - * Returns 0 for success and non-zero for failure
> + * 2. Turn ON VCC rail
>   */
>  int ufshcd_runtime_resume(struct ufs_hba *hba)
>  {
> -	int ret = 0;
>  	ktime_t start = ktime_get();
>  
>  	if (!hba)
> @@ -9113,12 +9220,12 @@ int ufshcd_runtime_resume(struct ufs_hba *hba)
>  	if (!hba->is_powered)
>  		goto out;
>  	else
> -		ret = ufshcd_resume(hba, UFS_RUNTIME_PM);
> +		ufshcd_resume(hba);
>  out:
> -	trace_ufshcd_runtime_resume(dev_name(hba->dev), ret,
> +	trace_ufshcd_runtime_resume(dev_name(hba->dev), 0,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(ufshcd_runtime_resume);
>  
> @@ -9132,14 +9239,13 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>   * ufshcd_shutdown - shutdown routine
>   * @hba: per adapter instance
>   *
> - * This function would power off both UFS device and UFS link.
> + * This function would turn off both UFS device and UFS hba
> + * regulators. It would also disable clocks.
>   *
>   * Returns 0 always to allow force shutdown even in case of errors.
>   */
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
> -	int ret = 0;
> -
>  	down(&hba->host_sem);
>  	hba->shutting_down = true;
>  	up(&hba->host_sem);

hba->shutting_down needs to be moved to ufshcd_wl_shutdown()

> @@ -9152,10 +9258,8 @@ int ufshcd_shutdown(struct ufs_hba *hba)
>  
>  	pm_runtime_get_sync(hba->dev);
>  
> -	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> +	ufshcd_suspend(hba);
>  out:
> -	if (ret)
> -		dev_err(hba->dev, "%s failed, err %d\n", __func__, ret);
>  	hba->is_powered = false;
>  	/* allow force shutdown even in case of errors */
>  	return 0;

ufshcd_remove() not mentioned here, needs at the start:

	if (hba->sdev_ufs_device)
		scsi_autopm_get_device(hba->sdev_ufs_device);



> @@ -9477,15 +9581,172 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_init);
>  
> +void ufshcd_resume_complete(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +
> +	pm_runtime_put_noidle(&hba->sdev_ufs_device->sdev_gendev);
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_resume_complete);
> +
> +int ufshcd_suspend_prepare(struct device *dev)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +
> +	/*
> +	 * SCSI assumes that runtime-pm and system-pm for scsi drivers
> +	 * are same. And it doesn't wake up the device for system-suspend
> +	 * if it's runtime suspended. But ufs doesn't follow that.
> +	 * The rpm-lvl and spm-lvl can be different in ufs.
> +	 * Force it to honor system-suspend.
> +	 */
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
> +	/* Refer ufshcd_resume_complete() */
> +	pm_runtime_get_noresume(&hba->sdev_ufs_device->sdev_gendev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_suspend_prepare);
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_poweroff(struct device *dev)
> +{
> +	ufshcd_wl_shutdown(dev);
> +	return 0;
> +}
> +#endif
> +
> +static int ufshcd_wl_probe(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +
> +	if (!is_device_wlun(sdev))
> +		return -ENODEV;
> +
> +	blk_pm_runtime_init(sdev->request_queue, dev);
> +	pm_runtime_set_autosuspend_delay(dev, 0);
> +	pm_runtime_allow(dev);
> +
> +	return  0;
> +}
> +
> +static int ufshcd_wl_remove(struct device *dev)
> +{
> +	pm_runtime_forbid(dev);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ufshcd_wl_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = ufshcd_wl_suspend,
> +	.resume = ufshcd_wl_resume,
> +	.freeze = ufshcd_wl_suspend,
> +	.thaw = ufshcd_wl_resume,
> +	.poweroff = ufshcd_wl_poweroff,
> +	.restore = ufshcd_wl_resume,
> +#endif
> +	SET_RUNTIME_PM_OPS(ufshcd_wl_runtime_suspend, ufshcd_wl_runtime_resume, NULL)
> +};
> +
> +/**
> + * ufs_dev_wlun_template - describes ufs device wlun
> + * ufs-device wlun - used to send pm commands
> + * All luns are consumers of ufs-device wlun.
> + *
> + * Currently, no sd driver is present for wluns.
> + * Hence the no specific pm operations are performed.
> + * With ufs design, SSU should be sent to ufs-device wlun.
> + * Hence register a scsi driver for ufs wluns only.
> + */
> +static struct scsi_driver ufs_dev_wlun_template = {
> +	.gendrv = {
> +		.name = "ufs_device_wlun",
> +		.owner = THIS_MODULE,
> +		.probe = ufshcd_wl_probe,
> +		.remove = ufshcd_wl_remove,
> +		.pm = &ufshcd_wl_pm_ops,
> +		.shutdown = ufshcd_wl_shutdown,
> +	},
> +};
> +
> +static int ufshcd_rpmb_probe(struct device *dev)
> +{
> +	return is_rpmb_wlun(to_scsi_device(dev)) ? 0 : -ENODEV;
> +}
> +
> +static inline int ufshcd_clear_rpmb_uac(struct ufs_hba *hba)
> +{
> +	int ret = 0;
> +
> +	if (!hba->wlun_rpmb_clr_ua)
> +		return 0;
> +	ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN);
> +	if (!ret)
> +		hba->wlun_rpmb_clr_ua = 0;
> +	return ret;
> +}
> +
> +static int ufshcd_rpmb_runtime_resume(struct device *dev)
> +{
> +	struct ufs_hba *hba = wlun_dev_to_hba(dev);
> +
> +	if (hba->sdev_rpmb)
> +		return ufshcd_clear_rpmb_uac(hba);
> +	return 0;
> +}
> +
> +static int ufshcd_rpmb_resume(struct device *dev)
> +{
> +	struct ufs_hba *hba = wlun_dev_to_hba(dev);
> +
> +	if (hba->sdev_rpmb && !pm_runtime_suspended(dev))
> +		return ufshcd_clear_rpmb_uac(hba);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ufs_rpmb_pm_ops = {
> +	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, ufshcd_rpmb_resume)
> +};
> +
> +/**
> + * Describes the ufs rpmb wlun.
> + * Used only to send uac.
> + */
> +static struct scsi_driver ufs_rpmb_wlun_template = {
> +	.gendrv = {
> +		.name = "ufs_rpmb_wlun",
> +		.owner = THIS_MODULE,
> +		.probe = ufshcd_rpmb_probe,
> +		.pm = &ufs_rpmb_pm_ops,
> +	},
> +};
> +
>  static int __init ufshcd_core_init(void)
>  {
> +	int ret;
> +
>  	ufs_debugfs_init();
> +
> +	ret = scsi_register_driver(&ufs_dev_wlun_template.gendrv);
> +	if (ret) {
> +		ufs_debugfs_exit();
> +		return ret;
> +	}
> +	ret = scsi_register_driver(&ufs_rpmb_wlun_template.gendrv);
> +	if (ret) {
> +		ufs_debugfs_exit();
> +		scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
> +		return ret;
> +	}
>  	return 0;
>  }
>  
>  static void __exit ufshcd_core_exit(void)
>  {
>  	ufs_debugfs_exit();
> +	scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
> +	scsi_unregister_driver(&ufs_rpmb_wlun_template.gendrv);

Logically, we should unregister ufs_rpmb_wlun before ufs_dev_wlun

>  }
>  
>  module_init(ufshcd_core_init);
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index ee61f82..7841b2a 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -72,6 +72,8 @@ enum ufs_event_type {
>  	UFS_EVT_LINK_STARTUP_FAIL,
>  	UFS_EVT_RESUME_ERR,
>  	UFS_EVT_SUSPEND_ERR,
> +	UFS_EVT_WL_SUSP_ERR,
> +	UFS_EVT_WL_RES_ERR,
>  
>  	/* abnormal events */
>  	UFS_EVT_DEV_RESET,
> @@ -804,6 +806,7 @@ struct ufs_hba {
>  	struct list_head clk_list_head;
>  
>  	bool wlun_dev_clr_ua;
> +	bool wlun_rpmb_clr_ua;
>  
>  	/* Number of requests aborts */
>  	int req_abort_count;
> @@ -841,6 +844,7 @@ struct ufs_hba {
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs_root;
>  #endif
> +	u32 luns_avail;
>  };
>  
>  /* Returns true if clocks can be gated. Otherwise false */
> @@ -1100,6 +1104,8 @@ int ufshcd_exec_raw_upiu_cmd(struct ufs_hba *hba,
>  			     enum query_opcode desc_op);
>  
>  int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
> +int ufshcd_suspend_prepare(struct device *dev);
> +void ufshcd_resume_complete(struct device *dev);
>  
>  /* Wrapper functions for safely calling variant operations */
>  static inline const char *ufshcd_get_var_name(struct ufs_hba *hba)
> diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
> index e151477..d9d233b 100644
> --- a/include/trace/events/ufs.h
> +++ b/include/trace/events/ufs.h
> @@ -246,6 +246,26 @@ DEFINE_EVENT(ufshcd_template, ufshcd_init,
>  		      int dev_state, int link_state),
>  	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
>  
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_suspend,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_resume,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_suspend,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
> +DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_resume,
> +	     TP_PROTO(const char *dev_name, int err, s64 usecs,
> +		      int dev_state, int link_state),
> +	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
> +
>  TRACE_EVENT(ufshcd_command,
>  	TP_PROTO(const char *dev_name, enum ufs_trace_str_t str_t,
>  		 unsigned int tag, u32 doorbell, int transfer_len, u32 intr,
> 

