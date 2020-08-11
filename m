Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8A241D87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgHKPoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:44:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728946AbgHKPmF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 714B920FC3;
        Tue, 11 Aug 2020 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160523;
        bh=rdCEN/RI25V0Y1iq7dV+krmGtNwdfSkrQ573PfqTzbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lJ52qIUaqF9ELj3CxBxjUZIVra86+XAdL9sO2h1Ri4UAG6+KGxkHyhDMbPDIpGpjh
         gKIBbjk0OKXmxsRaq+oUZoYbardxLGVB4y1J0FIDjfV28fowaMq2RYrM8N0BZrxciT
         6KLZCVr70pR5S8Y7ENNh6x2zO7k9J5KsoSYPXwyM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPZ-004bmh-KV; Tue, 11 Aug 2020 17:42:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Mayulong <mayulong1@huawei.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/33] spmi: hisi-spmi-controller: use le32 macros where needed
Date:   Tue, 11 Aug 2020 17:41:37 +0200
Message-Id: <69177c7a8284d827b7024add63fe05b7e3f6ee2f.1597160086.git.mchehab+huawei@kernel.org>
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

Instead of manually using bswap_32(), just use the
le32 macros.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/spmi/hisi-spmi-controller.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 7fae267a6062..cacd28150b49 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/spmi.h>
-#include <linux/spmi.h>
 
 #define SPMI_CONTROLLER_NAME		"spmi_controller"
 
@@ -43,11 +42,6 @@
 #define SPMI_APB_SPMI_CMD_TYPE_OFFSET			24
 #define SPMI_APB_SPMI_CMD_LENGTH_OFFSET			20
 
-#define bswap_32(X)   \
-    ((((u32)(X) & 0xff000000) >> 24) | \
-     (((u32)(X) & 0x00ff0000) >> 8) | \
-     (((u32)(X) & 0x0000ff00) << 8) | \
-     (((u32)(X) & 0x000000ff) << 24))
 #define SPMI_APB_SPMI_CMD_SLAVEID_OFFSET		16
 #define SPMI_APB_SPMI_CMD_ADDR_OFFSET			0
 
@@ -179,14 +173,15 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
 
 	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
 
-	rc = spmi_controller_wait_for_done(spmi_controller, spmi_controller->base, sid, addr);
+	rc = spmi_controller_wait_for_done(spmi_controller,
+					   spmi_controller->base, sid, addr);
 	if (rc)
 		goto done;
 
 	i = 0;
 	do {
 		data = readl(spmi_controller->base + chnl_ofst + SPMI_SLAVE_OFFSET * sid + SPMI_APB_SPMI_RDATA0_BASE_ADDR + i * SPMI_PER_DATAREG_BYTE);
-		data = bswap_32(data);
+		data = be32_to_cpu((__be32)data);
 		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
 			memcpy(buf, &data, sizeof(data));
 			buf += sizeof(data);
@@ -210,8 +205,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
 {
 	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
 	unsigned long flags;
-	u32 cmd;
-	u32 data = 0;
+	u32 cmd, data;
 	int rc;
 	u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
 	u8 op_code, i;
@@ -246,7 +240,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
 
 	i = 0;
 	do {
-		memset(&data, 0, sizeof(data));
+		data = 0;
 		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
 			memcpy(&data, buf, sizeof(data));
 			buf += sizeof(data);
@@ -255,8 +249,8 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
 			buf += (bc % SPMI_PER_DATAREG_BYTE);
 		}
 
-		data = bswap_32(data);
-		writel(data, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_WDATA0_BASE_ADDR + SPMI_PER_DATAREG_BYTE * i);
+		writel((u32)cpu_to_be32(data),
+		       spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_WDATA0_BASE_ADDR + SPMI_PER_DATAREG_BYTE * i);
 		i++;
 	} while (bc > i * SPMI_PER_DATAREG_BYTE);
 
-- 
2.26.2

