Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F941825A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731448AbgCKXOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:14 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53934 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731338AbgCKXON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:13 -0400
Received: by mail-pj1-f66.google.com with SMTP id l36so1706777pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PV3+rsqW3G7K5hlkhIrJBc69bnftS3pQw9KwpyvMaqE=;
        b=LPNhui0z7fgOHv5VmaKW8Q3oPQibJt17I4z7uvFu3ortliSvgBwYPXf2hbqMvgwA3r
         kUBL7zN9EcbyRr8IPmVce235Q1MlVSTl1n9ioc5ZK8Y+2ZpL8tgbLHalS3apy8Sh6Qi/
         xdGnQFWD7k10rP0OG7mb5il/kktLXrrmT8fdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PV3+rsqW3G7K5hlkhIrJBc69bnftS3pQw9KwpyvMaqE=;
        b=CWZzrF2fmFuWv5wddER8eZUhw9PGLlu6jP2fE9J+LHFvJrwRpGV8/2RLtWQsQ1+G3U
         ld8UsweGquedrOKMzBA1hWbLrUPQ3QcL+4yXB0EN+X7nzBzLl8ztx0PzPkJzPjlRrFYb
         hPiBpf4bBOeCDXZGkg7MMPcUsMAsdWSGZZUhXr+JP+vOPuUs7wC0wx5dmqSjjagGup+p
         NSPi9hedIJ9NRji1otgTWwRDO9xvAhcrH1ewJIPPlepfXRAG3oHPYjrM8IeuWgz7hYK9
         McZLOWM+7fQ5k8UNKZBUzEz5/WfNCVD20WI1K+uc7DjwDrLYCWM+f7oXe/heBocKAcDi
         AXPw==
X-Gm-Message-State: ANhLgQ0qxBI9sRp/sFKlk+nfjR9jSTl9+BV4JA/kpaFrha9pIYlM0hN1
        Zxj22f2LfCw56f3hV28kVapsdw==
X-Google-Smtp-Source: ADFU+vu3sQ368RVO6S1ZZTgdPc6p7c3SQuo0BBPWkU8Q2oKfhElVFwRi5HIEq6h1lYkvmms8xq7JBg==
X-Received: by 2002:a17:90b:19ca:: with SMTP id nm10mr1029173pjb.157.1583968452725;
        Wed, 11 Mar 2020 16:14:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:12 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 01/10] drivers: qcom: rpmh-rsc: Clean code reading/writing regs/cmds
Date:   Wed, 11 Mar 2020 16:13:39 -0700
Message-Id: <20200311161104.RFT.v2.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311231348.129254-1-dianders@chromium.org>
References: <20200311231348.129254-1-dianders@chromium.org>
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
---

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index b71822131f59..b87b79f0347d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -61,28 +61,33 @@
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
@@ -94,7 +99,7 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
 static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 {
 	return !test_bit(tcs_id, drv->tcs_in_use) &&
-	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
+	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
 }
 
 static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
@@ -212,7 +217,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	const struct tcs_request *req;
 	struct tcs_cmd *cmd;
 
-	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0, 0);
+	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
 
 	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
 		req = get_req_from_tcs(drv, i);
@@ -226,7 +231,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 			u32 sts;
 
 			cmd = &req->cmds[j];
-			sts = read_tcs_reg(drv, RSC_DRV_CMD_STATUS, i, j);
+			sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
 			if (!(sts & CMD_STATUS_ISSUED) ||
 			   ((req->wait_for_compl || cmd->wait) &&
 			   !(sts & CMD_STATUS_COMPL))) {
@@ -265,7 +270,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
 	cmd_msgid |= CMD_MSGID_WRITE;
 
-	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
+	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];
@@ -281,7 +286,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 	}
 
 	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
-	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
+	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
 	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
 }
 
@@ -294,7 +299,7 @@ static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
 	 * While clearing ensure that the AMC mode trigger is cleared
 	 * and then the mode enable is cleared.
 	 */
-	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
+	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id);
 	enable &= ~TCS_AMC_MODE_TRIGGER;
 	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
 	enable &= ~TCS_AMC_MODE_ENABLE;
@@ -319,10 +324,10 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
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
2.25.1.481.gfbce0eb801-goog

