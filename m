Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C9C28030C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 17:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732308AbgJAPmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 11:42:02 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:24236 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731885AbgJAPmC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 11:42:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601566922; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=7iP4Kfu/NHO81z79u/EJrov5/3xnkW1QSG/CD/km8fk=; b=NGEppjak+HLzH1EZpv9E+aCtK+QIqfDpoOVhEQb9KwcLPVXYaPhY6R4varnwJ6AVQGFPOiZC
 FU+uvWmp59Y+EkgkQhY2U9l39CD0/ElwgcRMi4MuD0Y7j0hR5iCBmoynqcqm1Ep5ly4PDGPd
 FD9AapbStRVFSGIKcP5Qv21Yefw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f75f8bf726b122f31e81373 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Oct 2020 15:41:51
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E540DC433CA; Thu,  1 Oct 2020 15:41:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A28EC433CB;
        Thu,  1 Oct 2020 15:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A28EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        mkshah@codeaurora.org, Lina Iyer <ilina@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH v3] soc: qcom: cmd-db: allow loading as a module
Date:   Thu,  1 Oct 2020 09:41:44 -0600
Message-Id: <20201001154144.5226-1-ilina@codeaurora.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables Command DB driver to be loaded as a module. Command
DB is inherent to RPMH interaction and as such would never be unloaded.
Add supress_bind_attrs to make it a permanently loaded module.

Reviewed-by: John Stultz <john.stultz@linaro.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v3:
	- Update copyright, suggested by Greg K-H
Changes in v2:
	- Add reviewed and tested tags provided in IRC chat
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
index fc5610603b17..dd872017f345 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2016-2018, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2016-2018, 2020, The Linux Foundation. All rights reserved. */
 
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

