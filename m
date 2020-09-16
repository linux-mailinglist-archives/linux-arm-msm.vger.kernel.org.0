Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FC726BFE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 10:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgIPIyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 04:54:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53728 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbgIPIyH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 04:54:07 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 802145808EA40AEE348A;
        Wed, 16 Sep 2020 16:54:05 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 16:54:00 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robdclark@chromium.org>, <airlied@linux.ie>,
        <yaohongbo@huawei.com>, <daniel@ffwll.ch>,
        <ddavenport@chromium.org>, <kalyan_t@codeaurora.org>,
        <bernard@vivo.com>, <robdclark@gmail.com>
Subject: [PATCH] drm/msm/dpu: remove unused variables new_cnt and old_cnt in dpu_encoder_phys_vid_vblank_irq()
Date:   Wed, 16 Sep 2020 16:51:38 +0800
Message-ID: <1600246298-16120-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We found two unused variables new_cnt and old_cnt when build kernel with
W=1.

So delete it.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b5a4905..377ce8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,7 +298,6 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	struct dpu_hw_ctl *hw_ctl;
 	unsigned long lock_flags;
 	u32 flush_register = 0;
-	int new_cnt = -1, old_cnt = -1;
 
 	hw_ctl = phys_enc->hw_ctl;
 
@@ -308,7 +307,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
 				phys_enc);
 
-	old_cnt  = atomic_read(&phys_enc->pending_kickoff_cnt);
+	atomic_read(&phys_enc->pending_kickoff_cnt);
 
 	/*
 	 * only decrement the pending flush count if we've actually flushed
@@ -320,8 +319,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 		flush_register = hw_ctl->ops.get_flush_register(hw_ctl);
 
 	if (!(flush_register & hw_ctl->ops.get_pending_flush(hw_ctl)))
-		new_cnt = atomic_add_unless(&phys_enc->pending_kickoff_cnt,
-				-1, 0);
+		atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
 	/* Signal any waiting atomic commit thread */
-- 
2.7.4

