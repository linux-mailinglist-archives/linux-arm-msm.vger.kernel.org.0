Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF526153EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 07:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgBFG5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 01:57:30 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:56809 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728031AbgBFG5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 01:57:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580972249; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7Ft0p6rc1EgAvct1E2YN9qNNcvLD8z08nIa/AIg/K4E=; b=HeJDwW6NBMWvUkn9S3dwnO2GW11sqJ50SGNIT2MKkHqSEVOdax04y/4Q1VO51o/Mi63ZE3vx
 sBvIq9cao1V628X/ZcRZYAmuQyGAX1CMB6ejufplU0l0UNa8T9AxFPQyx72LTinxmtA3/XjQ
 yu9w8+zZ0Gq3NGzZCFOpRAhpcFQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3bb8d8.7fb6be80f8f0-smtp-out-n03;
 Thu, 06 Feb 2020 06:57:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C224EC447B0; Thu,  6 Feb 2020 06:57:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 043ABC4479C;
        Thu,  6 Feb 2020 06:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 043ABC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cang@codeaurora.org
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/8] scsi: ufs-qcom: Delay specific time before gate ref clk
Date:   Wed,  5 Feb 2020 22:56:50 -0800
Message-Id: <1580972212-29881-8-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1580972212-29881-1-git-send-email-cang@codeaurora.org>
References: <1580972212-29881-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After enter hibern8, as UFS JEDEC ver 3.0 requires, a specific gating wait
time is required before disable the device reference clock. If it is not
specified, use the old delay.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 85d7c17..39eefa4 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -833,6 +833,8 @@ static int ufs_qcom_bus_register(struct ufs_qcom_host *host)
 
 static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 {
+	unsigned long gating_wait;
+
 	if (host->dev_ref_clk_ctrl_mmio &&
 	    (enable ^ host->is_dev_ref_clk_enabled)) {
 		u32 temp = readl_relaxed(host->dev_ref_clk_ctrl_mmio);
@@ -845,11 +847,25 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 		/*
 		 * If we are here to disable this clock it might be immediately
 		 * after entering into hibern8 in which case we need to make
-		 * sure that device ref_clk is active at least 1us after the
+		 * sure that device ref_clk is active for specific time after
 		 * hibern8 enter.
 		 */
-		if (!enable)
-			udelay(1);
+		if (!enable) {
+			gating_wait = host->hba->dev_info.clk_gating_wait_us;
+			if (!gating_wait) {
+				udelay(1);
+			} else {
+				/*
+				 * bRefClkGatingWaitTime defines the minimum
+				 * time for which the reference clock is
+				 * required by device during transition from
+				 * HS-MODE to LS-MODE or HIBERN8 state. Give it
+				 * more time to be on the safe side.
+				 */
+				gating_wait += 10;
+				usleep_range(gating_wait, gating_wait + 10);
+			}
+		}
 
 		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
