Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58AA29467B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 04:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411163AbgJUCWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 22:22:10 -0400
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227]:30402 "EHLO
        alexa-out-tai-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394050AbgJUCWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 22:22:10 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Oct 2020 22:22:09 EDT
Received: from ironmsg01-tai.qualcomm.com ([10.249.140.6])
  by alexa-out-tai-02.qualcomm.com with ESMTP; 21 Oct 2020 10:16:02 +0800
X-QCInternal: smtphost
Received: from hyiwei-gv.qualcomm.com (HELO hyiwei-gv) ([10.231.253.155])
  by ironmsg01-tai.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Oct 2020 10:15:55 +0800
From:   Huang Yiwei <hyiwei@codeaurora.org>
To:     jassisinghbrar@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     Huang Yiwei <hyiwei@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] mailbox: qcom: Support building QCOM IPCC driver as module
Date:   Wed, 21 Oct 2020 10:15:52 +0800
Message-Id: <1603246552-23601-1-git-send-email-hyiwei@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change CONFIG_QCOM_IPCC to tristate and add exit function to
support module build for QCOM IPCC driver.

Signed-off-by: Huang Yiwei <hyiwei@codeaurora.org>
---
 drivers/mailbox/Kconfig     | 2 +-
 drivers/mailbox/qcom-ipcc.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 05b1009..78f3006 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -245,7 +245,7 @@ config SPRD_MBOX
 	  you want to build the Spreatrum mailbox controller driver.
 
 config QCOM_IPCC
-	bool "Qualcomm Technologies, Inc. IPCC driver"
+	tristate "Qualcomm Technologies, Inc. IPCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Qualcomm Technologies, Inc. Inter-Processor Communication Controller
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 2d13c72..1ed9a87 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -280,6 +280,12 @@ static int __init qcom_ipcc_init(void)
 }
 arch_initcall(qcom_ipcc_init);
 
+static __exit void qcom_ipcc_exit(void)
+{
+	platform_driver_unregister(&qcom_ipcc_driver);
+}
+module_exit(qcom_ipcc_exit);
+
 MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>");
 MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
 MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPCC driver");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

