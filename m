Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C994D29C863
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 20:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371913AbgJ0TK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 15:10:59 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:2072 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371906AbgJ0TKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 15:10:51 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2020 12:10:48 -0700
X-QCInternal: smtphost
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 27 Oct 2020 12:10:47 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id D39F820F58; Tue, 27 Oct 2020 12:10:47 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] ufs: qcom: Enable aggressive power collapse for ufs hba
Date:   Tue, 27 Oct 2020 12:10:37 -0700
Message-Id: <1306284ab2215425ca0a3d9c802574cbd6d35ea7.1603825776.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabling this capability to let hba power-collapse
more often to save power.

Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index f9d6ef3..9a19c6d 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -863,6 +863,7 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->caps |= UFSHCD_CAP_CRYPTO;
+	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 
 	if (host->hw_ver.major >= 0x2) {
 		host->caps = UFS_QCOM_CAP_QUNIPRO |
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

