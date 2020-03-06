Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4B817C943
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 01:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgCGAA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 19:00:29 -0500
Received: from mail-pg1-f181.google.com ([209.85.215.181]:46896 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgCGAA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 19:00:28 -0500
Received: by mail-pg1-f181.google.com with SMTP id y30so1784825pga.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U/aBCI+DX1bFE5rkUTIVykFOc/IFjEtATaeghHqlze0=;
        b=VjEwaoFc7mNGZ+8AcoDDrtFiBD+yumBjohumGUlsgiD/zEJw3XzG7TDMXwgwQNl61n
         4G6eqLdhQo4WYdD1P9CfWljXqlnsJH4fKzvtNf5FHeikqGfnXGbj/m/vnjwJb1HSmv01
         FsBeXNCj5+T/stdoZ+h+Hm1B0JOwdR903c2Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/aBCI+DX1bFE5rkUTIVykFOc/IFjEtATaeghHqlze0=;
        b=sMR9n/usI+R9QuOlKny4Ci0fTmntSYjq1CC/uwwhKHNnwv5LUx9beWtT8aGVzqcYIp
         ozivt6NrnIwRNkCJt1XNADOikoVy4WaIR73iNfrnQv/fZ3IWWn3BChXEwyaYPKFlFRrL
         41clSm6P88kZClKqpKl5aKNvFIFoC+AX6+emvMEUiCU/hz3iaROh4QWCy34NGlPNbEGR
         dz/sv6nYg5ATSAPoBp0pKD28C37ewXIMdDZgk+HCd8NVO/sEcj4O5ofWA6BaF2NvNgaX
         1dWxUKBpOu5mJNfYBuGwxlY4/M98Y5v7xl2+3tVCROyvCrmfwkblsic7/51cvrKuOpBv
         gkRQ==
X-Gm-Message-State: ANhLgQ1J1EQTzHJ0HfpFwJEnL8FMKiXI4/WiM3rdB8YDpHogS25Gc+4U
        Azsz9FYgzafR7gGqiIRh6MZ+Vw==
X-Google-Smtp-Source: ADFU+vs8BEmoyaM/W1YSAuEXK2sGC1p8OLIkw6POAMiE0mJ8DDrc3oAaXJLzhCjJkggw0rRl9xwF0Q==
X-Received: by 2002:a63:7e1a:: with SMTP id z26mr5444723pgc.226.1583539226904;
        Fri, 06 Mar 2020 16:00:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 9sm32302246pge.65.2020.03.06.16.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:00:26 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH 5/9] drivers: qcom: rpmh-rsc: A lot of comments
Date:   Fri,  6 Mar 2020 15:59:47 -0800
Message-Id: <20200306155707.RFT.5.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306235951.214678-1-dianders@chromium.org>
References: <20200306235951.214678-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I've been pouring through the rpmh-rsc code and trying to understand
it.  Document everything to the best of my ability.  All documentation
here is strictly from code analysis--no actual knowledge of the
hardware was used.  If something is wrong in here I either
misunderstood the code, had a typo, or the code has a bug in it
leading to my incorrect understanding.

In a few places here I have documented things that don't make tons of
sense.  A future patch will try to address this.

This should be a no-op.  It's just comment changes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh-internal.h |  45 +++---
 drivers/soc/qcom/rpmh-rsc.c      | 238 ++++++++++++++++++++++++++++---
 2 files changed, 248 insertions(+), 35 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 6eec32b97f83..49df01af7701 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -22,16 +22,23 @@ struct rsc_drv;
  * struct tcs_group: group of Trigger Command Sets (TCS) to send state requests
  * to the controller
  *
- * @drv:       the controller
- * @type:      type of the TCS in this group - active, sleep, wake
- * @mask:      mask of the TCSes relative to all the TCSes in the RSC
- * @offset:    start of the TCS group relative to the TCSes in the RSC
- * @num_tcs:   number of TCSes in this type
- * @ncpt:      number of commands in each TCS
- * @lock:      lock for synchronizing this TCS writes
- * @req:       requests that are sent from the TCS
- * @cmd_cache: flattened cache of cmds in sleep/wake TCS
- * @slots:     indicates which of @cmd_addr are occupied
+ * @drv:       The controller.
+ * @type:      Type of the TCS in this group - active, sleep, wake.
+ * @mask:      Mask of the TCSes relative to all the TCSes in the RSC.
+ * @offset:    Start of the TCS group relative to the TCSes in the RSC.
+ * @num_tcs:   Number of TCSes in this type.
+ * @ncpt:      Number of commands in each TCS.
+ * @lock:      Lock for synchronizing this TCS writes.
+ * @req:       Requests that are sent from the TCS; only used for ACTIVE_ONLY.
+ *             Start: grab drv->lock, set req, set tcs_in_use, drop drv->lock,
+ *                    trigger
+ *             End: get irq, access req,
+ *                  grab drv->lock, clear tcs_in_use, drop drv->lock
+ * @cmd_cache: Flattened cache of cmds in sleep/wake TCS; num_tcs * ncpt big.
+ * @slots:     Indicates which of @cmd_addr are occupied; only used for
+ *             SLEEP / WAKE TCSs.  Things are tightly packed in the
+ *             case that (ncpt < MAX_CMDS_PER_TCS).  That is if ncpt = 2 and
+ *             MAX_CMDS_PER_TCS = 16 then bit[2] = the first bit in 2nd TCS.
  */
 struct tcs_group {
 	struct rsc_drv *drv;
@@ -84,14 +91,16 @@ struct rpmh_ctrlr {
  * struct rsc_drv: the Direct Resource Voter (DRV) of the
  * Resource State Coordinator controller (RSC)
  *
- * @name:       controller identifier
- * @tcs_base:   start address of the TCS registers in this controller
- * @id:         instance id in the controller (Direct Resource Voter)
- * @num_tcs:    number of TCSes in this DRV
- * @tcs:        TCS groups
- * @tcs_in_use: s/w state of the TCS
- * @lock:       synchronize state of the controller
- * @client:     handle to the DRV's client.
+ * @name:       Controller identifier.
+ * @tcs_base:   Start address of the TCS registers in this controller.
+ * @id:         Instance id in the controller (Direct Resource Voter).
+ * @num_tcs:    Number of TCSes in this DRV.
+ * @tcs:        TCS groups.
+ * @tcs_in_use: s/w state of the TCS; only for ACTIVE_ONLY TCSs.
+ * @lock:       Synchronize state of the controller.  If you will be grabbing
+ *              this lock and a tcs_lock at the same time, grab the tcs_lock
+ *              first so we always have a consistent lock ordering.
+ * @client:     Handle to the DRV's client.
  */
 struct rsc_drv {
 	const char *name;
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a1298035bcd2..190226151029 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -163,12 +163,35 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
 	}
 }
 
+/**
+ * tcs_is_free() - Return if a TCS is totally free.
+ * @drv:    The RSC controller.
+ * @tcs_id: The global ID of this TCS.
+ *
+ * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
+ * If the TCS looks free, checks that the hardware agrees.
+ *
+ * Must be called with the drv->lock held since that protects tcs_in_use.
+ *
+ * Return: true if the given TCS is free.
+ */
 static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 {
 	return !test_bit(tcs_id, drv->tcs_in_use) &&
 	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
 }
 
+/**
+ * tcs_invalidate() - Invalidate all TCSs of the given type (sleep or wake).
+ * @drv:  The RSC controller.
+ * @type: SLEEP_TCS or WAKE_TCS
+ *
+ * This will clear the "slots" variable of the given tcs_group and also
+ * tell the hardware to forget about all entries.
+ *
+ * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
+ *         bit.  Caller should make sure to enable interrupts between tries.
+ */
 static int tcs_invalidate(struct rsc_drv *drv, int type)
 {
 	int m;
@@ -195,9 +218,11 @@ static int tcs_invalidate(struct rsc_drv *drv, int type)
 }
 
 /**
- * rpmh_rsc_invalidate - Invalidate sleep and wake TCSes
+ * rpmh_rsc_invalidate() - Invalidate sleep and wake TCSes.
+ * @drv: The RSC controller.
  *
- * @drv: the RSC controller
+ * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
+ *         bit.  Caller should make sure to enable interrupts between tries.
  */
 int rpmh_rsc_invalidate(struct rsc_drv *drv)
 {
@@ -210,6 +235,17 @@ int rpmh_rsc_invalidate(struct rsc_drv *drv)
 	return ret;
 }
 
+/**
+ * get_tcs_for_msg() - Get the tcs_group used to send the given message.
+ * @drv: The RSC controller.
+ * @msg: The message we want to send.
+ *
+ * This is normally pretty straightforward except if we are trying to send
+ * an ACTIVE_ONLY message but don't have any active_only TCSs.
+ *
+ * Return: 0 if no problem, or -EGAIN if the caller should try again in a bit.
+ *         Caller should make sure to enable interrupts between tries.
+ */
 static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 					 const struct tcs_request *msg)
 {
@@ -251,6 +287,22 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 	return tcs;
 }
 
+/**
+ * get_req_from_tcs() - Get a stashed request that was xfering on the given tcs.
+ * @drv:    The RSC controller.
+ * @tcs_id: The global ID of this TCS.
+ *
+ * For ACTIVE_ONLY transfers we want to call back into the client when the
+ * transfer finishes.  To do this we need the "request" that the client
+ * originally provided us.  This function grabs the request that we stashed
+ * when we started the transfer.
+ *
+ * This only makes sense for ACTIVE_ONLY transfers since those are the only
+ * ones we track sending (the only ones we enable interrupts for and the only
+ * ones we call back to the client for).
+ *
+ * Return: The stashed request.
+ */
 static const struct tcs_request *get_req_from_tcs(struct rsc_drv *drv,
 						  int tcs_id)
 {
@@ -267,7 +319,14 @@ static const struct tcs_request *get_req_from_tcs(struct rsc_drv *drv,
 }
 
 /**
- * tcs_tx_done: TX Done interrupt handler
+ * tcs_tx_done() - TX Done interrupt handler.
+ * @irq: The IRQ number (ignored).
+ * @p:   Pointer to "struct rsc_drv".
+ *
+ * Called for ACTIVE_ONLY TCSs (those are the only ones we enable the IRQ for)
+ * when a transfer is done.
+ *
+ * Return: IRQ_HANDLED
  */
 static irqreturn_t tcs_tx_done(int irq, void *p)
 {
@@ -277,6 +336,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	const struct tcs_request *req;
 	struct tcs_cmd *cmd;
 
+	/* NOTE: interrupt status for all TCSs are found in TCS 0 */
 	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
 
 	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
@@ -317,6 +377,16 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+/**
+ * __tcs_buffer_write() - Write to TCS hardware from a request; don't trigger.
+ * @drv:    The controller.
+ * @tcs_id: The global ID of this TCS.
+ * @cmd_id: The index within the TCS to start writing.
+ * @msg:    The message we want to send, which will contain several addr/data
+ *          pairs to program (but few enough that they all fit in one TCS).
+ *
+ * This is used for all types of TCSs (active, sleep, and wake).
+ */
 static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
@@ -350,6 +420,11 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
 }
 
+/**
+ * __tcs_trigger() - Start transferring on the given ACTIVE_ONLY TCS.
+ * @drv:    The controller.
+ * @tcs_id: The global ID of this TCS.
+ */
 static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
 {
 	u32 enable;
@@ -372,6 +447,27 @@ static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
 	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
 }
 
+/**
+ * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
+ * @drv: The controller.
+ * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
+ * @msg: The message we want to send, which will contain several addr/data
+ *       pairs to program (but few enough that they all fit in one TCS).
+ *
+ * Only for use for ACTIVE_ONLY tcs_group, since those are the only ones
+ * that might be actively sending.
+ *
+ * This will walk through the TCSs in the group and check if any of them
+ * appear to be sending to addresses referenced in the message.  If it finds
+ * one it'll return -EBUSY.
+ *
+ * Must be called with the drv->lock held since that protects tcs_in_use.
+ *
+ * Return: 0 if nothing in flight or -EBUSY if we should try again later.
+ *         The caller must re-enable interrupts between tries since that's
+ *         the only way tcs_is_free() will ever return true and the only way
+ *         RSC_DRV_CMD_ENABLE will ever be cleared.
+ */
 static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 				  const struct tcs_request *msg)
 {
@@ -398,6 +494,14 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 	return 0;
 }
 
+/**
+ * find_free_tcs() - Find free tcs in the given tcs_group; only for ACTIVE_ONLY.
+ * @tcs: A pointer to the ACTIVE_ONLY tcs_group.
+ *
+ * Must be called with the drv->lock held since that protects tcs_in_use.
+ *
+ * Return: The first tcs that's free.
+ */
 static int find_free_tcs(struct tcs_group *tcs)
 {
 	int i;
@@ -410,6 +514,20 @@ static int find_free_tcs(struct tcs_group *tcs)
 	return -EBUSY;
 }
 
+/**
+ * tcs_write() - Store messages into a TCS right now, or return -EBUSY.
+ * @drv: The controller.
+ * @msg: The data to be sent.
+ *
+ * Grabs a TCS of type ACTIVE_ONLY and writes the messages to it.
+ *
+ * If there are no free ACTIVE_ONLY TCSs or if a command for the same address
+ * is already transferring returns -EBUSY which means the client should retry
+ * shortly.
+ *
+ * Return: 0 on success, -EBUSY if client should retry, or an error.
+ *         Client should have interrupts enabled for a bit before retrying.
+ */
 static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 {
 	struct tcs_group *tcs;
@@ -422,11 +540,8 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 		return PTR_ERR(tcs);
 
 	spin_lock_irqsave(&tcs->lock, flags);
+
 	spin_lock(&drv->lock);
-	/*
-	 * The h/w does not like if we send a request to the same address,
-	 * when one is already in-flight or being processed.
-	 */
 	ret = check_for_req_inflight(drv, tcs, msg);
 	if (ret) {
 		spin_unlock(&drv->lock);
@@ -453,14 +568,23 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 }
 
 /**
- * rpmh_rsc_send_data: Validate the incoming message and write to the
- * appropriate TCS block.
+ * rpmh_rsc_send_data() - Validate the incoming message + write to TCS block.
+ * @drv: The controller.
+ * @msg: The data to be sent.
  *
- * @drv: the controller
- * @msg: the data to be sent
+ * NOTES:
+ * - This is only used for "ACTIVE_ONLY" since the limitations of this
+ *   function don't make sense for sleep/wake cases.
+ * - To do the transfer, we will grab one of the "ACTIVE_ONLY" tcs for
+ *   ourselves--we don't try to share.  If there are none available we'll
+ *   wait indefinitely for a free one.  It's important that we _aren't_ being
+ *   called with IRQs disabled because of this (we might need the interrupt to
+ *   fire to free up a busy TCS)
+ * - This function will not wait for the commands to be finished, only for
+ *   that data to be programmed into the RPMh.  See rpmh_tx_done() which will
+ *   be called when the transfer is complete.
  *
  * Return: 0 on success, -EINVAL on error.
- * Note: This call blocks until a valid data is written to the TCS.
  */
 int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 {
@@ -484,6 +608,63 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return ret;
 }
 
+/**
+ * find_match() - Find if the cmd sequence is in the tcs_group
+ * @tcs: The tcs_group to search.  Either sleep or wake.
+ * @cmd: The command sequence to search for; only addr is looked at.
+ * @len: The number of commands in the sequence.
+ *
+ * Searches through the given tcs_group to see if a given command sequence
+ * is in there.
+ *
+ * Two sequences are matches if they modify the same set of addresses in
+ * the same order.  The value of the data is not considered when deciding if
+ * two things are matches.
+ *
+ * How this function works is best understood by example.  For our example,
+ * we'll imagine our tcs group contains these (cmd, data) tuples:
+ *   [(a, A), (b, B), (c, C), (d, D), (e, E), (f, F), (g, G), (h, H)]
+ * ...in other words it has an element where (addr=a, data=A), etc.
+ * ...we'll assume that there is one TCS in the group that can store 8 commands.
+ *
+ * - find_match([(a, X)]) => 0
+ * - find_match([(c, X), (d, X)]) => 2
+ * - find_match([(c, X), (d, X), (e, X)]) => 2
+ * - find_match([(z, X)]) => -ENODATA
+ * - find_match([(a, X), (y, X)]) => -EINVAL (and warning printed)
+ * - find_match([(g, X), (h, X), (i, X)]) => -EINVAL (and warning printed)
+ * - find_match([(y, X), (a, X)]) => -ENODATA
+ *
+ * NOTE: This function overall seems like it has questionable value.
+ * - It can be used to update a message in the TCS with new data, but I
+ *   don't believe we actually do that--we always fully invalidate and
+ *   re-write everything.  Specifically it would be too limiting to force
+ *   someone not to change the set of addresses written to each time.
+ * - This function could be attempting to avoid writing different data to
+ *   the same address twice in a tcs_group.  If that's the goal, it doesn't
+ *   do a great job since find_match([(y, X), (a, X)]) return -ENODATA in my
+ *   above example.
+ * - If you originally wrote [(a, A), (b, B), (c, C)] and later tried to
+ *   write [(a, A), (b, B)] it'd look like a match and we wouldn't consider
+ *   it an error that the size got shorter.
+ * - If two clients wrote sequences that happened to be placed in slots next
+ *   to each other then a later check could match a sequence that was the
+ *   size of both together.
+ *
+ * TODO: in light of the above, prehaps we can just remove this function?
+ * If we later come up with fancy algorithms for updating everything without
+ * full invalidations we can come up with something then.
+ *
+ * Only for use on sleep/wake TCSs since those are the only ones we maintain
+ * tcs->slots and tcs->cmd_cache for.
+ *
+ * Must be called with the tcs_lock for the group held.
+ *
+ * Return: If the given command sequence wasn't in the tcs_group: -ENODATA.
+ *         If the given command sequence was in the tcs_group: the index of
+ *         the slot in the tcs_group where the first command is.
+ *         In some error cases (see above), -EINVAL.
+ */
 static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
 		      int len)
 {
@@ -496,6 +677,11 @@ static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
 		if (i + len >= tcs->num_tcs * tcs->ncpt)
 			goto seq_err;
 		for (j = 0; j < len; j++) {
+			/*
+			 * TODO: it's actually not valid to look at
+			 * "cmd_cache[x]" if "slots[x]" doesn't have a bit
+			 * set.  Should add a check.
+			 */
 			if (tcs->cmd_cache[i + j] != cmd[j].addr)
 				goto seq_err;
 		}
@@ -509,6 +695,23 @@ static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
 	return -EINVAL;
 }
 
+/**
+ * find_slots() - Find a place to write the given message.
+ * @tcs:    The controller.
+ * @msg:    The message we want to find room for.
+ * @tcs_id: If we return 0 from the function, we return the global ID of the
+ *          TCS to write to here.
+ * @cmd_id: If we return 0 from the function, we return the index of
+ *          the command array of the returned TCS where the client should
+ *          start writing the message.
+ *
+ * Only for use on sleep/wake TCSs since those are the only ones we maintain
+ * tcs->slots and tcs->cmd_cache for.
+ *
+ * Must be called with the tcs_lock for the group held.
+ *
+ * Return: -ENOMEM if there was no room, else 0.
+ */
 static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 		      int *tcs_id, int *cmd_id)
 {
@@ -520,7 +723,7 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 	if (slot >= 0)
 		goto copy_data;
 
-	/* Do over, until we can fit the full payload in a TCS */
+	/* Do over, until we can fit the full payload in a single TCS */
 	do {
 		slot = bitmap_find_next_zero_area(tcs->slots, MAX_TCS_SLOTS,
 						  i, msg->num_cmds, 0);
@@ -543,12 +746,13 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 }
 
 /**
- * rpmh_rsc_write_ctrl_data: Write request to the controller
- *
- * @drv: the controller
- * @msg: the data to be written to the controller
+ * rpmh_rsc_write_ctrl_data() - Write request to controller but don't trigger.
+ * @drv: The controller.
+ * @msg: The data to be written to the controller.
  *
  * There is no response returned for writing the request to the controller.
+ *
+ * Return: 0 if no error; else -error.
  */
 int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 {
-- 
2.25.1.481.gfbce0eb801-goog

