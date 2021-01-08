Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D672EEDE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 08:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbhAHH3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 02:29:52 -0500
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227]:56074 "EHLO
        alexa-out-tai-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727159AbhAHH3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 02:29:52 -0500
Received: from ironmsg01-tai.qualcomm.com ([10.249.140.6])
  by alexa-out-tai-02.qualcomm.com with ESMTP; 08 Jan 2021 15:28:58 +0800
X-QCInternal: smtphost
Received: from cbsp-sh-gv.ap.qualcomm.com (HELO cbsp-sh-gv.qualcomm.com) ([10.231.249.68])
  by ironmsg01-tai.qualcomm.com with ESMTP; 08 Jan 2021 15:28:54 +0800
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 393357)
        id 28C3D26B7; Fri,  8 Jan 2021 15:28:53 +0800 (CST)
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
Subject: [PATCH v5 2/2] scsi: ufs-qcom: Fix ufs RST_n specs violation
Date:   Fri,  8 Jan 2021 15:28:04 +0800
Message-Id: <1610090885-50099-3-git-send-email-ziqichen@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610090885-50099-1-git-send-email-ziqichen@codeaurora.org>
References: <1610090885-50099-1-git-send-email-ziqichen@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per specs, e.g, JESD220E chapter 7.2, while powering
off/on the ufs device, RST_n signal should be between
VSS(Ground) and VCCQ/VCCQ2.

Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2206b1e..d8b896c 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -582,6 +582,10 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufs_qcom_disable_lane_clks(host);
 		phy_power_off(phy);
 
+		/* reset the connected UFS device during power down */
+		if (host->device_reset)
+			gpiod_set_value_cansleep(host->device_reset, 1);
+
 	} else if (!ufs_qcom_is_link_active(hba)) {
 		ufs_qcom_disable_lane_clks(host);
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

