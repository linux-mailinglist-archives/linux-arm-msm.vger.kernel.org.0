Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09ED91460F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 04:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAWDdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 22:33:36 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51756 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726911AbgAWDdg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 22:33:36 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E218DAF351FA35C7A9E1;
        Thu, 23 Jan 2020 11:33:34 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:26 +0800
From:   Zheng Bin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 3/4] drm/msm/dpu: fix comparing pointer to 0 in dpu_vbif.c
Date:   Thu, 23 Jan 2020 11:40:42 +0800
Message-ID: <1579750843-5315-4-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
References: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes coccicheck warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:27:51-52: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:109:51-52: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:167:12-13: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:167:22-23: WARNING comparing pointer to 0

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 93ab36b..5e8c3f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -24,7 +24,7 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 	int rc;

 	if (!vbif || !vbif->cap || !vbif->ops.get_halt_ctrl) {
-		DPU_ERROR("invalid arguments vbif %d\n", vbif != 0);
+		DPU_ERROR("invalid arguments vbif %d\n", vbif != NULL);
 		return -EINVAL;
 	}

@@ -106,7 +106,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	u32 val;

 	if (!vbif || !vbif->cap) {
-		DPU_ERROR("invalid arguments vbif %d\n", vbif != 0);
+		DPU_ERROR("invalid arguments vbif %d\n", vbif != NULL);
 		return -EINVAL;
 	}

@@ -164,7 +164,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,

 	if (!vbif || !mdp) {
 		DPU_DEBUG("invalid arguments vbif %d mdp %d\n",
-				vbif != 0, mdp != 0);
+				vbif != NULL, mdp != NULL);
 		return;
 	}

--
2.7.4

