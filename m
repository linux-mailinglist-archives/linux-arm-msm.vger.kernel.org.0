Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AEA28A4CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 02:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgJKASt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 20:18:49 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:55670 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgJKASt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 20:18:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602375527; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GQIDbu7+fq9cMGVT0omtkeQCnmv9hNu0TbjGuYauBis=; b=frNCU2MP4HYnaK8F7r8bmWOpLlY3PGrJW2Jr9/rvtbk5/UuFmvyw3/C06qqbC9WFW2Ozjbq2
 pApc1wN3aCdVZhUuSkrLrbI6wuPRtiqLSOrN5PWGYCx5t6ME1FwdHoXvbuDx6Z8Upy/VX3Dn
 DZQtYLeiLnWwRN5o0r9sjEQNxBw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f824f36aad2c3cd1c8e7fc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 11 Oct 2020 00:17:58
 GMT
Sender: mgautam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2C59C433FF; Sun, 11 Oct 2020 00:17:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.8] (unknown [223.230.69.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBB27C433CB;
        Sun, 11 Oct 2020 00:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CBB27C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v1 10/10] bus: mhi: core: Mark device inactive soon after
 host issues a shutdown
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-11-git-send-email-bbhatt@codeaurora.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <0bdbe5b1-d26c-1bab-14d3-95015ee96e51@codeaurora.org>
Date:   Sun, 11 Oct 2020 05:47:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1600480955-16827-11-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/19/2020 7:32 AM, Bhaumik Bhatt wrote:
> Clients on the host may see the device in an active state for a short
> period of time after the host detects a device error or power down.

What scenario is referred as 'device error' here?
And power down is the non-graceful power_down by controller?

> Prevent any further host activity which could lead to race conditions
> or multiple callbacks to the controller or any timeouts seen by
> clients attempting to push data as they must be notified of the host
> intent sooner rather than later. This also allows the host and device
> states to be in sync with one another and prevents unnecessary host
> operations.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c |  4 ++++
>  drivers/bus/mhi/core/pm.c   | 31 +++++++++++++++++++------------
>  2 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1c8e332..5ec89e9 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -400,6 +400,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  
>  	 /* If device supports RDDM don't bother processing SYS error */
>  	if (mhi_cntrl->rddm_image) {
> +		/* host may be performing a device power down already */
> +		if (!mhi_is_active(mhi_cntrl))
> +			goto exit_intvec;
> +
>  		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>  			/* prevent clients from queueing any more packets */
>  			write_lock_irq(&mhi_cntrl->pm_lock);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 16c04ab..4e2cb41 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -469,15 +469,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	prev_state = mhi_cntrl->pm_state;
>  	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
> -	if (cur_state == transition_state) {
> -		mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> +	if (cur_state == MHI_PM_SYS_ERR_PROCESS)
>  		mhi_cntrl->dev_state = MHI_STATE_RESET;
> -	}
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
> -	/* Wake up threads waiting for state transition */
> -	wake_up_all(&mhi_cntrl->state_event);
> -
>  	if (cur_state != transition_state) {
>  		dev_err(dev, "Failed to transition to state: %s from: %s\n",
>  			to_mhi_pm_state_str(transition_state),
> @@ -486,6 +481,11 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  		return;
>  	}
>  
> +	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> +
> +	/* Wake up threads waiting for state transition */
> +	wake_up_all(&mhi_cntrl->state_event);
> +
>  	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
>  		u32 in_reset = -1;
> @@ -1051,22 +1051,29 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	enum dev_st_transition next_state = DEV_ST_TRANSITION_DISABLE;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
>  	if (!graceful) {
> -		mutex_lock(&mhi_cntrl->pm_mutex);
> -		write_lock_irq(&mhi_cntrl->pm_lock);
>  		cur_state = mhi_tryset_pm_state(mhi_cntrl,
>  						MHI_PM_LD_ERR_FATAL_DETECT);
> -		write_unlock_irq(&mhi_cntrl->pm_lock);
> -		mutex_unlock(&mhi_cntrl->pm_mutex);
> -		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT)
> +		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT) {
>  			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
>  				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
>  				to_mhi_pm_state_str(mhi_cntrl->pm_state));
> -		else
> +		} else {
>  			next_state = DEV_ST_TRANSITION_FATAL;
> +			wake_up_all(&mhi_cntrl->state_event);
> +		}
>  	}
>  
> +	/* mark device inactive to avoid any further host processing */
> +	mhi_cntrl->dev_state = MHI_STATE_RESET;
> +
> +	write_unlock_irq(&mhi_cntrl->pm_lock);
> +	mutex_unlock(&mhi_cntrl->pm_mutex);
> +
>  	mhi_queue_state_transition(mhi_cntrl, next_state);
>  
>  	/* Wait for shutdown to complete */

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

