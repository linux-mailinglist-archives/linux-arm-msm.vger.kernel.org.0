Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADDA2E0030
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 19:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgLUSmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 13:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgLUSmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 13:42:11 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A141C061285
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 10:41:31 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id d8so9697191otq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 10:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xVcsRRAe3QQsAP3c3tjdQE3L4kRnwMJNIrR1ol7P6LI=;
        b=NUQAhkR7tMApqoWGZztLCQVXhf/juykgQDS+v0C7Mzi4KXQ2fghYM8jonrJ9xTp+jI
         b+2N8LS4N/pMXJALUH0JoFHnGNcPtS4jT7f/4d+ZaNvqpXMLDeombSbT2pFCpfeULW5D
         bv7w6bf0H7K9oBcKE7LWSRaE7YTUDEm9x2klyae/qHU4EcVHKVf0uEViKAtXSVSNDjT6
         wF6tD92zLDA1Yz0y883o9G26zYZNtbaOFswVj+f4HwSZzwb6Dic3AKG46xZkC1uv2Gb7
         mqSsmkRza17vqz1Dq5fqKZYP/6Vg1UChzsEiLDyICnFHel97F03f9N6sz5g84TkXZQdE
         H4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xVcsRRAe3QQsAP3c3tjdQE3L4kRnwMJNIrR1ol7P6LI=;
        b=TJKG2561RC24tQVpm+7s1MUcX9QId4X9vFrNDGsV5w810Zzs9GRqWG1erGqqlElmJP
         Ummw/6DydxLFqCorGICLYPs3y++SkPOfzrnzRrqhlmAkdv1cUfMNCxcKpCvaBuBtDb9G
         uFWX6wLECMmTPfsLoQjaVBJCpxPtVxI5ZecbHAmpXIhEc6ip9BntDQMFjJGaGRgQtcdW
         c49jJ1MrsG3iLU1/DiZZB7Gq1/1e/cVbZoXK6NQ1+JM0ssuFnzVCtzYfOvLjbQF3RXr8
         A0qWJw2ERwnjuc5lckv5TzAaBdGskoVzcObblAlADmOznig7X+r5tBfCeBXonWe9lcPm
         PVtA==
X-Gm-Message-State: AOAM531+DkFS92SCCycsfRcOzwY/yYyv/RTq8Y6DNuoEhABmnFCUbUqU
        S8wPtKs+FOCIIKdgJWI7s9od3Q==
X-Google-Smtp-Source: ABdhPJxwRz48sd8HXLykSZi1QNKtTFfr52t8ljWw072lXQLgqmltmACqSFHSdPW33O3TK4vke0+FQQ==
X-Received: by 2002:a9d:5388:: with SMTP id w8mr13031427otg.311.1608576090861;
        Mon, 21 Dec 2020 10:41:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s26sm3970033otd.8.2020.12.21.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 10:41:30 -0800 (PST)
Date:   Mon, 21 Dec 2020 12:41:28 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ziqi Chen <ziqichen@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        cang@codeaurora.org, hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        kwmad.kim@samsung.com, stanley.chu@mediatek.com,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RFC v3 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Message-ID: <X+DsWM+/h75doajo@builder.lan>
References: <1608537091-78575-1-git-send-email-ziqichen@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608537091-78575-1-git-send-email-ziqichen@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Dec 01:51 CST 2020, Ziqi Chen wrote:

> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
> 
> To flexibly control device reset line, re-name the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_toggle_device_reset(sturct ufs_hba *hba, bool down). The
> new parameter "bool down" is used to separate device reset
> line pulling down from pulling up.
> 
> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 27 +++++++++-----------------
>  drivers/scsi/ufs/ufs-qcom.c     | 22 ++++++++++-----------
>  drivers/scsi/ufs/ufshcd.c       | 43 ++++++++++++++++++++++++++++++-----------
>  drivers/scsi/ufs/ufshcd.h       | 10 +++++-----
>  4 files changed, 56 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 80618af..bff2c42 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -841,27 +841,18 @@ static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
>  	return ret;
>  }
>  
> -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> +static int ufs_mtk_toggle_device_reset(struct ufs_hba *hba, bool down)
>  {
>  	struct arm_smccc_res res;
>  
> -	ufs_mtk_device_reset_ctrl(0, res);
> -
> -	/*
> -	 * The reset signal is active low. UFS devices shall detect
> -	 * more than or equal to 1us of positive or negative RST_n
> -	 * pulse width.
> -	 *
> -	 * To be on safe side, keep the reset low for at least 10us.
> -	 */
> -	usleep_range(10, 15);
> -
> -	ufs_mtk_device_reset_ctrl(1, res);
> -
> -	/* Some devices may need time to respond to rst_n */
> -	usleep_range(10000, 15000);
> +	if (down) {
> +		ufs_mtk_device_reset_ctrl(0, res);
> +	} else {
> +		ufs_mtk_device_reset_ctrl(1, res);
>  
> -	dev_info(hba->dev, "device reset done\n");
> +		/* Some devices may need time to respond to rst_n */
> +		usleep_range(10000, 15000);
> +	}
>  
>  	return 0;
>  }
> @@ -1052,7 +1043,7 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
>  	.suspend             = ufs_mtk_suspend,
>  	.resume              = ufs_mtk_resume,
>  	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
> -	.device_reset        = ufs_mtk_device_reset,
> +	.toggle_device_reset        = ufs_mtk_toggle_device_reset,
>  	.event_notify        = ufs_mtk_event_notify,
>  };
>  
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2206b1e..c2ccaa5 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1404,12 +1404,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>  }
>  
>  /**
> - * ufs_qcom_device_reset() - toggle the (optional) device reset line
> + * ufs_qcom_toggle_device_reset() - toggle the (optional) device reset line
>   * @hba: per-adapter instance
> + * @down: pull down or pull up device reset line
>   *
>   * Toggles the (optional) reset line to reset the attached device.
>   */
> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> +static int ufs_qcom_toggle_device_reset(struct ufs_hba *hba, bool down)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  
> @@ -1417,15 +1418,12 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
>  	if (!host->device_reset)
>  		return -EOPNOTSUPP;
>  
> -	/*
> -	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
> -	 * be on the safe side.
> -	 */
> -	gpiod_set_value_cansleep(host->device_reset, 1);
> -	usleep_range(10, 15);
> -
> -	gpiod_set_value_cansleep(host->device_reset, 0);
> -	usleep_range(10, 15);
> +	if (down) {
> +		gpiod_set_value_cansleep(host->device_reset, 1);
> +	} else {
> +		gpiod_set_value_cansleep(host->device_reset, 0);
> +		usleep_range(10, 15);

The comment above describes that the reset pulse should be 10uS, so the
only reason I can see for the sleep here would be for devices to come
back up after the reset pulse - i.e. what Mediatek believes needs
10-15mS.

As such, I would like you to move this sleep out to the caller and then
turns this snippet into just:

	gpiod_set_value_cansleep(host->device_reset, down);

I don't see a problem using Mediatek's reasoning and sleep values in the
common case.

> +	}
>  
>  	return 0;
>  }
> @@ -1473,7 +1471,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>  	.suspend		= ufs_qcom_suspend,
>  	.resume			= ufs_qcom_resume,
>  	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
> -	.device_reset		= ufs_qcom_device_reset,
> +	.toggle_device_reset		= ufs_qcom_toggle_device_reset,
>  	.config_scaling_param = ufs_qcom_config_scaling_param,
>  	.program_key		= ufs_qcom_ice_program_key,
>  };
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index e221add..2ee905f 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -585,7 +585,20 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
>  {
>  	int err;
>  
> -	err = ufshcd_vops_device_reset(hba);
> +	err = ufshcd_vops_toggle_device_reset(hba, true);
> +	if (err) {
> +		dev_err(hba->dev, "device reset pulling down failure: %d\n", err);

"asserting device reset failed"

> +		return;
> +	}
> +
> +	/*
> +	 * The reset signal is active low. The UFS device
> +	 * shall detect reset pulses of 1us, sleep for at
> +	 * least 10us to be on the safe side.
> +	 */
> +	usleep_range(10, 15);
> +
> +	err = ufshcd_vops_toggle_device_reset(hba, false);
>  
>  	if (!err) {
>  		ufshcd_set_ufs_dev_active(hba);
> @@ -593,7 +606,11 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
>  			hba->wb_enabled = false;
>  			hba->wb_buf_flush_enabled = false;
>  		}
> +		dev_info(hba->dev, "device reset done\n");

Please use dev_dbg(), as this is only interesting to us when we're
actually debugging UFS related issues.

> +	} else {
> +		dev_err(hba->dev, "device reset pulling up failure: %d\n", err);

"deasserting device reset failed"

>  	}
> +
>  	if (err != -EOPNOTSUPP)
>  		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
>  }
> @@ -8686,8 +8703,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (ret)
>  		goto set_dev_active;
>  
> -	ufshcd_vreg_set_lpm(hba);
> -
>  disable_clks:
>  	/*
>  	 * Call vendor specific suspend callback. As these callbacks may access
> @@ -8703,6 +8718,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	 */
>  	ufshcd_disable_irq(hba);
>  
> +	if (ufshcd_is_link_off(hba))
> +		ufshcd_vops_toggle_device_reset(hba, true);
> +
>  	ufshcd_setup_clocks(hba, false);
>  
>  	if (ufshcd_is_clkgating_allowed(hba)) {
> @@ -8711,6 +8729,8 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  					hba->clk_gating.state);
>  	}
>  
> +	ufshcd_vreg_set_lpm(hba);
> +
>  	/* Put the host controller in low power mode if possible */
>  	ufshcd_hba_vreg_set_lpm(hba);
>  	goto out;
> @@ -8778,18 +8798,19 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	old_link_state = hba->uic_link_state;
>  
>  	ufshcd_hba_vreg_set_hpm(hba);
> +
> +	ret = ufshcd_vreg_set_hpm(hba);
> +	if (ret)
> +		goto out;
> +
>  	/* Make sure clocks are enabled before accessing controller */
>  	ret = ufshcd_setup_clocks(hba, true);
>  	if (ret)
> -		goto out;
> +		goto disable_vreg;
>  
>  	/* enable the host irq as host controller would be active soon */
>  	ufshcd_enable_irq(hba);
>  
> -	ret = ufshcd_vreg_set_hpm(hba);
> -	if (ret)
> -		goto disable_irq_and_vops_clks;
> -
>  	/*
>  	 * Call vendor specific resume callback. As these callbacks may access
>  	 * vendor specific host controller register space call them when the
> @@ -8797,7 +8818,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	 */
>  	ret = ufshcd_vops_resume(hba, pm_op);
>  	if (ret)
> -		goto disable_vreg;
> +		goto disable_irq_and_vops_clks;
>  
>  	/* For DeepSleep, the only supported option is to have the link off */
>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
> @@ -8864,8 +8885,6 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>  	ufshcd_vops_suspend(hba, pm_op);
> -disable_vreg:
> -	ufshcd_vreg_set_lpm(hba);
>  disable_irq_and_vops_clks:
>  	ufshcd_disable_irq(hba);
>  	if (hba->clk_scaling.is_allowed)
> @@ -8876,6 +8895,8 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>  					hba->clk_gating.state);
>  	}
> +disable_vreg:
> +	ufshcd_vreg_set_lpm(hba);
>  out:
>  	hba->pm_op_in_progress = 0;
>  	if (ret)
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 9bb5f0e..dccc3eb 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
>   * @resume: called during host controller PM callback
>   * @dbg_register_dump: used to dump controller debug information
>   * @phy_initialization: used to initialize phys
> - * @device_reset: called to issue a reset pulse on the UFS device
> + * @toggle_device_reset: called to change logic level of reset gpio on the UFS device
>   * @program_key: program or evict an inline encryption key
>   * @event_notify: called to notify important events
>   */
> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
>  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>  	void	(*dbg_register_dump)(struct ufs_hba *hba);
>  	int	(*phy_initialization)(struct ufs_hba *);
> -	int	(*device_reset)(struct ufs_hba *hba);
> +	int	(*toggle_device_reset)(struct ufs_hba *hba, bool down);

I don't think "toggle" adds any value to the understanding of what this
function is expected to do, so I would prefer that you just keep it
"device_reset".

I also would prefer that you replace "down" with "asserted" - as this
avoids questions about active high/low etc from the API.

Thanks,
Bjorn

>  	void	(*config_scaling_param)(struct ufs_hba *hba,
>  					struct devfreq_dev_profile *profile,
>  					void *data);
> @@ -1216,10 +1216,10 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>  		hba->vops->dbg_register_dump(hba);
>  }
>  
> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
> +static inline int ufshcd_vops_toggle_device_reset(struct ufs_hba *hba, bool down)
>  {
> -	if (hba->vops && hba->vops->device_reset)
> -		return hba->vops->device_reset(hba);
> +	if (hba->vops && hba->vops->toggle_device_reset)
> +		return hba->vops->toggle_device_reset(hba, down);
>  
>  	return -EOPNOTSUPP;
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
