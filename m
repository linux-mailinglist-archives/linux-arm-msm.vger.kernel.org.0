Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A2ECC7DA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfJEE0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:47 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41162 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbfJEE0q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:46 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id ED81FCDD2C8DCA5D4BFC;
        Sat,  5 Oct 2019 12:26:44 +0800 (CST)
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
Subject: [PATCH 3/6] drm/msm/dpu: Remove set but not used variable 'priv' in dpu_core_irq.c
Date:   Sat, 5 Oct 2019 12:33:46 +0800
Message-ID: <1570250029-67639-4-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c: In function dpu_core_irq_preinstall:
drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c:354:26: warning: variable priv set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c: In function dpu_core_irq_uninstall:
drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c:390:26: warning: variable priv set but not used [-Wunused-but-set-variable]

It is not used since commit 25fdd5933e4c ("drm/msm:
Add SDM845 DPU support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index cdbea38..655e129 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -343,7 +343,6 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,

 void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 {
-	struct msm_drm_private *priv;
 	int i;

 	if (!dpu_kms->dev) {
@@ -353,7 +352,6 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 		DPU_ERROR("invalid device private\n");
 		return;
 	}
-	priv = dpu_kms->dev->dev_private;

 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	dpu_clear_all_irqs(dpu_kms);
@@ -379,7 +377,6 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)

 void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 {
-	struct msm_drm_private *priv;
 	int i;

 	if (!dpu_kms->dev) {
@@ -389,7 +386,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 		DPU_ERROR("invalid device private\n");
 		return;
 	}
-	priv = dpu_kms->dev->dev_private;

 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
--
2.7.4

