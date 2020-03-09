Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E5B17DC7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgCIJbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:31:45 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29325 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbgCIJbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:31:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583746304; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=b+OMlUkujLRmWNAOLxKHBxLAHMWPs5UHeP/OZ8evMOM=; b=du9kPkgUX3M+KycUB2tOovEhopPRa+Z+88Gvyy1lO+ipt3+hQmn9AVyMVIkaq45tb+b0CsOH
 /oD6MAqEwjwHAfMdAmekAl6Oo1h3EzXTLvyVDkkFEW+eKNgnPEbDqW2d2K3hCAkY1zxj7y43
 VDjKiIIfym+OvLbhyq2jv9yZ00A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e660cff.7fb6016697a0-smtp-out-n01;
 Mon, 09 Mar 2020 09:31:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63861C433CB; Mon,  9 Mar 2020 09:31:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E4E2C4478F;
        Mon,  9 Mar 2020 09:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E4E2C4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v13 5/5] drivers: qcom: Update rpmh clients to use start and end transactions
Date:   Mon,  9 Mar 2020 15:00:36 +0530
Message-Id: <1583746236-13325-6-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update all rpmh clients to start using rpmh_start_transaction() and
rpmh_end_transaction().

Cc: Taniya Das <tdas@codeaurora.org>
Cc: Odelu Kukatla <okukatla@codeaurora.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>
Cc: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/clk/qcom/clk-rpmh.c             | 21 ++++++++++++++-------
 drivers/interconnect/qcom/bcm-voter.c   | 13 +++++++++----
 drivers/regulator/qcom-rpmh-regulator.c |  4 ++++
 drivers/soc/qcom/rpmhpd.c               | 11 +++++++++--
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 12bd871..16f68d4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -154,22 +154,27 @@ static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
 	cmd_state = c->aggr_state;
 	on_val = c->res_on_val;
 
+	rpmh_start_transaction(c->dev);
+
 	for (; state <= RPMH_ACTIVE_ONLY_STATE; state++) {
 		if (has_state_changed(c, state)) {
 			if (cmd_state & BIT(state))
 				cmd.data = on_val;
 
 			ret = rpmh_write_async(c->dev, state, &cmd, 1);
-			if (ret) {
-				dev_err(c->dev, "set %s state of %s failed: (%d)\n",
-					!state ? "sleep" :
-					state == RPMH_WAKE_ONLY_STATE	?
-					"wake" : "active", c->res_name, ret);
-				return ret;
-			}
+			if (ret)
+				break;
 		}
 	}
 
+	ret |= rpmh_end_transaction(c->dev);
+	if (ret) {
+		dev_err(c->dev, "set %s state of %s failed: (%d)\n",
+			!state ? "sleep" : state == RPMH_WAKE_ONLY_STATE ?
+			"wake" : "active", c->res_name, ret);
+		return ret;
+	}
+
 	c->last_sent_aggr_state = c->aggr_state;
 	c->peer->last_sent_aggr_state =  c->last_sent_aggr_state;
 
@@ -267,7 +272,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 	cmd.addr = c->res_addr;
 	cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
 
+	rpmh_start_transaction(c->dev);
 	ret = rpmh_write_async(c->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
+	ret |= rpmh_end_transaction(c->dev);
 	if (ret) {
 		dev_err(c->dev, "set active state of %s failed: (%d)\n",
 			c->res_name, ret);
diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 2adfde8..fbe18b2 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -263,7 +263,9 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
 	tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_AMC, cmds, commit_idx);
 
 	if (!commit_idx[0])
-		goto out;
+		goto end;
+
+	rpmh_start_transaction(voter-dev);
 
 	ret = rpmh_invalidate(voter->dev);
 	if (ret) {
@@ -312,12 +314,15 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
 	tcs_list_gen(&voter->commit_list, QCOM_ICC_BUCKET_SLEEP, cmds, commit_idx);
 
 	ret = rpmh_write_batch(voter->dev, RPMH_SLEEP_STATE, cmds, commit_idx);
-	if (ret) {
+	if (ret)
 		pr_err("Error sending SLEEP RPMH requests (%d)\n", ret);
-		goto out;
-	}
 
 out:
+	ret = rpmh_end_transaction(voter-dev);
+	if (ret)
+		pr_err("Error ending rpmh transaction (%d)\n", ret);
+
+end:
 	list_for_each_entry_safe(bcm, bcm_tmp, &voter->commit_list, list)
 		list_del_init(&bcm->list);
 
diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index c86ad40..f4b9176 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -163,12 +163,16 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 {
 	int ret;
 
+	rpmh_start_transaction(vreg->dev);
+
 	if (wait_for_ack || vreg->always_wait_for_ack)
 		ret = rpmh_write(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd, 1);
 	else
 		ret = rpmh_write_async(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd,
 					1);
 
+	ret |= rpmh_end_transaction(vreg->dev);
+
 	return ret;
 }
 
diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 4d264d0..0e9d204 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -193,19 +193,26 @@ static const struct of_device_id rpmhpd_match_table[] = {
 static int rpmhpd_send_corner(struct rpmhpd *pd, int state,
 			      unsigned int corner, bool sync)
 {
+	int ret;
 	struct tcs_cmd cmd = {
 		.addr = pd->addr,
 		.data = corner,
 	};
 
+	rpmh_start_transaction(pd->dev);
+
 	/*
 	 * Wait for an ack only when we are increasing the
 	 * perf state of the power domain
 	 */
 	if (sync)
-		return rpmh_write(pd->dev, state, &cmd, 1);
+		ret = rpmh_write(pd->dev, state, &cmd, 1);
 	else
-		return rpmh_write_async(pd->dev, state, &cmd, 1);
+		ret = rpmh_write_async(pd->dev, state, &cmd, 1);
+
+	ret |= rpmh_end_transaction(pd->dev);
+
+	return ret;
 }
 
 static void to_active_sleep(struct rpmhpd *pd, unsigned int corner,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
