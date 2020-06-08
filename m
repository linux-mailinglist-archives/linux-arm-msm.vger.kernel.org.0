Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE6E1F158E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 11:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbgFHJhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 05:37:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:37165 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729167AbgFHJhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 05:37:36 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Jun 2020 02:37:33 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 08 Jun 2020 02:37:31 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id B47E921812; Mon,  8 Jun 2020 15:07:29 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 4/4] mailbox: qcom: Add ipq6018 apcs compatible
Date:   Mon,  8 Jun 2020 15:07:27 +0530
Message-Id: <1591609047-29995-5-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591609047-29995-1-git-send-email-sivaprak@codeaurora.org>
References: <1591609047-29995-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm ipq6018 has apcs block, add compatible for the same. Also,
the ipq6018 apcs provides a clock functionality similar to msm8916 but
the clock driver is different.

Create a child device based on the apcs compatible for the clock
controller functionality.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 49eebb5..cec34f0 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -29,6 +29,10 @@ struct qcom_apcs_ipc_data {
 	char *clk_name;
 };
 
+static const struct qcom_apcs_ipc_data ipq6018_apcs_data = {
+	.offset = 8, .clk_name = "qcom,apss-ipq6018-clk"
+};
+
 static const struct qcom_apcs_ipc_data ipq8074_apcs_data = {
 	.offset = 8, .clk_name = NULL
 };
@@ -139,6 +143,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 
 /* .data is the offset of the ipc register within the global block */
 static const struct of_device_id qcom_apcs_ipc_of_match[] = {
+	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
-- 
2.7.4

