Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4ABF46E80B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 13:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhLIMKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 07:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhLIMKc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 07:10:32 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA20CC0617A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 04:06:58 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso6368029wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4VoA18tzuAsfWdDrMjvmEHwl0wRIlV3B8hQ72hMLHXI=;
        b=vXP3k0ZJrlHGH6L6gHlWTskTQ1EgiFk5yHdHZ43YW0jXKSzDPWA+vaAFJPKryQstNV
         C09jnzHmw7VzUMcJr2s3xTXmVneCvInOlnvJl+vS++9oUf/2hHi+dn4r9846kTTAt58m
         rzlh5mNPgtICcv87nYigl8eZOuC/zyEzoLdOlvovRp4Tvvo9UCmWlfYnmuhlBo1QdemD
         94h6Ef2WmICg/tn4jJPn//BBak8IkR0TwS7Mr8bBJ+fsOfOldkD1Tg6xlxHs5YT37Tly
         W2nA44mFGhpoLl1ygApSfrgGoXsj/wrXGaCAxUrRWZ0LRU4UCnKIC8sPZYekz9/6PBwj
         xS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4VoA18tzuAsfWdDrMjvmEHwl0wRIlV3B8hQ72hMLHXI=;
        b=t0pDrGjyuMa8cmlT82Cc3+TY0/FdcWj8lIqUiV9Tr8Q+7jhmyYEToy+PBDXzHMyqvY
         gXzzjXsN/MwfE+OW1LmlOgSU7ETxblLMryHnQWuIUhR5VPEfcTE25KKX+mTBrLoQlBvm
         PWgGrAuTPxPgB1gVOYQMzUBKZy+O1w2b8BhWKxTufBOvpcpFGdN6MZtq9RnD5e7IkAew
         IHRFOJvMIukt3XWkHOzfIVg3/SSaeiqjGCYkDo88UAq4Zv33vQ/WxHhV1qrR1gJTxKTh
         pfjYvAFXvzZVlVAQnEfgYHM2irypmkwgW3Dt2OjZxNxbAqbE4dF43wMn/YxY5cgWm1mU
         5Hog==
X-Gm-Message-State: AOAM532LOPg92y5feAoYmsPxvgYcP7ZxlH7VlR0WsF6qr5nnWWTzecFY
        WnmaSo20ylLJaoEaY57Q0kVtDA==
X-Google-Smtp-Source: ABdhPJyrrRpQ6xWIZVvWSoWsuqnURqrVzo80EFWE/+sExb+yf9mL8XjylmX2ZFu1dgNaEN7mnsv2PA==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr6546973wmj.166.1639051617392;
        Thu, 09 Dec 2021 04:06:57 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 4sm7513289wrz.90.2021.12.09.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 04:06:56 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/8] misc: fastrpc: separate fastrpc device from channel context
Date:   Thu,  9 Dec 2021 12:06:19 +0000
Message-Id: <20211209120626.26373-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently fastrpc misc device instance is within channel context struct
with a kref. So we have 2 structs with refcount, both of them managing the
same channel context structure.

Separate fastrpc device from channel context and by adding a dedicated
fastrpc_device structure, this should clean the structures a bit and also help
when adding secure device node support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 39aca7753719..71d818fed8b8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -78,7 +78,7 @@
 #define USER_PD		(1)
 #define SENSORS_PD	(2)
 
-#define miscdev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, miscdev)
+#define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp"};
@@ -212,8 +212,13 @@ struct fastrpc_channel_ctx {
 	spinlock_t lock;
 	struct idr ctx_idr;
 	struct list_head users;
-	struct miscdevice miscdev;
 	struct kref refcount;
+	struct fastrpc_device *fdevice;
+};
+
+struct fastrpc_device {
+	struct fastrpc_channel_ctx *cctx;
+	struct miscdevice miscdev;
 };
 
 struct fastrpc_user {
@@ -1218,10 +1223,14 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 
 static int fastrpc_device_open(struct inode *inode, struct file *filp)
 {
-	struct fastrpc_channel_ctx *cctx = miscdev_to_cctx(filp->private_data);
+	struct fastrpc_channel_ctx *cctx = NULL;
+	struct fastrpc_device *fdevice = NULL;
 	struct fastrpc_user *fl = NULL;
 	unsigned long flags;
 
+	fdevice = miscdev_to_fdevice(filp->private_data);
+	cctx = fdevice->cctx;
+
 	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
@@ -1606,6 +1615,29 @@ static struct platform_driver fastrpc_cb_driver = {
 	},
 };
 
+static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
+				   const char *domain)
+{
+	struct fastrpc_device *fdev;
+	int err;
+
+	fdev = devm_kzalloc(dev, sizeof(*fdev), GFP_KERNEL);
+	if (!fdev)
+		return -ENOMEM;
+
+	fdev->cctx = cctx;
+	fdev->miscdev.minor = MISC_DYNAMIC_MINOR;
+	fdev->miscdev.fops = &fastrpc_fops;
+	fdev->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "fastrpc-%s", domain);
+	err = misc_register(&fdev->miscdev);
+	if (err)
+		kfree(fdev);
+	else
+		cctx->fdevice = fdev;
+
+	return err;
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -1635,11 +1667,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->miscdev.minor = MISC_DYNAMIC_MINOR;
-	data->miscdev.name = devm_kasprintf(rdev, GFP_KERNEL, "fastrpc-%s",
-					    domains[domain_id]);
-	data->miscdev.fops = &fastrpc_fops;
-	err = misc_register(&data->miscdev);
+	err = fastrpc_device_register(rdev, data, domains[domain_id]);
 	if (err) {
 		kfree(data);
 		return err;
@@ -1679,7 +1707,9 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	misc_deregister(&cctx->miscdev);
+	if (cctx->fdevice)
+		misc_deregister(&cctx->fdevice->miscdev);
+
 	of_platform_depopulate(&rpdev->dev);
 
 	cctx->rpdev = NULL;
-- 
2.21.0

