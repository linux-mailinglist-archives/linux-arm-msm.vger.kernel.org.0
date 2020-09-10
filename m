Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFF42639F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbgIJCPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:15:09 -0400
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:44120
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728970AbgIJCM7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 22:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599696158;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=k0CVrHNZHjKDxCYHpx5Zfcww4H7NJod+HjFj1v8y6r8=;
        b=OPo6HIRRoh+itG87IiC0xOtfzjIfYwaDz5cUI5+ORDXexmX+4WkcMOW+C1jRdP5/
        dvbaqsNaMfff0lMTZOkalczdvBO5coX+79NyzjqpHzXUj1ijH8myOM/m5iuwdBa5M2G
        xrq9MWVsfR5Doa1sJVYjouJM6X9g1zT3HNb1j74Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599696158;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=k0CVrHNZHjKDxCYHpx5Zfcww4H7NJod+HjFj1v8y6r8=;
        b=LThhPK0i3L1gsbZJ1rGSfYvhkH1wz8uhapBdXIUZv7FAXjloJTrahEh405vksW1I
        5OV2DdbMHR+M7MV69n8vu+V5gUVYf721iZasYaHOxKxfQvrZFPrkxtKiFnQPeF81Byg
        xtClDm4wbxKKw0Hon6kn0/H60zmHqYRO4okKeHZE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98448C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: [PATCH v3 1/3] remoteproc: core: Add ops to enable custom coredump functionality
Date:   Thu, 10 Sep 2020 00:02:38 +0000
Message-ID: <0101017475523e2d-7bba9c78-bfd2-4c08-854a-cac8f3cc1cf3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599696147-30585-1-git-send-email-sidgup@codeaurora.org>
References: <1599696147-30585-1-git-send-email-sidgup@codeaurora.org>
X-SES-Outgoing: 2020.09.10-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each remoteproc might have different requirements for coredumps and might
want to choose the type of dumps it wants to collect. This change allows
remoteproc drivers to specify their own custom dump function to be executed
in place of rproc_coredump. If the coredump op is not specified by the
remoteproc driver it will be set to rproc_coredump by default.The
priv_cleanup op cleans up the private resources used by the remoteproc.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 include/linux/remoteproc.h           | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7f90eee..dcc1341 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1681,7 +1681,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 		goto unlock_mutex;
 
 	/* generate coredump */
-	rproc_coredump(rproc);
+	rproc->ops->coredump(rproc);
 
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
@@ -2103,6 +2103,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	if (!rproc->ops)
 		return -ENOMEM;
 
+	/* Default to rproc_coredump if no coredump function is specified */
+	if (!rproc->ops->coredump)
+		rproc->ops->coredump = rproc_coredump;
+
 	if (rproc->ops->load)
 		return 0;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2fa68bf..a489aec 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -375,6 +375,8 @@ enum rsc_handling_status {
  * @get_boot_addr:	get boot address to entry point specified in firmware
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
+ * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @priv_cleanup: cleans up the private resources used by the rproc
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -393,6 +395,8 @@ struct rproc_ops {
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
+	void (*coredump)(struct rproc *rproc);
+	void (*priv_cleanup)(struct rproc *rproc);
 };
 
 /**
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

