Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C402221F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 10:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgGPIy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 04:54:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7863 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725975AbgGPIy0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 04:54:26 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 08EBF5F1AF760803B550;
        Thu, 16 Jul 2020 16:54:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 16:54:18 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/msm/dpu: Convert to DEFINE_SHOW_ATTRIBUTE
Date:   Thu, 16 Jul 2020 16:58:13 +0800
Message-ID: <20200716085813.11332-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 14 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c     | 29 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c  | 15 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c      | 17 ++----------
 4 files changed, 8 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 99be6d8d4..764332e83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -288,18 +288,6 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 }
 
 #ifdef CONFIG_DEBUG_FS
-#define DEFINE_DPU_DEBUGFS_SEQ_FOPS(__prefix)				\
-static int __prefix ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __prefix ## _show, inode->i_private);	\
-}									\
-static const struct file_operations __prefix ## _fops = {		\
-	.owner = THIS_MODULE,						\
-	.open = __prefix ## _open,					\
-	.release = single_release,					\
-	.read_iter = seq_read_iter,						\
-	.llseek = seq_lseek,						\
-}
 
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
@@ -328,7 +316,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	return 0;
 }
 
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_debugfs_core_irq);
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
 
 void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2fa8d0797..b2b0ce546 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1242,23 +1242,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int _dpu_debugfs_status_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, _dpu_debugfs_status_show, inode->i_private);
-}
-
-#define DEFINE_DPU_DEBUGFS_SEQ_FOPS(__prefix)                          \
-static int __prefix ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __prefix ## _show, inode->i_private);	\
-}									\
-static const struct file_operations __prefix ## _fops = {		\
-	.owner = THIS_MODULE,						\
-	.open = __prefix ## _open,					\
-	.release = single_release,					\
-	.read_iter = seq_read_iter,						\
-	.llseek = seq_lseek,						\
-}
+DEFINE_SHOW_ATTRIBUTE(_dpu_debugfs_status);
 
 static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 {
@@ -1275,25 +1259,18 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 
 	return 0;
 }
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_crtc_debugfs_state);
+DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
 
 static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 
-	static const struct file_operations debugfs_status_fops = {
-		.open =		_dpu_debugfs_status_open,
-		.read_iter =		seq_read_iter,
-		.llseek =	seq_lseek,
-		.release =	single_release,
-	};
-
 	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
 			crtc->dev->primary->debugfs_root);
 
 	debugfs_create_file("status", 0400,
 			dpu_crtc->debugfs_root,
-			dpu_crtc, &debugfs_status_fops);
+			dpu_crtc, &_dpu_debugfs_status_fops);
 	debugfs_create_file("state", 0600,
 			dpu_crtc->debugfs_root,
 			&dpu_crtc->base,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7d603784a..6bcd15bf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1845,24 +1845,13 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int _dpu_encoder_debugfs_status_open(struct inode *inode,
-		struct file *file)
-{
-	return single_open(file, _dpu_encoder_status_show, inode->i_private);
-}
+DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 
 static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i;
 
-	static const struct file_operations debugfs_status_fops = {
-		.open =		_dpu_encoder_debugfs_status_open,
-		.read_iter =		seq_read_iter,
-		.llseek =	seq_lseek,
-		.release =	single_release,
-	};
-
 	char name[DPU_NAME_SIZE];
 
 	if (!drm_enc->dev) {
@@ -1878,7 +1867,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &debugfs_status_fops);
+		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++)
 		if (dpu_enc->phys_encs[i]->ops.late_register)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b8122173c..ea63534fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -98,30 +98,17 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	return 0;
 }
 
-#define DEFINE_DPU_DEBUGFS_SEQ_FOPS(__prefix)				\
-static int __prefix ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __prefix ## _show, inode->i_private);	\
-}									\
-static const struct file_operations __prefix ## _fops = {		\
-	.owner = THIS_MODULE,						\
-	.open = __prefix ## _open,					\
-	.release = single_release,					\
-	.read_iter = seq_read_iter,						\
-	.llseek = seq_lseek,						\
-}
-
 static int dpu_debugfs_danger_stats_show(struct seq_file *s, void *v)
 {
 	return _dpu_danger_signal_status(s, true);
 }
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_debugfs_danger_stats);
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_danger_stats);
 
 static int dpu_debugfs_safe_stats_show(struct seq_file *s, void *v)
 {
 	return _dpu_danger_signal_status(s, false);
 }
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_debugfs_safe_stats);
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_safe_stats);
 
 static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
-- 
2.17.1

