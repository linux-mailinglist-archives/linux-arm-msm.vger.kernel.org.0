Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029582A2FE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 17:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgKBQel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 11:34:41 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:22527 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgKBQek (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 11:34:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604334879; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qoHSfxYPyQkbDeavIuA2orpDrUmLrd6gFSt6I1Q8VVk=;
 b=eLlSyA8PCZsiGRD1FpJRqsjAhU3G7RHJq0oQ1Lb4uc6iAu5mcHzcf1udGoPvUDSF/8A8sVQl
 h0J7D4IO7chnAo+LjGuIVWfOf7AmcERgnmu+IAmko22LxQ+QZnfQxZiPtuGcXSMcHpAFTwZJ
 JaZxETZBgfps2WIpzakOAh4kOFk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa035089f889442bb7ef325 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 16:34:16
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0427C433F0; Mon,  2 Nov 2020 16:34:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACBD0C433C6;
        Mon,  2 Nov 2020 16:34:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Nov 2020 08:34:14 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     carl.yin@quectel.com
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, naveen.kumar@quectel.com
Subject: Re: [PATCH v2] bus: mhi: core: Add support MHI EE FP for download
 firmware
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201102122756.23452-1-carl.yin@quectel.com>
References: <20201102122756.23452-1-carl.yin@quectel.com>
Message-ID: <9693bd0918956ec489fec9d2b36cb4d6@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-02 04:27, carl.yin@quectel.com wrote:
> From: "carl.yin" <carl.yin@quectel.com>
> 
> MHI wwan modems support download firmware to nand or emmc
> by firehose protocol, process as next:
> 1. modem boot up and enter EE AMSS, create DIAG channels (4, 5) device
> 2. user space tool send EDL command via DIAG channel,
>    then modem enter EE EDL
> 3. boot.c download 'flash programmer image' via BHI interface
> 4. modem enter EE FP, and create EDL channels (34, 35) device
> 5. user space tool download 'firmware image' to modem via EDL channels
>    by firehose protocol
> 
> Signed-off-by: carl.yin <carl.yin@quectel.com>
> ---
>  drivers/bus/mhi/core/init.c     |  2 ++
>  drivers/bus/mhi/core/internal.h |  1 +
>  drivers/bus/mhi/core/main.c     |  5 ++++-
>  drivers/bus/mhi/core/pm.c       | 13 ++++++++++++-
>  include/linux/mhi.h             |  4 +++-
>  5 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index ac4aa5c..e34616b 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -26,6 +26,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
>  	[MHI_EE_WFW] = "WFW",
>  	[MHI_EE_PTHRU] = "PASS THRU",
>  	[MHI_EE_EDL] = "EDL",
> +	[MHI_EE_FP] = "FLASH PROGRAMMER",
>  	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
>  	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
>  };
> @@ -35,6 +36,7 @@ const char * const
> dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>  	[DEV_ST_TRANSITION_READY] = "READY",
>  	[DEV_ST_TRANSITION_SBL] = "SBL",
>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
> +	[DEV_ST_TRANSITION_FP] = "FLASH_PROGRAMMER",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>  };
> diff --git a/drivers/bus/mhi/core/internal.h 
> b/drivers/bus/mhi/core/internal.h
> index 4abf0cf..6ae897a 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -386,6 +386,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_READY,
>  	DEV_ST_TRANSITION_SBL,
>  	DEV_ST_TRANSITION_MISSION_MODE,
> +	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
>  	DEV_ST_TRANSITION_MAX,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 3950792..a1e1561 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -422,7 +422,7 @@ irqreturn_t mhi_intvec_threaded_handler(int
> irq_number, void *priv)
>  		wake_up_all(&mhi_cntrl->state_event);
> 
>  		/* For fatal errors, we let controller decide next step */
> -		if (MHI_IN_PBL(ee))
> +		if (MHI_IN_PBL(mhi_cntrl->ee))
Let's please have this as a separate patch with a fixes tag, as it fixes 
a
pre-existing bug. I am sure Mani would want this.
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>  		else
>  			mhi_pm_sys_err_handler(mhi_cntrl);
> @@ -782,6 +782,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller
> *mhi_cntrl,
>  			case MHI_EE_SBL:
>  				st = DEV_ST_TRANSITION_SBL;
>  				break;
> +			case MHI_EE_FP:
> +				st = DEV_ST_TRANSITION_FP;
> +				break;
When do you get this EE event on the control event ring? Does it come by 
after you
have detected EE as FP from mhi_sync_power_up() and move to ready and 
then M0?
>  			case MHI_EE_WFW:
>  			case MHI_EE_AMSS:
>  				st = DEV_ST_TRANSITION_MISSION_MODE;
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 3de7b16..2d68812 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -658,6 +658,12 @@ void mhi_pm_st_worker(struct work_struct *work)
>  		case DEV_ST_TRANSITION_MISSION_MODE:
>  			mhi_pm_mission_mode_transition(mhi_cntrl);
>  			break;
> +		case DEV_ST_TRANSITION_FP:
> +			write_lock_irq(&mhi_cntrl->pm_lock);
> +			mhi_cntrl->ee = MHI_EE_FP;
> +			write_unlock_irq(&mhi_cntrl->pm_lock);
> +			mhi_create_devices(mhi_cntrl);
> +			break;
>  		case DEV_ST_TRANSITION_READY:
>  			mhi_ready_state_transition(mhi_cntrl);
>  			break;
> @@ -1077,10 +1083,15 @@ int mhi_sync_power_up(struct mhi_controller 
> *mhi_cntrl)
> 
>  	wait_event_timeout(mhi_cntrl->state_event,
>  			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> +			   mhi_cntrl->ee == MHI_EE_FP ||
>  			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>  			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
> 
> -	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> +	if (mhi_cntrl->ee == MHI_EE_FP)
> +		mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_READY);
> +	else
> +		ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> +
>  	if (ret)
>  		mhi_power_down(mhi_cntrl, false);
> 
We should come up with a better design for this later on.
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 6e1122c..4620af8 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -120,6 +120,7 @@ struct mhi_link_info {
>   * @MHI_EE_WFW: WLAN firmware mode
>   * @MHI_EE_PTHRU: Passthrough
>   * @MHI_EE_EDL: Embedded downloader
> + * @MHI_EE_FP, Flash Programmer Environment
>   */
>  enum mhi_ee_type {
>  	MHI_EE_PBL,
> @@ -129,7 +130,8 @@ enum mhi_ee_type {
>  	MHI_EE_WFW,
>  	MHI_EE_PTHRU,
>  	MHI_EE_EDL,
> -	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
> +	MHI_EE_FP,
> +	MHI_EE_MAX_SUPPORTED = MHI_EE_FP,
>  	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
>  	MHI_EE_NOT_SUPPORTED,
>  	MHI_EE_MAX,

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
