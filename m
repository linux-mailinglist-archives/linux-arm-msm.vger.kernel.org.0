Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBE3178FFB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 13:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgCDMC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 07:02:26 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:14375 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728998AbgCDMC0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 07:02:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583323345; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QQMqqVpMxz0yPIDUvYKvdpvB8rCWfWZiR2iKnS4Bka8=; b=cigjEzf/L5kPurcl71NydIqOfOGg/6Cm/Vdl1H2hQx5dBXSHhq5AUfxKMPnPnHrOrPpcqWtk
 0BpvxS9lTFwjeMo9tFKM1SY5cg1pOLoCRWjJ8xx9CcdC4naISbT70NgjKgNLyinjf/iAQgQh
 KdifwYa6GhiLaEgT5NlDxBpf7FE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5f9895.7fb806279500-smtp-out-n03;
 Wed, 04 Mar 2020 12:01:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCCE2C447A3; Wed,  4 Mar 2020 12:01:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06D27C43383;
        Wed,  4 Mar 2020 12:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06D27C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dianders@google.com,
        mka@chromium.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
Subject: [PATCH] mmc: cqhci: Update cqhci memory ioresource name
Date:   Wed,  4 Mar 2020 17:30:49 +0530
Message-Id: <1583323250-23596-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update cqhci memory ioresource name from cqhci_mem to cqhci since
suffix _mem is redundant.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
Corresponding binding change:
https://lore.kernel.org/linux-arm-msm/1582545470-11530-1-git-send-email-vbadigan@codeaurora.org/
---
 drivers/mmc/host/cqhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
index e2ea2c4..e24b8ff 100644
--- a/drivers/mmc/host/cqhci.c
+++ b/drivers/mmc/host/cqhci.c
@@ -1077,7 +1077,7 @@ struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev)
 
 	/* check and setup CMDQ interface */
 	cqhci_memres = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "cqhci_mem");
+						   "cqhci");
 	if (!cqhci_memres) {
 		dev_dbg(&pdev->dev, "CMDQ not supported\n");
 		return ERR_PTR(-EINVAL);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
