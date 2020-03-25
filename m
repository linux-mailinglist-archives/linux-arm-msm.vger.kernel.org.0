Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12405191DDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 01:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgCYAHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 20:07:13 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:11963 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726968AbgCYAHN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 20:07:13 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2020 17:07:12 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 24 Mar 2020 17:07:11 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id DF6991F79D; Tue, 24 Mar 2020 17:07:11 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/3] scsi: ufshcd: Update the set frequency to devfreq
Date:   Tue, 24 Mar 2020 17:07:03 -0700
Message-Id: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, the frequency that devfreq provides the
driver to set always leads the clocks to be scaled up.
Hence, round the clock-rate to the nearest frequency
before deciding to scale.

Also update the devfreq statistics of current frequency.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 2a2a63b..4607bc6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1187,6 +1187,9 @@ static int ufshcd_devfreq_target(struct device *dev,
 	if (!ufshcd_is_clkscaling_supported(hba))
 		return -EINVAL;
 
+	clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, list);
+	/* Override with the closest supported frequency */
+	*freq = (unsigned long) clk_round_rate(clki->clk, *freq);
 	spin_lock_irqsave(hba->host->host_lock, irq_flags);
 	if (ufshcd_eh_in_progress(hba)) {
 		spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
@@ -1201,8 +1204,13 @@ static int ufshcd_devfreq_target(struct device *dev,
 		goto out;
 	}
 
-	clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, list);
+	/* Decide based on the rounded-off frequency and update */
 	scale_up = (*freq == clki->max_freq) ? true : false;
+	if (scale_up)
+		*freq = clki->max_freq;
+	else
+		*freq = clki->min_freq;
+	/* Update the frequency */
 	if (!ufshcd_is_devfreq_scaling_required(hba, scale_up)) {
 		spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
 		ret = 0;
@@ -1250,6 +1258,8 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 	struct ufs_clk_scaling *scaling = &hba->clk_scaling;
 	unsigned long flags;
+	struct list_head *clk_list = &hba->clk_list_head;
+	struct ufs_clk_info *clki;
 
 	if (!ufshcd_is_clkscaling_supported(hba))
 		return -EINVAL;
@@ -1260,6 +1270,8 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	if (!scaling->window_start_t)
 		goto start_window;
 
+	clki = list_first_entry(clk_list, struct ufs_clk_info, list);
+	stat->current_frequency = clki->curr_freq;
 	if (scaling->is_busy_started)
 		scaling->tot_busy_t += ktime_to_us(ktime_sub(ktime_get(),
 					scaling->busy_start_t));
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

