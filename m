Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7814171A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 14:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245498AbhIXMVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 08:21:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15766 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245499AbhIXMVD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 08:21:03 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2021 05:19:30 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2021 05:19:29 -0700
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2021 17:49:15 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 6F3534318; Fri, 24 Sep 2021 17:49:14 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 4/4] misc: fastrpc: reject non-secure node for secure domain
Date:   Fri, 24 Sep 2021 17:49:11 +0530
Message-Id: <1632485951-13473-5-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reject session if domain is secure and device non-secure. Also check if
opened device node is proper.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 drivers/misc/fastrpc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 631713d..adf2700 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -235,6 +235,7 @@ struct fastrpc_user {
 	spinlock_t lock;
 	/* lock for allocations */
 	struct mutex mutex;
+	int dev_minor;
 };
 
 static void fastrpc_free_map(struct kref *ref)
@@ -1013,6 +1014,17 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	return err;
 }
 
+static int is_session_rejected(struct fastrpc_user *fl)
+{
+	/* Check if the device node is non-secure and channel is secure*/
+	if ((fl->dev_minor == fl->cctx->miscdev.minor) && fl->cctx->secure) {
+		dev_err(&fl->cctx->rpdev->dev, "Cannot use non-secure device"
+				"node on secure channel\n");
+		return -EACCES;
+	}
+	return 0;
+}
+
 static int fastrpc_init_create_process(struct fastrpc_user *fl,
 					char __user *argp)
 {
@@ -1033,6 +1045,10 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	} inbuf;
 	u32 sc;
 
+	err = is_session_rejected(fl);
+	if (err)
+		return err;
+
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
@@ -1221,6 +1237,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	struct fastrpc_user *fl = NULL;
 	struct miscdevice *currdev = NULL;
 	unsigned long flags;
+	int dev_minor = MINOR(inode->i_rdev);
 
 	if (!filp)
 		return -EFAULT;
@@ -1234,6 +1251,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	else
 		cctx = miscdev_to_cctx(filp->private_data);
 
+	if (!((dev_minor == cctx->miscdev.minor) ||
+	     (dev_minor == cctx->securedev.minor))) {
+		dev_err(&cctx->rpdev->dev, "Device node is not proper\n");
+		return -EFAULT;
+	}
+
 	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
@@ -1250,6 +1273,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->user);
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
+	fl->dev_minor = dev_minor;
 
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
-- 
2.7.4

