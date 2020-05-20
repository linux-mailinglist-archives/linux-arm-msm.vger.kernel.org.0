Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E007D1DBBFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 19:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgETRxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 13:53:39 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:49198 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbgETRxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 13:53:39 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 May 2020 10:53:39 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 20 May 2020 10:53:38 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 779F120B90; Wed, 20 May 2020 10:53:38 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        PedroM.Sousa@synopsys.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock scaling
Date:   Wed, 20 May 2020 10:53:17 -0700
Message-Id: <9b67c25eb7c0bf80075b36660aebdb3788207353.1589997078.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
References: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
In-Reply-To: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
References: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm controller needs to be in hibern8 before scaling clocks.
This change puts the controller in hibern8 state before scaling
and brings it out after scaling of clocks.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 00ce8d6..3a4ed64 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1418,18 +1418,27 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
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
@@ -1437,6 +1446,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 				    dev_req_params->hs_rate,
 				    false);
 		ufs_qcom_update_bus_bw_vote(host);
+		err = ufshcd_uic_hibern8_exit(hba);
 	}
 
 out:
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

