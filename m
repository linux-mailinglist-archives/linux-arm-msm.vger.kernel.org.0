Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C711A8E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 23:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440901AbgDNVun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 17:50:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:33097 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2440836AbgDNVuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 17:50:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586901033; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=8Gyw9naBcMzogGhcRdaELY49d7UUtPgb3sIbiANgrzk=; b=SSw7nj1CHx6HIK8lXaaBCOgCe3MMOOFApeMfxEXzUsZda60zQnERSwRbnhHXn9ixaI63YjGH
 BqGOKE2eS68S8diJ4BBlB6ObLe1tKceSCcGD/Xt7PDkvEOLhRL0w33P1nc2BaKAL4zrlgVZD
 Y/NprdrWt7YjcVsOmh9mF5nAYSs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e963019.7f4c0a749f10-smtp-out-n04;
 Tue, 14 Apr 2020 21:50:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E152C432C2; Tue, 14 Apr 2020 21:50:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F5AEC433CB;
        Tue, 14 Apr 2020 21:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F5AEC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 14 Apr 2020 15:50:15 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: Add debugfs dumping file
Message-ID: <20200414215015.GA3820@codeaurora.org>
References: <20200309185704.2491-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200309185704.2491-1-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 09 2020 at 12:57 -0600, Stephen Boyd wrote:
>It's useful for kernel devs to understand what resources and data is
>stored inside command db. Add a file in debugufs called 'cmd-db' to dump
>the memory contents and strings for resources along with their
>addresses. E.g.
>
> Command DB DUMP
> Slave ARC (v16.0)
> -------------------------
> 0x00030000: cx.lvl [00 00 10 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x00030004: cx.tmr
> 0x00030010: mx.lvl [00 00 10 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x00030014: mx.tmr
>
>Cc: Lina Iyer <ilina@codeaurora.org>
>Cc: Maulik Shah <mkshah@codeaurora.org>
>Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>---
> drivers/soc/qcom/cmd-db.c | 79 ++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 77 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
>index f6c3d17b05c7..6c308f92a13c 100644
>--- a/drivers/soc/qcom/cmd-db.c
>+++ b/drivers/soc/qcom/cmd-db.c
>@@ -1,12 +1,13 @@
> /* SPDX-License-Identifier: GPL-2.0 */
> /* Copyright (c) 2016-2018, The Linux Foundation. All rights reserved. */
>
>+#include <linux/debugfs.h>
> #include <linux/kernel.h>
> #include <linux/of.h>
> #include <linux/of_address.h>
>-#include <linux/of_platform.h>
> #include <linux/of_reserved_mem.h>
> #include <linux/platform_device.h>
>+#include <linux/seq_file.h>
> #include <linux/types.h>
>
> #include <soc/qcom/cmd-db.h>
>@@ -236,6 +237,78 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *id)
> }
> EXPORT_SYMBOL(cmd_db_read_slave_id);
>
>+#ifdef CONFIG_DEBUG_FS
>+static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
>+{
>+	int i, j;
>+	const struct rsc_hdr *rsc;
>+	const struct entry_header *ent;
>+	const char *name;
>+	u16 len, version;
>+	u8 major, minor;
>+
>+	seq_puts(seq, "Command DB DUMP\n");
>+
>+	for (i = 0; i < MAX_SLV_ID; i++) {
>+
>+		rsc = &cmd_db_header->header[i];
>+		if (!rsc->slv_id)
>+			break;
>+
>+		switch (rsc->slv_id) {
>+		case CMD_DB_HW_ARC:
>+			name = "ARC";
>+			break;
>+		case CMD_DB_HW_VRM:
>+			name = "VRM";
>+			break;
>+		case CMD_DB_HW_BCM:
>+			name = "BCM";
>+			break;
>+		default:
>+			name = "Unknown";
>+			break;
>+		}
>+
>+		version = le16_to_cpu(rsc->version);
>+		major = version >> 8;
>+		minor = version;
>+
>+		seq_printf(seq, "Slave %s (v%u.%u)\n", name, major, minor);
>+		seq_puts(seq, "-------------------------\n");
>+
>+		ent = rsc_to_entry_header(rsc);
>+		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
>+			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
0x%05x is what we would have for a resource address.
>+				   sizeof(ent->id), ent->id);
>+
>+			len = le16_to_cpu(ent->len);
>+			if (len) {
>+				seq_printf(seq, " [%*ph]",
>+					   len, rsc_offset(rsc, ent));
>+			}
>+			seq_putc(seq, '\n');
>+		}
>+	}
>+
>+	return 0;
>+}
>+
>+static int open_cmd_db_debugfs(struct inode *inode, struct file *file)
>+{
>+	return single_open(file, cmd_db_debugfs_dump, inode->i_private);
>+}
>+#endif
>+
>+static const struct file_operations cmd_db_debugfs_ops = {
>+#ifdef CONFIG_DEBUG_FS
>+	.open = open_cmd_db_debugfs,
>+#endif
>+	.read = seq_read,
>+	.llseek = seq_lseek,
>+	.release = single_release,
>+};
>+
> static int cmd_db_dev_probe(struct platform_device *pdev)
> {
> 	struct reserved_mem *rmem;
>@@ -259,12 +332,14 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
> 		return -EINVAL;
> 	}
>
>+	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
>+
> 	return 0;
> }
>
> static const struct of_device_id cmd_db_match_table[] = {
> 	{ .compatible = "qcom,cmd-db" },
>-	{ },
>+	{ }
> };
>
> static struct platform_driver cmd_db_dev_driver = {
>
>base-commit: 2c523b344dfa65a3738e7039832044aa133c75fb
>--
>Sent by a computer, using git, on the internet
>
