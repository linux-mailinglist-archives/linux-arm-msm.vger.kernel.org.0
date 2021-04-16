Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F7C3627FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 20:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245498AbhDPSsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 14:48:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10123 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245302AbhDPSsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 14:48:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618598859; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=C0sQCjaoPR40g0+mP3PUInbcfTXbeVX/WRbKeIYAWoU=; b=obMtqMJE3ii6SodafZhuMBwqXMG/a1PK1KRtsvfjA5JAQHhQ8unYfVUN0heLjXfoT/IXQmy+
 QWG6ND+qAIUv16Jj8Ihi0KIq6qlo8aoW2CfAsw3nJw5HbR1wbNReAdVYZeL2LVRomLsJhqGM
 b9LYB2yZCCTQ4HHjswHvn+8ScPc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6079dbb8a817abd39a24ddd4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:47:20
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D251C43467; Fri, 16 Apr 2021 18:47:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EAC0C43461;
        Fri, 16 Apr 2021 18:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EAC0C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 4/6] ath11k: set register access length for MHI driver
Date:   Fri, 16 Apr 2021 11:47:03 -0700
Message-Id: <1618598825-18629-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it before registering the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 09858e5..c0f013c 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -235,6 +235,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->cntrl_dev = ab->dev;
 	mhi_ctrl->fw_image = ab_pci->amss_path;
 	mhi_ctrl->regs = ab->mem;
+	mhi_ctrl->reg_len = ab->mem_len;
 
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

