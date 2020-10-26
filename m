Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090642998ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 22:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389885AbgJZVhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 17:37:25 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59929 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389424AbgJZVhZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 17:37:25 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 17:37:25 EDT
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Oct 2020 14:31:19 -0700
X-QCInternal: smtphost
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg04-sd.qualcomm.com with ESMTP; 26 Oct 2020 14:31:18 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 7A6D820DDC; Mon, 26 Oct 2020 14:31:18 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Asutosh Das <asutoshd@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/1] scsi: ufs: Keep UFS regulators on when autobkops enabled
Date:   Mon, 26 Oct 2020 14:31:10 -0700
Message-Id: <6fd8e4d88eb331c9f04c74a3581593961f2caf73.1603747748.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Bao D. Nguyen" <nguyenb@codeaurora.org>

When bkops is enabled, the UFS device may do bkops during suspend.
With bkops enabled during suspend, keep the regulators
in active operation configuration, allowing the device to draw
high power to support bkops and avoid over current event.

Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 47c544d..a94543c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8523,7 +8523,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (ret)
 		goto set_dev_active;
 
-	ufshcd_vreg_set_lpm(hba);
+	/* Device may perform bkops if autobkops is enabled */
+	if (!hba->auto_bkops_enabled)
+		ufshcd_vreg_set_lpm(hba);
 
 disable_clks:
 	/*
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

