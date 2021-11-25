Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF8C45DC30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 15:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355649AbhKYOVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 09:21:11 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36216 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355652AbhKYOTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 09:19:11 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 06:16:00 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 06:15:59 -0800
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2021 19:45:52 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 11FD044FA; Thu, 25 Nov 2021 19:45:51 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 2/5] misc: fastrpc: Add secure device node support
Date:   Thu, 25 Nov 2021 19:45:41 +0530
Message-Id: <1637849744-24844-3-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
References: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register and deregister secure device node. Check for device name during
device open get proper channel context.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 39aca77..0775554e 100644
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
 
@@ -1218,10 +1220,23 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 
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
@@ -1644,6 +1659,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		kfree(data);
 		return err;
 	}
+	data->securedev.minor = MISC_DYNAMIC_MINOR;
+	data->securedev.name = devm_kasprintf(rdev, GFP_KERNEL,
+				"fastrpc-%s-secure", domains[domain_id]);
+	data->securedev.fops = &fastrpc_fops;
+	err = misc_register(&data->securedev);
+	if (err) {
+		kfree(data);
+		return err;
+	}
 
 	kref_init(&data->refcount);
 
@@ -1655,7 +1679,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 
-	return of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	dev_info(rdev, "%s done for %s with nodes non-secure(%d), secure(%d) return: %d\n",
+		__func__, domains[domain_id],
+		data->miscdev.minor, data->securedev.minor, err);
+	return err;
 }
 
 static void fastrpc_notify_users(struct fastrpc_user *user)
@@ -1680,6 +1708,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	misc_deregister(&cctx->miscdev);
+	misc_deregister(&cctx->securedev);
 	of_platform_depopulate(&rpdev->dev);
 
 	cctx->rpdev = NULL;
-- 
2.7.4

