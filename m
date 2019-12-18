Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6695A124CAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 17:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLRQHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 11:07:16 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:19917 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727345AbfLRQHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 11:07:16 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Dec 2019 21:36:17 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Dec 2019 21:35:48 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 063913C4F; Wed, 18 Dec 2019 21:35:46 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V4 04/10] remoteproc: qcom: Add ssr subdevice identifier
Date:   Wed, 18 Dec 2019 21:35:40 +0530
Message-Id: <1576685146-17135-5-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
References: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add name for ssr subdevice on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
changes since v1: none
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index da0ce97..70f7f41 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1166,6 +1166,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
+	.ssr_name = "q6wcss",
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
 	.need_mem_protection = true,
-- 
1.9.1

