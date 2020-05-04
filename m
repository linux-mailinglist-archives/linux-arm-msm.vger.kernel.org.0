Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925E71C329E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 08:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgEDGUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 02:20:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:41354 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727821AbgEDGUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 02:20:38 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 May 2020 23:20:36 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg02-sd.qualcomm.com with ESMTP; 03 May 2020 23:20:33 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 2F2A22173F; Mon,  4 May 2020 11:50:27 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V4 7/8] mailbox: qcom: Add ipq6018 apcs compatible
Date:   Mon,  4 May 2020 11:50:23 +0530
Message-Id: <1588573224-3038-8-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm ipq6018 has apcs block, add compatible for the same.
Also, the apcs provides a clock controller functionality similar
to msm8916 but the clock driver is different.

Create a child platform device based on the apcs compatible for the
clock controller functionality.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index eeebafd..7c0c4b0 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -45,6 +45,16 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
 	.send_data = qcom_apcs_ipc_send_data,
 };
 
+static const struct of_device_id apcs_clk_match_table[] = {
+	{ .compatible = "qcom,msm8916-apcs-kpss-global",
+	  .data = "qcom-apcs-msm8916-clk", },
+	{ .compatible = "qcom,qcs404-apcs-apps-global",
+	  .data = "qcom-apcs-msm8916-clk", },
+	{ .compatible = "qcom,ipq6018-apcs-apps-global",
+	  .data = "qcom,apss-ipq-clk", },
+	{}
+};
+
 static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
 	struct qcom_apcs_ipc *apcs;
@@ -54,11 +64,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	unsigned long i;
 	int ret;
-	const struct of_device_id apcs_clk_match_table[] = {
-		{ .compatible = "qcom,msm8916-apcs-kpss-global", },
-		{ .compatible = "qcom,qcs404-apcs-apps-global", },
-		{}
-	};
+	const struct of_device_id *clk_device;
 
 	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
 	if (!apcs)
@@ -93,11 +99,12 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
+	clk_device = of_match_device(apcs_clk_match_table, &pdev->dev);
+	if (clk_device) {
 		apcs->clk = platform_device_register_data(&pdev->dev,
-							  "qcom-apcs-msm8916-clk",
-							  PLATFORM_DEVID_NONE,
-							  NULL, 0);
+						(const char *)clk_device->data,
+						PLATFORM_DEVID_NONE,
+						NULL, 0);
 		if (IS_ERR(apcs->clk))
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
 	}
@@ -127,6 +134,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = (void *)12 },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = (void *)8 },
+	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = (void *)8 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
2.7.4

