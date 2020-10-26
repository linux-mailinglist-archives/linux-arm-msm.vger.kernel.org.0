Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1D7299A74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 00:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406256AbgJZXan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 19:30:43 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:25462 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406244AbgJZXam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 19:30:42 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Oct 2020 16:30:42 -0700
X-QCInternal: smtphost
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 26 Oct 2020 16:30:42 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 3FACC20DDC; Mon, 26 Oct 2020 16:30:42 -0700 (PDT)
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
Subject: [PATCH v1 2/2] ufs: qcom: Enable aggressive power collapse for ufs hba
Date:   Mon, 26 Oct 2020 16:30:09 -0700
Message-Id: <0716681006075e9eebbf0decd28505824e22d637.1603754932.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
References: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
In-Reply-To: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
References: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabling this capability to let hba power-collapse
more often to save power.

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

