Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C064127C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 23:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhITVLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 17:11:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35234 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238066AbhITVJn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 17:09:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632172096; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=NP2O11SZCezPDg44dTxhtmzhv4PHkwiFesMZaATy/Tc=; b=TdnQFlkjn8hwpZ9CgsZHsVlijgCx2X6K0oH3yPe5UcaFTlg2tWuYzUmL+bZd37h1P+aEKKNG
 HR2QOMDx6wVG2Jw6b4gDVRvMcUthnaozxOLbyRwhlaDovVU5C01CFSXGK9LflzMF2sR+AAFT
 P5g85vS+Z8rs5wSQ89COyDFn0ak=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6148f83ebd6681d8ed484d67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 21:08:14
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DDDDC4338F; Mon, 20 Sep 2021 21:08:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-berry.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E381C4338F;
        Mon, 20 Sep 2021 21:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6E381C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Keoseong Park <keosung.park@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/2] scsi: ufs: export hibern8 entry and exit
Date:   Mon, 20 Sep 2021 14:07:49 -0700
Message-Id: <70c5376129f902b6b3e9940ea3b10f147bf18a10.1632171047.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1632171047.git.nguyenb@codeaurora.org>
References: <cover.1632171047.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1632171047.git.nguyenb@codeaurora.org>
References: <cover.1632171047.git.nguyenb@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Asutosh Das <asutoshd@codeaurora.org>

Qualcomm controllers need to be in hibern8 before scaling up
or down the clocks. Hence, export the hibern8 entry and exit
functions.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 4 ++--
 drivers/scsi/ufs/ufshcd.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 3841ab49..f3aad32 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -227,7 +227,6 @@ static void ufshcd_hba_exit(struct ufs_hba *hba);
 static int ufshcd_clear_ua_wluns(struct ufs_hba *hba);
 static int ufshcd_probe_hba(struct ufs_hba *hba, bool async);
 static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on);
-static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
 static inline void ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);
 static int ufshcd_host_reset_and_restore(struct ufs_hba *hba);
 static void ufshcd_resume_clkscaling(struct ufs_hba *hba);
@@ -4116,7 +4115,7 @@ int ufshcd_link_recovery(struct ufs_hba *hba)
 }
 EXPORT_SYMBOL_GPL(ufshcd_link_recovery);
 
-static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
 {
 	int ret;
 	struct uic_command uic_cmd = {0};
@@ -4138,6 +4137,7 @@ static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ufshcd_uic_hibern8_enter);
 
 int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)
 {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 52ea6f3..0cc55a2 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -1397,4 +1397,6 @@ static inline int ufshcd_rpmb_rpm_put(struct ufs_hba *hba)
 	return pm_runtime_put(&hba->sdev_rpmb->sdev_gendev);
 }
 
+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
+int ufshcd_uic_hibern8_exit(struct ufs_hba *hba);
 #endif /* End of Header */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

