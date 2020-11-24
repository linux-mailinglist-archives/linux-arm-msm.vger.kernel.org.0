Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138EF2C1EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 08:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgKXHe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 02:34:56 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:4959 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgKXHe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 02:34:56 -0500
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Nov 2020 02:34:55 EST
IronPort-SDR: y7FUubupOmpvvTbxlHJ40wKINI2czsAMIPX4iPZD8Tx9HhCup4vGluDPa7sel4dI9fJFruDfFj
 0FrRrj7uB/GAboV0/ktPosqCvrZIT2PWI2Ja7tksw5VopG4OaYq+7jv0pSTUC6ur8XfgXrWTru
 uek+fjDF8BZ/P5t2ZZDKGi0wVDI+1xYHiGvrFGYZxjndnkwr32NL8N2wkEp4eR7pGNg8nFICNo
 IiUrPxcwSRcUnr/GrKTv0ImtJ/o8dEO2VqgPt+ZRosKW6qe2vALWDFif4wjExeoYfpzyYSju0d
 JUg=
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="47507391"
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by labrats.qualcomm.com with ESMTP; 23 Nov 2020 23:28:51 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg05-sd.qualcomm.com with ESMTP; 23 Nov 2020 23:28:50 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 81B332185E; Mon, 23 Nov 2020 23:28:50 -0800 (PST)
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] scsi: ufs-qcom: Keep core_clk_unipro ON while link is active
Date:   Mon, 23 Nov 2020 23:28:26 -0800
Message-Id: <1606202906-14485-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606202906-14485-1-git-send-email-cang@codeaurora.org>
References: <1606202906-14485-1-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we want to disable clocks to save power but still keep the link active,
core_clk_unipro, as same as ref_clk, should not be the one being disabled.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index f9d6ef3..70df357 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -977,6 +977,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ufs_qcom_host *host;
 	struct resource *res;
+	struct ufs_clk_info *clki;
 
 	if (strlen(android_boot_dev) && strcmp(android_boot_dev, dev_name(dev)))
 		return -ENODEV;
@@ -1075,6 +1076,11 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		}
 	}
 
+	list_for_each_entry(clki, &hba->clk_list_head, list) {
+		if (!strcmp(clki->name, "core_clk_unipro"))
+			clki->always_on_while_link_active = true;
+	}
+
 	err = ufs_qcom_init_lane_clks(host);
 	if (err)
 		goto out_variant_clear;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

