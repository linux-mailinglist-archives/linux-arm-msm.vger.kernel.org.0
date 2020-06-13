Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05311F85BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2020 00:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgFMWjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 18:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgFMWjn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 18:39:43 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A170C08C5C5
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2020 15:39:42 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so13585284ejm.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2020 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=OhMh8QdAKsM/LD7FzRgfTPN/VXAc/bfcsd/Jg+yegVvqkiw0ZQQ1ZFUpO1z6Zg3f3c
         3umiBiw5vRmNhJvxwIv2BRS0N6QIiCUm2YkZMvE4edfNg/wTRNBGQ93PnmylKJTlouGd
         2G4q2igvurJXoQLCJNFkq1onnfm80LAH68015hanO/XNpStK/wI7ro/50FJCncYabfzE
         br3OOrcsNlw+g075/h01a9KB12j2L7sQameavQ1HCT4M6rF4/XhSlB9LgjBo0SESuPiw
         /PvzHHSDjvc2E3cMDocR2Nsl9PGw+veeI72B2UYxioKOz0PfNaJ9DK1OwLr38YvMV92A
         CiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=gJReqLd5wSyMcOKgSJLGIQOCUXhYyqfLe9HjCB5bOsAB5QxmpOriq8uCOpgS5amK0i
         VTctRA1/P7M0y/D7/9vVRPGTy/O1iUYtU4i8iROxTWXZPUFDq5nS/+I0YABjN2lN8kFP
         fZlRH4YXSeQuTg+JFNHMfT8RfC/4mOXhx4B5GoleUc5Y5OwosPyU7U6qJJa5bXA49YIC
         zoz7L+NBWBiyfnjS2k+g+q+7QknPRdy+qyMjCX/URh16LV+KKfVAZ6zdGMiYdX6AAaib
         pSd1secq0EXX3sb6ksbAj4+4T2S/U/fQ1yyy3ONi38oFIGyHZXL5g8oEpKF2AdJlVoYE
         2snQ==
X-Gm-Message-State: AOAM5334E1ASqjvmecmKTSCw6wEwv5wiO0Y0dhrb700YaUlMjycKpg8U
        JCzybJ8GPC1vqFICxeuZS+z29Q==
X-Google-Smtp-Source: ABdhPJzxj8C/3hik/vFIz1gDDlvyUI4ojVSG5W2uxMyvgh/o8BwnQmqSRtEzHERwF/L+vXseZu70oQ==
X-Received: by 2002:a17:906:6d3:: with SMTP id v19mr6626238ejb.306.1592087980907;
        Sat, 13 Jun 2020 15:39:40 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id u3sm5581606edx.25.2020.06.13.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:39:40 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 3/3] venus: Add a debugfs file for SSR trigger
Date:   Sun, 14 Jun 2020 01:39:19 +0300
Message-Id: <20200613223919.7038-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
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

