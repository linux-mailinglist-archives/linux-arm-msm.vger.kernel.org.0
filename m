Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8A04171A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245746AbhIXMVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 08:21:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54009 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245559AbhIXMVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 08:21:04 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2021 05:19:30 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2021 05:19:29 -0700
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2021 17:49:15 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 4AD4E4312; Fri, 24 Sep 2021 17:49:14 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 2/4] misc: fastrpc: Add secure device node support
Date:   Fri, 24 Sep 2021 17:49:09 +0530
Message-Id: <1632485951-13473-3-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register and deregister secure device node. Check for device name
during device open get proper channel context.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index beda610..07c41a5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -79,6 +79,7 @@
 #define SENSORS_PD	(2)
 
 #define miscdev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, miscdev)
+#define securedev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, securedev)
 
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp"};
@@ -213,6 +214,7 @@ struct fastrpc_channel_ctx {
 	struct idr ctx_idr;
 	struct list_head users;
 	struct miscdevice miscdev;
+	struct miscdevice securedev;
 	struct kref refcount;
 };
 
@@ -1214,10 +1216,23 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 
 static int fastrpc_device_open(struct inode *inode, struct file *filp)
 {
-	struct fastrpc_channel_ctx *cctx = miscdev_to_cctx(filp->private_data);
+	struct fastrpc_channel_ctx *cctx = NULL;
 	struct fastrpc_user *fl = NULL;
+	struct miscdevice *currdev = NULL;
 	unsigned long flags;
 
+	if (!filp)
+		return -EFAULT;
+
+	currdev = (struct miscdevice *)(filp->private_data);
+	if (!currdev)
+		return -EFAULT;
+
+	if (strstr(currdev->name, "secure") != NULL)
+		cctx = securedev_to_cctx(filp->private_data);
+	else
+		cctx = miscdev_to_cctx(filp->private_data);
+
 	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
@@ -1640,6 +1655,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		kfree(data);
 		return err;
 	}
+	data->securedev.minor = MISC_DYNAMIC_MINOR;
+	data->securedev.name = devm_kasprintf(rdev, GFP_KERNEL,
+				  "fastrpc-%s-secure", domains[domain_id]);
+	data->securedev.fops = &fastrpc_fops;
+	err = misc_register(&data->securedev);
+	if (err) {
+		kfree(data);
+		return err;
+	}
 
 	kref_init(&data->refcount);
 
@@ -1651,7 +1675,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 
-	return of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	dev_info(rdev, "%s done for %s with nodes non-secure(%d), secure(%d)"
+		 "return: %d\n", __func__, domains[domain_id],
+		 data->miscdev.minor, data->securedev.minor, err);
+	return err;
 }
 
 static void fastrpc_notify_users(struct fastrpc_user *user)
@@ -1676,6 +1704,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	misc_deregister(&cctx->miscdev);
+	misc_deregister(&cctx->securedev);
 	of_platform_depopulate(&rpdev->dev);
 
 	cctx->rpdev = NULL;
-- 
2.7.4

