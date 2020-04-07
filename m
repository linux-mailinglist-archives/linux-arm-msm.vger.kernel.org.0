Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5D51A18D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgDGXu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:50:58 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50329 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgDGXu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:50:57 -0400
Received: by mail-pj1-f67.google.com with SMTP id b7so286374pju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31rj24m3X17PSEbUwC15en+C3wJXpiCj3YBFX5nStr0=;
        b=TbW/TRy4ANNKKWudxkfhBucJ4xL+Fdi5v8Mo+7DB7BBnQDGE+OgJICZAZc4JQA43Tp
         OMFN3zq8v7oWTmxXZF+Pi1ymZ/Xq9Xvhar2Jm2gAne+3CwTaVa7K3VG6F3qTSqufmAMG
         JgIIQoQGAWPX4dfnzg/acPEa8j6aGAzenr9c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31rj24m3X17PSEbUwC15en+C3wJXpiCj3YBFX5nStr0=;
        b=ZxochBToO/LeU0P0ZKr2HFfe2ujosrXJHGN3M+y+KDvOcTeIvAyftW4pOpVid9xUaw
         xow/UMC56unyStMd31KiaT9IZPRA1NRZAtFdemaylM/2zDprBWHAdj12LnJrcFyzWnj/
         3TaiLLTWZb6OYW2tduzJbkDweWRc5xlWimKxcXUhekdD/7lvIOuaPU/sXzBeU0LRyvg9
         Fq7DZlDSosZFbXuh4PWwvGvutfflfertWWyHZc6Np/9bRr1yYaNdMc92pWHOQJT92OaJ
         rB9DQzvMUINKZH4uWkfCCVFzwzyF2i9E5kgvlxRqvqWvjsJy50byhknwnBYBG5iDpkxX
         HC8w==
X-Gm-Message-State: AGi0Pub0j4VIVDGEceJ6WbmU6on3iz07BFS0cwcO+2QyXXhOtVZRsLXM
        v8QVs7mRCITCINhGsWh0NTYAvmKdEaSedg==
X-Google-Smtp-Source: APiQypLOQrDPqBz3TL/1fx/TZxlRaUpgmLYmCaFCTC3+YFsxeD17UsRD/hpVcFJQYI9/nBhHHZV3Ww==
X-Received: by 2002:a17:90a:c085:: with SMTP id o5mr1878124pjs.85.1586303456983;
        Tue, 07 Apr 2020 16:50:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:50:56 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] drivers: qcom: rpmh-rsc: Clean code reading/writing TCS regs/cmds
Date:   Tue,  7 Apr 2020 16:50:15 -0700
Message-Id: <20200407164915.v3.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200407235024.260460-1-dianders@chromium.org>
References: <20200407235024.260460-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch makes two changes, both of which should be no-ops:

1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
   write_tcs_cmd().

2. Change the order of operations in the above functions to make it
   more obvious to me what the math is doing.  Specifically first you
   want to find the right TCS, then the right register, and then
   multiply by the command ID if necessary.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---

Changes in v3:
- Add "TCS" in title (Maulik).
- Rebased atop v16 ('Invoke rpmh_flush...') series.

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 34b0e14c2f33..7d9e2c2f0e27 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -67,28 +67,33 @@
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
-static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
+static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
 {
-	return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
+	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
 			     RSC_DRV_CMD_OFFSET * cmd_id);
 }
 
+static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id)
+{
+	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
+}
+
 static void write_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id,
 			  u32 data)
 {
-	writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
+	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
 		       RSC_DRV_CMD_OFFSET * cmd_id);
 }
 
 static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, u32 data)
 {
-	writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id);
+	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
 }
 
 static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
 			       u32 data)
 {
-	writel(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id);
+	writel(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
 	for (;;) {
 		if (data == readl(drv->tcs_base + reg +
 				  RSC_DRV_TCS_OFFSET * tcs_id))
@@ -100,7 +105,7 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
 static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 {
 	return !test_bit(tcs_id, drv->tcs_in_use) &&
-	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
+	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
 }
 
 static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
@@ -207,7 +212,7 @@ static void __tcs_set_trigger(struct rsc_drv *drv, int tcs_id, bool trigger)
 	 * While clearing ensure that the AMC mode trigger is cleared
 	 * and then the mode enable is cleared.
 	 */
-	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
+	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id);
 	enable &= ~TCS_AMC_MODE_TRIGGER;
 	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
 	enable &= ~TCS_AMC_MODE_ENABLE;
@@ -226,7 +231,7 @@ static void enable_tcs_irq(struct rsc_drv *drv, int tcs_id, bool enable)
 {
 	u32 data;
 
-	data = read_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, 0);
+	data = read_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0);
 	if (enable)
 		data |= BIT(tcs_id);
 	else
@@ -245,7 +250,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	const struct tcs_request *req;
 	struct tcs_cmd *cmd;
 
-	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0, 0);
+	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
 
 	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
 		req = get_req_from_tcs(drv, i);
@@ -259,7 +264,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 			u32 sts;
 
 			cmd = &req->cmds[j];
-			sts = read_tcs_reg(drv, RSC_DRV_CMD_STATUS, i, j);
+			sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
 			if (!(sts & CMD_STATUS_ISSUED) ||
 			   ((req->wait_for_compl || cmd->wait) &&
 			   !(sts & CMD_STATUS_COMPL))) {
@@ -313,7 +318,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
 	cmd_msgid |= CMD_MSGID_WRITE;
 
-	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
+	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];
@@ -329,7 +334,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 	}
 
 	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
-	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
+	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
 	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
 }
 
@@ -345,10 +350,10 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 		if (tcs_is_free(drv, tcs_id))
 			continue;
 
-		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
+		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
 
 		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
-			addr = read_tcs_reg(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
+			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
 			for (k = 0; k < msg->num_cmds; k++) {
 				if (addr == msg->cmds[k].addr)
 					return -EBUSY;
-- 
2.26.0.292.g33ef6b2f38-goog

