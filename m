Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC061DBC01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 19:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgETRxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 13:53:42 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3932 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726729AbgETRxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 13:53:39 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 May 2020 10:53:39 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg05-sd.qualcomm.com with ESMTP; 20 May 2020 10:53:38 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 6325420B91; Wed, 20 May 2020 10:53:38 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        PedroM.Sousa@synopsys.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] scsi: ufs: export hibern8 entry
Date:   Wed, 20 May 2020 10:53:16 -0700
Message-Id: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm controllers need to be in hibern8 before scaling up
or down the clocks. Hence, export the hibern8 entry function.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 4 ++--
 drivers/scsi/ufs/ufshcd.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index c3389c9..aaf4adf 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -243,7 +243,6 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool async);
 static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 				 bool skip_ref_clk);
 static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on);
-static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
 static inline void ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);
 static int ufshcd_host_reset_and_restore(struct ufs_hba *hba);
 static void ufshcd_resume_clkscaling(struct ufs_hba *hba);
@@ -3877,7 +3876,7 @@ static int __ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
 	return ret;
 }
 
-static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
 {
 	int ret = 0, retries;
 
@@ -3889,6 +3888,7 @@ static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
 out:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ufshcd_uic_hibern8_enter);
 
 int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)
 {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 88d4202..defc12c 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -835,6 +835,7 @@ int ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
 void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
 void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
 			    u32 reg);
+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
 
 static inline void check_upiu_size(void)
 {
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

