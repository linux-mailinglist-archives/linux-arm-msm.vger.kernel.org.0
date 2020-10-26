Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB966299A70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 00:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406291AbgJZXao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 19:30:44 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:25462 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406250AbgJZXan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 19:30:43 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Oct 2020 16:30:42 -0700
X-QCInternal: smtphost
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 26 Oct 2020 16:30:42 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 1364A20DDC; Mon, 26 Oct 2020 16:30:42 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Asutosh Das <asutoshd@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Satya Tangirala <satyat@google.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/2] scsi: ufs: Put hba into LPM during clk gating
Date:   Mon, 26 Oct 2020 16:30:08 -0700
Message-Id: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Can Guo <cang@codeaurora.org>

During clock gating, after clocks are disabled,
put hba into LPM to save more power.

Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c |  7 +++++--
 drivers/scsi/ufs/ufshcd.h | 13 +++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 47c544d..55ca8c6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1548,6 +1548,7 @@ static void ufshcd_ungate_work(struct work_struct *work)
 	}
 
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
+	ufshcd_hba_vreg_set_hpm(hba);
 	ufshcd_setup_clocks(hba, true);
 
 	ufshcd_enable_irq(hba);
@@ -1713,6 +1714,8 @@ static void ufshcd_gate_work(struct work_struct *work)
 		/* If link is active, device ref_clk can't be switched off */
 		__ufshcd_setup_clocks(hba, false, true);
 
+	/* Put the host controller in low power mode if possible */
+	ufshcd_hba_vreg_set_lpm(hba);
 	/*
 	 * In case you are here to cancel this work the gating state
 	 * would be marked as REQ_CLKS_ON. In this case keep the state
@@ -8405,13 +8408,13 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 
 static void ufshcd_hba_vreg_set_lpm(struct ufs_hba *hba)
 {
-	if (ufshcd_is_link_off(hba))
+	if (ufshcd_is_link_off(hba) || ufshcd_can_aggressive_pc(hba))
 		ufshcd_setup_hba_vreg(hba, false);
 }
 
 static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba)
 {
-	if (ufshcd_is_link_off(hba))
+	if (ufshcd_is_link_off(hba) || ufshcd_can_aggressive_pc(hba))
 		ufshcd_setup_hba_vreg(hba, true);
 }
 
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 47eb143..0fbb735 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -592,6 +592,13 @@ enum ufshcd_caps {
 	 * inline crypto engine, if it is present
 	 */
 	UFSHCD_CAP_CRYPTO				= 1 << 8,
+
+	/*
+	 * This capability allows the controller regulators to be put into
+	 * lpm mode aggressively during clock gating.
+	 * This would increase power savings.
+	 */
+	UFSHCD_CAP_AGGR_POWER_COLLAPSE			= 1 << 9,
 };
 
 struct ufs_hba_variant_params {
@@ -829,6 +836,12 @@ return true;
 #endif
 }
 
+static inline bool ufshcd_can_aggressive_pc(struct ufs_hba *hba)
+{
+	return !!(ufshcd_is_link_hibern8(hba) &&
+		  (hba->caps & UFSHCD_CAP_AGGR_POWER_COLLAPSE));
+}
+
 static inline bool ufshcd_is_auto_hibern8_supported(struct ufs_hba *hba)
 {
 	return (hba->capabilities & MASK_AUTO_HIBERN8_SUPPORT) &&
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

