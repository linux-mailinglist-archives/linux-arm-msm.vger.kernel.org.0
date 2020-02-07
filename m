Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF9815536B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 09:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgBGICo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 03:02:44 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:56298 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726573AbgBGICo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 03:02:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581062563; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+F/pt2udyfg8s5WZPxDIux8J3Re3GcC64qVLQuWUVp0=; b=Jc0gtlOVe9KRryDQz6Tv2g3cLs1mDSOidfn2ssywbplH5NTHb3D0cu8QxJE5A753IaQ8g3ue
 s8Z7WY5pJ73fenMAxwMgQozY5SpicPl7M0EL9/QQrQWDDKwyII70FYb+JvrccjjqIeqyrv1n
 s0yNmCoKHKgAFp2lxL///ZUdB9M=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d199d.7f53358e2998-smtp-out-n01;
 Fri, 07 Feb 2020 08:02:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 559BFC447A3; Fri,  7 Feb 2020 08:02:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 940BAC43383;
        Fri,  7 Feb 2020 08:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 940BAC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V1] mmc: sdhci-msm: Don't enable PWRSAVE_DLL for certain sdhc hosts
Date:   Fri,  7 Feb 2020 13:31:56 +0530
Message-Id: <1581062518-11655-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ritesh Harjani <riteshh@codeaurora.org>

SDHC core with new 14lpp and later tech DLL should not enable
PWRSAVE_DLL since such controller's internal gating cannot meet
following MCLK requirement:
When MCLK is gated OFF, it is not gated for less than 0.5us and MCLK
must be switched on for at-least 1us before DATA starts coming.

Adding support for this requirement.

Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index c3a160c..f27f891 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -977,9 +977,21 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
 		goto out;
 	}
 
-	config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3);
-	config |= CORE_PWRSAVE_DLL;
-	writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec3);
+	/*
+	 * Set CORE_PWRSAVE_DLL bit in CORE_VENDOR_SPEC3.
+	 * When MCLK is gated OFF, it is not gated for less than 0.5us
+	 * and MCLK must be switched on for at-least 1us before DATA
+	 * starts coming. Controllers with 14lpp and later tech DLL cannot
+	 * guarantee above requirement. So PWRSAVE_DLL should not be
+	 * turned on for host controllers using this DLL.
+	 */
+	if (msm_host->use_14lpp_dll_reset) {
+		config = readl_relaxed(host->ioaddr +
+				msm_offset->core_vendor_spec3);
+		config |= CORE_PWRSAVE_DLL;
+		writel_relaxed(config, host->ioaddr +
+				msm_offset->core_vendor_spec3);
+	}
 
 	/*
 	 * Drain writebuffer to ensure above DLL calibration
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
