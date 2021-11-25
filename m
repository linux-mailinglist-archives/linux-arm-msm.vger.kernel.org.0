Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E7C45DC2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 15:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355689AbhKYOVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 09:21:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36504 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355656AbhKYOTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 09:19:12 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 06:16:01 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 06:16:00 -0800
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2021 19:45:52 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 34BC844FD; Thu, 25 Nov 2021 19:45:51 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 4/5] misc: fastrpc: reject non-secure node for secure domain
Date:   Thu, 25 Nov 2021 19:45:43 +0530
Message-Id: <1637849744-24844-5-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
References: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reject session if domain is secure and device node is non-secure.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 drivers/misc/fastrpc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a4e2e86..e377421 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -235,6 +235,7 @@ struct fastrpc_user {
 	spinlock_t lock;
 	/* lock for allocations */
 	struct mutex mutex;
+	int dev_minor;
 };
 
 static void fastrpc_free_map(struct kref *ref)
@@ -1017,6 +1018,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	return err;
 }
 
+static int is_session_rejected(struct fastrpc_user *fl) {
+	/* Check if the device node is non-secure and channel is secure*/
+	if ((fl->dev_minor == fl->cctx->miscdev.minor) && fl->cctx->secure) {
+		dev_err(&fl->cctx->rpdev->dev, "Cannot access secure channel\n");
+		return -EACCES;
+	}
+	return 0;
+}
+
 static int fastrpc_init_create_process(struct fastrpc_user *fl,
 					char __user *argp)
 {
@@ -1037,6 +1047,10 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	} inbuf;
 	u32 sc;
 
+	err = is_session_rejected(fl);
+	if (err)
+		return err;
+
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
@@ -1225,6 +1239,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	struct fastrpc_user *fl = NULL;
 	struct miscdevice *currdev = NULL;
 	unsigned long flags;
+	int dev_minor = MINOR(inode->i_rdev);
 
 	if (!filp)
 		return -EFAULT;
@@ -1254,6 +1269,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->user);
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
+	fl->dev_minor = dev_minor;
 
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
-- 
2.7.4

