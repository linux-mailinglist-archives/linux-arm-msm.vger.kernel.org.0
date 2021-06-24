Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53093B24B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 04:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhFXCGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 22:06:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33316 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229886AbhFXCGr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 22:06:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624500269; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vp3PxZ5rDOzWC5T16yiSVANkQ83ie3FltCd/t04sKoY=;
 b=XEgscswfbTqZtkX1DWVZtkqaQLBOpTwS32QDTlw8BJFHRr/Z0EazMKmSgo2aJNnrkxLTfyZN
 lcuzrZM2lTyzi28eTlquEmn6her0+lKS5BU1uFok8xgt9dy/3RclygBwOj+4ehhlAeDWvrSK
 4Ihm3U/uRtIXmk70Mm6UDvqvV18=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60d3e81f2a2a9a9761fb2189 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 02:04:15
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7095C4360C; Thu, 24 Jun 2021 02:04:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E29BC433F1;
        Thu, 24 Jun 2021 02:04:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Jun 2021 10:04:13 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
In-Reply-To: <YNOctRTGYZaSe6lw@yoga>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
 <YNOctRTGYZaSe6lw@yoga>
Message-ID: <4722f805b823e6550188ef0ef9d564bc@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-06-24 04:42, Bjorn Andersson wrote:
> On Wed 23 Jun 02:35 CDT 2021, Can Guo wrote:
> 
>> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress 
>> and
>> is_wlu_sys_suspended accordingly.
>> 
> 
> This reflects what the change does, but the commit message is supposed
> to capture "why".
> 

Sure, I will add the "why" in next ver.

Thanks,

Can Guo.

> Regards,
> Bjorn
> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>  drivers/scsi/ufs/ufs-qcom.c |  2 +-
>>  drivers/scsi/ufs/ufshcd.c   | 30 +++++++++++++++---------------
>>  drivers/scsi/ufs/ufshcd.h   |  6 ++++--
>>  3 files changed, 20 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
>> index 9b1d18d..fbe21e0 100644
>> --- a/drivers/scsi/ufs/ufs-qcom.c
>> +++ b/drivers/scsi/ufs/ufs-qcom.c
>> @@ -641,7 +641,7 @@ static int ufs_qcom_resume(struct ufs_hba *hba, 
>> enum ufs_pm_op pm_op)
>>  	if (err)
>>  		return err;
>> 
>> -	hba->is_sys_suspended = false;
>> +	hba->is_wlu_sys_suspended = false;
>>  	return 0;
>>  }
>> 
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> index 25fe18a..c40ba1d 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -549,8 +549,8 @@ static void ufshcd_print_host_state(struct ufs_hba 
>> *hba)
>>  		hba->saved_err, hba->saved_uic_err);
>>  	dev_err(hba->dev, "Device power mode=%d, UIC link state=%d\n",
>>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
>> -	dev_err(hba->dev, "PM in progress=%d, sys. suspended=%d\n",
>> -		hba->pm_op_in_progress, hba->is_sys_suspended);
>> +	dev_err(hba->dev, "wlu_pm_op_in_progress=%d, 
>> is_wlu_sys_suspended=%d\n",
>> +		hba->wlu_pm_op_in_progress, hba->is_wlu_sys_suspended);
>>  	dev_err(hba->dev, "Auto BKOPS=%d, Host self-block=%d\n",
>>  		hba->auto_bkops_enabled, hba->host->host_self_blocked);
>>  	dev_err(hba->dev, "Clk gate=%d\n", hba->clk_gating.state);
>> @@ -1999,7 +1999,7 @@ static void ufshcd_clk_scaling_start_busy(struct 
>> ufs_hba *hba)
>>  	if (!hba->clk_scaling.active_reqs++)
>>  		queue_resume_work = true;
>> 
>> -	if (!hba->clk_scaling.is_enabled || hba->pm_op_in_progress) {
>> +	if (!hba->clk_scaling.is_enabled || hba->wlu_pm_op_in_progress) {
>>  		spin_unlock_irqrestore(hba->host->host_lock, flags);
>>  		return;
>>  	}
>> @@ -2734,7 +2734,7 @@ static int ufshcd_queuecommand(struct Scsi_Host 
>> *host, struct scsi_cmnd *cmd)
>>  		 * err handler blocked for too long. So, just fail the scsi cmd
>>  		 * sent from PM ops, err handler can recover PM error anyways.
>>  		 */
>> -		if (hba->pm_op_in_progress) {
>> +		if (hba->wlu_pm_op_in_progress) {
>>  			hba->force_reset = true;
>>  			set_host_byte(cmd, DID_BAD_TARGET);
>>  			cmd->scsi_done(cmd);
>> @@ -2767,7 +2767,7 @@ static int ufshcd_queuecommand(struct Scsi_Host 
>> *host, struct scsi_cmnd *cmd)
>>  		(hba->clk_gating.state != CLKS_ON));
>> 
>>  	if (unlikely(test_bit(tag, &hba->outstanding_reqs))) {
>> -		if (hba->pm_op_in_progress)
>> +		if (hba->wlu_pm_op_in_progress)
>>  			set_host_byte(cmd, DID_BAD_TARGET);
>>  		else
>>  			err = SCSI_MLQUEUE_HOST_BUSY;
>> @@ -5116,7 +5116,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, 
>> struct ufshcd_lrb *lrbp)
>>  			 * solution could be to abort the system suspend if
>>  			 * UFS device needs urgent BKOPs.
>>  			 */
>> -			if (!hba->pm_op_in_progress &&
>> +			if (!hba->wlu_pm_op_in_progress &&
>>  			    !ufshcd_eh_in_progress(hba) &&
>>  			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
>>  				/* Flushed in suspend */
>> @@ -5916,7 +5916,7 @@ static void ufshcd_err_handling_prepare(struct 
>> ufs_hba *hba)
>>  {
>>  	ufshcd_rpm_get_sync(hba);
>>  	if (pm_runtime_status_suspended(&hba->sdev_ufs_device->sdev_gendev) 
>> ||
>> -	    hba->is_sys_suspended) {
>> +	    hba->is_wlu_sys_suspended) {
>>  		enum ufs_pm_op pm_op;
>> 
>>  		/*
>> @@ -5933,7 +5933,7 @@ static void ufshcd_err_handling_prepare(struct 
>> ufs_hba *hba)
>>  		if (!ufshcd_is_clkgating_allowed(hba))
>>  			ufshcd_setup_clocks(hba, true);
>>  		ufshcd_release(hba);
>> -		pm_op = hba->is_sys_suspended ? UFS_SYSTEM_PM : UFS_RUNTIME_PM;
>> +		pm_op = hba->is_wlu_sys_suspended ? UFS_SYSTEM_PM : UFS_RUNTIME_PM;
>>  		ufshcd_vops_resume(hba, pm_op);
>>  	} else {
>>  		ufshcd_hold(hba, false);
>> @@ -5976,7 +5976,7 @@ static void ufshcd_recover_pm_error(struct 
>> ufs_hba *hba)
>>  	struct request_queue *q;
>>  	int ret;
>> 
>> -	hba->is_sys_suspended = false;
>> +	hba->is_wlu_sys_suspended = false;
>>  	/*
>>  	 * Set RPM status of wlun device to RPM_ACTIVE,
>>  	 * this also clears its runtime error.
>> @@ -8784,7 +8784,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba 
>> *hba, enum ufs_pm_op pm_op)
>>  	enum ufs_dev_pwr_mode req_dev_pwr_mode;
>>  	enum uic_link_state req_link_state;
>> 
>> -	hba->pm_op_in_progress = true;
>> +	hba->wlu_pm_op_in_progress = true;
>>  	if (pm_op != UFS_SHUTDOWN_PM) {
>>  		pm_lvl = pm_op == UFS_RUNTIME_PM ?
>>  			 hba->rpm_lvl : hba->spm_lvl;
>> @@ -8919,7 +8919,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba 
>> *hba, enum ufs_pm_op pm_op)
>>  		hba->clk_gating.is_suspended = false;
>>  		ufshcd_release(hba);
>>  	}
>> -	hba->pm_op_in_progress = false;
>> +	hba->wlu_pm_op_in_progress = false;
>>  	return ret;
>>  }
>> 
>> @@ -8928,7 +8928,7 @@ static int __ufshcd_wl_resume(struct ufs_hba 
>> *hba, enum ufs_pm_op pm_op)
>>  	int ret;
>>  	enum uic_link_state old_link_state = hba->uic_link_state;
>> 
>> -	hba->pm_op_in_progress = true;
>> +	hba->wlu_pm_op_in_progress = true;
>> 
>>  	/*
>>  	 * Call vendor specific resume callback. As these callbacks may 
>> access
>> @@ -9006,7 +9006,7 @@ static int __ufshcd_wl_resume(struct ufs_hba 
>> *hba, enum ufs_pm_op pm_op)
>>  		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
>>  	hba->clk_gating.is_suspended = false;
>>  	ufshcd_release(hba);
>> -	hba->pm_op_in_progress = false;
>> +	hba->wlu_pm_op_in_progress = false;
>>  	return ret;
>>  }
>> 
>> @@ -9072,7 +9072,7 @@ static int ufshcd_wl_suspend(struct device *dev)
>> 
>>  out:
>>  	if (!ret)
>> -		hba->is_sys_suspended = true;
>> +		hba->is_wlu_sys_suspended = true;
>>  	trace_ufshcd_wl_suspend(dev_name(dev), ret,
>>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
>> @@ -9100,7 +9100,7 @@ static int ufshcd_wl_resume(struct device *dev)
>>  		ktime_to_us(ktime_sub(ktime_get(), start)),
>>  		hba->curr_dev_pwr_mode, hba->uic_link_state);
>>  	if (!ret)
>> -		hba->is_sys_suspended = false;
>> +		hba->is_wlu_sys_suspended = false;
>>  	up(&hba->host_sem);
>>  	return ret;
>>  }
>> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
>> index c98d540..93aeeb3 100644
>> --- a/drivers/scsi/ufs/ufshcd.h
>> +++ b/drivers/scsi/ufs/ufshcd.h
>> @@ -752,7 +752,8 @@ struct ufs_hba {
>>  	enum ufs_pm_level spm_lvl;
>>  	struct device_attribute rpm_lvl_attr;
>>  	struct device_attribute spm_lvl_attr;
>> -	int pm_op_in_progress;
>> +	/* A flag to tell whether __ufshcd_wl_suspend/resume() is in 
>> progress */
>> +	bool wlu_pm_op_in_progress;
>> 
>>  	/* Auto-Hibernate Idle Timer register value */
>>  	u32 ahit;
>> @@ -838,7 +839,8 @@ struct ufs_hba {
>> 
>>  	struct devfreq *devfreq;
>>  	struct ufs_clk_scaling clk_scaling;
>> -	bool is_sys_suspended;
>> +	/* A flag to tell whether the UFS device W-LU is system suspended */
>> +	bool is_wlu_sys_suspended;
>> 
>>  	enum bkops_status urgent_bkops_lvl;
>>  	bool is_urgent_bkops_lvl_checked;
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
>> Linux Foundation Collaborative Project.
>> 
