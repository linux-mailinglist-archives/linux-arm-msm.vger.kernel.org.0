Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58EA91A5F75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 19:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgDLRJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 13:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgDLRJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 13:09:26 -0400
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info [104.130.122.26])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 6253DC0A3BF1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2020 10:09:23 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586711366; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=K5BbQ2KZUyrV8meYfqfpKKLeqOc3xQqj4eCow+xfX+M=; b=Moa69rG0YvY7dIP+it+yzPI8H5kzv4aWN6E+iYEKlImYfa+JAt8Y6noq7U7y5CaeVXsvuDPm
 V9z8GP5yt6L0v7FqsbVVyD8VVbcs23aCnHYQunYgc13/9TYG8QWFm8KQUeRS9ZnSMM4mpSg2
 IKens67zBdUls8TRObv7V10zN/c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e934b32.7fe9100163e8-smtp-out-n01;
 Sun, 12 Apr 2020 17:09:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9255EC433BA; Sun, 12 Apr 2020 17:09:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6ADA3C433F2;
        Sun, 12 Apr 2020 17:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6ADA3C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V1] mmc: sdhci-msm: Enable ADMA length mismatch error interrupt
Date:   Sun, 12 Apr 2020 22:37:34 +0530
Message-Id: <1586711302-3552-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586706808-27337-5-git-send-email-vbadigan@codeaurora.org>
References: <1586706808-27337-5-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ADMA_ERR_SIZE_EN bit of VENDOR_SPECIFIC_FUNC register controls
ADMA length mismatch error interrupt. Enable it by default.

And update all bit shift defines with BIT macro.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 482045b..7d744f9 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -56,19 +56,19 @@
 #define CORE_FLL_CYCLE_CNT	BIT(18)
 #define CORE_DLL_CLOCK_DISABLE	BIT(21)
 
-#define CORE_VENDOR_SPEC_POR_VAL 0xa1c
+#define CORE_VENDOR_SPEC_POR_VAL 0xa9c
 #define CORE_CLK_PWRSAVE	BIT(1)
 #define CORE_HC_MCLK_SEL_DFLT	(2 << 8)
 #define CORE_HC_MCLK_SEL_HS400	(3 << 8)
 #define CORE_HC_MCLK_SEL_MASK	(3 << 8)
-#define CORE_IO_PAD_PWR_SWITCH_EN	(1 << 15)
-#define CORE_IO_PAD_PWR_SWITCH  (1 << 16)
+#define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
+#define CORE_IO_PAD_PWR_SWITCH	BIT(16)
 #define CORE_HC_SELECT_IN_EN	BIT(18)
 #define CORE_HC_SELECT_IN_HS400	(6 << 19)
 #define CORE_HC_SELECT_IN_MASK	(7 << 19)
 
-#define CORE_3_0V_SUPPORT	(1 << 25)
-#define CORE_1_8V_SUPPORT	(1 << 26)
+#define CORE_3_0V_SUPPORT	BIT(25)
+#define CORE_1_8V_SUPPORT	BIT(26)
 #define CORE_VOLT_SUPPORT	(CORE_3_0V_SUPPORT | CORE_1_8V_SUPPORT)
 
 #define CORE_CSR_CDC_CTLR_CFG0		0x130
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
