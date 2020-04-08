Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52BC81A1FCC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 13:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgDHLZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 07:25:28 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:56277 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728205AbgDHLZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 07:25:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586345126; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RT+LWMcqc4ZXjEIhWtqLWl41RKq56zQnARcnH9LzoYA=; b=CPtRBbrtfI8Ee9sy+31J9b2M4N7oX57OtXK4f9Gmu2QXrD1JsKhbKRGCd1dMmKTOEYJ1v76f
 KNvexIalzyZBcIH+XkwMfyKugFeDRxCqVyJ83cQZK/YuBAeBYROoHI+RZ7AgwUJ1fjzT1Vg0
 HJl83i5hnAMm3dxWw4nKE5H43sc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8db49d.7f06d128af80-smtp-out-n01;
 Wed, 08 Apr 2020 11:25:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 997FCC433F2; Wed,  8 Apr 2020 11:25:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E276CC433D2;
        Wed,  8 Apr 2020 11:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E276CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 06/10] drivers: qcom: rpmh-rsc: A lot of comments
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.6.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <34f3f5a8-18b0-5593-b4e9-ff9eb0c39bb8@codeaurora.org>
Date:   Wed, 8 Apr 2020 16:55:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.6.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> I've been pouring through the rpmh-rsc code and trying to understand
> it.  Document everything to the best of my ability.  All documentation
> here is strictly from code analysis--no actual knowledge of the
> hardware was used.  If something is wrong in here I either
> misunderstood the code, had a typo, or the code has a bug in it
> leading to my incorrect understanding.
>
> In a few places here I have documented things that don't make tons of
> sense.  A future patch will try to address this.  While this means I'm
> adding comments / todos and then later fixing them in the series, it
> seemed more urgent to get things documented first so that people could
> understand the later patches.
>
> Any comments I adjusted I also tried to make match kernel-doc better.
> Specifically:
> - kernel-doc says do not leave a blank line between the function
>    description and the arguments
> - kernel-doc examples always have things starting w/ a capital and
>    ending with a period.
>
> This should be a no-op.  It's just comment changes.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Adjusted comments for rpmh_rsc_write_ctrl_data().
> - Comments for new enable_tcs_irq() function.
> - Comments for new rpmh_rsc_cpu_pm_callback() function.
> - Mention in message that I also fixed up kernel-doc stuff.
> - Moved comments patch after ("Kill cmd_cache and find_match...").
> - One space after a period now (Maulik).
> - Plural of TCS fixed to TCSes following Maulik's example.
> - Re-added comment in tcs_write() about checking for same address.
> - Rebased atop v16 ('Invoke rpmh_flush...') series.
> - __tcs_set_trigger() comments adjusted now that it can set or unset.
> - get_tcs_for_msg() documents why it's safe to borrow the wake TCS.
> - get_tcs_for_msg() no longer returns -EAGAIN.
>
> Changes in v2:
> - Document bug of tcs_write() not handling -EAGAIN.
> - Document get_tcs_for_msg() => -EAGAIN only for ACTIVE_ONLY.
> - Document locks for updating "tcs_in_use" more.
> - Document tcs_is_free() without drv->lock OK for tcs_invalidate().
> - Document that rpmh_rsc_send_data() can be an implicit invalidate.
> - Document two get_tcs_for_msg() issues if zero-active TCS.
> - Fixed documentation of "tcs" param in find_slots().
> - More clear that active-only xfers can happen on wake TCS sometimes.
> - Reword tcs_write() doc a bit.
>
>   drivers/soc/qcom/rpmh-internal.h |  62 ++++++---
>   drivers/soc/qcom/rpmh-rsc.c      | 221 ++++++++++++++++++++++++++++---
>   2 files changed, 246 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> index 6a6d776ccca9..f06350cbc9a2 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -22,15 +22,24 @@ struct rsc_drv;
>    * struct tcs_group: group of Trigger Command Sets (TCS) to send state requests
>    * to the controller
>    *
> - * @drv:       the controller
> - * @type:      type of the TCS in this group - active, sleep, wake
> - * @mask:      mask of the TCSes relative to all the TCSes in the RSC
> - * @offset:    start of the TCS group relative to the TCSes in the RSC
> - * @num_tcs:   number of TCSes in this type
> - * @ncpt:      number of commands in each TCS
> - * @lock:      lock for synchronizing this TCS writes
> - * @req:       requests that are sent from the TCS
> - * @slots:     indicates which of @cmd_addr are occupied
> + * @drv:       The controller.
> + * @type:      Type of the TCS in this group - active, sleep, wake.
> + * @mask:      Mask of the TCSes relative to all the TCSes in the RSC.
> + * @offset:    Start of the TCS group relative to the TCSes in the RSC.
> + * @num_tcs:   Number of TCSes in this type.
> + * @ncpt:      Number of commands in each TCS.
> + * @lock:      Lock for synchronizing this TCS writes.
> + * @req:       Requests that are sent from the TCS; only used for ACTIVE_ONLY
> + *             transfers (could be on a wake/sleep TCS if we are borrowing for
> + *             an ACTIVE_ONLY transfer).
> + *             Start: grab drv->lock, set req, set tcs_in_use, drop drv->lock,
> + *                    trigger
> + *             End: get irq, access req,
> + *                  grab drv->lock, clear tcs_in_use, drop drv->lock
> + * @slots:     Indicates which of @cmd_addr are occupied; only used for
> + *             SLEEP / WAKE TCSs.  Things are tightly packed in the
> + *             case that (ncpt < MAX_CMDS_PER_TCS).  That is if ncpt = 2 and
> + *             MAX_CMDS_PER_TCS = 16 then bit[2] = the first bit in 2nd TCS.
>    */
>   struct tcs_group {
>   	struct rsc_drv *drv;
> @@ -82,19 +91,28 @@ struct rpmh_ctrlr {
>    * struct rsc_drv: the Direct Resource Voter (DRV) of the
>    * Resource State Coordinator controller (RSC)
>    *
> - * @name:               Controller identifier
> - * @tcs_base:           Start address of the TCS registers in this controller
> - * @id:                 Instance id in the controller (Direct Resource Voter)
> - * @num_tcs:            Number of TCSes in this DRV
> - * @rsc_pm:             CPU PM notifier for controller
> - *                      Used when solver mode is not present
> - * @cpus_entered_pm:    CPU mask for cpus in idle power collapse
> - *                      Used when solver mode is not present
> - * @tcs:                TCS groups
> - * @tcs_in_use:         S/W state of the TCS
> - * @lock:               Synchronize state of the controller
> - * @pm_lock:            Synchronize during PM notifications
> - *                      Used when solver mode is not present
> + * @name:               Controller identifier.
> + * @tcs_base:           Start address of the TCS registers in this controller.
> + * @id:                 Instance id in the controller (Direct Resource Voter).
> + * @num_tcs:            Number of TCSes in this DRV.
> + * @rsc_pm:             CPU PM notifier for controller.
> + *                      Used when solver mode is not present.
> + * @cpus_entered_pm:    CPU mask for cpus in idle power collapse.
> + *                      Used when solver mode is not present.
> + * @tcs:                TCS groups.
> + * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
> + *                      transfers, but might show a sleep/wake TCS in use if
> + *                      it was borrowed for an active_only transfer.  You
> + *                      must hold both the lock in this struct and the
> + *                      tcs_lock for the TCS in order to mark a TCS as
> + *                      in-use, but you only need the lock in this structure
> + *                      (aka the drv->lock) to mark one freed.
> + * @lock:               Synchronize state of the controller.  If you will be
> + *                      grabbing this lock and a tcs_lock at the same time,
> + *                      grab the tcs_lock first so we always have a
> + *                      consistent lock ordering.
> + * @pm_lock:            Synchronize during PM notifications.
> + *                      Used when solver mode is not present.
>    * @client:             Handle to the DRV's client.
>    */
>   struct rsc_drv {
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index da1045c92b38..84ae3e514eee 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -171,12 +171,38 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>   	}
>   }
>   
> +/**
> + * tcs_is_free() - Return if a TCS is totally free.
> + * @drv:    The RSC controller.
> + * @tcs_id: The global ID of this TCS.
> + *
> + * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
> + * If the TCS looks free, checks that the hardware agrees.
> + *
> + * Must be called with the drv->lock held or the tcs_lock for the TCS being
> + * tested. If only the tcs_lock is held then it is possible that this
> + * function will return that a tcs is still busy when it has been recently
> + * been freed but it will never return free when a TCS is actually in use.
> + *
> + * Return: true if the given TCS is free.
> + */
>   static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>   {
>   	return !test_bit(tcs_id, drv->tcs_in_use) &&
>   	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
>   }
>   
> +/**
> + * tcs_invalidate() - Invalidate all TCSes of the given type (sleep or wake).
> + * @drv:  The RSC controller.
> + * @type: SLEEP_TCS or WAKE_TCS
> + *
> + * This will clear the "slots" variable of the given tcs_group and also
> + * tell the hardware to forget about all entries.
> + *
> + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
> + *         bit. Caller should make sure to enable interrupts between tries.
> + */
>   static int tcs_invalidate(struct rsc_drv *drv, int type)
>   {
>   	int m;
> @@ -203,9 +229,11 @@ static int tcs_invalidate(struct rsc_drv *drv, int type)
>   }
>   
>   /**
> - * rpmh_rsc_invalidate - Invalidate sleep and wake TCSes
> + * rpmh_rsc_invalidate() - Invalidate sleep and wake TCSes.
> + * @drv: The RSC controller.
>    *
> - * @drv: the RSC controller
> + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
> + *         bit. Caller should make sure to enable interrupts between tries.
>    */
>   int rpmh_rsc_invalidate(struct rsc_drv *drv)
>   {
> @@ -218,6 +246,18 @@ int rpmh_rsc_invalidate(struct rsc_drv *drv)
>   	return ret;
>   }
>   
> +/**
> + * get_tcs_for_msg() - Get the tcs_group used to send the given message.
> + * @drv: The RSC controller.
> + * @msg: The message we want to send.
> + *
> + * This is normally pretty straightforward except if we are trying to send
> + * an ACTIVE_ONLY message but don't have any active_only TCSes.
> + *
> + * Called without drv->lock held and with no tcs_lock locks held.
> + *
> + * Return: A pointer to a tcs_group or an ERR_PTR.
> + */
>   static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>   					 const struct tcs_request *msg)
>   {
> @@ -241,7 +281,9 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>   	/*
>   	 * If we are making an active request on a RSC that does not have a
>   	 * dedicated TCS for active state use, then re-purpose a wake TCS to
> -	 * send active votes.
> +	 * send active votes. This is safe because we ensure any active-only
> +	 * transfers have finished before we use it (maybe by running from
> +	 * the last CPU in PM code).
>   	 */
>   	tcs = &drv->tcs[type];
>   	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs)
> @@ -250,6 +292,22 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>   	return tcs;
>   }
>   
> +/**
> + * get_req_from_tcs() - Get a stashed request that was xfering on the given TCS.
> + * @drv:    The RSC controller.
> + * @tcs_id: The global ID of this TCS.
> + *
> + * For ACTIVE_ONLY transfers we want to call back into the client when the
> + * transfer finishes. To do this we need the "request" that the client
> + * originally provided us. This function grabs the request that we stashed
> + * when we started the transfer.
> + *
> + * This only makes sense for ACTIVE_ONLY transfers since those are the only
> + * ones we track sending (the only ones we enable interrupts for and the only
> + * ones we call back to the client for).
> + *
> + * Return: The stashed request.
> + */
>   static const struct tcs_request *get_req_from_tcs(struct rsc_drv *drv,
>   						  int tcs_id)
>   {
> @@ -265,6 +323,23 @@ static const struct tcs_request *get_req_from_tcs(struct rsc_drv *drv,
>   	return NULL;
>   }
>   
> +/**
> + * __tcs_set_trigger() - Start xfer on a TCS or unset trigger on a borrowed TCS
> + * @drv:     The controller.
> + * @tcs_id:  The global ID of this TCS.
> + * @trigger: If true then untrigger/retrigger. If false then just untrigger.
> + *
> + * In the normal case we only ever call with "trigger=true" to start a
> + * transfer. That will un-trigger/disable the TCS from the last transfer
> + * then trigger/enable for this transfer.
> + *
> + * If we borrowed a wake TCS for an active-only transfer we'll also call
> + * this function with "trigger=false" to just do the un-trigger/disable
> + * before using the TCS for wake purposes again.
> + *
> + * Note that the AP is only in charge of triggering active-only transfers.
> + * The AP never triggers sleep/wake values using this function.
> + */
>   static void __tcs_set_trigger(struct rsc_drv *drv, int tcs_id, bool trigger)
>   {
>   	u32 enable;
> @@ -289,6 +364,15 @@ static void __tcs_set_trigger(struct rsc_drv *drv, int tcs_id, bool trigger)
>   	}
>   }
>   
> +/**
> + * enable_tcs_irq() - Enable or disable interrupts on the given TCS.
> + * @drv:     The controller.
> + * @tcs_id:  The global ID of this TCS.
> + * @enable:  If true then enable; if false then disable
> + *
> + * We only ever call this when we borrow a wake TCS for an active-only
> + * transfer. For active-only TCSes interrupts are always left enabled.
> + */
>   static void enable_tcs_irq(struct rsc_drv *drv, int tcs_id, bool enable)
>   {
>   	u32 data;
> @@ -302,7 +386,14 @@ static void enable_tcs_irq(struct rsc_drv *drv, int tcs_id, bool enable)
>   }
>   
>   /**
> - * tcs_tx_done: TX Done interrupt handler
> + * tcs_tx_done() - TX Done interrupt handler.
> + * @irq: The IRQ number (ignored).
> + * @p:   Pointer to "struct rsc_drv".
> + *
> + * Called for ACTIVE_ONLY transfers (those are the only ones we enable the
> + * IRQ for) when a transfer is done.
> + *
> + * Return: IRQ_HANDLED
>    */
>   static irqreturn_t tcs_tx_done(int irq, void *p)
>   {
> @@ -367,6 +458,16 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>   	return IRQ_HANDLED;
>   }
>   
> +/**
> + * __tcs_buffer_write() - Write to TCS hardware from a request; don't trigger.
> + * @drv:    The controller.
> + * @tcs_id: The global ID of this TCS.
> + * @cmd_id: The index within the TCS to start writing.
> + * @msg:    The message we want to send, which will contain several addr/data
> + *          pairs to program (but few enough that they all fit in one TCS).
> + *
> + * This is used for all types of transfers (active, sleep, and wake).
> + */
>   static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   			       const struct tcs_request *msg)
>   {
> @@ -400,6 +501,26 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
>   }
>   
> +/**
> + * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
> + * @drv: The controller.
> + * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
> + * @msg: The message we want to send, which will contain several addr/data
> + *       pairs to program (but few enough that they all fit in one TCS).
> + *
> + * This will walk through the TCSes in the group and check if any of them
> + * appear to be sending to addresses referenced in the message. If it finds
> + * one it'll return -EBUSY.
> + *
> + * Only for use for active-only transfers.
> + *
> + * Must be called with the drv->lock held since that protects tcs_in_use.
> + *
> + * Return: 0 if nothing in flight or -EBUSY if we should try again later.
> + *         The caller must re-enable interrupts between tries since that's
> + *         the only way tcs_is_free() will ever return true and the only way
> + *         RSC_DRV_CMD_ENABLE will ever be cleared.
> + */
>   static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   				  const struct tcs_request *msg)
>   {
> @@ -426,6 +547,15 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   	return 0;
>   }
>   
> +/**
> + * find_free_tcs() - Find free tcs in the given tcs_group; only for active.
> + * @tcs: A pointer to the active-only tcs_group (or the wake tcs_group if
> + *       we borrowed it because there are zero active-only ones).
> + *
> + * Must be called with the drv->lock held since that protects tcs_in_use.
> + *
> + * Return: The first tcs that's free.
> + */
>   static int find_free_tcs(struct tcs_group *tcs)
>   {
>   	int i;
> @@ -438,6 +568,20 @@ static int find_free_tcs(struct tcs_group *tcs)
>   	return -EBUSY;
>   }
>   
> +/**
> + * tcs_write() - Store messages into a TCS right now, or return -EBUSY.
> + * @drv: The controller.
> + * @msg: The data to be sent.
> + *
> + * Grabs a TCS for ACTIVE_ONLY transfers and writes the messages to it.
> + *
> + * If there are no free TCSes for ACTIVE_ONLY transfers or if a command for
> + * the same address is already transferring returns -EBUSY which means the
> + * client should retry shortly.
> + *
> + * Return: 0 on success, -EBUSY if client should retry, or an error.
> + *         Client should have interrupts enabled for a bit before retrying.
> + */
>   static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
>   	struct tcs_group *tcs;
> @@ -491,14 +635,26 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>   }
>   
>   /**
> - * rpmh_rsc_send_data: Validate the incoming message and write to the
> - * appropriate TCS block.
> + * rpmh_rsc_send_data() - Validate the incoming message + write to TCS block.
> + * @drv: The controller.
> + * @msg: The data to be sent.
>    *
> - * @drv: the controller
> - * @msg: the data to be sent
> + * NOTES:
> + * - This is only used for "ACTIVE_ONLY" since the limitations of this
> + *   function don't make sense for sleep/wake cases.
> + * - To do the transfer, we will grab a whole TCS for ourselves--we don't
> + *   try to share. If there are none available we'll wait indefinitely
> + *   for a free one.
> + * - This function will not wait for the commands to be finished, only for
> + *   data to be programmed into the RPMh. See rpmh_tx_done() which will
> + *   be called when the transfer is fully complete.
> + * - This function must be called with interrupts enabled. If the hardware
> + *   is busy doing someone else's transfer we need that transfer to fully
> + *   finish so that we can have the hardware, and to fully finish it needs
> + *   the interrupt handler to run. If the interrupts is set to run on the
> + *   active CPU this can never happen if interrupts are disabled.
>    *
>    * Return: 0 on success, -EINVAL on error.
> - * Note: This call blocks until a valid data is written to the TCS.
>    */
>   int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
> @@ -522,13 +678,30 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   	return ret;
>   }
>   
> +/**
> + * find_slots() - Find a place to write the given message.
> + * @tcs:    The tcs group to search.
> + * @msg:    The message we want to find room for.
> + * @tcs_id: If we return 0 from the function, we return the global ID of the
> + *          TCS to write to here.
> + * @cmd_id: If we return 0 from the function, we return the index of
> + *          the command array of the returned TCS where the client should
> + *          start writing the message.
> + *
> + * Only for use on sleep/wake TCSes since those are the only ones we maintain
> + * tcs->slots for.
> + *
> + * Must be called with the tcs_lock for the group held.
> + *
> + * Return: -ENOMEM if there was no room, else 0.
> + */
>   static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   		      int *tcs_id, int *cmd_id)
>   {
>   	int slot, offset;
>   	int i = 0;
>   
> -	/* Do over, until we can fit the full payload in a TCS */
> +	/* Do over, until we can fit the full payload in a single TCS */
>   	do {
>   		slot = bitmap_find_next_zero_area(tcs->slots, MAX_TCS_SLOTS,
>   						  i, msg->num_cmds, 0);
> @@ -547,12 +720,14 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   }
>   
>   /**
> - * rpmh_rsc_write_ctrl_data: Write request to the controller
> + * rpmh_rsc_write_ctrl_data() - Write request to controller but don't trigger.
> + * @drv: The controller.
> + * @msg: The data to be written to the controller.
>    *
> - * @drv: the controller
> - * @msg: the data to be written to the controller
> + * This should only be called for for sleep/wake state, never active-only
> + * state.
>    *
> - * There is no response returned for writing the request to the controller.
> + * Return: 0 if no error; else -error.
>    */
>   int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
> @@ -587,7 +762,6 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   
>   /**
>    * rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy.
> - *
>    * @drv: The controller
>    *
>    * Checks if any of the AMCs are busy in handling ACTIVE sets.
> @@ -623,6 +797,23 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>   	return false;
>   }
>   
> +/**
> + * rpmh_rsc_cpu_pm_callback() - Check if any of the AMCs are busy.
> + * @nfb:    Pointer to the notifier block in struct rsc_drv.
> + * @action: CPU_PM_ENTER, CPU_PM_ENTER_FAILED, or CPU_PM_EXIT.
> + * @v:      Unused
> + *
> + * This function is given to cpu_pm_register_notifier so we can be informed
> + * about when CPUs go down. When all CPUs go down we know no more active
> + * transfers will be started so we write sleep/wake sets. This function gets
> + * called from cpuidle code paths and also at system suspend time.
> + *
> + * If its last CPU going down and AMCs are not busy then writes cached sleep
> + * and wake messages to TCSes. The firmware then takes care of triggering
> + * them when entering deepest low power modes.
> + *
> + * Return: See cpu_pm_register_notifier.
> + */
>   static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>   				    unsigned long action, void *v)
>   {

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
