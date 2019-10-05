Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E227CC7DC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfJEE0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:47 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41148 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbfJEE0r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E55E75A52B0DBFFE5013;
        Sat,  5 Oct 2019 12:26:44 +0800 (CST)
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
Subject: [PATCH 2/6] drm/msm/dpu: Remove set but not used variable 'priv' in dpu_encoder_phys_vid.c
Date:   Sat, 5 Oct 2019 12:33:45 +0800
Message-ID: <1570250029-67639-3-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c: In function dpu_encoder_phys_vid_disable:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:566:26: warning: variable priv set but not used [-Wunused-but-set-variable]

It is not used since commit 25fdd5933e4c ("drm/msm:
Add SDM845 DPU support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b9c84fb..c7a3f4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -566,7 +566,6 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(

 static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 {
-	struct msm_drm_private *priv;
 	unsigned long lock_flags;
 	int ret;

@@ -575,7 +574,6 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		DPU_ERROR("invalid encoder/device\n");
 		return;
 	}
-	priv = phys_enc->parent->dev->dev_private;

 	if (!phys_enc->hw_intf || !phys_enc->hw_ctl) {
 		DPU_ERROR("invalid hw_intf %d hw_ctl %d\n",
--
2.7.4

