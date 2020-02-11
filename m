Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 247BD158709
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 01:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbgBKAwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 19:52:39 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34162 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbgBKAwS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:18 -0500
Received: by mail-pf1-f196.google.com with SMTP id i6so4579484pfc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rX0PBzoSiXMileVxtobQ0Y36WCYvZwaGtCft9G1Vwrs=;
        b=I5gXZGhIMfZbDhsF8nl8dGoCFMj9JkKDACq1y5Q7Zk/PYvXrGPnbQJ32y9WYMU1yY9
         p8RnNvMt4npKsAT6wRHlSt1dZBpnFsy+7EDuyXx6VFv69fEY3FoUBWxCpFq8UTAkAuEm
         uk1FoynnVK9V0fyLaiQzruIQN/b9z1QU+WPNiTbhCREc1dbzekA/mpv39DEkgw3tqXRv
         FO3eSZDh/yBG0/A78FA4xhBJaeqpJIlCYP8MWms5gpvto46GgJihe5/JGKf35cCpToyN
         KLxLpAU1RJ2vEddOd0niS4qWMMf1Y9V/4eQJGHQzls4aetpg5Qatf3VzPa4tTwKCMRM/
         iVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rX0PBzoSiXMileVxtobQ0Y36WCYvZwaGtCft9G1Vwrs=;
        b=c1y60kEtfjQ60oSGVvduEjIYuXnQoru3IjbQq6dPRmyADhKwYq5qZ3aHkHPRhh/c/L
         TWFGnBEAP4ElGTb6oszyyoKbKVD2ybcnavUR4Zb5CbUbiKAqUFGvj0m1GgoYaLgRUg+A
         LKOoDGJiuO2PVzxDIoWX5zILTo/GawffnR7H8n1XTxuJrSduVPU7q+2aSrDLjiz0Xgcp
         mWYkzJt6cYRcrwo8ZwNZqJFZiKwxAdihF0+XQpuN8yGQJgJOlc0cLyFe7xqf0A6pAqeK
         0Dab4ewQFws8Dp9kDzkVQb1Hy4SgwT2y1JZ3MY5j/LipAntSNEXfYoQ/cuReOd4g8N64
         sKzA==
X-Gm-Message-State: APjAAAUFHpRbf21SJ7KsefZsayGqY9od/Q5HCOYaabPnmbpgRuQn+eJu
        FwQL32eqsKKPDR/86yuBD1McSQ==
X-Google-Smtp-Source: APXvYqw8GRFeXo/k+HHUZZ4/EDdvNNPIehWjHGcgeUJJNTuZuFBNV1WNgjtwlbYQl77+7Jhmn3L58A==
X-Received: by 2002:a63:e011:: with SMTP id e17mr4423860pgh.49.1581382337169;
        Mon, 10 Feb 2020 16:52:17 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:16 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 6/8] remoteproc: Introduce "panic" callback in ops
Date:   Mon, 10 Feb 2020 16:50:57 -0800
Message-Id: <20200211005059.1377279-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a "panic" function in the remoteproc ops table, to allow
remoteproc instances to perform operations needed in order to aid in
post mortem system debugging, such as flushing caches etc, when the
kernel panics. The function can return a number of milliseconds needed
by the remote to "settle" and the core will wait the longest returned
duration before returning from the panic handler.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replace per-rproc notifier callback with one generic
- Move the mdelay() from the individual drivers to the core and sleep the
  longest returned duration. Drivers that doesn't need a delay can return 0.
- Unregister the notifier on exit

 drivers/remoteproc/remoteproc_core.c | 46 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  3 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..8b6932027d36 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -43,6 +44,7 @@
 
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
+static struct notifier_block rproc_panic_nb;
 
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
 				 void *, int offset, int avail);
@@ -2216,10 +2218,53 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 }
 EXPORT_SYMBOL(rproc_report_crash);
 
+static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
+			       void *ptr)
+{
+	unsigned int longest = 0;
+	struct rproc *rproc;
+	unsigned int d;
+	int locked;
+
+	locked = mutex_trylock(&rproc_list_mutex);
+	if (!locked) {
+		pr_err("Failed to acquire rproc list lock, won't call panic functions\n");
+		return NOTIFY_DONE;
+	}
+
+	list_for_each_entry(rproc, &rproc_list, node) {
+		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+			continue;
+
+		d = rproc->ops->panic(rproc);
+		if (d > longest)
+			longest = d;
+	}
+
+	mutex_unlock(&rproc_list_mutex);
+
+	/* Delay panic for the longest requested duration */
+	mdelay(longest);
+
+	return NOTIFY_DONE;
+}
+
+static void __init rproc_init_panic(void)
+{
+	rproc_panic_nb.notifier_call = rproc_panic_handler;
+	atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
+}
+
+static void __exit rproc_exit_panic(void)
+{
+	atomic_notifier_chain_unregister(&panic_notifier_list, &rproc_panic_nb);
+}
+
 static int __init remoteproc_init(void)
 {
 	rproc_init_sysfs();
 	rproc_init_debugfs();
+	rproc_init_panic();
 
 	return 0;
 }
@@ -2229,6 +2274,7 @@ static void __exit remoteproc_exit(void)
 {
 	ida_destroy(&rproc_dev_index);
 
+	rproc_exit_panic();
 	rproc_exit_debugfs();
 	rproc_exit_sysfs();
 }
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..14f05f26cbcd 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -369,6 +369,8 @@ enum rsc_handling_status {
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
+ * @panic:	optional callback to react to system panic, core will delay
+ *		panic at least the returned number of milliseconds
  */
 struct rproc_ops {
 	int (*start)(struct rproc *rproc);
@@ -383,6 +385,7 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	unsigned int (*panic)(struct rproc *rproc);
 };
 
 /**
-- 
2.24.0

