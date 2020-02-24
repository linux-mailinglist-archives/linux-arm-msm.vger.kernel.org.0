Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCC116A578
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 12:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgBXLqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 06:46:49 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:30435 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727627AbgBXLqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 06:46:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582544808; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RQyNQ3DFWtlsQXD4V++chr0ZTqGNZET5yxGQsVzgceo=; b=iI9783ZdPg2jMFdpFWMJHHuQtgNN2KgcAEyh8zuBL40evfxrCezu9JjWJRFpyntq7jNO9n7h
 xEq1aQGwZ2pa/GhHJvVwZnFYl/Rejm+VlwnCPHGPxVaj2zEUpu7QVQ36dBfTjJt53hHE8IDG
 aDV0HPvNtCVstmv4qL7eNbHzsRo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e53b7a1.7f963daa67a0-smtp-out-n01;
 Mon, 24 Feb 2020 11:46:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 475DDC4479D; Mon, 24 Feb 2020 11:46:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C3B6C43383;
        Mon, 24 Feb 2020 11:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C3B6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH V2] dt-bindings: mmc: sdhci-msm: Add CQE reg map
Date:   Mon, 24 Feb 2020 17:14:43 +0530
Message-Id: <1582544683-9505-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org>
References: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CQE feature has been enabled on sdhci-msm. Add CQE reg map
and reg names that need to be supplied for supporting CQE feature.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---

Changes since V1:
	- Dropped _mem suffix to reg names.
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 7ee639b..5445931 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -26,7 +26,13 @@ Required properties:
 
 - reg: Base address and length of the register in the following order:
 	- Host controller register map (required)
-	- SD Core register map (required for msm-v4 and below)
+	- SD Core register map (required for controllers earlier than msm-v5)
+	- CQE register map (Optional, CQE support is present on SDHC instance meant
+	                    for eMMC and version v4.2 and above)
+- reg-names: When CQE register map is supplied, below reg-names are required
+	- "hc" for Host controller register map
+	- "core" for SD core register map
+	- "cqhci" for CQE register map
 - interrupts: Should contain an interrupt-specifiers for the interrupts:
 	- Host controller interrupt (required)
 - pinctrl-names: Should contain only one value - "default".
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
