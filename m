Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D30C1A22F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgDHN3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:29:34 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53221 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726921AbgDHN3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:29:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586352572; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zndax/ZRa+8YWitnJh99eSODrTXpUmFx1mf/Y4u5m50=; b=SPQZ1YBb+4yXHOb6a/MavOmqGLrKerec+eZXEV/kWXtVDkEk+6z+m7xTDoggkulKmgCEYZqM
 /sxxUCjnRUkIc4TyS2Qq4i8Z5xBURNFJeSThoPNSwGZsVZZRshPbPSJVJkrwtQJ13ycBIf9Q
 yVvEccfx7gudcrBjYdmS2/uip4o=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd1b0.7f40baedc688-smtp-out-n02;
 Wed, 08 Apr 2020 13:29:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2BEDAC43637; Wed,  8 Apr 2020 13:29:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 514CDC43636;
        Wed,  8 Apr 2020 13:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 514CDC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 09/10] drivers: qcom: rpmh-rsc: Caller handles
 tcs_invalidate() exclusivity
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.9.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <6b141a7a-8347-d1a2-b115-5baf0b788820@codeaurora.org>
Date:   Wed, 8 Apr 2020 18:59:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.9.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> Auditing tcs_invalidate() made me worried.  Specifically I saw that it
> used spin_lock(), not spin_lock_irqsave().  That always worries me
> unless I can trace for sure that I'm in the interrupt handler or that
> someone else already disabled interrupts.
>
> Looking more at it, there is actually no reason for these locks
> anyway.  Specifically the only reason you'd ever call
> rpmh_rsc_invalidate() is if you cared that the sleep/wake TCSes were
> empty.  That means that they need to continue to be empty even after
> rpmh_rsc_invalidate() returns.  The only way that can happen is if the
> caller already has done something to keep all other RPMH users out.
> It should be noted that even though the caller is only worried about
> making sleep/wake TCSes empty, they also need to worry about stopping
> active-only transfers if they need to handle the case where
> active-only transfers might borrow the wake TCS.
>
> At the moment rpmh_rsc_invalidate() is only called in PM code from the
> last CPU.  If that later changes the caller will still need to solve
> the above problems themselves, so these locks will never be useful.
>
> Continuing to audit tcs_invalidate(), I found a bug.  The function
> didn't properly check for a borrowed TCS if we hadn't recently written
> anything into the TCS.  Specifically, if we've never written to the
> WAKE_TCS (or we've flushed it recently) then tcs->slots is empty.
> We'll early-out and we'll never call tcs_is_free().
>
> I thought about fixing this bug by either deleting the early check for
> bitmap_empty() or possibly only doing it if we knew we weren't on a
> TCS that could be borrowed.  However, I think it's better to just
> delete the checks.
>
> As argued above it's up to the caller to make sure that all other
> users of RPMH are quiet before tcs_invalidate() is called.  Since
> callers need to handle the zero-active-TCS case anyway that means they
> need to make sure that make sure the active-only transfers are quiet

make sure is twice, can you please drop once.

need to make sure that the active-only.....

other than this.

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

> before calling too.  The one way tcs_invalidate() gets called today is
> through rpmh_rsc_cpu_pm_callback() which calls
> rpmh_rsc_ctrlr_is_busy() to handle this.  When we have another path to
> get to tcs_invalidate() it will also need to come up with something
> similar and it won't need this extra check either.  If we later find
> some code path that actually needs this check back in (and somehow
> manages to be race free) we can always add it back in.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Replaced ("irqsave()...") + ("...never -EBUSY") w/ ("Caller handles...")
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-internal.h |  2 +-
>   drivers/soc/qcom/rpmh-rsc.c      | 38 +++++++++++---------------------
>   drivers/soc/qcom/rpmh.c          |  5 +----
>   3 files changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> index f06350cbc9a2..dba8510c0669 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -132,7 +132,7 @@ struct rsc_drv {
>   int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg);
>   int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv,
>   			     const struct tcs_request *msg);
> -int rpmh_rsc_invalidate(struct rsc_drv *drv);
> +void rpmh_rsc_invalidate(struct rsc_drv *drv);
>   
>   void rpmh_tx_done(const struct tcs_request *msg, int r);
>   int rpmh_flush(struct rpmh_ctrlr *ctrlr);
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 10c026b2e1bc..a3b015196f15 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -198,50 +198,38 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>    * This will clear the "slots" variable of the given tcs_group and also
>    * tell the hardware to forget about all entries.
>    *
> - * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
> - *         bit. Caller should make sure to enable interrupts between tries.
> + * The caller must ensure that no other RPMH actions are happening when this
> + * function is called, since otherwise the device may immediately become
> + * used again even before this function exits.
>    */
> -static int tcs_invalidate(struct rsc_drv *drv, int type)
> +static void tcs_invalidate(struct rsc_drv *drv, int type)
>   {
>   	int m;
>   	struct tcs_group *tcs = &drv->tcs[type];
>   
> -	spin_lock(&tcs->lock);
> -	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
> -		spin_unlock(&tcs->lock);
> -		return 0;
> -	}
> +	/* Caller ensures nobody else is running so no lock */
> +	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS))
> +		return;
>   
>   	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
> -		if (!tcs_is_free(drv, m)) {
> -			spin_unlock(&tcs->lock);
> -			return -EAGAIN;
> -		}
>   		write_tcs_reg_sync(drv, RSC_DRV_CMD_ENABLE, m, 0);
>   		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0);
>   	}
>   	bitmap_zero(tcs->slots, MAX_TCS_SLOTS);
> -	spin_unlock(&tcs->lock);
> -
> -	return 0;
>   }
>   
>   /**
>    * rpmh_rsc_invalidate() - Invalidate sleep and wake TCSes.
>    * @drv: The RSC controller.
>    *
> - * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
> - *         bit. Caller should make sure to enable interrupts between tries.
> + * The caller must ensure that no other RPMH actions are happening when this
> + * function is called, since otherwise the device may immediately become
> + * used again even before this function exits.
>    */
> -int rpmh_rsc_invalidate(struct rsc_drv *drv)
> +void rpmh_rsc_invalidate(struct rsc_drv *drv)
>   {
> -	int ret;
> -
> -	ret = tcs_invalidate(drv, SLEEP_TCS);
> -	if (!ret)
> -		ret = tcs_invalidate(drv, WAKE_TCS);
> -
> -	return ret;
> +	tcs_invalidate(drv, SLEEP_TCS);
> +	tcs_invalidate(drv, WAKE_TCS);
>   }
>   
>   /**
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 88f88015ef03..02171c192aa1 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -439,7 +439,6 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>    *
>    * Return:
>    * * 0          - Success
> - * * -EAGAIN    - Retry again
>    * * Error code - Otherwise
>    */
>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
> @@ -453,9 +452,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>   	}
>   
>   	/* Invalidate the TCSes first to avoid stale data */
> -	ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
> -	if (ret)
> -		return ret;
> +	rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
>   
>   	/* First flush the cached batch requests */
>   	ret = flush_batch(ctrlr);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
