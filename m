Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B803B21F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 22:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFWUow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 16:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhFWUov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 16:44:51 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25770C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 13:42:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 84so4831069oie.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ssz/oktO6uO+CirK2ulMaAGD2E4NYuFjNx1oGhPBz88=;
        b=KpMPmt0evI/acbKEXiS6IkcdGvHhWvEJHgmzUbtk5G2UfTEE3DqGnV8W1fiRCWouY+
         kY1Zqp2clob4k718momHKrHB5aCHaCuJ+U00sXtqi40u48g4jxDvasXjxs7GVwunOIBw
         SjeobmH/8OtsvzpvS2M8guU6RPfRc9S/wky86cL8AJ06jLplwCsreO5NibVIfbL9slvC
         rZAx8QGkV23JpPs+xb27B5Bgg7wHayEC4udLpJkxLKM0HYrTpf1uoFjqdMmwpDccyvkS
         cc7XE/59v0JKcB9Muw/cAC2NvDhKUlqQedSdJXjGV8oEe2rn3z3gf2f49kuU/VYyje0S
         DZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ssz/oktO6uO+CirK2ulMaAGD2E4NYuFjNx1oGhPBz88=;
        b=f0QXR3Lb2oZWjeTpUFIhvwVc/4Qc0hCzj3Q4WBb4lNWoLsM+7YEhJmOKi3SfPiCMI9
         KM/rOM9W4h/E9UyWUboe4HRT7C+vkAS0fqVZIec8AXmCwiD09rDbeZOdf1NK6+Oc13IK
         3RQg5uNctZIBOjuPdputZrWiLUOqeNA0EWel1Z7RmaK4nf7ph2on8SfoIadXRAg1LnTx
         g6l2L82K2TtgblTUNatwxMSVcN8EB3PllqSk52WP9bey2nTASSJpQpoQrVMu//+GCv1M
         wc4m9SIRdXRVcK5OveyXIcEzf0UKbFxri4gtBmqqRutHszGH0f1rOyh944I6JcSNJy4q
         r9HA==
X-Gm-Message-State: AOAM532abasdxwDekSDlQBQpxKTqZxNnncvjGEEGdxr3CPON54jKxovh
        Q7jI3IbWv6pncVXWqLjoKnNKHg==
X-Google-Smtp-Source: ABdhPJwok4DrxFFeza7ir4VD5PVDJukDMA4axEKA2BXA3W4OiWPneRSw/GFFs7DJfcUV7qvN8WOCYg==
X-Received: by 2002:aca:4a45:: with SMTP id x66mr2667534oia.79.1624480952269;
        Wed, 23 Jun 2021 13:42:32 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l8sm181958ooo.13.2021.06.23.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 13:42:31 -0700 (PDT)
Date:   Wed, 23 Jun 2021 15:42:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
Message-ID: <YNOctRTGYZaSe6lw@yoga>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624433711-9339-2-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 23 Jun 02:35 CDT 2021, Can Guo wrote:

> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
> is_wlu_sys_suspended accordingly.
> 

This reflects what the change does, but the commit message is supposed
to capture "why".

Regards,
Bjorn

> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c |  2 +-
>  drivers/scsi/ufs/ufshcd.c   | 30 +++++++++++++++---------------
>  drivers/scsi/ufs/ufshcd.h   |  6 ++++--
>  3 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 9b1d18d..fbe21e0 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -641,7 +641,7 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	if (err)
>  		return err;
>  
> -	hba->is_sys_suspended = false;
> +	hba->is_wlu_sys_suspended = false;
>  	return 0;
>  }
>  
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 25fe18a..c40ba1d 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -549,8 +549,8 @@ static void ufshcd_print_host_state(struct ufs_hba *hba)
>  		hba->saved_err, hba->saved_uic_err);
>  	dev_err(hba->dev, "Device power mode=%d, UIC link state=%d\n",
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> -	dev_err(hba->dev, "PM in progress=%d, sys. suspended=%d\n",
> -		hba->pm_op_in_progress, hba->is_sys_suspended);
> +	dev_err(hba->dev, "wlu_pm_op_in_progress=%d, is_wlu_sys_suspended=%d\n",
> +		hba->wlu_pm_op_in_progress, hba->is_wlu_sys_suspended);
>  	dev_err(hba->dev, "Auto BKOPS=%d, Host self-block=%d\n",
>  		hba->auto_bkops_enabled, hba->host->host_self_blocked);
>  	dev_err(hba->dev, "Clk gate=%d\n", hba->clk_gating.state);
> @@ -1999,7 +1999,7 @@ static void ufshcd_clk_scaling_start_busy(struct ufs_hba *hba)
>  	if (!hba->clk_scaling.active_reqs++)
>  		queue_resume_work = true;
>  
> -	if (!hba->clk_scaling.is_enabled || hba->pm_op_in_progress) {
> +	if (!hba->clk_scaling.is_enabled || hba->wlu_pm_op_in_progress) {
>  		spin_unlock_irqrestore(hba->host->host_lock, flags);
>  		return;
>  	}
> @@ -2734,7 +2734,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
>  		 * err handler blocked for too long. So, just fail the scsi cmd
>  		 * sent from PM ops, err handler can recover PM error anyways.
>  		 */
> -		if (hba->pm_op_in_progress) {
> +		if (hba->wlu_pm_op_in_progress) {
>  			hba->force_reset = true;
>  			set_host_byte(cmd, DID_BAD_TARGET);
>  			cmd->scsi_done(cmd);
> @@ -2767,7 +2767,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
>  		(hba->clk_gating.state != CLKS_ON));
>  
>  	if (unlikely(test_bit(tag, &hba->outstanding_reqs))) {
> -		if (hba->pm_op_in_progress)
> +		if (hba->wlu_pm_op_in_progress)
>  			set_host_byte(cmd, DID_BAD_TARGET);
>  		else
>  			err = SCSI_MLQUEUE_HOST_BUSY;
> @@ -5116,7 +5116,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>  			 * solution could be to abort the system suspend if
>  			 * UFS device needs urgent BKOPs.
>  			 */
> -			if (!hba->pm_op_in_progress &&
> +			if (!hba->wlu_pm_op_in_progress &&
>  			    !ufshcd_eh_in_progress(hba) &&
>  			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
>  				/* Flushed in suspend */
> @@ -5916,7 +5916,7 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>  {
>  	ufshcd_rpm_get_sync(hba);
>  	if (pm_runtime_status_suspended(&hba->sdev_ufs_device->sdev_gendev) ||
> -	    hba->is_sys_suspended) {
> +	    hba->is_wlu_sys_suspended) {
>  		enum ufs_pm_op pm_op;
>  
>  		/*
> @@ -5933,7 +5933,7 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>  		if (!ufshcd_is_clkgating_allowed(hba))
>  			ufshcd_setup_clocks(hba, true);
>  		ufshcd_release(hba);
> -		pm_op = hba->is_sys_suspended ? UFS_SYSTEM_PM : UFS_RUNTIME_PM;
> +		pm_op = hba->is_wlu_sys_suspended ? UFS_SYSTEM_PM : UFS_RUNTIME_PM;
>  		ufshcd_vops_resume(hba, pm_op);
>  	} else {
>  		ufshcd_hold(hba, false);
> @@ -5976,7 +5976,7 @@ static void ufshcd_recover_pm_error(struct ufs_hba *hba)
>  	struct request_queue *q;
>  	int ret;
>  
> -	hba->is_sys_suspended = false;
> +	hba->is_wlu_sys_suspended = false;
>  	/*
>  	 * Set RPM status of wlun device to RPM_ACTIVE,
>  	 * this also clears its runtime error.
> @@ -8784,7 +8784,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	enum ufs_dev_pwr_mode req_dev_pwr_mode;
>  	enum uic_link_state req_link_state;
>  
> -	hba->pm_op_in_progress = true;
> +	hba->wlu_pm_op_in_progress = true;
>  	if (pm_op != UFS_SHUTDOWN_PM) {
>  		pm_lvl = pm_op == UFS_RUNTIME_PM ?
>  			 hba->rpm_lvl : hba->spm_lvl;
> @@ -8919,7 +8919,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		hba->clk_gating.is_suspended = false;
>  		ufshcd_release(hba);
>  	}
> -	hba->pm_op_in_progress = false;
> +	hba->wlu_pm_op_in_progress = false;
>  	return ret;
>  }
>  
> @@ -8928,7 +8928,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	int ret;
>  	enum uic_link_state old_link_state = hba->uic_link_state;
>  
> -	hba->pm_op_in_progress = true;
> +	hba->wlu_pm_op_in_progress = true;
>  
>  	/*
>  	 * Call vendor specific resume callback. As these callbacks may access
> @@ -9006,7 +9006,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
>  	hba->clk_gating.is_suspended = false;
>  	ufshcd_release(hba);
> -	hba->pm_op_in_progress = false;
> +	hba->wlu_pm_op_in_progress = false;
>  	return ret;
>  }
>  
> @@ -9072,7 +9072,7 @@ static int ufshcd_wl_suspend(struct device *dev)
>  
>  out:
>  	if (!ret)
> -		hba->is_sys_suspended = true;
> +		hba->is_wlu_sys_suspended = true;
>  	trace_ufshcd_wl_suspend(dev_name(dev), ret,
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
> @@ -9100,7 +9100,7 @@ static int ufshcd_wl_resume(struct device *dev)
>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
>  	if (!ret)
> -		hba->is_sys_suspended = false;
> +		hba->is_wlu_sys_suspended = false;
>  	up(&hba->host_sem);
>  	return ret;
>  }
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index c98d540..93aeeb3 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -752,7 +752,8 @@ struct ufs_hba {
>  	enum ufs_pm_level spm_lvl;
>  	struct device_attribute rpm_lvl_attr;
>  	struct device_attribute spm_lvl_attr;
> -	int pm_op_in_progress;
> +	/* A flag to tell whether __ufshcd_wl_suspend/resume() is in progress */
> +	bool wlu_pm_op_in_progress;
>  
>  	/* Auto-Hibernate Idle Timer register value */
>  	u32 ahit;
> @@ -838,7 +839,8 @@ struct ufs_hba {
>  
>  	struct devfreq *devfreq;
>  	struct ufs_clk_scaling clk_scaling;
> -	bool is_sys_suspended;
> +	/* A flag to tell whether the UFS device W-LU is system suspended */
> +	bool is_wlu_sys_suspended;
>  
>  	enum bkops_status urgent_bkops_lvl;
>  	bool is_urgent_bkops_lvl_checked;
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
