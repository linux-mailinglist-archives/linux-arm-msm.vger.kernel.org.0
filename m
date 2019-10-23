Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7B5E20EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 18:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfJWQtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 12:49:14 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:58675 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725887AbfJWQtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 12:49:14 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Oct 2019 09:49:14 -0700
IronPort-SDR: S3oIkdZts0LLDpvi+WfbjifYb+vq57d4bTI2F0n7IbnX2cQ6wZ3pU9PqJfxsaeHTJ/lukcakHr
 K6+VHL8cTw3iUKHSeh8kQqXdUIB+7Nv18Xm+VwMY8l3C3z7qmxq0947AXYpySh97NooSb+Q8mN
 kE6S1suMXVfylX3MXcYk+AA5kiHEFdPseGs/YEp5nzyS6YLX1HXoX0kymSxL5X6GmbSMWRVgub
 yxE56s0TKLcHQeNlZmGUxDYKbXA5w3FTRoosi6G0E9T0Iig8Mw+hcD4U214b5zDIURZMBvMHPY
 HNAjGZIe0FicxMTmXFbNist6
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 23 Oct 2019 09:49:13 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 7167821215; Wed, 23 Oct 2019 09:49:13 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, rnayak@codeaurora.org, vinholikatti@gmail.com,
        jejb@linux.vnet.ibm.com, martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Asutosh Das <asutoshd@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock scaling
Date:   Wed, 23 Oct 2019 09:49:09 -0700
Message-Id: <1571849351-819-2-git-send-email-asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571849351-819-1-git-send-email-asutoshd@codeaurora.org>
References: <1571849351-819-1-git-send-email-asutoshd@codeaurora.org>
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
index a5b7148..55b1de5 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1305,18 +1305,27 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
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
@@ -1324,6 +1333,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 				    dev_req_params->hs_rate,
 				    false);
 		ufs_qcom_update_bus_bw_vote(host);
+		ufshcd_uic_hibern8_exit(hba);
 	}
 
 out:
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

