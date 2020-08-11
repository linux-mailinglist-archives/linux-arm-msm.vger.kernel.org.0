Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9614D241D62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgHKPmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:42:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:47556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728954AbgHKPmF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 749AC214F1;
        Tue, 11 Aug 2020 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160523;
        bh=DK21YohqwauX6NuCJLzJ5IGLlCzo0GLJDd68tiuadyc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DGXyoBn/gEQo/c9OYHtdIopuoBK8rWk15XTuBX7j5MCneJQcPxNiXWCMtqw2bKUrB
         6IQe8a3vwGfD1iRKGZJ/T2vZokIctpt6SBjfu4KZxTLLk7Y2l9p+N/e+4zc5sifLrx
         oQTXGMxqYS1TAXfqtr4ZrW3xpT5ym/JeFatO/o7o=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPZ-004bme-Jc; Tue, 11 Aug 2020 17:42:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Mayulong <mayulong1@huawei.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/33] spmi: hisi-spmi-controller: adjust whitespaces at defines
Date:   Tue, 11 Aug 2020 17:41:36 +0200
Message-Id: <5f65845d47fb8be07aee7aa0197d50724a633018.1597160086.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597160086.git.mchehab+huawei@kernel.org>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some defines are not aligned with tab=8, which is the
style defined on Linux. Adjust them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/spmi/hisi-spmi-controller.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 99cf757d76fe..7fae267a6062 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -18,10 +18,10 @@
 /*
  * SPMI register addr
  */
-#define SPMI_CHANNEL_OFFSET					0x0300
-#define SPMI_SLAVE_OFFSET						0x20
+#define SPMI_CHANNEL_OFFSET				0x0300
+#define SPMI_SLAVE_OFFSET				0x20
 
-#define SPMI_APB_SPMI_CMD_BASE_ADDR				0x0100
+#define SPMI_APB_SPMI_CMD_BASE_ADDR			0x0100
 
 #define SPMI_APB_SPMI_WDATA0_BASE_ADDR			0x0104
 #define SPMI_APB_SPMI_WDATA1_BASE_ADDR			0x0108
@@ -35,21 +35,21 @@
 #define SPMI_APB_SPMI_RDATA2_BASE_ADDR			0x020c
 #define SPMI_APB_SPMI_RDATA3_BASE_ADDR			0x0210
 
-#define SPMI_PER_DATAREG_BYTE					4
+#define SPMI_PER_DATAREG_BYTE				4
 /*
  * SPMI cmd register
  */
-#define SPMI_APB_SPMI_CMD_EN						BIT(31)
+#define SPMI_APB_SPMI_CMD_EN				BIT(31)
 #define SPMI_APB_SPMI_CMD_TYPE_OFFSET			24
 #define SPMI_APB_SPMI_CMD_LENGTH_OFFSET			20
-#define SPMI_APB_SPMI_CMD_SLAVEID_OFFSET			16
-#define SPMI_APB_SPMI_CMD_ADDR_OFFSET				0
 
 #define bswap_32(X)   \
     ((((u32)(X) & 0xff000000) >> 24) | \
      (((u32)(X) & 0x00ff0000) >> 8) | \
      (((u32)(X) & 0x0000ff00) << 8) | \
      (((u32)(X) & 0x000000ff) << 24))
+#define SPMI_APB_SPMI_CMD_SLAVEID_OFFSET		16
+#define SPMI_APB_SPMI_CMD_ADDR_OFFSET			0
 
 /* Command Opcodes */
 
@@ -70,15 +70,15 @@ enum spmi_controller_cmd_op_code {
 /*
  * SPMI status register
  */
-#define SPMI_APB_TRANS_DONE						BIT(0)
-#define SPMI_APB_TRANS_FAIL						BIT(2)
+#define SPMI_APB_TRANS_DONE			BIT(0)
+#define SPMI_APB_TRANS_FAIL			BIT(2)
 
 /* Command register fields */
 #define SPMI_CONTROLLER_CMD_MAX_BYTE_COUNT	16
 
 /* Maximum number of support PMIC peripherals */
 #define SPMI_CONTROLLER_TIMEOUT_US		1000
-#define SPMI_CONTROLLER_MAX_TRANS_BYTES	(16)
+#define SPMI_CONTROLLER_MAX_TRANS_BYTES		16
 
 /*
  * @base base address of the PMIC Arbiter core registers.
@@ -114,8 +114,10 @@ static int spmi_controller_wait_for_done(struct spmi_controller_dev *ctrl_dev,
 {
 	u32 status = 0;
 	u32 timeout = SPMI_CONTROLLER_TIMEOUT_US;
-	u32 offset = SPMI_APB_SPMI_STATUS_BASE_ADDR + SPMI_CHANNEL_OFFSET * ctrl_dev->channel
-		+ SPMI_SLAVE_OFFSET * sid;
+	u32 offset;
+
+	offset  = SPMI_APB_SPMI_STATUS_BASE_ADDR;
+	offset += SPMI_CHANNEL_OFFSET * ctrl_dev->channel + SPMI_SLAVE_OFFSET * sid;
 
 	while (timeout--) {
 		status = readl(base + offset);
-- 
2.26.2

