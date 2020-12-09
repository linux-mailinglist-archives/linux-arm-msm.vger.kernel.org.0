Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9708B2D3CC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 09:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgLIICy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 03:02:54 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:59775 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbgLIICp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 03:02:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607500939; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2K04sH2o7E+7Xad82QadBqnzfPh01tJKf3TiTO1/FtI=;
 b=qhfN+j0XzTxOn5s+xHa1OVZpM9z1IhNnuXNsS1vW7RD3LCt35erv04wZvtIShQRHD4XD4vil
 J1wD21xlLRp6rc15io6a8ZIMsAzH5fDDbHsZreCBxYwMxQ8Owow12KdJH/vIRI5W/dWpZwgx
 h1AhAxPD0fcfO9sPwb/TJtBVf5M=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fd0844e395c822bfe698e14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Dec 2020 08:01:18
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 47D0CC43466; Wed,  9 Dec 2020 08:01:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60CCDC433C6;
        Wed,  9 Dec 2020 08:01:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 09 Dec 2020 16:01:16 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Ziqi Chen <ziqichen@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] scsi: ufs: Fix ufs power down/on specs violation
In-Reply-To: <1607497774-76579-1-git-send-email-ziqichen@codeaurora.org>
References: <1607497774-76579-1-git-send-email-ziqichen@codeaurora.org>
Message-ID: <6105ea481f6a42fb0e5133e442a51549@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-09 15:09, Ziqi Chen wrote:
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
> 
> Power down:
> 1. Assert RST_N low
> 2. Turn-off REF_CLK
> 3. Turn-off VCC
> 4. Turn-off VCCQ/VCCQ2.
> power on:
> 1. Turn-on VCC
> 2. Turn-on VCCQ/VCCQ2
> 3. Turn-On REF_CLK
> 4. Deassert RST_N high.
> 
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 14 ++++++++++----
>  drivers/scsi/ufs/ufshcd.c   | 19 +++++++++----------
>  drivers/scsi/ufs/ufshcd.h   |  4 ++--
>  3 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 1e434cc..5ed3a63d 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -582,6 +582,9 @@ static int ufs_qcom_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  		ufs_qcom_disable_lane_clks(host);
>  		phy_power_off(phy);
> 
> +		if (hba->vops && hba->vops->device_reset)
> +			hba->vops->device_reset(hba, false);
> +
>  	} else if (!ufs_qcom_is_link_active(hba)) {
>  		ufs_qcom_disable_lane_clks(host);
>  	}
> @@ -1400,10 +1403,11 @@ static void ufs_qcom_dump_dbg_regs(struct 
> ufs_hba *hba)
>  /**
>   * ufs_qcom_device_reset() - toggle the (optional) device reset line
>   * @hba: per-adapter instance
> + * @toggle: need pulling up or not
>   *
>   * Toggles the (optional) reset line to reset the attached device.
>   */
> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> +static int ufs_qcom_device_reset(struct ufs_hba *hba, bool toggle)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> 
> @@ -1416,10 +1420,12 @@ static int ufs_qcom_device_reset(struct ufs_hba 
> *hba)
>  	 * be on the safe side.
>  	 */
>  	gpiod_set_value_cansleep(host->device_reset, 1);
> -	usleep_range(10, 15);
> 
> -	gpiod_set_value_cansleep(host->device_reset, 0);
> -	usleep_range(10, 15);
> +	if (toggle) {
> +		usleep_range(10, 15);
> +		gpiod_set_value_cansleep(host->device_reset, 0);
> +		usleep_range(10, 15);
> +	}
> 
>  	return 0;
>  }
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 92d433d..5ab1c02 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -8633,8 +8633,6 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	if (ret)
>  		goto set_dev_active;
> 
> -	ufshcd_vreg_set_lpm(hba);
> -
>  disable_clks:
>  	/*
>  	 * Call vendor specific suspend callback. As these callbacks may 
> access
> @@ -8664,6 +8662,7 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
> 
>  	/* Put the host controller in low power mode if possible */
>  	ufshcd_hba_vreg_set_lpm(hba);
> +	ufshcd_vreg_set_lpm(hba);
>  	goto out;
> 
>  set_link_active:
> @@ -8729,18 +8728,18 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	old_link_state = hba->uic_link_state;
> 
>  	ufshcd_hba_vreg_set_hpm(hba);
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
>  	 * Call vendor specific resume callback. As these callbacks may 
> access
>  	 * vendor specific host controller register space call them when the
> @@ -8748,7 +8747,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	 */
>  	ret = ufshcd_vops_resume(hba, pm_op);
>  	if (ret)
> -		goto disable_vreg;
> +		goto disable_irq_and_vops_clks;
> 
>  	/* For DeepSleep, the only supported option is to have the link off 
> */
>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && 
> !ufshcd_is_link_off(hba));
> @@ -8815,8 +8814,6 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>  	ufshcd_vops_suspend(hba, pm_op);
> -disable_vreg:
> -	ufshcd_vreg_set_lpm(hba);
>  disable_irq_and_vops_clks:
>  	ufshcd_disable_irq(hba);
>  	if (hba->clk_scaling.is_allowed)
> @@ -8827,6 +8824,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>  					hba->clk_gating.state);
>  	}
> +disable_vreg:
> +	ufshcd_vreg_set_lpm(hba);
>  out:
>  	hba->pm_op_in_progress = 0;
>  	if (ret)
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 61344c4..47c7dab6 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -323,7 +323,7 @@ struct ufs_hba_variant_ops {
>  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>  	void	(*dbg_register_dump)(struct ufs_hba *hba);
>  	int	(*phy_initialization)(struct ufs_hba *);
> -	int	(*device_reset)(struct ufs_hba *hba);
> +	int	(*device_reset)(struct ufs_hba *hba, bool);
>  	void	(*config_scaling_param)(struct ufs_hba *hba,
>  					struct devfreq_dev_profile *profile,
>  					void *data);
> @@ -1211,7 +1211,7 @@ static inline void
> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>  static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
>  {
>  	if (hba->vops && hba->vops->device_reset) {
> -		int err = hba->vops->device_reset(hba);
> +		int err = hba->vops->device_reset(hba, true);
> 
>  		if (!err)
>  			ufshcd_set_ufs_dev_active(hba);


Please check Stanley's new change 
https://lore.kernel.org/patchwork/patch/1350843/.

You may want to re-name the func ufschd_vops_device_reset() to
ufshcd_vops_toggle_device_reset(sturct ufs_hba *hba, bool up) and
similarly re-name device_reset() to toggle_device_reset(hba, up).
Then in the new func ufshcd_device_reset(), call 
ufshcd_vops_toggle_device_reset()
twice, once to toggle up, once to toggle down. In this way, you will be
able to use ufshcd_vops_toggle_device_reset() in ufshcd_suspend().

This is just a rough idea.

Thanks,

Can Guo.


