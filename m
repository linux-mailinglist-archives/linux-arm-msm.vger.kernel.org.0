Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C776A2EF102
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 12:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbhAHLAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 06:00:04 -0500
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227]:55682 "EHLO
        alexa-out-tai-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726520AbhAHLAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 06:00:04 -0500
Received: from ironmsg03-tai.qualcomm.com ([10.249.140.8])
  by alexa-out-tai-02.qualcomm.com with ESMTP; 08 Jan 2021 18:59:21 +0800
X-QCInternal: smtphost
Received: from cbsp-sh-gv.ap.qualcomm.com (HELO cbsp-sh-gv.qualcomm.com) ([10.231.249.68])
  by ironmsg03-tai.qualcomm.com with ESMTP; 08 Jan 2021 18:58:57 +0800
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 393357)
        id 593A729ED; Fri,  8 Jan 2021 18:58:56 +0800 (CST)
From:   Ziqi Chen <ziqichen@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        cang@codeaurora.org, hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        ziqichen@codeaurora.org, kwmad.kim@samsung.com,
        stanley.chu@mediatek.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 2/2] scsi: ufs-qcom: Fix ufs RST_n specs violation
Date:   Fri,  8 Jan 2021 18:56:25 +0800
Message-Id: <1610103385-45755-3-git-send-email-ziqichen@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610103385-45755-1-git-send-email-ziqichen@codeaurora.org>
References: <1610103385-45755-1-git-send-email-ziqichen@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per specs, e.g, JESD220E chapter 7.2, while powering
off/on the ufs device, RST_n signal should be between
VSS(Ground) and VCCQ/VCCQ2.

Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2206b1e..f97d7b0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -568,6 +568,17 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 	return err;
 }
 
+static void ufs_qcom_device_reset_ctrl(struct ufs_hba *hba, bool asserted)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	/* reset gpio is optional */
+	if (!host->device_reset)
+		return;
+
+	gpiod_set_value_cansleep(host->device_reset, asserted);
+}
+
 static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -582,6 +593,9 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufs_qcom_disable_lane_clks(host);
 		phy_power_off(phy);
 
+		/* reset the connected UFS device during power down */
+		ufs_qcom_device_reset_ctrl(hba, true);
+
 	} else if (!ufs_qcom_is_link_active(hba)) {
 		ufs_qcom_disable_lane_clks(host);
 	}
@@ -1421,10 +1435,10 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
 	 * be on the safe side.
 	 */
-	gpiod_set_value_cansleep(host->device_reset, 1);
+	ufs_qcom_device_reset_ctrl(hba, true);
 	usleep_range(10, 15);
 
-	gpiod_set_value_cansleep(host->device_reset, 0);
+	ufs_qcom_device_reset_ctrl(hba, false);
 	usleep_range(10, 15);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

