Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C79128A4B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 02:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgJKAGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 20:06:51 -0400
Received: from z5.mailgun.us ([104.130.96.5]:14806 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbgJKAGv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 20:06:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602374809; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PLm07gyenvFKE2hyldXmWi5Ay9GONIO+F6L66GYVDeg=; b=ZZn6wcfWPWRt3XLEnyIIL1CZat/OW+5QI4Ub6TzqMsAuBv3/3AoAX0000wkpoRCc4QRw7r53
 xpnSA1Oj7373ZfPYfa42pYd35hpcC8B9Axro1kqJ9/dykpfwDBJi7DFOiVtQ+s9+iqVjQ9zC
 f9Yo15u+KtGArq/cG5LPF2NXUFs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f824c993711fec7b1a37257 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 11 Oct 2020 00:06:49
 GMT
Sender: mgautam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF262C433C9; Sun, 11 Oct 2020 00:06:48 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E371BC433F1;
        Sun, 11 Oct 2020 00:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E371BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v1 06/10] bus: mhi: core: Improve shutdown handling after
 link down detection
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-7-git-send-email-bbhatt@codeaurora.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <9aee66af-fcd2-9e25-f0b6-c4abbc4a4f63@codeaurora.org>
Date:   Sun, 11 Oct 2020 05:36:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1600480955-16827-7-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/19/2020 7:32 AM, Bhaumik Bhatt wrote:
> If MHI were to attempt a device shutdown following an assumption
> that the device is inaccessible, the host currently moves to a state
> where device register accesses are allowed when they should not be.
> This would end up allowing accesses to the device register space when
> the link is inaccessible and can result in bus errors observed on the
> host. Improve shutdown handling to prevent these outcomes and do not
> move the MHI PM state to a register accessible state after device is

Which state are you referring to when you say 'register accessible state'?
Would it be possible to provide more details on current handling here?


> assumed to be inaccessible.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c     |  1 +
>  drivers/bus/mhi/core/internal.h |  1 +
>  drivers/bus/mhi/core/pm.c       | 18 +++++++++++++-----
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 9ae4c19..fa33dde 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -37,6 +37,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
> +	[DEV_ST_TRANSITION_FATAL] = "FATAL SHUTDOWN",
>  };
>  
>  const char * const mhi_state_str[MHI_STATE_MAX] = {
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7989269..f3b9e5a 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -388,6 +388,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_MISSION_MODE,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_FATAL,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 3462d82..bce1f62 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -37,9 +37,10 @@
>   *     M0 -> FW_DL_ERR
>   *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
>   * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
> - * L2: SHUTDOWN_PROCESS -> DISABLE
> + * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
> + *     SHUTDOWN_PROCESS -> DISABLE
>   * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
> - *     LD_ERR_FATAL_DETECT -> SHUTDOWN_PROCESS
> + *     LD_ERR_FATAL_DETECT -> DISABLE
>   */
>  static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	/* L0 States */
> @@ -72,7 +73,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	{
>  		MHI_PM_M3,
>  		MHI_PM_M3_EXIT | MHI_PM_SYS_ERR_DETECT |
> -		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
> +		MHI_PM_LD_ERR_FATAL_DETECT
>  	},
>  	{
>  		MHI_PM_M3_EXIT,
> @@ -103,7 +104,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	/* L3 States */
>  	{
>  		MHI_PM_LD_ERR_FATAL_DETECT,
> -		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_SHUTDOWN_PROCESS
> +		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
>  	},
>  };
>  
> @@ -670,6 +671,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_pm_disable_transition
>  				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
>  			break;
> +		case DEV_ST_TRANSITION_FATAL:
> +			mhi_pm_disable_transition
> +				(mhi_cntrl, MHI_PM_LD_ERR_FATAL_DETECT);
> +			break;
>  		default:
>  			break;
>  		}
> @@ -1039,6 +1044,7 @@ EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  {
>  	enum mhi_pm_state cur_state;
> +	enum dev_st_transition next_state = DEV_ST_TRANSITION_DISABLE;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
> @@ -1053,9 +1059,11 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
>  				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
>  				to_mhi_pm_state_str(mhi_cntrl->pm_state));
> +		else
> +			next_state = DEV_ST_TRANSITION_FATAL;
>  	}
>  
> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
> +	mhi_queue_state_transition(mhi_cntrl, next_state);
>  
>  	/* Wait for shutdown to complete */
>  	flush_work(&mhi_cntrl->st_worker);

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

