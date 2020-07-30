Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350EE232FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 11:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgG3Jyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 05:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgG3Jyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 05:54:35 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D46C061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 02:54:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d190so5140732wmd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=LfvJup6ovWiwAucvKZVQFk1CwI7buQN2T1r+dQ6oB6Y9OXRHdh2ia0LkWSZQm/HJGy
         28edLScXxl/nFAygtX+andMgAEDNdZzl294AwcOdk34IoozNgT+1XTlfbcQHE0bTO1g5
         6cmQV+vZo2eVuUx7lvUZ4zb9qHJvS/iMBf0ymbLFujgr46o9drobClO/VtKP6dnUFQ4w
         NnFIiKiXFJos9qfmi3OBbIROMi63tzS99nhh8SbMx7+I0J14pFLognQoy/3wpSlVjvAF
         mxHn5t0oEEAd9LDh6237j12wSQeZ0yvmlaJZ31q8hftrRcvypvmNNDv+Tq/SlsG0YXG2
         L2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=ZiGGYu7wKJYpcS5gyA+t/2M6YcPTpULEfgT0YmCTNWZPis6GvHR6YADmLfofMINoei
         I8uI2qptfFsLtJ5L460v06LO71PlnzORvXUyi48/LtmTF0WK5eEnmiYh8W+jz4PjAayj
         cmfRhgS5XxUK2fFJIeKu92/MqkmI0v5tlBf6bpKkAPbdFaGkAs6QUnoJlOkYNFXbfLAV
         VVT0rgbO7LMoUEtvm03g7nhQG6IpY6pR/0AurFWnylOQcoexkvZVVqAQY83OxRDYiYg1
         NDijDfYb1hmFMrj5WiS26bmIcU+hVYJ2qHQZGvMB60kIzKKGH/rEdzyl6uUTRdc5ArAY
         MOVw==
X-Gm-Message-State: AOAM5334ccbBF0E9Ik3fyA/rv8Kia/sCT3rGnO4ZfhlEYFAqz6WRU7Z1
        y+v/MjL43Pms5teXm9tyUA7/PQ==
X-Google-Smtp-Source: ABdhPJxl+zAauMo/NwX8D0vz10uVpUP3IZ/MMYh5A3LnBT6RWGbY47iRI70Rr003qXL238CNARVaXw==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr13612609wmi.180.1596102872621;
        Thu, 30 Jul 2020 02:54:32 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id u1sm10623139wrb.78.2020.07.30.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 02:54:32 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
Date:   Thu, 30 Jul 2020 12:53:49 +0300
Message-Id: <20200730095350.13925-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SSR (SubSystem Restart) is used to simulate an error on FW
side of Venus. We support following type of triggers - fatal error,
div by zero and watchdog IRQ.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/dbgfs.c | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
index 782d54ac1b8f..f95b7b1febe5 100644
--- a/drivers/media/platform/qcom/venus/dbgfs.c
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -9,10 +9,40 @@
 
 extern int venus_fw_debug;
 
+static int trigger_ssr_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+	return 0;
+}
+
+static ssize_t trigger_ssr_write(struct file *filp, const char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct venus_core *core = filp->private_data;
+	u32 ssr_type;
+	int ret;
+
+	ret = kstrtou32_from_user(buf, count, 4, &ssr_type);
+	if (ret)
+		return ret;
+
+	ret = hfi_core_trigger_ssr(core, ssr_type);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations ssr_fops = {
+	.open = trigger_ssr_open,
+	.write = trigger_ssr_write,
+};
+
 void venus_dbgfs_init(struct venus_core *core)
 {
 	core->root = debugfs_create_dir("venus", NULL);
 	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
+	debugfs_create_file("trigger_ssr", 0200, core->root, core, &ssr_fops);
 }
 
 void venus_dbgfs_deinit(struct venus_core *core)
-- 
2.17.1

