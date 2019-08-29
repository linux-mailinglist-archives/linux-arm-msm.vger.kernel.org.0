Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B52A14FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 11:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfH2J3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 05:29:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37182 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfH2J3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 05:29:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id d16so3057117wme.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 02:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XU8VavFbVq1P6J4BGT7bqqCvGA+gvD1YtYfU7w8Ui4Y=;
        b=y2Jad9If07L8NkCkwNdv8YZMdg76iweYq5gnyqU7ZDpAiemuWRrJjbuu5BLDeQUdNp
         ZPFbRWLdHenEAhkH9KAB4roQxHkuuhxayo9pCXmARueqQY7W1aLx41028c5b967Ih7H2
         AbB11KjZHaaeJ4xTfjIhr3tFxpGTl4v6E0DJNc7N11Zf/8b7w1SXYelXiZ3nK7FdyqBm
         uCJjAeeobnr9UxrtXj7GJYMLGbG/Z6f40SIjgckg7xwUL9jFsAA4qGd2YKOskcCD//AG
         R3LIqRDSknSJvQGfk5Z3TL7kUjgA4D7Fw/ZYMH/+pN4KfAZCucq8iLiaSUFlWGf/Z/14
         Q4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XU8VavFbVq1P6J4BGT7bqqCvGA+gvD1YtYfU7w8Ui4Y=;
        b=ZhPl/EA42KnJBuUdI7TrAZE5Zj6OqJp8yJ5zO0xeuqnOCTtOes91KyoyY6vnq2Ap4y
         eMA722KHtEcE/HtOXQk39G1jdvl2xD88HX3/N/6xfsazXSeX0Dh8WS3OC1tyPQIswmBw
         ZuJ3HqfU5SSvUIAp9R84D5SFNq79nKzytSWpMbTyVE/JTmNe1a58gfWX53axA3tt32+o
         LitGDNSiy36Sj3xTvmPYYDKTFlMHq32wMG4MwDWzYDK5ENjaJOfklRlC8NQXKsSpgq8q
         5ONldZMg7lYbEkseRi083HZyBXM4qNo73XGpwXq5Q7Tumro7+eNDtWCdHXErWZwWYgxl
         bvKw==
X-Gm-Message-State: APjAAAUldHc7dZj+3QlzW64+gdzcD0XkpG4W5yZs342O6h3K7oEdbgvb
        1QR/HgG7RLF15L0NMCK7jQ8h2A==
X-Google-Smtp-Source: APXvYqzJDfOY6Qbp5b9Q/YKvcCDzXuA4QObZ1qVqjsB+kWph1VLp+AANlxduNUWoDl0dc6cSgg1IgA==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr10210355wmb.98.1567070975588;
        Thu, 29 Aug 2019 02:29:35 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f197sm3609512wme.22.2019.08.29.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 02:29:35 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/5] misc: fastrpc: Reference count channel context
Date:   Thu, 29 Aug 2019 10:29:22 +0100
Message-Id: <20190829092926.12037-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The channel context is referenced from the fastrpc user and might as
user space holds the file descriptor open outlive the fastrpc device,
which is removed when the remote processor is shutting down.

Reference count the channel context in order to retain this object until
all references has been relinquished.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mayank Chopra <mak.chopra@codeaurora.org>
Signed-off-by: Abhinav Asati <asatiabhi@codeaurora.org>
Signed-off-by: Vamsi Singamsetty <vamssi@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 43 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c790585da14c..c019e867e7fa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -186,6 +186,7 @@ struct fastrpc_channel_ctx {
 	struct idr ctx_idr;
 	struct list_head users;
 	struct miscdevice miscdev;
+	struct kref refcount;
 };
 
 struct fastrpc_user {
@@ -293,6 +294,25 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	return 0;
 }
 
+static void fastrpc_channel_ctx_free(struct kref *ref)
+{
+	struct fastrpc_channel_ctx *cctx;
+
+	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
+
+	kfree(cctx);
+}
+
+static void fastrpc_channel_ctx_get(struct fastrpc_channel_ctx *cctx)
+{
+	kref_get(&cctx->refcount);
+}
+
+static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
+{
+	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
+}
+
 static void fastrpc_context_free(struct kref *ref)
 {
 	struct fastrpc_invoke_ctx *ctx;
@@ -316,6 +336,8 @@ static void fastrpc_context_free(struct kref *ref)
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
 	kfree(ctx);
+
+	fastrpc_channel_ctx_put(cctx);
 }
 
 static void fastrpc_context_get(struct fastrpc_invoke_ctx *ctx)
@@ -422,6 +444,9 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		fastrpc_get_buff_overlaps(ctx);
 	}
 
+	/* Released in fastrpc_context_put() */
+	fastrpc_channel_ctx_get(cctx);
+
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
@@ -451,6 +476,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	spin_lock(&user->lock);
 	list_del(&ctx->node);
 	spin_unlock(&user->lock);
+	fastrpc_channel_ctx_put(cctx);
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
 	kfree(ctx);
@@ -1123,6 +1149,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	}
 
 	fastrpc_session_free(cctx, fl->sctx);
+	fastrpc_channel_ctx_put(cctx);
 
 	mutex_destroy(&fl->mutex);
 	kfree(fl);
@@ -1141,6 +1168,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	if (!fl)
 		return -ENOMEM;
 
+	/* Released in fastrpc_device_release() */
+	fastrpc_channel_ctx_get(cctx);
+
 	filp->private_data = fl;
 	spin_lock_init(&fl->lock);
 	mutex_init(&fl->mutex);
@@ -1398,10 +1428,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	int i, err, domain_id = -1;
 	const char *domain;
 
-	data = devm_kzalloc(rdev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	err = of_property_read_string(rdev->of_node, "label", &domain);
 	if (err) {
 		dev_info(rdev, "FastRPC Domain not specified in DT\n");
@@ -1420,6 +1446,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
 	data->miscdev.minor = MISC_DYNAMIC_MINOR;
 	data->miscdev.name = kasprintf(GFP_KERNEL, "fastrpc-%s",
 				domains[domain_id]);
@@ -1428,6 +1458,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (err)
 		return err;
 
+	kref_init(&data->refcount);
+
 	dev_set_drvdata(&rpdev->dev, data);
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
@@ -1462,7 +1494,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	misc_deregister(&cctx->miscdev);
 	of_platform_depopulate(&rpdev->dev);
-	kfree(cctx);
+
+	fastrpc_channel_ctx_put(cctx);
 }
 
 static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
-- 
2.21.0

