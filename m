Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E52FCC7DF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfJEE0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:51 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41374 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726327AbfJEE0v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:51 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1624C2645E4749C055E1;
        Sat,  5 Oct 2019 12:26:50 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:39 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <jsanka@codeaurora.org>,
        <jcrouse@codeaurora.org>, <gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 6/6] drm/msm/dpu: Remove set but not used variables 'mode','dpu_kms','priv'
Date:   Sat, 5 Oct 2019 12:33:49 +0800
Message-ID: <1570250029-67639-7-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
References: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function dpu_encoder_virt_disable:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1199:27: warning: variable mode set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function _dpu_encoder_init_debugfs:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1963:18: warning: variable dpu_kms set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function dpu_encoder_frame_done_timeout:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2183:26: warning: variable priv set but not used [-Wunused-but-set-variable]

They are not used since commit 25fdd5933e4c ("drm/msm:
Add SDM845 DPU support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d82ea99..e6fe208 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1184,7 +1184,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct drm_display_mode *mode;
 	int i = 0;

 	if (!drm_enc) {
@@ -1204,8 +1203,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_lock(&dpu_enc->enc_lock);
 	dpu_enc->enabled = false;

-	mode = &drm_enc->crtc->state->adjusted_mode;
-
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);

@@ -1915,7 +1912,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
 	int i;

 	static const struct file_operations debugfs_status_fops = {
@@ -1933,7 +1929,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 	}

 	priv = drm_enc->dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);

 	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);

@@ -2133,14 +2128,12 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 	struct dpu_encoder_virt *dpu_enc = from_timer(dpu_enc, t,
 			frame_done_timer);
 	struct drm_encoder *drm_enc = &dpu_enc->base;
-	struct msm_drm_private *priv;
 	u32 event;

 	if (!drm_enc->dev || !drm_enc->dev->dev_private) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
-	priv = drm_enc->dev->dev_private;

 	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
 		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
--
2.7.4

