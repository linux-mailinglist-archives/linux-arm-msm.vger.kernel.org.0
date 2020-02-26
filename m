Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8F516F73D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 06:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgBZF1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 00:27:45 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:52533 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727005AbgBZF1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 00:27:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582694864; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Y68tsXGzPZ8q14LHS1TLD6kADG3Oa9mJKTf+M/UdsM4=; b=VyWik9GNOrfJSyXXCc0I6WMd2S6IosPM3E2C5H521NCuNSHYbSRdOpAsjULnTv+4LYvSONWd
 DySfnfG8oVY6u5KVaXnP+lUnw/+tDhnua8ZkZCb3xumb7Lvws9i5X6+EmtU+pPD0oE2CvUJx
 1BadowqdB6IUQp3yST622AjLbUI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5601c8.7f45e52cba40-smtp-out-n02;
 Wed, 26 Feb 2020 05:27:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2794CC43383; Wed, 26 Feb 2020 05:27:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BABE6C4479D;
        Wed, 26 Feb 2020 05:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BABE6C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v7 3/3] soc: qcom: rpmh: Invoke rpmh_flush for dirty caches
Date:   Wed, 26 Feb 2020 10:57:13 +0530
Message-Id: <1582694833-9407-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org>
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to invoke rpmh flush when the data in cache is dirty.

This is done only if OSI is not supported in PSCI. If OSI is supported
rpmh_flush can get invoked when the last cpu going to power collapse
deepest low power mode.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
---
 drivers/soc/qcom/rpmh.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 83ba4e0..839af8d 100644
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
@@ -163,6 +164,9 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 unlock:
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 
+	if (ctrlr->dirty && !psci_has_osi_support())
+		return rpmh_flush(ctrlr) ? ERR_PTR(-EINVAL) : req;
+
 	return req;
 }
 
@@ -391,6 +395,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 
 	if (state != RPMH_ACTIVE_ONLY_STATE) {
 		cache_batch(ctrlr, req);
+		if (!psci_has_osi_support())
+			return rpmh_flush(ctrlr);
 		return 0;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
