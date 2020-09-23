Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB32761D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 22:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgIWUQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 16:16:21 -0400
Received: from z5.mailgun.us ([104.130.96.5]:11939 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726594AbgIWUQR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 16:16:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600892177; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=41M7lu3mcn4sKq0m5s5biW2IMzXz4w+yykAlcmHbh34=; b=WCA+zTLNwUNMAFJ+Spkg0INVy9cY/EelDVCMmepJFRyXexhdyPTLiucx+PkPV6Ce84g+CGp0
 ex5QfEgleXODK1u9XjuPD1ZadTAVDf1DUnB/pyUyml8HxzYDdAA7vh1XR1BCiC0DpBkqKmsG
 b11W//xX/baJaRkrgIBM0KG1cKg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f6bad0f5ce0e081c748107b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 20:16:15
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53A11C433FE; Wed, 23 Sep 2020 20:16:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C740C433C8;
        Wed, 23 Sep 2020 20:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C740C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH] soc: qcom: cmd-db: allow loading as a module
Date:   Wed, 23 Sep 2020 14:16:05 -0600
Message-Id: <20200923201605.18374-1-ilina@codeaurora.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables Command DB driver to be loaded as a module. Command
DB is inherent to RPMH interaction and as such would never be unloaded.
Add supress_bind_attrs to make it a permanently loaded module.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/soc/qcom/Kconfig  | 2 +-
 drivers/soc/qcom/cmd-db.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 3dc3e3d61ea3..e2b8427af84c 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -17,7 +17,7 @@ config QCOM_AOSS_QMP
 	  Subsystem (AOSS) using Qualcomm Messaging Protocol (QMP).
 
 config QCOM_COMMAND_DB
-	bool "Qualcomm Command DB"
+	tristate "Qualcomm Command DB"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on OF_RESERVED_MEM
 	help
diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index fc5610603b17..a26bd0639b70 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2016-2018, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2016-2020, The Linux Foundation. All rights reserved. */
 
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
@@ -340,12 +341,14 @@ static const struct of_device_id cmd_db_match_table[] = {
 	{ .compatible = "qcom,cmd-db" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, cmd_db_match_table);
 
 static struct platform_driver cmd_db_dev_driver = {
 	.probe  = cmd_db_dev_probe,
 	.driver = {
 		   .name = "cmd-db",
 		   .of_match_table = cmd_db_match_table,
+		   .suppress_bind_attrs = true,
 	},
 };
 
@@ -354,3 +357,6 @@ static int __init cmd_db_device_init(void)
 	return platform_driver_register(&cmd_db_dev_driver);
 }
 arch_initcall(cmd_db_device_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Command DB Driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

