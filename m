Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62BF3158854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 03:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgBKCim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 21:38:42 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:46297 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727935AbgBKCig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 21:38:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581388715; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rg1opKQLTdNNzqrI/QD9WhV6BPCDSJS8Wzd+RmEKMIM=; b=FWWMrpBwb24AeUIKDxYDIPwrTG9MAb7OmvHoH3IkqscaDoikeloER60ngsS0jThcA/zwB79e
 +cWsGv53kZeMsTOAnEX6vuVqSmOjUvep5je5poPI+pZUiJEofvHQb9PY1Hdow3XNq2o4lysy
 vRfJ8kavVSEJvNg1F4Q96DK/HFA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4213a8.7f99b9c37298-smtp-out-n03;
 Tue, 11 Feb 2020 02:38:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4FD51C433A2; Tue, 11 Feb 2020 02:38:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74EBDC447A2;
        Tue, 11 Feb 2020 02:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74EBDC447A2
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
Subject: [PATCH v9 7/7] scsi: ufs-qcom: Delay specific time before gate ref clk
Date:   Mon, 10 Feb 2020 18:37:49 -0800
Message-Id: <1581388671-18078-8-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581388671-18078-1-git-send-email-cang@codeaurora.org>
References: <1581388671-18078-1-git-send-email-cang@codeaurora.org>
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
---
 drivers/scsi/ufs/ufs-qcom.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index ded08fb..ae995f0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -845,11 +845,27 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
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
+			unsigned long gating_wait;
+
+			gating_wait = host->hba->dev_info.clk_gating_wait_us;
+			if (!gating_wait) {
+				udelay(1);
+			} else {
+				/*
+				 * bRefClkGatingWaitTime defines the minimum
+				 * time for which the reference clock is
+				 * required by device during transition from
+				 * HS-MODE to LS-MODE or HIBERN8 state. Give it
+				 * more delay to be on the safe side.
+				 */
+				gating_wait += 10;
+				usleep_range(gating_wait, gating_wait + 10);
+			}
+		}
 
 		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
