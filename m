Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8D41A2362
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgDHNrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:47:42 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17377 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729263AbgDHNrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:47:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353656; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=DslXPf5pjYfWLJo/qreZEBdWGoHpjeFCF0E2+e8EWKY=; b=nYbm4n2kUxbELWCbJt3TZalnp5G8lgDfynzIQ04ghzCz3wyKANiodndZ8kP8FeH8C7gixoar
 ULprwCHg5eRpwT17qaia/EA/5/KV1t71+7MYI45EQycm9FSlI8gYxBSy75FIAW3CS/cCrwun
 8+LA2B8b/1OPu37HI8WTosRs8Gg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd5f8.7f9ddcd40618-smtp-out-n01;
 Wed, 08 Apr 2020 13:47:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1CA8C58A2E; Wed,  8 Apr 2020 13:47:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24CAAC4478C;
        Wed,  8 Apr 2020 13:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24CAAC4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        linux-scsi@vger.kernel.org
Subject: [PATCH 06/21] scsi: ufs: Add support to manage multiple power domains in ufshcd-pltfrm
Date:   Wed,  8 Apr 2020 19:16:32 +0530
Message-Id: <1586353607-32222-7-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some UFS devices need to manage multiple powerdomains. Add support for
it as part of the ufshcd-pltfrm driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Subhash Jadavani <subhashj@codeaurora.org>
Cc: linux-scsi@vger.kernel.org
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 58 ++++++++++++++++++++++++++++++++++++++--
 drivers/scsi/ufs/ufshcd.h        |  3 +++
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 76f9be7..d40b4a7 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -34,8 +34,10 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/pm_opp.h>
 
 #include "ufshcd.h"
 #include "ufshcd-pltfrm.h"
@@ -282,6 +284,44 @@ static void ufshcd_init_lanes_per_dir(struct ufs_hba *hba)
 	}
 }
 
+static int ufshcd_attach_pds(struct device *dev, struct ufs_hba *hba, int num_pds)
+{
+	struct opp_table *opp;
+	struct device **opp_virt_dev;
+	const char *opp_pds[] = { "rpmh_pd", NULL };
+
+	if (num_pds > 2)
+		return -EINVAL;
+
+	/* Attach the power domain for on/off control */
+	hba->gdsc_virt_dev = dev_pm_domain_attach_by_name(dev, "gdsc_pd");
+	if (IS_ERR(hba->gdsc_virt_dev))
+		return PTR_ERR(hba->gdsc_virt_dev);
+
+	device_link_add(dev, hba->gdsc_virt_dev, DL_FLAG_RPM_ACTIVE |
+			DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+
+
+	/* Attach the power domain for setting performance state */
+	opp = dev_pm_opp_attach_genpd(dev, opp_pds, &opp_virt_dev);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	else if (opp_virt_dev) {
+		hba->opp_virt_dev = *opp_virt_dev;
+
+		device_link_add(dev, hba->opp_virt_dev, DL_FLAG_RPM_ACTIVE |
+				DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	}
+
+	return 0;
+}
+
+static void ufshcd_detach_pds(struct ufs_hba *hba)
+{
+	dev_pm_domain_detach(hba->gdsc_virt_dev, false);
+	dev_pm_domain_detach(hba->opp_virt_dev, false);
+}
+
 /**
  * ufshcd_get_pwr_dev_param - get finally agreed attributes for
  *                            power mode change
@@ -391,7 +431,7 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 {
 	struct ufs_hba *hba;
 	void __iomem *mmio_base;
-	int irq, err;
+	int irq, err, num_pds;
 	struct device *dev = &pdev->dev;
 
 	mmio_base = devm_platform_ioremap_resource(pdev, 0);
@@ -429,10 +469,21 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 
 	ufshcd_init_lanes_per_dir(hba);
 
+	num_pds = of_count_phandle_with_args(dev->of_node, "power-domains",
+					     "#power-domain-cells");
+	if (num_pds > 1) {
+		err = ufshcd_attach_pds(&pdev->dev, hba, num_pds);
+		if (err) {
+			dev_err(&pdev->dev, "%s: attach of power domains failed %d\n",
+				__func__, err);
+			goto dealloc_host;
+		}
+	}
+
 	err = ufshcd_init(hba, mmio_base, irq);
 	if (err) {
 		dev_err(dev, "Initialization failed\n");
-		goto dealloc_host;
+		goto detach_pds;
 	}
 
 	platform_set_drvdata(pdev, hba);
@@ -442,6 +493,9 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 
 	return 0;
 
+detach_pds:
+	if (num_pds > 1)
+		ufshcd_detach_pds(hba);
 dealloc_host:
 	ufshcd_dealloc_host(hba);
 out:
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index dd1ee27..ed3fbad 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -612,6 +612,9 @@ struct ufs_hba {
 	struct Scsi_Host *host;
 	struct device *dev;
 	struct request_queue *cmd_queue;
+	struct device *gdsc_virt_dev;
+	struct device *opp_virt_dev;
+
 	/*
 	 * This field is to keep a reference to "scsi_device" corresponding to
 	 * "UFS device" W-LU.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
