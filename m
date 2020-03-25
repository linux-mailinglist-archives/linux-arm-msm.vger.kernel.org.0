Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A10193056
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 19:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgCYS3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 14:29:19 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:50676 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727129AbgCYS3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 14:29:19 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Mar 2020 11:29:18 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 25 Mar 2020 11:29:17 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id B50AE208CE; Wed, 25 Mar 2020 11:29:17 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Avri.Altman@wdc.com, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
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
Subject: [PATCH v2 1/3] scsi: ufshcd: Update the set frequency to devfreq
Date:   Wed, 25 Mar 2020 11:29:00 -0700
Message-Id: <d0c6c22455811e9f0eda01f9bc70d1398b51b2bd.1585160616.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585160616.git.asutoshd@codeaurora.org>
References: <cover.1585160616.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1585160616.git.asutoshd@codeaurora.org>
References: <cover.1585160616.git.asutoshd@codeaurora.org>
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
 drivers/scsi/ufs/ufshcd.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 2a2a63b..7916c8b 100644
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
@@ -1201,8 +1204,11 @@ static int ufshcd_devfreq_target(struct device *dev,
 		goto out;
 	}
 
-	clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, list);
+	/* Decide based on the rounded-off frequency and update */
 	scale_up = (*freq == clki->max_freq) ? true : false;
+	if (!scale_up)
+		*freq = clki->min_freq;
+	/* Update the frequency */
 	if (!ufshcd_is_devfreq_scaling_required(hba, scale_up)) {
 		spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
 		ret = 0;
@@ -1250,6 +1256,8 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 	struct ufs_clk_scaling *scaling = &hba->clk_scaling;
 	unsigned long flags;
+	struct list_head *clk_list = &hba->clk_list_head;
+	struct ufs_clk_info *clki;
 
 	if (!ufshcd_is_clkscaling_supported(hba))
 		return -EINVAL;
@@ -1260,6 +1268,13 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	if (!scaling->window_start_t)
 		goto start_window;
 
+	clki = list_first_entry(clk_list, struct ufs_clk_info, list);
+	/*
+	 * If current frequency is 0, then the ondemand governor considers
+	 * there's no initial frequency set. And it always requests to set
+	 * to max. frequency.
+	 */
+	stat->current_frequency = clki->curr_freq;
 	if (scaling->is_busy_started)
 		scaling->tot_busy_t += ktime_to_us(ktime_sub(ktime_get(),
 					scaling->busy_start_t));
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

