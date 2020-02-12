Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5325515A726
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 11:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgBLK4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 05:56:45 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:35599 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726135AbgBLK4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 05:56:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581505004; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GgGdnQiGjiv3xnZSnRL4TDENqIG1X0sOvTyesB/zZcQ=; b=RMwP0JyEobelUnfZ5O4CEAWNAZtByseKy6G9VTp+YlzCtYY/abeJ4U7VVD452rFr9jikhsDM
 VVVSMQz/G1y/IqzgeciMhJiRRuMUF/gc1RvIyky8HUhtfj1r7aAPUlNwr42qx8jrSmyFxqML
 e3/DYhDVIrnTVcGdLAu7R5Q77YI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e43d9eb.7f8949a89848-smtp-out-n03;
 Wed, 12 Feb 2020 10:56:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 815FFC447A2; Wed, 12 Feb 2020 10:56:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B65A6C433A2;
        Wed, 12 Feb 2020 10:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B65A6C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 1/2] soc: qcom: rpmh-rsc: Output debug information from RSC
Date:   Wed, 12 Feb 2020 16:26:11 +0530
Message-Id: <1581504972-22632-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581504972-22632-1-git-send-email-mkshah@codeaurora.org>
References: <1581504972-22632-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

Output the TCS state when the debug api is invoked. The state of the
TCS, the contents and the IRQ status is presented. Additionally, crash
the system if any TCS is busy to help with the debug.

Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-internal.h |   3 +
 drivers/soc/qcom/rpmh-rsc.c      | 121 ++++++++++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh.c          |  11 +++-
 3 files changed, 130 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index a7bbbb6..15560c63 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -92,6 +92,7 @@ struct rpmh_ctrlr {
  * @tcs_in_use: s/w state of the TCS
  * @lock:       synchronize state of the controller
  * @client:     handle to the DRV's client.
+ * @irq:        IRQ at gic
  */
 struct rsc_drv {
 	const char *name;
@@ -102,6 +103,7 @@ struct rsc_drv {
 	DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
 	spinlock_t lock;
 	struct rpmh_ctrlr client;
+	int irq;
 };
 
 int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg);
@@ -110,5 +112,6 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv,
 int rpmh_rsc_invalidate(struct rsc_drv *drv);
 
 void rpmh_tx_done(const struct tcs_request *msg, int r);
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl);
 
 #endif /* __RPM_INTERNAL_H__ */
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index e278fc1..3595e4d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -61,6 +61,17 @@
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
+#define ACCL_TYPE(addr)			((addr >> 16) & 0xF)
+#define NR_ACCL_TYPES			3
+#define MAX_RSC_COUNT			2
+
+static const char * const accl_str[] = {
+	"", "", "", "CLK", "VREG", "BUS",
+};
+
+static struct rsc_drv *__rsc_drv[MAX_RSC_COUNT];
+static int __rsc_count;
+
 static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
 {
 	return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
@@ -410,8 +421,8 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	do {
 		ret = tcs_write(drv, msg);
 		if (ret == -EBUSY) {
-			pr_info_ratelimited("TCS Busy, retrying RPMH message send: addr=%#x\n",
-					    msg->cmds[0].addr);
+			pr_info_ratelimited("DRV:%s TCS Busy, retrying RPMH message send: addr=%#x\n",
+					    drv->name, msg->cmds[0].addr);
 			udelay(10);
 		}
 	} while (ret == -EBUSY);
@@ -521,6 +532,108 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return tcs_ctrl_write(drv, msg);
 }
 
+static struct tcs_group *get_tcs_from_index(struct rsc_drv *drv, int tcs_id)
+{
+	unsigned int i;
+
+	for (i = 0; i < TCS_TYPE_NR; i++) {
+		if (drv->tcs[i].mask & BIT(tcs_id))
+			return &drv->tcs[i];
+	}
+
+	return NULL;
+}
+
+static void print_tcs_info(struct rsc_drv *drv, int tcs_id, unsigned long *accl)
+{
+	struct tcs_group *tcs_grp = get_tcs_from_index(drv, tcs_id);
+	const struct tcs_request *req = get_req_from_tcs(drv, tcs_id);
+	unsigned long cmds_enabled;
+	u32 addr, data, msgid, sts, irq_sts;
+	bool in_use = test_bit(tcs_id, drv->tcs_in_use);
+	int i;
+
+	if (!tcs_grp || !req)
+		return;
+
+	sts = read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
+	cmds_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
+	if (!cmds_enabled)
+		return;
+
+	data = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
+	irq_sts = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0, 0);
+	pr_warn("Request: tcs-in-use:%s active_tcs=%s(%d) state=%d wait_for_compl=%u]\n",
+		(in_use ? "YES" : "NO"),
+		((tcs_grp->type == ACTIVE_TCS) ? "YES" : "NO"),
+		tcs_grp->type, req->state, req->wait_for_compl);
+	pr_warn("TCS=%d [ctrlr-sts:%s amc-mode:0x%x irq-sts:%s]\n",
+		tcs_id, sts ? "IDLE" : "BUSY", data,
+		(irq_sts & BIT(tcs_id)) ? "COMPLETED" : "PENDING");
+
+	for_each_set_bit(i, &cmds_enabled, MAX_CMDS_PER_TCS) {
+		addr = read_tcs_reg(drv, RSC_DRV_CMD_ADDR, tcs_id, i);
+		data = read_tcs_reg(drv, RSC_DRV_CMD_DATA, tcs_id, i);
+		msgid = read_tcs_reg(drv, RSC_DRV_CMD_MSGID, tcs_id, i);
+		sts = read_tcs_reg(drv, RSC_DRV_CMD_STATUS, tcs_id, i);
+		pr_warn("\tCMD=%d [addr=0x%x data=0x%x hdr=0x%x sts=0x%x enabled=1]\n",
+			i, addr, data, msgid, sts);
+		if (!(sts & CMD_STATUS_ISSUED))
+			continue;
+		if (!(sts & CMD_STATUS_COMPL))
+			*accl |= BIT(ACCL_TYPE(addr));
+	}
+}
+
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
+{
+	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
+	bool irq_sts;
+	int i;
+	int busy = 0;
+	unsigned long accl = 0;
+	char str[20] = "";
+
+	pr_warn("RSC:%s\n", drv->name);
+
+	for (i = 0; i < drv->num_tcs; i++) {
+		if (!test_bit(i, drv->tcs_in_use))
+			continue;
+		busy++;
+		print_tcs_info(drv, i, &accl);
+	}
+
+	if (!rsc_irq_data) {
+		pr_err("No IRQ data for RSC:%s\n", drv->name);
+		return;
+	}
+
+	irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING, &irq_sts);
+	pr_warn("HW IRQ %lu is %s at GIC\n", rsc_irq_data->hwirq,
+		irq_sts ? "PENDING" : "NOT PENDING");
+	pr_warn("Completion is %s to finish\n",
+		completion_done(compl) ? "PENDING" : "NOT PENDING");
+
+	for_each_set_bit(i, &accl, ARRAY_SIZE(accl_str)) {
+		strlcat(str, accl_str[i], sizeof(str));
+		strlcat(str, " ", sizeof(str));
+	}
+
+	if (busy && !irq_sts)
+		pr_warn("ERROR:Accelerator(s) { %s } at AOSS did not respond\n",
+			str);
+	else if (irq_sts)
+		pr_warn("ERROR:Possible lockup in Linux\n");
+
+	/*
+	 * The TCS(s) are busy waiting, we have no way to recover from this.
+	 * If this debug function is called, we assume it's because timeout
+	 * has happened.
+	 * Crash and report.
+	 */
+	BUG_ON(busy);
+}
+
 static int rpmh_probe_tcs_config(struct platform_device *pdev,
 				 struct rsc_drv *drv)
 {
@@ -657,6 +770,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	drv->irq = irq;
+
 	ret = devm_request_irq(&pdev->dev, irq, tcs_tx_done,
 			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND,
 			       drv->name, drv);
@@ -671,6 +786,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&drv->client.batch_cache);
 
 	dev_set_drvdata(&pdev->dev, drv);
+	if (__rsc_count < MAX_RSC_COUNT)
+		__rsc_drv[__rsc_count++] = drv;
 
 	return devm_of_platform_populate(&pdev->dev);
 }
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 035091f..4759856 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -263,6 +263,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
@@ -276,8 +277,12 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
-	WARN_ON(!ret);
-	return (ret > 0) ? 0 : -ETIMEDOUT;
+	if (!ret) {
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL(rpmh_write);
 
@@ -407,7 +412,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 			 * the completion that we're going to free once
 			 * we've returned from this function.
 			 */
-			WARN_ON(1);
+			rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compls[i]);
 			ret = -ETIMEDOUT;
 			goto exit;
 		}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
