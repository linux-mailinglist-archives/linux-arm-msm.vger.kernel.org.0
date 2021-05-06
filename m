Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68762375C02
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 21:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbhEFTxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 15:53:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:29052 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhEFTxN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 15:53:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620330734; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6TDC3auy+8mYaeb2hiBwvgL0s2tne64o+j+y6gLua5o=; b=Dyf28JuoM7SXDAIazbRRz+YbVl4v2do/rvduUd9D3LgP2kPlEIDZD0k2LwiIeLjmQQ/zXDGQ
 g+UcJnVprZ9sLs7xwproD/GzEhf2gEUtrI8AUxih9+CO/40y/yvc694Udeg8Qu36GWszMe0n
 He8skyD8CSpMAZoQVXoYoEnzLb0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 609448dec06dd10a2d5d24e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:51:58
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95578C43148; Thu,  6 May 2021 19:51:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53D47C43152;
        Thu,  6 May 2021 19:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53D47C43152
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 5/6] bus: mhi: pci_generic: Set register access length for MHI driver
Date:   Thu,  6 May 2021 12:51:44 -0700
Message-Id: <1620330705-40192-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it from the PCI generic controller driver before registering
the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f0..fb7889f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -463,6 +463,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
+	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
 	err = pci_set_dma_mask(pdev, dma_mask);
 	if (err) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

