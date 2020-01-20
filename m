Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4A8142DC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 15:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgATOj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 09:39:29 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:28477 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729133AbgATOj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 09:39:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579531168; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BzDRV7ulYCXM+3B574lgGPBya371clGZvJ4IdiMMJzI=; b=KJm8BTuvbMsRwp9bj8MwsakuRbJZl4kIOkfbWJUuH7wx53z6o1c9SE7vJq2niTsmkIKGFgJb
 rmdz5x9oTFQGBmAn5YDmiDMjXMutv66hVzqZXSZwbbbn2uj49EYt1vuGciBl2L842l7F0pAu
 M+bk2MwtNKj/alo8yLs8Nkikg4k=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e25bb9a.7fd55fd684c8-smtp-out-n01;
 Mon, 20 Jan 2020 14:39:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39AA4C4479C; Mon, 20 Jan 2020 14:39:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28D8AC433CB;
        Mon, 20 Jan 2020 14:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28D8AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V3] mmc: sdhci: Let a vendor driver supply and update ADMA descriptor size
Date:   Mon, 20 Jan 2020 20:08:38 +0530
Message-Id: <1579531122-28341-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579519045-26467-1-git-send-email-vbadigan@codeaurora.org>
References: <1579519045-26467-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let a vendor driver supply the maximum descriptor size that it
can operate on. ADMA descriptor table would be allocated using this
supplied size.
If any SD Host controller is of version prior to v4.10 spec
but supports 16byte descriptor, this change allows them to supply
correct descriptor size for ADMA table allocation.

Also let a vendor driver update the descriptor size by overriding
sdhc_host->desc_size if it has to operates on a different descriptor
sizes in different conditions.

Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
--
Thanks Adrian.

Hi Ulf,
Can you pick this patch instead of earlier one? This is more clean
change, sorry for the multiple interations.
Otherwise let me know, I will make these changes as seperate patch.
---
 drivers/mmc/host/sdhci.c | 16 +++++++---------
 drivers/mmc/host/sdhci.h |  3 ++-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 3140fe2..7a7a18e 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -3821,15 +3821,13 @@ int sdhci_setup_host(struct sdhci_host *host)
 		dma_addr_t dma;
 		void *buf;
 
-		if (host->flags & SDHCI_USE_64_BIT_DMA) {
-			host->adma_table_sz = host->adma_table_cnt *
-					      SDHCI_ADMA2_64_DESC_SZ(host);
-			host->desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
-		} else {
-			host->adma_table_sz = host->adma_table_cnt *
-					      SDHCI_ADMA2_32_DESC_SZ;
-			host->desc_sz = SDHCI_ADMA2_32_DESC_SZ;
-		}
+		if (!(host->flags & SDHCI_USE_64_BIT_DMA))
+			host->alloc_desc_sz = SDHCI_ADMA2_32_DESC_SZ;
+		else if (!host->alloc_desc_sz)
+			host->alloc_desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
+
+		host->desc_sz = host->alloc_desc_sz;
+		host->adma_table_sz = host->adma_table_cnt * host->desc_sz;
 
 		host->align_buffer_sz = SDHCI_MAX_SEGS * SDHCI_ADMA2_ALIGN;
 		/*
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 0ed3e0e..10bda3a 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -554,7 +554,8 @@ struct sdhci_host {
 	dma_addr_t adma_addr;	/* Mapped ADMA descr. table */
 	dma_addr_t align_addr;	/* Mapped bounce buffer */
 
-	unsigned int desc_sz;	/* ADMA descriptor size */
+	unsigned int desc_sz;	/* ADMA current descriptor size */
+	unsigned int alloc_desc_sz;	/* ADMA descr. max size host supports */
 
 	struct workqueue_struct *complete_wq;	/* Request completion wq */
 	struct work_struct	complete_work;	/* Request completion work */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
