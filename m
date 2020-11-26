Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2282C4D16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 03:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732755AbgKZCDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 21:03:39 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:5970 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730764AbgKZCDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 21:03:39 -0500
IronPort-SDR: 2Twmzu+pCebjni14jMXEPHH88VO1iRph0/57jl/4HckPjlpIpC7a6VS5TvGQSC4bKyY0BjJGLB
 cyKoTR4DjVb3BSCLELqY+m4OIEb9cYc29t6/URoHJ0p9B+r2q/39TxvbBjxUlyMstjGp3B405z
 hAOGReIUCvL+72VABeNORGM85PAa+wkncO3t0HbXHghpT9qHMQif/KLKcUBaQdEcHHIZAavIR7
 0xRUmygrsSNv7wfa26ZW7fAc+qfVK3CMEafFTOHyy6ojwSxiDLVwn+EQ3LHad/3j170fxeamWs
 hFk=
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="47516302"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 25 Nov 2020 18:03:38 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 25 Nov 2020 18:03:37 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id B4C3F21858; Wed, 25 Nov 2020 18:03:37 -0800 (PST)
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
Subject: [PATCH v3 2/2] scsi: ufs-qcom: Keep core_clk_unipro ON while link is active
Date:   Wed, 25 Nov 2020 18:01:01 -0800
Message-Id: <1606356063-38380-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606356063-38380-1-git-send-email-cang@codeaurora.org>
References: <1606356063-38380-1-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we want to disable clocks to save power but still keep the link active,
core_clk_unipro, as same as ref_clk, should not be the one being disabled.

Reviewed-by: Hongwu Su<hongwus@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index f9d6ef3..8a7fc62 100644
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
+			clki->keep_link_active = true;
+	}
+
 	err = ufs_qcom_init_lane_clks(host);
 	if (err)
 		goto out_variant_clear;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

