Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF33F508A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 20:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhHWSoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 14:44:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62565 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhHWSoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 14:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629744215; x=1661280215;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=l3BuDyALSNXMVLCHv9r8ynYhlNyHsnWaTDrJJMRqkE0=;
  b=RWVf9gj1dN7RHb23tFPygRUIeSdJDoseISUrWguX4Pp5OgPmnlUDkDa6
   W+PFmBLj6tbiSnS2vJlPSgfmKcXV8i4c452EYwjeVvfZBje7JPTkdNDAx
   6SuOzvv4iOEVEp+TlK8g/TOG1fueOH30dQtP65v9rPekiEPFuu0RTJone
   g=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Aug 2021 11:43:33 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 11:43:33 -0700
Received: from [10.226.59.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7; Mon, 23 Aug 2021
 11:43:31 -0700
Subject: Re: [PATCH v6 3/4] bus: mhi: core: Process execution environment
 changes serially
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
        <carl.yin@quectel.com>, <naveen.kumar@quectel.com>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <899da888-321a-c228-8537-b72821700dc7@quicinc.com>
Date:   Mon, 23 Aug 2021 12:43:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03f.na.qualcomm.com (10.85.0.47) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/24/2021 4:23 PM, Bhaumik Bhatt wrote:
> In current design, whenever the BHI interrupt is fired, the
> execution environment is updated. This can cause race conditions
> and impede ongoing power up/down processing. For example, if a
> power down is in progress, MHI host updates to a local "disabled"
> execution environment. If a BHI interrupt fires later, that value
> gets replaced with one from the BHI EE register. This impacts the
> controller as it does not expect multiple RDDM execution
> environment change status callbacks as an example. Another issue
> would be that the device can enter mission mode and the execution
> environment is updated, while device creation for SBL channels is
> still going on due to slower PM state worker thread run, leading
> to multiple attempts at opening the same channel.
> 
> Ensure that EE changes are handled only from appropriate places
> and occur one after another and handle only PBL modes or RDDM EE
> changes as critical events directly from the interrupt handler.
> Simplify handling by waiting for SYS ERROR before handling RDDM.
> This also makes sure that we use the correct execution environment
> to notify the controller driver when the device resets to one of
> the PBL execution environments.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

<snip>

> @@ -452,27 +451,30 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>   	}
>   	write_unlock_irq(&mhi_cntrl->pm_lock);
>   
> -	 /* If device supports RDDM don't bother processing SYS error */
> -	if (mhi_cntrl->rddm_image) {
> -		/* host may be performing a device power down already */
> -		if (!mhi_is_active(mhi_cntrl))
> -			goto exit_intvec;
> +	if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
> +		goto exit_intvec;
>   
> -		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
> +	switch (ee) {
> +	case MHI_EE_RDDM:
> +		/* proceed if power down is not already in progress */
> +		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
>   			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
> +			mhi_cntrl->ee = ee;
>   			wake_up_all(&mhi_cntrl->state_event);
>   		}
> -		goto exit_intvec;
> -	}
> -
> -	if (pm_state == MHI_PM_SYS_ERR_DETECT) {
> +		break;
> +	case MHI_EE_PBL:
> +	case MHI_EE_EDL:
> +	case MHI_EE_PTHRU:
> +		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
> +		mhi_cntrl->ee = ee;
>   		wake_up_all(&mhi_cntrl->state_event);
> -
> -		/* For fatal errors, we let controller decide next step */
> -		if (MHI_IN_PBL(ee))
> -			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
> -		else
> -			mhi_pm_sys_err_handler(mhi_cntrl);
> +		mhi_pm_sys_err_handler(mhi_cntrl);
> +		break;
> +	default:
> +		wake_up_all(&mhi_cntrl->state_event);
> +		mhi_pm_sys_err_handler(mhi_cntrl);
> +		break;
>   	}

Bhaumik, can you explain the above change?  Before this patch (which is 
now committed), if there was a fatal error, the controller was notified 
(MHI_CB_FATAL_ERROR) and it decided all action.  After this patch, the 
controller is notified, but also the core attempts to handle the syserr.

This is a change in behavior, and seems to make a mess of the 
controller, and possibly the core fighting each other.

Specifically, I'm rebasing the AIC100 driver onto 5.13, which has this 
change, and I'm seeing a serious regression.  I'm thinking that for the 
PBL/EDL/PTHRU case, mhi_pm_sys_err_handler() should not be called.

Thoughts?
