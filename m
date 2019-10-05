Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D83ACC7DB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfJEE0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51726 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725976AbfJEE0q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:46 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 231B1337245409C4E4D8;
        Sat,  5 Oct 2019 12:26:45 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:38 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <jsanka@codeaurora.org>,
        <jcrouse@codeaurora.org>, <gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/6] drm/msm/dpu: Remove set but not used variable 'priv' in dpu_kms.c
Date:   Sat, 5 Oct 2019 12:33:44 +0800
Message-ID: <1570250029-67639-2-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function _dpu_danger_signal_status:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:80:26: warning: variable priv set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function dpu_kms_prepare_commit:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:271:26: warning: variable priv set but not used [-Wunused-but-set-variable]

It is not used since commit 25fdd5933e4c ("drm/msm:
Add SDM845 DPU support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 58b0485..4711ac5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -68,7 +68,6 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 		bool danger_status)
 {
 	struct dpu_kms *kms = (struct dpu_kms *)s->private;
-	struct msm_drm_private *priv;
 	struct dpu_danger_safe_status status;
 	int i;

@@ -77,7 +76,6 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 		return 0;
 	}

-	priv = kms->dev->dev_private;
 	memset(&status, 0, sizeof(struct dpu_danger_safe_status));

 	pm_runtime_get_sync(&kms->pdev->dev);
@@ -280,7 +278,6 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 		struct drm_atomic_state *state)
 {
 	struct dpu_kms *dpu_kms;
-	struct msm_drm_private *priv;
 	struct drm_device *dev;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -294,7 +291,6 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,

 	if (!dev || !dev->dev_private)
 		return;
-	priv = dev->dev_private;

 	/* Call prepare_commit for all affected encoders */
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
--
2.7.4

