Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D38171370
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 09:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgB0I5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 03:57:05 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:19035 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728662AbgB0I5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 03:57:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582793824; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Me3rgp82AsTmvT6KNwO9BrvbM8fnHBL1m8jXbzftToc=; b=ihDZE8t2Y2Gtzp6Z0cJ56koIA5+dsSBK016N78Y3gs5onLYruyETxLZf6ntL0IbNa2v6bTz3
 OPEeWOIE6FBLrsjZpNYfrO05cxv+PWZ3RhDLwdQ2j9zTY5YE7z3zd0CuTnY7sIS81WcuvEUA
 BcDV0gXYC0jCDEMjRNFRdSSOjYU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e578453.7fd118621b58-smtp-out-n03;
 Thu, 27 Feb 2020 08:56:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44F7BC4479F; Thu, 27 Feb 2020 08:56:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32AC4C4479C;
        Thu, 27 Feb 2020 08:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32AC4C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v8 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
Date:   Thu, 27 Feb 2020 14:26:25 +0530
Message-Id: <1582793785-22423-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582793785-22423-1-git-send-email-mkshah@codeaurora.org>
References: <1582793785-22423-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to invoke rpmh flush() when the data in cache is dirty.

This is done only if OSI is not supported in PSCI. If OSI is supported
rpmh_flush can get invoked when the last cpu going to power collapse
deepest low power mode.

Also remove "depends on COMPILE_TEST" for Kconfig option QCOM_RPMH so the
driver is only compiled for arm64 which supports psci_has_osi_support()
API.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
---
 drivers/soc/qcom/Kconfig | 2 +-
 drivers/soc/qcom/rpmh.c  | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index d0a73e7..2e581bc 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -105,7 +105,7 @@ config QCOM_RMTFS_MEM
 
 config QCOM_RPMH
 	bool "Qualcomm RPM-Hardened (RPMH) Communication"
-	depends on ARCH_QCOM && ARM64 || COMPILE_TEST
+	depends on ARCH_QCOM && ARM64
 	help
 	  Support for communication with the hardened-RPM blocks in
 	  Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 3f5d9eb..326c58a 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/psci.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -160,6 +161,9 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 unlock:
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 
+	if (ctrlr->dirty && !psci_has_osi_support())
+		return rpmh_flush(ctrlr) ? ERR_PTR(-EINVAL) : req;
+
 	return req;
 }
 
@@ -388,6 +392,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 
 	if (state != RPMH_ACTIVE_ONLY_STATE) {
 		cache_batch(ctrlr, req);
+		if (!psci_has_osi_support())
+			return rpmh_flush(ctrlr);
 		return 0;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
