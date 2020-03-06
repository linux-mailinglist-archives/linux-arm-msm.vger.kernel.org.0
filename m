Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D29CA17BFE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 15:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCFOJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 09:09:33 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:43155 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726108AbgCFOJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 09:09:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583503773; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2y8rgvqTW5AO7Iekw6FrG+bmm4hp1y5NFr7IRbn/9As=; b=HeoIx95XpJS9ptkacStqD3p+HJBWHDF7xpng0W6lHGZGI+G5I5a2NIZrX2eq4V0e3SXimMWU
 0aZE1YU9yu4omh1D7zqyEUKbao+S1+jJYwBhBPn3xJN9Ed1yttN4gh2mIjVMuuDqVWupYm50
 DJKK5jeh+H23Ar3SMLzbL+SD06Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e62598a.7f7dfc848378-smtp-out-n05;
 Fri, 06 Mar 2020 14:09:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 530B8C432C2; Fri,  6 Mar 2020 14:09:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 338F1C433F2;
        Fri,  6 Mar 2020 14:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 338F1C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
Subject: [PATCH V3 1/2] mmc: cqhci: Add cqhci_deactivate()
Date:   Fri,  6 Mar 2020 19:38:42 +0530
Message-Id: <1583503724-13943-2-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583503724-13943-1-git-send-email-vbadigan@codeaurora.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
 <1583503724-13943-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Adrian Hunter <adrian.hunter@intel.com>

Host controllers can reset CQHCI either directly or as a consequence of
host controller reset. Add cqhci_deactivate() which puts the CQHCI
driver into a state that is consistent with that.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/cqhci.c | 6 +++---
 drivers/mmc/host/cqhci.h | 6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
index e24b8ff..c2239ee 100644
--- a/drivers/mmc/host/cqhci.c
+++ b/drivers/mmc/host/cqhci.c
@@ -298,16 +298,16 @@ static void __cqhci_disable(struct cqhci_host *cq_host)
 	cq_host->activated = false;
 }
 
-int cqhci_suspend(struct mmc_host *mmc)
+int cqhci_deactivate(struct mmc_host *mmc)
 {
 	struct cqhci_host *cq_host = mmc->cqe_private;
 
-	if (cq_host->enabled)
+	if (cq_host->enabled && cq_host->activated)
 		__cqhci_disable(cq_host);
 
 	return 0;
 }
-EXPORT_SYMBOL(cqhci_suspend);
+EXPORT_SYMBOL(cqhci_deactivate);
 
 int cqhci_resume(struct mmc_host *mmc)
 {
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index def76e9..4377001 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -230,7 +230,11 @@ irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
 		      int data_error);
 int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
 struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
-int cqhci_suspend(struct mmc_host *mmc);
+int cqhci_deactivate(struct mmc_host *mmc);
+static inline int cqhci_suspend(struct mmc_host *mmc)
+{
+	return cqhci_deactivate(mmc);
+}
 int cqhci_resume(struct mmc_host *mmc);
 
 #endif
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
