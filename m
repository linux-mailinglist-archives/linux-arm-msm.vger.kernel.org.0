Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4FE191DE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 01:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgCYAHU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 20:07:20 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:11975 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726968AbgCYAHU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 20:07:20 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2020 17:07:19 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg04-sd.qualcomm.com with ESMTP; 24 Mar 2020 17:07:18 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 89E5D1F79D; Tue, 24 Mar 2020 17:07:18 -0700 (PDT)
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 2/3] scsi: ufshcd: Let vendor override devfreq parameters
Date:   Tue, 24 Mar 2020 17:07:04 -0700
Message-Id: <59a83a2dba7d7f2be4bd4af56267fee8d1c5bb7c.1585094538.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
In-Reply-To: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Vendor drivers may have a need to update the polling interval
and thresholds.
Provide a vops for vendor drivers to use.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 11 ++++++++++-
 drivers/scsi/ufs/ufshcd.h | 12 ++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 4607bc6..7643ef5 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1300,6 +1300,13 @@ static struct devfreq_dev_profile ufs_devfreq_profile = {
 	.get_dev_status	= ufshcd_devfreq_get_dev_status,
 };
 
+#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
+static struct devfreq_simple_ondemand_data ufs_ondemand_data;
+static void *gov_data = &ufs_ondemand_data;
+#else
+static void *gov_data = NULL;
+#endif
+
 static int ufshcd_devfreq_init(struct ufs_hba *hba)
 {
 	struct list_head *clk_list = &hba->clk_list_head;
@@ -1315,10 +1322,12 @@ static int ufshcd_devfreq_init(struct ufs_hba *hba)
 	dev_pm_opp_add(hba->dev, clki->min_freq, 0);
 	dev_pm_opp_add(hba->dev, clki->max_freq, 0);
 
+	ufshcd_vops_config_scaling_param(hba, &ufs_devfreq_profile,
+					 gov_data);
 	devfreq = devfreq_add_device(hba->dev,
 			&ufs_devfreq_profile,
 			DEVFREQ_GOV_SIMPLE_ONDEMAND,
-			NULL);
+			gov_data);
 	if (IS_ERR(devfreq)) {
 		ret = PTR_ERR(devfreq);
 		dev_err(hba->dev, "Unable to register with devfreq %d\n", ret);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index d45a044..e8e8ee2 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -56,6 +56,7 @@
 #include <linux/completion.h>
 #include <linux/regulator/consumer.h>
 #include <linux/bitfield.h>
+#include <linux/devfreq.h>
 #include "unipro.h"
 
 #include <asm/irq.h>
@@ -327,6 +328,9 @@ struct ufs_hba_variant_ops {
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
 	void	(*device_reset)(struct ufs_hba *hba);
+	void	(*config_scaling_param)(struct ufs_hba *hba,
+					struct devfreq_dev_profile *profile,
+					void *data);
 };
 
 /* clock gating state  */
@@ -1083,6 +1087,14 @@ static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 	}
 }
 
+static inline void ufshcd_vops_config_scaling_param(struct ufs_hba *hba,
+						    struct devfreq_dev_profile
+						    *profile, void *data)
+{
+	if (hba->vops && hba->vops->config_scaling_param)
+		hba->vops->config_scaling_param(hba, profile, data);
+}
+
 extern struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /*
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

