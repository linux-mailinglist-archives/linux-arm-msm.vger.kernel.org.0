Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B3D4127C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 23:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbhITVLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 17:11:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45271 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238096AbhITVJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 17:09:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632172096; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=LC1CDaf9KsUSVcMN5EyFnJjnyIeffZTnWvVRfkHFxgA=; b=Ny1+KEgaCYwcE5v8/gQbXZ2SCYEbPRkFFykx3LRpEq/d4WwBgqh5+Cl038pYivU1hkwj5VZa
 nsKgmLKPmH5rHCdVGn5kRbnNRZOwIlmcz7YGGJnkK0az/jG49P8bkUZOZOtedK+qzr+Xibt0
 /bO75CdhRy/KC0BzBDUSlCHv3No=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6148f83eec62f57c9a7a48a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 21:08:14
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4819C4360C; Mon, 20 Sep 2021 21:08:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-berry.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AAF9AC43617;
        Mon, 20 Sep 2021 21:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AAF9AC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock scaling
Date:   Mon, 20 Sep 2021 14:07:50 -0700
Message-Id: <94cda1143d3332c3284a09b88139e358eab5a233.1632171047.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1632171047.git.nguyenb@codeaurora.org>
References: <cover.1632171047.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1632171047.git.nguyenb@codeaurora.org>
References: <cover.1632171047.git.nguyenb@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Asutosh Das <asutoshd@codeaurora.org>

Qualcomm controller needs to be in hibern8 before scaling clocks.
This change puts the controller in hibern8 state before scaling
and brings it out after scaling of clocks.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 92d4c61..92f5bb4 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1212,24 +1212,34 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 	int err = 0;
 
 	if (status == PRE_CHANGE) {
+		err = ufshcd_uic_hibern8_enter(hba);
+		if (err)
+			return err;
 		if (scale_up)
 			err = ufs_qcom_clk_scale_up_pre_change(hba);
 		else
 			err = ufs_qcom_clk_scale_down_pre_change(hba);
+		if (err)
+			ufshcd_uic_hibern8_exit(hba);
+
 	} else {
 		if (scale_up)
 			err = ufs_qcom_clk_scale_up_post_change(hba);
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba);
 
-		if (err || !dev_req_params)
+
+		if (err || !dev_req_params) {
+			ufshcd_uic_hibern8_exit(hba);
 			goto out;
+		}
 
 		ufs_qcom_cfg_timers(hba,
 				    dev_req_params->gear_rx,
 				    dev_req_params->pwr_rx,
 				    dev_req_params->hs_rate,
 				    false);
+		ufshcd_uic_hibern8_exit(hba);
 	}
 
 out:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

