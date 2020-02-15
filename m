Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF8815FC4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2020 03:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgBOCMx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 21:12:53 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:29188 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727641AbgBOCMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 21:12:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581732773; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=FWN168EASJBq5LyNsiOFzXjZn7DYbmkiFzZr0eZ3VcM=; b=erSLoIYAywXvR74DKvBvQC0JXH4irHG2kBO9AMCMTRjHoHJPYwmXYSw7uuPWsstT99tb+wFn
 sEdemgo0REFf3zSBXi26p/okjfz84tmRxsyN6rrAOLaAEkQ9YWZnE0qJoIocTGgLqcf4Z//7
 SUHy3Da4iq5Izn53hpvrJP2dHQs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e47539f.7f03a1d35148-smtp-out-n03;
 Sat, 15 Feb 2020 02:12:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38597C4479C; Sat, 15 Feb 2020 02:12:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mdtipton-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D828C43383;
        Sat, 15 Feb 2020 02:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D828C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     sboyd@kernel.org, tdas@codeaurora.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH] clk: qcom: clk-rpmh: Wait for completion when enabling clocks
Date:   Fri, 14 Feb 2020 18:12:32 -0800
Message-Id: <20200215021232.1149-1-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current implementation always uses rpmh_write_async, which doesn't
wait for completion. That's fine for disable requests since there's no
immediate need for the clocks and they can be disabled in the
background. However, for enable requests we need to ensure the clocks
are actually enabled before returning to the client. Otherwise, clients
can end up accessing their HW before the necessary clocks are enabled,
which can lead to bus errors.

Use the synchronous version of this API (rpmh_write) for enable requests
in the active set to ensure completion.

Completion isn't required for sleep/wake sets, since they don't take
effect until after we enter sleep. All rpmh requests are automatically
flushed prior to entering sleep.

Fixes: 9c7e47025a6b ("clk: qcom: clk-rpmh: Add QCOM RPMh clock driver")
Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/clk/qcom/clk-rpmh.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 12bd8715dece..3137595a736b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -143,6 +143,19 @@ static inline bool has_state_changed(struct clk_rpmh *c, u32 state)
 		!= (c->aggr_state & BIT(state));
 }
 
+static int clk_rpmh_send(struct clk_rpmh *c, enum rpmh_state state,
+			 struct tcs_cmd *cmd, bool wait_for_completion)
+{
+	int ret;
+
+	if (wait_for_completion)
+		ret = rpmh_write(c->dev, state, cmd, 1);
+	else
+		ret = rpmh_write_async(c->dev, state, cmd, 1);
+
+	return ret;
+}
+
 static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
 {
 	struct tcs_cmd cmd = { 0 };
@@ -159,7 +172,8 @@ static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
 			if (cmd_state & BIT(state))
 				cmd.data = on_val;
 
-			ret = rpmh_write_async(c->dev, state, &cmd, 1);
+			ret = clk_rpmh_send(c, state, &cmd,
+				cmd_state && state == RPMH_ACTIVE_ONLY_STATE);
 			if (ret) {
 				dev_err(c->dev, "set %s state of %s failed: (%d)\n",
 					!state ? "sleep" :
@@ -267,7 +281,7 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 	cmd.addr = c->res_addr;
 	cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
 
-	ret = rpmh_write_async(c->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
+	ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
 	if (ret) {
 		dev_err(c->dev, "set active state of %s failed: (%d)\n",
 			c->res_name, ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
