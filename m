Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC9A29C86A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 20:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1829435AbgJ0TLA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 15:11:00 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:2072 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371908AbgJ0TKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 15:10:52 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2020 12:10:48 -0700
X-QCInternal: smtphost
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg01-sd.qualcomm.com with ESMTP; 27 Oct 2020 12:10:47 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id B146220F57; Tue, 27 Oct 2020 12:10:47 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Asutosh Das <asutoshd@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Satya Tangirala <satyat@google.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support)
Subject: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Date:   Tue, 27 Oct 2020 12:10:36 -0700
Message-Id: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Can Guo <cang@codeaurora.org>

During clock gating, after clocks are disabled,
put hba into LPM to save more power.

Acked-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c |  9 +++++++--
 drivers/scsi/ufs/ufshcd.h | 13 +++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 47c544d..9fc1bac 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -245,6 +245,8 @@ static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
 static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
 static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set);
 static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable);
+static void ufshcd_hba_vreg_set_lpm(struct ufs_hba *hba);
+static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba);
 
 static inline bool ufshcd_valid_tag(struct ufs_hba *hba, int tag)
 {
@@ -1548,6 +1550,7 @@ static void ufshcd_ungate_work(struct work_struct *work)
 	}
 
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
+	ufshcd_hba_vreg_set_hpm(hba);
 	ufshcd_setup_clocks(hba, true);
 
 	ufshcd_enable_irq(hba);
@@ -1713,6 +1716,8 @@ static void ufshcd_gate_work(struct work_struct *work)
 		/* If link is active, device ref_clk can't be switched off */
 		__ufshcd_setup_clocks(hba, false, true);
 
+	/* Put the host controller in low power mode if possible */
+	ufshcd_hba_vreg_set_lpm(hba);
 	/*
 	 * In case you are here to cancel this work the gating state
 	 * would be marked as REQ_CLKS_ON. In this case keep the state
@@ -8405,13 +8410,13 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 
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

