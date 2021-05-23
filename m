Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3DE38DCF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 May 2021 22:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhEWUsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 16:48:37 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:45709 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbhEWUsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 16:48:37 -0400
Received: from TimeMachine.localdomain (bband-dyn255.178-41-232.t-com.sk [178.41.232.255])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id E147920127;
        Sun, 23 May 2021 22:47:08 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mailbox: qcom-apcs: Add SM6125 compatible
Date:   Sun, 23 May 2021 22:46:58 +0200
Message-Id: <20210523204659.705713-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds compatible for the SM6125 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index f25324d03842..57745a764d4c 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
 	.offset = 8, .clk_name = NULL
 };
 
+static const struct qcom_apcs_ipc_data sm6125_hmss_data = {
+	.offset = 8, .clk_name = NULL
+};
+
 static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
 	.offset = 12, .clk_name = NULL
 };
@@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sm6125-hmss-global", .data = &sm6125_hmss_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
-- 
2.31.1

