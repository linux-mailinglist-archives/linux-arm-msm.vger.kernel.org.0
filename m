Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C97E1ABE82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 12:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505702AbgDPK4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 06:56:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:60138 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505583AbgDPKvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 06:51:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587034292; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qdafRHsCwt2NymhXTwmhoWCd46MiQ96omLlRHjYgPoM=; b=Ouy/TyU2cYJ46TxxlsSKSJibkEpIrt3Z1ZC+255Vos6wXD3KmHUCMNJemuV1zgUOzOMRygQv
 u+Ie6iKG1E4YmXEsITK0r50UVZgOgoQI62XkHWYo3S3meVnvU9tUukPNv30mdnEcEw5pzCxj
 JU8wvB+ytvQiWDjIniQfd8d2bTo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9838b4.7f78049a09d0-smtp-out-n01;
 Thu, 16 Apr 2020 10:51:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08B4AC433BA; Thu, 16 Apr 2020 10:51:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.191.226])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9777C433CB;
        Thu, 16 Apr 2020 10:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9777C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Remove the pm_lock
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200414102312.1.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <4cf5c74a-44c0-190d-e752-a46ccd5cda7d@codeaurora.org>
Date:   Thu, 16 Apr 2020 16:21:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414102312.1.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/14/2020 10:53 PM, Douglas Anderson wrote:
> It has been postulated that the pm_lock is bad for performance because
> a CPU currently running rpmh_flush() could block other CPUs from
> coming out of idle.  Similarly CPUs coming out of / going into idle
> all need to contend with each other for the spinlock just to update
> the variable tracking who's in PM.
>
> Let's optimize this a bit.  Specifically:
>
> - Use a count rather than a bitmask.  This is faster to access and
>    also means we can use the atomic_inc_return() function to really
>    detect who the last one to enter PM was.
> - Accept that it's OK if we race and are doing the flush (because we
>    think we're last) while another CPU is coming out of idle.  As long
>    as we block that CPU if/when it tries to do an active-only transfer
>    we're OK.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>   drivers/soc/qcom/rpmh-internal.h |  7 ++---
>   drivers/soc/qcom/rpmh-rsc.c      | 46 +++++++++++++++-----------------
>   2 files changed, 24 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> index dba8510c0669..449cd511702b 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -97,7 +97,7 @@ struct rpmh_ctrlr {
>    * @num_tcs:            Number of TCSes in this DRV.
>    * @rsc_pm:             CPU PM notifier for controller.
>    *                      Used when solver mode is not present.
> - * @cpus_entered_pm:    CPU mask for cpus in idle power collapse.
> + * @cpus_in_pm:         Number of CPUs not in idle power collapse.
>    *                      Used when solver mode is not present.
>    * @tcs:                TCS groups.
>    * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
> @@ -111,8 +111,6 @@ struct rpmh_ctrlr {
>    *                      grabbing this lock and a tcs_lock at the same time,
>    *                      grab the tcs_lock first so we always have a
>    *                      consistent lock ordering.
> - * @pm_lock:            Synchronize during PM notifications.
> - *                      Used when solver mode is not present.
>    * @client:             Handle to the DRV's client.
>    */
>   struct rsc_drv {
> @@ -121,11 +119,10 @@ struct rsc_drv {
>   	int id;
>   	int num_tcs;
>   	struct notifier_block rsc_pm;
> -	struct cpumask cpus_entered_pm;
> +	atomic_t cpus_in_pm;
>   	struct tcs_group tcs[TCS_TYPE_NR];
>   	DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
>   	spinlock_t lock;
> -	spinlock_t pm_lock;
>   	struct rpmh_ctrlr client;
>   };
>   
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 732316bb67dc..4e45a8ac6cde 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -740,6 +740,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>    * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
>    * power collapse, so deny from the last cpu's pm notification.
>    *
> + * Context: Must be called with the drv->lock held.
> + *
>    * Return:
>    * * False		- AMCs are idle
>    * * True		- AMCs are busy
> @@ -754,9 +756,6 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>   	 * dedicated TCS for active state use, then re-purposed wake TCSes
>   	 * should be checked for not busy, because we used wake TCSes for
>   	 * active requests in this case.
> -	 *
> -	 * Since this is called from the last cpu, need not take drv or tcs
> -	 * lock before checking tcs_is_free().
>   	 */
>   	if (!tcs->num_tcs)
>   		tcs = &drv->tcs[WAKE_TCS];
> @@ -791,36 +790,36 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>   {
>   	struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
>   	int ret = NOTIFY_OK;
> -
> -	spin_lock(&drv->pm_lock);
> +	int cpus_in_pm;
>   
>   	switch (action) {
>   	case CPU_PM_ENTER:
> -		cpumask_set_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> -
> -		if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
> -			goto exit;
> +		cpus_in_pm = atomic_inc_return(&drv->cpus_in_pm);
> +		if (cpus_in_pm < num_online_cpus())
> +			return NOTIFY_OK;
>   		break;
>   	case CPU_PM_ENTER_FAILED:
>   	case CPU_PM_EXIT:
> -		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> -		goto exit;
> -	}
> -
> -	ret = rpmh_rsc_ctrlr_is_busy(drv);
> -	if (ret) {
> -		ret = NOTIFY_BAD;
> -		goto exit;
> +		atomic_dec(&drv->cpus_in_pm);
> +		return NOTIFY_OK;
>   	}
>   
> -	ret = rpmh_flush(&drv->client);
> -	if (ret)
> +	/*
> +	 * It's likely we're on the last CPU. Grab the drv->lock and write
> +	 * out the sleep/wake commands to RPMH hardware. Grabbing the lock
> +	 * means that if we race with another CPU coming up we are still
> +	 * guaranteed to be safe. If another CPU came up just after we checked
> +	 * and has already started an active transfer then we'll notice we're
> +	 * busy and abort. If another CPU comes up after we start flushing it
> +	 * will be blocked from starting an active transfer until we're done
> +	 * flushing. If another CPU starts an active transfer after we release
> +	 * the lock we're still OK because we're no longer the last CPU.
> +	 */
> +	spin_lock(&drv->lock);
> +	if (rpmh_rsc_ctrlr_is_busy(drv) || !rpmh_flush(&drv->client))
>   		ret = NOTIFY_BAD;
> -	else
> -		ret = NOTIFY_OK;
> +	spin_unlock(&drv->lock);
>   
> -exit:
> -	spin_unlock(&drv->pm_lock);
>   	return ret;
>   }
There is a race if we allow other CPUs to exit without pm lock
below scenarios can happen.

1. for the last cpu (CPU-x) CPU_PM_ENTER notification came
2. On CPU-x, rpmh_flush() is in progress with drv->lock held, which is 
at the flush_batch() stage
3. Meanwhile any other CPU (CPU-y) woken up and did CPU_PM_EXIT
4. From the woken up cpu, rpmh_invalidate() is invoked.
5. It takes ctrlr->cache_lock and empties the cached batch requests 
(making list empty and kfree() the cached requests)
6. The last cpu (CPU-x) which was doing rpmh_flush() suddently gets the 
list empty which it was traversing in flush_batch(),
    leading to null pointer derefence.

To Fix above race condtion, ctrlr->cache_lock should be taken inside 
rpmh_flush() starting point.
also need to remove lockdep_assert_irqs_disabled() which got insterted, 
since IRQ might be enabled by this time if some CPU exits.

Thanks,
Maulik

>   
> @@ -964,7 +963,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>   	solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
>   	if (!solver_config) {
>   		drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
> -		spin_lock_init(&drv->pm_lock);
>   		cpu_pm_register_notifier(&drv->rsc_pm);
>   	}
>   

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
