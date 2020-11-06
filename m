Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689CF2A8B74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 01:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732814AbgKFAft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 19:35:49 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:41781 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732684AbgKFAfs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 19:35:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604622948; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rLJ5XLoX+SvLWPgBWZ4tkoVwvC0M5uo8P7v0KGtz3Hg=; b=lk+5YWgHXnGhCUa+d0gzGo6D3RRZqV8bnoqFDb7W5yjYgKjKR3sH2A8ifbrdkMUH7b16Hy1c
 hQJaYzhHUm6TOttk3CJQOAs/F6TeKWUK6zdWiGy+pNYtCgPAd2qMmyInrs8bbiPXRAYB8qMZ
 EoCbPSw5fweFyrgRDnHaeBcsIAs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa49a215f52a2916beb1c5f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 00:34:41
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8AC14C433CB; Fri,  6 Nov 2020 00:34:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D049DC433F0;
        Fri,  6 Nov 2020 00:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D049DC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 6/6] bus: mhi: core: Skip RDDM download for unknown execution environment
Date:   Thu,  5 Nov 2020 16:34:29 -0800
Message-Id: <1604622869-40212-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604622869-40212-1-git-send-email-bbhatt@codeaurora.org>
References: <1604622869-40212-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If MHI is unable to determine the execution environment during
the panic path, host must skip the RDDM download. This can happen
if the BHI offset read or the BHI_EXECENV register read fails
indicating that the underlying transport is unresponsive. Hence,
there is no need to trigger an RDDM using SYSERR or request an
SOC reset.

Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 16244cc..40606e5 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -92,6 +92,9 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	 * image download completion.
 	 */
 	ee = mhi_get_exec_env(mhi_cntrl);
+	if (ee == MHI_EE_MAX)
+		goto error_exit_rddm;
+
 	if (ee != MHI_EE_RDDM) {
 		dev_dbg(dev, "Trigger device into RDDM mode using SYS ERR\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
@@ -140,9 +143,11 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	ret = mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx_status);
 
 	dev_err(dev, "Did not complete RDDM transfer\n");
-	dev_err(dev, "Current EE: %s\n", TO_MHI_EXEC_STR(ee));
 	dev_err(dev, "RXVEC_STATUS: 0x%x\n", rx_status);
 
+error_exit_rddm:
+	dev_err(dev, "Current EE: %s\n", TO_MHI_EXEC_STR(ee));
+
 	return -EIO;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

