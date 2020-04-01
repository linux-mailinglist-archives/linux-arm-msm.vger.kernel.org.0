Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E80A819AACC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 13:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgDALaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 07:30:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:40682 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732281AbgDALaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 07:30:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585740602; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9jK0n7Af9s5FChg4c3zfu7a7dfenpKGNUxyevuco73o=; b=cZyVuniQXuIoSAzcYr98Dod0m5fXXSp5mT6g7B8nrh69gniN9lnwazhk5Dfly8MXTJPKeVhA
 W6Wgn/Ufh6cI/izbesisGta4iehPYPyrTsE20PPlWILNraPmBGFl6dnxWN/vxhhRPLIDefv6
 i7GEwsLoMAa/SEHwuARVjCClgHM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e847b2c.7f85508a2538-smtp-out-n01;
 Wed, 01 Apr 2020 11:29:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E6E9C433BA; Wed,  1 Apr 2020 11:29:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.15.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67276C433D2;
        Wed,  1 Apr 2020 11:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67276C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH v2 05/10] drivers: qcom: rpmh-rsc: A lot of comments
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.5.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <30f2b142-6ac2-2917-1ad6-1474c51f3da7@codeaurora.org>
Date:   Wed, 1 Apr 2020 16:59:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311161104.RFT.v2.5.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/12/2020 4:43 AM, Douglas Anderson wrote:
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
> This should be a no-op.  It's just comment changes.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - More clear that active-only xfers can happen on wake TCS sometimes.
> - Document locks for updating "tcs_in_use" more.
> - Document tcs_is_free() without drv->lock OK for tcs_invalidate().
> - Document bug of tcs_write() not handling -EAGAIN.
> - Document get_tcs_for_msg() => -EAGAIN only for ACTIVE_ONLY.
> - Reword tcs_write() doc a bit.
> - Document two get_tcs_for_msg() issues if zero-active TCS.
> - Document that rpmh_rsc_send_data() can be an implicit invalidate.
> - Fixed documentation of "tcs" param in find_slots().
>
>   drivers/soc/qcom/rpmh-internal.h |  52 +++---
>   drivers/soc/qcom/rpmh-rsc.c      | 264 +++++++++++++++++++++++++++++--
>   2 files changed, 281 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> index 6eec32b97f83..b756d3036e96 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -22,16 +22,25 @@ struct rsc_drv;
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
> - * @cmd_cache: flattened cache of cmds in sleep/wake TCS
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
> + * @cmd_cache: Flattened cache of cmds in sleep/wake TCS; num_tcs * ncpt big.
> + * @slots:     Indicates which of @cmd_addr are occupied; only used for
> + *             SLEEP / WAKE TCSs.  Things are tightly packed in the
> + *             case that (ncpt < MAX_CMDS_PER_TCS).  That is if ncpt = 2 and
> + *             MAX_CMDS_PER_TCS = 16 then bit[2] = the first bit in 2nd TCS.
>    */
>   struct tcs_group {
>   	struct rsc_drv *drv;
> @@ -84,14 +93,21 @@ struct rpmh_ctrlr {
>    * struct rsc_drv: the Direct Resource Voter (DRV) of the
>    * Resource State Coordinator controller (RSC)
>    *
> - * @name:       controller identifier
> - * @tcs_base:   start address of the TCS registers in this controller
> - * @id:         instance id in the controller (Direct Resource Voter)
> - * @num_tcs:    number of TCSes in this DRV
> - * @tcs:        TCS groups
> - * @tcs_in_use: s/w state of the TCS
> - * @lock:       synchronize state of the controller
> - * @client:     handle to the DRV's client.
> + * @name:       Controller identifier.
> + * @tcs_base:   Start address of the TCS registers in this controller.
> + * @id:         Instance id in the controller (Direct Resource Voter).
> + * @num_tcs:    Number of TCSes in this DRV.
> + * @tcs:        TCS groups.
> + * @tcs_in_use: s/w state of the TCS; only set for ACTIVE_ONLY transfers, but
> + *              might show a sleep/wake TCS in use if it was borrowed for an
> + *              active_only transfer.  You must hold both the lock in this
> + *              struct and the tcs_lock for the TCS in order to mark a TCS as
> + *              in-use, but you only need the lock in this structure to mark
> + *              one freed.
> + * @lock:       Synchronize state of the controller.  If you will be grabbing
> + *              this lock and a tcs_lock at the same time, grab the tcs_lock
> + *              first so we always have a consistent lock ordering.
> + * @client:     Handle to the DRV's client.
>    */
>   struct rsc_drv {
>   	const char *name;
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index c9f29cbd5ee5..9d2669cbd994 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -164,12 +164,38 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
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
> + * tested.  If only the tcs_lock is held then it is possible that this
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
> + * tcs_invalidate() - Invalidate all TCSs of the given type (sleep or wake).
> + * @drv:  The RSC controller.
> + * @type: SLEEP_TCS or WAKE_TCS
> + *
> + * This will clear the "slots" variable of the given tcs_group and also
> + * tell the hardware to forget about all entries.
> + *
> + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
> + *         bit.  Caller should make sure to enable interrupts between tries.
> + */
>   static int tcs_invalidate(struct rsc_drv *drv, int type)
>   {
>   	int m;
> @@ -196,9 +222,11 @@ static int tcs_invalidate(struct rsc_drv *drv, int type)
>   }
>   
>   /**
> - * rpmh_rsc_invalidate - Invalidate sleep and wake TCSes
> + * rpmh_rsc_invalidate() - Invalidate sleep and wake TCSes.
> + * @drv: The RSC controller.
>    *
> - * @drv: the RSC controller
> + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
> + *         bit.  Caller should make sure to enable interrupts between tries.
>    */
>   int rpmh_rsc_invalidate(struct rsc_drv *drv)
>   {
> @@ -211,6 +239,20 @@ int rpmh_rsc_invalidate(struct rsc_drv *drv)
>   	return ret;
>   }
>   
> +/**
> + * get_tcs_for_msg() - Get the tcs_group used to send the given message.
> + * @drv: The RSC controller.
> + * @msg: The message we want to send.
> + *
> + * This is normally pretty straightforward except if we are trying to send
> + * an ACTIVE_ONLY message but don't have any active_only TCSs.
> + *
> + * Called without drv->lock held and with no tcs_lock locks held.
> + *
> + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a bit.
> + *         Caller should make sure to enable interrupts between tries.
> + *         Only ever returns -EAGAIN for ACTIVE_ONLY transfers.
with [2] it will not return -EAGAIN, can you please remove this part.
> + */
>   static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>   					 const struct tcs_request *msg)
>   {
> @@ -246,12 +288,35 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>   			ret = rpmh_rsc_invalidate(drv);
>   			if (ret)
>   				return ERR_PTR(ret);
> +
> +			/*
> +			 * TODO:
> +			 * - Temporarily enable IRQs on the wake tcs.
> +			 * - Make sure nobody else race with us and re-write
> +			 *   to this TCS; document how this works.
You can remove above comment, i already included change to enable IRQs 
on wake TCS in my series.
> +			 */
>   		}
>   	}
>   
>   	return tcs;
>   }
>   
> +/**
> + * get_req_from_tcs() - Get a stashed request that was xfering on the given tcs.
> + * @drv:    The RSC controller.
> + * @tcs_id: The global ID of this TCS.
> + *
> + * For ACTIVE_ONLY transfers we want to call back into the client when the
> + * transfer finishes.  To do this we need the "request" that the client
> + * originally provided us.  This function grabs the request that we stashed
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
> @@ -268,7 +333,14 @@ static const struct tcs_request *get_req_from_tcs(struct rsc_drv *drv,
>   }
>   
>   /**
> - * tcs_tx_done: TX Done interrupt handler
> + * tcs_tx_done() - TX Done interrupt handler.
> + * @irq: The IRQ number (ignored).
> + * @p:   Pointer to "struct rsc_drv".
> + *
> + * Called for ACTIVE_ONLY TCSs (those are the only ones we enable the IRQ for)
> + * when a transfer is done.
> + *
> + * Return: IRQ_HANDLED
>    */
>   static irqreturn_t tcs_tx_done(int irq, void *p)
>   {
> @@ -278,6 +350,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>   	const struct tcs_request *req;
>   	struct tcs_cmd *cmd;
>   
> +	/* NOTE: interrupt status for all TCSs are found in TCS 0 */
>   	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
>   
>   	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
> @@ -318,6 +391,16 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
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
> + * This is used for all types of TCSs (active, sleep, and wake).
> + */
>   static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   			       const struct tcs_request *msg)
>   {
> @@ -351,6 +434,15 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
>   }
>   
> +/**
> + * __tcs_trigger() - Start transferring on the given TCS.
> + *
> + * The TCS given is probably the active-only one, but could be a wake one
> + * that we borrowed if there are zero active-only TCSs.
> + *
> + * @drv:    The controller.
> + * @tcs_id: The global ID of this TCS.
> + */
>   static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
>   {
>   	u32 enable;
> @@ -373,6 +465,27 @@ static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
>   	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
>   }
>   
> +/**
> + * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
> + * @drv: The controller.
> + * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
> + * @msg: The message we want to send, which will contain several addr/data
> + *       pairs to program (but few enough that they all fit in one TCS).
> + *
> + * Only for use for ACTIVE_ONLY tcs_group, since those are the only ones
> + * that might be actively sending.

This comment will need to modify/removed after we use this in place of 
find_match().

see below for more details.

> + *
> + * This will walk through the TCSs in the group and check if any of them
> + * appear to be sending to addresses referenced in the message.  If it finds
> + * one it'll return -EBUSY.
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
> @@ -399,6 +512,15 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   	return 0;
>   }
>   
> +/**
> + * find_free_tcs() - Find free tcs in the given tcs_group; only for ACTIVE_ONLY.
> + * @tcs: A pointer to the ACTIVE_ONLY tcs_group (or the wake tcs_group if
> + *       we borrowed it because there are zero active-only ones).
> + *
> + * Must be called with the drv->lock held since that protects tcs_in_use.
> + *
> + * Return: The first tcs that's free.
> + */
>   static int find_free_tcs(struct tcs_group *tcs)
>   {
>   	int i;
> @@ -411,6 +533,20 @@ static int find_free_tcs(struct tcs_group *tcs)
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
> + * If there are no free ACTIVE_ONLY TCSs or if a command for the same address
> + * is already transferring returns -EBUSY which means the client should retry
> + * shortly.
> + *
> + * Return: 0 on success, -EBUSY if client should retry, or an error.
> + *         Client should have interrupts enabled for a bit before retrying.
> + */
>   static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
>   	struct tcs_group *tcs;
> @@ -418,16 +554,14 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>   	unsigned long flags;
>   	int ret;
>   
> +	/* TODO: get_tcs_for_msg() can return -EAGAIN and nobody handles */
with [2] it will not return -EAGAIN, can you please remove this comment.
>   	tcs = get_tcs_for_msg(drv, msg);
>   	if (IS_ERR(tcs))
>   		return PTR_ERR(tcs);
>   
>   	spin_lock_irqsave(&tcs->lock, flags);
> +
>   	spin_lock(&drv->lock);
> -	/*
> -	 * The h/w does not like if we send a request to the same address,
> -	 * when one is already in-flight or being processed.
> -	 */
please keep above comment as it is.
>   	ret = check_for_req_inflight(drv, tcs, msg);
>   	if (ret) {
>   		spin_unlock(&drv->lock);
> @@ -454,14 +588,30 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
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
> + *   try to share.  If there are none available we'll wait indefinitely
> + *   for a free one.
> + * - This function will not wait for the commands to be finished, only for
> + *   data to be programmed into the RPMh.  See rpmh_tx_done() which will
> + *   be called when the transfer is fully complete.
> + * - This function must be called with interrupts enabled.  If the hardware
> + *   is busy doing someone else's transfer we need that transfer to fully
> + *   finish so that we can have the hardware, and to fully finish it needs
> + *   the interrupt handler to run.  If the interrupts is set to run on the
> + *   active CPU this can never happen if interrupts are disabled.
> + * - If there are no active TCS calling this function can cause an implicit
> + *   call to rpmh_rsc_invalidate().  Unless you know for sure that you have
> + *   an active TCS you should assume that you need to re-write sleep/wake
> + *   values after calling this function.
>    *
>    * Return: 0 on success, -EINVAL on error.
> - * Note: This call blocks until a valid data is written to the TCS.
>    */
>   int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
> @@ -485,6 +635,63 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   	return ret;
>   }
>   
> +/**
> + * find_match() - Find if the cmd sequence is in the tcs_group
> + * @tcs: The tcs_group to search.  Either sleep or wake.
> + * @cmd: The command sequence to search for; only addr is looked at.
> + * @len: The number of commands in the sequence.
> + *
> + * Searches through the given tcs_group to see if a given command sequence
> + * is in there.
> + *
> + * Two sequences are matches if they modify the same set of addresses in
> + * the same order.  The value of the data is not considered when deciding if
> + * two things are matches.
> + *
> + * How this function works is best understood by example.  For our example,
> + * we'll imagine our tcs group contains these (cmd, data) tuples:
> + *   [(a, A), (b, B), (c, C), (d, D), (e, E), (f, F), (g, G), (h, H)]
> + * ...in other words it has an element where (addr=a, data=A), etc.
> + * ...we'll assume that there is one TCS in the group that can store 8 commands.
> + *
> + * - find_match([(a, X)]) => 0
> + * - find_match([(c, X), (d, X)]) => 2
> + * - find_match([(c, X), (d, X), (e, X)]) => 2
> + * - find_match([(z, X)]) => -ENODATA
> + * - find_match([(a, X), (y, X)]) => -EINVAL (and warning printed)
> + * - find_match([(g, X), (h, X), (i, X)]) => -EINVAL (and warning printed)
> + * - find_match([(y, X), (a, X)]) => -ENODATA
> + *
> + * NOTE: This function overall seems like it has questionable value.
> + * - It can be used to update a message in the TCS with new data, but I
> + *   don't believe we actually do that--we always fully invalidate and
> + *   re-write everything.
we are doing this from [1] onwards.
> Specifically it would be too limiting to force
> + *   someone not to change the set of addresses written to each time.
> + * - This function could be attempting to avoid writing different data to
> + *   the same address twice in a tcs_group.  If that's the goal, it doesn't
> + *   do a great job since find_match([(y, X), (a, X)]) return -ENODATA in my
> + *   above example.
> + * - If you originally wrote [(a, A), (b, B), (c, C)] and later tried to
> + *   write [(a, A), (b, B)] it'd look like a match and we wouldn't consider
> + *   it an error that the size got shorter.
> + * - If two clients wrote sequences that happened to be placed in slots next
> + *   to each other then a later check could match a sequence that was the
> + *   size of both together.
> + *
> + * TODO: in light of the above, prehaps we can just remove this function?

We still need to check there is no duplicate request in a TCS for SLEEP 
and WAKE as well.

find_match() checks if the request already exist for a resource then 
update with new value, in a way preventing new request to go in

when one already exists. I am ok to remove this function since after [1] 
we always fully invalidate and then re-write and little point in

finding a match now. However we need to use check_for_req_inflight() 
from tcs_ctrl_write() with little modification to ignore tcs_is_free()

check if is called from tcs_ctrlr_write().

After this change on 9th change in your series,  please move it before 
current patch in series.

please also keep dependency on [1] for 9th change.

> + * If we later come up with fancy algorithms for updating everything without
> + * full invalidations we can come up with something then.
> + *
> + * Only for use on sleep/wake TCSs since those are the only ones we maintain
> + * tcs->slots and tcs->cmd_cache for.
> + *
> + * Must be called with the tcs_lock for the group held.
> + *
> + * Return: If the given command sequence wasn't in the tcs_group: -ENODATA.
> + *         If the given command sequence was in the tcs_group: the index of
> + *         the slot in the tcs_group where the first command is.
> + *         In some error cases (see above), -EINVAL.
> + */
>   static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
>   		      int len)
>   {
> @@ -497,6 +704,11 @@ static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
>   		if (i + len >= tcs->num_tcs * tcs->ncpt)
>   			goto seq_err;
>   		for (j = 0; j < len; j++) {
> +			/*
> +			 * TODO: it's actually not valid to look at
> +			 * "cmd_cache[x]" if "slots[x]" doesn't have a bit
> +			 * set.  Should add a check.
> +			 */
>   			if (tcs->cmd_cache[i + j] != cmd[j].addr)
>   				goto seq_err;
>   		}
> @@ -510,6 +722,23 @@ static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
>   	return -EINVAL;
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
> + * Only for use on sleep/wake TCSs since those are the only ones we maintain
> + * tcs->slots and tcs->cmd_cache for.
> + *
> + * Must be called with the tcs_lock for the group held.
> + *
> + * Return: -ENOMEM if there was no room, else 0.
> + */
>   static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   		      int *tcs_id, int *cmd_id)
>   {
> @@ -521,7 +750,7 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   	if (slot >= 0)
>   		goto copy_data;
>   
> -	/* Do over, until we can fit the full payload in a TCS */
> +	/* Do over, until we can fit the full payload in a single TCS */
>   	do {
>   		slot = bitmap_find_next_zero_area(tcs->slots, MAX_TCS_SLOTS,
>   						  i, msg->num_cmds, 0);
> @@ -544,12 +773,13 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   }
>   
>   /**
> - * rpmh_rsc_write_ctrl_data: Write request to the controller
> - *
> - * @drv: the controller
> - * @msg: the data to be written to the controller
> + * rpmh_rsc_write_ctrl_data() - Write request to controller but don't trigger.
> + * @drv: The controller.
> + * @msg: The data to be written to the controller.
>    *
>    * There is no response returned for writing the request to the controller.

you can remove above line since responce is returned from this function.

> + *
> + * Return: 0 if no error; else -error.
>    */
>   int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   {

Thanks,
Maulik

[1] https://patchwork.kernel.org/patch/11467811/

[2] https://patchwork.kernel.org/patch/11467821/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
