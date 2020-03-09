Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7663017E7A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 19:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgCIS5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 14:57:07 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38735 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgCIS5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 14:57:07 -0400
Received: by mail-pj1-f67.google.com with SMTP id a16so290377pju.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g2u/OLAgiInGN4xLm0+9cr6hTH+ZT1QAXVX+7llX76w=;
        b=HTGfEeseSiG/j8RRQVcEwDBh/c1A0F9xo9jtWZIJetjxQKhi7UIJGvJWIxidZf1gQA
         EfqEPOEfd6nFdkI2/0YCKJar2DBNmKMbJo7oETTCLZDm12GO7A/66QrZORz1hqVDu89o
         Oz6vvrF4PTJVd96BjlozF/GAsU4V4TY4R6U7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g2u/OLAgiInGN4xLm0+9cr6hTH+ZT1QAXVX+7llX76w=;
        b=gjtiEr9FwrT9FFJr2b9jK8O0lQqIkMAmvC7g7aWX0wz5UFaKBLNKMW3B1LDbU3595c
         fpwH4f1GHzAk1dAqHW2s33auN5t1EjBDiRBU0MSfiU+LbFF148rip48F9/oPjSuYfetC
         YM31umPZJFz86I2dEG8Y9h63vQwpeyVl5RmSfSTt+w9c6g9CH99nJvgPBPrc8VisjY60
         2jDLBTbqa7WmbERo4fB1s+iXt85t72FPi1D2Wxj3KdVPjZ5033i7GNwRiWrMBpLx/RG6
         jR6vvqadXtU96eoj0iM+84iALd9hMpNE47h/byzZ0S1LXncKrOidHDNMxXrL55WuPYML
         Hv1g==
X-Gm-Message-State: ANhLgQ2HVQDoIs00cZvkqCuPnN5US+gKbjvwFAqV7HHarqCXPDyHwGUu
        p/fmqTfP3dQ4bYke7uLO7Ze6sw==
X-Google-Smtp-Source: ADFU+vtbNCkmpmFcbgvojdaMhluhfjve5urSrj7UFBlkS7+pLKle++6ipFzEC3JezKdUs1qmXGN61g==
X-Received: by 2002:a17:90a:a616:: with SMTP id c22mr761854pjq.47.1583780225613;
        Mon, 09 Mar 2020 11:57:05 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k8sm9007674pfk.1.2020.03.09.11.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 11:57:05 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH] soc: qcom: cmd-db: Add debugfs dumping file
Date:   Mon,  9 Mar 2020 11:57:04 -0700
Message-Id: <20200309185704.2491-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's useful for kernel devs to understand what resources and data is
stored inside command db. Add a file in debugufs called 'cmd-db' to dump
the memory contents and strings for resources along with their
addresses. E.g.

 Command DB DUMP
 Slave ARC (v16.0)
 -------------------------
 0x00030000: cx.lvl [00 00 10 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
 0x00030004: cx.tmr
 0x00030010: mx.lvl [00 00 10 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
 0x00030014: mx.tmr

Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 79 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index f6c3d17b05c7..6c308f92a13c 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -1,12 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (c) 2016-2018, The Linux Foundation. All rights reserved. */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/types.h>
 
 #include <soc/qcom/cmd-db.h>
@@ -236,6 +237,78 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *id)
 }
 EXPORT_SYMBOL(cmd_db_read_slave_id);
 
+#ifdef CONFIG_DEBUG_FS
+static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
+{
+	int i, j;
+	const struct rsc_hdr *rsc;
+	const struct entry_header *ent;
+	const char *name;
+	u16 len, version;
+	u8 major, minor;
+
+	seq_puts(seq, "Command DB DUMP\n");
+
+	for (i = 0; i < MAX_SLV_ID; i++) {
+
+		rsc = &cmd_db_header->header[i];
+		if (!rsc->slv_id)
+			break;
+
+		switch (rsc->slv_id) {
+		case CMD_DB_HW_ARC:
+			name = "ARC";
+			break;
+		case CMD_DB_HW_VRM:
+			name = "VRM";
+			break;
+		case CMD_DB_HW_BCM:
+			name = "BCM";
+			break;
+		default:
+			name = "Unknown";
+			break;
+		}
+
+		version = le16_to_cpu(rsc->version);
+		major = version >> 8;
+		minor = version;
+
+		seq_printf(seq, "Slave %s (v%u.%u)\n", name, major, minor);
+		seq_puts(seq, "-------------------------\n");
+
+		ent = rsc_to_entry_header(rsc);
+		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
+			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
+				   sizeof(ent->id), ent->id);
+
+			len = le16_to_cpu(ent->len);
+			if (len) {
+				seq_printf(seq, " [%*ph]",
+					   len, rsc_offset(rsc, ent));
+			}
+			seq_putc(seq, '\n');
+		}
+	}
+
+	return 0;
+}
+
+static int open_cmd_db_debugfs(struct inode *inode, struct file *file)
+{
+	return single_open(file, cmd_db_debugfs_dump, inode->i_private);
+}
+#endif
+
+static const struct file_operations cmd_db_debugfs_ops = {
+#ifdef CONFIG_DEBUG_FS
+	.open = open_cmd_db_debugfs,
+#endif
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
 	struct reserved_mem *rmem;
@@ -259,12 +332,14 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
+
 	return 0;
 }
 
 static const struct of_device_id cmd_db_match_table[] = {
 	{ .compatible = "qcom,cmd-db" },
-	{ },
+	{ }
 };
 
 static struct platform_driver cmd_db_dev_driver = {

base-commit: 2c523b344dfa65a3738e7039832044aa133c75fb
-- 
Sent by a computer, using git, on the internet

