Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CAB1B884B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 19:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgDYRxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 13:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726061AbgDYRxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 13:53:16 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600BFC09B04F
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:16 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so5014317plk.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2H7usqlbduVlZK72DDGWtXsXMJVayhsmK/bG+MZS0kI=;
        b=De+BTV+aIEMuXio/YsoZFAD90RuZ85Ft0Y0NuNCWVcuJggrs6w4VCEe/byGwZdefhV
         YGSEf+wDIXD57JkIiX1sx6Ks3qlgl55Ry/FakqAXBKXD6jgLrjP15WlC1oFYz3YRz15g
         Zn16BfhTDesvRLlap7hDcHLMQmYGuvM3Rky+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2H7usqlbduVlZK72DDGWtXsXMJVayhsmK/bG+MZS0kI=;
        b=U3RMWv89DJ76EZFpr+IQjxnNEUIFX+EbynTETo1yx+d+0XxFHvJa302EGk8oktJtW+
         Wwg6iLbSDhP9T1ePiJlfSdqxKzgFCOhFSPOS0WN8qlZovo8R5s0pDQh8xg0CLp2d0kPC
         2BeN5Ih9l2lEU2vldbg88UqpiX07fIVHaKZGCzXKg4deS6sHrYh+xJHecSKr+QeA1OFD
         QY/4Q0H7rrOi4EX0CTJAUWMgyG8RhARfoOcvFqBObizBZniqsQgv5MxJBsn6jEn5lLC+
         irBW1OkcoFzbOgIJQaJVTBg8u2qhHWzoETNgDpvHlEP8pTmZFuMzuhhrOxeBl61/HuOm
         yHTA==
X-Gm-Message-State: AGi0PubFrV3pIBVkQHeDMGVpyAzeeWrNT5bfu1ocUXQMAfKOoS2nP2cL
        cwpVuPEiAUKlQvXcAO+IMTNniw==
X-Google-Smtp-Source: APiQypL6MYikX16QKY1h1SC/tN4cWvLOgNhvS0g/O/h+0ec1NRVZ2Revty4unyzgH8+FnpNeyoOMOw==
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr782211pjq.184.1587837195579;
        Sat, 25 Apr 2020 10:53:15 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v127sm8342148pfv.77.2020.04.25.10.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:53:15 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() and find_free_tcs() APIs
Date:   Sat, 25 Apr 2020 10:53:10 -0700
Message-Id: <20200425175312.124892-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200425175312.124892-1-swboyd@chromium.org>
References: <20200425175312.124892-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These APIs do very little. Let's replace all the callsites with the
normal operations that would be done on top of the tcs_in_use bitmap
This simplifies and reduces the code size.

Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 109 ++++++++++++------------------------
 1 file changed, 37 insertions(+), 72 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 571aa1012f23..3f4951840365 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -172,22 +172,6 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
 	}
 }
 
-/**
- * tcs_is_free() - Return if a TCS is totally free.
- * @drv:    The RSC controller.
- * @tcs_id: The global ID of this TCS.
- *
- * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
- *
- * Context: Must be called with the drv->lock held.
- *
- * Return: true if the given TCS is free.
- */
-static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
-{
-	return !test_bit(tcs_id, drv->tcs_in_use);
-}
-
 /**
  * tcs_invalidate() - Invalidate all TCSes of the given type (sleep or wake).
  * @drv:  The RSC controller.
@@ -484,7 +468,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 }
 
 /**
- * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
+ * check_for_req_inflight_and_find_free() - Find an available tcs for a req
  * @drv: The controller.
  * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
  * @msg: The message we want to send, which will contain several addr/data
@@ -492,33 +476,37 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
  *
  * This will walk through the TCSes in the group and check if any of them
  * appear to be sending to addresses referenced in the message. If it finds
- * one it'll return -EBUSY.
+ * one it'll return -EBUSY because the hardware can't handle more than
+ * one of the same address being changed at the same time.
  *
- * Only for use for active-only transfers.
+ * Only for use with active-only transfers.
  *
  * Must be called with the drv->lock held since that protects tcs_in_use.
  *
- * Return: 0 if nothing in flight or -EBUSY if we should try again later.
+ * Return: offset` of free slot if nothing in flight and a free slot is found
+ *         or -EBUSY if we should try again later.
  *         The caller must re-enable interrupts between tries since that's
- *         the only way tcs_is_free() will ever return true and the only way
+ *         the only way tcs_in_use will ever be updated and the only way
  *         RSC_DRV_CMD_ENABLE will ever be cleared.
  */
-static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
-				  const struct tcs_request *msg)
+static int check_for_req_inflight_and_find_free(struct rsc_drv *drv,
+	const struct tcs_group *tcs, const struct tcs_request *msg)
 {
 	unsigned long curr_enabled;
 	u32 addr;
-	int i, j, k;
-	int tcs_id = tcs->offset;
-
-	for (i = 0; i < tcs->num_tcs; i++, tcs_id++) {
-		if (tcs_is_free(drv, tcs_id))
-			continue;
+	int j, k;
+	int i = tcs->offset;
+	unsigned long max = tcs->offset + tcs->num_tcs;
+	int first_free = i;
 
-		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
+	for_each_set_bit_from(i, drv->tcs_in_use, max) {
+		/* Find a free tcs to use in this group */
+		if (first_free == i)
+			first_free = i + 1; /* Maybe the next one is free? */
 
+		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i);
 		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
-			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
+			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i, j);
 			for (k = 0; k < msg->num_cmds; k++) {
 				if (addr == msg->cmds[k].addr)
 					return -EBUSY;
@@ -526,28 +514,11 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 		}
 	}
 
-	return 0;
-}
+	if (first_free >= max)
+		return -EBUSY;
 
-/**
- * find_free_tcs() - Find free tcs in the given tcs_group; only for active.
- * @tcs: A pointer to the active-only tcs_group (or the wake tcs_group if
- *       we borrowed it because there are zero active-only ones).
- *
- * Must be called with the drv->lock held since that protects tcs_in_use.
- *
- * Return: The first tcs that's free.
- */
-static int find_free_tcs(struct tcs_group *tcs)
-{
-	int i;
-
-	for (i = 0; i < tcs->num_tcs; i++) {
-		if (tcs_is_free(tcs->drv, tcs->offset + i))
-			return tcs->offset + i;
-	}
-
-	return -EBUSY;
+	set_bit(first_free, drv->tcs_in_use);
+	return first_free;
 }
 
 /**
@@ -580,17 +551,14 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 	 * The h/w does not like if we send a request to the same address,
 	 * when one is already in-flight or being processed.
 	 */
-	ret = check_for_req_inflight(drv, tcs, msg);
-	if (ret)
-		goto unlock;
-
-	ret = find_free_tcs(tcs);
-	if (ret < 0)
+	tcs_id = check_for_req_inflight_and_find_free(drv, tcs, msg);
+	if (tcs_id < 0) {
+		ret = tcs_id;
 		goto unlock;
-	tcs_id = ret;
+	}
 
+	ret = 0;
 	tcs->req[tcs_id - tcs->offset] = msg;
-	set_bit(tcs_id, drv->tcs_in_use);
 	if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS) {
 		/*
 		 * Clear previously programmed WAKE commands in selected
@@ -601,6 +569,7 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
 	}
+unlock:
 	spin_unlock_irqrestore(&drv->lock, flags);
 
 	/*
@@ -611,12 +580,11 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 	 * - The interrupt can't go off until we trigger w/ the last line
 	 *   of __tcs_set_trigger() below.
 	 */
-	__tcs_buffer_write(drv, tcs_id, 0, msg);
-	__tcs_set_trigger(drv, tcs_id, true);
+	if (!ret) {
+		__tcs_buffer_write(drv, tcs_id, 0, msg);
+		__tcs_set_trigger(drv, tcs_id, true);
+	}
 
-	return 0;
-unlock:
-	spin_unlock_irqrestore(&drv->lock, flags);
 	return ret;
 }
 
@@ -745,8 +713,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
  */
 static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 {
-	int m;
-	struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
+	const struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
+	unsigned long max;
 
 	/*
 	 * If we made an active request on a RSC that does not have a
@@ -757,12 +725,9 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	if (!tcs->num_tcs)
 		tcs = &drv->tcs[WAKE_TCS];
 
-	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
-		if (!tcs_is_free(drv, m))
-			return true;
-	}
+	max = tcs->offset + tcs->num_tcs;
 
-	return false;
+	return find_next_bit(drv->tcs_in_use, max, tcs->offset) < max;
 }
 
 /**
-- 
Sent by a computer, using git, on the internet

