Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D851AE20CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 18:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392556AbfJWQjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 12:39:54 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:34133 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389276AbfJWQjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 12:39:54 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Oct 2019 09:39:53 -0700
IronPort-SDR: mz+7h+OMI2ZZzTJNYiSIiPnZ+ZG1mjzsBPpUklpGAlY0DxT8efTlRrD9pMsJlhl1LjTnc5ViLw
 jWuuPWdF7G/KtV6HCIvF7f9zCcM1/zAhUZ+6s+DxXf9WaL8735LK8QS4MqTeOf1YDlz/WyJD5a
 BuXeBHVYtY5bxIr710jiT7hS2ZmVN1NNxU0Y2mXiz4uL9vanZ3hTk67qr/ArilKed2iKHF0K8c
 FDiGmMq69mwL9Mx1QYM5GCMBkFiHScJBa/gIvIDUtPYQnwfAwIoYHxx+d62W/bMIsTs3N0Ojp6
 m3hC8/tmmJFX9fpGwj6hH+ND
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg01-sd.qualcomm.com with ESMTP; 23 Oct 2019 09:39:52 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 98C1F2135F; Wed, 23 Oct 2019 09:39:52 -0700 (PDT)
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
Subject: [PATCH v2 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock scaling
Date:   Wed, 23 Oct 2019 09:39:42 -0700
Message-Id: <1571848785-27698-2-git-send-email-asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571848785-27698-1-git-send-email-asutoshd@codeaurora.org>
References: <1571848785-27698-1-git-send-email-asutoshd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm controller needs to be in hibern8 before scaling clocks.
This change puts the controller in hibern8 state before scaling
and brings it out after scaling of clocks.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b7148..d117088 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1305,6 +1305,9 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 	int err = 0;
 
 	if (status == PRE_CHANGE) {
+		err = ufshcd_uic_hibern8_enter(hba);
+		if (err)
+			return err;
 		if (scale_up)
 			err = ufs_qcom_clk_scale_up_pre_change(hba);
 		else
@@ -1324,6 +1327,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 				    dev_req_params->hs_rate,
 				    false);
 		ufs_qcom_update_bus_bw_vote(host);
+		ufshcd_uic_hibern8_exit(hba);
 	}
 
 out:
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

