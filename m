Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266C42563E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 03:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgH2BHI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 21:07:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20811 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbgH2BHH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 21:07:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598663226; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KBz/Mp2HjpitrTKMvGZcXdH9StIjUwyVyyPgbCHUO7s=; b=otZGJbxY5ZxHfFmjj3rNMIaz/aAXPUDwzbHcmBLraTJVwTvCKaDiBwjLOAuzyxLPPh6GP9bO
 ZCZEFOPGtXGzxtkDobeTs3tgVCRedR/TxTjSi3lNnf8D5BnMLi5163glCJc/CyKICESUxMhG
 g1oQVJ7iZIPfaykZRR84+XP0Ssc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f49aa386a801be9b23bcb83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 Aug 2020 01:07:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD451C43387; Sat, 29 Aug 2020 01:07:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54F7AC433C6;
        Sat, 29 Aug 2020 01:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54F7AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to Auto-Hibernate Timer
Date:   Fri, 28 Aug 2020 18:05:13 -0700
Message-Id: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The zero value Auto-Hibernate Timer is a valid setting, and it
indicates the Auto-Hibernate feature being disabled. Correctly
support this setting. In addition, when this value is queried
from sysfs, read from the host controller's register and return
that value instead of using the RAM value.

Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-sysfs.c | 9 ++++++++-
 drivers/scsi/ufs/ufshcd.c    | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index 02d379f00..bdcd27f 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -146,12 +146,19 @@ static u32 ufshcd_us_to_ahit(unsigned int timer)
 static ssize_t auto_hibern8_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
+	u32 ahit;
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 
 	if (!ufshcd_is_auto_hibern8_supported(hba))
 		return -EOPNOTSUPP;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ufshcd_ahit_to_us(hba->ahit));
+	pm_runtime_get_sync(hba->dev);
+	ufshcd_hold(hba, false);
+	ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+	ufshcd_release(hba);
+	pm_runtime_put_sync(hba->dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", ufshcd_ahit_to_us(ahit));
 }
 
 static ssize_t auto_hibern8_store(struct device *dev,
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 06e2439..ea5cc33 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -3975,7 +3975,7 @@ void ufshcd_auto_hibern8_enable(struct ufs_hba *hba)
 {
 	unsigned long flags;
 
-	if (!ufshcd_is_auto_hibern8_supported(hba) || !hba->ahit)
+	if (!ufshcd_is_auto_hibern8_supported(hba))
 		return;
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

