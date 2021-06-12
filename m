Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F414B3A4E04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 11:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhFLJsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 05:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhFLJsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 05:48:39 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDA2C061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 02:46:39 -0700 (PDT)
Received: from localhost.localdomain (bband-dyn73.178-41-129.t-com.sk [178.41.129.73])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id EE4151F975;
        Sat, 12 Jun 2021 11:46:37 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
Date:   Sat, 12 Jun 2021 11:46:30 +0200
Message-Id: <20210612094631.89980-3-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210612094631.89980-1-martin.botka@somainline.org>
References: <20210612094631.89980-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds compatible for the SM6125 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
None
Changes in V3:
Change compatible to apcs-hmss-global
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index f25324d03842..f24c5ad8d658 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
 	.offset = 8, .clk_name = NULL
 };
 
+static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
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
+	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
-- 
2.31.1

