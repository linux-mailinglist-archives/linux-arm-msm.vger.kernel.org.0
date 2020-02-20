Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCA61654DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgBTCMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:12:17 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:22142 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727668AbgBTCMR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:12:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582164736; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=G0N2LK4yBTzqvnQc6T2DASLm9WXe508wiQLbyaNYBZI=; b=V9MLAb9HJ28M3OI13O74gQu8kx2ggp7QbjDEnx93YPutf/py1+p/kkYAdjNPVe/1AqmeYpNr
 7yuwLer2C1sZD9kUscJlUp41e+tQNd5UTmnKxKl68ySid1qZs5wZPuZl8dwgcMcdWeGlI+Y6
 D9gqX4dKqwHykRtI6HtRulUG/Rs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4deaf4.7fc054e3d308-smtp-out-n01;
 Thu, 20 Feb 2020 02:12:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 454E1C447A4; Thu, 20 Feb 2020 02:12:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56F5EC433A2;
        Thu, 20 Feb 2020 02:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56F5EC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH 1/2] remoteproc: core: Add an API for booting with firmware name
Date:   Wed, 19 Feb 2020 18:11:52 -0800
Message-Id: <1582164713-6413-2-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an API which allows to change the name of the firmware to be booted on
the specified rproc. This change gives us the flixibility to change the
firmware at run-time depending on the usecase. Some remoteprocs might use
a different firmware for testing, production and development purposes,
which may be selected based on the fuse settings during bootup.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e..5ab65a4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1779,6 +1779,40 @@ int rproc_boot(struct rproc *rproc)
 EXPORT_SYMBOL(rproc_boot);
 
 /**
+ * rproc_boot_with_fw() - boot a remote processor with the specified firmware
+ * @rproc: handle of a remote processor
+ * @firmware: name of the firmware to boot with
+ *
+ * Change the name of the firmware to be loaded to @firmware in the rproc
+ * structure, and call rproc_boot().
+ *
+ * Returns 0 on success, and an appropriate error value otherwise.
+ */
+int rproc_boot_with_fw(struct rproc *rproc, const char *firmware)
+{
+	char *p;
+
+	if (!rproc) {
+		pr_err("invalid rproc handle\n");
+		return -EINVAL;
+	}
+
+	if (firmware) {
+		p = kstrdup(firmware, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+
+		mutex_lock(&rproc->lock);
+		kfree(rproc->firmware);
+		rproc->firmware = p;
+		mutex_unlock(&rproc->lock);
+	}
+
+	return rproc_boot(rproc);
+}
+EXPORT_SYMBOL(rproc_boot_with_fw);
+
+/**
  * rproc_shutdown() - power off the remote processor
  * @rproc: the remote processor
  *
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad666..e2eaba9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -609,6 +609,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 			     u32 da, const char *name, ...);
 
 int rproc_boot(struct rproc *rproc);
+int rproc_boot_with_fw(struct rproc *rproc, const char *firmware);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
